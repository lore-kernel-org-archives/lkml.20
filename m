Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627828;
	b=XSte0n31yWokGnjv3t+l+ye31X3Za7yUKxNmg3/RgFqWK1LbzPbonXQ98w4iGmJI1eC6
	 Obn1uQQWUSWWTQYyA7BEnfffKu+Gr9ME8OvREK7CouHqOgsQRRcoOssGoFCLrRQisRO/E
	 +G/lbapjF5qH0ozOTpfVhypAMUtV49E1EJmFUeu4BHUSfHu4aVVx8pMCUL0uOuzLVu1B0
	 2lHv3cQwXodTemdLHwNGKwhvZzvZMU+arToal6YrQ+yPgk1+6mN7lpBEWMkQWZFhmqzyo
	 FX6/X7fY3FYC743fc9ZT0uJrtQCV9vw38sC09gngN+2ATj3i9CuOnYyIqY++9zHsXaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=DX6sMv7GtCni6sgZbtnIG3BbEYOsPBiCsdCaD9engMo=;
	b=L/JZp5LxJI91dTqt9TexAWozFUgAqz8OwNqlY9ZaZiNW9v1tpcz6Tp/okKNhLRxwXc5s
	 ddm8fA0vm4N1LXAD6yEHy2ox3IB3Mv+boFH4ewzONZGKi4iFEIOz/n0wZrM2jG1V6sGak
	 TlQzMxlHpVVI3gweOxj51c8PJYxc3NNVAx8TB95PZkWGl9QbSIFAo0PqFDpHAaHyOLCyw
	 0BhhyDVQQsAzBfU5Xa8n//Sng5vhoroGMGHmBNQV8I/TI38VRtc7nbc1YOp4Tgd7QeiyL
	 +VE8Igug4g5MvEAHkKtoquTI3WYprQM6TTCFVxf3h6pbYjeSWcoY+t1/WxrrcSdbqzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FV4EFFpG;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4272C606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4272C606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FV4EFFpG
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso35238375e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627826; x=1794232626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DX6sMv7GtCni6sgZbtnIG3BbEYOsPBiCsdCaD9engMo=;
        b=FV4EFFpG2YTP3FkfiFeyxWhqELKuvq+AKbuHDmhI2KNjzZkS9nDy7w7Iz+Ujn4JbqL
         KtI7OaUrYqpPpPcPGZFUppHXvKQL/6w5wwWr9+FIBo9OwaSW3JKd1FcAzD5zXdH5K34Y
         ReEdUC1jZhyoGSLoMpLShKJPbCRyzGKCoBrYumxWJr0jan/VRjXuxDbieLUdzHz/GTr9
         3o6ZxJlYjz/lOZrUReTIFCh32qGtWyP3Nywwd1rZGtzc7u/0VWXTlQFjljj2SOaxCEL/
         ROdfGgEVcP5i452KqG/xlp+ipfX0T9eXg8xCHKQLCXxNrwJRDbzwwZrLlgmZl/V9HK13
         KVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627826; x=1794232626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DX6sMv7GtCni6sgZbtnIG3BbEYOsPBiCsdCaD9engMo=;
        b=U0m20xHQ90ie0pmcdDQPS2TjZWG6DOTlxXexuaENVF1ZAOp/E1f0OvHT0zSckVGj78
         G62s/IRKDSnz+6h3WA1o/Zpdyb2pnV8+a/Mg9MCuan2JB42ql58aV3bWoclYHeaBtMk1
         sRKSuqYfrRvAqhuNze8SHax/YWc/gSKGaD09AtvEQI/QA4zht2sRmV5oLR+2ui/znb/b
         T5NvUX4R0YUZnKB7Q+1tU8+XsO7Gc4T/ZyjthxRdBxSE+jaWjIu/VTxvSpjTxFMicZqy
         xtfAYnGql6MW33czFcZR0xh8pSW6UiHiaSnKM0OpiJuL1MyET5XkUpEaWySo09qkv9l7
         hiRA==
X-Forwarded-Encrypted: i=1; AKwUvBx58k/+wzPnl+q5fzYb5QLeY0Qh9nks+4kp6ARAak1EXzNMTJITDww7FUbBJzYfPiEg0jGWi6uy91+nO/Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKV79HhDuCocz5z1dQPvLoYko+4RedRLkcKlNpHAGL+pK5qu1Kf
	I9TCeopnMDABcZkiBJaDBNXqKa6SxqtFMExGdGpUTVK2+x1gVB87pk6tmTiQZ810UH0=
