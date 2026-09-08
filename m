Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB1C3A3E7E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849434; cv=none; b=lCDcc0anLDn753DS84Fhr4Rc0C17dXp17J9IjqaMzbjyUtkLtHXvCjJvyKgxM8iNZAdDM0zQjDVshlLq/ECj6vKvLXSMnra+Ak1BECS9o1NPOz2B34GXOpAy0dZOyC+zYMOxwUuuTByZzgTv6JAGy4WB8RWetZlrzpcQkECxKkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849434; c=relaxed/simple;
	bh=tSoqVBcdjZ9XLsjPwmhaNu7ExTKbisJ9mIS9i8jGyGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WWf4b9auoU2OSEWAYkzPGP1/GRU9JhiSSl/P8vAGJw6tVRsXxKI0xu5gdKaobQOwLCQcscwH9ouT7u6dyF0zGjWPpJds9IxNeTUfmYZ+kqmEIFRs+JLMx87C9WlSRByxcVwHx9+FVjI8DtTd2Ys9288Nquv+fOB7nIU+TdLYr28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOHfVmHO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AGQn3Fji; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOHfVmHO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AGQn3Fji"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M2wZ2172945
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 06:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=laj4QhcQvX9
	No5sXsrWnCaCqvBpIf2UEoUbEBLdV/8I=; b=LOHfVmHO6H7YdNwrITG4BiXs4et
	frpXCT0Vmg3T3rTKNiJAk3PUWwYxWBc39LQNL2yhJu8qgG62iqK4m4Foh0LWcoH3
	Nu14rgO3PLJ53jzXzGZSEr2cRX+6TOqAteaY3nIT6y112VAXIrJDzEAcP7TQzbJC
	tXIhvfVNW1MofcjrZWqvFtWxppkVFrkkyjG5zhmeaB1J0WmvlECg+K7mhNhrB6sv
	ee7Jqx+0eNnjXHAGucnTZgcUgzfrMEnJZyYO2cGVaP62TwX4amiqDu0eTEJuvU75
	dX0cfCij+4LvoxdpKxZ5KqRICpqaK21OYH8w9VHprhwAaSVS10hU5IdQ8nw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rrj1hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:37:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390a2c895bso876195585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788849432; x=1789454232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=laj4QhcQvX9No5sXsrWnCaCqvBpIf2UEoUbEBLdV/8I=;
        b=AGQn3FjilxQMKrvHGL14gtTWw2ZRTq7GkpkQLUUzgmoBMfLFrfxurmkjXyFF7QPcR4
         bMEyeWx3jFfhSRb9/s+rmjW02Vzvar+3sdBJ9nQNdeE3+dTzY0nj+2dQGuvQwcd5AmOC
         aMImlgQgZIFZyiZRFB1PhhihmNdXG4gwODTbUaP03Mqj2qGT7eMMO7veq5fEs9THUD9N
         Lp+6NVp8FYbtUyyL/dENAG/RZM60ENwut6MrZcTcVC9JeVTztEtP7ou4Jzflm8BJNihw
         0wh2WgFoXKqVdXIF/rlz6pccR4XACK7oywmk0hH5GgrnAxdGiXqroQGmoIoHBL1ZT3s4
         DU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788849432; x=1789454232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=laj4QhcQvX9No5sXsrWnCaCqvBpIf2UEoUbEBLdV/8I=;
        b=lvVLP/fJWI2vQcuIf49mGW/mlBLu7RcjsfITgfjlXzYNAL8Ry3gxsyIpbDOI05xMuI
         6Vx9Gc0mBctr/CswcdFUw5xnBB0YXSCOswvKWr8x4wg0Kqc5UYQCqkPM9cTNgCG6s8/W
         UNutFzbHwJx2NMmuuA96WK1FCjyDdu2SY3btU6qfJbEOgHlhsJgOY8MN3Izt5CAW6pHY
         ZgWKjNgCQO0dCvWGGKFK9lNfuNybYzO1FbYD6bBiaWlu7ywR5TVvVa3WQwuv65y/sCzD
         Sbt244x+d0G/t/ReF7n+C2ndPu0tj07o5NhLK9g5/KsVRxA4tK/n5Z9XlGwug+q33SHv
         du8g==
X-Forwarded-Encrypted: i=1; AKwUvBw1ZFAMbfJRs4nvPGUcMbVRH6wsKiy74fPFOweaRwuKd5aeEz+ffSvJTZgzDLJx4Hp/5gIpEpac2kbs0xk=@vger.kernel.org
X-Gm-Message-State: AFuF++m2ni6iJTyJW01QVj/7mJil7NWLS8nARDEs257FFpdSPx0n+k7x
	ji2vP5Rr09JtJHP2BJk0V/q+4Wi2UgwlPZsEIIrwhRsTBUMzbb6CeEHAiq0t8Q3SVp58eE29l2q
	9PvnnOlFm9FDTjXgW3DpQP/E64/xSQ5h1rQy2ixB2U1zcCj7ib9/wCjttGAyBTohLFRY=
