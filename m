Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB8138656C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790442601; cv=none; b=al8CTQCZ7MZBCK0xK9MXafxqKp9fdmVOlsXtsBMM35W3I/WVVXRdxdLz6dUm30YmMJcsquG1YbJnKPY9yLpZw/vZqdMM2pz+LFkufJV4PYupaSgJgyPUa2SI+ukzpK1kWWoOgk6TbUqqz+XlNAgEg41o8PmTAhdA5PaLCk4iZkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790442601; c=relaxed/simple;
	bh=PEgIh4M/astScc84Iv6ct6kewphSkXqlkuVssPAXI9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QGJRHBVdk1W/ZZSSL7LBFusrFC3zo4f51c5T5g8KE32OaTo+/zenhWZoNSZZb5V3wGxvLQptyJiszfe2nxVngtsssPiU7KoCJKTuSi7cqFgChEqRVjjg1aaeyXqtuVXOo5qhLmBDaDHjXs5j3oN3quEFTwRX9Giikr0S/fLvF9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gzzMPzgS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+ggEUz+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gzzMPzgS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+ggEUz+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxOow3793018
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gtpnTYMOOxXGC2zn1lUUjguT+OqopJOrl2umsxLDW3E=; b=gzzMPzgSY1oWD70S
	Edvb/+PEJETLM2dtYzWNeO2194XaFJMCHZyM1RJIjfg86sqWsmjjeuSE7+Q5KoQ3
	ExbbLPj8PQ7qp/c4Ja7HLRp5bl/Lkp+L50uD8LcRaMp9vszIrMDhdCYtrqiYv9tF
	1oD7FZBBE9tGgSNex1wCXzDWKPLbm4lrUgzDPkvoP6N1nTKAhKAEUtnEjMvK8L8R
	S1TipA4z8TjQIIIm8SMpU7XnqQcn898kJTH1Q+NLkYh9fSS7YXxxCLVW/YMYy7tb
	0trbModi59PkHX+R7h2nENJlI2k7SgNRqArcOq5LK0Tbxf8LVcKKQYj8D+TL4zBH
	vlImnQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx7b9s65w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:09:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33baaba6371so5066200eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790442598; x=1791047398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gtpnTYMOOxXGC2zn1lUUjguT+OqopJOrl2umsxLDW3E=;
        b=A+ggEUz+CnDJxGcm+2aPoz4twfd2Ecn/lntWKioB/tL9C/O7FfkBx/NO8aY5k3fbTj
         lYdrLDleCfQlPk0Ptw00AOld0H54rGc/zuLJ1B0hpeIhjbFvaFhEwCi0x9ryjRAbSFdt
         BvqYw+fBQN435LZUFOlKJ1uHE9fdeEih9siJW0oRPpiTac1KuXntHEVZe1awWz4IQxU3
         oYkQBhlhl7XgUEPYJrtbTBbfIFu7w4Hy9uJDsKmzOxXE+UKhhDkK7ZSU4uDTK4Ga/76h
         cV/EXGj6KqUUMc0dUFYA1++uylU8mLTBjffBJq3Na4z24lGMA5y6NrrC9rkYukHN5lY0
         dY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790442598; x=1791047398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gtpnTYMOOxXGC2zn1lUUjguT+OqopJOrl2umsxLDW3E=;
        b=WrjfecueFkiW+75rs9sN2zYEDQHeFNCqzpMgTZ22SQt5UwVZVXKhG53iRftcSs8mlY
         NihRPXvftm5TZd7xP5Qg11h1soR5di+CvrXSPMu1iXy8X7/7CA/NOEgYxjkAxyfxPQ4A
         Yki/RYKRVB9i+QtcIsuDZr7brJjYcpjeTL3MWLgqFdaFm4NxMKo40XWJdar21H2uQxyo
         VNAuzjZdH1eDU9/wGZBRw6wWuMLd1/1N1OhOZOvwaCbp9ZLFM70JpcTcGtTGflJrMieN
         6FDKrqFA2xNaI3Dw+bxyc8z3tA9w2Gi5YkYPpriRC8U2y4zPoYQvlGrEp7AczKuvDys1
         5h3g==
X-Forwarded-Encrypted: i=1; AKwUvByBnNfnpYPoG6YqLCntc4EoZZ4MuEJpL27i4GlEVvN/86UqAF0ncVlB0hA7dQh6F6hJE+GdkZZ2sQMXNqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMW7cksYg9R97OGHkxASBgQEYfsTO5Iwe7YnNgT/QvK4OyQmlI
	ieomv1Ko4M96PLiqacVpKP//WNeCUBsw9HrxaJtvLDCOL59TxffzPh1CFVht2rygM2Y228wv+pX
	rB8MLtuyYZKqBV3J6a1H5ww/R9pOncoW6TW/Zo+HCkdnNIYqYuPBa3hUF2QLflqY5qgk=
X-Gm-Gg: AYBFou3Mw7/cDpTJGS/TAFxU/vn9qlR2FdPPq5QJqwxZ/zkxttjWTRrHmNj/BV14cYB
	tQBjAqxCMBl7inWwALtkV8Br9Nlko/hyz3o5ow339chL1aBQv7FaTkgjV7i7IuGO+TpgcTvAlzk
	krV1H+gQKqeCgeN2Gum6kxvfeZXH9hCQ6YA+pGmRqOLR5Rl1RmIbkPPZUgli2hfA/J1hFf47e2f
	vZCAGxPqVBk6Tkox0+2IdPG05K0QpV25hQkSfbzLtpb5S0GxoGYhvRm+xHRUtNzUTqqPqSe2EHo
	KbSsmznyK1I77K94Nm/lHeZyrUIFEQfyTAlScXZuTKvVsyj0yTVUJVe0VfHKP4XlHbM4GkI1dCa
	+PiNlZOocLgKhI7J5CZ9P0pifY9t/gA==
