Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601991;
	b=JmKgqUSCPYs56xDhMrG2HApbWwXkQemQMGSuonoYANbbQCeOsPMySjI3ozpOLEdiicBE
	 OjSjNSfkr3bI4agcKnszRyCZcoJbfY/vFxZe9hHde+d9hKpQVM0DTVavC83C6Lj8XRC41
	 Lr3zPTjNhoHNzvSQJYoHISkNx/cH60dvZOm4BRYrf7v3L6GSxa9jLtaicJxtF8k+li7+n
	 uKVP/z6yE/SqHJbx45u2pJlaymnc4xQ0RtjzDKDe//NzMpp2EZe3VHy0alVWtVCoHiUbX
	 I2ISJgHVhGMyScBYe7b12pw4Njgub31e/w7p7DFVWxdo4vJ/B619iYcgzeEOz38ruXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=9nMyN0VEnSPNDMOw40qCksgSnlqSB2G4sRnpFPXnQgk=;
	b=pY5BqqnGM2PIJr9PiZui2lGW0ZobBMku2aSZbkkKj6xOTGZBxjXkznXjPCWjWwT+tOXu
	 E8SfQB8nVzc4PaiM4WZscKcoohcaf9n9HixIwF7f5+DTgNgn5brNe3baNNffloysVWLQ8
	 RDALYB/MeXejy73s3qDiLtq6otwWEEEM1cD/T4dhrq8eKx29OP1EBNX+5RN/mkRlsw98n
	 koeiCDzw+skgYkiwW+cZuBJFbiIFYyNkHYartr+9Wy/cXpYmXg+pcAB9nwIEz+ICkwgba
	 1KSKq0VkaP/NUwJ/00kcelTix5byBUOIRPTx+Q+QDbFWHZUcSbdy44XrWwitn/Tj8YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLp7NZCm;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B262606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B262606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLp7NZCm
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0d09fc934so212954a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601990; x=1795206790; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nMyN0VEnSPNDMOw40qCksgSnlqSB2G4sRnpFPXnQgk=;
        b=ZLp7NZCmQWAAnZ02+wYgFgtbHoC30BCdKnKTCxTln8KLpmiuRrFaIwdwJYQqRVA7g4
         3cT3k7GD/iqJcSTBNWoEZwtTAoHK3HMcq8gcZgA/8eemkhVFrf80PhgUm4gLWvpYA6S4
         oaAQj+fTjki9zESLABnYD15O/9hOmzp6KvYeEMjVNy9QiAqZfcYHfbTd6mUj7PnYHinq
         Oa4m9icOmpJ9ZnAvvgLh3jj1bShZ2E1R0M4jEqBLK5gHb60u7YPmoCRaxKsaspFN5wSE
         c/j/3fPOsOh1OavfHx1WW1EBmwMagB7r15vwyz09Eb75/4Mi6DyXjdfvsMVr9CgseSOL
         FTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601990; x=1795206790;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9nMyN0VEnSPNDMOw40qCksgSnlqSB2G4sRnpFPXnQgk=;
        b=1Tnm3pHx4pe47/YH0Dyr3V7fuDOV6zWU57ZfTnrljG5DP9HqwXoBfIgto1WE2F2yUq
         7mLePOBc8osUM8sIxba5xBLjrb/Mqfq+d/FStvMOlZmWyRoq52ay8t8OnTFZNdl115bs
         NyGOa3KBAxFZnIzqls3G0LXTQVupMnpLejvy6t9j81lppNruarILHY6TFlupQd9mButA
         8Cnf4oM1O+WWjpwEZv1n3EtHk3PlxjLOpez2/Qd9nEsbaXomidZ8naPd28ozN99ykrCX
         J3OunbIQOWvG7bmQ+k7JN7dKLElEVCG2suHv/S2z3/ZBjdQ1X5ihmfUYmbZoc53M4qK8
         dydw==
