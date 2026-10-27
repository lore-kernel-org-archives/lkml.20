Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793068091;
	b=oiqEU5V7e0y95lyGXLFfyBWZVHibyrnGrAmKBwRglZ6rhn9SgXPDYm2BA49oD2Vo3RNP
	 fbePtTFEWv4Q443bjflnpsfnOAcWlREQkiYrGBiiaRtT1P/ysaGMyquWCOIn0plCD0nrB
	 ISCBStAUYuqaoEXX4g598y09lRmJDV9KDsl6pRNgHWgD3e6Ckqx6MC8E5LUk8WTU449g6
	 ipVvGHvHga658tg7cdEZg9UQcgm1sHO8qmW2QYuI2xYpaeacKcfVYDiyX4pXQDTeh8E3+
	 1mrkz33qEqtPaUpq3RO2Ysj1w+HhfATfhwriDb44Mm4lBnApHWfwsekk124BgQfob8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793068091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/WcSLowB0b2pojOqzb24H45+MS/MsdePMGuj0DzePaw=;
	b=OiuXEw9k8iqTBCyvn2FSHGhwEA+vgJLMV3Lv7gT+oSUx5tAgJ6k7SqoxH22Wfq2oh/ao
	 /GibhzFgo74HYgQg7Ufp8KPp8uwtuVb9EMhz/I42D1Zj84DaPRd8iG5E+uikDAqKoMwNy
	 ckmNk/kGxK47JjdJjmttzNF3ySEhhLNwyAfh7O+FFmh8QOBJyjOY27BdjD037LxDfXTdx
	 8twiruF0y+GFFbRuxyfLC0cDh84GgAMVRagYB6f84TvFIl68DI7HMesIXZERlV0S3oLgN
	 ECq4TAGhekP9gz5QdwlsIlLpvfwWQnBIApOrgR6nGidZP8s5X4Db5A+8WBMfhKbn0yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FzL4qcf5;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140C8606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 140C8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FzL4qcf5
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ad0c2e71ebso500608a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793068090; x=1793672890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WcSLowB0b2pojOqzb24H45+MS/MsdePMGuj0DzePaw=;
        b=FzL4qcf5NctPk7sLx8O3gWaS1C9SHXiT1ufLwisUE9VwvAaArWAm5S689nOyuHSoNt
         Ezz153Uml7Pmd/ZPe6/R6zHuNlce9cGwOkZNh7JZDwpU6nNmG/DcS32glxJXs+BoLnzg
         XDiWdDPIkUGznzfOvEGnNE4+dWQEKQgpcQahgCp+bwIJrgWsDY2nkZZDtaI8UOVicr94
         NA3tVmG/EBTT/qKCRlIMgKfkB2D4N6o+8S0fvuyVTV6DbgLW8624hHPafYudfg3Dr9z2
         ucGU0eD0Vi/f2OtKbyfD8B0dAMkPtJcc5lOcuLJ743eWUQu3WDUoiPvsiuUF/UPhc4tE
         kwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793068090; x=1793672890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WcSLowB0b2pojOqzb24H45+MS/MsdePMGuj0DzePaw=;
        b=ns0xwx4C3/548sItQb+MF2houjzprFaPPEVBFs5hwDlTg9t3Ybfw4QNFFl2/vMenqa
         h7rzEBk83Fw2Sq6V6L8fqwcLgSe6W/4Q0BlebPymCcH7j5hpfUqSeRaer5GSad9B22q0
         IHQbKtt+OYRoVrLanuJLkzlTWVM5UnJOt7kNtR7dmtVGhN2sN8JteiGd+fmL7QVC7Pwy
         YHlE258BlSd6i4/cmRLjFei1HPK3GQHyQ+MFirxJIkBbkp/bVVbaguvzD39O8QUiWYk+
         /BVP/jYudveHxxoH3Z5ay0tTil939u+ZwIzisLYTSzxKUM7M8IIwRuxemRzeFeCLPssT
         /VyA==
