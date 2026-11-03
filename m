Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793671951;
	b=IeU103mTmRjoy/CmYC0IBpcln3QLst53U2Qby0FXogZh1PlVby/4hnU06QCw3hG/rypj
	 hSGtMbq2j/1rsmHfHqq6FTjB4sQKM9rWnhYq8GrwTSzPLVTtT2INWMdEtW5vqgSOPGjB4
	 qD8GKmCxarXcoT10PnxlUw4nWsjuXhC0AeHo8NlEnRuMpkD4veYC6ZuZNtKkigRVb0QSh
	 0GeQ9p1ChbKoYccA5nZEjpkqePCGhhurNeht7BxW6P9WedszWC3jfqPxGhNYMp6YICrmE
	 +vg9se2LVI8olj6QKaihE+I0cSqHvlce1JQgSnYECDoEdIjklv9Jj4z74cDpxIQ9oDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793671951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=gbxtANkKD+no5T6EiXK6Tea/adYVuoSud4wUlEix+Yo=;
	b=ACjzCu/Jf0XogDO8MNUfEH2CzHYwYIpfEyRAs/H62piSB1qC3dAZBqWs1Ml/wg92i+L6
	 7bf+vCIIOxrvjrvLq6n0Wgq5DVhn67YJVZFsiIUyOgLmQcoYAO0GfvwVqDMw5yDf/O6Jj
	 OryL+uYa4BEVd2gB3s0bio2+f2AdcPMMGcNDbeAI6UL351GFld9lklOYVyRZLsH0we9nZ
	 61Mh8rQP87dnEVuxEFOtmUaWPYyetJoM3DJo5fEOYMRuFzYsh7KcsVZBsE1a2eZzL0EYm
	 pSL/qjkpelqx2TN3RhmCGzCfahWDu+RiwK6VIbrZUiVwso4A2qTiQu//j0EjrAuEfdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fF6G9Jhk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21F1606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C21F1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fF6G9Jhk
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-917bab38b14so47016756d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:12:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793671950; cv=none;
        d=google.com; s=arc-20260327;
        b=FdoC1TlvZyy46GTH4LZXj05XM9E0EhAP95w+6QwApV/0Jgd5veBUvnTTXtRyaOwaAz
         FgWjoF6om9k5K/29w4GFZhYhM27ZLiMNsIPbRtX3+t5f2yJU0tTDPEUGy9rwktGYVd61
         wgJOiJSVOQNj77aOHPXvsy/wFcq8+14NdiMztPzDsJsJxxtt+uzDyDNUw7ghw9CRfAqC
         jqFs1T1CpjmNLswlAqvVFuYj2hegq2Jm1ijnUWRklisQjAGep0pzRg8ABcTGeGPCNqa+
         1r3vvjO/nQPI+VobFs7NDObCQhpY5rZi50lvRk/45FZzLmmfKFokNpDG0vP400Ibw01q
         xWAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gbxtANkKD+no5T6EiXK6Tea/adYVuoSud4wUlEix+Yo=;
        fh=uQs9j1E8EAERuIzGSgwgh+r/LvmrWoSN5Mf91JWjgi0=;
        b=KJsnrnlUVilyH4Nj/sy1hAu4EwlGdFBm6QUAQe0LroKW0ZBBplchsfsZuQhYz9Rmj5
         Z6dF5HxkMrqt9gLbZV+q4LcuzMbRGMLgQKysRK1sslZmHgmPhlzVrG8Oi1cqBmUUkuI9
         A4gBMMQfGP8egCuSX5SiTo1UUg1YMg6wsimuV5Eo6NP78wnUatvizt0XYSBba2NiLKPr
         5caLcBeX1/Sf3DMS1gBakvJrjZI8KS66GbwD3zqk4x3OugiJxOVTJ1SfXjELYDted81q
         y8+CMiJBK3TNre+2r2tWF4drpsMQAuubNT8TvQJPTnUTpjFnkhBs3oSHG8wrRVdwztzT
         tlEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793671950; x=1794276750; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbxtANkKD+no5T6EiXK6Tea/adYVuoSud4wUlEix+Yo=;
        b=fF6G9Jhk66eL2YXQUxSOw+szWa/NhEq79A2zPZQQzPiUgVMfgGeuZOOKG8KL4Qf5/f
         /Vlq7oZGdPTmWtI2vO/ONJ9ixUgGU+hQnkxA86yN5VBnHpMLfQdA/CSv/TtV29ZvNY9d
         +bvU24SjSIrs5JoFQsMrQ2wfXz7F53jvyRwVJSieB4K05orjtGfa7jHaRAOL1Ya+SKqC
         gCqKxVTHJpwXhdON6MwmTMWbQD+bNNJ7JYrnNbmlDevNYPY6nOnpnstG1f2xma4oZPNc
         JgfJ3GbMPdRN3jfaWDpwbFtioHNzS9yJXyXsy4u07dlfU3ccv/Hi5fb2zrU1yTHTEor6
         dWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793671950; x=1794276750;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gbxtANkKD+no5T6EiXK6Tea/adYVuoSud4wUlEix+Yo=;
        b=JOymoCuf/zB9LrSjbuBjtslpaoV0arT+pjle42ibSSxi+JX/22dfWx4FEzwwbdiIUp
         rN2rYbShGQwHl1fqsF0vG8wNxgxPKlRiBG+4aHuVSYaTaXVI2xMtdW0PhV8w7rAwsIsR
         J0kNHtc8ZEP7zGWMJOaMJHwIzJrvSshqPNtiHqbBaJzRgQ52YNKc5YnhzPHzKQcaCNnb
         wtbppfKquovYLpuPEhXexBaS9Xm88vBKckcUFzm/Ek4mho5Unq0iOkptaNu1oIasz0Ri
         Q8pY3kcS68vGSKYfF3nb2PFW9KQ+mzfm9EeENVBDaE8lycNEBUyn1go17W0vPv2pxiKk
         WuPw==
