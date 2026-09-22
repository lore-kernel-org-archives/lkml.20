Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6916B47F3DA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102711; cv=none; b=pvUzWcOyW8cIdL04oWVBfTCGUvsHx1/5X0AxtpuJALke1Hn3esCBcE2f9uih07pfZ+HT9aY3o4CzJPVQd5YsPG2Ua++ESfaftAp2zPUdP10JNG/RUcfgrSlUQpxqVVX4aEXPFzUymlvCe18ALkQdN3V0ceJb7rOdwQxGNm8yqPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102711; c=relaxed/simple;
	bh=1Q4uvfDk4TliYmTHYv2Ve5KSV0agU3eXHSIiw7O5VGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9PBrFt1pirynl8/P4eHE9LeF0KRH67z0rvu9Dce1x6RLkDUPV8bZuV1VJrBieud1bmANqKrFro4s4jXNCNGAmrv6maOBn6sI65HuOJgOugpcPkmxmWfo7dGsrj2P/AOuR5h2TaYs/CddEbdHImAV30vPfCaZZN6dKQ5mnRIho0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HC7Cx9nc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AfMrm9un; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HC7Cx9nc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AfMrm9un"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6wV61873469
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bre1XGDEQBs
	b9HHiSPNRvoWE3fMANV820bNftGvNCDo=; b=HC7Cx9ncz0mEjr1+9IbG8KM9sv4
	+L9JiNKuJMq4rC0/o1fyRIvvoFPoN/74WUdOp+Yoe+kqTa2E7z12cF8NVAJUt+ZS
	rgxbggAjXvvnQh3q1s6iJaJ8/N9PJVV5R2ee97ozLLx5ttBfsNWKFMlvwaBABsf1
	DUNHwzzbmkV+CPXKkenukCIZElY3ZaRkFsme/HQ9LIRof6rR74VLzWkoukMs6pR3
	gLt+Ei7nZb+Di/09F5EyQTQtA8RXji7XAb7b1wAivhZZuLsfC11SDSnbtZN6nVu+
	5mw4bg/9Dtk9wQOIWHI18HTfX8NIq5xu1eJs5bOUo4nz1XSWvCyNqmxTYsg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4teu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:45:03 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c82f879767so209750e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790102702; x=1790707502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bre1XGDEQBsb9HHiSPNRvoWE3fMANV820bNftGvNCDo=;
        b=AfMrm9unS/yVCCbqVdOjJ+ZT94laTMIFmVa/GbiAAlXTruWUXK8RCL+rsxCJ0PLF9K
         sZtgOjWiSsSsOdL2k7ZNl+Ft1ebYxWfN2kfmoEtl6FUu+P8yk+FR3IlwffArah/wA4/Y
         fVvQMriGDLLlT4m12kpTKEUZFkKsViLF+ukKBVPGzbNEPNN1acByLeM0It1vy+juukLv
         gi1K/U88wUB0IZVcXQ5whZX3Y+T1VTuVHmkixd5w+o82kjLedNJAONT4fa5A8/t5fp5r
         VmAQqvfGxp1nfTcuc80eiMm9BfgVeYfoAh8ptY5Sn48fIQ2i9XMPSYzVqw5EpS1SWMrM
         VpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102702; x=1790707502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bre1XGDEQBsb9HHiSPNRvoWE3fMANV820bNftGvNCDo=;
        b=XatoIcwbTqwPKNYYH0hQgV5AnroVh8/kQ56NB91t5UZoy7s3FkD0DBWtz3dikKSFSa
         aW2s55FoIhFBeprI5OnidEMN1kqgTPe3dKwy0z/Mr2v3OLsOSk58lPfp8w8zz04abUHA
         uev/YbCxhu8QP7Q+NILZqaktik1w5qZKJMZDFXUTBEmn0IdF7yhOvtno4yAofftrZ2kl
         tNxHyTajI8vejoi2Si6VRx1BwikdHmrAnq07cUi778f+0QapC18lF0vJS2xphKI2ABCp
         dxpheZe7kx9x8+DVPqoWmgRfkKRioit4Ud3Z2a4l+7fmdC01+rT98TmH9QoZsvNaMwA9
         nwIg==
X-Forwarded-Encrypted: i=1; AKwUvBzYadoIC2ZZBbF6LB0E6M2TbfCDLrKHqEmYcdVQesQ+e61eSzU0Mz+ElLuKeKWhTEx2+q4ec30CRbeP3A4=@vger.kernel.org
X-Gm-Message-State: AFuF++nKt8sIZkKqC5Ur6oMdfQJ4EGQxxLBeHMhTqWBKm/rVaKrbH3Dj
	sYa2Qpj8BFiDWbsVKkCK2Th2AbQPK+n4YfdwehvxN8saeSmoxprDiHAjjsZ5f1EgK4gXklI8ngD
	qHzq8tFwT499YlU4O60oQdmMuqJP2N/t3/5XTIM0eUq64xV+af9BOrFW+S9TSejytqvI=
