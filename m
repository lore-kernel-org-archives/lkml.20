Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792985899;
	b=XdByq6mMTu0VHI0qnzDWkUReZGcPqwre/d6xQ2qlEaaKNQIeJhD6A9I/TsSrcboTJV6y
	 MWBJBqhn5GZYXSsn2cN0Y90+4dQOWoJgQmZBw76WXlrvbxqb6ZLQRGlhz43tDI8Keegxc
	 HoYo2vDJIuVn0jvusYkEtidXdxRGv5A7r6G85UYpP4/FHLna6d1jqJcpwy+xAxBNDUuR8
	 EZ1dcQY6GS12sOPWdIhsPn3spCt+FVzxjkR9VqvKBnxtA3IdujVeleiERLRMlatcUbCSb
	 DsTLSq5bsC5Drt6cxx9ABgL3ustoT9R/9WQn1Uchjz4En+jT5Y0NKF7ieG+AoeEA7Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LJ/LLdUvbUXDscVG28+mEznHp6VW8smsqWPUjig3N5U=;
	b=Z8j4frI6AnZ0pyeL7P1SwWJXApKoSQAh2yGvxle3y2h/45uqXYooaNaMNb8r/hug3wv7
	 Yhm9EXWjD20g7U6fueYyV+6yuSzZSgSoza+gOFtZxa4fApAllv+bXHpE5E5TWxikgH9k6
	 v/0y1/3OB5QAH6pUZVnFMYMZIgbL0LoS9zR4oxMVcmB29e//7gssQkfz+RgY6fOFgo+Kk
	 cxb3BGt+8Beo577VkYqaUe7oQa4fdHPxQIfE7mX2ujX7fw60MxOYUqCz2b2WwVLN/NON9
	 iNJO0jCX/zd6D+N8NshbvNXdfqfOb2esa8MX0sJMO2P92JWs5bElR+EtQziO9JGUhoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Uweb9oov;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1684606A329
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1684606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Uweb9oov
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-89f85edd210so745497b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792985898; x=1793590698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LJ/LLdUvbUXDscVG28+mEznHp6VW8smsqWPUjig3N5U=;
        b=Uweb9oovCFOPVbjTBnMFzyJ1Nc7wOGjEHPhUf4YQFw3iAwtiQ0UEl4AoACdSZ1bmSq
         ROocwGSExTI9NBgmdQuvQssZRafLezdMdfqAP4Bc03MOy2w5YNSaTn0sxwfedb1NcW3f
         v2XQkWB6TJkPB21OOEjzj6pqK14i1QVE8j+6sSWqouxzgd8tmxwn2GrUWTjUlXpSIK/s
         XofvlStI+fb1YhEEBiRbjVGazw5Qtm/l4YLoVzEKl49fJaVMIOBqXLYABdhr2/yTkSTj
         w48O/b4PfACywXevHfM383vGzSscaEVm5wkNwNdF82MAEDlVwC7xw8RptDMWVK/gxrYe
         fYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985898; x=1793590698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LJ/LLdUvbUXDscVG28+mEznHp6VW8smsqWPUjig3N5U=;
        b=pw2zoWBLJySIk3NKjDsCRcJpPclooQIXnAGhp2QXwTh8488e3pF0XxNWEL0ONz4mGm
         nQoWcqXKXUqjYn4BTbkWvZolDDBeZO4fZJnoMjwVxxS+O7p8Ol7j7yE5iPR56Ur4xf0T
         lwqi29wEzGN6PaNOtGgi6hMqT547dvDqeunYDlnAKd8Uig0fakPpzW6EDHpUVtyVGkmZ
         Eg72daKN7PZ4WNqtQKj34KIXh7q5pMrA9jsWfP+Iue7rokApgr2kkCg482NB2C0lf0pQ
         EPzJCk+P6pnyQEj4YUmj3WgMC+qlfzty5LkiuuAWyDt+KHesU+3c8zQWQVH40F357GxJ
         sNHg==
