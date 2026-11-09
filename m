Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212578;
	b=VUUMP3njJaS1ZtwVyRDvNA3Q7MedGugG/YmkTqGGy7sHLQiiXBeYo4pneOvDXp14Loq5
	 mKJwcO/YRKXVvvHy4lAVLPvv1Ytx6uedEyUMDnkTJuHpni5sX3KU/zxN3kgdEPQtmiDH6
	 q43fmiU3QEY8qcnPX+qarfw3J6RVqpwc0naLE0BP8Ga1koqEtINlyYicDFvqSZrfy8RaR
	 DO7F3WLQiJUQfeaWZgjcm+Wd05DhPJ0vPllNAX+xuwYRlxyShVcb0QWQYigcgVM/BzhyV
	 SfQzVSeNW97oSNLJN8GGYyitzE2QhDR7mkkfMkryGLTFsFJDpx6WgsyjZ3GrYKyaMoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=NxG/u4u9BGu7G5Ao9Bh0a6rRDz42atbNH5H/yOM96FE=;
	b=YJiLImhCH1NLOLgZLlukog51KOIQ5WxNKVklryEQ3MZvnfAfBC0NcIGioyhr3kbetxa6
	 esL6SwzyRrFC+x+pP3yujkqjhYyjLJpfxA4xr06TAdIrUns2rOtNXp1ExRAC4PQDmpssy
	 KQy6VtzIrjfF3+/8rv3sf4i5AwvPnPeOQsTDKgI4g30uLuLRgU8kH0011GQjw+CuvCIlr
	 onTR0AxNGC6dMch+l2IJ+PLnqApwayLvxVA96MDBThjBo7snW6ln9jyqOT2mcf88I+XFV
	 FWuF/54g6cC5rfibKETtp2RNUmtVdrGVUG+5/yw84/pcokUvjEQiSkKzTo+uK//lVsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=e1+BlNEK;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0571B606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0571B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=e1+BlNEK
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so3512935e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794212575; x=1794817375; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NxG/u4u9BGu7G5Ao9Bh0a6rRDz42atbNH5H/yOM96FE=;
        b=e1+BlNEKoOVHMw6ZSYrl81mAyS7B2vn/1v0q7Gf7iW/Bx9KkfVzP7lP3NzS+NntQKt
         vbAFvzpbBBpYbln2KjMEu0tDc3qFDoQLypFkc7AKbCrVUXK9g3karlx/nA4xxV/s8Wv6
         xFZ6xqijOIkjuVxXCCpQXPVq6UFjp3m4BskCESh+D9/JW807grXeyGsSKMrKVumI7DDc
         ecGK5jMnZkGCRlZZ6KekOWwpeTa36+34iSLv7FkdO6oOOGcTjJA6J2XpeKZKuFjnMNaE
         5+OMU+vpRJa8GmLErJY84EIsp1bZrulLwbRaGGcrf/4qMnvH291rP+xxoydSxscspelp
         Dr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794212575; x=1794817375;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxG/u4u9BGu7G5Ao9Bh0a6rRDz42atbNH5H/yOM96FE=;
        b=PwcmBDW5BICAkTiMi6avJ2MuMTgaDarno056U7a2UIN+QEV7GGdi4BM5s+VgY6tNaU
         PQnfZYPbM872raF33qQQN5oHwAukj6hv6coQog0MVY8/7ohj++flJQRG3Qy6Q4CvsOUU
         FzrL6NvDUqXZ+xa6/BoPJicCiPsA748iO4CvIQmDlV/SlHkdfo10reCwqE7RKSnq76dF
         nzf/KZmqDLbp4R8QtZ3WSdU0xn4NcfzNTFA/IPOAh4NoKmzbbJ4by/X2APuBkOuuE/yr
         vlqDG/Iu0fVvl3Vk9+RLDEBqQdRfyFXNHml9OP4oyV8ruWYoni6+9vNQRNybIqqAnlwR
         mTAg==
