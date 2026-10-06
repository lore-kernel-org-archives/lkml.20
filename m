Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE27B3E0724
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 08:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791274618; cv=none; b=mGChrSFA3dVmZXvuXJBIhA5ojjz0+RPNdWDWgDJHNFXLXYHE5sa8SUBluIGwtGc26yRuzafkOF6bX9s6h9cRQ2G3dTB9rPdoFt/2lrz2uC7iDVpb+8sGYQ69wooA9ayDgMufnbktWTKkBug0ttG3RvDkiQT8XqLjLCM4yGar/ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791274618; c=relaxed/simple;
	bh=r1edbWID6BHyGGO+La0zZuQuA2P2eLpIcm0jEp6Hnsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Q6nKQLXRmzWJqyxWECEXaMfeoV6rfltsELK5K1xsxPGYuG/gPaL+AVG5TKbkBDew6nw0NVWJD0YwCb8hpzSkU567LpBDgrZ/j2BYeyXYrRVfjgbgE8vaFZlfRUeXH/xTK8BrAY88MlCr2YH+6UxcFCt0k4KfnGa+QlLx7XHSAlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ts2xmcHe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VqS0QG6g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ts2xmcHe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VqS0QG6g"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eLrJ418970
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 08:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/+yEirwMAP/6wyo/OxO7wX
	cw5TJycM3pvC8p/zwpENs=; b=Ts2xmcHe8S4dc7Dh5bbcdll9QpIYjqkO4K2u+e
	GlwqbYPAoa6UrKqGVoSfWbTGE7LfRWNN53VJb+nAC/msZwpJpPbaeZPGVVDLGHcs
	LkO0pydSzX7My6hZbJ/0xb1ZTgCckgv+Brsd5AogapyLrXX3oYL4HI+bQ7j3nzYx
	APUWmAL3zhQxIg5T+ekRowRBUEiyS5N4OwHdXVuDDJlDiq06slevGW+FWadDIv49
	CMCpC35UWfLcd4UFelMulXmWB13MuLIoowsL1ielHZNawYJrBa+0NLn7UQwbE68g
	dF4DZ2ImPeTBMDhW+v2FXT2cPDRKE4ekF2V355eW+6UwSWgw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4bhg45vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:16:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so2655737a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 01:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791274611; x=1791879411; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/+yEirwMAP/6wyo/OxO7wXcw5TJycM3pvC8p/zwpENs=;
        b=VqS0QG6gY7Styi7G2zADW0CyW2nb6AQVvknK6Ih6xS3F0cyPOCcNzQO6CaFoYLJ7dK
         6+/DpUX2SZdDDneky6pKqocnvxBQIkwst/29/x1CgTfz8X1oLHSYz7q8wOBi6Cp9Hl2Z
         QH3cYMcdzcsCukErZhvYh8q/p209WmnD/Xh7MKts58bS6T1/a+WobyteGTzXrUCENvCi
         4gBgD1nTRSfT+d9oFeDKxjzRF6tTWZeclj1K3U7BBVXHZOzrFnXLEOa17YvCumsJeHAL
         65oClXlzte9hxhqhoC9jyWASQacS6XmR2/Gj9q+YNqZcZBFP2JgJjb02GCZRG0QoZOcy
         dW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791274611; x=1791879411;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/+yEirwMAP/6wyo/OxO7wXcw5TJycM3pvC8p/zwpENs=;
        b=bpkYMLWJFPIywHnFeLilD+W7XUPeND+92HbebikS8JONaLUN+ekm49zZ7smRkfqHMI
         MvHPh5uII/Xl+eGagoTqA1qVZ2EX7iO76Vw1d7hCJrh5BW+ElM0o7Q7Wt5K/MQmg0H6D
         Uul7nBXt8zIK8aGWBHi3zZ17hSESOFz7m2stkFkK6nxJxYMBitq56fPWyWdSfunrSHw2
         82VJQwcHcdcj2XFHMWV6/+L6XAWL3Ywec7+PsCr53AQ94kJodkZaGIm6YVWRmAWtlhe7
         hdBnNU6wCqxtbZKhRealhIGJy0Wfh48IQTt6FDDjgX9+xcV1YSaMoWsSWJRftdnvr2NT
         JdIw==
