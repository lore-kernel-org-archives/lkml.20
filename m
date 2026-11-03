Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691699;
	b=0D6OKzq3x80wMcTHo5j7ENk07QaygFh7w+4UOtHoLNDlAfpUP8nW/mjCw92qaJgika5s
	 I/C6bk74T9UD0BF5Ilz4FV0Qd/4CfIKOG0TxxbZ57Gke9Pc9bIJbovSJxd6nx44EHSLTQ
	 67dD7Cl+GvlZHClfNLqf713tEWJ1BBXBVDvg37CLUSNdkQVVjg4H6wuTGaMTs7DojF3so
	 b2IsBdTlXKg2KR8F7aIThYUrj3UEt93LzggmnSmFjT/AyOE9YQocyBmggwrip5MehaVnm
	 Dkg2UfuAKBBySj0cpHnSTb5gOdDD4nusLnvBqXRt4Dw0LYLV21xfOAGx5X7AzIDM3bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=sgKBfMXdyH3JiV8S086KL7jIltq3tXtvUnKZO5GkGUc=;
	b=fcCcma7pWErmMu01tgtVBKSbhSOA6dbkdMQx/NYawp769g+oj59uiKHjM+YpL4x3S3Hs
	 vk3ReRehq9K0vHKdzd9GitAAY8L65IZoPWpFZWOicV8W7jK6Tp5PKYa12rO8kyiH8HTeD
	 1II1hNbyZHPsZ0qV2rRl8M35EJDrdZGbGQkrPHTAUmFJ4BEBkkZZCP49VgWUAfbCZCZ9+
	 jlv5xR0aKHPwkBGydDEilst/+0I+nVaDlBsFuwxkWdu0VUwpfUcxohFo6yu7pwKz4p9fu
	 QbEFZtJq357r9EVlBJjpHbYbUM8yqI/1CC7gdwpu2Kiq83QPL3HBKo7F7czIKNms9Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KJfZXYzb;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF77B606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF77B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KJfZXYzb
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab98332238so2060532a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691698; x=1794296498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sgKBfMXdyH3JiV8S086KL7jIltq3tXtvUnKZO5GkGUc=;
        b=KJfZXYzb9V7BarptGpXjwtFkFLWZHfrzLpBtYZ/hT2sClqSpIOBxyHx1i0CxoaYq3C
         M9eYL90xk0ZhTZSVxjZQi+xZN2bZ1IgkqWw0uYbU+xvc9DXmxLPnxYU0GuAJm2Bmn0Fn
         HNXqOQbINNQhVXAG7IFWI1MJGA+58ibtFCPOvIqDvZo+ojymWESc7MvnfHeS+H9zT7kO
         hkN6itB3FyOxC0CAoEdBBWtrpwbGJjmo4KStjlQTf2LNLeZ0BoZXHR9O3xkR1S4HnrQf
         lz9CxjdcGFFPFC+Da9D5XgFKSghLUss4sE+zZBwG7wqJtaS0KkIeFOhtcWNg2RFqtayi
         eL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691698; x=1794296498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sgKBfMXdyH3JiV8S086KL7jIltq3tXtvUnKZO5GkGUc=;
        b=Ig1/CfphCGC3M9wig3E7uChg67Uap/uiSkyd1A5JuqcbG3G3MJeMwW5h4vI2fW0tSL
         IpPNaNzQgiKPq8VheDlrkhvYP/XJ1ydEJ1KjYPi3CBeh53encEZcZlR96efPsWvXeWp3
         F9KAHcBWNCFZzIq9jGSfqzKPaGsFP72V8ZzFh3OScuZUgWMDMYeXZBn3BvhxUwTORoYL
         Qm3nUYYIVEFf+RNu9hcglpYYeTuBXZgDj5h894OUTAG8DPbADHNFYujDJ6lwYbcZipTk
         yBjpLHsBVdWj7cSoo0mHcQJLtOEPqG0k5ThczPWmbuqc+/6lCLN1pZUWZnXWgxQNcXRg
         /DtA==
X-Forwarded-Encrypted: i=1; AKwUvBxauEdI92NXoLRDObPw4pnWNSObzQv4J7xDrJiwOrVU6S5pZW5t3mcC6MDvvfRyYXjHaaBmxI7EvHj9G/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z85dTeRq6Rdx0zvx0OZgqpVpo0kslr7tyWonAWCkOcN9rIVYnsX
	4nOb+CxUJeyOSGqjvFfclDN08sXWcY/iZqrp0ggWXnOIaUr0K87WwGWj
