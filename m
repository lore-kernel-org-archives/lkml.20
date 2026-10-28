Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186925;
	b=PcgCzZBUrcs+I0DCGgrXMrzASDNJSjWD9iDUJuHG03pcLddFmkvEilvDfwsMyFuw7/Q9
	 lZvKcsd1jcbtCAdi7HiyBe63Roq3OCMJpLieO3aumeq2OKMSCQlYQnV6LATRdZ6q39MSN
	 byv41z/CJw+0w25hMSP1rRHRK8kaQVusAIjp9r47F2g6WEdW+zFFvVpKLVGn5i4ZEqOzG
	 UWT3dxCz/bxt2dUE7780/tBGIVfeL9rFpweUoBYV8wHn4uDGlKlfWrJa6EDv5q0Ap+i67
	 bT+ZAzByjv6CG+jkogZHkFwN3Cugf68P0hDI0gNVpF/V/NLE3yqBR1wWbuXXJsFkS6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6ycmAB6PxtVDAOSxkc4Ku8pcl/F85BhrFwHWXHoa634=;
	b=uS/uUEnxjPWUIcTvJJBOrWQdKvOUTQdH24ZUAZYDmNkLCDdYNmUNA2a6BH9ey/k2DqUI
	 UWuNOaNuZGOJw8x4vFf8lksmMLh1tv3iGy8XY5NO2wdSPL0Vgg2B788q+mqv1gsiT0KD8
	 GsnOF3SgtQw6VJJOu1529KdzViqWcB2SJQ7hcacesV9NB0i3VRwas8+gAwg0b8PR86cG8
	 q3QmR/nYazXAbRRde5/uPoY5Kb0UY75iA1sSFEN42H4b9Zq1cPuw9i+2Fq1Pdg2rtjNNL
	 zVU8E85GEp9JF8Fx86cBv0ptBFIhvkJOSFTZvTv1k02Z0mSHii2CFXQPwEHNnCG8QBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="D/k1N/1h";
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D331606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D331606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D/k1N/1h
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9d1114320so5834325ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186924; x=1793791724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ycmAB6PxtVDAOSxkc4Ku8pcl/F85BhrFwHWXHoa634=;
        b=D/k1N/1hhxjXCeizQ310bdBkvpa8x8AaKvzGAZOwe4dZJwGMDd9vIN6wuKr4OdhI0R
         LaBsy6Ew3IO7jzHKeyZeCBIZ4TBova1q4yqfOJn6ko8/2sx5cZFNmeGkRbTvpezlMBH2
         Up3KelZCRnBWf1UJ5i7tRe3goFIyOTpHCxYe/krLh7KUp9WCjWmrG8Y/iVEzY1CkBiz6
         csm3pzW2MbyfTLTCBQGVI48NRKrjuUVJzEdVKJwkQFjzzMggZccx97jNR6cYDUOg52Be
         xlCL0civtopK1JuISNpPFiIx/3m+tLMfvdevW/YJZu/pWAo254/NwzstQkv4/cZsCDF5
         ZYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186924; x=1793791724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ycmAB6PxtVDAOSxkc4Ku8pcl/F85BhrFwHWXHoa634=;
        b=hsj3PE2XEKT7NTaC3tyEajtLQvuHF+mAlMtGvGGkdCYVfgif3hQaJUS8itGzNEJvLN
         4lBMLIPky9/W8zQ+OSXgS9o65p5ezazSYOmExn6bGj7u5+p2Ac0MT56hsk93VYF6z/RA
         BKmzK4PjOZPvxUyeiHGLKwNkxMj0O5QqCbglrUfof7IcypJBKoADe+MpupTTS6C+6tNL
         lFirYlvI0t5TFWghSyzttbYVqy8f5adKumClCSk4CuKo9VEA8G/Gg/1GUubhhzBYAL1R
         XRFnDiKwevllfUolj7QPi32k11T8jPfKzcRhL3ZvYViaEBJQtmYBKesEXdjz4Cb4sl+P
         DqpA==
