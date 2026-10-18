Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95AF4D37DC
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792351460; cv=none; b=nJYhcCgN02yTR9oNB5zpJwOK/jnMx7tBKRbBcv+dsDO4bAO5J+OSLUbZ0HqbcbV32kvJE+VAVZCjNf5Ku6pXEKWAX/eYUy6YSeBezu4LsieKqErn3kF6A481qjvYIsGDYWn1GABYTfZH4OE9gVmUCLlcg/O1PLaq0xgi/F4GUi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792351460; c=relaxed/simple;
	bh=QO0CjOwBHYKx8E+8rkyRBQaXbVvc8fThw1blsg6jZmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cUzjk3OHK1yjAtUWq4FQvVVSHRSxWbW4sAQy62HZpCDWFx1E+kwQFGL8E4VNCFERGZotl/UPH+LEts4ua1nseysLmMSkpP0RwyTVDOG//U6wo47j4iPbhScbX3S3bVYQa77Si5jLvtJFgFsA6Smsz7znbVMROeq5NPEriqkhSJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hx63f9Ax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTXac+MI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hx63f9Ax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTXac+MI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IITl251510722
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PDrpiMxYTLe
	+XHOeuIts06W74d116omNFJBZk5qILSw=; b=hx63f9Ax11zgeUNE+F8TwpEFeOV
	/Jot3AVT4AQB4UfPaMRu/G2IgnHLoDIDo//TTXQIUgdhsxvmt/8kiJPQ4eX+MOlq
	gXtRfP1zSjmBmJCv0fNQv5T1U0v9SgrOQbncB7DMpI2rN/xDR9bD3kaADQJOfWln
	WydwaLzmJU8lq0nT62lipbMumeerDZ+E/OCAzT19KeaZ7qeschXc24nNlUKWmQP2
	F2wAq9PPV6UV7X0+4fLUYBHeaIO5feaKyig868DH2U8Jp3lPnG5HJFQAlMLr/IZY
	lajRdYmECdD/5OVhUD6DOX8WvoquTiDUIL6tgTtAib3vWcUKgKPDoAHQJ3A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbyys3wey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:24:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caa0ce0cdso163469285a.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792351457; x=1792956257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PDrpiMxYTLe+XHOeuIts06W74d116omNFJBZk5qILSw=;
        b=OTXac+MIzT1AUiv5OksxdafSQUzrXm6uDGHZ12iHpMvecBXW2BwPaPBJvpBTn4pfJ4
         mKabMJKjtBph0RF0CjI4g63HJNtT8a4rKjoRz+l562n6/8lQvyXxb3IcZ6ewZa9byBm8
         J/C0bLN6v4zR2qGmGdaCu6H3QB+NQsrYNh9cTDQmfB+uMAvllMqqgI7ttO4kMAtNeZcC
         w/HeSEIiteH3JmEXlLuHJDETx6Z9/SHSLitlmG81uMrermyzX+SOO+n87yuJJqevHuuS
         jwL6ewZiqjwhKPEjKYjk56M41nd83LhQGcd5brNpEeTK/IA8c5YpXCWlqLrvQAotCSZv
         Ayvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792351457; x=1792956257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PDrpiMxYTLe+XHOeuIts06W74d116omNFJBZk5qILSw=;
        b=D+B6TI0Iw3sLiQvQpceIe19lMyISr8CUIVP04VvOba/0IDFRTOWBgysyxo5/8L90ct
         sdG3in/HzwGOD2mEZ35Oej3D1cYn/xXFDks2XH5p5cmpd3gjPp7wmqXnMMpySgrvoSHf
         mZN+o1JjDGWsWMFZwgPZYPPAhcCutNpF6rxzQ0EgdLaQCe8RlsbPo8k3g4vacT+IomNW
         +TWX7d5rJrr1W/bi/Mxy+d5h3e38iiXyOi0kwdKt+fviKxrCHqJGTaNsGsr7Uvcj/zc+
         TtEW05COGMFKQaynroG7MANRiVN/7K3/7u7QL3QcDWtdoVuDr8iakzYthtm/2YoGkVjl
         YODA==
X-Forwarded-Encrypted: i=1; AKwUvBy2kvuqzYiLZ1Iq1vZOM77AbkYKWTUTKqn6aRJwUxGsueSaIzdh6aqxk/fTOsd8TIIyUjwCYvzDP0vF02U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqiDO4GMvI/bsIGcBLFyhCL+l5mbGR/KSufG7oRYrr6ICKXXH2
	cgNeECJJAEnBuOQ0fzTN+vof1pKuuDqXbRhWAxR7KdlCtqDVq+CISLR87V69J4ShR1BzxqTSJaa
	Hm29IT0L0zYM2Fr8QnDv0NtuHPi7ortP9FrefoWvK6KQInbHqhmh5SipFfSMc7/TsfyU=
