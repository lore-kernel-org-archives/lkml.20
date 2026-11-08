Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794146110;
	b=F+LHR6mfPdtxqdMj8G4a4lRk+/Ng1ALjM5dW+UObpfASmoLL0EdPrgEsNnhFMrP+Fb7X
	 OvGpRxj6aMhvdHRtykUYVzjFcMaQIGRLuHLX9HIlKW2n0eNRZq5NcoAFkXKtJKw4crREO
	 GYkcVhwevqRf8wiZnbiFjNOUX/ft42LJ04DWZVyFxUaKkR/U+E8PC/QuSw01a5wu5ZqSB
	 t/4lFMmey/h/66B854VwOkcpSGb/qWSEd77dlmkbkrT1+nC2eEYExCOu3k2TBkGS4Y9lr
	 +DNv3os/BnMy06fqAeK34CFCM6eI3H/rr8AO/rTA4e3l/QMlo4Hz5atuaJOlXZ/KDqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794146110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZrQi1g6OdLGiF+LKKDzmGcgti9ywcdtVUbpGr7gu0lo=;
	b=FT6RrrfSFbXF/y8bynZkdX6lA7L9q6F7/SFRJSmhXhURGseakdQSCtKeijiP9IEpg13L
	 hBJBsJsVpu5XBRBfeA2e1Az+eJDjW/C6fPLB1Gi6fEwoD3u72g13BE8crmHFg2ohAT4iw
	 ZvewUNDZDcZ1p3+bVmCTKX3/0C0w3Ag0EInDNUsNV2E9Nn26gyym2wkpa8oCBDRO8lyfL
	 kRyTJF+/aBqDHZBqM58TfhqXoLvGFmKwu4cfDC+72+4WxZ6O+uYtuk52vw49R+2dgr45c
	 WuIU1XgDRH24gMG1ErBFV9KBKe89cP5jWrRpuiLAyx8qcMQNPHN1F3x1FgDcwPfXsfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDlPEdGd;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D30C606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D30C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDlPEdGd
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1438d9363fbso27741c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794146109; x=1794750909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrQi1g6OdLGiF+LKKDzmGcgti9ywcdtVUbpGr7gu0lo=;
        b=fDlPEdGdkdm2V//xQGcdwBBfa78see2JyYKGA4osbIn/cFgbns2dZwThmvKYCoaYj4
         k3fRJwv1HTeXDukPxru6r/tkJQ1/pkus3c7r8YX7WoNoDo+lMobNIJ8ta3+kWqIYli/o
         wDshfvWU2qSJksiBUnCZ6PB9cOP4CgciwPHsTtZhu7uqSS56blGhg+V0KYi9VtgFqCMC
         HmkCGh5m9ikqUrQP1J/awQh93OD7/RL+I0Bq/di6b1NaNsd7WTL4QVG3wRbAv2qJK16L
         CyG+tsvJsSiNsq2HceoTwTj923qeLiHB79FbiONrkWqHtX7zVa/BuvQDDRSrNDfrDwPm
         e9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794146109; x=1794750909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrQi1g6OdLGiF+LKKDzmGcgti9ywcdtVUbpGr7gu0lo=;
        b=zVFUxHIRRLuKUCSE4r3DpbgsSpMPfqTSPhN9wJq+byGS13eTTR5Tt9zM6aAvJnZgSf
         PsdEbYXx9rrlCJR0y/QDYjIxM90x/d8axzAneSLh+F7VCO2GEX1xwcVy2c74CE2d0sJw
         bpypVOuwKHHbBE5wnSHJ3pMlAEVAHtUfYtqo1xDVNGF3yY3K1vqXzeLPpPO3R2UhZY+P
         grUQKFaKuegyTVykj4CFksFratdvj5Mys7zmSMoYWBarHqgnbXNPbWJzjLuQY68p0Yks
         gMEH6UOetp/4UZj8ceYZfBtmkVvL2mOa4jgCHThiHlFnPTnY8+83dvl1SpCH9Pek/Rjs
         2E8A==
