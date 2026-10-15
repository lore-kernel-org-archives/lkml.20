Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D00750C29B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057797; cv=none; b=BaOtk5CLA66/pdqz90b5KNXN7iB9eOWnK5zmy9al7r0gwfkDGElrJ4tV4su7C1HE30CBzsJjxe+sTk361eeCeQyMiK3JKmJ3XnPlpvmZ3ljl1w1k1IgY9ygkmMhVNra6EXoxVRI9h8e1MwUa9kcR598xst9tgcn/B7nvHQFC/rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057797; c=relaxed/simple;
	bh=XvgF8W41tbW2lHMVahBlNpldH+YcMd6GhMO1LMhmmQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MWWjXZsi9XIyq4RpQvjRPNfvRhy4RUXN+SAjBuhMjWyozJvX0AxmaASeu9VLQ9jac4RvggqISoTpRvnxYTELQ0iufOTBGxvowj5E/pVdZxop5mk4ylXBX8OBjrQtQwv1/n1KVVG6XdHravERJZTQ6ZobT6iRH+wSPsx4sgzuf3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=eNDcIh1h; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="eNDcIh1h"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48bbb06e746so840861f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1792057793; x=1792662593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJMs8A9Ik9OWOlzlXjQ55DgLEVWbkbVkWzr7Q1/LXyI=;
        b=eNDcIh1hoJ8vA1phnbTk72RnXHYklVjdn3+7LUg0Z/KUaiQUd3SclE63xHRHLsBb1d
         HjWD/iynYwgBM2M9JcSbdw2EPRZB5uT2XqGsmk/H4pUINhWZsMnI0WDcKuvuwZXRcL8L
         Gw/c2TLsQZNvOcRyW/vtAkiry0i3acAU/Vy9AleLCjpMQrF6Xbu90QZR3aNujgvDBhMv
         7TFVIJzS3aTxiD4GHC+TmK6DiXWvwEAQROb3GHu6yKn7rVYYChlNkrfk1S43OeVVzCLd
         v3u6wvATNL2cf8Dm1zgcKYsiFUXnBJiR6CgqNlYEXaLwyXCKD32mKu5uDTOqp9DxeI7K
         ZDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057793; x=1792662593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJMs8A9Ik9OWOlzlXjQ55DgLEVWbkbVkWzr7Q1/LXyI=;
        b=pfBdTwRmUirkDfwHIHilcRR6RfnPlcQBjT5IjGH76s408zzGXw/UoejuJQWUyPF30g
         cXsfYgIVlvqQTCCq65r71xZNqYrdGHIetIajR5Tj27TooAYWJ6lxOVsms6HvyY+Qk+Lk
         Lbt8YVyAwuGTOJnAowcLwnZR2+GQMz5W7ZDC/6LVnK5UfL0y90g8xCHSA4lGluposz19
         wwrTXYOx62StVKkk8mAK/4u/2cADrAFz1wL2RDZsl0RZL9qaxX1u/aH/6CO3w7Xr6903
         5sH808duX1zUmxUWf0b1TrvQzS+U1PR0mszWNCzSNmYTCiXHiBQowd0Pi+tTsWXrgz5V
         YWaA==
X-Forwarded-Encrypted: i=1; AKwUvBzZTYe6kAWwGFugzc1KfU9Athf+E7ijQILIq2+IdZCeJSgc/N2txUUi9HLmqyy3P/wrAC6EX0A4KYsVu0E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFdleeF7cDRMdmdUhZVX3AoLHLEgTF3Y7BO+oFDILBAu4fFZg0
	LDPZZ/HRsTMGD/F3np6aLJHlg4yzDxTb7lAVPe6+a00nm0kjYEiVzv1OVTfvSVWQlbE=
X-Gm-Gg: AYBFou1RQLmgKWMgB38uSyBlv8RXlWhzwS76d5pyOQleTBLHfuq8/o6Uj6sE9yzKrMg
	GYtjzgAMbXew1ogV60nrvsYDJ5VnDsOXZlHK+Ofo2H29V6H/DzoT47cTuk7JoTRy/C+SNhBRvy1
	LNW/f1aKUXttIPV76BrSu2MF6feJ5u64eO+J3qBeji0u8CUjq+NxQqHI6zhRM3XfC34BoZ9YKt9
	Ezvi6fVbTV/JLy0TyY/3PU2S4tLZ7tTAvapp8D/Nn1LKh7Zhegnoyc0XWiEfRYymUk6gS3ptva9
	XIq9SEHijfH71aF9oMaT89vUMwyk/QkCWoh/ZGrgO6YHf4rwtbd2xAxpc5SBh4erl+Mp6Y1Wkh6
	WNCt9N06ZhpU6+A5WwyR6CqDi00ewTN2mOF/5px2ig9+f6CIJSMvFsm/66Ai0aynW5lZDdcLs7J
	YSrgpOxrR7HaRKlaVgr08thH3Sw2mY7LO6fJKWy3qQrD1NFtRThc4+x36/dEPnsbxZlX9yap+by
	xa60WziA8Fm3wKy9cY2d8PxMPmymdEg/cpnabcpsahrqk2xcu6aDxSgcmAN0vC7iJjJTNmaR5Mz
	qT+4P1GxmFAU2VyFvK3Qc13/XY4=
X-Received: by 2002:a05:6000:1a8b:b0:488:88ec:59c3 with SMTP id ffacd0b85a97d-48dba9bdc75mr37096945f8f.14.1792057792694;
        Thu, 15 Oct 2026 02:49:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:273c:cd01:737a:1f7b:d586:a293])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm16926246f8f.54.2026.10.15.02.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:49:52 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 15 Oct 2026 10:49:31 +0100
Subject: [PATCH v3 2/3] media: qcom: camss: Add the SM8550 CSI TPGs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8550-camss-tpg-v3-2-00fe06a3c557@imd-tec.com>
References: <20261015-sm8550-camss-tpg-v3-0-00fe06a3c557@imd-tec.com>
In-Reply-To: <20261015-sm8550-camss-tpg-v3-0-00fe06a3c557@imd-tec.com>
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
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

