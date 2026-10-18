Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D86F43F4B7
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792351456; cv=none; b=kMCPoQzRRfiayd/hpZuHAWhHCAcTWwjHvzPaerf5QNvEEcz68BLDsmxhkoZAMXHXGDxZ6ZHMbrRewTGytHk6eEhcL1SUEsaYQ7bz5Bn7ko4ISb9p6NuTUcNedQgw9X8L1v5jPpcK6gQ3pqY4SX+CDaIWy1FI/KSo/cLnvONVgyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792351456; c=relaxed/simple;
	bh=A9JqsJ3JdFHwwfzZdup2DtWNIV6CuNIAr8OH+g8ihCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wl/akoI0DKUkgrjnWFXcADGyoQQflf2SO85NGkjLZn8kfczookMzq2xdBrcuSJMdjetoTzFfH84mO3pjaMJkEVNbLPBi8gnYGe/DQlYFTnDty6rq+rLUvCdpzerIui/V6gOCXdFfmMGMr7EQHMfOeJHZSILrHsUNBdYgg+jPvf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSMCN6IP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQSeAFP2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HSMCN6IP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQSeAFP2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IITvpV3177936
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ehLEox3TtWa
	JJUfnw2m5PWlJR0h5h+JMt2AHDszIvVo=; b=HSMCN6IP+Uw0NnoRCipt/QRKMiI
	wRJkEi2qjKDJEVxMOatE9OWpFc5UzVfKUmgp5tXEMNzNexVZaMKFPvYRjMkoN3c6
	l0UfwvqEn77bSYDoSLw/17gUFZPGRMX+GYRSYoFWJh4XGONJ7wuXTht4CdPgeQd9
	Sx0wrrlpljLISFZQBPFjczX1zg+DSGxtFf3EODlwxJj6KVSwknUmaXcqc21QrBo7
	nq7CbiSckitxMcr374Da0D2+WvjKORGEhL8j0mjo1J9qvIzH/BZE9FDQE5f4n7uc
	xEJYvJ4REUk+RXQ4poAqU9a5U0WUuUosdbAIAM6DnMFaqrtHDoT/wsLgY6A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc26k3mf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:24:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf6c528aso258354285a.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792351453; x=1792956253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehLEox3TtWaJJUfnw2m5PWlJR0h5h+JMt2AHDszIvVo=;
        b=ZQSeAFP2Xh6l2h1nFP5t85NQza6txeq8aaV+Q8QvG3kHXCHWIyFMqosvvUhIVw/Rqa
         eUsJwNCz4LqF4vQvH4V13r/qcKP78OaR9b5tJtUWvkBcmurroIwICAnjZ9qI2+ANYxoM
         nPPnBh4EkMD4AAMqFSGDdAhGbry5mfz96+7gac3U6mmKGdkipNCyfzE9yf2MFi0NGxRA
         X+HM8/l0LEiaEGyyaX2Qb2BvoKGAmii4axUYBTd5y2Pc/axHt29KUb27gNmd5tAVbFGH
         6MLKYzisnglEfLm3b5UmTndTAjiUx8ieDxMKTRDHEHyp3U+gX85h0zOBUnKWDWTK4MwB
         S/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792351453; x=1792956253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehLEox3TtWaJJUfnw2m5PWlJR0h5h+JMt2AHDszIvVo=;
        b=xmCD6wbf3raOUWtxOY3PmEEjhaYe9HGEsrzbqyhX87Q/bQc6OV6+7XRy+Oa80ocA2a
         +2gbxvMWABxSmwUqmCS3o0PHh9aXMJaSWo6uu+R+0QstIQ8vzfDkoPnBykn6xaxYJdLe
         PU1IFF7ZRQ9YKeqonhkzIMWPpHPBKT59Dk7xP2WfSLa/D8EMW4uPR1VBs33jRbHxJdMr
         PXIp+nVzI3N80p9fZimwa/OrCzmJmUxu5mXkHPMUR1TPDOtBvoP9BJtqqTpCoCekZObp
         XS7TNQOlI8hNW9340bigMzjAFFGpT3ZC1TQ+x8norSo37V+GcbYb9xLvdRSclUgHsgER
         OVEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoYV2LYtfsUKY9O9rLb8jXfJzF/eqlaWv+vhbN4AFEn3r9m1eBbzUjIW7+gLxtI6b+dkZLgxTmcu4ivyY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8tEYPdHAaTYO9lhmCvtk9yHDXzMTlHhwK7Wc9MCq8qvS/k571
	AhhiEQ/Xsx2jQjn+H25F0aDLbGwo978xhz2+9G3+4o+rXGyPxXtB01nt4ykuzBoMohWT54U0xPt
	s06tJYiuCIxUAtzfmTnZJCcU68Zv87/0Z9Kyj/1DkIMsQihrAFtkjBMPTjUpsz3pZuhQ=
