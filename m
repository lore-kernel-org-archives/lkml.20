Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6C5331A66
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073654; cv=none; b=luuRi5U5JgEqb1zfAR05w/NMZF+cgLr9EBKzQ0dY6zKHqityJbSIlFUWdeahv0DtsspMj/4xGi/1n2O8BdJUdU411BMvTEKiT91pgDCygmybRpQOruENcHl/BKX6w0eN5Y+pKJLjP36fy0gnKYVkP9BO7Bm7fhwN/W9aHa2hRKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073654; c=relaxed/simple;
	bh=7ABxntECG7NT779hQL1aoFYuMX7NmvO2shkDnYZLe0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZeYkawLgQzhAWdZP7P8hyOQpuRt235PAPM0MoB50sZoIIJpeGot28UmwAd+EpZRuXFb0Ikq1EnnEOJ4psB7yCaqyiQfK+gyOrPxhbp1h9syj+3k6xbtSEav26pN1L7zcD7oYu5oKYSFoAF5xtQOrTZS3MXXTLslctdaXUojgPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fuVG6CNt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L5gybcRF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fuVG6CNt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L5gybcRF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPdMx4100190
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AObEZGdXg5sS4kziMxlJgZbdtwqYN1gMq8xe9Kxgv3Y=; b=fuVG6CNtpVeDzjeC
	Jy1A+tltQ2v5RBjkr4NxiTQUWZfkJa/J/uUXKKcr7tnG09KPwvsQiq18L0FB3RQg
	65jqvdYfKNLwHqmbCBBgGAyKaFYPyPCVD4IsNgC0LXbX+wVFR8SMLquOJF4wGk91
	lk4g438cMElVcsRH7rkZ+yCdTjyNSy+rJxTK8dZ4vEZECApVpbKddyqCKiH3R0Gr
	kzoN+cwQFLH7F7OQcfgirYsLWQkEfIL4cFJbwSsfQMCETHemZP85R6x/FU58B1X5
	11B2dTZRb1KQt6SgEzSZqc0EIm6Z8S5LIcSxqRk9+bOuiH/wJ1WFyxTAIwwsyWRR
	EMxBXA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r8uyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:14:11 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6f4d828b9eeso4054240eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792073648; x=1792678448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AObEZGdXg5sS4kziMxlJgZbdtwqYN1gMq8xe9Kxgv3Y=;
        b=L5gybcRFqxP9oEbASXdGB64L0EuL9xqVF/430r07hNXQRuUT805Aojd3wz0v+wnaEG
         sRWxfpiBBxdTNibZJrq+9HK+cp6hfxx9xMffZSELw+ALy9lHG5CF6j8tkRmI624LlvO1
         cbhZCdPjaFWRGjZM3wjFZgvPQD5rQmWBeLI2ridLShRMIoWrL0JZOTmFOHhPoplN75pa
         1S/PhxctYK+Z0nZlMsYkXBMcz+KzFVvHjWq+Dy/l8f+93jfbuBkgiMHVvmpKyfKVcwu6
         A3BFgF7iUnQOadv5r+7v6qhjwTyg58oDJ8GqiZ0sRBDh9h9cfHNQ5uZTh92Yed8GojfA
         zu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073648; x=1792678448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AObEZGdXg5sS4kziMxlJgZbdtwqYN1gMq8xe9Kxgv3Y=;
        b=Amzit7y+J92PMNGEQVR0IWI/5WHQG33+KZYV6XJ08uR2hf4sChS6AnI7VWovi8sdn3
         eu5yqDQQo/BBvHAkUosWJMnm6lezfT/BKOa2gCG+4BhP6KM/EWA7982f8mZEcRF/1Xmo
         ThDc8LdAD36Z/TICq41oH1YxSlt/DDkQuWbN2N6gQtikB2Eu8VivpFLaspCYyicfas8n
         semdH/GUYDGj/upQkikpGSuIxU+byhMC9qY45ebNyBoagHYeTs0ZcbIw0nu1Ad1Xff6o
         Nz282y71MHJwqVDCSK7iZ1xM7Q7npCaMVGSM2kcfxQMjli3baLwqMPbOsI8ccxVAmFXP
         omqA==
