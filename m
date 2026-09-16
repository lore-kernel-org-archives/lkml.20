Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6E645FFAA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544710; cv=none; b=ppTUwOabJ4aIXJvQnq9YpOyi8B4g+GV+WFq0aXRS8dDkAPAmxOYZFGwa6IrhoWXpuw/Ad/i4QrW5VFqseACfsVkbn/CITT9dTt17S6uQK8hhgxO3VKpTFACqD8sZrzuhkiPe0RjyGCU3QdyXaNJY0d6zPUbxuiyr1U9D/oKrpcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544710; c=relaxed/simple;
	bh=89gMFKDdMJsSnsocST4/zLkZzm5OuLeOCuMYn+ENPfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=use1cOkl0IwScxxqaCaFQw+KN6L9du20vwbKx8Pjj44o65/Ou0Hk7k2nTTTYkyRDjhAaXxAjcIspC2GtFcDZpGBXigom7yS1E9rsdCmsQOifjogJMigN3XowWh0kSTSh6DvNbRozTXydr9+tqf4Ar711JWFKJ/Ds5cPK5fhtMNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Pw10yfhX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Pw10yfhX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F17AF152B;
	Wed, 16 Sep 2026 00:44:52 -0700 (PDT)
Received: from [10.57.83.63] (unknown [10.57.83.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E7B53F86F;
	Wed, 16 Sep 2026 00:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789544696; bh=89gMFKDdMJsSnsocST4/zLkZzm5OuLeOCuMYn+ENPfI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pw10yfhX/h/fuZaZCG9WhrKcJwG50gwTurnVkgdzeJ2QvngFGsJvSCMP1zRvJXHbq
	 LcutBy/nm0LnUX2+m9+g1wto/E0tSk4c54YpkbgJDe0TyADzQcar7a6Pknp2EpGDHJ
	 5fxcSsgqjnQSFGtv6MCBGihodG137X31EEk1nv1Q=
Message-ID: <4814f484-4daa-407a-be60-748c392f9578@arm.com>
Date: Wed, 16 Sep 2026 08:44:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
To: Bradley Morgan <brads@mainlining.org>
Cc: akpm@linux-foundation.org, john.ogness@linutronix.de,
 linux-kernel@vger.kernel.org, pmladek@suse.com, rioo.tsukatsukii@gmail.com,
 rostedt@goodmis.org, senozhatsky@chromium.org
References: <490C65F0-0ABA-4139-A1C4-086BD2CD1D8A@mainlining.org>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <490C65F0-0ABA-4139-A1C4-086BD2CD1D8A@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/09/2026 19:49, Bradley Morgan wrote:
> Hey, I think thisll conflict with the arch_do_panic() patch (b45d6e4b3580)

Ahh I see it here:
https://lore.kernel.org/all/20260831-arch_do_panic-v6-0-a1e170a9e7fd@linux.ibm.com/

And looks like it's in Andrew's mm-nonmm-unstable branch. I guess I should
repost based on that branch?

> 
> Once you rebase. I'd reckon the
> change shrinks to just moving the panic_timeout != 0 block below
> nbcon_atomic_flush_unsafe().

I think I'll also want to make the call to arch_do_panic() conditional on
(panic_timeout == 0) so it's equivalent to the patch I sent?

> 
> On your RFC question, whether the current behavior is deliberate: I
> don't think it is. nbcon_atomic_flush_unsafe() was placed at the end of
> vpanic() by 5dde3b735413 as a final attempt to flush pending messages, and
> at
> that point no console was actually CON_NBCON_ATOMIC_UNSAFE, netconsole
> was still legacy. There was nothing to lose by putting it last. The
> ordering only became a bug once the first unsafe console showed up.
> John and Petr can confirm, but I found no sign anyone chose this.

OK great; I'll wait a few days for others to chime in, otherwise I'll plan to
repost based on mm-nonmm-unstable, dropping the RFC tag.

Thanks,
Ryan


> 
>  
> --- Thanks!
> https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/