X-Gm-Gg: AYBFou3nBGMyJcmQXz1ZrIHAJvT4V0Qeg+rQXMtGAddZVChmtIBKT5RiPcE88qkhDh/
	NAuCjUknlDj6Tqcy5ElqAcBgp7E677fYQt4Ncrx5/VhKuhvy9IOjZdkfUnALS96rSLjNAlDSI3V
	U7NUK4wEJjA1uiNGQiRCmluD0iiYmbAuEiDO/vm8U24a1TrZaik6sUIF0BUHQ7ZxIaGiBKzZ1WE
	VBKVxgPUz0rMymxECMkyif0hb3RCZQzB1jgk65xTg4Dk9r7XDd9t71X1itjvkuZ0h/+SjmLpr++
	D2moJ8ta09bUBdKQJmRSbhVgZHNpUN+846DjvRgqOk6kKOrGf7vHYH8DMWC7dJJwaYdeqvTu8wR
	qc+v9GslosblUSg==
X-Received: by 2002:a05:620a:7001:b0:939:492:20ce with SMTP id af79cd13be357-9398059a107mr2761046385a.1.1788849426920;
        Mon, 07 Sep 2026 23:37:06 -0700 (PDT)
X-Received: by 2002:a05:620a:7001:b0:939:492:20ce with SMTP id af79cd13be357-9398059a107mr2761043185a.1.1788849426478;
        Mon, 07 Sep 2026 23:37:06 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm277799675e9.13.2026.09.07.23.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:37:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/2] ASoC: SDCA: make find_sdca_control_reset() return void
Date: Tue,  8 Sep 2026 07:36:44 +0100
Message-ID: <20260908063644.463819-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908063644.463819-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260908063644.463819-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA2OSBTYWx0ZWRfX+5c0gK8dVS3e
 AGwm685pUR2Bn7kXm0NqZwoUTUXi0snNYVl5IgQ4V1YYezscBCx9VFPlpPq3GNvDFnOIPQ4UxWN
 kGd8IgJcbedfQHAeBHSOIYsh/5riLz0=
X-Proofpoint-GUID: 7-GhJj7fvPaIme9BAFDczLxjSmFmCaWi
X-Authority-Analysis: v=2.4 cv=NsjhtcdJ c=1 sm=1 tr=0 ts=6a9fad18 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=w1d2syhTAAAA:8
 a=EUspDBNiAAAA:8 a=-Ca9_MJ7E5AnbNBKvfgA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA2OSBTYWx0ZWRfXwTgF3pxshWvz
 NuwLSUK7lIc5R1oaztkmm7WRNlFrZgvgDaW/dUFdyfau+4bKh5QExSmlDZOXVXAa9HTGvf4TUEc
 M+5RhqGpL+TU7M4rS7QUR/XsHOEcs+iBcFDggIfMl0CxelC19+li3jxUDxuIgQNSZmmW1s4IyEo
 bG8oBjYYoA7xQzbpI4Nfmwe0VaOIMUNsen9UoSJB2viQieO23/Qex3aix1ZP40eD9gl6pfwvulW
 5rr/xkjV1tmU5rJDytpnGvG52ge6Si2+JIJQKIGiEZdGXmltIETOFe9I6yp76+SO1JpTAJ21baC
 98xkQtqGHH/b0uomCslrF2Qlfk4arcof3gHrQVWdW2xbqExfqJ+X59LuFinbl8DxZ4SGSdkdhlO
 MoOYCJK13DHLwSUdsguELzt/ZozOjuhpB1IrSQkMv99M8m9b13TRnXy5TPbwbDXGNZjmnplSKME
 0SKfwL7rkz/kjleg6IQ==
X-Proofpoint-ORIG-GUID: 7-GhJj7fvPaIme9BAFDczLxjSmFmCaWi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080069

find_sdca_control_reset() only ever returns 0 -- it just sets
control->has_reset / control->reset for the framework-known
(entity type, control selector) mappings.  The int return + caller
error check in find_sdca_entity_control() are dead code.

Convert to void and drop the check.  No functional change.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_functions.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 30fa0324648a..b55e3ad8ea34 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -920,8 +920,8 @@ static int find_sdca_control_value(struct device *dev, struct sdca_entity *entit
 	return 0;
 }
 
-static int find_sdca_control_reset(const struct sdca_entity *entity,
-				   struct sdca_control *control)
+static void find_sdca_control_reset(const struct sdca_entity *entity,
+				    struct sdca_control *control)
 {
 	switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
 	case SDCA_CTL_TYPE_S(FU, AGC):
@@ -948,8 +948,6 @@ static int find_sdca_control_reset(const struct sdca_entity *entity,
 	default:
 		break;
 	}
-
-	return 0;
 }
 
 static int find_sdca_entity_control(struct device *dev, struct sdca_entity *entity,
@@ -1030,9 +1028,7 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 
 	control->is_volatile = find_sdca_control_volatile(entity, control);
 
-	ret = find_sdca_control_reset(entity, control);
-	if (ret)
-		return ret;
+	find_sdca_control_reset(entity, control);
 
 	ret = find_sdca_control_range(dev, control_node, &control->range);
 	if (ret) {
-- 
2.53.0