X-Forwarded-Encrypted: i=1; AKwUvBy621atm7yf7fwljN57dHjNzqKW65nJRIDA+BZJMofv7H3JSoeY0zGjsf0KU/mcUPyicl17fVoZgUu0X04=@vger.kernel.org
X-Gm-Message-State: AFq9FYIquZf8Obd9HqoG4ra78MNg5dOs0n1JNFEPhgM9gBfjJnmqtkTH
	cjlujQWe6xoo9euieeyNtXBUPXP7Sqc/HyHaad84H5c0KiW9Urc41ArA
X-Gm-Gg: AYBFou1HtpuoIvKBa9HZ+TUzy3fzXBIhDCBH1P/YKX3duRYFE6OL+acB7tSRmsH8qGY
	DDJbXpIwhGf9zWJB620KPSbWHiyEwHwly+hQdxCA+8TR1DZHLTIJ3kDdr6j68J8yG2xaqXuztAC
	oc3owgCqT2COXZ9yU9Xx2yeeKF/An5a3+ISPjt83z1TsUnM81Zbzuyk5GWv+zFNSFZipkFH4aLO
	REIrbR9uM4dStKARz7MgeV+eoWT1vMJvcYh2do4KFPM7Ss+GBaMaGJLZwq3Sa3QejktB7mwboIe
	BL1KWhoOOArCQdITHU0CcQphVw4N/kHnY89Cxn6UNaCwxNitwAL/TRpeXdbtGCAjKDyRWROh1E3
	iYG3/e4Qki/NFc6OjJhc6tRXqGctLp8nnKTetgV3viMiPZCZPzZeniIO3Ia5BLdvUTh/4HeptFN
	+ObWIq7RmZw4cc2K9itk26Xslo2ZGSOehZuVjG+SDSC509iOc+4/LnbPADCbucQWHI18xTwCggk
	QSn0RbGnxn4gdv/4ILMQYrdWCxRYJ2wOu2GkYg+T/NMtC8jUxQwLLgAopEtG/7/w60sGSdsKoQw
	l3uWSbVGw5k=
X-Received: by 2002:a17:903:2c0f:b0:2df:991b:4368 with SMTP id d9443c01a7336-2eb004eec42mr21869625ad.53.1793186923460;
        Wed, 28 Oct 2026 04:28:43 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b76dafsm20128745ad.18.2026.10.28.04.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:28:42 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v15 6/6] platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile if last performance profile is not available
Date: Wed, 28 Oct 2026 11:27:42 +0000
Message-ID: <20261028112742.674847-7-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112742.674847-1-qby140326@gmail.com>
References: <20261028112742.674847-1-qby140326@gmail.com>
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

On Bitland laptops, performance profiles require an external power
supply. If the system enters suspend in a performance profile and the AC
adapter is unplugged while the machine is asleep, laptop_profile_set()
fails with -EOPNOTSUPP during resume when attempting to re-apply
saved_profile.

Returning an error from the resume callback simply because the power
cable was removed during sleep is undesirable, as the device is
otherwise
fully functional.

Gracefully handle this condition by falling back to
PLATFORM_PROFILE_BALANCED
whenever restoring the saved profile returns -EOPNOTSUPP. Update
saved_profile accordingly and notify user space via
platform_profile_notify() so daemons such as power-profiles-daemon stay
in sync with the actual hardware state.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 3f8f1ebb10fb..a431d3fef774 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -392,13 +392,27 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 static int bitland_mifs_wmi_resume(struct device *dev)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	int ret;
 
 	/* Skip event device */
 	if (!data->pp_dev)
 		return 0;
 
+	ret = laptop_profile_set(dev, data->saved_profile);
+
+	if (ret == -EOPNOTSUPP && data->saved_profile != PLATFORM_PROFILE_BALANCED) {
+		dev_dbg(dev, "Cannot restore profile %d (likely on battery), falling back to balanced\n",
+			data->saved_profile);
+
+		ret = laptop_profile_set(dev, PLATFORM_PROFILE_BALANCED);
+		if (!ret) {
+			data->saved_profile = PLATFORM_PROFILE_BALANCED;
+			platform_profile_notify(data->pp_dev);
+		}
+	}
+
 	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
-	return laptop_profile_set(dev, data->saved_profile);
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
-- 
2.56.0

