Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794889555;
	b=ytDA+9WNh03dKDkf8pEWEeh7mxz3ig0I9PKzFOb4cFyUdmARbTj6hMq8wNYIPTLnkeDs
	 Dnxj80LPG547HvI3fs5rGTrw82SQ+3msxnw97+jmR4lP6ekrd6n4/ST6uLB/O6Gv5pH8r
	 SfDAe3iWbwhXqx7plyUPoM13iBLjwyQLJws+VUgPxpcdcmCLirP1WtTkDHXBHp3dgoaoh
	 mdHuA7rm2YprP9qNvi6MAnLS5fDT08X8J9dq8A1L0FRqvjQDX+Ab0kbUYr2QHZz6t6zgY
	 ZVHK+uBTtkKR9qE1CXg36PSb5jygZJ1PrGFKRjHJhz0Jq/uOO4x/G0lZ7e/U2ih4daQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794889555;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k6rZNiDVyOtTWb1gQc7S+eyCv7P9zmq0JSXfIQPmD7I=;
	b=Z9wX5mAfYFf4k0tuP2l+ARSwFgSb48M1atkIchj0dJmA659pgkIdj4R/MTm7WeOS1+Ox
	 3nehEaWp8oNvxkdxK3x08J3eg8AYS6hvDufL93Ruk+lC8xPCREiZF0VSPnh96wDTTYymn
	 1d/3nN2whaFSoDYE98FGFKOGpLnrgscQzvCgwzxtrVmzb5UIB2aOifS/I1HSoPwz/bKne
	 fi3suONqgSXP5Knm4OlHGTpQ6YqGQd3nWXeI8SzM2Tv9zzk7Ch9x2T0uy/EKe0Y6fpmai
	 NhGI40ZIRfoAl4j8EQPiigzg9SdvrvFdkYju+DD3TXgNPtuJ0vgpRfqiW4SKpcoiEcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LV5LuiSl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hi0pBKoE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C24606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0C24606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LV5LuiSl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hi0pBKoE
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aJuw3142440
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=k6rZNiDVyOtTWb1gQc7S+e
	yCv7P9zmq0JSXfIQPmD7I=; b=LV5LuiSlKx3m6SIn1woI8meBIyYyZu0bDJbHlR
	E/WMM9YSgjbuYA/ezHkOCmjViWiDET83+MejuajQnYH+b+T2DpiyisG3noKRgxsl
	Lk5Fmk6VxNB7og2/nz5b7c7DtntcFZLZhdRwtcdJC3ItYaDkPTAV8YbZGeCNZMzW
	geOWzG6/vUDn/CEjKz5HG0iYTU5aXAmP5wLRLFuwYJhFAEOBOOMuGD7I9P0iqidT
	Mn4Cimdr9WNqbWjFeNiD6+vV8zb/DyhwG8TPpOgATHqSMV9Q9dNyDs0TyJkNc2U4
	lrXeANw9p0UQC+uk5acy3cERK+Iv9ZCo02wk8Jb1838hVQBQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqybvk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:25:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3724667bc16so360489eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794889552; x=1795494352; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k6rZNiDVyOtTWb1gQc7S+eyCv7P9zmq0JSXfIQPmD7I=;
        b=hi0pBKoEkG7rvIXAoxPbDxR/MfbTLZpaZNrXe+MDOEVljlXTeoDZhsBtpB8Ls2bUXy
         Ph6xEHwtepR7OB22rrsiIXg8zJrLKvxVG1cscdzkTSujCXJHqKJw0kq8TVdPhfK/8jIZ
         LcHBd9Kff+MFZuUxRA3UDmel19fwCoNXipEVd1ehqn3LUOa4StmJjfVVF0hjD1m/HIKe
         HqEsnrdFl2Z2R+d/UyXUZEpJdTUGJPSEbbeGrzhYKULV2s4zonu1Ruwg+9OZ6+ILiPvc
         1F9SuG85dKFkZNcLCthOI95DS9xFGnzLz+lAUroq0h3Zow/k5v/xTEos/yv4EbJKQ0Rv
         waqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794889552; x=1795494352;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=k6rZNiDVyOtTWb1gQc7S+eyCv7P9zmq0JSXfIQPmD7I=;
        b=eM/8/sWGBHD3o/DzPK6NBvyFRLEL0i6/kRyG458xJC/n4ci9nuzl7dfyxmPUxS867G
         k+MVeJXN1NXc0gySU103JdAN7KpbEoDZVJr62EiZfgPfcG0qOPnOqBRCP4U/CsIBqrls
         /dHfwI+Bzbkc/EmDtQZkIPxV2WnHyMOoSzq0qy8uLbLnFUDKzFhmXaMWdCmtzhb5bm1Y
         oyXT8QemgE5vTVfV0weaYCk0LBpTkAqhGJ8JBEINcIN+xqeHr2omq0MIWoSZsufPXE2s
         XW0csO25XUXsW8fK4hkbYFFC1fcs9+tdRruJap47jGoInGwC17j+PBy0gzwmZFzaKz18
         hY5g==
