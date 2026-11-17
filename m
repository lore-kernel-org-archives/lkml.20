Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919201;
	b=1+4Vkpkbs9q7iBSzPyO+h9/gn2QQjZzjwXVeoiuy3AXyeAozbQbhxtq16nqMUcxhn86v
	 BiY/0vjIR7eKsHPulXKecuYT1p4VK5gpK8GD8reSwF9Bku9ixkYXqS0kUxVYivAOkqHoD
	 iNGLKbZv1mraKSVSwPU+7I0hHJVzyjakyeUkRvFe6k1VJurmGMqZCdGwOqJBxD0u9jlUt
	 VUqh9HW1zmnaTIQ+cEk/quo3kpqeNAxGqWFTc2M1uEk8ZyizMc4KQJcVWIXRG+3uFWUd4
	 JCUwjMiizqtTiMhwFWI94bOVxkPiSRxl28kBvEGYG0SqfOC45HlkRX1hBxv19jUAdyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vjrAJfQ30bNb0haiNW552/JsaDvfxHWTHWoJPW/T5QY=;
	b=A8WHD6KIIqdgRxMhYlOQIZcTFzGBpMiGJnAIaMgHQ5CHdudGgqi3ERJ/yxCy22KAbRs9
	 qeeTm9VzLwSO2L3B1F9KMYcFcobd1H5wVoj5gdE3DOZhwwq+PHItWblr8ZCtpf6VUClTO
	 +uEm8DwPetuoMjw8e9Dxm0Ljkqfzm25lm3Avau54GxKPjgHNL2sHe4QpPe9z9T2ADl1nY
	 /cxOS9JFYJezQz2YGftZNqvV9Bp+Xuf+y2vcJ0hRN5vXcpZ0PJ6HBdtFawJ0LsN9bpaYX
	 qicISZJCMEezsJ2o99eZhVrurFtD2pE2WKs46mhOy+nDYKpffdTLJnLbI+Rla1s9xnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=amuFs9ok;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6B160A5BFE
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F6B160A5BFE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=amuFs9ok
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so54760985e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919199; x=1795523999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjrAJfQ30bNb0haiNW552/JsaDvfxHWTHWoJPW/T5QY=;
        b=amuFs9okLI2wRGNauxrep+gGsL+WgJninSyaPDOkEbfMWHi10AqUav2FKNgAwERcf8
         V7IB6M42D0ens0gIQNIPkVtXA+GlgitgDE/T7rM6Dlc97u7gzS4hyS4gFH6X8HoHIKB3
         Y0ExhX0hVl9YGII2y2SZVK/0Z81ZNZ7/S/1DAXzPo4mmNwD02YDsVjM7OXvof6xjax9b
         RxNowgKMcyVGzB24AobXPCvssYOu/F/FgK/lg8M5j/hPa7llwNTv73eKS71OEYgmdOjh
         6fYLD9cmVDCn/h8rw7RPMmeo+yAV7i0mpGYKAXXAHZMV+EpEJqIPNadAlkBDgh5j5J4f
         Vgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919199; x=1795523999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjrAJfQ30bNb0haiNW552/JsaDvfxHWTHWoJPW/T5QY=;
        b=ZuLIl+zxaa5M/Gn9ngnSWv5eyF0J2vjLD0KdZmxKYWeCA1VzNC/zgJhpK/BwFgBG/I
         V+58EEAz3Ide+nf74CrCnM3X9NU2WBnlpeQG77PDfEHlZ0Itx3swBIG7r64naEdMWXvS
         iACjg4XmG12x+DKx9aeT34IKy2yxuiZtg5s5EaHDokl+Xh60bFSYVteSuKXF0vuhIMMs
         7fAMzlwrGAkr4xRthPI4h0I5+oPybXGkO2y8OEto4E8m6T6CuND3sB6TXGGJ+/Q9Nwx8
         XBu3agoYA1+DvrM2+cXFu+GQlvTdH+cLwaSkJ+Vsbuqhm+f76prY4t6SKyunaTr0IeDM
         rsew==
X-Forwarded-Encrypted: i=1; AL+hErHqFwJrUWHje0BJ//xfmFnD6K848JFB6b8lkotPFVNVG92H/q3JUws5/MxRCP7q178Ji4qHcFsFu4WbRb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8I7DgWPr+cTWrTvGHbwvk60UdZQBHYax+XjSFOXaLfGOhcNmwN
	KawB8GD29gvDQinUWgLCnPAom3H8Iu1hkFV6QGuYawjsd3Oo+C2vdPhX
X-Gm-Gg: AYBFou0pCsgnpQZjZ29F8BgZZ5NVW1jwl5LNPGIdM6f7AdVNnYlziAvlW6vJYnuObLA
	c/KcUJztNtnIhuCShqquNzLhiu9cG2gNgfgScf1wHp7yJU9JzU6s1VqkaPNuv9cFWLhwjjVyKXJ
	BcAFlab7tANeRaFLn9hopiVuwJ/aveNL1lVmvoqcTnR0i7SCifDxtw6qmW+e5Ubp0yk03lXTCr5
	OV1craqVYGKJjIoADp4x0lrM6c2I19+AOGaV5m29IMpi9ELUmtt8mhi24dn0y2YmxcFLqc5iOV+
	4Xex+C7MtXV+/9aaohRPUGWE4QS3MUTHJ4UOYWQHXXJTPQQVCwSQytZSj6wW7XV1ktj01OhLu9b
	kQMNpE/tZJpmv63DMfgI0GlGsrZ80/vYDoI6/UgAhanMJG7jpe8kgJr0OM3/TeINGI97/Jym5oZ
	4/s+r38jEHNnudjUa51itLLQz3N+VL7rtzYOC6CvSEDfcvFtx7J2gqwGmmttl/EtqjXHmH8EWTA
	BhILZWd7I6GXYPvRUsxuCp0aloBh9Ey7SS+EL76BMd9oulszl7qGOb3uI4gjVW3Dt852Nq+98iz
	bibgv5jTTEADh9XxwycF+f7DZGj+CIqV0DEOJOk7oLwfvC9eswFKPmzUniQaTzeHXMgULQ==
X-Received: by 2002:a05:600c:4e45:b0:4bb:56bb:1196 with SMTP id 5b1f17b1804b1-4bb56bb49f3mr279082685e9.23.1794919199526;
        Tue, 17 Nov 2026 04:39:59 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:59 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 10/11] arm64: dts: qcom: sm8250-lge-timelm: enable USB Type-C
Date: Tue, 17 Nov 2026 13:39:45 +0100
Message-Id: <20261117123946.668557-11-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
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

Enable the PM8150B Type-C controller as a sink-only port. Keep the
primary DWC3 controller in peripheral mode for now; host mode and VBUS
sourcing can be enabled after OTG power delivery is validated.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
index a094aa81ad225..6b57c658cf918 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
@@ -535,6 +535,24 @@ &sdhc_2 {
 	no-mmc;
 };
 
+&pm8150b_typec {
+	status = "okay";
+
+	vdd-pdphy-supply = <&vreg_l2a_3p1>;
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "sink";
+		data-role = "device";
+		self-powered;
+
+		op-sink-microwatt = <15000000>;
+		sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+			     PDO_BATT(5000, 9000, 15000)>;
+	};
+};
+
 &usb_1 {
 	status = "okay";
 };
-- 
2.39.5