X-Forwarded-Encrypted: i=1; AKwUvBxY3PeTbmohIOraHOzD+BCqiWzUQlHB77Z25jgS/HYcNVNdR0RCghZ9piGILRZokjcqq8kZFhdI4gWupY4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLT/NPppUS7vk2wNd1eBkiruBRleCTC+N/NWoeTixYO0zYsVcbV
	b608X32odI/7QLi0WYPWZPFH11wZ0gR5rYqOdahKrkleykjLKT44jQkKu4nTScw4QK1VQvqJxx8
	crjiGF3oeqJKadyi6MqFBfFezf8q6k7+etkDFwiDSTQxE8f9GQX1d2kr0BX6pTKO53tY=
X-Gm-Gg: AYBFou2fG6zgNe/11FGeHqhbVV0RvGEKZSXoMZjmVshoN/Qxi7LwVXpnbDC9aJe5Y0F
	rX9IsJknn0ML2IdTf3FPBpkTU27v6DQrlyXuFiAnNBfXFRD++nk4oYJwxTFOA4shjgJIh8tCkOG
	U0/j74LLy0KllCxalNXvyAhpSJT4PNU2XH/jlorXpL2q77s7Yhf+37G9SSZ3CMN/AKklK0fbi8H
	BqOR9VhpxOBqaWJNsRIZOSgZ6zq2yAo3mRU8L5YPmRuZDvuD2uCu46MhmMqPUYyRkda5z/23WAa
	SMRMs3VJ+YOsFxTSQ7y29Ocfaa2wMjSwl1QNll1QnrnxrGVnZpPO47jClmEgukbz4LfRxCdctMS
	XoP6RbdqEwK6Fx9VpTMfmoO3azJSJpVggm94=
X-Received: by 2002:a05:6820:625:b0:6f6:b13f:5d20 with SMTP id 006d021491bc7-6f6b13f60d7mr7841857eaf.23.1792073647589;
        Thu, 15 Oct 2026 07:14:07 -0700 (PDT)
X-Received: by 2002:a05:6820:625:b0:6f6:b13f:5d20 with SMTP id 006d021491bc7-6f6b13f60d7mr7841843eaf.23.1792073647119;
        Thu, 15 Oct 2026 07:14:07 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6f47500ae30sm11366719eaf.1.2026.10.15.07.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:14:06 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:43:11 +0530
Subject: [PATCH v1 3/4] ASoC: codecs: pm4125: Keep the micbias reference
 count balanced
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-pm4125_mbhc_support-v1-3-8bc1212db6f7@oss.qualcomm.com>
References: <20261015-pm4125_mbhc_support-v1-0-8bc1212db6f7@oss.qualcomm.com>
In-Reply-To: <20261015-pm4125_mbhc_support-v1-0-8bc1212db6f7@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792073622; l=2940;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=7ABxntECG7NT779hQL1aoFYuMX7NmvO2shkDnYZLe0U=;
 b=dsIGx5n/RBHXvfyT99BuqfU0aQTpwd447tfJBU06n8FLUdS9pUoxzu6bEsoW1koHRb3vQwZ9U
 5WWC3ngYO4EBXGu37yz5k38PFjj28Z4OeXOEqXn6+Rwo+nYpByv/S2S
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX1Rfw7Gfa+QTz
 qf487NOIRuBMSB4VdUTdHK59ak+SVpPdyz7UjVEa6ZW8lRdZ9R1BYmmF15b/3/6sYDu0OEijeMX
 LE6X0nGqTJ9GwEnAUoN1kMrf/PzbI4w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfXyCfiViRjYvuE
 TBubCG8tPIPOaQlXe37/nRuq2CEjddhtAsyeDCOPoL84irxItGHG8RNOZOPQsZA8CR+GU31ejLb
 cf/vsqL75Q4NHaLJFqnx+OiNWBKC+7j+oqgRufxcL7uN1Wle/ExOs4suLeYZE288D28HYMx6Ckh
 uj9CRV8jGxYY/D/KVqr2ZsHc8nNjNPqS7KdFXiTx3xcl0/oOLr+aASYtAlruFUAUttzAi1Am5dk
 hGoVPjRgiuGIozQIWkdQjDmw5U8y8JrL3KHNxMbQc+C0FOp6yzfa67RlBuQ2gGObwZYbqzVa1bc
 vg28lqveOmXDT51ssGJCjbfsPHdMEWxS8RgvR2kSCHsWWHrwLhoZxQ+GxfaIj+y/aZHYhTc2swp
 8/MtUoFBz8og7NiWKiz5AfOEbFqWYUrjvIEv8NHryoEylNIP9dz+Hw9xD4iClFr/LSHS2+Wbgto
 q070ACX8QuFFEEdib5Q==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0dfb3 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=a79-ETRTX09cNbBUWbcA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-GUID: Lear2GxgaeCLagY_LFgrc5T9ZVYmfYpa
