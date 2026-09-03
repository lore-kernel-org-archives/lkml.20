Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B503E9C37
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428130; cv=none; b=CI51PmEKBpOWgL/XM9PWjVnwXvrZB5G/dhGEw7f6xsKBpj6+U2Ns3Sk6kMuLOHLBiQu5SuHgPMQGAKLlzuZKmOflGXEYKlfnpvXa7jNnZyM2orF3Q6Km3jGNswrtyXCgWBVAd2GZgjVaXQrn1ZcyAPqpgSLWAMiDN/2DyuCKgdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428130; c=relaxed/simple;
	bh=69ndo57FpNOymOg/xC9v/bwQ8t7K7J1EZxoT6NVFAMo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f0h/mldMDQ24xzolz4NyScG2kbSGuJZYfONiNWvsis0sxccc/IBNM85eBQlZ5vPBVmhp/ygKwnWMBBz7/hBufTBNWUie7kct6LxLSYg3+gl9z66hKUlFg+l5Jk9OXyAHS3DEXKPGiiuYXT0odxOeZZ4/PpEPkXMkgFxPq36nzmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Y2/YIDW+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RajjnPXI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Y2/YIDW+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RajjnPXI"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788428126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PM33iW7OW4NKtdKAErbkH3mAs7TCXum2IEh+cD8MfRM=;
	b=Y2/YIDW+aMlFj24h8P8hkDSlKQuRhCMAwS2aVaTaqlgEmHn74S+ViaMAe1yJ3/1BUg3RDN
	EsNi8sLuwP4NehdSJyvW/eWDXOt7/nWC+f3jyMPc4b0QDP2TEHJYS5drhsval1vnDLIUlb
	yXAFN/ujOnI6sY6LrXs/wp+86PTjCC82Bfv5ykpAiQs6jsetmHnEscjqNzYK+JcMkp+0iK
	f2u/A8r/Ce1vyIB7wbMO6UHjhFsgjGjL8iDmK2r+3AzPYkKg17OrNFS6XqHZlX46cchZfs
	sZugjgZwy0Zq+kQnwU4Tdl69vk6S/XMWEsUb+TX+pVdXdlw5xKlCOS7+jvvccw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788428126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PM33iW7OW4NKtdKAErbkH3mAs7TCXum2IEh+cD8MfRM=;
	b=RajjnPXIsYx7JpPK8elZtRhQvJja9POpxLrJ7NmXfYtrABSoKCr2z6ClMLkbp911LHuIOj
	71D80JH/O1UQO0Dg==
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] riscv: word-at-a-time: improve find_zero() for
 !RISCV_ISA_ZBB
In-Reply-To: <apZVwzxBD8Ih493W@xhacker>
References: <20260113122457.27507-1-jszhang@kernel.org>
 <20260113122457.27507-2-jszhang@kernel.org> <87mruh5h1m.fsf@yellow.woof>
 <apZVwzxBD8Ih493W@xhacker>
Date: Thu, 03 Sep 2026 11:35:25 +0200
Message-ID: <87a4py65k2.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jisheng Zhang <jszhang@kernel.org> writes:

> On Thu, Aug 20, 2026 at 10:31:49AM +0200, Nam Cao wrote:
>> Jisheng Zhang <jszhang@kernel.org> writes:
>> > +#if !(defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB))
>> > +#include <asm-generic/word-at-a-time.h>
>> > +#else
>> 
>> Instead of this #if, would it be better to do
>> 
>> static inline unsigned long find_zero(unsigned long mask)
>> {
>>         if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
>> 	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
>> 		return !mask ? 0 : ((__fls(mask) + 1) >> 3);
>> 
>> 	return count_masked_bytes(mask);
>> }
>> 
>> and let compiler's dead code elimination does its job?
>
> This is impossible because the generic word-at-a-time.h implements
> the generic find_zero() itself, so there will be compile error.

Don't include word-at-a-time.h then? It compiles fine for me (obviously
count_masked_bytes() from PATCH 2/3 needs to be added first).

Nam
