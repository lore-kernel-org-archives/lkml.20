Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551201;
	b=hwLvQt+039w5YeDB/qc7nxRkxSkaVn1RmA86WK7IiFbI775Mboai4+U2PChRqaabtvEQ
	 PFOmdSGw0ghdsCZLUP7fntn724bjEu6/EqRZlNzyKAopOyr0CUEz4E76sehXaCVuwA5CW
	 zvR361IPK7Kz7VbVrLuvrXk9s3zs0AHA5h/be+2jIKNZx9D9kLt+vtqFk7zCf4VRyLjis
	 Xd2toLXbbqqPzgIweb2wX9dO5XR2P5/tM3pnaq2YWMeGjkd3GHpiGCUs1ImBPtueYV/TB
	 i8eSekv+raB7qqz534U82wrzduChen4FzEWuK27n4+80J3FI0OM3hlPM3uNXmIa8RsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551201;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=evtR+IpjZNie/CYszb+cjE1e8CH3ljthvc//iWTvEs8=;
	b=4v+TNFt0zGcsYALj0Ird+kPoSN6Ee2dCh+obYNleSNxgZ+U8Io+WIJMwb7UnmeBflVOI
	 8KRy3VY0sLhtoyT4uvQKFFMVd1hbEQslNw4GY11g+lOA9tfjCshZADY4CLUJ4MRCZtqfG
	 V241ZYF/OmEQZ0RSkQg3Dc3fe1ZO0EKM0zcWVXs3zeZOOg/H006lg15XoLJtx1OGOs74n
	 swcEvtsH8lhD+lH+DJretR65AbbSg1n4eMjR5fqXWrVdX09/nlnjNhygFE4mbJfBR+Eax
	 jrvuB/usxiqXMYtCAc0C8wjqla7nPhRd8cnnzTk/SXuzgKjFtdIcyVwvnMNSTusLzVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NnwgERab;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmAFiixS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9F5606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B9F5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NnwgERab;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmAFiixS
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2F2vC2897916
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=evtR+IpjZNie/CYszb+cjE1e8CH3ljthvc/
	/iWTvEs8=; b=NnwgERabH2KCRpSUw50yLc7hpbcNI2+sR4sUckcjX2tZbnlMFS4
	V6voLz53KN/hyuHNWncvD820qT7adtSfZA/xSpFSmD3D9sYU4630NdVuoqvyQzaX
	dtndGwQdyxXPbDZMCa71sgxl70k8tkRx3/bMor52G35IDlkzoEXtkpFGN1APNP7/
	p48FWOgb2AcSbOGrL+Hwa/PyaNVUul0jOZpPa2MyUZdSIpg5vJaoc1KbLdhdAi38
	eTP0pD4KOWjqxJivBCs1WTwQaMtKAQgk59SHQ/LVPJayq42ncS5xrkknQSwcgIz/
	w8PFPv2Z3jiGdZixq17AbXNoB622bP+vDpw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0hn5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:53:20 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-18b5ee75447so1008723c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792551199; x=1793155999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=evtR+IpjZNie/CYszb+cjE1e8CH3ljthvc//iWTvEs8=;
        b=gmAFiixSGIyzcFFL35JkHC2nWwCWb41i8MUuBpF88knplaxpEB24waHC5UnVtdCHER
         /uDNOTsW6KjmxsJArQt8CCyOz6bNPpHf0sIWUD57FTy+n+1huJZXw78BXju6IfNrvHkx
         Z8I1E6AW+be888gIqE5fp9J+fCnchJXK6As+AB6+AySR0bc6bdYf0O+6wzgWz1DXlNSS
         e2G1chxLSg4sU6SOGJ8wke/XkAmvMncfaXZ+4lMEpIE0xK9Yy1vxK0aAZJjXXmiNAzKa
         X4yvIXD8WdgSqG3b3sLaRFWCmbV5RLm3aroGRdwv/fDhg6Fco8HmAS182Q59QmZxXCIK
         sbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551199; x=1793155999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=evtR+IpjZNie/CYszb+cjE1e8CH3ljthvc//iWTvEs8=;
        b=ZVcLGa+C1s61ZglTi0eIcs7P1Ti1/Kn3VOG+MJKpq2GVNysf0PsIskgEIjBwTT2o1V
         kJdbuB5mUKxqQ8K55tGMZBsFulJ2iALs/u3TOTk3QI9aUecinl2QzEsrIg4AgqYOgVNd
         IzdTjYdPP0rZCvIj+7bNcNF6UiOKq4QnHAmvAY0bNDNgNaOmWOYnkielp+4Yb9Y8AMwV
         OPUpXKJsIn0GCoC35CtxvCkyxkpHDqFIUERHTlh7O3HJCq0CvqHujScTHAQSo/LhTTeU
         zB2ngnV71qMVuQdbwH1XxFZXBOx03V/QvVnUIHyj0IhiyCW5Ck8LwHPTSz5JDss+ufzl
         9yiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWJ8mQl1Z4apL/NiI1iESazov6tLMfRs3xm+0N+p2zjoo3GUgU7OYzytXSOP2gz5PVWYTtfVDc7oFOgp0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbcBAu/n4+LoGtYxJvcGumzEfWMZKYno+Fm0ZkOqsOQ6c2nouk
	NFkQ86Q7Q2HC4bb4BOWuloevHQTJlvtdawIFTK8MkIJhWb/cnIthG1drXiE3hilS//N1F4A5ajn
	rW5TTcBHgBeAPdLqKxMmwi8ddnQQgnyJ9eOwbDGOJR3+pHYjGqyOyZrxMKrQm9wl5scE=
