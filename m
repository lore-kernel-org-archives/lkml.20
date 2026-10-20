Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481960;
	b=kxoNh7EAug0pPsFU0AQMZp8BM3jnSc6l6w0SK7KHIxalQiKvWRMIquHtiJZw0K34+rdF
	 RkNiz6yWcAHDd0KdmS3KHvrTQGB+zBifmzY4VJxt8/5d6kEzdczSwoj30eYHrYJV9B1Jd
	 viPG2oYa4LkcLA+77/TJTdKwitz2MeQUek4CRYlCBe0YWOar/2REwJT/Vy29LQ89AkUiO
	 uHUOx5NYl1G8S+uWnVzcwZDMDDUmNxNGOvL0nVQoKJ4FiWCH9sbFdzhqcdHa5B1aEBGvX
	 +I3DtG++PcD3JYzyIjX76Yrl5xynlujZ/K4Z696VBFpTv1Hv5BxmB7tthXoqgaVKOqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=u+NWBmXiXBL707eUK7wLUNS8C0nG+19FKKE94ew9qXw=;
	b=EkkamFbcNg77GiL1QHx+b+lFmDESMTIfWwSuMCbhZqLblKBjbqyDe9jUfbO0nkxuHDmi
	 Z4DPv129DgXU5UM9SjnneHswd27yUvlYCtsROT2awtf+/W6p7cLLQgBoPAV0djVzDD44q
	 VY5mq2zXNrKnNMLo3b9tEGyS3Te9KTVM4hmmHtcaJ835wFN9O/g/aRn4JnIH6yX9P2KAE
	 JsLpA1B8SnVDgTZPyL+qYSr+RUKhW6502TtbxpIz1lcQ+KAJ9leJZ3QDWt/6Bz8WSuu4t
	 zhOCkfbFZRlVdz9RoGR5TLv5tHAFJc2SpNQXUJ6f7H7w2QjGzOjZOUZCXILjZned9Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="D4tP/Cr6";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jo+xjK5Z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3842360A2624
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3842360A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4tP/Cr6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jo+xjK5Z
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t71L1211008
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=u+NWBmXiXBL
	707eUK7wLUNS8C0nG+19FKKE94ew9qXw=; b=D4tP/Cr62K8ELIarr3dIBcU2ORt
	D2deI8w2yCFXNuRSDgZfAEZBQDyZmm+K5ZGjIn3lQZA3gNSEI+KO1/gb1/YPcdnK
	y6B15NJtfD7osEb0wZz3roCmLUtPwGVH9f2babHcD/sJ6GYHVGeqyu6odmnPa2RL
	PUbad1Lpi1udf/ekGLOHkd8RNOIMpjrYEManWV4C+Gp43xed2SAhjKaKfamVHqqm
	oJonIdw0L9gG5z8tx3HyJyWg+yOo5jA2dBOflXq/Q8eBvFq2K8iitV/duxI4mbl7
	VmfMvoKJuQEwG1Ao767ZlHsti/lp0dxZ2hETOouIna3RZeJ2yCFzIE4TeFw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1e30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a3f673221so1078203885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481958; x=1793086758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+NWBmXiXBL707eUK7wLUNS8C0nG+19FKKE94ew9qXw=;
        b=Jo+xjK5ZO2AMJz6DxoGf24MpTTtIhlG9oYNiT0I17vcXQkHNNupiWLtR7p6Kj5uJyL
         9E2zReVWugIgdMViVBLk9ecB70SeHZsK09ZGXlkpO8MoESllg+xSoXqe/WgnsQGCBwBC
         YpSZvCaLpbhTV87iBHXSwTUht30QaP+fvGA8HwuoZbRe10/Eds+il2Ze0O00pBGNExcD
         kuhqc6mG8nb9ubH+La0Be59/jwb2RYS6qopVw3vsCoA1qlmLj+uQcJYkXPnRXE+BalKu
         GW/hdHAXK5UOmuGbdQ4p8fpZptFerBCm2fBfM+Tl+knXW4VvP8u73+Ss1Ds1kSIGX+YH
         n6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481958; x=1793086758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+NWBmXiXBL707eUK7wLUNS8C0nG+19FKKE94ew9qXw=;
        b=mzYF4xfhstgcoeoAvX7QJZigX9y+0I53jC3dRRh1YB/2AeT4rdkd283/tMZodGkgYC
         otTvphNySX1T2ikjNKXxF0HqqgHskEasAGBhC3GWnx4FVVg1RQ7kEvKfIWvo8WYHiEJZ
         OS7rDmVf+qyqhIwSO3Wh0a58fvur8eirXt9T2dbdGmeJry/gQnZ2twj2jBqZ7lXEe2YL
         4oUuawuShLMaK28AsmUXyRJh/fWKK8wadAXiVMIWdYfrJXVUFsHvczc4CMJgtuFojKqn
         FE3nOI6gX1CMyLNPFc22wS1KrEisyDH6IEnn/cmieGNIMAGwECq+NV1oanMXzh22FA3o
         5gXA==