X-Gm-Gg: AYBFou0inPUy9ThZzKuSVFIKOxjXbwo0lNvZT3exd0Kgq0MTmZElBR3PZwwulHN21KL
	X4sR+SpOBamfOYpEVMbQ+IGOTXBYyPojyKKQqQjYoVpbjI565sJr5gS0zY3U2S9DPCEhCJA0CTh
	uBBdP26hitKVydqgjcBWIS6zZU3TJjCqM2UO0rV6EHusB3jdSks3FqkzxJi5KBhE1R1XiiI3YZl
	AuWLCLq6uyE+2ht8cQUYYY3DeSnJTzSmIJgJSd9RNkJXupiKEPWI6+DiMQL2f8pi8hlr/EsxZ9B
	rJAkw2s86aD8aNCk9CaDGcQXqovN1+B7YPhsjtmRmfIApR3FkIVjbGxAJo1Dh9WGl5y0PUeY2Vd
	7MvS5rA6fGGtltQUaMEpWK2KpmnsCvDSpEypHsQ+8UfODWl18sO0NeYDHDeW+ECiDD5d4b579Yc
	jmNq0z6JnRH22paaTmhZ4rHFJ80+Gf6fTwQCLSfvjwcuryQUrH6/cR24xBPMdpd3xtzqvYUxmx0
	GgHdk8zG5eWU2PusrPbOQoA9ffJ5WFipnzI5BQ1IoHxdlGeTGpOWdHlGhReVYJh/VDF3DWLeHRs
	mnAD9tAL+fZDrVSaMg==
X-Received: by 2002:a05:600c:19d3:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4ac14fbdd29mr230508565e9.3.1793627825629;
        Mon, 02 Nov 2026 05:57:05 -0800 (PST)
Received: from [127.0.0.1] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm126145375e9.0.2026.11.02.05.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:57:05 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Mon, 02 Nov 2026 13:56:53 +0000
Subject: [PATCH v2 7/9] media: qcom: camss: Switch on frame_sync_en logic
 for csid-gen3.
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
Message-Id: <20261102-v4l2-frame-sync-v2-7-25cbed7a772f@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5462; i=bod@kernel.org;
 h=from:subject:message-id; bh=jpimPlzujeXYTFAQ4U6K8aBn85zwGwKBGq+WzbMrExM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq6JanbxjmmEtHEi8a8VCLClHRlq5Jiypm445El
 YFbI890e7aJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauiWpwAKCRAicTuzoY3I
 OomoD/9q3O7VIcej/axxVrm74WVBTmfNNLAeFGcg6d+4bhkF8pMbX7Rb0Aeoqhswh5pyOYLyc+e
 qo1AhGvEuTW0sJNTgcx+KygK7i604qPUfkvKsSJ3ODkIji9+KDC0TH6huKzkmTkQYZ+VfUMajAS
 LU1aubeKocJ/H46tOjPXwMU2e9JZ5D30rZWriorZsd4BXbgwiS2Z9PMOgvzW40GGhW5a47vN6JD
 FIRnj8WM4UUIPTgT2XcFUY6pWpcYoB0grQAT4Wu1Hgc430JpeJtU10CpQvD7D6TEEPH296FMJqD
 oBb7oAXaI0PowCddz2Jxqwv8rFpyw9nLsC0kBI3RD9GlzLGpPk6OMWbr1GAeQOPyKGFK/S1uQNP
 XMSVuVSdv1AaaugIZI1AtRAtJNgW0kyoVDPgGZzczcoeBdzHNsKN5GzoceaEs12shncEdxku8bJ
 /c5+Z/2kYrJgFAauHWqWkU9JP7MDSSZ4yaRQViiVDlpqEIoYVRKnjJlt16G4CGLCYQwWKWx5npW
 tR1qb1bacjaFQEjAfEvy+eJsH1aGTZKu/aV+Q7a/wLtGjyW8fWRdbZ/ojijDCfXVNyVh0bMIoXJ
 2GYFnAuYTT6jNN2ULauJ30Sun9ZX8utwWRsM5zD01fqDDna/nQtxMO5gWwTP3ELYusH59BA/mW2
 /3LEeS5qiaf0yqw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sm8650-hdk
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 52bb19f5fbf3b..b7821019241d7 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3120,6 +3120,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3135,6 +3136,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3150,6 +3152,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3165,6 +3168,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3180,6 +3184,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3433,6 +3438,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
 			.formats = &csid_formats_gen2,
@@ -3447,6 +3453,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
 			.formats = &csid_formats_gen2,
@@ -3461,6 +3468,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
 			.formats = &csid_formats_gen2,
@@ -3476,6 +3484,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3492,6 +3501,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3790,6 +3800,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3807,6 +3818,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3825,6 +3837,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3842,6 +3855,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3859,6 +3873,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid_lite2" },
 		.interrupt = { "csid_lite2" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3876,6 +3891,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid_lite3" },
 		.interrupt = { "csid_lite3" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3893,6 +3909,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid_lite4" },
 		.interrupt = { "csid_lite4" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,

-- 
2.56.0

