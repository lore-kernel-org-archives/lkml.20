Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793543208;
	b=r5AN5TfAhWJ+l4cr04v2fIaFbYwJBUiy/cXtWIdywex4Yd2gaWXUUA9zDgxPGbJ1hByI
	 GzH46BwnQJawK1A6bNn3YI8goisvCjuybazSE5UvHI5LTRevNes6UQOn0oBUeXOwGb65x
	 /QZBfw+w/o1dhJnSKS+oszfgg8qRTsxnFQar4MDMvTvdh7ZjluinHW0mJty5kg+KyHLsw
	 UhOrpiUzB5hz0urW21myFqOxBZ7bt/mYFj9JZcLZAZCXwtPTjKrHP9Q+CAFBtqjNTbtxC
	 kwiUq7d86iaCiLV745jSzaailILLWzioMsFD46XsY0wypZou9gRydTAm+49oWly12EQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VSMhtPmYj28P/PYH23LQ0LHJkDrgHurxFkaRZSD9+Uk=;
	b=C3XzttlN9NNA/ZYUody4dxvnDqFDm6fhIvwvumasAxfMXUnZH4N85BvOV2jaWN9y9Xp+
	 q65H6ySNeOc6jenEEPo6p6lhsp6KkdBKAgaFzH4u+Tq1ep76C6ON65bXvnZ+gCECYHV9J
	 2QVElAgejOY/FwGKI4dMeDczonhwrE/GGv3uVKvB0ztGIQv0OiCBL9CfulLywz38osFSA
	 MKBjVtzRfFOzfiXszX+C799b5HbigSmKltsb5ZmZOpNugahTxS4YuR6dH1urQASJxKfHI
	 DgsPSnfsdU8EoRI3VP2eAUDPbPAo2BmxZqifyvR43hTQT7D5k/Iio6B1ckI8Bog7hug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b="SG2s/tPP";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3FA606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC3FA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=SG2s/tPP
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-703be215729so1047393eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:26:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793543207; cv=none;
        d=google.com; s=arc-20260327;
        b=dtaX0ChlVCX72qBi24nNC0Wjqz+4GHHy8bzPRKr+hxgLpxtyUYV5Xn2HSoJ7CDlDjA
         X8Sjj+uikM2nay3AWYESBHZgubEyFkd+4gepWVwx+G+OgSklUzZVwrG2PpBOgvB7qAHj
         xKGhVclt0+V+vDrE/Amy9R2B3A0InYqo2vOyub1wE6N0Oww3+/8HPMF9oiZDCTJho4Nx
         UdlKk4yKzhTQvrNxXftW1VjYVWSvQSGQ0fyIf28AUDXpNPWSpqBVEdJT2IQDiy26ebf2
         8xrSn1yZyaUtROTSAM2uNwAPtLh70/KkytfQ1j7ENCsKDa1vBK3WNSwHqVTSjCpxYN0W
         6GoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VSMhtPmYj28P/PYH23LQ0LHJkDrgHurxFkaRZSD9+Uk=;
        fh=v1lsdRHZ/0YEGtzMi5T/RF897J2IX8dlxFGkhIGLiRg=;
        b=DnOkLi8+0z/9b04ugFxUKrDuG5f0p5Ttvq+u7mlQsch5WOpzl4IVi0bHPt9enKutbO
         mGyfmbGVRdZxIcUgvPMrudHGxDluxPn26EZWSO3nmzvosyoiaC8AERdhMYw8S2+LXgZX
         FPyFrtf1glBajZMx0HeWuBU7f+yENHZdD/PWmPRW1zH5H8d3IVjnQRb5OB0YoVPznHmz
         jgHcRbfflzKizKn/FYTpAjIO4bput15JPvoEnQzAyvc2OabZxqthXsYUggUyY3PRl9A/
         ZWskzdailfBccxe9Ho5n03bZqPA2VVOozjMROQKWA/TVHwZ11rytWn+lizKTgPjRSNRM
         kNrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793543207; x=1794148007; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSMhtPmYj28P/PYH23LQ0LHJkDrgHurxFkaRZSD9+Uk=;
        b=SG2s/tPP98PWmeaftY02H/z8zD336YrdgSY6n52NWltggx38Twlo9JM7IP4P5qLgob
         U8fQTxsqlqlYBPLj6JO1qUQd68MY7OI5ytFCMzlNOKpWCcoEOKv3rHBL3UO2RdkvO8lh
         5J4iTDpsh37P/T7IyWypweeAgYvBzSXVwtALo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793543207; x=1794148007;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VSMhtPmYj28P/PYH23LQ0LHJkDrgHurxFkaRZSD9+Uk=;
        b=d+wxgrTKEVcCmBP3ddciSku8KS2vfuHEXFK+rkRV4Cg5ANFj/PARTBz86YgUxJhLNi
         MXjEyF+0CnXrywZfygjuGHXKrNV4jDSsFxJQrwV8JIZpsQ2NQug82ae5AOZY8gD97UVA
         sWN42tQAT5OfWbpXrP7sNjhdWXor3J0LiYgfFwchsP+y4KpzoDewYvRPQZZ2WisBKHlC
         OiHBWPqyeotyBcTeqmQwcAtmt9j0vpz+i5taVA8sH+ZzdGYDsfi1N+7IEI3WXG+hS1If
         sAoUerXIzqHQg79dGp9yCpRAeLkk7kzhrEoD/0YLR9CH42kGbAmesAbspKOpoaR3ueHh
         9JNA==