X-Gm-Gg: AYBFou3IfyDe9eKnmJK8reyYAEEFU3YYE0GRfJFGzO+HvxBXOZPvkqaz3K+k6yp2eWn
	HwBRVDW1goljTAlAge0L8S/JaNXMC+0bO1VNF9UOmZxgq+nSl7yg0YjqsJJD/YFoeqBmYRCG6Y0
	1PwnWJj5Kdrb86tpMW/RWDT8/nCdgX51vlaYJpn54ZZUIlBD0Gy/EmNltz/81F/PQdYISqeZclj
	pgBBzV8Re3LWHn1YGPTeQKNAh+62fq/MXENjkJdD85unyLen4VdY5ykUYhVWx9afezV2CqH1Ltn
	5rNxSxdpjIICqXEnzCepxrdSQl3n4kdv9NN32Cx4e6bLAbebr8WzGM0lc63lusUituu33ftlXp/
	0ByLgAIaPs1bwp4foriZgQ4pggp91tC3jn2q6Z++UExY6hjNx+oHLpAZYpMJoUzoF
X-Received: by 2002:a05:6122:ca8:b0:5c8:2852:36cf with SMTP id 71dfb90a1353d-5c9f159af31mr774618e0c.4.1790102702609;
        Tue, 22 Sep 2026 11:45:02 -0700 (PDT)
X-Received: by 2002:a05:6122:ca8:b0:5c8:2852:36cf with SMTP id 71dfb90a1353d-5c9f159af31mr774584e0c.4.1790102702146;
        Tue, 22 Sep 2026 11:45:02 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm374681f8f.19.2026.09.22.11.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:45:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/4] clk: qcom: Add lpass clock controller driver for Glymur
Date: Tue, 22 Sep 2026 19:44:25 +0100
Message-ID: <20260922184425.56114-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfXzbVcKG1v/klc
 VPan18ek7G/uUUJaAUcVDcHT2V3f5ILLXbBuQsrO24hEWiuIZPnOLmTuyLPlWDxgdJEkUusuG+I
 n5Gts/2i2goTOFvm266nYO5zf1HOf/nl68wdzZok/ulKB2sVhiTdXZs9skPGZLj1XzRmP4dVWL7
 9Yg2VHudopdicRsulOOPNwC50SFhftJmYkkCBNiW9P1tNUHqRKvrK6ntMcELA0Ji8DzOzkvoYt1
 uMTtFLAFrNMScC+S6wigMDVyUOv2nOgJxkqUD56rEJS7zWRnvn+fyXTGqzi9IjoAdpbWSSaxCFb
 tB3DE0JR6XUwDieLTy3eEmrg2FFXdIyehh7GuDgc+LVbfytfHJNTY+rUHBQgbnQ4ZRiE/Ty6Fo9
 NnCEylcgeNAHwik7+lEisHWDLcwF4C35fdb8n/PcmWoxQA5V8FyAGvBXqD8RutS2atm8hyiQhxE
 Tnfnkrt3U/cIrqrT1ng==
X-Proofpoint-GUID: Bi1cJXqcrrxzi2uocnDb4QVilfz8Xkf1
X-Proofpoint-ORIG-GUID: Bi1cJXqcrrxzi2uocnDb4QVilfz8Xkf1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX8EAcogH/sCje
 Du8yOq0cFmH7ha9t2owB/BCXdvtJLY+h3VtP0jDu3YuQnav1piWdWSKqppJtl7TISVP9ZPT3rvh
 KRJjdTJWZ/UAUzF7hDFBaZF50A/jYLQ=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab2ccaf cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=9d4qlcpUcIswrQQTxZ8A:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220275

Add support for the lpass clock controller found on Glymur based devices.
This would allow lpass peripheral loader drivers to control the clocks and
bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscc-glymur.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
index 97fc099983b6..782183012d97 100644
--- a/drivers/clk/qcom/lpasscc-glymur.c
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -39,10 +39,31 @@ static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
 	.num_resets = ARRAY_SIZE(lpass_audiocc_glymur_resets),
 };
 
+static const struct qcom_reset_map lpasscc_glymur_resets[] = {
+	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xa028, 1 },
+};
+
+static const struct regmap_config lpasscc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-tcsr",
+	.max_register = 0x12000,
+};
+
+static const struct qcom_cc_desc lpasscc_glymur_reset_desc = {
+	.config = &lpasscc_glymur_regmap_config,
+	.resets = lpasscc_glymur_resets,
+	.num_resets = ARRAY_SIZE(lpasscc_glymur_resets),
+};
+
 static const struct of_device_id lpasscc_glymur_match_table[] = {
 	{
 		.compatible = "qcom,glymur-lpassaudiocc",
 		.data = &lpass_audiocc_glymur_reset_desc,
+	}, {
+		.compatible = "qcom,glymur-lpasscc",
+		.data = &lpasscc_glymur_reset_desc,
 	},
 	{ }
 };
-- 
2.53.0

