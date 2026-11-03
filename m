Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793699807;
	b=wqIx0hnpqJC+CDd6uncvU/D4xb1WVjDmBIr3P2FTFsdgNIo5hbHZmFxhLIvuDwLuIGtf
	 JQ1AyaIpeCffRbhXBRMJLayjwFqs3FyyZhm8dScsrVReI8U+UPGg/BRFyIw1B7y+XgEip
	 hit9TjAnATWLIqM/+uZFJL4nRYB55iZSATDA4fVfukUd+iY9MNzNsr1gLN6INCt3CaDH1
	 0YpfMkkIxbq5VgbEbw083hSazWPeaLwOUu5beTn/soF9owapW8RBZYUY9XmokNQqUJVgS
	 ZFyN1kpE0/40TueTPJ46Dc/euU9lozrraeU577KZboVzCnsoaKK9hvz2AN8LF03QNCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iqwD6eaHeERb7Ot7SCnGyIPnO7ssTxQvxGidKCgiKP8=;
	b=qSwklOaHJDn/cg1BBu8sCq37BzDpcdSVG+XpS1obwKOqaJ0xL7qARkmp/b/ZQEGJ1Xmy
	 FgC9l+C9lPyR5H7Us9GCvg02vW1fUSJuEsVLqB0igA8H9sHSpw7fHDlljFwDld97olWzU
	 w6V+VNVzwZ26wOdb5BFoUeJYpf8UxNIs6CJSlLcRDz+zCiARkmi2ZjmEXVQn8x1onBFIa
	 +zYkqWEYiTtpKYAtlM691MAqkl/TQSIhBP/evSIb+rGYMjiTTB6fkQ3qp5qk2qgKiX39L
	 RolKTX9w/MeJp6BmKdHMkpXtF+f4qUMx23Jzs5mlDsW01BhNH562X5oTy2LHAvxZe9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flashbots.net;
	spf=pass smtp.mailfrom=flashbots.net;
	dkim=pass header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=S2+DZbZG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A9560A2622
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A9560A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=flashbots.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flashbots.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=S2+DZbZG
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-847ac7ccd85so2591911a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:56:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793699806; cv=none;
        d=google.com; s=arc-20260327;
        b=qzQBGFhKs6oG4pw7dkpCle1jkJOMCxgiasfiMqrHT2nnrPQ8Ruev15IHz4eBpLtyED
         VVDyp84DCfrmCVd5Z63b66Bl03bJgrOT5odDoAuXcZY0EXWQb0dGoFSXYIpJGvYuPZNx
         Ghn3hlRlpl86J3IQ71LZZHstKWtxA6xUczZeE/TT6pxyNFtYY3sHNJr/57uGGr5qDhgf
         ky9YOBcL29Kv4+6G0yx1A3xwwOo6aGQ/IhE0xb0NDxcoKMpZgdvfFHnm9DA4RsOHDJ20
         7ke4XW31GMscEyTldvGBP85rzXvLJW8fuJnlkQLTPpjR/ARx/Tkj233Roj8wiPPwpeGd
         huvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iqwD6eaHeERb7Ot7SCnGyIPnO7ssTxQvxGidKCgiKP8=;
        fh=pdD5Eua5ebit9KhuG2r8OLpdRyOjgsrcclIyXkGgZag=;
        b=T7GvWe4C5vmvKqr1IVqXQQcGJtUpYEcgzDOvb6TTKfbKQhQcStrfvUu3LS2wuQMK9r
         D3l+613Bpm+E/0CLq6tnMb/c6K7QI87lYksL562bOjCNBo3goq5sgzH2M1Xi3oevtGHV
         RpbEy7Bb4xvfYbv36PNSWY+psNhiBnVCqdELz/FA7nuwGTPXCLekvVkj+bdX8hK2KbwP
         xPEJYPGx8ZP9HA4vZBXz9uCHCGezUA8iD/4r4qUQqe8CF6BONdaK7pzdFjOjo7kB6VM1
         utv/kESkllmPxrKSzNe8f8bfKZN8DQFbA7UjTUsgC+mI6MhLq6FNmGrIGp9R9k12gsvU
         0/dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flashbots.net; s=google; t=1793699806; x=1794304606; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqwD6eaHeERb7Ot7SCnGyIPnO7ssTxQvxGidKCgiKP8=;
        b=S2+DZbZGfkGYEUmOM4H6oUoDwS149KfIEKV9z2GMh3SdJF1ippnDz9fJUMrELY+kyB
         LlweaK1g0h5miifipylhvsV5b5/c5N7UCaWG91bNx3gpSwIzMlcACIf6ueuZIKx7e3tH
         M2OMexqbCPpTzN0KJt54O4mXO7XNVmdWtH2vNvG9OIcUpDvFd2hrRODF78IpSrNArOZd
         bSHFrVIM/QCOX4kCnFTHqVj3qh3R2iCdZk8nwnv1EOlbXHASU8S6sv73a9+ucLz3quc8
         JMRD6KEkaPW/e+C3LXJ0zrPHbq5+EjYx3Rhl291JfJyoLFEPkQf5weN/WDQkDd/SyC0Y
         vLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699806; x=1794304606;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iqwD6eaHeERb7Ot7SCnGyIPnO7ssTxQvxGidKCgiKP8=;
        b=C7z2KxsMgFoN+zxVg0Id7Yr686rchRHJjT6LD5H9N70ag5zVcqXBTKvxeJ70ww0k7P
         JoZd5JsU/1Mb4KlO4Moxtv0gzpMihu0HjnpR4ptK1vQMaiNeyZBIYRJSoby7Pq8yX6Kh
         vEb1MkulssqPQ4ZdPiirVn5DDN0zmaHcApcaZADNh6/xYEloLzrR+4uJyD42uUByrkZI
         SAnJ4XrU8kag6kO+x0vIBzNKzUPtJrtivHme7eiYDNhA5sO6ek54C+2QDx9kE8epslBQ
         V3/1pYiGHcAF9F0Jjn89ei1K23LNOK33e8MYB+47LPmiUgSC9yyFt5pk/fXdwMbpUnWR
         YkzA==
