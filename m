Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793118117;
	b=JDFAeOELVVou3fNpCinEB/WlAv8pAIbbMJs5moMDcoU1i23dDC8oXSHcysDiV+mRUV+A
	 ED102c1tlcejDFPlZfpa7Q25sxhQbQEKNf0Dx0Dbi7klV9qVbVCIym8SjoJvf2un0lIRa
	 X2Zk+Lne8reuD/yVkxq3OuMx1S5xCWpGGuzDN4EC61x6rQXg7/G/+N4QZgZDrMYshPfDI
	 xA2lJ5WBiMApwezfGD6Q3MBt4eXcINa2YjSBUo5OG4K/Pcum7gGhNw8zn2hPSQ08Oy55O
	 Hkwg6sF2RNEhHxEMqx0n4yC/T2/f/iERARSvjvZtjAKCMMWZIckFDOav24sD5amCSGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WGMFH53fvXz3fTXe4+RA6dwEuGNwjFllOJfSunpTT8w=;
	b=oeYJ+X4X+6hNUqJeHulSMie4gBB3YFdiWMLb7d9KrgrHV6PhSuWu6I3lh/7NJakVZSSW
	 i6JKcOjgTyf2ZpqPzM1MihH8xWchrkbZBHuCGlTCpKJRyOzWhx/aSdSeRMvZWgcWlFmQ/
	 9ZaWDryT2MzA/gTNbSc0ERmFQu0dV9yjvw7V7u7ofpO/Cu/2jCf4nv045XBquZu+vb0Bv
	 LYX0i/FUYmubJD9G7UHm5D9NoKdXGcoCuiNStvXKz1m19UsOEETOIPT0Z64crbiDBC7wR
	 QN3HNKCicmZr/YCQeE+QXHZrsU5HejqTZLbuM1u9udxwo79aSHRZr1vDV+QkJ0OeCjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=caXsg8eD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFBC606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADFBC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=caXsg8eD
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8ad98c3fb15so37342867b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:21:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118116; cv=none;
        d=google.com; s=arc-20260327;
        b=M6CRI7ctGY/jyf5RI1/Jazbfnse2J5QvLJw5n3WX4DsWwnEvPy5z6HIUx3kxT+wBPR
         w+hYzkjV/XhWnRX9LAAWrc3UKgf0cXdCDG8i6OmUxDlTi4qs4JGs5nmeNye58A83CZsE
         bnAIoB/Vi/50Ona8J+HpuVeI562InhwoHeKxfPb+tCZddSQN8fZPi7cSB01S+LxU4m4j
         USEop/jrBYA/ybCr3Lp2r8AvTKu+m7qnJoQ/NfVKZldDDYR4GSkR3TQ4HkhTgF9kM9g4
         W4I14CSLnXZ5ugB890bT52Ls2jwTL6DwmCJJiQDpIKzzsq3o0SpRRXHgE5vKrIzYhaSX
         2u+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WGMFH53fvXz3fTXe4+RA6dwEuGNwjFllOJfSunpTT8w=;
        fh=PlUDZ8Qy77ec98BvGtlDHbOWGBFUPqZ6LtWCK5dVBx4=;
        b=B+yzWEpekyUHKLBauUhCU3fJXI6Z40thNZ/l7r1ds7/ZYgPZ6uC5lbpT89iH2ZT4lF
         UsZs601LsHtTnq47KrhCyT/H/4pnxNMYN3ZF+Ct9PeA3IOHQVcMvpJ/EAFlhbv6CnWOG
         BAoqcWhG5ZTR5k5nfFDtsQwagRekhqPZM1RAOmeKFF4Ww7VBkOUHwYU5EIixYuPLSVQk
         duCTM64ukGNkH0tmhvGlxyw/kS21wae0xEfuKEA/Uz+L775euleF6CqyXp4x03JCkBHM
         OOxXnJtsPNSU+XsLj61xF8y9VKRatY8OZ3462m3gpkTKOuJG+oun2Kcrd0tYGtJLN65M
         DO8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793118116; x=1793722916; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WGMFH53fvXz3fTXe4+RA6dwEuGNwjFllOJfSunpTT8w=;
        b=caXsg8eDJZuM0Xqfamw/nWCD1s6Ne3MM+74gMbQZ2kjyh//9kfSetHNy8QI3T9JI/S
         mk2/YyHh7riPlaMdJmR3GELfrC26Hce/RM6Ixoxc3oEbwaOt6eLK1sEl5Pbn0VKqv+QG
         qjVs5SyBJRBt0MDYMKDtL30EInYvru05tyCNysbo5oJUsatNAGLclJJtRHmjllAFpDU2
         ZaN2BZrRMo0aszN5FW9hEy19f37novWoHiNwwRB9izJQ/hv8UANi2HXTlxHddQsCIsqn
         SB1wB3Ipp92XpXAaMumhy61xkWfSor/tWoCe3T8UJaUMiJ+9YQRSlrGMHgK3/m+7JQVY
         wdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118116; x=1793722916;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WGMFH53fvXz3fTXe4+RA6dwEuGNwjFllOJfSunpTT8w=;
        b=gM3fumhcOOqWe1vgnZjf4G4370A1AnRzoF6d3mavVnpnUDtNenysqqFYEbcw61iIHh
         uSUe/dsoSDarVJtDj9tpNr200wSo5W3gz+Dn6pxGlpMA5B/wIUL2Rt4+j2X8f90ORYO7
         lE/JPTVjQRUwSa2K50pW9qYjeUCx29IHKbn2BfqYH/D2Wxe4tzD5twLpZele9wnid8OG
         t6kgSMLmp9mEfKuxmnterCItstO7xkbtFY4zUSghhUGylVvoeWZGl4MP9+CY0hP1pI05
         ICBTsw/XDxHWYUwrZw5RGGiTRml6u0JaDnL+DkMkfmZeb+OjxwYj/q+ufBVe7msYfnv1
         lx1w==