X-Forwarded-Encrypted: i=1; AL+hErEd2kTbCG5ulX9xyvqLSY2HVi5SNYbdGrutl+OY27Z+O6gkvlXdf+d8XXcm5c5EHswpsW9ZDi8rfMMm0t8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QaopWggm192MGnWVMW2ny7VppOAS8YY19qDyr4Tqj62ZyJpvU
	nbQk1nUWPsaZjor1moZJ1Wdkjva8ZjxqVio1qfjY6+jy0gmrh5HJcuo=
X-Gm-Gg: AYBFou0AadD6yDOxracCnDkwQ+8jJ9vNQXj1Ht3/AMMhVxyceozQik7rFo4WxvsABE0
	QOHPAnlyWTtmqQfngNy36L7/HmZA/K2MZq+e8cTiOZ3EWC1XYZcZ4iz9kWnwPoZilucMMjL6R1/
	cl5ckl5C9Ya5Ek1zasbuXo4DyueeaXZVm25gw0nhh847oMdRfTRdv/iVPrrkmg7vPKgs298p+UI
	Ywcx11ans4FrkbnYBmelr+eLIP2MtPkRSEOC3myMiEjKVMFGwUP3NLCkGu+OCpvNckM7q5eX3Cp
	znOtijqNrSx7lJj8D7KyrkTtIoniKpqR3+wzj1AHu6sf5lyx3CVQ6j3OW+RKGsP3CrPD3nn/RZv
	zrM6OH7UR5l4L0RvELHlPX/yrTGlc7haa95axbu2q/+vpmovw2I478FV3QCfNNTldzu+9NWpLiG
	pxWUxfKklvybNARRXWphtkoiyh9Nf5Q3+szk8wJOiOXWeSr+eOAxIa0JkbuLz8LiLIzfjfSMq1g
	K+3550ltVXNyik4bgYCSc41OAXB+4nuh+rPKDZecvCUcpYvRzhokW2yNd203Qj/WhM92lvsN3lS
	AhyO2mn5vbLB72eWweWcghwPwBbG/UzdBBCqdXIEQQ2BwWYuNA==
X-Received: by 2002:a05:701b:4541:10b0:143:808b:b178 with SMTP id a92af1059eb24-1b269b4afadmr6255495c88.26.1794146109329;
        Sun, 08 Nov 2026 05:55:09 -0800 (PST)
Received: from localhost.localdomain ([1.251.173.69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8838sm4986060c88.8.2026.11.08.05.55.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 05:55:08 -0800 (PST)
From: Hijae Song <hijae99@gmail.com>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: ayaneo-flip-kb: Add driver for keyboard backlight
Date: Sun,  8 Nov 2026 22:55:05 +0900
Message-ID: <20261108135505.67330-1-hijae99@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAGwozwEKXJGBY5oZtdrrzfK-aOyYu5GaiOqkejSqbCPdeq0UJg@mail.gmail.com>
References: <CAGwozwEKXJGBY5oZtdrrzfK-aOyYu5GaiOqkejSqbCPdeq0UJg@mail.gmail.com>
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

Hi Antheas,

Thanks for the feedback.

> If this is an actual keyboard product on the market and Ayaneo is
> sourcing the part for their device, look-up similar devices and kernel
> drivers.

I checked. hid-sigmamicro only fixes the 0x0059 report descriptor, and
I found no SiGma Micro backlight driver on lore.

> The name of the driver cannot be -flip-kb. You need to make sure it is
> generic enough to match most Ayaneo devices.

1c4f:007c also appears on the AYANEO Slide in hhd-dev/hwinfo, with the
same vendor interface (report ID 0x41, 7-byte feature report). I only
have a Flip KB, so I can only test the byte layout there.

Matias's hid-ayaneo already claims 1c4f:0002 behind a DMI check for
AYANEO 3. Would you prefer that I add 007c backlight support to
hid-ayaneo once it is merged, or keep a separate driver named after
the chip? I lean towards hid-ayaneo, since the Slide may work the same
way, but I would like your view first.

I will also fix the two sashiko comments in v2.

Thanks,
Hijae
