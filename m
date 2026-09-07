Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D46F4483A5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770321; cv=none; b=SZML8VkC7lXiVbnKsVFaFRr911zl3emMUl3CB3wuuZDuyOQhhEQyqezyLQl/Grdu4/oPc5/+JuUsC+rOmZpBwHhb9rrMKI9R0ggUbklqdiigri28nF+OJYxXgFwOfdlkdQHuKp5CFyM6V03K4fTwpGn+p+ylaFFmHhlvzdSat5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770321; c=relaxed/simple;
	bh=KSMNo8g9EzvzwyGzuw9rT37GzWc3bg5wEFNUMeWd3m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KGP93SNyJWZijxQ/kmQq5+YdfMsmG8VTSy7zSC2tnhwEa8bQeKIXqDdvDfTcCukL+jlVGjqZJZ33dIxgtMwJqSRaGQN3SirJ4HpAr3JapLsE6YD3vIGXSfgIV/B2q7SAkZJXWy7DeWFlcN9qS+m3IIgk4UVtLs5gY+TWY22w1RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5Xu8pKf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKjnsxOp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5Xu8pKf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gKjnsxOp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777JEO4161116
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ip+eqAI2Rmw
	ja7TOAXqTLr12NGGvPjVQ2o1ftxzlnKw=; b=V5Xu8pKfscCanne5RdqZbZbv202
	ETrilp+J6RiBrhsE6t8prwrm9uPVAUL5WMoGIcsPXThNk0zh1xoFpbXldBW1wJNt
	wrOR0PORIlees9NixTlZ7jOT6DFkOjGkxB8Zi9+mZViE80XZHVucKyalIrQ7i0S7
	HDBF2BhbAb3gqqciPNfbD5qhIei/ZSXoErEZO/0HpPifloasjh5kY+B2szIlLrJd
	HIuZn4nZ+lMLfo/NYTudOA548nRtIqUYQoX6HYSxT2OB3tej2Tgw7AsbzoEVj87y
	3HPm6S1+biQww5SOcUV8kyPnp9b8KkU0bcOEHiZeSzvHo/q0zTPVLmz8ZkA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfwjhrxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:38:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so542774085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770317; x=1789375117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ip+eqAI2Rmwja7TOAXqTLr12NGGvPjVQ2o1ftxzlnKw=;
        b=gKjnsxOpiHXM5tUTgXzj3U5s1N7LS2oPP/SUZgUuEzhyzG7p56PJcEMsRsmR83ChQ+
         hOkXhxxmEYJL9NARhvRtrQDdY3KgJ3cHi7iuRC8O3SRor0tQbCi+cjE4H6wubfeUqLG5
         m/0QWW+MhsAwNtgy8Nb00+jNZTN3FvVETigT+SH0K0dqkT+Vs8YLfEj1ZUAqJ68yKDnR
         IEHkhFQEdNXgGhcS+6d6+OI4LiCZpGCVxi1cwiMEhw3w7gXTtvlzpco10VQheUzjFq9x
         eMgjIhObOROa0lO3WRSpPjZGi1GJF9am/4zHsl4KRDYXP4rskFBm0PrIv1pNgBubsYCh
         PtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770317; x=1789375117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ip+eqAI2Rmwja7TOAXqTLr12NGGvPjVQ2o1ftxzlnKw=;
        b=T9cvx2LZ0NKN472Qh43a5knOv5Y36BGh6zSAdQrK059DmPY3ycqd6c45NluHRrnn2s
         9XWV/DH4hHOBMXdM2qHA5HnV1aRmgeDUMXW9DHq/s64A11wA+GH1ZaeXwzre1L8w23Ca
         LIgJYyzKIgIww5MMaqN2x9z1DM3Gp4eobX/vDA9JfC+5idysKueh1Ge2UdZSPVWOdGGN
         orD/JutxJ2PAugHbiZmHtI0P0gGmJXyAiBz5glxhzXHUtxT5GSzINlK12OiAW+axhAlL
         nl6pZdZ/BrvZwPSZ9gFesisbmM8HJkUQF5tSroq/BR/lZpJmuAdYF56OaU3TGuX25uXH
         FYdw==
X-Forwarded-Encrypted: i=1; AKwUvBwFtC/TseQG6us/TDsOqUjB9G4hYWvsE9EuD+G5g0cs9NljTYiarpKIMU5RYg16xfvOKFM/pH8Yvzyeyfc=@vger.kernel.org
X-Gm-Message-State: AFuF++kWe/eG+Bwg0IXDov2PkOq2YjObz54ETiYiV2+fxFzGfLajaHJt
	MUSdwLTmytG1oIwbSOOK/UN+gitb0pFDVppPqVtFA+OtF57AFKdZNl3pon7goMkUwecsWKpPeXK
	LNo7b75NLayaTae8fE2jqeSQPCuL/lat6F2ERv5pHVajyfXUP0UuMHv8QN4IBn9TjFa4=