X-Forwarded-Encrypted: i=1; AKwUvBw4zPFcdIkCLn17VoVgDVhlJP3ei3yTK/1cjpF9Me/IY5gqDMcBG+LU7Y111NE78/a4ZE8Y3QJBEPq5i40=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQd7pMflg0mpGyoW/+uPh30SMZYZ6fgqRmP0N7WP1JyWmS0upg
	Tn2xPvcGMOIZ8RZ11RgZN4tT2Gu5kLPeemgNiaacuuZ0DqIK3uDn50mixj2v7C+BKeY77m9Drs2
	pkZNDLxKtISwQ1I0d9RtnwBocyRQA56QTBuH5L4yVvQ==
X-Gm-Gg: AYBFou33iKnPGMGrmPLJqspdjOPG4ZjPXAk7cvciv9EORJp/Fwy643ole+HF5cqy8Aj
	0pHNvwP18Nbi6uHTvMJkuAmtU/VhKUVAcblOne5sEN4N/FbqAy+4DJcqgUg9UhvdCRzXN7kg1RI
	0Vd2AR4zsXNw2LOu86QETUFIAGipAOHaunnFHu9qbHZV9Y4AfLcKO9hhKxYucvVLqOSRSiQjBIq
	AAqJydpJtXulBlEuqlDgUcfEkoMz0xtw61B7psewZOJr0dP/Lrx+9uSveWS/QlAavclMduPDVPU
	V+DKf3ik5PY7GmvuBVl/As3nFyfmV604kG1QQ6Vd+FctW5sC6fb2QkCC275ekaoRpfdK5SXbz4n
	OIMjcUhC++kc42ybwNb+pyAeV5jl7VlakKIbDExc9PamQ1usdR49JmQiEEeThr6CaIcGjTgCAyl
	l6w0JYMhkI+gWBJAKypKIecRo0gfSJTSs32xnU0pXPjLXzZ78=
X-Received: by 2002:a05:6820:828:b0:70d:77b7:686b with SMTP id
 006d021491bc7-714f29bd919mr3821168eaf.40.1793543206773; Sun, 01 Nov 2026
 06:26:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026102101.224568-1-qby140326@gmail.com> <073e6aaa-12dd-4fc1-b7dd-4d27cb4e27b6@kernel.org>
 <CAAcRvKNvBKwVcPQ6vv-+OGZdL2Gxd-ocNyvZO_q-g083QNfR5w@mail.gmail.com>
 <f2dd98be-0551-4857-93c7-59ffad1d3e88@kernel.org> <CAAcRvKNYkXr+eor3JAYwO17vckeVAmYT+Dp+-wMobMmL40ukBg@mail.gmail.com>
 <fc016bc8-bc6e-47ed-a85e-891e522c3f24@kernel.org>