X-Forwarded-Encrypted: i=1; AKwUvBwSC2ohTSO6s9rv8UPaoUWOdsKU2TUMQwPt2a4cRJD9NwhZz10Ynq+vrWaKYHnSV8lCr9XaBH1RHbWUvZ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2uwO0V4JC6pgA75m3idduHkEzN2bUacoiokkt7/N9DEFu55Cw
	XvZxZy7eQ+nB/fp+BCX/UW9ZiCDKI52tpBN+BiMcQx5JNHEacGzB3XripJkb0kBKkeZ4Kb+mhU9
	KURivXw0MgHyQFfB9wRrWKcP71zTVWdzKCxMSmuk1UT0DZrBDe+Aie+/X03JsLqxlW/U=
X-Gm-Gg: AYBFou3KWM9Wen0KXXT1x0NSHlTJaltUN+oXJW0Xrj8OifxY6m7PwevT9DZpbKqMcwx
	T5RG8WZvAARJD0jlkFswsaiQBoexEznoFnJg9ATgGoyF90LzqktfYrKwrhodnwlCyLROFA11QpL
	jJHEY/XtmM5hZxDU7i9GT41FVkeH4jRdzOPxT7kN6zryNzeQPAjhKshsEt3tVkCm8/Wy7nHloUF
	68k9KeoP3H3ob4lc0v8X8EeHfNW8/x6d47JzJ1VlEi5/2Vd4U/5+dTiqf8rUd7qZdrh/Bedu5cC
	6K7AzcOeIJkKWBJURoESOInnx3/WF2GuVUpy/0jnJxYPYOFESh8ux8VS6Mt7Jj6iy/6m6h3Y8pI
	9BF2SBUFHCBTn7Vjj1F+XDlitaBMmsjRGuQ==
X-Received: by 2002:a17:90b:4c8c:b0:3a6:f90b:20cc with SMTP id 98e67ed59e1d1-3a873763609mr238470a91.61.1791274610496;
        Tue, 06 Oct 2026 01:16:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8c:b0:3a6:f90b:20cc with SMTP id 98e67ed59e1d1-3a873763609mr238457a91.61.1791274610013;
        Tue, 06 Oct 2026 01:16:50 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cac663sm3700800a91.9.2026.10.06.01.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 01:16:49 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 13:46:20 +0530
Subject: [PATCH] media: iris: Fix VSP clock calculation for high bitrate
 streams
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-fix-vsp-freq-calc-v1-1-53532d893852@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFOuxGoC/yXMQQqDMBCF4avIrB1IAkbiVYoLEyd2iqQ2Y6Ug3
 t1Ulx+89+8glJkEumqHTBsLv1OBrisIzyFNhDwWg1HGaqUajPzDTRaMmT4Yhjmgdt7Z1reOrIH
 yWzKV0dV89Lfl618U1n8IjuMESk0VgnUAAAA=
