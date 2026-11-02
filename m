Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627828;
	b=RRQFe/c7lh/Afz9A7FnyJXUEHbYdHS6W1VusWXaR6cspl8OOdY1waUq+4DwUiJ4XGSt5
	 rhVnIoEP9gCuGMbxM1bn5XRHrRIirHTgcBDHK9Rb3DMrsRRFL5T41h0AGOUez8Dn0oAiX
	 WZ5/krpEAe665SVmXwLqyO9uCALBQvMQNThLH0srmtPgDH+Moi/hdLPV3dzeV2YqBbnlZ
	 11Yx37WITyQvhwKdvVwJBuuqgZEs7GSA+n46ALn17IQe0TiKzNBW1ET+NIJNmXl/g8zGs
	 9Bow7M2/pYOAput6ah/c+khAsDf2sAf4Qy0t39JQmKzsS37Fec5nguAek8jR+1pQQBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ROsfx3+ZDDwx39J51PgNoR22b+GriiIZQEgHzyee4XU=;
	b=fKvD2wSQn8qqjyAVQeeiiLQ+wdmcqTmPBAY7Yx3l4pmB32K56PibUYwmrYKK/gHb4R64
	 Q5FgZvIKgXPJ5HNU9WBsgAlDvY9vGji54IUP5yp5NGdye9BbXqPztuqVG3RngqiHYUsN6
	 tFNfecfXNSAUVngz5tzJ+oqQnK1PPrj+5jtr3p/zUvztxEA7Ug26jnPFCdClE06d2olf2
	 mvc7NUfNSyzncUZ7Ep+BmjG4x+M9puianVuPV7f8Bm8bBr5UUlS/NlWUd6/PvEcM6sXOt
	 PoA/vR9amCO5fpbD9iGjdvsl9CIaAS0mkX7tARn3c71bd6SAJqNMVYy4deVtTerEaNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cGitjCfk;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D3260A5BC4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11D3260A5BC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cGitjCfk
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a215e64962so27528865e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627826; x=1794232626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROsfx3+ZDDwx39J51PgNoR22b+GriiIZQEgHzyee4XU=;
        b=cGitjCfkJFxB4xJ0XXrrqj93MHqYut+N8ugiyr5tAkL3g2Zvsk7Y/NpuLMx95JDhZ6
         CwHGEy1WFJxy6rJ8yjws78cRtJEiYtSpkhgHhE4RVa7yahP+4RTVGbQVrVU9zFDtQGBM
         PQkD/yVGEdsqxW4HpQbLx5/9kTTTkPNoe2G+dAlDos3W00WRDEMTjjbaGRcmosOa26Vs
         aYxyc//x+CnkmdVOK7Lt1I6KMRe9m4QkYuR2tXE8Ze+w/AJSPQk7wqVuJuc9Qs7mrWaj
         V/MGaBsxwojS8mjMcg8r8HGyBOgMu0WIjj1ptv4h9b6v3V5b6c7bND9fTUARf5kghH83
         jkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627826; x=1794232626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROsfx3+ZDDwx39J51PgNoR22b+GriiIZQEgHzyee4XU=;
        b=C35Nu82lEduO13tk5WSXEEyzU+NXgGz65IIa2e0AYPM1iol4a+F0p2asSCwFh/+FzU
         /fM9/fWc0AyRpFXqwDexJmwDnU2n6KnSbK8s0k0l6MkDtkvu8eKC8qG/VuVPv6BZwGOS
         gHSUyNiV1T4gomrahZFac8xliPm1DJq3c07i96NuD/FYrmG5uRTnSxzOw3277fedjwg6
         rizQWV5jOrxKDIBTAxO54fEcjoijFQAFu7qd9inCzoHEz3+EkENqy2pknXFGqsLL2kHy
         T6Mo+waCo8415qBrQy3j42WiprbDGPzMuiL/1YVsXqF4WcXcehX0XlYaQzQ1oT+BHz4A
         c6dQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbnm8M2wNUIcEcjRcG4MAK1J450Ge3phV+9s3s0jLAM5oZqkK6ZhBVZ2iqXGNoQ422Q/W/wvnCAfHwgv0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrfM+/W1k6UaCH16Nal8M4/MvhCSqoouu2i4RxujaZjdR21im1
	MOHD7nX86SpO+9ehhj4z5hZiAEt/JwDB9Ote/0rUlV2og1Q8HmmKTX634pqguK6Cu1w=
