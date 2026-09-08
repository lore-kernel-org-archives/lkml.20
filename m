Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51BC390CB9
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849429; cv=none; b=D9ML+G56DVcMUVGiUqJdKT8MBJC8W7e+YeogCuD7SXIWofTdq05Fwq4q876trODJ4O27tpTmxjE2cNZHHGyhwHsEF4waH2FVJfImoO2AsvROgtqs1aZIwQ5eTH0PubeslMRHMlRZ9P8BHdVfWzoeKZMcME0wFrI95q7bMqUNGkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849429; c=relaxed/simple;
	bh=YiTuIbcS6hPcgv6ItYlpBhz0L/k8rn6qCb4bzAgirZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WEK1J4ngYTxW/QSSYUV0dRxpx3efsCtFXCSHPbOvs2HkG6LwJ8n6tprz5GNO79IQkRa4V41eekL1ocwn4OSWsyQu5NnpQVDkbROIyoWS6+JS0iBkVcrGf4L1uJMzt9QvvkxuakNTHE1fg/ohjTrhRfEaV57F9191To5Ff7HSw8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9xc75nF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GwZId6t8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9xc75nF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GwZId6t8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Li3R950281
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 06:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QuIDTG3AsB1
	yUpm1Ko7cKVJyJNN0vDfKHooNGo8PMHE=; b=W9xc75nF4BYLWWqEsV4rTwC0E3p
	cOliblW7GwT3rpwegZQ2lPVEFbghYQegmM+NBZjtOIPVWVaTs+iAV7dL98QjB8DC
	8VQEF4OlSQ7YDjz6ZP6wUeR9rWjuv8Z0nxb4XDDiIa1r7N6F2rVjfNLUg1fcEHv2
	Hw52hSMuIGCr5yfsVmuJZ2HMftrAcOnHQJ0d5S73K36wEpCcJNeM9r6JfZoB9oJm
	fkCuuUaa7ECNENIkZt1fcblhzJwPadgTx8VCgUUSz7fWHdEmyU59SCWuWmCOWjfq
	ZRPzNjzqq5RUpX1LU5MOm1cenQA4MOGzfp263TLlJsh4fjG//HSwX4ZozZw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcrp84x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:37:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939694871aaso677183685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788849426; x=1789454226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QuIDTG3AsB1yUpm1Ko7cKVJyJNN0vDfKHooNGo8PMHE=;
        b=GwZId6t8DoGjs8Jk3F4btbYtnsio7alBbEI6+KYBb1XLeJhOkYpSbqnlvK+Ay87eyv
         z9CUSJCPeql4XLk5cVzhPf6jfAPfB7yS2lcTzuppVF9f37riT9KsRwf4FdhHWyADGc7u
         dCxB8RGfk1lfUCtYROEKFho55/vbAZcM9Ja8C2VnYRR6IT8lq5TOtMr2TfLOhATL+Epn
         +ZlFpOuV8l2poh65kocQS60pZc8LJ1Ow8URVuicCxKKAt3bSyk5lQUgMPYX3Hg31mkTW
         nE64QeprOz7sW1gnlc2TZ7F3bC4dPE70YMwk2+mNdFAgSXsftSLj6OTquKMetzsk9gDQ
         kpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788849426; x=1789454226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QuIDTG3AsB1yUpm1Ko7cKVJyJNN0vDfKHooNGo8PMHE=;
        b=la2o8smURpfXKD7mKtZlZgZ6fZhY+jCytczMQLPH8xxVzfaNjNQbXQOHa5vxmhzeHI
         KOT1tmKK5wY3lsbmGjqF4uMuGhWHID20lhpTIAonnYT0WpbOzLuj6L368UmF09e2wYR0
         1KoXCZGfOAuHE75d+rTacJLkIROIcFLzQeU+zQ5wEroFRnMfdCBJAVr3KL00+4QBLryF
         /DTHIOB+ZjhU6D8adC5ukrzUb4QWrlEqHzs0wWoEGXJpitXbZsWaR9tMksQgzEfKM8an
         weDmif1AzAoB1EbocQ9l6+Uk+ivAovJ7YD9LbM7mhW4VWS7hGcN/Ql2px+/l2ttkfm5L
         Fz7g==
X-Forwarded-Encrypted: i=1; AKwUvBz/mx2p8e487QmqD6mwbWdJluFW6DmyA7U7rS6rRgO83Mt2x7sJlnfPSIdBg3NM1RTt8kxFEawku9DM/Pg=@vger.kernel.org
X-Gm-Message-State: AFuF++mESQOOueQGiKtfla3eiQgsU9HI5oL40peb1Huvzc3PS5Qtk4Z4
	FfuOfcgtK11nYs+Lz80ciUPdSmBaTcNOEvLqJlhhOXRrLCUvM0bZq3NWGyTwLZQafkmrte6El1L
	v1ZabDOXUoWjX75plNKGlweeqG1e/UI3IKWAHXAjwf/WrogKvP/lWt3bQ01PD1m5u3KE=