X-Received: by 2002:a05:7300:16a8:b0:33c:1dab:89ba with SMTP id 5a478bee46e88-34272b3bc7amr3450678eec.36.1790442597985;
        Sat, 26 Sep 2026 10:09:57 -0700 (PDT)
X-Received: by 2002:a05:7300:16a8:b0:33c:1dab:89ba with SMTP id 5a478bee46e88-34272b3bc7amr3450664eec.36.1790442597466;
        Sat, 26 Sep 2026 10:09:57 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-343539989casm7382231eec.14.2026.09.26.10.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:09:57 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 22:39:41 +0530
Subject: [PATCH v3 1/2] media: iris: enable pipe for hfi gen2 encoder
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-iris_vbv_delay-v3-1-d6894f117be5@oss.qualcomm.com>
References: <20260926-iris_vbv_delay-v3-0-d6894f117be5@oss.qualcomm.com>
In-Reply-To: <20260926-iris_vbv_delay-v3-0-d6894f117be5@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790442590; l=2664;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=PEgIh4M/astScc84Iv6ct6kewphSkXqlkuVssPAXI9I=;
 b=y+MdFOqWykeSskHfEXvGdSGQ7zvJBgCsSX5tqXl9hOBFL7YJ7HrxkxD0iU7JM+7EFuSq7Qab2
 QyOdKbxyik2BOdvgKEJor9FVXRGkJKNxhXO/Rr2oJI65NwwoxUlOERp
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA2OCBTYWx0ZWRfX9fFTJh3vDQj6
 97pLQRZ91/jMwQ0HGXCF89JevibRhHPXbYo6LzZ86oGu+S+viWIf13QoX5gxUOlFUKlSn6SU0Di
 Y0AYJdh/bZ4wv06BvZ1OQsIcgsgku44=
X-Authority-Analysis: v=2.4 cv=d8FgWhjE c=1 sm=1 tr=0 ts=6ab7fc66 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=loXtWXkZPLyPDUeNfL4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: wIAIyYiDPfdyqcf8iXhO0TAXTVXfImcv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA2OCBTYWx0ZWRfX1W/avx1i+Rjp
 KqwFTYvrT+LVoGeDgpd8OXn0b6JmwGC7sCe/QZyr3CafAv5EyTcbVc/8k1JOQdAYAC3Bbny99O/
 GyWxyS3iJFOLQ7FLoF6ljNhDlFouYE9KHlaLCdNRceSYnmwX3K5OcMG/kXuNdAgQ/yHHTWGXiOE
 diCKTEd3vPRTpeNBdLXk3gFwuTMKC7yhA8iWlIrLXCEbgOTSA4Xkg0vD0Qw9vZTncZx/adY5zB5
 7aoe0/dNk7qKC+xuVURLXGBDRhDvhkYp1LgOGRrkGrTfj7kx4liTyAp1vu7Cq8g3GZWjdt3iSQQ
 NYfI2BRevfHHD8HqP4A73Yqaz/Ov/0ll54JtXxZ8m+R1kcVZFgi6si2xdvfNlDosV9UEqpW5NW3
 eLczf2gGb7eqraIzFUuaH9SHTUa8IPIoU6+O2/WHGo1rz21QYQW/tACDJ87y/MJtkYtlzapL6dQ
 i0wnkchh6mH8DGB3TCg==
X-Proofpoint-ORIG-GUID: wIAIyYiDPfdyqcf8iXhO0TAXTVXfImcv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260068

Currently the PIPE capability (HFI_PROP_PIPE / work-route) is only
wired up for the HFI Gen2 decoder. Add a PIPE entry to the HFI Gen2
encoder instance capability table, and extend the encoder
branch of iris_session_init_caps() to derive PIPE's min/max/value
from the platform's num_vpp_pipe, mirroring the existing decoder
handling.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c    | 16 +++++++++++++---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c |  7 +++++++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..33114d80aa68 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -453,13 +453,23 @@ void iris_session_init_caps(struct iris_core *core)
 			continue;
 
 		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
-		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
-		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
 		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
-		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
 		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
 		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
 		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
+
+		if (cap_id == PIPE) {
+			core->inst_fw_caps_enc[cap_id].value =
+				core->iris_platform_data->num_vpp_pipe;
+			core->inst_fw_caps_enc[cap_id].min =
+				core->iris_platform_data->num_vpp_pipe;
+			core->inst_fw_caps_enc[cap_id].max =
+				core->iris_platform_data->num_vpp_pipe;
+		} else {
+			core->inst_fw_caps_enc[cap_id].min = caps[i].min;
+			core->inst_fw_caps_enc[cap_id].max = caps[i].max;
+			core->inst_fw_caps_enc[cap_id].value = caps[i].value;
+		}
 	}
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1..45a418fde7e9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -365,6 +365,13 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_STAGE,
 		.set = iris_set_stage,
 	},
+	{
+		.cap_id = PIPE,
+		/* .max, .min and .value are set via platform data */
+		.step_or_mask = 1,
+		.hfi_id = HFI_PROP_PIPE,
+		.set = iris_set_pipe,
+	},
 	{
 		.cap_id = HEADER_MODE,
 		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,

-- 
2.34.1

