Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304706;
	b=d1cjlRL9c6rcA769dnPU9Bqwy1F2NV50jDDnsQQNjab1x/+ey8BFfJr8OMXfxVfpT21L
	 1cW5YjDlJgabnukd/NlRKPQ6OlDClE2c01am+GgKvediom7VnhYnClSNRtMEgGQguRDie
	 QfQysDrL5nEy0Z2WqWEyu4BpadCXn/ysH1gk2SIriK3GDda9BArcgizIt3qQ1llF9Mn3b
	 14HLNorgAyjhTHYP0g5eNg0ImrxyKki3JQTxe8MwqODMf2QjHg6bTKq/tFcjgmzhzpx83
	 jBl6uC84eCuu5kvBzOMJFpufi+H23Mv8kdnqu1kW0kl4zuRW9gbU7MrEP7LwbI3zvHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304706;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=riYYaHAqjeIdiWCPuLdbc8hgds290pjODW7RjCbA2ow=;
	b=PcKDBHvzW0alj2H1RieEzLVJj6TA45FgN3ZnmGY5pqd5G/SfA0nE1+14oVQF/Nku5hFx
	 rYd0Ng26iSLmbNo6iPpEHOp1rNV1HtVb0N2gZ7H1Ze3E3px+2rpydGwq6F0PjfxcAsywW
	 kEgOGOogNVWRUjSx7reWTkuyUOQO3aAkTQhnndUKMiW+hiK1ZN1p9Qf76eWyQ/OZttVeK
	 HX5pLcgWbRoCSFeUOPUIRoILbfeqCgTfVWyAj5tg/ADk/nq+3TvnDS9vTbvivQmJCksDw
	 Nx1UYCxYuW/bdM5iKLEenX3Fp4f52K12NfhQNuySSZurKoUuptaXZETtft+HMq31vog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YwYiODmX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PTZfyE6v;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B044D60A2623
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B044D60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YwYiODmX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PTZfyE6v
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l4aD1681291
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	riYYaHAqjeIdiWCPuLdbc8hgds290pjODW7RjCbA2ow=; b=YwYiODmXjRJmEA/T
	q6P88I1GJDSo4yWM9K4B4cXdQPe4Sup3CKQdQ/kwbqzIKkiDN/H+NduBKs40F19E
	izpTQjJq6+VS6SwjIYWQ3WjRcSkshwVOgQnfMWFFSYSug+Q4RzfYO9sNI/Vx90/O
	Jr36nEk2KAK/FdAfD/W17tDBGC0nsTc5yEzzo9yTjA/nF3mkYgibEwQfjPtMLzGt
	G2fjK6hdJ0rKUSmoXjxEcHrTxRTSxpVhvRgqwQAlm0tfhMH9Fag9jE9OxlLIU4ek
	HTb4YprNc3AGKWKZEwWDzZ4ZOJCci/6nSQsW/mFuEabjNh+IoNFtHheqkXvU7ZMo
	XjtcXQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkjnpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:58:24 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1aa0fb7f157so2920606c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794304703; x=1794909503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riYYaHAqjeIdiWCPuLdbc8hgds290pjODW7RjCbA2ow=;
        b=PTZfyE6vLAGpYykXJnn/H+E6YOIyof3iQ/a5YHG8rxsRpgN8kWOxC7tY6q4d0ds4KU
         z8BtmJmwyiPYDAMj7qdFk8X+2fD62a2RsUr4TgxJUghfhX7kq+s5LU2W2i2fGHlXhNS5
         rIN1H8nzAp2JDvgQaDuBYe66CbV8la29BpMOWWIOrtrwWYhvvmSFolZe8lHEUwpEK58/
         nsSGA/7qLatRa73y6e1Z7Eo45gi2hOykGjOkrDrQqy4Ty5ZzPIlrnsEZrZITU0FO5buD
         S4FyOwJO4NqRgVI8PL/EwYCXobpApN/CH8Lsy7UISTvaV9vCpMp0EJ1DphC2CbLPAXpm
         3POg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304703; x=1794909503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riYYaHAqjeIdiWCPuLdbc8hgds290pjODW7RjCbA2ow=;
        b=2ODxl7VkfTGfGHud2IAnCAJF1+PyagzRyXGsQlrsXnYLEKhZMjK4yDMlMa/s3VZx+y
         yIC41ndLtXbID7pf3nxtr7dsF0YBRXl4SKZ658hbpCv40sw5irtDKw1jnPXLO57LeKxP
         dNFGaa/rQRpsOsHQOOqwAUT5IIv0/oVTuts8gQY9au/ENjBjoJ7DcO00WkiWQfcJGZaX
         PkTx2kWQlyT7J5T38mMpf/EpuYi7S/dBkjhyyhaYNn2qdJT556yo8mPnnz60ulUfd3mu
         9yfYivRXjY2vfbEvBG3WAuCHOHgpkaMrsxc7fgrpI+A/6pGO2oEgNiI5p1E/vtnU3gHu
         90eA==
