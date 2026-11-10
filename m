Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297474;
	b=2GjMHMeeeV8FlCBFyuWS8D5NvDphYt6TubJhOwlqYdgEnuEPhikYrCEn5akXFtYtEd59
	 X62fnM4n6alPXSWLDK3qXLPLTL1EJF3mZBDmYEE7BShaRsArmslKWdslXED2eTsqax6O3
	 SvxxoVnNKXY+3jYwAVKAfDsOmAgdLHG5yUbsgzXLPtKa6/+KNSZLmM9+ArEnvykTz80Aw
	 +bk7pire2BfqjSjJuvEKxKxhNs3OLKmnTT7J9IRBujnp0Kz0NQo6q//t3NoSSCIsqPTK2
	 6jNI6AhDKxrujWlMYAokS12Y6jgDd6AnKf8w+8H6MtcNZli5ozOAOv3NjSlN4g4yFaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297474;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Bh9PLp3fsMYJMJTRrDf+gKXw1r5bvWitb4XoPWpFjfU=;
	b=cCLLHSQnm/N/Zeede6xDGdYTRNXBBJf+JVvsnPR+nH7IJKaNVn5JElVoIaIVIviTh/kF
	 3Lsi2OgHFJgr9/TsuzRnPd+QnOpXex0XUtAIEc4vlX72AbM0jgqXBkhpcNwDrgtrHwO8z
	 0eF6X02tpJ7h/rox4UGSUdzWiFVCJapJJkS47iTFY5wvLUxE+GTwtvIpke50O/3LoL5CF
	 4gNhr/Y1+pBlyW42MpXIv0Sp+ZYEUNf7gf90zJzZe/D8KASjJzYj12Y8saVqSNYJVzBEt
	 dzfP6XxPSGI6ilE8pqDUuGS5vhqmiIiOMrVE17jB+KspwrqAHsUV4NUURZTDbGfT/6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CCD606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1CCD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eac01ff101so583350e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:57:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297473; x=1794902273;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bh9PLp3fsMYJMJTRrDf+gKXw1r5bvWitb4XoPWpFjfU=;
        b=lxmSLcB19sJeH/hssaVIyr4t4FcRn3HlXsbw4auWuCBuoDyqLlBrpITM/HZRO1u3DD
         CfuxAcb/jz2FFoCPiDPqYTJi+aMxt2uUGKFGOhLwovG1Tp3ywoip91qjBN5Q5mBNb8wJ
         3HmwOZiTT8KrjzH4wMIckvpmMWmSRjBHwr+UrfIJA35C30gT4Nw2bOyC76zYzh21i/uh
         vRtpfwcIQQWNEvFK42podPy4WBm8BqQiqT7RhX21UiYNDZyUsfjY0C5yvT3v9UioQNLd
         GjvI+21Bf4fJlnbzjGLbdXzZpe8Cuw31gJ2UT1ZKTu2FN3Jss8Z12bbki9SHF4574x+3
         RKBQ==
X-Forwarded-Encrypted: i=1; AL+hErHJNx1NTJyKPhL/h5tAXbdAp9Z3lfgLl+K/mEHuuSkTjjM7IC8kREHCtn5w8js2T2r6Kl9rjm5sI2br1Y0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zfplqnU92H6gpKDwQZrq/f4YN6sL5XkJ15r+To4VRGV/u/ZPa
	h2YKXoLfm8OUdcQwFaInhv1bMuiRojcexuVf9SnoZl0pEOPnX/cqsrsXrezc7Gby8ag=
X-Gm-Gg: AYBFou01qTPU4zYeOL/Wmnx/wDMS4MA5wq1FGFhsRTPdI+j1P4YmqSyWXE/2UdA+Pk5
	0IyZpE38mYZAIlyyAkJwwNT/yoiWQCXb3UOphmVTEof9Cv3fdS63FwJjmpIllVoh4Z8hsZpyL9s
	Gzv6B6WK7IOSD5ps32KDr/VNaZv1Jmhl7bi9TrKg4uf6mCuKuUtInLFkbbhSfWXhEMyorSGa6Mw
	tb9FgfBDh8Zyca/3RitgiDwjDvcwWXkgv5GWg8qkA4BfYiFoPdqDLxb9k4hQ5oplpB3Ur5Dx9XW
	/ZAQEjdcSWdZfMprrvCHr5jj0XZ7KZ9zsWKmwLjM4IvcnQE+CewAcgkqoUQvoTQrvZn5fN2360F
	FtviHK5ErR7A/yqZLZWPonXD/w6qa5ZF23xvHCdleHvu5m4Bjf3t5a4ck8Comlu2f7fyr3EerGj
	XppoueNyXm7BIyKQXqbjRYqfKTMv1+HbjiOt5mL4+9gQoW0TBwYC3ba3Ghigs0AezUZv2jLwGx/
	bgeoP99cCQuleEao4pBPB/AtKt19cqJ4xMVhmuMqbp5X3wJH69EYCG1EZ+v9giikMuI4e0vbCG+
	1tuRFi0xvO3lCN1M3VJ8wEENeBE0pCYFtCkTGsjW+Bs1dSIim79o5cCnt+y1XlLi5co=
X-Received: by 2002:a05:6122:c8f:b0:5ea:d14a:ef8f with SMTP id 71dfb90a1353d-5ee0d0a8883mr629500e0c.4.1794297472578;
        Mon, 09 Nov 2026 23:57:52 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee0c5eedbbsm1267225e0c.13.2026.11.09.23.57.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 23:57:51 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7d2dbc0a8d4so616469137.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:57:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGGLL/SegUQqIHrfYGuS+QHEHiAF7H0FEOD1FBNjUEz5rvSKdcm/BtMq9EryPEvaL2Ka6ZFDYTbCVOAeoQ=@vger.kernel.org
X-Received: by 2002:a05:6102:4190:b0:7c3:2b19:6266 with SMTP id
 ada2fe7eead31-7d301bfd9b1mr443049137.22.1794297471476; Mon, 09 Nov 2026
 23:57:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-i2c-remove-dont-use-autosuspend-v1-0-49a08b8daf36@kernel.org>
 <20261109-i2c-remove-dont-use-autosuspend-v1-4-49a08b8daf36@kernel.org>
In-Reply-To: <20261109-i2c-remove-dont-use-autosuspend-v1-4-49a08b8daf36@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 08:57:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV-2XT7Npksv2om+ZRxOAQJfc92VpLD4sPeoj8AgKUU=w@mail.gmail.com>
X-Gm-Features: AclHuK9JsEgh5r73zJDHAyGi1UgY8FApv7iweIjEvmBZD0LvfpJpCmquM1eWYd8
Message-ID: <CAMuHMdV-2XT7Npksv2om+ZRxOAQJfc92VpLD4sPeoj8AgKUU=w@mail.gmail.com>
Subject: Re: [PATCH 4/6] i2c: riic: remove redundant pm_runtime_dont_use_autosuspend()
 calls
To: Joshua Crofts <crofts@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 21:51, Joshua Crofts <crofts@kernel.org> wrote:
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
>
> Remove the redundant function calls.
>
> Signed-off-by: Joshua Crofts <crofts@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