X-Forwarded-Encrypted: i=1; AKwUvBxFL5ky9zvOyECD7nvsoAyK3BNF2KD2TpsXJwbfmfzwMhldXoR6MhKQ0udRkM7fXtTq4xUGrK29YSEIllI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/Uud9L22xtqov5iz8PTg01i0mtlystfCobp8z8Kwn7561xKb6
	dg5IhSiqFShZatucrANZbLhxokTKeSBxJ6rQXINDJYbdN9VKdD78umDYlmxAyHb1DwzNeWVyTS3
	7cfmNOc4fTIDYpkwN1qaa9U6ejz9X2bM=
X-Gm-Gg: AYBFou3zDXDC0njD4PInSekheZQoYng4w9tkDyN73a7cMW6Gagzv2JujWGRnxiTOAtw
	tk70WTUH4AuyeYNBqrZXoEu3TJmCR54MDc2aRoJZb72n0Rhe4LCM6acgCiVKOfZQwFNYfRUXACr
	yn1q0zPs+wp/qDhZI94J1zwnchtKqKB+eizaQpzMV/FphMrqMjQoWcVJe/tQ9ZA9pNX36+vYWxY
	ad3SLgkOYF0d/Twm/dvmrPAhAVfCiMy4Al7S4UvxISe6jsH3mESJ6sKwhzIeyi1voEQTTW1VaZQ
	M5gQAY52YFzrws0Nrrt4x3KLtHM/zJzyqrQumUGOB030meuB8VBvPAp3WzOc1or6OJZt94RxL/B
	N8w2Ox202wT91Pn3y0pRW46EvimLtjytEgrMOTSGVQkCFLppoC6461TdAFzM1YK+VLUpjmmNpOE
	RgX3xkzeGc/QWJdt2UmHTEuKxbJ/o4ZD/seEIaLku9InFwW0OVHA1fqqkHsmyXVKU4Yr+k3qoPu
	MHRlsUNGg/g9MPDQcD8SXukLA==
X-Received: by 2002:a05:6214:e87:b0:91c:7a51:ee57 with SMTP id
 6a1803df08f44-91ca4aeaac5mr203416566d6.15.1793671949650; Mon, 02 Nov 2026
 18:12:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101022257.52819-1-mhklinux@outlook.com>
In-Reply-To: <20261101022257.52819-1-mhklinux@outlook.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 2 Nov 2026 23:12:17 -0300
X-Gm-Features: AclHuK9uvtjaaPHlebO_GILeXhtM4eF9Xw6fUbaddVzuMdSO3LAS3jPBYG1eB3c
Message-ID: <CAMAsx6eCrbcseb=eM_GW+3k2YF3t38Was35oQHW+3UkidsvKWA@mail.gmail.com>
Subject: Re: [PATCH 1/1] Documentation: hyperv: Update docs for PCI pass-thru
 device support
To: mhkelley58@gmail.com
Cc: mhklinux@outlook.com, haiyangz@microsoft.com, wei.liu@kernel.org, 
	decui@microsoft.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-kernel@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Michael Kelley <mhkelley58@gmail.com> writes:

Hi !

> +and unmask interrupts. It becomes the parent domain for the per
> +device IRQ domain created by the normal Linux driver for the

I think "per-device" should have a hyphen here too, since it's an adjective.

> +"irqchip@<paddr>" domain created by the GICv3 driver when it
> +initiaizes the virtual GICv3 hardware provided to the guest

Is "initiaizes" a typo? Shouldn't it be "initializes"?

> +device's MSI/MSI-X registers/tables. The guest writes a virutal

I think this one is also a typo, right? Shouldn't it be "virtual"?

> +Once the host-valid MSI message is obtained, the guest must treat it
> +as a black-box that the guest does not interpret or modify. The only

"black box" (no hyphen) it's used as a noun here, so it shouldn't be hyphenated.

> +valid guest action is to write it to the MSI/MSI-X registers/tables
> +using the .irq_chip_write_msi_msg function on the HV-PCI-MSIX-<PCIaddr>

struct irq_chip has no .irq_chip_write_msi_msg; shouldn't this be
.irq_write_msi_msg? Same in the last paragraph.

Thanks,
Daniel