X-Forwarded-Encrypted: i=1; AKwUvBymv+3fHUBuaFfKiuI53eU6/Cpz/Hn+dz/6m1Bs2CIlPvsC1EW0MW0QsIp8yQw+C+h5T22ApX2IJO1N5SI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIPjRTIotsdQMVQpsjc21Zi30wCoTKK9Q9lIB2JYvlYjNlqBHD
	uLeQ+furRVzGj5rp79h3WepunJnp5NEV4HWerGZYEwTIof2sXg3k3ZBc
X-Gm-Gg: AYBFou0jRHRPpDBftS3Dc+De2ilOFuuYFm74fgrzG6TKsW5xnCx+WRVhAgDGwZJc1jC
	qZw6COpLpR8dxzy0bLq0/b7n8jO4gl+VGzZURCS5NzGHia5DUeVx6aUXAva4z3MnHaM+LlUF6t2
	71DBq25Hcf9VTDappvoI6imHZOFS5k81Iq4lY2oLvhcqod7mTmJl+Hnajt5e4RxZiGbab5Muw2m
	Vic406aozXRdEFVSrDwP7bGYza/F+GzPCNe8v8HP/cvmHp/I2QmgasungjYSpO0opsAkYwREJrz
	wBpZUIWIvZhotnETS+nEZkIsud4aM4BoqbTfuLriXn0YuGvZTnS5qNwotzK738fD3RHy+OGm+pP
	Y0bffJsVUMWLm9Mrq3FnkEAcnsfDjWXcllhcgwqMao6d1httJ4qv7xWD50Nu9LosO0B/YsmpcZF
	1jKepbCTjG+WsnqNsVCmk78G7OoiEZL26ChJFU845WFppNVc7/TbO1Vx0VpKsZzA3CpKYtZoNnw
	YIOzCjD1XgH98ho/OLFNTkasKSvppEFEnlGlAGKMqken9ese446gDtH3mHi0cu6nVxpFvwirmLI
	Vi4sfm+Tc7ORdF9ySDVxzqERXkoKIIJn
X-Received: by 2002:a17:90b:3dd0:b0:3ad:a84b:df1e with SMTP id 98e67ed59e1d1-3adea1af8bfmr12128791a91.1.1793068090331;
        Mon, 26 Oct 2026 19:28:10 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba38910sm6823109a91.1.2026.10.26.19.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:28:09 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: heiko@sntech.de
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hrushirajg23@gmail.com,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	macromorgan@hotmail.com,
	michael.opdenacker@rootcommit.com,
	naoki@radxa.com,
	robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Tue, 27 Oct 2026 10:28:01 +0800
Message-ID: <20261027022801.377819-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <5520293.6fTUFtlzNn@phil>
References: <5520293.6fTUFtlzNn@phil>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Heiko,

On 2026-10-26 11:43 UTC, Heiko Stuebner wrote:
>> I confirmed this with ArmSoM. They purchased the original CoolPi 4B
>> hardware design from CoolPi and confirmed that no hardware design
>> modifications were made for the Sige7s.
>> 
>> So the Sige7s uses the same hardware design as the CoolPi 4B, rather
>> than being independently designed.
>
>if it's the completely same board, just with a different print on
>the board, why does it need an empty devicetree. When it's completely
>unchanged, what's speaking against just re-using the original one?

The existing CoolPi 4B DTB does work on the Sige7s, and I agree that there
is no hardware difference requiring a separate device tree.

My main reason for adding a separate DTS is to preserve the Sige7s board
identity for long-term upstream support.

The CoolPi 4B appears to be discontinued and is no longer readily available
through the purchase channels listed on its official website
(https://www.cool-pi.com/buy/). In contrast, ArmSoM is actively selling the
Sige7s and has committed to producing it until at least January 2034.

I'm also planning to add mainline U-Boot support for the Sige7s and
integrate it with Stubble-based UEFI booting.

While U-Boot could update the model and compatible properties before
booting Linux, Stubble may replace the firmware-provided DTB with one
bundled with the kernel. Having a Sige7s-specific DTB would preserve the
correct board identity throughout this process without requiring additional
distribution-specific modifications.

This would also avoid confusing users who purchase a Sige7s but find their
system identified as a CoolPi 4B.

The shared dtsi ensures that we do not duplicate the hardware description,
with the two board DTS files differing only in model and compatible.

Would this be a reasonable justification for keeping a separate board DTS?

Best regards,
Jianfeng