X-Forwarded-Encrypted: i=1; AKwUvBwJV/VI4i/QTQcGNgAmoQiP1ZTgyb4GTRamfsLGj4N8i2yIOmiMVYI2GKcL8fJNsUqrmyMO4bomNQvCebI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TmZA9BaRinFe4bjWsrNpOBdBzetrxoHhvXgeKCnbPrhqbRvDS
	6oADAzpBWEhskqlYBQ95GF8vbfJrT9wz0k+kBug+gf1xtGj+r7IyzCEt/koSL6DhtrOoOURg3Ge
	GoZfkBmEQoQyC7mbHEVXqMeACFkR/v58kEWkKzB5M8Q==
X-Gm-Gg: AYBFou0rKjm+3QDS0Fmv3RtTcROJUkAOM0+MItDyynbzjxw3EGB4xDb48gFsICXZRIG
	f96bCLqRZdgMDRe+XGmYFPpRxQSJRQDaX4uPH2CVEInv53ir6MOtJwAYKLfJ1SzuOXMVXkjMxj9
	3eqMSKKgwAnPY2bO8v04m9KPqJ+X2rUAPn9jUFOBve8t5V4Mnez8KoFxcVkVX54o9CVwKwH/Q91
	UGOg6eyT6fqHz3W3rztUGeXD2wkt4vXYVekEcZYOplwfLfEF9i0u3qvM5NUSbzdCtjQBUXmtxbp
	Rskb858/RdcquPsnxnxwIJQnkYeUezOf9qMjPI2LMceGiBMA8ae+jnrUFBookSmj6IFsqujMNXA
	/KTkmRyX9W5ZEE2cMIWj/lAiwG+H9QhmVVPtdyxpmD0EFeQ0jTfthiEX4r1bJaZ3cyxN3BLFvnf
	8kkDzj1UHIEdQX2rV8uOSNxzbiO0X4TQLh52Bl
X-Received: by 2002:a05:6830:4c05:b0:844:4959:e855 with SMTP id
 46e09a7af769-85d3636d94emr9384433a34.6.1793699805932; Tue, 03 Nov 2026
 01:56:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-tdx-guest-quote-poll-v3-0-6a83bb767314@flashbots.net> <3b582cdcfe37f1d01ee71611ab2611f845261089.camel@intel.com>
In-Reply-To: <3b582cdcfe37f1d01ee71611ab2611f845261089.camel@intel.com>
From: Moe Mahhouk <moe@flashbots.net>
Date: Tue, 3 Nov 2026 09:56:35 +0000
X-Gm-Features: AclHuK8Doz0oEKFnQPO1b0h9OeAQOCO7SR7lLXwryMRNxDi7qBGsHP1Qzst1PTE
Message-ID: <CAKV3HMM9BKpmgWeFqRqamAsqqiofj+TG4DrOEHmbUyE0FjA7+w@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5B=F0=9F=9A=A8ext=5D_Re=3A_=5BPATCH_v3_0=2F2=5D_virt=3A_tdx=2Dguest=3A_Fi?=
	=?UTF-8?Q?x_and_speed_up_the_wait_for_a_Quote?=
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, 
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"kas@kernel.org" <kas@kernel.org>, "Aktas, Erdem" <erdemaktas@google.com>, 
	"djbw@kernel.org" <djbw@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Miao, Jun" <jun.miao@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2026-11-02 at 19:55 +0000, Edgecombe, Rick P wrote:
> Long term though, isn't this a better option? This patch is
> essentially a performance optimization.

Agreed that interrupt-driven completion is the better end state where the
VMM supports it. But I don't think it can replace polling.
SetupEventNotifyInterrupt is optional in the GHCI and enumerated through
GetTdVmCallInfo. KVM only forwards it to userspace (since v6.16), and a
VMM that doesn't implement it returns SUBFUNC_UNSUPPORTED. So the guest
still needs a polling fallback for older KVM/QEMU and for other VMMs.
Patch 2 is about that fallback.

> Polling is always going to be weird. And when the attestation speed
> changes (possible in the many upcoming attestation plans) this tuning
> could again be suboptimal.

The fixed one-second interval is the tuning that ages badly. It puts a
one-second floor on each Quote and, with quote_lock, caps a TD at about
one Quote per second. The backoff assumes no speed: a fast Quote is
seen within a tick or two, and a slow one at most 100 ms after it
completes, with at most ten wakeups per second.

Polling was originally chosen (f4738f56d1dc) because Quote generation
was "not time-critical or frequently used". That no longer holds for
users that bind a fresh Quote to every connection, such as attested TLS.

I'm happy to work on event-notify support as a follow-up: use it when
GetTdVmCallInfo reports it, and keep the backoff as the fallback. Would
you take patch 1 now (a standalone fix, Cc: stable) and patch 2 as the
fallback improvement? Or would you rather see patch 2 together with the
event-notify series?