X-Forwarded-Encrypted: i=1; AL+hErEetGC39VGwbpoQs86Gs1WmhNqyY93WuVR/m2qK3HvLudnbndMSUw/7kJj90Op+QBscEpJ9vOpaY3OO0+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wHWhAWibOl0sq0hdc5KnDwM/p9joIj13IMKLP/ErIwdjwuPcH
	GMGSFrVSAYA9lH83lPJbF+LPEWwlebX1G1BbeNzzauRvign3XsEQw39FyYJCX24nm0OWoLNQsCJ
	jcxmy/6tV4cwf8211uVtEa2DqkMV8deabjZb19dvhYAdgGOMgWRwAHJzZ6jslwKLh86g=
X-Gm-Gg: AYBFou3vZW+3uiZsX90FwimHXEF0SY6OjQ9wYR6j+APQ+ezI4SE+8lgEZuHNu8Te6ek
	twsoUG4Er0D/XeWXvk4+zls72gGdq2u4gMAru3gWCgEeKbl1AovNzWHhxXinnrgJ/YIe1aLHd1o
	yTcDZMNCxyoD9MDbVItp6tAUP2fbhGBQQoCsNF0EFMjht4YiCWSMpa8cqdEfENtW3nbOP8L9AAq
	fGP4mdlpcw6Dv0rLvApDTm1K/ua0Ht9U7DgLTi7Yd2feOSPz+o9l8tL+ovJPjB7KRHdcqEOKiwi
	GAZ9y5Yzb/9F17242oJJ27gq/vO1EstfcctpoocQMWgza5ykyYyg/GSltIidhBOJWGfICJ3x181
	Yzmf+1Zq8rehxHN/iX1Ri2Wly7Y1laRKgD1ZqetB0XalhLxvYpGfeCKF6CTzGgVDEn49ii7Eixj
	KDJxjl1g==
X-Received: by 2002:a05:7022:e884:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1b3b6046680mr3319724c88.41.1794304703431;
        Tue, 10 Nov 2026 01:58:23 -0800 (PST)
X-Received: by 2002:a05:7022:e884:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1b3b6046680mr3319695c88.41.1794304702767;
        Tue, 10 Nov 2026 01:58:22 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm7333141c88.7.2026.11.10.01.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:58:22 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:27:14 +0530
