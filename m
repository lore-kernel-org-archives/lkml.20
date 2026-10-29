Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267741;
	b=Om6p4pKyOcmnuC1oziPr46MDm8U2KOH1soaak8c0x26mNSCjMPK9gomXedrXgTA+ZnCV
	 trQuc+ZYjNITrRtwbcSrso6lKJnefBVnMWltrfNtVzftOnrzFv1ga9x8Ct5pwrcUIoNH9
	 oM0rAQjxVR68jXiXiF/4GdGrN/apRsuGRsxXC2+bL3sQIkNKqMBkPsYBeE8rx9pZxaACI
	 Qu8RW3jiHu0W5woQ86J7W73v+3Mcu/plWc7pfdbi3Z4uxqBeTeerfaTOsQviYVrOPkAB4
	 5mcdav41XpkJ9xBC3RdTC6nh104Z/lzFT5s5L+vL3dmEY7twh7p4koPv65Y3/DJnfdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=qj1A+8fQ57/dFas+MgBfkV8FYc5lnSyCDsAqeHMK2OM=;
	b=iPSl4st/WyGhVvWh+nCjdFqfW3LOkhpy16XAU0IC9BrDPWIi+GseXYHHM7jRC7nTK+d9
	 dcr4h1MmmvIIepHjVK9wj/PVdPlpaTXCuM+YK4vg0bftY2Uerj2b2AtWxGSSFOyYrp7MW
	 s4KHGSgKepUEf0ZIUNHTQcB0Q27cu7cK1KIy4WmMf2dP+gs7xRSS/hoBWoKtl5hWh7LwE
	 JL07GRRt/Q8AYH3ojgn8pA1gkO6ssfsmqnZDvjEvNP9qGLvdnd0u3QdswTMRrJeoKOY4Z
	 mG8woLd9Gqrz2nRRxLE39ajTxy2DpAZAPjSB3U6NC2l+PiiY22PPm57IFfajf7nfF7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LfcpMvwM;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665E6606A557
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 665E6606A557
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LfcpMvwM
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so4775405e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267740; x=1793872540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qj1A+8fQ57/dFas+MgBfkV8FYc5lnSyCDsAqeHMK2OM=;
        b=LfcpMvwMy2IsdiCifuWJR8m1XONHAsorczxuIn2seORpERHF6RcRyWzCR8a8CnbBT2
         jG0NFWzUSAKTj8hm/TLOD72EBy6w+2oh3BAh8aXBMBoib1+3rr3k6PyUZHoGeDdoOqZh
         qeP37G/8FyiYP1myy6FCUimyJZKi5OuzU8r8LLLcjp9izJMfaY0rSkTd/ek5tkUVHkyG
         HRH8KVr5S8ac6RRrG+2NhIf/cwXFcMVAcA+DCviwhu86Lg1GlX9q7F6V0p8wLF5Ct5w+
         0VaWy7y3ETRd17DfRZd10yhBdSWkTNUHOdX1Nf37U7dcC7vVvUakFS+KVtc6/82Qiacc
         yS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267740; x=1793872540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qj1A+8fQ57/dFas+MgBfkV8FYc5lnSyCDsAqeHMK2OM=;
        b=YLO5zZS3sG7w7ZRRdvgLDC/e3QybWlpxjZSYbXaZ0+NaUJRZ4f8arFh7Q+4NjY8fAQ
         o8WHSzyVICyMWujUma46UN4K8gEWG/lWwayh/lE/ZXL1CMZpEkNTOSr1c41RS/J9DeRd
         NbVUj0wiNUmRy38ajXQPAsqKDlLU/oTY60DFgPga+9ipk5mcuJobmkrjrxXYaYFtg98a
         P21Qxs4mArLKDy4vcMMPIgH/DIcUVX+5osljWoIA3b5uP5FSTh8wmpml71Qaw8lMzEUM
         udmmLtZrn7Cwu2VBGizyItTIQHUl/5Si3Du+YC7Ep7H8fdL7jtsEUCV3RNqcS2l1hFnJ
         xdZw==
X-Forwarded-Encrypted: i=1; AKwUvBwmMnQdQFXLi3q4KLJPfndKE1iAaIPMrhPJtyw/PVmSF1Kf7l83BkaZSMR+GrcNpsH0SyMB40a0VrYzMHk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJK3F7I4Y7L104Uvf8M0BN++zUp0NL73jp12bfzLKejg806dPRr
	DlXQ577/AP5JI6KEaT6OOhxavssc8uKqbVs9R4LjaWqvRgb7F5TjaG6d1K8tLl5x+IM=