X-Forwarded-Encrypted: i=1; AKwUvBx7cFtRXK6RVKQcxodNc1iTTWvIyzvA0QK3QLXNbFU9oZmen+AybgFzarnCtAT55iLcrLW46VgtsTNXvso=@vger.kernel.org
X-Gm-Message-State: AFq9FYJv97EtjAJidSj57nqCcacI9Ogjt5RWhB/KVMa1e147vlPw1JaS
	pyz4RPlq3Gn6Pzac+LSm1cMWjELBL7nK1Kr2SJHf5GfSiIKWd8G4n/N1wKyNTTzsaF1JIZBqDfZ
	vznxsZxlBEyeCWLX0+oUtlUdzh5pGBxolJlISzk3GM6hRPI4PN7sPwm/LCPWMIQrrxMcUl1flxs
	o=
X-Gm-Gg: AYBFou3u6W1EsZo139aD+bS6MrKP1Wo5iK0xaVTbIXG3rWnBMulOMwZjjTYo190Yu4V
	xkO4GT2Whe+XhjpRjhw+q+53qZ8R/WnnqH3Tpt4lx2WgVATNN8pFSvW0yEoywsyI1P3MhqWo3O/
	qAwzcikkvimwy4g2oSKx5EaOUPCuhDSZIeLexXH56P9Dejv2pd6NJvGkFr39XVxEhlkY85EpsnT
	fvNhJu/1AhTgHNJaXbUfyLYMhyPEBc8h5Sx5bk0ldEDUhzPBMuffNo4pZ8sB6+k9GOMutyZ5z/Q
	G31JmysbohA150u7V84QbOLNkBbCSmeveTPzDyDnpgS+KGtpQT1AsY1gpe2RghLiXCgovpucKz+
	v5ZE8LpRb2f69
X-Received: by 2002:a05:620a:27d0:b0:93f:23ef:d6b1 with SMTP id af79cd13be357-93f29dc1c0emr1816086585a.72.1792481955965;
        Tue, 20 Oct 2026 00:39:15 -0700 (PDT)
X-Received: by 2002:a05:620a:27d0:b0:93f:23ef:d6b1 with SMTP id af79cd13be357-93f29dc1c0emr1816084685a.72.1792481955561;
        Tue, 20 Oct 2026 00:39:15 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208e0sm4566271f8f.36.2026.10.20.00.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:39:14 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 5/6] soundwire: stream: skip bps mismatch check for PDM streams
Date: Tue, 20 Oct 2026 08:38:55 +0100
Message-ID: <20261020073856.1177749-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Iff7HsxicLgyEwnsLCa6rwQz7wlX9Wdl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfXyD6TEGwTT952
 QxPdDtJJoPjPNEYDZaYcp/3Q211CuPu4sbGJEJ2OpHF91e9V7ueWGD4ewRFVsjoJQ9/k1eV32n3
 RTAJSUaCREJz7TMNLGml1nWW3R5Rk4M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfXyp6FNISMFepF
 Gy6p9VTwN8hgRj9rCOqy7hqndHgcuCmJHQR0eKKhTW7BcMbLl8vcUpqND5riAESj9OBlkOVbc8B
 auzZsQd7+moDqicuHpi8h8SuV1rGh8RyGJz34+8ie5wSIPb6eq/VNi1xv5QB5uyMf0zfE7h1cnR
 1xeOXSdCxqL/eBLMQ1N7/wRL4twJHIXodQUuZ5lvd4vcON0OBkfbCG5AgztTDuoRxPhlUS55yVc
 nsc5/0lpP1jPmDqS2FlU2gvpE4fM9wKUWbCSHjUC921dHdjWMYmVBHLXnXU1IpOGCbQU1tGoEJu
 o/QFSYaem1QsxLSYq+mscvclrmHTEiMPI6K9UMnenpt29Uvsgi9/fPhy/bbA6Lxz0ubyLaMI48+
 lPjvWUIqx2TwuZPuvb+0r7rrJPczQoP94uvpqVlxAZuKbLcPHRsRHjAGfwI0IkzMmuYm9OXVq2O
 kEY+DEbtu3kLb8xf3fQ==
X-Proofpoint-GUID: Iff7HsxicLgyEwnsLCa6rwQz7wlX9Wdl
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad71aa7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=t42oVSYFIGZoS8p1b6UA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200030

PDM data-port terminals carry a wire word length defined by the
stream payload, not by any host-side bps field.

Skip the sdw_config_stream() bps mismatch check for SDW_STREAM_PDM.
Behaviour for SDW_STREAM_PCM and SDW_STREAM_BPT is unchanged.

Assisted-by: LLM
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/stream.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 0b00fcdcab2d..31db368ba24b 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1374,7 +1374,9 @@ static int sdw_config_stream(struct device *dev,
 		return -EINVAL;
 	}
 
-	if (stream->params.bps &&
+	/* PDM streams have no stream-wide bps; skip the match for them. */
+	if (stream_config->type != SDW_STREAM_PDM &&
+	    stream->params.bps &&
 	    stream->params.bps != stream_config->bps) {
 		dev_err(dev, "bps not matching, stream:%s\n", stream->name);
 		return -EINVAL;
-- 
2.53.0

