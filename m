Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535DE4078D7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074821; cv=none; b=EQCVFuBdteyhJsESGyrXa4DDQu+PlA/WY4XOII6yqODrtiBEj45lVVGwqJZcShzeRAa2kaRT7rRETB3FfobJvmFakr3OryLDkIdQG1VJD5Rm6yrdKpnyAdS7Z7xJtTzlSrtahcTf9NRTXj1kABX++vN56ZBjQrJcXlKCsjG8GUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074821; c=relaxed/simple;
	bh=/0OHB51Px1kwmAioyURonbOhXzHFSra/T+tZss6z+H4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EAZ6jciwFxthQmfi06eMOt3onNsdOPa1CdUoWDyRnb3WQnsWwIhteeISDWHFk7Rzhg/MlCCaSlG/lLhe8TITQXFUyhyHLLquc2dpYqfMpaEPqdO5Cru2Igbu29fSmkWcxr/4aBCdS3wAVo0zHBqKjl2Eq1tJ1QfkFpi2ziAuRBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTXgxQSX; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTXgxQSX"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso56845385e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790074816; x=1790679616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y7qcpIDKckcU+FwnXhQhXsF99jpMu30FwevkL1hVHm8=;
        b=eTXgxQSXYLNbeq3veauTMJoR25hcNJJAbZG45LRWTaKufA5EjcDV7cCvNrBrzxuseW
         HymyG9nUpJZdasZn8coe9RHJzgW6H1uS4gIY+crbN1Dhf4JKrsvYx7fj7Ts/lJD07Nnd
         HgOkGHwo6zTQFnovKjxpZgqa3VP4I7OiqQILtR1h3v+AWtmnudHKYeUH/+PoI5Paz2YJ
         N5ylma3SSZ9g/5cCd9bEi2qLhI5ej4hXPdnsz2DVcvsPjQQAtXaRWIJmHkHgOGD4Bxm3
         ymOVZ3m0lDzniVbJE/iQNfMG7fgOclWZxyHXZztXLevvryGs9Cl5KWIUPonnRl6bM1vO
         XtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790074816; x=1790679616;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7qcpIDKckcU+FwnXhQhXsF99jpMu30FwevkL1hVHm8=;
        b=eOL1pG7HDCmJzW1M4MBlE2qlyMlXkJq3wShWqH1R+4Ca0U8hNAg9AV6zBmJ8DW0IxD
         NsVYVYRW9Z3Td+jFUda0EYwGNKNuqCSoM04kGJ6Yi4N03TN0UFI50I65Vntn8FTiP4m2
         ICDJvPBepl5A3bN101FnY+FoG+0j2hd5Y7s4il86C3ncWtgoUtFH01DQEecwleLI3eHP
         jUs/qplRehPAPQIpNkPRYoIBanQWPeXbvA5+QaJTyr2qJ/+yeKwHPQKwum1zYR7qBKNj
         5aHDeESyjhggDrj1YQUGEF1k/k9Qpq9JSzV9jEEmEX0UH+ie/zDcc1Zz1W0RUQBEyx0X
         fOEA==
X-Forwarded-Encrypted: i=1; AKwUvByhJnIhmzyaXnz3LqJUFlx3oxfCXW2HA3PACHPZ7lVB7gbVBnsAtZs+a+TFQnFBtfVxhCaRqAybhEC+bsQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lJAwugCPLI8BOJsVmrat+paJ8xbW1oqhGNfHQqa7V/YS3X4l86
	mEjrKFtT6cPEqdc/atQ+enmqAuzeyhFVHLrygWcZXzbxfVkxG1mSuuSu
X-Gm-Gg: AYBFou1g9Rn5uaCBLh6tBmKkpO1WPzx6//Snhieiij0l8wVF+95/7bqSN32cG5OyVhD
	mMMxfyLWn/Ewmp0vrFRtkgNb5rjnKMD9XJJfWUs9JQo3vFggyQ7g+nI3Gawxh/cf1H20eKZa2Dm
	STg/7wYcjjNXYmt9YA3zyT030RMZvRCMBDSDx4YIyEXL7PebwsYuxlaSevdTef5hQuZpC/mq4nO
	PTzBF1j3vjgVt9jPTuEkBEdO9ifNqi0V6j2XpsVtLcYjZC4fgI2x+kqr1reZ5TL+wU5eKhSrQrB
	9w2IW/huKqvHANkZftMABYI949zGu+ncRCH6ZVfZ09s3ywQ/NJCvrGmwbzM2nCIDMWdM2SSjpkW
	HkxtbybV2q6s1aNyq/PVNxIhC2BIKfKdPkIanDKElmIm6nrgbgH0WCRuwGCsZN1TsCVJlc8zHtt
	Nb/b5fPOkZit81Zq0uQ31L6ra1Z0aCFNzv/s0pV48vqvZcPpmcjHE2bz+tNSe3WDL44LHm4lucI
	0mPes8=
X-Received: by 2002:a05:600c:4e4c:b0:49f:bd3c:bc28 with SMTP id 5b1f17b1804b1-49fc574f456mr195177935e9.35.1790074814606;
        Tue, 22 Sep 2026 04:00:14 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fdaa4e47csm85599365e9.1.2026.09.22.04.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 04:00:14 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mfd: qcom-pm8008: support PMICs with no interrupt line
Date: Tue, 22 Sep 2026 13:00:06 +0200
Message-ID: <179007480602.173050.17097175603597060097@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922101459.GB2730113@google.com>
References: <20260922101459.GB2730113@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Lee,

On Tue, Sep 22, 2026, Lee Jones wrote:
> What on earth is going on here:
>
> https://lore.kernel.org/r/20260907-glymur_camss-v2-5-75f7982dc983@oss.qualcomm.com

Three postings for the same PMIC, in order:

- Nihal's Glymur CAMSS v2 (7 Sep) carried PM8010 support for qcom-pm8008
  as patches 3-6, including the no-interrupt case.
- My series (8 Sep) was a strict subset of that, written without
  checking the list first. I withdrew it the same day on the cover
  letter [1]; please drop it.
- Nihal dropped the PMIC patches from his v3 (17 Sep), and Jishnu posted
  them as a dedicated series, "mfd: qcom-pm8008: Add support for PM8010
  over I2C" (18 Sep) [2]. That is the one to review. It runs on my
  board, PM8010 with no interrupt line, and I sent a Tested-by there.

[1] https://lore.kernel.org/all/178887481187.4612.2819576206036967152@gmail.com/
[2] https://lore.kernel.org/all/20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com/

Sorry for the confusion,
Oleg
