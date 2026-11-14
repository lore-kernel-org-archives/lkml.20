Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794670357;
	b=eAgKPbW8J+M5h2Mlr06cuX1zN7pUp4dtab8UtoCfXTw9QrqDdxWD005eF4NS1cAw6HMK
	 W/f/bwIIXi9TyFhkf12/Fbc+lKLXZcGGGAx2rPzmVO2AmgneAWnfvwQaoSKnfLX90Far8
	 pxcoopm8qJStABBRgEqrHzv5BUuLLdAefwdqRkY4/k6qWCEPf0+sAK6gIlv3BocQd9akB
	 xBcOYcQaM5rvA0ZNAcOzNslIObdni56ADkDSaGIhPDtSgoCr+FJhAeK1trLgJVJP8WAFv
	 XzYV+EU/5VxIEmTTQynOxBs4/ncTIRMKXDD2YPwPF/v++lf0xzTJ4Sqs+rfd+agsyAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YjN6mtWcOCsjlBrJP8cJGczeHs+0ITKRtbxV1uFNID4=;
	b=YTaQeWpOURnm85VeVq0XwlAdi5OBrZH73MBM26tZP3CZtjVSXChksN5fB53sIOLWE8H0
	 Eznzt9ByqtQg02jU0xw/k1wmJqR/+50pxkmD31/pnAhtOqpY8C5ttRPXbCrmtJx9U/sTs
	 +sDMTiL19Xk6dni25UxEBZTUaVbiAN6N3fVH1iST8j79RAh3BLDjowPg1F3b/p7jHE4yb
	 6CbyhNXDhKNNebLr21GQwHbqt3MfmhSqXioryatG4xMrCq3aQdSWHAncXOji0Ei0ynxpR
	 159wxcBEJBrwiLsQbFjFyskouTCZtPV429Qfwa5KcQCCI9sq6w+diKlFbGsLuXplNng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgrOhZRp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA60606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA60606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgrOhZRp
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so399799666b.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:32:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794670355; cv=none;
        d=google.com; s=arc-20260327;
        b=l4FHgi8SZXRAh1roCWyJnLqBGWzMreJ34/2/FtNkxSZ+GlSVlJAwnMHGX+coxq7zcu
         oaj4QFos0NEi0wh4gyFsD30GnQodjdmYhwNn9MQVdAaTa7eTvOy71mwRh8aA6lxw0fk8
         qTJKbclJZxTBvfF7zrp5BiBgQUvmikyXoymv1ofU/lXLAKdHwowPkqAKELwbYpDMlqKm
         H5DAPn2mtWKcqmR0RUsoZjSGq4/Uub21RpyI/ANi9tzjM1S0DzinwTEJAiIPPcCQfB1S
         eY1ajMQmsZpBW2btshy+9DljXKeDXOoNWvKB8r1fzgocEVCeOqBNNAwx0D6O0AAk4K8E
         ZwIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YjN6mtWcOCsjlBrJP8cJGczeHs+0ITKRtbxV1uFNID4=;
        fh=dxtbfA8i4Jqqygwj4yZGcWaZOt2qUsdnptO9irv5zdc=;
        b=YvIHBCeMNc7lyt/NGalp9smD2+QKN4rjJOrftLr9iwkT15vXkzz3h0K9u3/n0/J/HM
         QCD+pBNauCf5yHwwIUa4ZK3GXmQxsYvl3Eao3axUxCvGVW+yxA9rnm2UU/SHG9Vff2we
         0v/4ctKSSkfBXNSCCt7yb/5l70VtjfWQyBcgq5idFG4harmOX3nueOLDJcYz4XRYMgFk
         2OaGhgNbR8YWzRmP/gRCppQBV6KOWxoqisAMH96a7Szz64fGD6ul7D5uu9i+O4R9we/J
         4K3DXtsKZTVko80bKT7ZfSDTtqvkuBXChn26OPyVsY1QiOnXCr4zURd4jjlRTdSXC4Nm
         joCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794670355; x=1795275155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YjN6mtWcOCsjlBrJP8cJGczeHs+0ITKRtbxV1uFNID4=;
        b=pgrOhZRp05KImLhRrhLjrWt50iEsX2rldYqswYgsVQNsni6GZ7hMZFhhEAsvzYl+XI
         pDxmlgRtgXeVD282942Y9MC1GgAIs4rNVhm9odZW/f2y2srKDssKPHzL037mIIt7q6UE
         tYe4MH3o76oQ5NfhwSZxAoN+RwnvALSJclUP8WgvpS8B/+J7dSGb4FwmSL9M7f+4e7TI
         jPqnY564o9gAucXpqlDNyAV+Ml9dr6o+UXPsD1dWTw3G6g6JvW7b6X2gsL2fuVsOMB4U
         NYynnyQli0Zr172tTLKl3QPS2vt1trdjq1+3vrarZJXPCSRrSjs+1oogfjcKHzGciZ2B
         zskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670355; x=1795275155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjN6mtWcOCsjlBrJP8cJGczeHs+0ITKRtbxV1uFNID4=;
        b=VvHRd6rSs05CHCc/or+hdMHBBBKa/hV1euXZ5jfwYUVEo57qRxRUFNPEN5JoD5mpuG
         kGeZhWM1IIyFNDNQ75f9SsjDYIRmBBXh9VQOupDsk0QqtkW57X9CEXF+yMXzRDJnpvuy
         elJsAwkO7sprjFOgtzeZiCCfmBoTbbbXVAKmmFGI4CUhP8aAjmWbwO5KXEB16gkPwEpF
         EA21vX7mNtvYMzSuhIV7zP91TlBg/0GxhSNhSqmWdaVD3TlcIq8d06sxP49UOGHcn1Fh
         yAI1nVDLRKshYqt5uB/yJadrTEStvo8nCN+X72wIvwcjS3eqZ6QotrFh3zoTa3Mq7cAx
         eaeg==
