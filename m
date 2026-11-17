Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919193;
	b=4mcdlmbx4zPRBpmbkVhXH85xn4EnlqORiJiGZmqF+/D32uf5JNsXT/Ia+DZSdYsziO7V
	 Bi3MTzy7IhHwMYPhWOS3oFil6Gqsc/shBdzFVt3cagoqkUJNIl0UQWMyhlX4iM+vSaPS/
	 ZYgxxuvVtXi2OGg2HuTonTROQVRpzOFdH2u1qfVqpg6QQLWpHEy6Xb46DxrqnedjdQRKa
	 GhzhxjJ3xFNkE4NwbLk1GvwEDNz25Mrr8/UjazUQZBNJ/u33ldy2zdjhl0DZd8FXmgw1C
	 kHm40y/jE0fVtl4wipSmQCKsxpC8NtWZGyGEB+p6oRnyVawe0PdaWOdx1LSOVe7oOzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nJ5hpYg4Cc8VUEITkJRPygPQ3lscK1+CbDfUcnWlRxY=;
	b=QAwZ7QNdWQO6ZzjQqeSx+atgos+4ILNyCHwwm6uXDNHJ+RoSYC/0XWEhXTcirvcGTj/w
	 G7UE8abzFeuCqR9FrAVOZoV903Og/2p0UTed3NqwA1nskBETERcP3/1fuMP1qdmhNZg1B
	 2izELwAgz1L2LE0+SoY7XKPXdEtTUtI4h4XJsu1RrglbW8bCv/v3yByROF3YWpLVfegWD
	 zJVLELf2vtvETaW1sJE9i8i5FTBtUQyZQ95DWt41S6EuBmr5W5d1E5IyQViwndTpdPufn
	 QLuEB1ETMdBR1uZjAlZLxBAUvFAV0sVyKD8UCLtqhpf0wP9m9HwxB3aZQAXkvays5wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAPvjrZd;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6D9606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C6D9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAPvjrZd
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so29740215e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919192; x=1795523992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJ5hpYg4Cc8VUEITkJRPygPQ3lscK1+CbDfUcnWlRxY=;
        b=ZAPvjrZdH1ynZ+1SyLLA7fkPQLbJu+W5/CYb3xFMiRsX+eCwe9ddKdOWDabHt+iY4G
         +HtXRZ3spDtEKFbhce0su6DIkz+zJr9mH34jwRBqKZQifrzqKUpzUZzK4Qsjrlpew9hY
         S8ScAM0TZ8pxv7mh5O6GQ3z/zgbVXbsvheONAFloIyexMycUscFo7jH/7Id7mwhDjU7W
         Zr0w8TuBRtt9GzmZv+OJGIsWNnnxbwXeUlzZ/NeGcA4n2o5BOehtlgNnTwJZrprPz0Tc
         sufr04gVrm/JQxjMKdq4B4ovdOQGZak/ePM9smlMh7Z9/FVSI3UQPxJVTVdcZQMMlCCf
         Ja3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919192; x=1795523992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJ5hpYg4Cc8VUEITkJRPygPQ3lscK1+CbDfUcnWlRxY=;
        b=DOHap5AuFFxDX++6ym+Falq8sn7S9yknphyffetolYe/Y3ZaNHorbMT3ksFS1XMIVi
         OwiahKnYDOtrMWHL4z2rikJvZJhN6xOc3Oh55y6IiOzSsnY1XsDyFBM5PdwIR279zTik
         fyJR05Ya6tavzZBxIkCswGoooP78RfDapX7h6Ia12JcydAEAyfP9F8y3AyqFX+D5cNOF
         vox8dlOOiVfAUW10qsXnh7UaA0onWHEF8NkNH/r0HhCBGLSG/1+ZZw8CrzePelsMVrrV
         sNaw8sWe4vCdfpo5A6ouzMyVDxBtr8aVS6EIWPBm5iI7tRBZUj+ub6coJFng++v7NCBm
         vXzw==