X-Proofpoint-ORIG-GUID: Lear2GxgaeCLagY_LFgrc5T9ZVYmfYpa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150056

The analog master bias is shared between the microphone bias supplies
and the playback and capture paths, so pm4125_global_mbias_enable() and
pm4125_global_mbias_disable() reference count it and only touch
PM4125_ANA_MBIAS_EN for the first user and the last one.

MICB_DISABLE clamps the per-supply reference count at zero but then
evaluates the enable and pull-up counts regardless, so a release that
has no matching request still reaches pm4125_global_mbias_disable() and
drops a reference it never took. The MBHC framework issues exactly such
a release: it takes MIC_BIAS_2 once when it starts detecting a plug
type and releases it both at the end of the correction work and again
from wcd_micbias_disable(). Inserting a jack while a stream is running
therefore switches the analog master bias off underneath it, leaving
the path up but silent, and it stays silent until another stream takes
the first reference again.

Return early when there is nothing to release, so the hardware is only
touched for a request that was actually made.

While at it, use atomic_dec_if_positive() for the global count.
atomic_dec_and_test() lets it go negative, and once it is negative the
next enable increments it to zero instead of one and never re-arms the
bias at all.

Assisted-by: Claude Opus 5
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/pm4125.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
index 923318c78..2100f4e36 100644
--- a/sound/soc/codecs/pm4125.c
+++ b/sound/soc/codecs/pm4125.c
@@ -229,7 +229,7 @@ static int pm4125_global_mbias_disable(struct snd_soc_component *component)
 {
 	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
 
-	if (atomic_dec_and_test(&pm4125->gloal_mbias_cnt)) {
+	if (atomic_dec_if_positive(&pm4125->gloal_mbias_cnt) == 0) {
 
 		snd_soc_component_write_field(component, PM4125_ANA_MBIAS_EN,
 					      PM4125_ANA_MBIAS_EN_V2I_MASK,
@@ -772,8 +772,18 @@ static int pm4125_micbias_control(struct snd_soc_component *component, int micb_
 		}
 		break;
 	case MICB_DISABLE:
-		if (pm4125->micb_ref[micb_index] > 0)
-			pm4125->micb_ref[micb_index]--;
+		/*
+		 * Ignore a release that has no matching request. The MBHC
+		 * framework releases MIC_BIAS_2 once when the plug type
+		 * correction work ends and again when it turns the bias off,
+		 * and honouring the second one would drop a reference on the
+		 * shared global mbias that was never taken, switching the
+		 * analog master bias off under an active stream.
+		 */
+		if (!pm4125->micb_ref[micb_index])
+			break;
+
+		pm4125->micb_ref[micb_index]--;
 		if ((pm4125->micb_ref[micb_index] == 0) &&
 		    (pm4125->pullup_ref[micb_index] > 0)) {
 			snd_soc_component_update_bits(component, micb_reg,

-- 
2.34.1