X-Gm-Gg: AYBFou04YPxuXY0MUiT46a/351qs4nXio8CyTtc17HQ/gcBuMVgdt5zwQaFFfCOuGvS
	Iq7y2ve7y9A6r6lxSfcgF6D++I5ini5tQjBwDJ0ze3bzYEWZj8mP5RmTNrOIqiOiK4j7OJtZzvh
	tesHfzlMPE5YSrVZZC4fyaeBBMB7lTTEBlj2zWuQ/rMNyv2iZoPArA/2LfL3lp4PCMdkIs0cCl3
	flXCosj31surSCIaPsMkHAObW4t5iEWtF+AOZ1JlC9LAljfXWHPxvAdocwTI00SmDLcAwlgVwDx
	uedhDMNLcBt05TtSIfGhf3dUvUBOPaEUC5ix4FYCkbMG6EsmTse+bBaDvxos3q1ch1Q7jDKJ46h
	RFQsaXJx+j6XCsM7mrNlCcRIQ3JNuhH5iDARi4n2oS+Het+RaLw1Bax2IzLGK4kqGvpFhtzdAnO
	eEB1C/8rw5Ezt6HPEnJLwwEw7vXAYnOSI1cU28XVz7DRBzXMY61NuScSH+GLuA6YpEYzyEyY138
	loycV6NUOE8XUt6/7xQhTlRn19RgMLXZy3SgVydArIJHKm1vbQoY5r5n8K0PzZJe+K57fDFsX6p
	HXdYTi5PuJgP7RCuokM=
X-Received: by 2002:a05:600c:4988:b0:4a2:1002:223e with SMTP id 5b1f17b1804b1-4aa8a7ac780mr31852895e9.7.1793267739798;
        Thu, 29 Oct 2026 02:55:39 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:39 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:22 +0000
Subject: [PATCH 13/14] media: qcom: camss: Switch on frame_sync_en for
 sm8250
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
Message-Id: <20261029-v4l2-frame-sync-v1-13-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1707; i=bod@kernel.org;
 h=from:subject:message-id; bh=CkYB/VX6UaK/qcxlW34OVkQ2L2oUHrct4cBJHsxd0PU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgOmyFPRvpDmvOH4dGKXFhNXHsGnJvcvO1x3
 CkKpJ3+iKGJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYDgAKCRAicTuzoY3I
 OtEqEACutpF5M1ef66iTNQm6OPGVR/ABdK370bGrL65E67FrXLBLlkdHRMkIU0zbeKDndGRQeAY
 i1PBoUYSK9Rr2AlPkJuifEpvJUCHj174J6WBDlC73/8wfP+TYh/8kGBOdd70tbawJ9qFAEhaSa6
 D9c4YGdAVg1RizDFcnlqJYh4xM57O06UQ2wbP6m2lJESw22+m3WW1rdosWmfDrdrAmEmUZp+GLb
 p3jU4uNmcMz7Fx3to4nfVm6bT/8Cwgxu6BCWl7Jf39a4YetaBm6kJKP852SOmOgvEBjWxswh7nM
 t1Oxhq0urr0v+GJb+NbGoZy/F9b37DMnTd/5bEI4GC5qdpF4lQL7pHSseo1JqlpDIUN1D3iCiwE
 MVnZ1I5hlz0GBU86ZlVM8jQ5w13sSA+VnKxq4+EBmsvdcRDz84G/KLKrDr6ljiwD1Fpg+ehc/UI
 /84vhaahc0vpVoHalEmOPgKPxpoY5P7ziYdiUDP03xu6uzwlWCga/QYujA5tAjtcDVAZygAuWFz
 nY9gt7xejhmjrQVpY0xswDbBHpyT/cac0SetO+Jo5cKCLMnXtdlXL1qpLL5g4F4Ao/IsNmutF8c
 3RqRjdmz+q4HA8IMNoorXeR2k80CwzmdtSt+cRAFb5Oux3iGBivyEsPm7nDX8xMVDoYWLvdonVg
 cvJkcYjOgTAYs6A==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # rb5
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 10bf91b467f66..23f0b63580bae 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2058,6 +2058,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2075,6 +2076,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2092,6 +2094,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.interrupt = { "csid2" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2109,6 +2112,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.interrupt = { "csid3" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2

-- 
2.56.0