X-Gm-Gg: AYBFou3og0ImEv79QjBgMcXZuPsXJEtJxeAG4loTjn8LNgoMxE40HSi8C36037iqKJ2
	F1MljXBIjM7ZjwrzACKFJbVRopjQjLTk7zEgTN01m5vBTSZlkKjKrVZeihvx2PpG4f3WkxamfQR
	NcEFGW4AFSiHc5YCslb9AUlNGLHYe8ePu7to9FeXY+Quv1PiVNGAwHkzyGNnEcmQIZNb8Oq9KWu
	2yhXkuo9L3RFIwa2IAPn8acQP3jUHEH6x++VY8B9K9vGsqnwLZf/9qKC9QE29qwwsTnvPlml3f0
	xkc6I42CJrRBwq6FzKUFf3U1Hn3Rl/rmI4r17Gv+3Nld6gkloE3OK+Egqi8qOVpvWT340t00Ghk
	htwuakzvTIv3/
X-Received: by 2002:a05:620a:172c:b0:93f:1e3c:4a30 with SMTP id af79cd13be357-93f29d12e8bmr1050468985a.35.1792351456933;
        Sun, 18 Oct 2026 12:24:16 -0700 (PDT)
X-Received: by 2002:a05:620a:172c:b0:93f:1e3c:4a30 with SMTP id af79cd13be357-93f29d12e8bmr1050466685a.35.1792351456459;
        Sun, 18 Oct 2026 12:24:16 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm184417105e9.5.2026.10.18.12.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 12:24:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/4] ASoC: SDCA: class_function: clear sconfig.bps on PDM data-port terminals
Date: Sun, 18 Oct 2026 20:23:59 +0100
Message-ID: <20261018192359.287987-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA3NyBTYWx0ZWRfX3N7KryDWaPze
 bK8oeurj7amF+ueF6itdpEQ7vlvo47Hkp7OCM6ZsthsvxFMCHQZIF2Nu6FFgOtcqfSkT955r7GA
 ufuqOyZ4Ix8oGyr8kYeg4SeQ3E84KYIIHHxd4t7R8EAUq1Ge0193LPiCvFe15l97+JeA3xCBQTI
 5wzD45d4QEfUuXCyJj/zurl+gKU4XKP6T+eVe2xgTHt0+5Ha2qRl4QwBajEX3EOoAhtzusebPwN
 ktqoaamnIKjK3pkOsIkwOrNkX2NJy5nsNEKqRGfHpnjDPJWHE3VqBSdWZH/GH6fGrJa5C3KcTkY
 E2IZgfPT1UOTwRDr89TaKrm9dossSAXi/VipTvCpLQ/5UyBwuYK9RwnmuL4twAUOmwHRxyizomQ
 SqwoatbtHYZMyuR//VeAnzptCAktCXMSna38+WREYjJUOXYbRanQBX4L3xqudPvG1D0m+a05yvI
 J3pAjVvTOSqe6WKlzpg==
X-Authority-Analysis: v=2.4 cv=W4WtxhWk c=1 sm=1 tr=0 ts=6ad51ce2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=px4HCA8uLphOQo2j6gEA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: KHYovIGxY91dzNS3kt5d7jTNbDay87tg
X-Proofpoint-GUID: KHYovIGxY91dzNS3kt5d7jTNbDay87tg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA3NyBTYWx0ZWRfX0jQGtfffbOcr
 wF4zhGSmNUH288zaRKDHUjXHFWGercm687w8lL03kN0MS+zxhJ/ARefOJj+JuYDOg1tD8JhziIL
 VI9LvVY9sWnMFpZqVI2Sc1TN0yd8sUk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180077

snd_sdw_params_to_config() derives sconfig.bps from the PCM container
width, which is not meaningful on PDM data-port terminals and clashes
with masters that declare their own view of the wire word length (e.g.
the Qualcomm SoundWire master hardcodes sconfig.bps = 1 for PDM).

Clear sconfig.bps when the DAI's SDCA terminal is PDM so compute_params()
or the slave silicon drives the per-port wire word length.

Assisted-by: LLM
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class_function.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 13b70f0f0dbf..acaadd12432a 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -126,6 +126,17 @@ static int class_function_startup(struct snd_pcm_substream *substream,
 					 substream, dai);
 }
 
+static bool class_function_terminal_is_pdm(enum sdca_terminal_type t)
+{
+	switch (t) {
+	case SDCA_TERM_TYPE_RAW_PDM_MIC:
+	case SDCA_TERM_TYPE_PDM_RENDER_STREAM:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream,
 					     struct snd_pcm_hw_params *params,
 					     struct snd_soc_dai *dai)
@@ -133,6 +144,7 @@ static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream
 	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
 	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
 	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
+	struct sdca_entity *entity = &drv->function->entities[dai->id];
 	struct sdw_stream_config sconfig = {0};
 	struct sdw_port_config pconfig = {0};
 	int ret;
@@ -152,6 +164,9 @@ static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream
 
 	pconfig.num = ret;
 
+	if (class_function_terminal_is_pdm(entity->iot.type))
+		sconfig.bps = 0;
+
 	ret = sdw_stream_add_slave(sdw, &sconfig, &pconfig, 1, sdw_stream);
 	if (ret) {
 		dev_err(drv->dev, "failed to add sdw stream: %d\n", ret);
-- 
2.53.0