Subject: [PATCH v2 2/3] media: iris: Skip redundant HFI_PROP_TIER updates
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
Message-Id: <20261110-fix_dec_seek-v2-2-210d8c4fc31b@oss.qualcomm.com>
References: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
In-Reply-To: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794304687; l=2849;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=9rwHDwJH30YYpsnnhv+f/V2usq3fbaNIKrsSLkQDhUs=;
 b=/hEgDVf0nOZwuvoFSkD+o+esSMm6hLP37P8CLEsIJ4lphz70b+4odMYDw+Mvb/WXrlMsy3EuC
 lUHQYXtKKdrB43IWEaQLOuNGVEpIYEmbKzlXHgFRcEWad89f4p03qSs
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: l8A9eRsa8NzUjzJw3miCQBVRQAsqXS0T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfXyzVSXFXzULMe
 cSBHuBLOzc8NBwdjJNknSCVdkBa1B+4CJhf2q1uZqaV8wpL2NDkm3L3jb5MV7wmf4dhz1r/qZ2r
 wvfgNw7L4m1jYiPcu3Z+5l0Eir7jafA=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2eac0 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jJqbJ-F1a0nUChmTeA8A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: l8A9eRsa8NzUjzJw3miCQBVRQAsqXS0T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX8+j1epDZhhTx
 7+Hd1SPyEf90GkwRB05B+jSkx/wGgvvbySRYU1pc7eQdJdgAaXIpCkir0D9UVpA8kJWUqPnDzrr
 NxJU4gllFUulOTMFn5SYAH8+yqXostn6toKnt0RLP4orYbUf+xFBttTLq+BBQtH7VpQ9NIVR6Bq
 PI3rs2RtrRX2fg098EgtBaV/wxutBQdEASEfJoCyiViROHTiMDp9NdKypXJwmaEQyaUvqguqGv0
 f1snN5pXyKENWywo54Ke3v90reHV3PcJvijoUNdoNGQxgzPFZqM2aUgc9LzjC3/K+PmMBQRUY7M
 3W7H7c4KyZZtBPP9wPV7xcdmZcEhGzrsjggevLHhvmZ9WItGSPzTW5jOxj/35kawCsTAVtUDGZg
 wFV8KUMdEN2K1/QZjQ0C4MPY7Xrb3es4BTLPjm6IJNmhuNvS+gm6XdHLKbVoGx0aMaaH+QS7PwR
 F3C6rw9TokauKCXG/0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100039

HFI_PROP_TIER is applicable to HEVC decoding. TIER and TIER_AV1 both map
to HFI_PROP_TIER and both define a .set callback, so iris_set_properties()
programs the property twice. TIER is programmed first and TIER_AV1, with
its default of 0, is programmed last. For HEVC, TIER_AV1 value overwrites
the tier selected through V4L2_CID_MPEG_VIDEO_HEVC_TIER.

AV1 does not require the tier property. Drop the TIER_AV1 cap and its
enum, and make iris_hfi_gen2_set_tier() read the value from TIER cap.

Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c         | 10 ----------
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c |  3 +--
 drivers/media/platform/qcom/iris/iris_platform_common.h  |  1 -
 3 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 79bbd06ef8d2..706698201c17 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -999,16 +999,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_u32_enum,
 	},
-	{
-		.cap_id = TIER_AV1,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 0,
-		.hfi_id = HFI_PROP_TIER,
-		.flags = CAP_FLAG_INPUT_PORT,
-		.set = iris_set_u32,
-	},
 	{
 		.cap_id = DRAP,
 		.min = 0,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index fac61ece177e..9464543836c0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -603,8 +603,7 @@ static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
 {
 	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 tier_cap = (inst->codec == V4L2_PIX_FMT_AV1) ? TIER_AV1 : TIER;
-	u32 tier = inst->fw_caps[tier_cap].value;
+	u32 tier = inst->fw_caps[TIER].value;
 
 	inst_hfi_gen2->src_subcr_params.tier = tier;
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index cddab9a9c375..973a6f91a49b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -135,7 +135,6 @@ enum platform_inst_fw_cap_type {
 	LEVEL_VP9,
 	PROFILE_AV1,
 	LEVEL_AV1,
-	TIER_AV1,
 	DRAP,
 	FILM_GRAIN,
 	SUPER_BLOCK,

-- 
2.34.1