In-Reply-To: <fc016bc8-bc6e-47ed-a85e-891e522c3f24@kernel.org>
From: Chris Taraszka <chris@miget.com>
Date: Sun, 1 Nov 2026 15:26:32 +0100
X-Gm-Features: AclHuK-Zww_1hrg6V7YRypD6x2MCAdLGuHMa1GKcWFVyTX7OCr-uEhqE7nFiPjc
Message-ID: <CAAcRvKMdHPUNuG6Zd4g=M2settZ609-oZG6P_PMRk5xL3jRfoQ@mail.gmail.com>
Subject: Re: [PATCH v14 RESEND 0/6] Merge redmi-wmi into bitland-mifs-wmi
To: Hans de Goede <hansg@kernel.org>
Cc: Mingyou Chen <qby140326@gmail.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, KentoNion <kento@kekto.ru>, 
	platform-driver-x86@vger.kernel.org, ted eric <ericted8810@gmail.com>, 
	Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org, 
	Matias Civadda <matias.civadda2342001@gmail.com>, =?UTF-8?B?6auYIOS/iuaWhw==?= <btx342@gmail.com>, 
	powerfullz <wleizc7319@gmail.com>, =?UTF-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>, 
	=?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>, Rsplwe <i@rsplwe.com>, 
	Bozhen Peng <bozhenpeng93@gmail.com>, Anton Karasev <uselessfire@gmail.com>, 
	Jame Jao <jaojame6@gmail.com>, Serhiy Shliapuhin <shlyapugin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Oct 2026, Hans de Goede wrote:
> Hmm, so does Fn+space work under Windows ? If it works there, then there
> must be some way to make it work under Linux...

Not on this install. Xiaomi PC Manager fails to start here, and without
it Fn+Space does nothing under Windows either, so I cannot tell how it
works with the vendor software running.

> Ok, so the value-low indicates the state of the LED, right ?

Yes, inverted: value_low is the firmware's "mic on" state, so 1 means
LED off and 0 means LED on. The firmware builds it from the EC field
MIUT (EC 0x17 bit 4), which drives the LED: MIUT=1 turns it on.

> Interesting. Is there someway to manually toggle the LED like we do on
> other laptops, so that we can actually sync it to the alsa-mixer
> mic-mute state ?

Yes. WMAA has a SET for it: function 0x0A with sub-function (FUN3) 0x05,
where FUN4 = 1 means mic on (LED off) and any other value means muted
(LED on). The matching GET returns the same 1/0 state. I checked the
LED side by writing MIUT directly, which switches the LED on and off
without any event. The WMI SET itself I have only read in the SSDT so
far.

One catch: after the SET the firmware sleeps 150 ms and raises event
0x21 itself. So the driver has to ignore that echo, otherwise it
reports KEY_MICMUTE again and userspace toggles the mute back.

A key press toggles MIUT in the EC before the event is sent. So today,
pressing the key while the LED is on turns the LED off while userspace
mutes, which is exactly the desync you described.

If an LED class device with the audio-micmute trigger is how you would
like this done, I can do that on top of the TM2424 patches, together
with the Fn+K one.

On Wed, 28 Oct 2026, Mingyou Chen wrote:
> I think different models have different behaviors on this.
> Should we add a quirk item?

I think so. On the TM2424, 0x28 is the Fn+K request and the firmware
does not change the mode itself, while 0x16 on other models was
described in this thread as reporting a change that already happened.
A quirk flag for "0x28 requests a profile cycle" keeps it to models
where that has been checked. I will add it with the Fn+K patch.

Thanks,
Chris