X-Gm-Gg: AYBFou3E//3WyVpIpfo+tho96PSV26fLs45rPfC8o0nlrHEXMuEgSU5tcBqPlY4uK8J
	stjVSjjsl3cPfGJGuh961m9HwXBP9Wicyo65om7B+j4F0mkrqXgzUsD0ahwOZsieL5L39otat8n
	MD3J2SSQc2A3SsoHJO5vIg4a5uOHVux5Y9T/GhswCAjakTo1ruPFEhulwtbPuCmr4rG2QCsclhv
	N+BJMtn4erYCoMvw8EcNsoNtT4G6gIix79X9g47xlsSU2624d/hxvdRk8tkFskFmmdISNV2xRHx
	+DVBPIoDbuZZCLN1hUewgRQPYkOQfawyvPVLY6mVFQkBanNDvTsD1jvRNaIfoWA80DoAF/rudia
	cljT8IpMmZv5oqT5XHKZUeG+X6KKyLDvxAep86oTOSys5K2oriIuCbCuSgau1CECf962tKV1MLn
	yHQfcXeJMeJsxe0IHLY7jZ9cu9XMiUgx/sfWZtVASZgr7BoBjHIFfAK7hZY1HQZmHPS60xq8tP0
	IK7DDSHoCFD3cuxbi3PSAwc9PdggMM9EYt45S//9oTNAoou05mxzvoR4/OpJ/dNqLDhp0mkuVvS
	kUjNnKvutIx1+umapxRDo8Ee0nj7jf2V3LdZgT7GoNL9Yct4OBD1CrfbHf5G6BS1idZAo3lxeDg
	QtGuMGtZsUEGDADE64JJL4Pf9RI4N/s8NAK0CKwJF4mdqv56Oqpy0beVKhyVLv0AY+tzG4gzU6Y
	52DQs=
X-Received: by 2002:a17:90b:2ccf:b0:3a4:6e84:e7d8 with SMTP id 98e67ed59e1d1-3ae897a8b33mr10316524a91.54.1793691697979;
        Mon, 02 Nov 2026 23:41:37 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:37 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:58 +1000
Subject: [PATCH v4 10/22] arm64: dts: apple: t8103-jxxx: Add regulators for
 CS42L83 power supply
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
Message-Id: <20261103-macaudio-v4-10-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1835;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=91sg/4nKfvF74lrnGKYqCKgThTSUHsOM+GGCNFkYSqs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+88JbPI72Su8M+7Bbd0Zf+xbV7Nr6FclxD/dnnT9V
 n7MU+kXHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKmOesbwz/IYh5nksXNOV/8cU2vXil8j0SZjyleck+IU2sYVW3tenuG/yxuJtQf
 /2BkYBE01uGa7Zk4Hl963N2flDnT7cRpfC9jBAAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The CS42L83 codec found on M1 series Apple Silicon Macs gets its voltages
from fixed regulators managed by the platform. Add these to the template
Devicetree so that they can be referenced on the relevant devices.

We do not (officially) know how the power is delivered to the chip
(voltage rail names, commoned pins, physical regulators, etc.) so
the regulators expressed here are just stand-ins.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 686fb1dd215d..34694902c945 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -38,6 +38,38 @@ memory@800000000 {
 		device_type = "memory";
 		reg = <0x8 0 0x2 0>; /* To be filled by loader */
 	};
+
+	/*
+	 * The CS42L83 found on all T8103 boards requires VA, VCP, VCP_FILT,
+	 * VL, VD and VP regulators. We don't (officially) know how power
+	 * gets to the codec, so these fixed regulators are stand-ins.
+	 */
+	jack_va_reg: regulator-codec-va {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-va";
+	};
+
+	/* CS42L83 VCP and VCP_FILT */
+	jack_vcp_reg: regulator-codec-vcp {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vcp";
+	};
+
+	jack_vl_reg: regulator-codec-vl {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vl";
+	};
+
+	/* VD_FILT */
+	jack_vd_reg: regulator-codec-vd {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vd";
+	};
+
+	jack_vp_reg: regulator-codec-vp {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vp";
+	};
 };
 
 &serial0 {

-- 
2.56.0