X-Forwarded-Encrypted: i=1; AL+hErH/Uw/bNdjqYreAKnnvEtBDPbgVmgCZIEN3Irxb5y8C/u8Bda0182EV5dnFirCHQJIY0RvdgJroW1JBtZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rEBR3+P7a7STV1KjGtzFNPkcysyc3saOrSoGHWq9LWqG/HSTM
	8QJErzaOMSfiMxqEVv+cmcwHcbrLPJqgDx7MQgQ5Zve4it6MlSwLkls3qfdoT/4klJk=
X-Gm-Gg: AYBFou3FOqFSy2qak6uA5QyLLVFc0SfBCz4vcTgtbJ1rYKmr9qBrLF7Fv5fEALgGczU
	CzPILuTd55JVl4YQd6mQhhsINwCiLwDFfhkrNk2AmRiJOduhrBj5UI70/iM1V/IMRgMuSje8Vg1
	pBgPZGWPg1/x5CtFYFNoa31HkcXw7vDFq4xaWaN8uU3x6WJB5tkWPEPh/2ziMKjE0fO6V4QtR9P
	+DEyXN/dH4HbncfOuKuufd/7R8PPKKYH9NGVduYtVP3Pb6x/df+K2KXAO5F/jTHKZEBf0RMzOvO
	MfELARMADqISebdGaLMOeUG9MICeJVcmhYrwPovV3HAY5l5Y6BILgZfKhXGSjQ6cTqqPj0LR9ot
	SqOnwlyolE6xpEUZiTdx1AUkVq8CRoxn3DJi5sW6ZCpifYxZ+FZ5o7fORu+Pfu3LnZ7HaRA3Ia8
	PFq7V507ugtbEvwP9akJUpH2wxPKyY7AD/DSKu5L0sSp993Re5aQw8QVWasVaSHJoT6+XsSGf0+
	yYev2bH83DEYjA1Ms+axjWCQrqh68ddNL/KQ6rF0q6dV8TwqbU8tEr8zV5I1R6xu35jGU9cvvDv
	Yga3aESIERhohpiSTlFNb83ylP8=
X-Received: by 2002:a05:600c:1c23:b0:4a1:f736:79f3 with SMTP id 5b1f17b1804b1-4b960da4ad3mr74504955e9.5.1794212575442;
        Mon, 09 Nov 2026 00:22:55 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f1117fasm139701265e9.13.2026.11.09.00.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:22:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/4] ASoC: meson: fix missing REGMAP_MMIO dependencies
From: Valerio Setti <vsetti@baylibre.com>
To: Jude Gyimah <jude.gyimah87@gmail.com>
Cc: jbrunet@baylibre.com, lgirdwood@gmail.com, broonie@kernel.org, 
 perex@perex.cz, tiwai@suse.com, neil.armstrong@linaro.org, 
 khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
 linux-sound@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261107165527.576383-1-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
Date: Mon, 09 Nov 2026 09:22:49 +0100
Message-Id: <179421256915.10992.15316919043567627727.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=502; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=N6o2biIKf/6AqsgDmShn74SQm8T8RQuwU2MQPtShIl8=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFkfm27vnJKjU7tJrMtO/JTW7R3vjztV9PvXdLJdz0vgi
 7l76NTmjlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAEyk8QbDf/9y36b1mSGnD2qF
 cz/nW+su0sFV6up2+uSmkEVTsmLTPzMyXK6okvrTo34y7vq6ezOrj8iF6VfY8HHHl3BErQ31aPH
 gAAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

On Sat, 07 Nov 2026 17:55:23 +0100, Jude Gyimah <jude.gyimah87@gmail.com> wrote:
> ASoC: meson: fix missing REGMAP_MMIO dependencies
> 
> Each of these drivers can be built into vmlinux while the code
> providing a symbol it calls is a module, which fails to link.  The
> same shape in 4 drivers, so they are here as one series.
> 
> Affected: aiu, axg-pdm, axg-spdifin, axg-spdifout.
> 
> [...]

Reviewed-by: Valerio Setti <vsetti@baylibre.com>

-- 
Valerio Setti <vsetti@baylibre.com>