X-Gm-Gg: AYBFou2sPI5TAaN41r6UufPpPbTANr3aBm6iziRtS0sSgezScofzfEiIAWf0zBK13O+
	WfFMO1D6oxG3DtIggdZxdD4Xb4Xh/BTKQbGF9B9vP3W/1HhG1JjiSHRDpy6uQGsenVpMvVeMwKq
	HcUqOPRCicl2uwsjOgURP8lpcFjjC4Lba+npPrU3kFqABC0Q4kfcxadR68FPl7IUzXV5ZTA3jDY
	l1ScNMN/VBWYjxVS5oXjfpTGg72PiL1P0TyOLXQ5qYageP6Hm9O7Z9FRxPCu6EcRKzeeJIe+fAu
	yrYkHX4cfQc9hZhO+9rD6Ip+Tp/r16Obds8+MJH+yogGDNGQV6ulzQgsQjTfJyATSidSqtkM87K
	1gpAULnvKdApKww==
X-Received: by 2002:a05:620a:831b:b0:92e:5fe2:fd35 with SMTP id af79cd13be357-939804070f6mr2346388885a.32.1788849425712;
        Mon, 07 Sep 2026 23:37:05 -0700 (PDT)
X-Received: by 2002:a05:620a:831b:b0:92e:5fe2:fd35 with SMTP id af79cd13be357-939804070f6mr2346386285a.32.1788849425193;
        Mon, 07 Sep 2026 23:37:05 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm277799675e9.13.2026.09.07.23.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:37:04 -0700 (PDT)
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
Subject: [PATCH 1/2] ASoC: SDCA: register SDCA_FUNCTION_TYPE_SIMPLE_JACK in class function driver
Date: Tue,  8 Sep 2026 07:36:43 +0100
Message-ID: <20260908063644.463819-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=UfRhjqSN c=1 sm=1 tr=0 ts=6a9fad12 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=w1d2syhTAAAA:8
 a=EUspDBNiAAAA:8 a=IEwj7ntJ1M3WgPGe5dsA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: czEZjp0XslakAdSm6bSwvtcRu17cFHdu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA2OSBTYWx0ZWRfX7f2EN7BXT3eQ
 NytUrMI+efX3KCcVxnsawKoVX8p7001vdyORnmXjSiwnPFENd4XbUePtmD6Br9hEsg6eqqXOdpd
 hOB79BYVsn8JKyNlYQo3acvzBnE/c6UtEPZ65KesDht/ahTeFgdDxIWyUNM38Lvun7cY0kqOZo6
 kU4I5O40Wcud4QfuA+2xkloyjgpakp0wEN9XD39T1r+3OpyXWFz4nU2Zn8+vHAbuXCNb/utPiby
 o3KMUFd0ahFgBF38b39WTTPfmHmllxE8N0CJ0uGlkPfsz9kQ+jWVog66GvWP/uOhMHcg8wLwFsP
 1RqUJ0d5/N3uAAeEfRqSiqHmotBqxpiv9x1ekQAqelKR5oEjmJtEIK4nRxSk+NwmxXg82rxujln
 sSsvTEaP7C6jMm6LqWpOJ0sfcIMfO0Lay63ByC070CgAPE+sc0xZ2WqAYcfBBeab2DZMtMq6NS/
 88rECZRIB7x1vjXhvTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA2OSBTYWx0ZWRfX+Qs9ikK4UzFV
 OajuwP/oD5ZtEyQdURn2IsS/bIsWuQDOuvNTGT+1+cT+YprFz+g9u0pmpLQOaYJt+ItztZvLTwa
 Y9j/HZMQcajpXqWLwqo1LjfxuGLFjZ8=
X-Proofpoint-GUID: czEZjp0XslakAdSm6bSwvtcRu17cFHdu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080069

Add SDCA_FUNCTION_TYPE_SIMPLE_JACK to the class function driver's
auxiliary id table so a SimpleJack auxdev is bound and enumerated as
an ASoC component.  Wire set_jack for this function type so the machine
driver can register an ASoC jack against it.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class_function.c | 5 +++++
 sound/soc/sdca/sdca_functions.c      | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index cc7045dc26e6..1d7fd6603882 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -367,6 +367,7 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	switch (drv->function->desc->type) {
 	case SDCA_FUNCTION_TYPE_UAJ:
 	case SDCA_FUNCTION_TYPE_RJ:
+	case SDCA_FUNCTION_TYPE_SIMPLE_JACK:
 		cmp_drv->set_jack = class_function_set_jack;
 		break;
 	default:
@@ -552,6 +553,10 @@ static const struct auxiliary_device_id class_function_id_table[] = {
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
index 32d9b7f30a4f..30fa0324648a 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -78,6 +78,8 @@ static const char *get_sdca_function_name(u32 function_type)
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

