Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762453769F9
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810208; cv=none; b=BAeJoUbtOLOeoKj02A5dAF3ALa4QCAVVczLigRpQBe72jHOoC7k42jUp8yE9fS+l3rWUrT2qVSTe9qn2Yagrj8S2LxnFBlgFgI/209Cbp/Z+lTZAnISp6yN2faFnLgQoeSRBlBpX4f2rl7QVgHDwgbNn5XMgH5cl8VldCc0+k78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810208; c=relaxed/simple;
	bh=4eFSyiDmd2ZxmoNE8OwStpaw8zUdwL2aJ3YunvWRUck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qnJedlNaMXomHuIPw5QESGFhUbWZCnsbU4tcV4tUvUZr++BAR7RUl+3Gfn7j0Oz5xIIvyotmyybv1N9hcRUMaw++oTt55g/mPz2BMy8WD6DPLD02i+fQI0Xx9dASNGUwoNk9fkZcXkMmz+Co5U+a9maWsIrvXMTaQHjpuYFC0Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=g/R9S3Fc; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="g/R9S3Fc"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1801448f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791810205; x=1792415005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYh7XnX19z/zJw6PTcI1ox8qC0mffPmG1CPnxaVd2wk=;
        b=g/R9S3FcgcAQjXXAT+UJignK64wo5XbbnC8Dm5URVo6HqXmwnvOqsYrNtQP8bLKrIk
         TXwF0j3nr6Qq8tJjkquntZPKMxZ4AoxzbbuY/LZ8bF/7o+opn7zzHKcnbH8eVQ0+H36n
         TtRFeYYYnmImZY1RagCJfjVI03IJ8dlf/QuGQHVB+lFNEiH6eTIBgWC19Hu6yVe4wsXH
         mhCXiU2V3R+3qfOJoG7VPv3GuNC/oBzQoJEt0ivBbd3guxU0CKURzu7zY27mRUTLFIag
         jvu+Iamm2fg5BNeHBq/iCSu90FU9q3cVXCd9PJ6+Bd25vypOWzMj7ImwXbnR+AmRQ0wX
         zMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810205; x=1792415005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYh7XnX19z/zJw6PTcI1ox8qC0mffPmG1CPnxaVd2wk=;
        b=B9bZAWBLiVPB/m7vCLizv7zKe4vpVH5Oc4bK6LWmM+MhR1swPjKSgjogogoSmjixIp
         nZk0EmOisJX5Fkqfd0bKvVsEq95u2PuSMWbCuR5ejnVhsNpNhu5qMssZLWb9/qkhb60K
         tjgGP1IovCBMklAfcE7ur8RCCuZIe1P5w8r0yfv+XtnvFz2E4ryDWCROXT/vT0EGUxYU
         WZ2IT/K7+qsd/474u6DLm+ZwapTFw1ZnJhu2EbxdXjAQmxQqhTpntpBNb8XUgPg4+0z0
         gVf093AZsulxRBDkMFyDLUvEkeuQdImhgt07C6rcppa5s2ABvMpJExGrxE8CWb4J8fH6
         zsZA==
X-Forwarded-Encrypted: i=1; AKwUvBzOxYu0VAhvZurmEgWvOZu42B9X2u6MrBb3rtPBA2pHOXJjGDMncRQr/F+2PNiNiDUbZrF9KPD7GL3zC7M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ38tafnkM4fi6SucUIK4yO2YrsMfl7FDwOEN6S6stG51i4K5O9
	fPchLxitZwt6UkI9wGV3mmWwRO4wrzCrHfbFr2IpmKkiFqO9XeTdr/Q/WfykIXWigzE=
X-Gm-Gg: AYBFou2JPchVVoTUhhA3dC/c2W/e3/vZddBxYD8Acjn3w2Qag0x5i/jj6bsshEQpJF9
	Yktt/lNyk/QY8Fr4e7PRf/gBL+aoKoNP/dCV6UxUJZQ4SPft5BetM4SAuWSwcbNh2sa0SvOxMif
	UKk43qmFsnztPFM7lavs0qmIer0LA8PlASj5mbd/rIUyQjdnQZ3KkehqGKf9KoVAm4In5kgEr6B
	O/1Of4DuMjgvGn56s22nxoAzZaWeewkf1lrTm31xIFANME3WPDzNOwhXzJ6djxke/DsU7AVfEyR
	Iy7KE46H0ZM3fQilo8xULVZK1yQYPDRp/bDd7iQWKclVFvS0l+p3BPBks7OpCaXz2xuS9+SnQLB
	bvISOkM5Yj4dgccMP36B4IALtLAvufk3Qh6aJZ7Cs0kPMQFP+pXM8gzQo6PCQCYMcYox2HvGIFb
	diou8MYaDeDWYw0tQf2BAHiyKH5ty1tBDwxOxs8W8tT0JXnHELWuMqiINvHhbmhXZ0JYnx3Abp4
	QgSUTRIupkKNKQYL6lZKoI4FMjJZsSj4/zJnEla+iPugTEo7OWrj8dVnPEym7exN/EgR6pnIlKA
	eT0id926X1GnzdnN/dqP4A==
X-Received: by 2002:a05:6000:4908:b0:48b:e50:7152 with SMTP id ffacd0b85a97d-48ddb2ca05bmr3010994f8f.28.1791810204783;
        Mon, 12 Oct 2026 06:03:24 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abdaa5sm20088782f8f.35.2026.10.12.06.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:03:23 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Mon, 12 Oct 2026 14:03:04 +0100
Subject: [PATCH 2/3] media: qcom: camss: Add the SM8550 CSI TPGs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sm8550-camss-tpg-v1-2-620ab6f151dd@imd-tec.com>
References: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
In-Reply-To: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

The SM8550 TPGs are hardware version 2.1.0, the same as x1e80100,
so describe them with the gen1 TPG ops.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 drivers/media/platform/qcom/camss/camss.c | 50 +++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 5128dae79103..70f327484503 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3553,6 +3553,54 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 	}
 };
 
+static const struct camss_subdev_resources tpg_res_8550[] = {
+	/* TPG0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg0" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg1" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG2 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg2" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+};
+
 static const struct camss_subdev_resources vfe_res_8550[] = {
 	/* VFE0 */
 	{
@@ -7245,12 +7293,14 @@ static const struct camss_resources sm8550_resources = {
 	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8550,
 	.csid_res = csid_res_8550,
+	.tpg_res = tpg_res_8550,
 	.vfe_res = vfe_res_8550,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.icc_res = icc_res_sm8550,
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
 	.csid_num = ARRAY_SIZE(csid_res_8550),
+	.tpg_num = ARRAY_SIZE(tpg_res_8550),
 	.vfe_num = ARRAY_SIZE(vfe_res_8550),
 };
 

-- 
2.43.0

