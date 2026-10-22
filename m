Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659002;
	b=cRhb7GFdBF6j9SGHBkkJYXS+uSXstEbOmSFfljcaOqGonbpeRlxD5Malkaj9KDbm3V8S
	 cc4Z1Uw7ekl8E1MTSsOadWMyjTpVcx+C8oscAQkuJLTgqjueiHl7nupMPCURCC7qEToQ+
	 85/68m8L49hGIG4LFDfozgyYBLsJYXWnwGSlWj5m6DbHzfkxFRTlERjXIk/orb7EHZrZw
	 IeqhVSUH4RobNEWb2lwpQUI19JkPIgqhAtzXnqMYebtkQ50I68tuFT8K2hZBGcewQQXff
	 wMNUBWDkz8U9AAzP1tdzFzz9JZKCBuq5B0qVGvNHGvyGrxeTsZ5G+rQzZ7TiD3dQBDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FG3XFCTTaTtbDN06Dy0o0B0el3EgubMjPfZbcU/1gtU=;
	b=zs1C3ksXV4a2dbkvoD7pau0ydHQ46ZTJ29Hf5Uk/Ksk8KWQSyS0chQt4yGuHeva360mw
	 sFxcPN1+jlb6gtv2XbyU0mOIraTCp2fnHAVpAdj7XW77VbJqOdGc2d0NVA4xoFdHViyrp
	 mq6nXTJ6OU681RyaodEocQJOyKGZ/Z0qclCAolNMcxOYk0F39Y+7MrteEZH9/oHXLsNWX
	 nXAze/z1AqzN2XOGp0sQXKEtK+48x71b4LERKCFhNQk5HN4567A7Vwwt1wj55YZ5LbQ2M
	 4uidvGw5DFN6rJYOz210mo1lW13sFVSCqo9DzIegyrmhQnvYH68cj8qJueNiSuy/RHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ou3EwDhY;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DD7606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26DD7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ou3EwDhY
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b060ec084so1199182f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792659000; x=1793263800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FG3XFCTTaTtbDN06Dy0o0B0el3EgubMjPfZbcU/1gtU=;
        b=Ou3EwDhYpn/M/9Kv7qE8d9zCPi4m2hLCNMj1t0+ZNMoR7eaeDf1w9RsvC8MD0Jj2Ux
         ZAVPrO/ZMl2kGl6qNY36wX4wLll8WzF2oZ9JJHyCGm5chogp0Uyw4oUF1sxs+rhLjnpA
         I8UOhkdhAS4TK/kUvt7Sj4uu+ugV08ics//qHHFHrjeq7GOTipQoBTXNwS169nG6Q7SP
         PyJ9vei4J7hI42KMGttcI9y7nBkZYC5a3YWSGIkh2psOL81R1+Mf0V4q8i7iHaKUl9Sa
         CMjaEHurIZUSboR+ksKb0Ox5r/rDvgn8RfVTi1eM+2Xp4pjbrAbmobz0kAo2aP7XqXWC
         Tb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659000; x=1793263800;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FG3XFCTTaTtbDN06Dy0o0B0el3EgubMjPfZbcU/1gtU=;
        b=WaPoSOW2rD+kpC8/5AhPGmixctnvzzD8xMQPhmg+ktqRgk3YBDD76QrzUKv/4+l6Cv
         ufp0gb5ItkJszIVVWCVlQgjsd6r0g3VzW19/wAWNvBdlKyeKAYyFiozQqC7S7IoD2Vlb
         oQ2R7C4waDTxhjbjOCnMnjr64rG1eVLebDFFqqqjHcseMWqcnUGlS/heOc48PdDUR9Pu
         yrkfh1Mg0RnTptd6rclxP8cUTNuaHfCT+7YumeTWQcZKYIJM9RCyWHdEuNuI1SwJICG7
         N3qWF8SMScKXvyA5u9/t2g3ixj6wjgHwRprQs/+AoBDC+4uojgOwOrCMBNNF3Ttv54cI
         4eHg==