X-Change-ID: 20261005-fix-vsp-freq-calc-19b967b79e62
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791274605; l=2846;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=r1edbWID6BHyGGO+La0zZuQuA2P2eLpIcm0jEp6Hnsw=;
 b=XWH9e957kJV8PNpzoQrSs8jiiNi7LRxC60IDgsEfqXgNqQ+cR9EA2DL32SzP8VSa1CUQ6BeFz
 0SqL8v/olo/DyFLJ67GrMl8XkG4CxJrT8o8ce7ZHN/rFMM/zEMzSP7g
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: d6Y-Sd8fO35hZZ9ZfUTboJ2WqcnepqEx
X-Authority-Analysis: v=2.4 cv=GMGdgeNK c=1 sm=1 tr=0 ts=6ac4ae73 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YtTrQ6CoiT8uxSe-FsgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMiBTYWx0ZWRfX9lUWryJDbOXl
 IC01QNoYTbuAnINBMq7fbRPv/ssqy96+ZvzkkkXUhBVb3II0qXoMPW6nOr2cCd4sn5hSfvuPuEh
 Yzovl2vdvE8iJBzeoBAWnpkb4eBomRE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMiBTYWx0ZWRfX2+GtLWI1GNO0
 NdHCP8fsVGjT3akz6h+Qv7Fb25PVhZzLbmAcpKQQA/JavCnGS9A3nRyEG+Bt/07sX/ppuWRAt5H
 eedpNLxu+0hSo/EafgVOjrjVFWxV+XC96egFAnVjKcW8ObqZMm45GQ5l83AYSwxALWJcnXTL3nR
 q/LsRos/g+LrcXGltd/Dt035nvOmyTtIeqQihX93zRW5FRvWE/MEA2XlS3K2+rx5P9OlVdgnWrx
 EtWmLFauva5wWLGct/cDKVuOAiWxtIwi3bI/B8PjCx+yqC4tZ7qgYE0zzIi/DvIANxpZU6AMoN9
 Qrn3D92CFLAhOhN2M8oIw6te5SMsklwFYRLzmSpS2gzvgzS98UNltphd3jidXB3PhuRHT4j8iqW
 z00rcgn7wwZGbazNkRyF3bqZQkL3eGShrLXZcgGoUiAZHi6GEvkC9EO8T3wVBwQCviko8cdREv1
 6BQDlzl0DaoD5SEffcw==
X-Proofpoint-GUID: d6Y-Sd8fO35hZZ9ZfUTboJ2WqcnepqEx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060032

Frame drops were observed during high-resolution streams decoded at high
bitrates, as well as concurrent decode sessions. Analysis showed that the
Video Signal Processor (VSP) clock requirement was underestimated for
these workloads, resulting in insufficient clock scaling and reduced
processing throughput.

Update the VSP frequency calculation to more accurately reflect the
processing requirements of different codecs and bitrates, ensuring that
the requested clock frequency is sufficient to sustain the workload and
prevent frame drops.

Fixes: 82b96a8d8d6e ("media: iris: Move vpu35 specific api to common to use for vpu4")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 29 +++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 243bd845349f..c4762229a1de 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -454,11 +454,32 @@ u64 iris_vpu2_calculate_frequency(struct iris_inst *inst, size_t data_size)
 	return max(vpp_freq, vsp_freq);
 }
 
+static u64 iris_get_vsp_ref_bitrate(struct iris_inst *inst)
+{
+	struct device *dev = inst->core->dev;
+	u32 codec = inst->codec;
+
+	switch (codec) {
+	case V4L2_PIX_FMT_H264:
+		return 150;
+	case V4L2_PIX_FMT_HEVC:
+		return 140;
+	case V4L2_PIX_FMT_VP9:
+		return 70;
+	case V4L2_PIX_FMT_AV1:
+		return 100;
+	default:
+		dev_err(dev, "Unsupported codec\n");
+		return 1;
+	}
+}
+
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size)
 {
 	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
 	struct v4l2_format *inp_f = inst->fmt_src;
 	u32 height, width, mbs_per_second, mbpf;
+	u64 vsp_ref_bitrate, vsp_ref_freq;
 	u64 fw_cycles, fw_vpp_cycles;
 	u64 vsp_cycles, vpp_cycles;
 	u32 fps = inst->frame_rate;
@@ -485,7 +506,13 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
 		vpp_cycles += div_u64(vpp_cycles * 5, 100);
 
 	vsp_cycles = fps * data_size * 8;
-	vsp_cycles = div_u64(vsp_cycles, 2);
+	vsp_ref_bitrate = iris_get_vsp_ref_bitrate(inst);
+	vsp_ref_freq = inst->codec == V4L2_PIX_FMT_AV1 ? 533 : 444;
+	vsp_cycles = div_u64(vsp_ref_freq * vsp_cycles, vsp_ref_bitrate);
+
+	/* VSP FW SW offset */
+	vsp_cycles = div_u64(vsp_cycles * 1000, 1055);
+
 	/* VSP FW overhead 1.05 */
 	vsp_cycles = div_u64(vsp_cycles * 21, 20);
 

---
base-commit: f0406245cb9855e6318335a8a223551354291a46
change-id: 20261005-fix-vsp-freq-calc-19b967b79e62

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

