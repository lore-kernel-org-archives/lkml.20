Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55AE314A65
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570706; cv=none; b=qHIiPwNuzFENXmkxRaX/eAZieMCw3UjlMfRltSevOsZXatcZ4dpZ24MSxLCfnDHcJdAKngkp3Z8si8VaRoGpbyH3OPqQZM/kz20oT/tWN+OEOThvGGyAC8bYtkHoqYGgl/IKVbkJOiXYkD9VuLDVKMTZAAAhpmzm1dreWtSGOAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570706; c=relaxed/simple;
	bh=/Ya02WcdVAnEGUNx8y76On/WwKPPIS0RGTH5KrLQCfQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=fIZ7lHRtF1Qd4axlTXoBo94hsmhWbpNVSNo/cRQEucYssm924dk4SL543jx/eybGiXR1+o2r/oGYs/fAONVOcW+cPTG5ywhI1U8apu2Xi8vgwMJKR8zMXdM3CBFwY3OOxDLiro8l0GKkUQHyUmabdvHyf7tG8g17lO0Eq0su28w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=XKX0uBVs; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=xJ0yD2H7; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="XKX0uBVs";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="xJ0yD2H7"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789570702; bh=7JWwuLoT5a5YaRPK6sQw3hf
	YwhASbMZ5oADDyS5OCcs=; b=XKX0uBVs7N9cCq47pMpkGs83zS/Wu5iM6PclNlJ9AJ9v/P7Bwq
	i1UvCJfHq0XsKzJ01z8wXNf7NWWTWcXNQFp9TdDYk2uRr4AN2tP7agHTjFz32eNS6Id/mQuSenz
	brUIy0s1XXITIbihlp3wFWle4sA+QOoa93rolZyl4abWeaeYWADNVsPLmBXj1GBEI1gxLqYw5Cu
	YysQ30e8rnvxlZrLxQfqSwq/+iKpD1sDabAiSkaMUqhHtJxniwD5BQShRGgtQGw/z28T/x5+081
	FPMAPus7YEBQwAe34kvKf2KvfYV7EGWdSVr/eIG0KNmIZv1QyhbFmwhogrcPy6CEN1g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789570702; bh=7JWwuLoT5a5YaRPK6sQw3hf
	YwhASbMZ5oADDyS5OCcs=; b=xJ0yD2H7yD3T5EVCa8LWDLIUM3RYx9NDHog9/Utopju2/klblU
	49J7V+F2QgiX/jSrs573Mv9Yo0aPa3F1w8Dw==;
Date: Wed, 16 Sep 2026 15:58:23 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Ryan Roberts <ryan.roberts@arm.com>
CC: akpm@linux-foundation.org, john.ogness@linutronix.de,
 linux-kernel@vger.kernel.org, pmladek@suse.com, rioo.tsukatsukii@gmail.com,
 rostedt@goodmis.org, senozhatsky@chromium.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
In-Reply-To: <4814f484-4daa-407a-be60-748c392f9578@arm.com>
References: <490C65F0-0ABA-4139-A1C4-086BD2CD1D8A@mainlining.org> <4814f484-4daa-407a-be60-748c392f9578@arm.com>
Message-ID: <31B53D14-29FD-498C-B1A2-E4F085A4B873@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 16 September 2026 08:44:53 BST, Ryan Roberts <ryan.roberts@arm.com>
wrote:
>On 15/09/2026 19:49, Bradley Morgan wrote:
>> Hey, I think thisll conflict with the arch_do_panic() patch
>(b45d6e4b3580)
>
>Ahh I see it here:
>https://lore.kernel.org/all/20260831-arch_do_panic-v6-0-a1e170a9e7fd@linux.ibm.com/
>
>And looks like it's in Andrew's mm-nonmm-unstable branch. I guess I should
>repost based on that branch?

Yes.

(That branch also goes to linux-next)

>
>> 
>> Once you rebase. I'd reckon the
>> change shrinks to just moving the panic_timeout != 0 block below
>> nbcon_atomic_flush_unsafe().
>
>I think I'll also want to make the call to arch_do_panic() conditional on
>(panic_timeout == 0) so it's equivalent to the patch I sent?
>
>> 
>> On your RFC question, whether the current behavior is deliberate: I
>> don't think it is. nbcon_atomic_flush_unsafe() was placed at the end of
>> vpanic() by 5dde3b735413 as a final attempt to flush pending messages,
>and
>> at
>> that point no console was actually CON_NBCON_ATOMIC_UNSAFE, netconsole
>> was still legacy. There was nothing to lose by putting it last. The
>> ordering only became a bug once the first unsafe console showed up.
>> John and Petr can confirm, but I found no sign anyone chose this.
>
>OK great; I'll wait a few days for others to chime in, otherwise I'll plan
>to
>repost based on mm-nonmm-unstable, dropping the RFC tag.
>
>Thanks,
>Ryan
>
>
>> 
>>  
>> --- Thanks!
>>
>https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