X-Forwarded-Encrypted: i=1; AL+hErERde4J/21kFTDLtNHmliGRHbULSjIaqGRMC9sHSxzMZzGRXg6w29IEhFX7SkJ+MGMWnRFzAMVlslhxnsU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TAQCT2hJO7E6QjwnP3YRqauK1m9X5K6uOIxMAUdbB6FmfI/qz
	rmB8BVvLEQhDvCPUH5zdeO1wfW8UyyYL2+M81q0YFE7+vGDpWqR75Jkd
X-Gm-Gg: AYBFou2tn03IJyy29votfaam1Ur4clJ+ydbub9MQwGqdDtQGLw12wVJcrKiGWnArU4K
	vZJNHmt/bZKHfiVF63jgHjK3VwACy86c738jT3Dk1mG6Ls4Lx1F/+X2pQpgjE+2UaS2fXUsxT9A
	B7zKF4+ArFseTUHEHiX9dMU/qqkuu+RnyAggNtmhTt3lHwmdZrEZ8wWJIhpureDPQZicqgI3orz
	+Y0svN21/IhMvqiA7aIzfjkIg8mzEBXXJSrlGH+KCFaRwmSjVKmXdWT7PupBei99Dru5H1jXixb
	U4gjDDOWwmFwCgp/9Onn9B8CtdlUuShNWg99AbJ7Mh9C06njYC54N7fiyXW/UgHDlPklQ4cRzvq
	uK0PLjJ8GQUltqOrwC3zIc0ZA5dPC1AsH864G4kNy11tklCgQ3FRYneoQ7C6k7QUnBywZR0ydo0
	DqBshMyNEzbDxZRiQhyiNsIifuOOCtOjodvj56vvjuG0iykV7U3gx0hpPH2+kd8dy5jei8SZBZj
	sGh1C0HF6goYpRjfPEoGlTqABgIgeuFe+iIkToRibrr53cIy5SnW2xubhE05huybel7ARJ4vhPr
	X4+Q+id59V2rY/2yMnU1X67ZLOF3VLAIhcrmcj/u4CFDrDzi/gDjDd3RlgXeAfOileLO73GvpRi
	DahKCQ5t/+oxM5lJBIR84L74ER7o=
X-Received: by 2002:a17:90b:4d05:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3b1b05aabb5mr4604273a91.0.1794601989766;
        Fri, 13 Nov 2026 12:33:09 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f6e0sm11168256a91.9.2026.11.13.12.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:33:09 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>,
 Sven =?utf-8?q?P=C3=BCschel?= <s.pueschel@pengutronix.de>,
 Hans Verkuil <hverkuil@kernel.org>, Jiaxing Hu <gahing@gahingwoo.com>,
 Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH RFC 00/12] media: rockchip: Add a VEPU580 stateless
 H.264/HEVC encoder driver for the RK3588
In-Reply-To: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
References: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
Date: Fri, 13 Nov 2026 20:33:08 -0000
Message-ID: <179460198852.187691.10732168634380090377@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

I'm withdrawing this RFC; please don't review it. It depends on my
H.264 follow-ups RFC, which I have dropped. The cover also should have
said that Detlev is already writing a driver for this block, as Nicolas
explained in the VEPU510 thread it links; I don't want to push a second
uAPI for the same hardware.

Detlev, three things from the bring-up on an Orange Pi 5, in case they
save you time:

- HEVC wider than 4096 came out corrupted with the external line buffer
  (H.264 is fine with it, tested to 16384x2048). Tile columns of at most
  4096, one hardware pass each, as MPP does, work (tested to 16384x2048
  and 8192x4320).
- MPP's "TU depth 1" is max_transform_hierarchy_depth_inter/intra = 0
  in the SPS. With 1, decoders misparse the residual.
- Two streams, one per core, with both cores in one IOMMU domain and no
  dual-core handshake, ran at about twice the single-stream rate with
  the same output as single-stream runs.

Arun
