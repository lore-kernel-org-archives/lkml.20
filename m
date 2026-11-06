Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943820;
	b=KRxrIAT/+vz3g88bEwwDPUowgfa40icnPo/mwe9zqMMo1iQRzo+80tcIhW5xlOB18s5p
	 a36EkJVYCOMhOvNTeMvVvP0sU6bC/eOLI/Uk+VhiBfaeI/wEDY6hfCCliEoEiHoNQVq3E
	 Ny1MlFGiJ/7+ficIhL9rgghA7wVb6UgyrKw1WQ9vwaPyUGaZGSF1GNwtOejHOiDLwxpoC
	 4l8r+VuyuvFH2v/2BOtmtoqn3qRR2smELBbCe1uWHyX8DcvkacsxKMvzJ3jxiSHq7w/oV
	 2QrivwjrV7WfbyRiqpXpk+mOGLksW7PSwLhczeBHjWK4w4IKoyOMDwU9eaqrRtDkDCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9kJ0x7eMcYtkQ0WjZ8xrvT+ui3IL9p3saYi0L4ciSsU=;
	b=c2kkcpmZMa7tepRI2F6qcawIo6/e5qy7OY6AKSz2T3Vdd0wAMCGEuTHGMjjr3BtF7xkG
	 JFfK0eXFAbw4FbteIKqEeVM0cs2qjiSJ5gfErnP8FeExPPtaPHjv8+M++qRGUe+aOdvaL
	 TeeX+aXMMtTGLY9YciwUQy7u/tqg4rKuRXvoDd9phyzIX8oPs6r1lFV5mLN5eicxzjGKD
	 glI3WszO1kfk5igzUSkDlnzAJPEri7sp7gXooY9n1lBa6qwQOuE3KQcd4Fpzh6tAWYoWy
	 d2ywz2GCLt0I0LVbsnio/lQ5xBct4S9WQOL/jSBbJr7h/AmiaKFVibe5wAc+b8ilPgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Edn52LW/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fESWYjUz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33518606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33518606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Edn52LW/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fESWYjUz
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6409Vb2780192
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 05:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9kJ0x7eMcYt
	kQ0WjZ8xrvT+ui3IL9p3saYi0L4ciSsU=; b=Edn52LW/y0B71f+2G3rcVBZpq+p
	ijeg2VIvzJvvHUAI7zhMiGf2ZHGCpqzjJa2mQDvRPE0iOWMgJ7Ji1Hhblokc6uqc
	EMtfKVEaghutBCsCFnJ7HcT03VGgUy3kTDwMkzpS5Nns4mWm+tSYTtvSAwdbOdx6
	V1ZvHMCldS3pjeHePGC8l38tbKUKWaQSSC6iNMs7BrbeNSk2AnmA/eA7h9BIXrg9
	RInJ5ZwenDI/Y5sSuWNxdoOlsIY7YujyoWf9TA9NCAz/8iUWcgryVilsrlG5PrNl
	NSUMmy7QUqxh+HPn7MKHrbAY9fozsrdLUVhxTiKlvXx9HOTpxOsvEbQdjIQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa13eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:43:39 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b0d978e4faso3076677b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793943818; x=1794548618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9kJ0x7eMcYtkQ0WjZ8xrvT+ui3IL9p3saYi0L4ciSsU=;
        b=fESWYjUzc3lzHWOqk3i/rSYbHTv8HllAvB5c8UVoxZPrn9x6eEHY7Tdc3LiDp17Vku
         +JaXef+WB3lm5oM0cG4srRlXN1uy+AihgLzOx9krP2DmqkbTl/NNQA4krFFPD3NexkWj
         ugvv8ybcY9TkEyqKPFhKRd2JOQjcup30R6LvvZBmVCEK15eaa9ZcMrXjFb6BoN66zqkl
         1XpPnosOtSa22e51BrfUcGIwKgJ9LUpgqnuVhmljt9krEwyvC7SgbslVXa2Ag5o6HPyM
         c0EjbPJVKYotWm1eMoSxperGSNk/bykK+pN4TUrBF8kxGy8Hq7rdkS8n7nm8iqXiDZb2
         YauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943818; x=1794548618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9kJ0x7eMcYtkQ0WjZ8xrvT+ui3IL9p3saYi0L4ciSsU=;
        b=vsmPPBHzZChERiUhiyGiFWFap1rgR+zaKYdEHDgQtap5i2+bl0u58k5GXzRH7Uc+vR
         6TJf6gjDi+jxvMJ4+oEgAol5id2gZ7qEU4ZnCKOcPBDqJHGqEH+OXA2QVpPiX/ug4lV9
         9QndhfpTeUwPYSnj68TXdzKFRJGNJYetIwQTfB4BMLI4NHGn3iVbp9ak3LZqcGLCD7B2
         foLllb0wi8sUgNcG7XCqMR4BO22gztc5/8pnT4GnZyM3XsH4CubVwaVkO4yDxmSzg9ti
         xoUpJCBhVG4rF+XN/V16ASqx4ehPmlc77xl32/mr+cJli4MZflMLWdSPdk8tWDtlnu0Y
         HLtw==
X-Forwarded-Encrypted: i=1; AL+hErF8+FMNiwANveieihXLKoAN7WbWfNGfeRcPH5xb/PQBCbO4PG6U1EMieixh3F4v9liU/kq9sgmbLQ7EV/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JNrRxjVVA+YzWAOK5o3LgIH4hYpiNuIAOm9bKhVDVLtEpF0t5
	dUKJdAEp6/PK8tBkMG3a2pVUS/x1UwbZTEyrFsqkv8W+eFTNMF2ZqhQSX1dKmRWQbrkBYGeSLKG
	eaz6pi9rrKmvdLadCWdk2t83ZFHHNZceuaXJTqPOKcvl6iqQq4HeChQyrPYaSe7eESKQ=
X-Gm-Gg: AYBFou3NJ4uOH49DbTn8Lrdb/Rzy6tS1AwKlw9MTxe02stqjhjhSC2JfQDi+XvYqb7c
	pMcfbPUUOWfa0/eBynOc6dnT3oO93mnNdrM/34Pdo1CrMNCBHRwO9fXru5FccQ6RGsWke2pOKJ+
	DhNaA00zFcaOErIRcuS8xO27wCrLsGhCQM/rOLJabRh7RlgLRGFhWAOSNovR4pF6f4hkXS2gN9o
	y7g+txzO88W7mUYwrrdm3PZdGKVoDS3FC11O1FJcuK3ssL5Vk8Bvwr5TaBYYVmslA5EIiSYuWjJ
	CZxJR3GOXzPis7JxyE/Rr0f9N53KDpJI77Mbaon4l5eIzOCvTqOaML6kncA6HykTePuYL353sC+
	M/hZ3uJSzC/hCuUoDRASPmoNGAUg0Wm7lx/8JZWLe32+JDPNLbBcAzqFj/kZ8hk1Xe69ba7zNR+
	jgzrqlGSEFUK36epPGCRK1ASBXGYf3Yh8Eqg==
X-Received: by 2002:a05:690c:e7:b0:8ac:c329:67e6 with SMTP id 00721157ae682-8b341947fb6mr6285977b3.16.1793943818535;
        Thu, 05 Nov 2026 21:43:38 -0800 (PST)
X-Received: by 2002:a05:690c:e7:b0:8ac:c329:67e6 with SMTP id 00721157ae682-8b341947fb6mr6285827b3.16.1793943818131;
        Thu, 05 Nov 2026 21:43:38 -0800 (PST)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f884790sm12162267b3.41.2026.11.05.21.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:43:37 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: qcom: x1e80100: recreate the headset jack on card rebind
Date: Fri,  6 Nov 2026 00:43:33 -0500
Message-ID: <20261106054333.2748248-3-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106054333.2748248-1-tyler.baker@oss.qualcomm.com>
References: <20261106054333.2748248-1-tyler.baker@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed690b cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=m1qxARyD-z_RnXRpdr8A:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMiBTYWx0ZWRfX88BN5jzqoMAt
 PAPEcSkxYKxZJuDvpffYWFPlNtHULdSNo6nmrQSve4wYenVC83IKeiqZnS/QtxwmZmT5eaxbs/t
 QTbaLIJhXOuOi/qI5+hVISF0g6e0j08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMiBTYWx0ZWRfX68X32KiJDpVc
 NpgUfgMPUYynQA6S68tCaj+/tLncv/E9xmoo1bDW9yYNmqlobHEfGA3NETCVhxbIvsoHwtnTEdw
 tOTS/oNXRxq2padHyC9/e9fQ0jndAv+PXrq0t5jka7Lmwwu2VPihoP5jh0JLNB0xOMy2wc4SrcJ
 D6pzcpOuhK4WbhE0i/Q8XygKXO50jOFVMg+xjO8r47xIhh3N4P98Dh3BXs6uRha9mIcDVBHEgEU
 Yjanv6isladbg6r2YXIUn4XvNoomgkHe0Q/rPTpTf2uaJfIsAVZXsqfAlt9o6GXYT4F2CWTwcGg
 Ya2VtE4HtCX+3OsZVALHWRAcyxiM2Jk0RVBIGjAFoUnDsNT7sRxNdrUlAKbQ51fww5RVcqI5fZ9
 NiLiM3Y6IXmFJVzC7ykFnxQEHCYdrCyPkH/I70vbmZ93blpz/478VGLZ8bb2fQUUeyJg2bv2v3O
 AvwpFhFAwlvDHX0OWLA==
X-Proofpoint-GUID: p8rRsAORaW_0Y34vNaGlvMpFPu1y1Z_7
X-Proofpoint-ORIG-GUID: p8rRsAORaW_0Y34vNaGlvMpFPu1y1Z_7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060022

The headset jack is only created while jack_setup is false and nothing
clears it, so after a card rebind it is not created again and the
codecs keep a pointer to the freed jack.

Clear it on link exit, as sc8280xp does.

Fixes: 6b9dc2da6657 ("ASoC: qcom: Add x1e80100 sound machine driver")
Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index c81df41ace883..213d7f45198cb 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -68,6 +68,23 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
+static void x1e80100_snd_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case DISPLAY_PORT_RX_0:
+	case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
+		return;
+	default:
+		break;
+	}
+
+	qcom_snd_headset_jack_cleanup(rtd);
+	data->jack_setup = false;
+}
+
 static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_pcm_hw_params *params)
 {
@@ -172,6 +189,7 @@ static void x1e80100_add_be_ops(struct snd_soc_card *card)
 	for_each_card_prelinks(card, i, link) {
 		if (link->no_pcm == 1) {
 			link->init = x1e80100_snd_init;
+			link->exit = x1e80100_snd_exit;
 			link->be_hw_params_fixup = x1e80100_be_hw_params_fixup;
 			link->ops = &x1e80100_be_ops;
 		}
-- 
2.47.3