X-Gm-Gg: AYBFou33bBL8htiZIKowJFXTWbbxzDeephtrzNnakTNegd1DJmmPuz2nQvaioWjqIDr
	Zoa1vmVsr3f85dWcOCkOHTdAsH4Bf4dn1cUB2BCpi6H9nGN4VrjKmmIrDOeikSlUJ3V2KWHRGPk
	128/hY64a7O9WiI1FL5zFWIwv7mCn2ehoICtU2H+DkVh9r30IwZVsXKRA1UI/p/8gQ0o/KUjV6J
	yuA4vxYNomqG0Hx+VaOe2+9Vv4qB8VyuHpTj9ACBgrX4QMK1xaIuOxar5NA6cGPM8Xv8dvLIeps
	UvVPtFgRnku89hpLoMrS7on51pTru8QYeed9YLbcfyqlVI86hNrRzkpc3ooTBJq4gq8yb/kktAu
	NI6RA1XjSdMb2ZrbOd8jsHazlGQZOsjIJ9zIk47aGXiOtJSQV6gIrAqvGvCj94p09sbAxMhPxSv
	P0i0enbbD1C2h9JZxnxi/BfEkONYT3sGRL+xo5eJ8/YeIBFX5VbRDK2GGBt6BC7TQREaoNS9BM/
	sloE+btjivdfHJlqu4DB40zwDAGy5YkOjIMsVIaJEHgqg6Na4XQVZGAdGJQvOurHRxgT8W/VF6s
	qSnYT3GGDz7uLkunlg==
X-Received: by 2002:a05:600c:19d2:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4ac1932a12fmr227049755e9.31.1793627826426;
        Mon, 02 Nov 2026 05:57:06 -0800 (PST)
Received: from [127.0.0.1] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm126145375e9.0.2026.11.02.05.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:57:06 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Mon, 02 Nov 2026 13:56:54 +0000
Subject: [PATCH v2 8/9] media: qcom: camss: Switch on frame_sync_en for
 x1e/x2e
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
Message-Id: <20261102-v4l2-frame-sync-v2-8-25cbed7a772f@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2029; i=bod@kernel.org;
 h=from:subject:message-id; bh=tAChYgZgM3my+l5gwP88HIDeH7bAjggbAE84sPt/iX4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq6JancMv2K6Uz2df9YGlgm6DWLWHqfCvOo+n//
 FmeU6Pj2IaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauiWpwAKCRAicTuzoY3I
 Oo+/D/4/jw1RoL70Pq/OAeKR1oRhzBDdm4bjc10lWunQIzvYA6XzdKJCUSoWAshkYxgD4GMeQvh
 3xvzOAfwQJbeziWixFPvRbaxGvcoWICUz2o0/SrJ6uu5VDGY4I4XiQgJDAAh37ktVEeKdKwpCH5
 ydqW3vBaJr4Hiw7p0ejmpSP76PQrSDbgoyQJfoIisuXbJJ9SfqJuQfFoc2O3NdGOXj88VJHoAa2
 ihjDVtSOi/TntCxMkSb8jV4qzQulRJANUBMfZBaKbR3hGXhFcOVThfUKdixlPQFwoEIbJEYFhMr
 URblhPDzWYhb1VErPQpuQa0Jf7aT/Fco08VxuyNbhjars/xYnE0m5ZKRFa4u7xIpzBbMJvfW1X7
 L+h7pMpEIdPP4tl7cWnzQaYKAIczyFEjDg3giDO2XAgWVdj+c5PRNeXHN4yeZZw10QAEdkiMcPd
 wuk6SxoK3RwToGHWzKGFotAG37N9GBxpVh+vD2Q5i8MkHCKC2C0JQn6NDLUxXBfC/5izHqtINWS
 33G2qY8NkTV+XNWkW9WAMbcT4hjL0PuTmtynKMAL4s8bpMLa6/aq4yCA2KMwlXGSkcD6JAXBxPd
 j/4wIJYPcC4wdzF6OXmdJ+nqfDOciNpqaPUTIOwnL/ziJG5FpUBkWlb3wd+zUICWYH4aUE0LqSY
 dCMaxAJ3VbK2Ytw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e CRD
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index b7821019241d7..7911b30494ac9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4255,6 +4255,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4275,6 +4276,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4295,6 +4297,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4316,6 +4319,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.interrupt = { "csid_lite0" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4338,6 +4342,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.interrupt = { "csid_lite1" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2

-- 
2.56.0

