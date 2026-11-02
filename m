Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627824;
	b=0qT0JuOZyTVczUIB2qlVk+wyP872VhqEmDqNYL3PXU0oZVt4v8aAXuAQ62nB2MshKeW0
	 lWzdg+oKkf4Ktn1CfefWoQyIbWmwzilKZRQjUSqLhKQfyZjjEa5nMiWFV/q2x+fUaofL+
	 On7FEYTKx/iI98owgBmN6H72KQTMJq/+V2ww1dUOBqH6wFAeW2/75Z07vwSxzAn44OtBl
	 MsaKO81mfaMI85PrQRrmHcXFwaSSuXXDFyI1Ei4R5d+KttVVr3ncPq1cI3yOmOFq622Nd
	 JqJhhFS3jjgG0xDYNKo2zLOfXmOoAIorC+gGvDEq9qJ3D4N6DSwZO49Z3t7pZYIeIeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=tsHJAqJzVJK5StZwQ/IGYfPmYXMlz4wWAMnosjbM5LM=;
	b=xzDNC4GjAtdmdXMdqCdIBiGhXr4mRzp5N4idjzRyoQNBvBKAHljdQ9wDSmi0yoCQH/2v
	 3z/85kEBR/GmD8Sl8hJl/WUbjossSpYAOxWKDfHOWr4WzWpvbtQpn8jqhU5vRtRV/AM4d
	 mDWYM9yXjYkhCXMYq158gl4Qy80oZg8ySvGSdnqL7kIJ4kbg2yuD9UTcvCzmppkrDtpU/
	 /vyAPWQUF/xQt1S8fRo2QKqdxDX2VBQes4kSZviE73C/DGjEqjhiq/K2wtx4onqUaQdYC
	 HilxZkr4Ucs6hw0J3MmB+v8TjhirQBbhPFwnInJ4J6/gY9uofz419eY4dXnVWr4tkWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QgToMraP;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495A560A3814
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 495A560A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QgToMraP
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so26991255e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627823; x=1794232623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsHJAqJzVJK5StZwQ/IGYfPmYXMlz4wWAMnosjbM5LM=;
        b=QgToMraPIYAZ6E9QJv56CW8TA5NeDihIdL+2HBv8SzLY3Cb1I4doWGGWqegVV045oe
         MZh5aLyCLD2lPb+kGeoouhiEpWLJHv5VWJ8pJdcHh1MPkRmjf74B2AsjnsO/S7vr4tuO
         16V9492Vy0I113SbekVflXtO9ZGIGq/96CPiuWUoT/HoAu+fdKBmll65GFNiJJgRaLoL
         n61P3B98QU2kUUQ0G9mVDLLXVyMNrajtnBMsf36FMCEdUsHQ8f69gTiNzcaOncLgoJ8O
         x5y8mwy2fOaTYBQrvyYuuFcBP5GSuweKYHN6Y+jRySjJ6erIZ2ateNG3+vvvP1+HL5Br
         GG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627823; x=1794232623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsHJAqJzVJK5StZwQ/IGYfPmYXMlz4wWAMnosjbM5LM=;
        b=rE7GIQS4m7fY6Fl8qp3z3zCYDKZVav9oKXWHg8LweW1G195l3E1MmdtTdHiWHX4LOG
         FNTnVYXTtBIGvKeauGkrjkBP1FyXY5G2OpJ7Cfy8kOydurVrWJVNDfCTgcK1jVFWFSQF
         /cJOf+10bNGkfXDe5YCt4AtAzX4ZJgh9UNQkX2rerIfZ1UwMLlbCFhZRMl2g89zNHaLf
         kEG2M0uneSBGkEFBim0yF4JQ7gHigcrwryw1i6NML+A/RH0uj7mu1MXh5/WfRdJBGCsN
         1lUkcu0gRVLIlS+Qjc3KJgzYoR3NS8P3YX2IrLj8f5ISKl5KGlZbjuum3qNOjoM5pll7
         9AJA==
X-Forwarded-Encrypted: i=1; AKwUvBxOL3rZ1kEL2dKjL/1sYCQIkl8yVXAYFtCkGuZuqxlMt0QYdHqX2CXjrQkXkD49fpmB+hbnqpck+8JNN20=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAARRl1FQW/Bi722hgdVDyD7OZWJRK58sT63Uj9Rd08zKMup2p
	noQiofQ7Czsmi0bnyM9oSwlpGkF7E4Dw65hGSKKeS+M9NoZNz3XbQdxZ2hfdbtaCCXJ+87KFMbA
	yzKcn