X-Gm-Gg: AYBFou18iT0zIQJS79oRs8IrlCVyVah/dOGf1oEgU+vrFjfLcY8PQO8VQCshEJOzlDA
	7K30zMQGoHa7MdhONwbUesf9LCx0toBuVBeC8n1kSpDP4lKItVNzp4KX6iOYbhYb/D7/5Wty4xk
	WB+JHB2dWhSi+q6+khmsnneTtJQDe1po1gNKw4WeKLMQBQ3rNV96rHySWv6kVT8WxznjS1Heafv
	3Uo36s368FiBV0xKwz0YSrITKA35Kw6HMZ12OhrrLtq1l1D86DmvWmU+Rs/izBYggby+U+uIfMa
	GAk5MJbgcZc6IgtHH7QmCvufCTcRpD5Sh6yK+/+2I5ihMlElYu5eYEU+7bqd17xu3hqLiUuVjHj
	Tl2SOBlOjwSpULA==
X-Received: by 2002:a05:620a:3d02:b0:936:ea3d:9313 with SMTP id af79cd13be357-9398037be5dmr1382139085a.20.1788770316963;
        Mon, 07 Sep 2026 01:38:36 -0700 (PDT)
X-Received: by 2002:a05:620a:3d02:b0:936:ea3d:9313 with SMTP id af79cd13be357-9398037be5dmr1382134685a.20.1788770316450;
        Mon, 07 Sep 2026 01:38:36 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 07/11] ASoC: SDCA: register SDCA_FUNCTION_TYPE_SIMPLE_JACK in class function driver
Date: Mon,  7 Sep 2026 09:37:21 +0100
Message-ID: <20260907083727.733705-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfXzBXTVPG12G7y
 4uOvvvJQkXMcJ/0jJnQeUG63jqmJQCcBXxfdgyb9TmmiKpC8j5I/ho04BBydZpOwTLlqfThOBN3
 Cn099AK7Y5QgWXojXlCcgHeZYR0H72U=
X-Authority-Analysis: v=2.4 cv=NanWEWD4 c=1 sm=1 tr=0 ts=6a9e780e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=w1d2syhTAAAA:8 a=IEwj7ntJ1M3WgPGe5dsA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: vEknHVSImaQyvkYWqUM7h-7z4BqJOzxm
X-Proofpoint-ORIG-GUID: vEknHVSImaQyvkYWqUM7h-7z4BqJOzxm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX4u/NmUU5VDHg
 9dEBcyk8xC5T4GphOi09BBPDpbKTpSuFqGUa54pkVfocUJRkOSqVMoEVWZqocZD/cPSPqj5ySRv
 k64YhVxIY+UY/gE5CFyVj37A4KLIxEH0z3CS2GCPZY+kwct4rrCXy5Z70aCS7hjMraZhBtbT+c1
 IbKqx6o4+IvzEDwz2qv9qTlhE21U25XnGBRfww9qFH4sARdMeaWOFbQ8MeSgiFRFs0toiKFaF6u
 /dGtx9DaqPmB7MW+z26pt/6RHdFp9iLgPxou2Fr5ei+WtdofYR51ZN/xgqUEdEWYvMTbDZH24L8
 pd9eAU3mq/FgsoEVbZhVGWp07p88wwOUuD5kDRrNiJ9X4CIeM+GvY1Ne3Vj0xXNtCx+3SeIb7VC
 iKxKDegaFxNU2D8zWaYT6W2BW13STfKOm2DOINhHzYdTzHUb7MXe0nZ/JheSuaHt5EdQOyUAwJ1
 Iu/8OCYD+5xpA2q3R9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093

Add SDCA_FUNCTION_TYPE_SIMPLE_JACK to the class function driver's
auxiliary id table so a SimpleJack auxdev is bound and enumerated as
an ASoC component.  Wire set_jack for this function type so the machine
driver can register an ASoC jack against it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_class_function.c | 5 +++++
 sound/soc/sdca/sdca_functions.c      | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index ab043e23878e..713a34d5954a 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -408,6 +408,7 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	switch (drv->function->desc->type) {
 	case SDCA_FUNCTION_TYPE_UAJ:
 	case SDCA_FUNCTION_TYPE_RJ:
+	case SDCA_FUNCTION_TYPE_SIMPLE_JACK:
 		cmp_drv->set_jack = class_function_set_jack;
 		break;
 	default:
@@ -593,6 +594,10 @@ static const struct auxiliary_device_id class_function_id_table[] = {
 		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_RJ_NAME,
 		.driver_data = SDCA_FUNCTION_TYPE_RJ,
 	},
+	{
+		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_SIMPLE_NAME,
+		.driver_data = SDCA_FUNCTION_TYPE_SIMPLE_JACK,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(auxiliary, class_function_id_table);
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 47dedb62c24c..25f95575c731 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -79,6 +79,8 @@ static const char *get_sdca_function_name(u32 function_type)
 		return SDCA_FUNCTION_TYPE_SPEAKER_MIC_NAME;
 	case SDCA_FUNCTION_TYPE_RJ:
 		return SDCA_FUNCTION_TYPE_RJ_NAME;
+	case SDCA_FUNCTION_TYPE_SIMPLE_JACK:
+		return SDCA_FUNCTION_TYPE_SIMPLE_NAME;
 	case SDCA_FUNCTION_TYPE_COMPANION_AMP:
 		return SDCA_FUNCTION_TYPE_COMPANION_AMP_NAME;
 	case SDCA_FUNCTION_TYPE_IMP_DEF:
-- 
2.53.0