X-Forwarded-Encrypted: i=1; AL+hErH0dkdy+z7s3EUMIhLP6zIHtybe+CCWmyWwTX4wkm1Cj8DMrFt5ybAIN/yq3Inam5NZ7doer8UOalzlDIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bNO7D3PCgS8LLbSiN51MiFvAZtQ1pbck8A7qEel51rTTu4gwG
	1U5YVIGAdrOBn+5ZEPCu8y3VZM4AdnG5CR7TWqMAPSZ6Gi195gup26458KNbPXFwf32Jgggczy1
	0S9wNRsHI8WgHpuD90Ks7sPz84OK6CNUOeNrBUZEX8GP1DYBSEdg6ytRH7MBNBInEryuFfqxs1n
	bMzTzY
X-Gm-Gg: AZFdTZd1Upk2NL0dFAdUzgtCgVDgDmZO4vn87iJXDMG+5b3/Fshs+tl6Aob+lAHtAx2
	WVlXlMsl9yYd7FnkYH8Va5V9JCZigf6ISuzEbnntDiAdYHQEYXH+ueJDwD9RMgB9T23gDo7cruN
	oowLNLlMHIia4bFxwqzexIrAFoBQYcYQB3VFjlGcEb7tXRAtHr/5TmuFdwGXP5qrh42ArZzyhIP
	aq2U/4iCeDL4iiar+WzetrB355ZHawINq3PC8vgmjiPKGaATtmGop7tJshB25lpuZgBishTvlIF
	LnZqMGlzqbqy6uT6rdZ0BhQWzktTuuH4NTVwCvjMHUerV3ti1jRYBLPshClfbpNSCvIqwGfeUum
	CcGGxHx/Zb1D0MoloVN82IQ3Iz4qSagv8mfLPaIMuF+7lmevBK5We2tU=
X-Received: by 2002:a05:7300:2146:b0:375:6fed:8e71 with SMTP id 5a478bee46e88-3810e419ea7mr1972610eec.7.1794889552508;
        Mon, 16 Nov 2026 20:25:52 -0800 (PST)
X-Received: by 2002:a05:7300:2146:b0:375:6fed:8e71 with SMTP id 5a478bee46e88-3810e419ea7mr1972582eec.7.1794889551936;
        Mon, 16 Nov 2026 20:25:51 -0800 (PST)
Received: from [10.213.108.22] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm39183110eec.3.2026.11.16.20.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:25:51 -0800 (PST)
From: Kusuma Harish Etamsetti <kusuma.etamsetti@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 09:55:08 +0530
Subject: [PATCH] soc: qcom: pbs: Preserve trigger errors during cleanup
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
Message-Id: <20261117-harish-qcom-learning-v1-1-9bb3fb956a9c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACPX+2oC/x3MwQpAQBCA4VfRnE0ZasWryGEbw06xmC0peXeb4
 3f4/weSmEqCvnjA5NKke8ygsgAOPi6COmVDXdWOiBwGb5oCnrxvuIq3qHFB7pirlthT10BOD5N
 Z7387jO/7AbU21GBmAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kusuma Harish Etamsetti <kusuma.etamsetti@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794889549; l=1822;
 i=kusuma.etamsetti@oss.qualcomm.com; s=20261116-oss;
 h=from:subject:message-id; bh=2XBN2cLSCu/xE8kOOiMNZs3/Lh9NYoU5xP+2HNXK/Y8=;
 b=30s9wBJQtAgl7zTvyEEMOJ89o2ph6m0WvjxTOQh0RiYhEZMvL88cCGmDFzlXNI0WscgMAQAXX
 34ZVtWt2ap1CqMZVLOEjoFwb2m6dzWQTlIj7TLl69Zeef6JixexCv32
