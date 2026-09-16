Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F95F2D0C63
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570189; cv=none; b=Eo8PKjUlxOo3uTSPtz04kUPItnEshUSGFs1AyFpgNKynt0jxXbxzmpWl9ibWFWet+BhMFqF8YDXmvAK7f5PmIxQyXUQ7sS/BNY4TmTCJez1wyvirsb07mpSOcdRE3IHxbCyLS0vaH5qiiQVjeZO83ZPDaPP54YtJGkbQ/vYvnLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570189; c=relaxed/simple;
	bh=xoj8b95DS7WIGf46IXzStMOd+XCjfFVgNPFYQxPHFqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kF2yCU4/S9rSAVbXxlsgOnfUvtgzrRPytu3lz8ewihm8C/AjaiONOjUGEdLDJus7jLAdG0keftoAiyzkYuWOIwWYOYpvfHeAvsCHDpOIZktlvq1f2aC3za27WtwOHciZOSUCVdTODEKNRVSTB7Aej4H8CZNGhev0Hg7hcdtTGmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCC4yT62; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCC4yT62"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25561F000FF;
	Wed, 16 Sep 2026 14:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789570188;
	bh=2l7UexOzwasamiPYlC/kvUD4LQW4XsL9deK0FXSafNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OCC4yT627K6qmnWUU5+H6XGv9MV2EjESTI1wS9O5BKP2EIJqIWiwY95v1dRqJQVl0
	 tlwZ3qc2A0GRG/fALMIfLl7qx3gfjDa4o8GDRR24+nwgdJb/JRvFdlvac2RIf0EYXZ
	 kHYad3mGwpuRVg8ZR57V4RL8Rj9DD2jHw4owXFPG6g6IGQW5A0dXamprVD2sN6IyVo
	 I11TKbZglAlCL9wECWyYc55YPXLOKhNU/qsk5VM+QIDKyzVbiuHY8ywvzfmzmF8Lib
	 3lgSreN9LQsTQlfXqQR4mTR7gqBbLI0BNRPmIIFcO6XfhLw2xQf+G/KZBXviqvi18f
	 27F/bsi7TYV5Q==
Date: Wed, 16 Sep 2026 16:49:45 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: tglx@kernel.org, anna-maria@linutronix.de, linux-kernel@vger.kernel.org,
	mingo@kernel.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
	riel@surriel.com, kernel-team@meta.com
Subject: Re: [PATCH] tick/nohz: Remove redundant IRQ save/restore
Message-ID: <aqqsiSDCpvkfxFTI@localhost.localdomain>
References: <20260916141530.3423310-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916141530.3423310-1-usama.arif@linux.dev>

Le Wed, Sep 16, 2026 at 07:15:30AM -0700, Usama Arif a écrit :
> tick_nohz_update_jiffies() is only reached through tick_irq_enter() from
> hard interrupt entry, where local interrupts are already disabled.
> 
> tick_do_update_jiffies64() requires interrupts to be disabled. The
> local_irq_save()/local_irq_restore() pair around it therefore provides no
> additional interrupt exclusion.
> 
> Remove it and assert the caller invariant instead.
> 
> On x86-64, this avoids the redundant RFLAGS save, CLI, saved-IF test and
> conditional branch on the tick-stopped path.
> 
> On a 252-CPU host running a Thrift RPC service, tick_irq_enter() ran
> 165,116 times/s out of 212-244k interrupts/s. Only calls with
> TS_FLAG_STOPPED reach the optimized path, so this is an upper bound on
> its execution rate.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs
