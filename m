Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D51446C18
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770320; cv=none; b=HJv7HoagOTRFghvbu5+6lin+QdlcyFTpa8mAiab88eGPxQso9slzJc1H/NZGJx2DZD+v6yPG/1YfW3ojGvJ3z8FMTvpWfi7oegjCSu+mjolyGQKJY5D4kb04NfNrsW5xzEXuaoadzji5DxxW+hyhO7j6Ki0WjpDoxUAEcTE7rbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770320; c=relaxed/simple;
	bh=DgNygwjQW1S4gERxv8XXOx2YJrza1CSfHMZkNg6qCgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXzsL65TOwptqqGgG0+W8OxrgLp9Dp3//c3Qx1oTaPR26GqcxAwu15wGxpFVjs6y43uRFohOEV5kZSeWdKxKvrKlD+W7d4wyMgH9E2nOxHsQS7gjWTcmTC5VOui9qxWHIaU3rOi8d/2SmVvGBwfrl0YMJz/axgsQHair3VfImJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1BcE7H0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uxbh1zN1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1BcE7H0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uxbh1zN1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777chD2146240
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AiIpEIEQZ4E
	IiKlUje19hDPydG7qbYBZVrWugQnhc24=; b=O1BcE7H07hA/E8X4Ke6ZC51W6EL
	JXB9T1CcoEbIS2uQp/76XoB4zlRJJUrNEfCluZnQREdn3Mp/eQZK1nenAFsGFide
	s+gN1NR9QvSojOak4yBNowyeO5ueTqOokjVTmMFyILqu9ZpGegRLG7/heMc+eY7t
	9Soqr8bXRFM0t0wG/Xpjuvxv3I46TbIpxHlgyObieJJpAgvShK64bcDf4O32TSSw
	rxLTqTt5EymSsxmDmOVyqETFFyC5vqvoYmxNf8vadf9hUNGUyzSL2GgUgGd2EgFU
	4TOyYy1/Ygo/lf3UzCEk0dEe2BCkU2PCiGK0bDcTnD5kun0slgVYNzZakTg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jdvxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:38:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e38fbc5so561654685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770315; x=1789375115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AiIpEIEQZ4EIiKlUje19hDPydG7qbYBZVrWugQnhc24=;
        b=Uxbh1zN1N6fVS1GpJWrFhgiDl+iiiihUJk8jL6HFNqKLhZ7liZAIO4C/ARoiVLN41x
         gTyd4IkS/LuWkbE/hL8UkCzmNcNywbwceJkrYns5uURbPG1R7KbgIWs0CYeVkMtYIrrG
         JUFlTjF+KG1biAotBKRIvza1op9BL5I6XybkqahQOURZMHWDD8GCNAbzDhp5tvm5sD/F
         Pl+6g1utQkmjSUVvqGQ2MDCgw7YQ3xsKcwRrDlY4O8ZEpx5EUoTFD1ToPXUh7YYxzSee
         2+Nkr0Yu1eF6HEMH5nXWDcPJq6OJXuG9m7jncv3DI4vRJpUhCv/NkaMEuDn+Ji4htPY1
         Dviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770315; x=1789375115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AiIpEIEQZ4EIiKlUje19hDPydG7qbYBZVrWugQnhc24=;
        b=J+sLfHf8dpM0YSqzujy1GL4ntPfv2bcvH7kFaIkrz0tdWu78sEnXu1JqCxNkkvkwmV
         6oAzujbnygsk7UJvZoIdLyI423d+w75xqvVqD9yHMJyTQOQ5c8005h7XmbQf24ur1qTB
         i+4R12QRwGKx1+mXGpOynJIcK0+OGYdVG2DseA/u+UDU3CcA5BkJzIKGWlKMe3fW+Bwp
         4iBzEG9JUAf/mngQS1bnMOFHaHECp+E6QfAkbAdPqs0mZH3+nuf7m3Ojaiz9tVzuU00G
         Z8oIAP2w7N+uICBQiFhW6voJ7+R258eE3RNXlJ+luko7AewC+vLsFHBDrhcVw1Qobg/y
         qrvQ==
X-Forwarded-Encrypted: i=1; AKwUvByUj59pmEyXbMwnYkf9VEig3pfTW0X/H7jTXbYyplDkzte7EqztJL0arbJ2APAzsa6l2xk2GL4Jo5fq1dI=@vger.kernel.org
X-Gm-Message-State: AFuF++l6Md13hFA8TSQP83tPfWL5w58r7mfDDe0kzECL716sNv03ifjA
	wAELzwRdgYSSoV1hfrs7UdAS3fdV7Bvet+Of/4cthQ+qby6ckPFXY9axXmeyJHmJVU1SgcjlAwC
	bfF6PKCy19+j6d+5+1Cx+FI2KQcFhPxcJ91IRBQTvH5E9Zl8MveqG0MIYoN59u771jKg=
X-Gm-Gg: AYBFou02VXjLaP45unpFB7d2M0NFOoLZGTYc20Bxw+5HyNPsmSWmriJVAhXIY7jxsMX
	R6e6NJVQ7Db5tzpmKM6O95OCr5Jn/peWwBJHKPFtmMov786J+re8c6DS+n+zmHKDYsH93zIm5R0
	ZQHuvoYF31ho1dPbjULPvCNzskx+0epo5+MUBp6G2ZY59MoeN1v8RpxlCQOvroXbvmwxANOuOx4
	zDOAzILiElE9usROkCBdUQx2e+svrMzjn6pDiM2Go2MI7FWy2cV65UB0I/yqJX3YtBBChfTYMHw
	oy4t1UjqLIFCYYegxSjbNlOvzi+0FXisyloGbMc0jwfmiROHAGS5d9oAo+WnrMuMRpLrvdXHblv
	JXR+CGm7xsoCO1Q==
X-Received: by 2002:a05:620a:5642:b0:939:34c6:a333 with SMTP id af79cd13be357-939804a4609mr1838514785a.40.1788770315555;
        Mon, 07 Sep 2026 01:38:35 -0700 (PDT)
X-Received: by 2002:a05:620a:5642:b0:939:34c6:a333 with SMTP id af79cd13be357-939804a4609mr1838512185a.40.1788770315103;
        Mon, 07 Sep 2026 01:38:35 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:34 -0700 (PDT)
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
Subject: [PATCH v2 06/11] ASoC: SDCA: class_function: xlate sound-dai cell by entity index
Date: Mon,  7 Sep 2026 09:37:20 +0100
Message-ID: <20260907083727.733705-7-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: N-qKOpmElMfVg9BMVI8XwSZdaBMPNx1b
X-Proofpoint-ORIG-GUID: N-qKOpmElMfVg9BMVI8XwSZdaBMPNx1b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX3fg3fAWhGayo
 W2XHkyrvzKJxWvokVDu2fyNeAN0Ijeo0B5dKqoLZP5KErviTC7ECwvEodPLbTmEG2fYB9LSCSUR
 l5o5+9Z3AgKyHIwC79DvSHDi2jkB6FBdaBvMG0ffKusXQ2CWnE9u9cnOVr3BdfUKw7eMQr1zvFi
 A6KDEgros+0erx113/4LCgDAS2k3B6Dw90IpklUCx72sPfbC92/CQbElfOQSQzxiWBDAeblxp6Z
 Yv6YLo37glb+gR/PAnOJtREYxOkfZlW7qJ/j1HUgqGcMD4CMf6efbAwldB+iw41I9NZwJSK3Mpj
 dwz31lOjpm6AGGfYjbRbWhXwzfrJPcvnhSzqrN4kTyPfQU9OosRT97buljLaDJL6Kw11SzqOPMY
 Z/Sfx/gSJjb5/KAFwr4aL2TczsymQKObbVo9uNxY7C3A2iKhRnD3tAQF4eERtNCTKE1p27q7RW/
 lLQTJpLAWD0xVFUL4Aw==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e780c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=D7LRd5SpCY7MsyqoJ6wA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX+S25FyZDo+g7
 ZT7iY/3rnTFiYSuw8t6JRPTJ6rVm9JRFksUXZHv6Rds6dPZoxBdNxt6SF9VKIWIMHIMLyP5y30M
 GiW4sD6BLbj3dc3kREbpLWrJJb7kQVA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070093

sdca_asoc_populate_dais() sets each DAI id from the SDCA Function's
entity array index.  ASoC's default of_xlate_dai_name treats the
phandle cell as a positional index into the DAI list, so on a Function
with non-DAI entries between dataport entities a sound-dai phandle
resolves to the wrong DAI.

Register a custom of_xlate_dai_name that walks the entity array and
returns the dataport entity whose array index matches the cell value.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class_function.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 8bca88865a4d..ab043e23878e 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -216,9 +216,43 @@ static int class_function_set_jack(struct snd_soc_component *component,
 	return sdca_jack_set_jack(core->irq_info, jack);
 }
 
+/*
+ * DT phandle cell is the SDCA entity index (matches dais[].id), not the
+ * positional DAI index the default xlate assumes.
+ */
+static int class_function_of_xlate_dai_name(struct snd_soc_component *component,
+					    const struct of_phandle_args *args,
+					    const char **dai_name)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(component);
+	struct sdca_function_data *function = drv->function;
+	struct sdca_entity *entity;
+	u32 target;
+
+	if (args->args_count != 1)
+		return -EINVAL;
+
+	target = args->args[0];
+	if (target >= function->num_entities)
+		goto err;
+
+	entity = &function->entities[target];
+	if ((entity->type != SDCA_ENTITY_TYPE_IT &&
+	     entity->type != SDCA_ENTITY_TYPE_OT) || !entity->iot.is_dataport)
+		goto err;
+
+	*dai_name = entity->label;
+	return 0;
+err:
+	dev_err(component->dev, "xlate: no dataport entity at index %u (num_entities=%d)\n",
+		target, function->num_entities);
+	return -EINVAL;
+}
+
 static const struct snd_soc_component_driver class_function_component_drv = {
 	.fixup_controls		= class_function_component_fixup_controls,
 	.remove			= class_function_component_remove,
+	.of_xlate_dai_name	= class_function_of_xlate_dai_name,
 	.endianness		= 1,
 };
 
-- 
2.53.0