X-Forwarded-Encrypted: i=1; AKwUvBxYHi8rumTrtgx34J8xr3jcsx6mwSwN6tgvoz95jW61XVLEVRRutImj+FwYKUFNejkZpeKoZBg3dm9iYBA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyBnCFyZF326CZkPrK07DwEeIFxFvWPFExhGzRvNOer4FSjGgr
	blPgHYT6f/NekvOwqcezbrr6ylMx29EOhEvdajWeO/NnGRtWcQbCIfBSyuIC/UEx1A9atiHQ68b
	hqLlVyMpwTeTDS5Gboftdie55FmyRMVg=
X-Gm-Gg: AYBFou3ZBM5IpRtGeWAPVaJY/TxEndQRmlSBB3VDfg16uibya4BMa0OApEiDVx/8fd2
	SnDOVjmkJMtKrKFnja4nAO/w48gnCa5hUwBOg+890kb4hKy3si7S+Bga1XXqHkNEqNbOapntO0Z
	u/CZkv8NsFKcQB5gkgdG8M0VIKnjVnh/V45iC7RUZ9ZM4Z+gBl5muGoRTyNlahLLfBb/+G1iIPi
	oqg4ZIAKs9CSzO9jP8h72NpSzHX7i17UP43kcDG1MA9HI8tvGuyTerQvyUfZrRblfG6C/qnNlI3
	+9377HHICYYmu29q4uViS4MMQhvKQGV+q019e/3ye5R2+ZQQMpoMHgs5Ruy/zMmQ4owW53f61pO
	67Dvl757cx7hmGSbEoxGK7ZBQyUMUoM5PEx0mAQ==
X-Received: by 2002:a05:690c:c117:b0:8b1:2b32:de70 with SMTP id
 00721157ae682-8b166c533d8mr81246197b3.35.1793118114590; Tue, 27 Oct 2026
 09:21:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027030803.118131-1-lgs201920130244@gmail.com> <9ef05c62-1067-459f-8dab-2b0fbe70178d@kernel.org>
In-Reply-To: <9ef05c62-1067-459f-8dab-2b0fbe70178d@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 28 Oct 2026 00:21:43 +0800
X-Gm-Features: AclHuK-kZHn8BsJVCqzCiIghWeJdjN-Oh5rQ_CDaqaySgmTmND5PB2X4wIrP1mU
Message-ID: <CANUHTR82mj-Pj0QzKbrn+nkFWRGQVxBxoinmN6fZETRAPOHPqQ@mail.gmail.com>
Subject: Re: [PATCH] mfd: da9150: fix IRQ action memory leak on removal
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Support Opensource <support.opensource@diasemi.com>, Lee Jones <lee@kernel.org>, 
	Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 27 Oct 2026 at 23:26, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 27/10/2026 04:08, Guangshuo Li wrote:
> > da9150_remove() currently removes the regmap IRQ chip before removing
> > the MFD child devices. regmap_del_irq_chip() disposes the child IRQ
> > mappings and removes their IRQ descriptors.
> >
> > The GPADC child registers an interrupt handler using
> > devm_request_threaded_irq(). When the child device is subsequently
> > removed, its device-managed cleanup calls free_irq(), which can no
> > longer find the corresponding IRQ descriptor. As a result, the
> > allocated struct irqaction is not freed, causing a memory leak.
> > The associated IRQ thread also cannot be stopped normally.
> >
> > Remove the MFD child devices first so their interrupt handlers are
> > released while the IRQ mappings are still valid. Then remove the
> > regmap IRQ chip and its IRQ domain.
> >
> > This issue was found by our static analysis tool under development.
>
> So you just keep ignoring and ignoring our feedback. It's just bot, so
> little point to discuss with bot.
>
> Best regards,
> Krzysztof

Thank you for your feedback, and I apologize if our recent submissions
gave the impression that we were ignoring your previous comments.

We did take your earlier suggestions into account and subsequently
submitted a patch series accordingly.

For the more recent patches, however, since they address issues in
different drivers, we thought it would be more appropriate to submit
them separately rather than group them into a single series.

We certainly did not intend to disregard your feedback. We appreciate
your time and guidance, and we will be more careful with our future
submissions.

Thank you for your understanding.

Best regards,
Guangshuo Li
