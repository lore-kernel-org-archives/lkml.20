Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999599;
	b=uBCMVhTzY3vIuSpNUTKuiUEz5bnXFVRMsHSc3W9WtL+vajOUoCg93EueiuPwPV8nwYj1
	 dq36rn99HdtJ+odINvLvObw5+qwPUkONvlnaZDQpaJK4Hk3qX2ktK9468fXVWqoI/6l4c
	 oI6miK4ZiGEHup6OB+15zsQe2GgRdwbT+1HiHHRLSLlRHUBG8x0O/GnFan4GCtxYDxFad
	 R5tN+AP+e0OeVZNHvhNbso2LLMqfZVuYQmbSNPhzoox3TTIeymIztbuC0UpGtZuTLhGUl
	 pCsUMZi5FWjMl3Jm6Z9753cmk31iYshp5I1VGVbh/vm8c271gveYRS5sx7hl3G/5m9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KAgB2fssjvIHHivLsh4UbVD8IvzJBAHBr6xJYRkzEJE=;
	b=0HSA8zSNaaKTQU4sCHoLSbJHLtONA3xSZaMdk6GfL8fNY6OvAv8/NXPPqGv8E2H3Bl64
	 t/G45kLaJARfg8YErfGF0VKN12Qhfv/WgkHf+4CkvGLviOB9DN+iNbnf0ej7Qctu/M8xU
	 it3ADUf1GoQbtES9Js/kT6e+yo/5z5HpN3o/sC+y1D3keqin5hMJ+hr7GuzhdcJ9CcjVV
	 YyUQeiXje/Aq99LG5hODjBDspJrbhXEM7Wcx8MM6NWXxAsj6EdcjOCZkMlIdTa3sXnuFs
	 EDiIEp1OXKj0UYWLDCViOaVyLtAEiRYRAQYGmvRrIz/HmSiH5XLLFP25GDt4aeWYPUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNssPANh;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AC4606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12AC4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNssPANh
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso10983925e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793999597; x=1794604397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAgB2fssjvIHHivLsh4UbVD8IvzJBAHBr6xJYRkzEJE=;
        b=nNssPANhtZ3wzKp1c63u6YxR9nA9RLek2d5ZArlqR/5bmeQT7Q8Syuod0hALs9b9BK
         NGyyci6Mqiu8Va+cquY4+qPrWRxTpJ2qg+/AOWHQgfEwf+O2tZChYBiCxQ1ek4SkLULZ
         HKCnkbyLbNxBlb71sB05ArRhzSB9wGamoXLzIkvEEOR8ozKcAedKV7b3Jv0ibtu/KD/Q
         Zm8Li/iWTpogD+j9W37+RWXVAzAXIp7/OKtLisQictcTPoTlE5HPvAmU++MUBLyvO2oT
         4NQvWT40HbaG9WTiOOCO9Nh4GgJHsY2FxO+a83RIP4/XFHH9t8rRgihiwUy00eM+bv2z
         9TpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793999597; x=1794604397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAgB2fssjvIHHivLsh4UbVD8IvzJBAHBr6xJYRkzEJE=;
        b=by6mvK1HrYE8N3tDAjkhsfV+dyUM/leD5ZaT7YLODahB0xklBG511xhrwUidM+/HAc
         tzghiSAEDapmVDK5uBpsSvEkLmiok42ibubqrX5jVvWGZ85cpmfDkgI4Q6w9dpZmm1Zc
         y8JtwMCIAXOpligLsJVoG4wRmpFD4cTh5morA6SaIPHdp0qdE6lg11eKBKknRHb1P2Xw
         CIMJH8hjJpqAOmYWCyDEDomw4uPlxfJydcv/TQVO9zCHfQQtWMKUNI6SOAunmVpLuZy+
         2lrMmR/ZTNikTJqhpg5DlbZShmQbG/4Tf0hoI6qVAMxHGAdWl0IoP9UCXbIXr2Ac8ao2
         21VA==
X-Forwarded-Encrypted: i=1; AKwUvBwkojbyQG6bZJdn1pjmI0/2QFl3FTM+81w4jatnpbC7FVXQkzKrykDpwerl0fhog162l14X9xft+BWk5pM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8r1/illQxyTZF1rRDtD7mRgTNFzXhWjoneP5uX3Nm2Ov+EpLsi
	o0VzWPFKpDGHoYlstmp9/C0mOAWAMI0WXTSuRbsAdBh2k0XQA0HWgkkw
X-Gm-Gg: AYBFou1k1QBG4/Uorc8vcO+dTYtE13HtOwe1ixpPguiMBTCodCyqseIcvAmCVPlqcR6
	KQdieU0g76y14BHDCXlEgvjtyR7jbY9h4aSio2Cf0Z+1WbJMrkTbxHOPQ7FqbpfskhXe9+qkCvv
	DN55lPTV/uO+ftqVdfPIsB8thRQCcZkQfE3gMooc4b3M0WrYGDpx6bQ1hOaxlWCAgT4U7gj6Gu1
	RRnzfH97CBMkTxovuK7u/f0JywhfFn8s8Os6+HzARcR0t9IXiEJbaxSyZoRnSfhoml3GtyLJDn+
	sYLNM5jVyiS8DeeW8y36ioM8EfeX32n9796fgZZj2ZSU07ffs/eA5XZbXH8iyImPEIuKrFJXR94
	fbqur0k8IK3Fpl2AqVVTQ/IJLZ9kKhYABNJAR1fFardPWnG39Q9VsBjwmIaAv7be/QuFQxUPlup
	AAnGZreYNXBftP73vlpt4TwhSPeGTu6E8voGc6BqabzbsqTCpDZKeTYnJCSxFsdaM812j1ScVrf
	EbMMCkds7cIeU5Gy89DAi9FX8x9Osbq0BxBJxKPniqthXGcLLvfmD4qB1bUH03PiAwwnnct3d7l
	Aa2jMx+wuJik+ce5jbAAxLyhJP+FPqA=
X-Received: by 2002:a05:600c:a013:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4b6e054964cmr57690945e9.33.1793999597217;
        Fri, 06 Nov 2026 13:13:17 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7950206e3sm11271025e9.3.2026.11.06.13.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:12:57 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: E Shattow <e@freeshell.de>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status power LED on
Date: Fri,  6 Nov 2026 21:12:49 +0000
Message-ID: <20261106211249.73440-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d051c5f2-3df2-4eeb-b324-6e9ce39a6b27@freeshell.de>
References: <20261106184055.3891621-1-oo.hehir@gmail.com> <179fe9e8-322b-4745-8734-d5de5f1e8487@freeshell.de> <20261106195945.4157095-1-oo.hehir@gmail.com> <d051c5f2-3df2-4eeb-b324-6e9ce39a6b27@freeshell.de>
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

Hi E,

Ok, fair point.

Conor, could you please drop this patch? Apologies for the hassle.

Owen
