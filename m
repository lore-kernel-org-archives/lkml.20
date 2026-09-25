Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6635A4C2247;
	Fri, 25 Sep 2026 18:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361344; cv=none; b=Ts677swbDGskNQNhlhjH1AJtQ7EYWAcOlu30rN945tv4gcNk9k2ugLQKa8Gug/L8jwGspJCzHUkPK4oXY0A51un77ekwdB4j/StcG58VgPrv71n9N7SPFydfnjZyvRdqMzcXrFVzacsxLXEK4NwbafiFnRzX0Enfk0+yXcgu6Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361344; c=relaxed/simple;
	bh=5//qeJRlR5L1QB7AZLTAGKfl+QUlSUBTV9GJuc9mSD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RNrSvAAMWlj/Xf80Wspv5meg8zpmLRPlgHdKiguUAYHeG2S4CPFxsXImRN1XzB0WWtoxvrWx0ICxh12br+ukV+NjmNVEyGOb6pG/lhtlN3eNWr1A/yAgB4w02ctrBkj8rkpG3vIod4go5V93OM8BsxTl5yD6dhTfQX8lWW+u9bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1HiwhVK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1HiwhVK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2612C1F000FF;
	Fri, 25 Sep 2026 18:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790361341;
	bh=xO6DE9xLjP0kOOZvDx8qDH+TNCJxsbMKTP+fZBrymsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q1HiwhVKRV3Az48TU9Hs6z53Sca3xHB6fdWyK7IvWG2SL0pkfl6816GJFoNKs9NJ8
	 NaL1iPsw43dS2uZCw2c26psQd9C995K4Xf84RPaHAunPr7yBhhYCMmnvLUbg3aslOK
	 BpYIXqUCWrGFb0tkM0izq1qMEt5vdk1Tc7MsjUXN1f3Pb5KK2sTqg/qT4JlbYCdTog
	 bOpfG/yUm6ekYWL6kSItXBBmA8uj9caQVGrFxVmX262Xm1gDPBJIOLjH0nr9ikdfTy
	 7umBKY0IjXgEZ2d/XriMiYwTIQLfmR4i1TKQ91Dlp63fYOZgOxQRqEtvKyW0xFlT2h
	 hwHhqs3SQw0Sw==
Date: Fri, 25 Sep 2026 20:35:36 +0200
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-tip-commits@vger.kernel.org,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org
Subject: Re: [tip: sched/core] sched: Clarify WF_SYNC wakeup semantics
Message-ID: <ara--PcvTbdm1zbs@gmail.com>
References: <20260922-sched-wf-sync-doc-v3-1-23ebe9e27bef@gentwo.org>
 <179033364193.2819794.10008973300214008226.tip-bot2@tip-bot2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179033364193.2819794.10008973300214008226.tip-bot2@tip-bot2>


* tip-bot2 for Shubhang Kaushik (Ampere) <tip-bot2@linutronix.de> wrote:

> The following commit has been merged into the sched/core branch of tip:
> 
> Commit-ID:     e4c353c3933968fe8efecb269fdbe3baa1d1ddd0
> Gitweb:        https://git.kernel.org/tip/e4c353c3933968fe8efecb269fdbe3baa1d1ddd0
> Author:        Shubhang Kaushik (Ampere) <sh@gentwo.org>
> AuthorDate:    Tue, 22 Sep 2026 14:57:05 -07:00
> Committer:     Peter Zijlstra <peterz@infradead.org>
> CommitterDate: Fri, 25 Sep 2026 12:45:59 +02:00
> 
> sched: Clarify WF_SYNC wakeup semantics
> 
> The synchronous waitqueue wakeup comments currently state that a
> synchronous wakee will not be migrated to another CPU. This is not
> guaranteed by the scheduler wakeup path.
> 
> WF_SYNC is an advisory hint that the caller expects the waker to
> schedule away soon. Scheduler classes may use it for placement or
> preemption, but callers must not rely on it to prevent migration,
> preserve CPU locality, or make the wakee run next.
> 
> Keep this contract next to the flag definition, remove the stale
> waitqueue wording, and make the locked helper refer to the unlocked
> variant.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Link: https://patch.msgid.link/20260922-sched-wf-sync-doc-v3-1-23ebe9e27bef@gentwo.org

JFYI, I've added Shubhang's SOB which is missing from the commit:

    Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>

Which I suppose got lost in some patch application mishap,
because it's present in the original.

Thanks,

	Ingo