X-Forwarded-Encrypted: i=1; AL+hErE5giq8/DdhiIYVvCTvWtID06EQR0HMtJ6qEBx+cAajaEKU8nevQvz7ePaod2rnCnhglBoCRIVqDnJfOqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TuWVpo2wKqe8tVVCuOEAR0V5CPD5S5MC0dPobC+TLDY7GSeb8
	wHzAVJ+PS5VGNyMc9TWsKm/8wt1oCJ87waeDaNqfAjfgJzKc6dN3JiFrsAtUU8BX9yNEyS3cjUx
	jLRZcjFqzvQeagCaqoR6ywkRYTEraPiVXfeae
X-Gm-Gg: AYBFou25UOcsqvPO68SYqqpHkUQYleFfdYG3u0miYa2rCMz54FKJCPRnpR3/s/dnsUU
	/puYaCoLHm9lOBPwlAT6YEMP2IOY/W6XeeVSHTfPLifwKWyHFgwX3Spzn9eJtsGnBV8cx0YzlNs
	MS19u2I/IUI/Xvz8IX83il2kvTPRlsyuOgAdsMDDEVQ7GNDgLc63Aq7ogKmxZ1nWAd+6B+NQaew
	OZzJf4T9OP0aTtgHHowqGN0e9pQRxELuvHBx9Oct5FG2CHCDRKcNFEpsAEmEwi0uRgEkhPL+luI
	cSnRQLLRZZGLDTzurwveZ86O/GpsWd0v43VaLe4xwnwgcJ98a5scj+3/RlhmHQHme9xZqLpo0Jk
	BLqEfKp0WW2sp3SwtccUVci6IcBXCzm/VydjKew==
X-Received: by 2002:a17:906:9f8e:b0:c4c:b4fe:c9f1 with SMTP id
 a640c23a62f3a-c5096385149mr526284666b.35.1794670355209; Sat, 14 Nov 2026
 07:32:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-4-a.shimko.dev@gmail.com> <8ef5b0a7-58f6-4c62-8153-6a9c8d3703f7@lunn.ch>
 <CAOPX745=Mx9Q+Wijt9+=Mmjtdk4fsenEeV2h0gPCvNpqc8kN=A@mail.gmail.com> <43b83555-df27-4b8b-a1d4-bf0cd9c46893@lunn.ch>
In-Reply-To: <43b83555-df27-4b8b-a1d4-bf0cd9c46893@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 18:32:24 +0300
X-Gm-Features: AclHuK8X0DQZe3Z31cK9XuFE51dX6ITpI-bm5svIaVnP3cI8G5bXUmovC3tRnYs
Message-ID: <CAOPX746c7uJt1fhV6s2=VjjeinQs+R4zDmMqCO3_UqkMrjzMew@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] net: phy: dap8211r: add led hardware control support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Sat, Nov 14, 2026 at 6:13=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > The LED_COMCON register does include "force-on/force-off" bits,
> > but i have intentionally chosen not to use them here.
> > To be honest, i=E2=80=99m not yet convinced that they need to be added.
>
> They allow you to implement set_brightness. That is ideally the base
> for all LEDs, being able to turn them on/off. If you can do that, all
> the trigger can work with software driving the LEDs. You can show the
> heartbeat, shift-lock, and all networking settings.
>
> Making use of the hardware to blink on network activity is an optional
> extra, reduced the CPU load etc, but just nice to have.

I got it, thanks for the clarification, will do.

Best regards,
artem