X-Gm-Gg: AYBFou0X/HPlREJY7O89CHcQKB1J5M1lQsxKBFjslo93DGzfbGvTin8WBqgQ8KWghRH
	/MPCTjVsg3exhJ1XXPMtcwwmkcwdyHLosu4TX+h8J+EVafgjxnmAqfgqpO1o06bAaldnVa9lQT2
	6WPaPd/3c6sAmmyJYzJxTxfiJB9BdP/ALdEglwx7yKvg2sHkXidptVWf0n8TMvbR5UgbKPoCSdN
	kn9/UG0jKZRwQrZlv/XfNNUopC0+PXSw4VPHbehkye/W/beBLfD8xwk+8EIzpxKtrCIUQcKg9qZ
	PAIQ9xS05FVlTIrtC/BjDG7ILARLmms9euFOfg+F1a6xvCT4A2XkM1XROwEeKnfywPW6ufEhbqs
	j4zyJwkVmDs4CzvnrwAqEM6p/tlUSIbv5jVb5QOeOHaCo/93W9/tebj3q6AM=
X-Received: by 2002:a05:701b:205b:10b0:165:4b88:abc2 with SMTP id a92af1059eb24-190a6705badmr874410c88.26.1792551199426;
        Tue, 20 Oct 2026 19:53:19 -0700 (PDT)
X-Received: by 2002:a05:701b:205b:10b0:165:4b88:abc2 with SMTP id a92af1059eb24-190a6705badmr874385c88.26.1792551198861;
        Tue, 20 Oct 2026 19:53:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d61csm2553952c88.15.2026.10.20.19.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:53:18 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
Date: Wed, 21 Oct 2026 10:53:10 +0800
Message-ID: <20261021025310.2072026-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMSBTYWx0ZWRfXwRZeLUevdOBa
 v4c0vKdxJw8SVW313HPPiBB1kihl7bA8kKFXTHn0+Kj8j9sTDUdCA4OqZMtKJN4GDllf1JHDcwj
 XG0yprOs/sfQoT1wHWiRbs4jSRSAyp+BMsz6+GCnpGpd6Z7uLyxk9PoBoWkFDFzV8hE1GPGAtdZ
 q5ZgeTIE5gtVbmjtxxWZfYFr0KCGvhZlG3NlN8RC8U0zDBagUFwMiFi/g57HX0cjkBsvK/XhRBP
 LW+qkazobTZokXka56s4NprDb7t9biuE0Sf9BIO0iL1hYKY0GzbrGVvIRtk4KzEzVvL5jGGAQkX
 5FAyQwbeb+2HNgpRgDub9NuyQkbOA1V0jZrW9VTwl6HagdXEFV8i5ATBZM9a60rHWbXlYFgnqMM
 0jb3MmYF1lrYUv9qVs6l6w4RbO9RYDB+Z1mps/kCB8mzmqR3cBC4sIL8SyDOWcXeEZuAp75QY58
 9Qlqeq5xghbFIMuPKCg==
X-Proofpoint-ORIG-GUID: L7ilwIar7n-GMiGBPshkq5wPRcgfHbI_
X-Proofpoint-GUID: L7ilwIar7n-GMiGBPshkq5wPRcgfHbI_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMSBTYWx0ZWRfXxufou3jMjGZ0
 /0WfxgrPdPdn85Qxo2lfuRLryOvE2d3GL7g3anaeh+TR1Q2r8+T6WjzFkvHytw3PqjysJuVPUrX
 kLdSccTlcRiJsLRT3lEeLSIjJjzWb24=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad82920 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ZgtpBRw3GK28A7t1_lEA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210011

Derive the AIF_TDM_RX_8 and AIF_TDM_TX_8 backend channel count from
the cpu DAI TDM slot mask in the DT, using the same tx/rx mask
selection as q6tdm_set_tdm_slot(). Each board then gets the channel
count its dai-link describes, e.g. 4/4 on Nord RRD, 6/4 on RIDE.
Keep the default of two when the link has no TDM slot description.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 9aae6aadd43d..f3fb13145b3b 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -303,6 +303,22 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	channels->min = 2;
 	channels->max = 2;
 	switch (cpu_dai->id) {
+	case AIF_TDM_RX_8:
+	case AIF_TDM_TX_8: {
+		struct qcom_snd_tdm_slot_cfg cpu_cfg, codec_cfg;
+		unsigned int mask;
+
+		if (qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg))
+			break;
+
+		/* Same slot mask selection as q6tdm_set_tdm_slot() */
+		mask = (cpu_dai->id & 0x1) ? cpu_cfg.tx_mask : cpu_cfg.rx_mask;
+		if (mask) {
+			channels->min = hweight32(mask);
+			channels->max = channels->min;
+		}
+		break;
+	}
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
-- 
2.43.0