X-Forwarded-Encrypted: i=1; AKwUvBxuEAdo/GiggD5SK+hlrb+To6IVs47y6vx9iaanbxNLMSRWJL36abqMrqfZG+5SD7gtj7NMk+0Vk2FwqQw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnQOZwGMgiHB8j0RSUdxI/gTVTQeXvQz0tyvsow3FypZCkB+m4
	l55Hp6jonb4Vc8eYfAfG0ceIzQPvVNX0ylCQWW5k/cH5yEIAOil3gc5K
X-Gm-Gg: AYBFou2KmkSbckmYFnpTnUFBrmfR5uIxZNujfu13Y5V3Y5xjlerJY3M7U1UE8gqNuzp
	0vwdDl4ZI2ZV1jSfU6dk/oToYtsMQIX2Qidv5oCYOA6cWzH/hWoIhGG1G/MFx7DmUpePzEYyVim
	UQDS5gPf9LuAbMWElTmd0XDCYIvwd/eEoIDM9TVrVc8LghT0IYs5QPVYw2e2Z08buqYu50LR0tO
	k3laM4b6PLe004/TtDzVHJJzvKD/cltFGc2cTf0nnrTlr6iCWc0YZLaEkhiO7gEEg/shiIg6XP4
	MrrCy5aKgHj4vQ0ZPVtopElu/FKQLV22PMhogqJb+Ogd21OIv4JohoZb+NoluOSECwINBwnc1Dd
	RWNXHfgZrBi3jenrpCs+ef/Hl877AHfwCGJ1mcdKB1NbRwRqCUVvv+WVnq8u2ltKSMiAXfYLeQy
	YAE7VSq6XIVlrJuQuz2pNLob9Yha1ePPNUHj0M0vS3VAwdm8YcJKuVjLrky7m7lV+bTgd7TxXjY
	VkiiYeMhh1uFxZFp/wP+TMqsNEC76amfXkzGC/lfzElZFBQxzLh1KHaDF92HAaEKu2q9aoff8oB
	DOd+7FlTNF30feP0
X-Received: by 2002:a05:6000:2612:b0:48b:efb:4a66 with SMTP id ffacd0b85a97d-48e2641ddf2mr9357775f8f.6.1792659000489;
        Thu, 22 Oct 2026 01:50:00 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584c3b0sm12297457f8f.57.2026.10.22.01.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:50:00 -0700 (PDT)
Date: Thu, 22 Oct 2026 09:49:58 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Usama Arif <usama.arif@linux.dev>,
 bp@alien8.de, dave.hansen@linux.intel.com, dsterba@suse.com, hpa@zytor.com,
 linux-kernel@vger.kernel.org, mingo@redhat.com, terrelln@fb.com,
 tglx@kernel.org, x86@kernel.org, hannes@cmpxchg.org, riel@surriel.com,
 shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs
 without FSRM
Message-ID: <20261022094958.13aeb5c0@pumpkin>
In-Reply-To: <CAHk-=wh+dyDPs2kp=KoUiCYdk2MBBqzTKYbrkAyOMV9Z1XNu0w@mail.gmail.com>
References: <atCpTMcAALymqADw@thinkstation>
	<20261017192727.2760919-1-usama.arif@linux.dev>
	<atiKeB-76nOj-ztU@thinkstation>
	<CAHk-=wh+dyDPs2kp=KoUiCYdk2MBBqzTKYbrkAyOMV9Z1XNu0w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Oct 2026 08:18:25 -1000
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Tue, 20 Oct 2026 at 23:55, Kiryl Shutsemau <kas@kernel.org> wrote:
> >
> > Moving MOVQ inside ALTERNATIVE_2 is ugly...  
> 
> Yeah, maybe it would make sense to make that function be
> 
>         movq %rdi, %rax
>         movq %rdx, %rcx
>         ALTERNATIVE "jmp memcpy_orig", "rep movsb", X86_FEATURE_FSRM
>         RET
> 
> instead? No nop instructions at all, and both alternatives are two bytes.
> 
> Then do any ERMS logic at the top of memcpy_orig, which now has the
> registers ready for string instructions anyway.

Is it possibly to just patch "rep movsb; RET" over whatever gets generated
for memcpy_orig (after the two register moves) ?
Then there are neither nops nor a jmp.

David

> 
> Hmm?
> 
>                       Linus
> 