X-Gm-Gg: AYBFou3jIrAAecD3ayfJC1d00JJfj2KObTNY6KpT+UxztAb3/qq7D+23Lp1ELHvUeQ7
	svfVO1ckbm5ciz2QTeZ55gwTZtfA4P3hHxMHdjJgQndPacO/qXQzWQ28+cPDbct3ALkGCnwMWuU
	8fHeKHaKMaLgGYqfrv+hpJ0HqaerLFx7QYDOdZFtjFXDF1f2I5p89+wPvfl2oM4falWcXWjGeuQ
	jgDQCNL+dkyP3f1yv4LrwKxhE9k8tKYcmaqx4M4zk7K8AMHp63uiXY8nO6fSBpPGl9bNBSt/QE7
	ItG9rGvPRmIXe1kF5BxEIH/e/e8l5C45wnf2+VHuFt/cqqFUuHtTPwGUsphzDO3+le61pXxl1OA
	7+eBTlcjVRYNZBmGnQR9vPi/NNk7JT30qfVdylonY5K6NSSAC54+EypufxMZGuOroTc8efMpZbW
	BDa0EdD8srCZBdFBuBt6CHQR9Yjrl6Yk4RYr35q2Zpf6zOMtwLwWQsVeiqAqSfi+g5n+28xZDKF
	WkvQAucuulAocKc7QDJH4tHi4sV7JYqO9dePekUlP84uyonRXY3ehOv+MRpMdFldJK/QI90jaDn
	Hc6gAxYyWcUBsi2O2yo=
X-Received: by 2002:a05:600d:c:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4af83ad8fa7mr100728245e9.35.1793627822770;
        Mon, 02 Nov 2026 05:57:02 -0800 (PST)
Received: from [127.0.0.1] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm126145375e9.0.2026.11.02.05.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:57:02 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Mon, 02 Nov 2026 13:56:51 +0000
Subject: [PATCH v2 5/9] media: qcom: camss: csid-680: Enable RDI SOF
 tracking
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
Message-Id: <20261102-v4l2-frame-sync-v2-5-25cbed7a772f@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1813; i=bod@kernel.org;
 h=from:subject:message-id; bh=akubu0rGSbK8Bi55Bu6Z8+I5lQw1Ol8/ItTGES6zVpo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq6Jam7cLZPbufwEM11MFsdo3+kxSVOvLw0q7oq
 AntyC1Svt2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauiWpgAKCRAicTuzoY3I
 OoVtD/48bicxJOCV5Y1Ypx9uQx54IImLPeJ/mYHiXKG3YUCVtwomU65GFhh74QgT9XqdoxqF8AI
 v/MgidmB8d50mD2/tBojdIokLZ77XClo4e/jrG1Cae03b63H5SBW+cuK6dVX2gVxr+yxW2gbO85
 qfQaLaIbqQKalU3OZNf9a/VgrVv0ATH5Mz0u3Viguu/a0RIFw/iTRdBGCRDmqtCdJOQMUbIOAVR
 ZHlxndf1/gCB+FDqMsnsT6RG1tvKaxRnyTzZqKd6Wrz0z88Yc6DFoJ6T4NMxOtR/Y+F7NSZGEq9
 IqHBW6EZKKbm7MatZUdE4luxsEZwxPhpB426RMAULXmfJ0orpabG7WAJVZ6y6ox96aYnb6j0sqg
 INO1lBRjohhBdf/XbqAAfN+nEosoSB10J5pFU525rvMDXYEdAFag9qZZH5YjOLwpp31oO2i8vei
 S+KJKWVNHK6SwecO5hTZOUzHM9zMj42/iePAq+Mh6V/0Rbcv+EEUhm9geBCSU4f4vOZI2FtCsS7
 LvCMOAJTOCGOYNr2Ef2yUoNxO33HkP7L2QBmkDZOWCixf9zJSL8JcIii+a7AeYccTMPnWP7DkzP
 lXeBHBJwpKAGzI0DJdH5UdGCwACvyGp3JX5cE7A9n2sNokD54HVvYoBNhVHrZ0E3xhOP9M+aaYX
 EgmzzzDv4zxSPeQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Similarly to the sm8650 we can quite easily switch on V4L2_EVENT_FRAME_SYNC
for x1e/x2e which uses csid-680.

Do so now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-680.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 345a67c8fb947..452640e72f6d5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -296,6 +296,20 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel(val, csid->base + CSID_RDI_CFG0(port));
 }
 
+static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi)
+{
+	u32 val;
+
+	val = readl(csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+
+	if (enable)
+		val |= CSID_CSI2_RDIN_INFO_INPUT_SOF;
+	else
+		val &= ~CSID_CSI2_RDIN_INFO_INPUT_SOF;
+
+	writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+}
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	int i;
@@ -307,6 +321,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		if (csid->phy.en_vc & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
+			__csid_configure_rdi_irq(csid, enable, i);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 	}
@@ -395,6 +410,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
 		if (val)
 			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 
+		if (val & CSID_CSI2_RDIN_INFO_INPUT_SOF)
+			csid_sof_event(csid, i);
+
 		if (val & CSID_CSI2_RDIN_RUP_DONE)
 			csid_rup_complete(csid, i);
 

-- 
2.56.0