X-Forwarded-Encrypted: i=1; AKwUvBz35r4mSJD7yxXs29ZxghVoUHYxQQ41r9dIUTR84sBHnJcjHdzmMYYCcOc7M5JLjKqic5CnWJwWF98fVgE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/UmGEN+SlQCkG/4vpWY1u5eJF8GJBiQ1fnuDZQHo99l//EcSL
	T97XwgPRQ3MebQcGFo/O1f7V6LvfKcaop9XiU5hpN3rWINiP67xOmet2
X-Gm-Gg: AYBFou1TYwmj9vPjFK2I2FdmzA+C7+3Ohio4GEbgwrg+djeTZcCb7+AoA8Zz9niDRng
	86eB8FmH05xXhLhckpDcvV2LMBCf8Mnomf+iYzSQefwmwdu3VvtWJnQlvM2zVZ81ZK3PCYeHSfM
	NiKWVCIjCBr+omvo+iAB4pTpY7bAiGet+HO1zx8+6jkTPqZkvIcmP68C1xET6M4JkJakBHbfZCv
	ZiF2Kmvr1Qv7Xd3F/5qgPY+g9i297TC8wWUbifijaypbXjGveVkLn4QQ5lyGH5UTJKdIyTgAvmq
	kYrA7V2bD12sOZN7Zzxa5WZCMBTUI2fSddj8hdg5YiyF1I+aiRzWHx2oqAMoZR8vRI5dLpjdDUU
	yTzceePLsgZhSCoSinaAFJ7dHHTnO9/dkz+T2ODlJDzy/sNsNm/VeTcbZruf/t4u/I84i3JwvJz
	0g0IfKvWS83cC0uLTcKogKTO33UTadcKC6wJJJTlIwmkOXVDhyOLuBlk8IxNDfcrboWhnt+9EOP
	akigSb+Z6WKEPjxF8gN1e+iVc3jrwVVAKzxRTkSttHfYKmElOg1kEBI5mhU1xYdtgs19/Gp7+yD
	uXz9eByHNVY6oOOFvAVaFUM3OSQ6OHBPGGEfE2GRIDgfZsWzNQh4uGShRbGv/en1NkMmzuz/r4F
	+ku9U5rhYQcTHsNRQokvjpsTlZxGHD41/0T9bKRo7M8x6Oz5pTYGDW2Sw
X-Received: by 2002:a05:6300:6bc9:b0:3e1:bd77:2c92 with SMTP id adf61e73a8af0-3e7cd4cbe1bmr3717741637.68.1792985898172;
        Sun, 25 Oct 2026 20:38:18 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21017sm989192a12.10.2026.10.25.20.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:38:17 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: E Shattow <e@freeshell.de>
Cc: dlan@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] riscv: dts: spacemit: mark K1 boot nodes bootph-pre-ram
Date: Mon, 26 Oct 2026 11:38:11 +0800
Message-ID: <20261026033813.432250-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <813d3f4a-66a9-48df-b9de-6a46b9388d0a@freeshell.de>
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com> <813d3f4a-66a9-48df-b9de-6a46b9388d0a@freeshell.de>
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

On 10/24/26 07:45, E Shattow wrote:
> Split the patches in this series so we have a clearly defined initial
> changeset that does "Extend the BootROM configured peripherals to device
> tree bootph-pre-ram hints for any SPL loaded by that BootROM in SD,
> eMMC, and SPI NOR boot modes".

Thanks, that makes sense. For v4 I plan this split:

1. BootROM: the fixed clocks, the clock and reset controllers, uart0,
   sdhci0, emmc and qspi in k1.dtsi, and the SPI NOR flash@0 in the
   board files.

2. DRAM setup, as an add-on for Yixun to take or leave: i2c2 and i2c8
   in k1.dtsi, and the EEPROM, the PMIC and its buck1, buck3 and aldo1
   in the board files.

> Capture all the BootROM SPL loader flows
> that we can understand (USB missing currently? please add this)

USB download mode goes through the OTG port (FDL button, then
"fastboot stage"), but mainline has no node for the USB2 OTG
controller behind it yet. The DWC3 is a different controller. So there
is nothing to tag for USB today, and I'd add it once that node lands.

Yixun, could you confirm that the BootROM uses that OTG controller for
USB download, and that it does not touch the DWC3?

Does this split look right to you? I'll send v4 after the merge window.

Thanks,
Hung-Chun