X-Gm-Gg: AYBFou3Aord3VXONMSg4K0PiePWPFaPeZZY42dnezyk0WAYNXgcua4e1I14c97kTMsF
	AJyoRFb+njMgEJTZ8lT518Ey7/GxqC5zktgGff+shBtSVrniYIe6b1eK5q8jTBcJk8kfrkrxdZZ
	EDygMxKVRzXH+UG2T2WkTZSWg8YKUNZvPORulwUKgmxHmzRkndJH1ozZezRTmFxBSCaDe3SeqLh
	H8/rAYUIzjQtXgmhIbdqyo0teeHi7zpdDlv083zt9bnBDJhD7duJoAjR28JckteAPpvNXdSNVD2
	3pit8cw0izgpbkWrDwwK9JoUus20c87rCYSgxslKUrn3BSZrAaUySU6yovMWjrLSCsJ7BLK+PFv
	D0ZOtDIoAa8QU
X-Received: by 2002:a05:620a:8909:b0:93e:e376:9b1d with SMTP id af79cd13be357-93f29b8062emr883945185a.9.1792351452782;
        Sun, 18 Oct 2026 12:24:12 -0700 (PDT)
X-Received: by 2002:a05:620a:8909:b0:93e:e376:9b1d with SMTP id af79cd13be357-93f29b8062emr883943285a.9.1792351452277;
        Sun, 18 Oct 2026 12:24:12 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm184417105e9.5.2026.10.18.12.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 12:24:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH 1/4] ASoC: SDCA: propagate sdw_slave_read_prop() failure in class_read_prop
Date: Sun, 18 Oct 2026 20:23:56 +0100
Message-ID: <20261018192359.287987-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018192359.287987-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261018192359.287987-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA3NyBTYWx0ZWRfX/V7ILo+A6oKu
 7TGd6Ck84mb0fJ2CAqOtQs4hty9CJgU+PBeQp6X3/FZXCcwPteaFFlhHU6cnuLl9DMicQpwtH4W
 A5HQaRyynf0FexXbRwHqiBled+qnHis6EVQ/ETTjHE1jPy4VVKgSwUmDEpkN0CPYlXKqMs7/QWz
 kqOOEdhEREev7q2L7ymxY9xqaJgqbX6kryn8NRXw3Jg3U9ak/EEja61zzilzrTbRF1oBkOr3T07
 gjrfbJM+dGtvfciRsU59bh4LStAfskO14q4ulV3NL438ydqVEH8HV2bEb/hunVjgpe9BvMDecrA
 njkCJ1ErGzkHofrjxRXj1V2uPzYgh7gfhj0lMrEo4jURMY0OGXEqhE2rVHd3Km3+dNruSjoZSen
 K6eagVXGMhu5UyxaIEgRTjolOPWlNs7RnWpJ7DIUpAx3NT/EXSLi3Wc1GDCj44/NC9Ed8e70eNU
 NeHkAUqgAu4SVDgfuow==
X-Proofpoint-GUID: _zheLhGKtkwKAhTN02soiI_PMkgSOrFa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA3NyBTYWx0ZWRfX7+5XJupS73KF
 3moDSchrdmm+HB+IbxfH/Dcu4WBNt9rjxY/gj+g3zRY5svu1i3HfuS22512eKE1vqPkPrwEf+J1
 xk8gXSUPn6XBL6Uq3p4ud/gnE+C2o3c=
X-Proofpoint-ORIG-GUID: _zheLhGKtkwKAhTN02soiI_PMkgSOrFa
X-Authority-Analysis: v=2.4 cv=Cowq4X4D c=1 sm=1 tr=0 ts=6ad51cdd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6IGIi60M6HWO0oJrOSAA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180077

sdw_slave_read_prop() can fail with -ENOMEM; propagate the return
instead of leaving slave->prop partially initialised.

Fixes: 2d877d0659cb ("ASoC: SDCA: Add basic SDCA class driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 79fdb672be1d..bcc660aeb739 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -27,8 +27,11 @@
 static int class_read_prop(struct sdw_slave *sdw)
 {
 	struct sdw_slave_prop *prop = &sdw->prop;
+	int ret;
 
-	sdw_slave_read_prop(sdw);
+	ret = sdw_slave_read_prop(sdw);
+	if (ret)
+		return ret;
 
 	prop->use_domain_irq = true;
 	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY |
-- 
2.53.0