X-Forwarded-Encrypted: i=1; AL+hErEoirAvY/QBUyCnDGAUqfPF8aLVgrnRBbI663Ns1Ltx/S03C+a6bx1I9Jpwso0iTzYBvr97c/cpqdvLW38=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ilEw2Oaj917DPyRtOhuwsHnl8Ooib/9IUWmSiwotsvs6jEyaz
	ZAbrk+0LX5duGeV2hBVo9ynSzbKHWWJDkyd507LX4rKSxNoj50XlaLMi
X-Gm-Gg: AYBFou0DA8zqi04p97U3fI7/cZQq8C852zddHoEtP2B1umlw8B2w1VBuE/7U9QIx/Q/
	0gTq5wAGMGV4ZhFdjKzi3LPZ67IVtPAKy7tnkGBQ/4xALMumqFqmgjbmF/EsajPqwmZ1+fNSi3W
	BwTQe005UySyN7+RYvuMFRflz5NvBcwybQRljTvTxxVky55nQhQRLRDrPnlg+0h0UobavGdkMv8
	UHt7NwKZkBMoczapKeueCIuQG2IEVNyaV1jrd1dZJpByoPvh/JfwnxRibnnyIiN5NhpqO9M0pPZ
	OoPaWc/pRUIKD4S9FKLKNyXeAMbNN4WkrsZUpfcBLHwGPttssiF/SivuiIOc9ASEWs9jxYZuBKv
	0BwGh3gMVLMshGiiJqmdqmFm9OIicV1LEOLUpfbmeiM1+gcXg/alMbCV8+o+oxRko1BA8NY9WQQ
	kXX06sS85Che3t/c3TQxlZhg8dfUKm6PRtR4JEf2TepkGzp6uRLZQS7WrTPJnlSGQhV9K2IssYk
	EA0eoGDvyS9Q/Ja0RUuUfYVX9PYTCPpL4mkgAQxPR7mig+jts4fs535SxHTFQPZ1GFORH3EBRiE
	qjeZ3W/TPsWIZcTv/rZoJ7+0FNR/2s5gZrQSANzO9KRDw0LKOYUxws2Zvu7xJFW1qiicjA==
X-Received: by 2002:a05:600c:6096:b0:4bb:5de1:e923 with SMTP id 5b1f17b1804b1-4bb5de1f26dmr222829735e9.4.1794919191912;
        Tue, 17 Nov 2026 04:39:51 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:51 -0800 (PST)
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
Subject: [PATCH v1 03/11] arm64: dts: qcom: sm8250-lge-timelm: add reserved memory regions
Date: Tue, 17 Nov 2026 13:39:38 +0100
Message-Id: <20261117123946.668557-4-rofikcoga@gmail.com>
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

Reserve the XBL/UEFI log and DFPS data regions used by the firmware.
Keep these regions protected from kernel reuse.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
index 74b673ebbeb9d..ecbff27976fc2 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
@@ -103,6 +103,12 @@ ramoops: ramoops@b0000000 {
 			console-size = <0x40000>;
 			ftrace-size = <0x40000>;
 			pmsg-size = <0x200000>;
+			no-map;
+		};
+
+		res_xbl_uefi_log_region: memory@80880000 {
+			reg = <0x0 0x80880000 0x0 0x14000>;
+			no-map;
 		};
 
 		adsp_mem: memory@8a100000 {
@@ -119,6 +125,16 @@ cdsp_secure_heap: memory@8c700000 {
 			reg = <0x0 0x8c700000 0x0 0x4600000>;
 			no-map;
 		};
+
+		cont_splash_mem: memory@9c000000 {
+			reg = <0x0 0x9c000000 0x0 0x1200000>;
+			no-map;
+		};
+
+		dfps_data_mem: memory@9e300000 {
+			reg = <0x0 0x9e300000 0x0 0x100000>;
+			no-map;
+		};
 	};
 
 	vph_pwr: vph-pwr-regulator {
-- 
2.39.5