X-Developer-Key: i=kusuma.etamsetti@oss.qualcomm.com; a=ed25519;
 pk=fgP5l8HzvAhEVM1Q1CD+AykWgb0nWHPUKt1k1DpEbvo=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAxNyBTYWx0ZWRfXxMf65Y3BNlWD
 z1k285Uv/iD1v481f48a1Hth5SUAeB0gdyTHCUqAY8/ASNj6jA36ewl5pYoYoubu4eMDCix2bel
 vIAwXOwkqZAvNzSrKNoWfiplKSbCGG8=
X-Proofpoint-GUID: PladhyyKb9cnOJXWC3wriROMRRdbvkDd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAxNyBTYWx0ZWRfX17sXayXhtNMF
 DKYh6EY8+rRh3cz8E+aNRsviWhmC1QyeFCURzLceinum3o3Pk2HS+M2xD5Sb0Cl8uUPG3oG9GA2
 +9acVhii5DxqWIKQfmOe2c79EVYM1tsEwBTAUHOaeTPRwExPjIh2fumTy36GEZ553/q8OYMjs1t
 dFqv/z4s4buU9Ch9eO5/lKzb5Bg5H5q9Fcch512D2Alm2uSvdtg8ISDQUSscv2dwYzjSB3nrNV1
 POfrGlL2HTQBh5ot4rOvWjhyVJnjaKP/cud8H3T0Iq2RHvWi6t3p0rt7FelE2SxMCre5cUZBWOe
 gaCpq+gvCz4FZp6VsKjLDFsfSQWdnDIZywT/coW2GBsI8ujhiDFO/DD8aIMpyQeAYsqBAVT0Szs
 6I2NnelRChQiJEUrqL3t0OS4UNQYMxn19VEqhYnD7eD4+mLgls4Ii6i5C43BztG+D/OeCr/howz
 4ufSBQk9M7fpKgbPLiA==
X-Proofpoint-ORIG-GUID: PladhyyKb9cnOJXWC3wriROMRRdbvkDd
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6afbd751 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_WVhkm7O3-LuRnNm3jwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170017

When a regmap operation or the acknowledgment wait fails in the
trigger loop, ret contains the appropriate error. The final SCRATCH1
cleanup overwrites ret, however, so a successful cleanup makes
qcom_pbs_trigger_event() incorrectly return success.

Keep the cleanup result separate and return the original trigger error
when one occurred. This lets callers such as the LPG driver detect that
the PBS sequence was not triggered.

Fixes: 5b2dd77be1d8 ("soc: qcom: add QCOM PBS driver")
Signed-off-by: Kusuma Harish Etamsetti <kusuma.etamsetti@oss.qualcomm.com>
---
Fix qcom_pbs_trigger_event() to preserve errors from the trigger
operation instead of overwriting them with the SCRATCH1 cleanup result.
---
 drivers/soc/qcom/qcom-pbs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom-pbs.c b/drivers/soc/qcom/qcom-pbs.c
index 06b4a596e275..13c67f85f634 100644
--- a/drivers/soc/qcom/qcom-pbs.c
+++ b/drivers/soc/qcom/qcom-pbs.c
@@ -76,7 +76,7 @@ int qcom_pbs_trigger_event(struct pbs_dev *pbs, u8 bitmap)
 {
 	unsigned int val;
 	u16 bit_pos;
-	int ret;
+	int ret, cleanup_ret;
 
 	if (WARN_ON(!bitmap))
 		return -EINVAL;
@@ -128,7 +128,11 @@ int qcom_pbs_trigger_event(struct pbs_dev *pbs, u8 bitmap)
 	}
 
 	/* Clear all the requested bitmap */
-	return regmap_update_bits(pbs->regmap, pbs->base + PBS_CLIENT_SCRATCH1, bitmap, 0);
+	cleanup_ret = regmap_update_bits(pbs->regmap,
+					 pbs->base + PBS_CLIENT_SCRATCH1,
+					 bitmap, 0);
+
+	return ret < 0 ? ret : cleanup_ret;
 }
 EXPORT_SYMBOL_GPL(qcom_pbs_trigger_event);
 

---
base-commit: 6a876df4686788cd39128b62d7fcbff62f39278f
change-id: 20261116-harish-qcom-learning-c9cc071ca193

Best regards,
-- 
Kusuma Harish Etamsetti <kusuma.etamsetti@oss.qualcomm.com>

