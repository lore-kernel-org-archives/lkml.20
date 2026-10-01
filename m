Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3C4352003
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863078; cv=none; b=qc60DELdZ6+/gmBdbu44oj/0Z9qc0mb+Qu30PQxw2YJhOO57BT55d7EiIPw41ZjNOvrB3Ra2M3HZDns60sWGjJnx4wtU3On+d3osXpBE6Dokwd8rbhEqULxibE8G5DuPB8MrYEGKprwpTiCeq/Dq/HcW2RdyXFAdvqcloZrTBSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863078; c=relaxed/simple;
	bh=My4BganHp6IwDHnjd7wKkgxseHazF5cioT6HqM73X34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOXelCy29A0duzxE5WkqmJQta+jOJXKTWPt8e3BtH3Kg2O5/eVMasBo7ObFYZyoys0wVtrRpzZlRe4o5qBIMVJ93f+wyHqvDpmt8ErN2fMof8w2HhruRuudpEJrj3XivXFSYuSv+MqW4ASBvpibR2/m/Iq7xcTPYdt01BiqQobM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=BvfpNAjz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BvfpNAjz"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F0F8497;
	Thu,  1 Oct 2026 06:57:49 -0700 (PDT)
Received: from [10.0.130.165] (e127648.arm.com [10.0.130.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 843BB3F86F;
	Thu,  1 Oct 2026 06:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790863072; bh=My4BganHp6IwDHnjd7wKkgxseHazF5cioT6HqM73X34=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BvfpNAjzBc5oqa7hdB9rNymFmxzw03Hwg2Ulq4pWN0mFEOOoxAawDqsfW+1xHrMRJ
	 ZTwQ2i9SUg0Riz9LVdjzxorANxWpnUoADwoUCREpFPGNSPuTrvugqOD8uGbnZdrU/P
	 CtiWptnSCzDKQQ2lDIwdb16F0NBDtioh/PZB1RBY=
Message-ID: <26c01ef8-03dc-4194-b7dc-68ae12c33560@arm.com>
Date: Thu, 1 Oct 2026 14:57:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] sched/eevdf: Cap protection when current has the
 shortest slice
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, mingo@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 kayracizmeci@gmail.com, kprateek.nayak@amd.com, elif.topuz@arm.com,
 sh@gentwo.org
References: <20261001134016.3881268-1-christian.loehle@arm.com>
 <20261001134016.3881268-4-christian.loehle@arm.com>
 <20261001135529.GS2009045@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261001135529.GS2009045@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/1/26 14:55, Peter Zijlstra wrote:
> On Thu, Oct 01, 2026 at 02:40:14PM +0100, Christian Loehle wrote:
>> Changing a task slice preserves its remaining request. With
>> PLACE_REL_DEADLINE, the deadline can therefore extend beyond the new
>> slice after sched_setattr() reduces it.
> 
> Or, the new slice is only effective after the current expires.
> 
> Is there a reason we care about this? Changelog didn't mention.

Yeah I wasn't sure about this, it does make the tests a little more
hairy as this obviously races...
