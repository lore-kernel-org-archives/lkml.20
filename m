Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775887;
	b=Xt0RUY0dYZAMsh760aLv4pqE68A8T2R+Izn9439sLeBOYD3S9Up6E1BudWe9vJNwPvFo
	 2CHUH9PhAXaa5vln/OtnJLA7j/qmp0EdUqp11hdTKCL4jAJcTa3Ipi/kwMoSseEHlihUC
	 YmHK8rIYQ8oorkZsETPddKt84YqkB9j68+vYp7HLT1CgexAQUDIBh743gLItpOzJaR7Zr
	 fNAP8q4dxKrsxSgup9dzbQOXL1cc/37giWy8cxbOWf/BYk2uAFdS1Sio8SYssonAiWXbX
	 y/TOyZOdKVqYtCoYBK85fdSUoEFev0afLV0viOV5LEB8G9YqPCxC3Tj1hHHG9RE44zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775887;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q/+cvFopqQv28D3/PiFB85LG7/G2XyD0ZehhDNJMlX8=;
	b=19U9H9m8CgtDRYjDoXrpFicVLrCsMo7C4D3x82JAK/IUvD7Sy81l3Mu5eqCz0GeKa7Ua
	 uve7D2ADYk8t/y4+jn+SFqphJDov1qPOOFKl+MLxpxAxtrD02ZB832X1a37fQa8FP6gvF
	 rbKdCZqvmLkBuCX+0m+IGnXr7/dEdeAyW1Ph/aLKCy0WPIj5WfNA1AFsJZlQeyGN5ghte
	 0Kct+otu9ILHmH7dXDYXAK+zjJsJ6JhAFmcjS4dd5gz0EUtm7f5vp84svlVbeE6Yiufwl
	 /YUETfwIUesMuN6WqpzuGnEqsnnZ6vY3Il9PVTQloUlUiI4abA+ljfcCsRv4Ts4Kj2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Yvstzu/p";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SjqJq5lf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C2360A5BE8
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C2360A5BE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yvstzu/p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SjqJq5lf
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6Fq22462658
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=q/+cvFopqQv
	28D3/PiFB85LG7/G2XyD0ZehhDNJMlX8=; b=Yvstzu/pqS6uvyJ8PgFi+yd3AqI
	oHEjJwvjti+d+C/OTu9fcHwsIOxBK0U2viS0KmJL0xaXFhovRwCU2w0mTi/J5dN1
	O6sNIDsQAjB2ZX/FxqErUVFgBS2Kr/n7Y4mdzS50Gtk+4iC+hZ+DWXIjX0kGRMKk
	QONX7Mw7yI1vOu7b/QyMRgk5EAnIGI6JPhaYSZJIBvBjLasmLa+XZFKz8j3q81b2
	TgkSvgCwqL3wMT8oS5W2J36CDeYM34nTmPRKJebcdY+RZaMweLLQjhhNfuBVsBFl
	17HxkNFF/+e1qn+rnHu29CUdP1aCX9nsK5uG1h8BMT/dCFD4F/MifQsiKQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtvsjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f6f4fe531so208192285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775883; x=1793380683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/+cvFopqQv28D3/PiFB85LG7/G2XyD0ZehhDNJMlX8=;
        b=SjqJq5lfTS/Srt505f3ZfyPSqDR7WSW77k2dFjdOup4Vv2ghDfXcSK6eEUjelIEXVL
         urEVd86oJGxqj8TG0fBiAPr4C4JturZ/+wxoul8YEVR5f5VWswFTfLRIELYGVfoGapHs
         FYOesTEprzyl+SVcO1DAnOfpIhrCx4xWjCujfAZPRI+2U+PzHpXKFEV2uQPUIO1+bTkX
         k2izfHjBM8W4lpGxhDfQrhN/Z+FSHz4GjBy/fh3EM7k5r4E++jCR1Qtq3/kg2M1ZzU4O
         GuXObV/L/N4tVsGvtCX42LZRFWMA+CBLmva4cmahJCh86WUhDGb0JoHH1is8XwiPUyXk
         oyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775883; x=1793380683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/+cvFopqQv28D3/PiFB85LG7/G2XyD0ZehhDNJMlX8=;
        b=UVeqQg+xvmEVvoNagPGakQewH94fNvBARKTmx3TpF9MxBPQw64ofJhB8fvByBCut2R
         5wOijCWaLTmaUtNmK2pdoYJgN9Aid+BFO343TceyRzNXuBcPC/ez5DrqJm84ESn6TLl9
         ukLZvGAtz7rT0P+dsoB5kZMMWP83zbs1+lCDpBGgyN82yyUtep/9EoRGw7m0dhc32y87
         f7I43M8LWtGtend2F7nRpok4BYuE7S27YnNlptxbA+7jMrnaDp+YkjErDGIaEjo6hjXA
         XCrlaAi7F0b4jUpdimf4+tDlG0U/ifddayfq18N8NjRN2ask5S5No093/Etvt2QFRuXy
         y6lQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXRJWM2/EQWabCU0KNyux4xLSoc7zN6ScxdcWSCbvOPUDSxYmmJdaizIJnzrZhpzcmzV00jj7nIDPoC10=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7v3dybBW+AdNvZOfNKeMTU2nGJFSDT5q0PPd9xFb71JamyApE
	01kxC61ceBd0DKlCarMgCdk0f+GMxsUbVk4SarqEPorVI584C4KFc+7x3bsjCQmuOjVNyWgFInQ
	Y+eOIk4GKnhKL8XlxfgMMB+Y9SpVBph9e6aWmkI8YjuNWQH3SgUaKMkjLM2+wBJgcTvk=
X-Gm-Gg: AYBFou1gdAS+b5go9UlhtJdJRxQx9sLBk0wZBvTDTdtqU7R+bIp3HlnsrgJYQH9DXRw
	SYn9AYdSWp04u5NzvQK9k9QZorDQP39RJg89jEvrGDc8NdPHx/WrHW7631pbgsoIO2ZlMddedmW
	ZLWzqIniS+sihnO/pEUBxdStv8pTpM2sUtBDss9ixClNEYlrFx8Eqp/VUQg9L7IgtRR5Z2Myja0
	4/iHAxkkSB8VfJLTVGDjg1pOoyky07ANabed98bn1N7wUNHbgdubta+e2lTZTnqZr9RTHd8IiSl
	spvvby9gy+ft0lM5kTJxHKj1u85WbbzyH16RGe61PcRMC5eWaUAICv7cIt1g/DMiYja0VE/Fwjg
	mhLVyHtdd4L9i
X-Received: by 2002:a05:620a:4725:b0:93c:c1e8:6504 with SMTP id af79cd13be357-93f6f7dc78emr554391385a.23.1792775883219;
        Fri, 23 Oct 2026 10:18:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:93c:c1e8:6504 with SMTP id af79cd13be357-93f6f7dc78emr554386285a.23.1792775882595;
        Fri, 23 Oct 2026 10:18:02 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 09/23] ASoC: qcom: q6apm-dai: add S32_LE format support
Date: Fri, 23 Oct 2026 18:14:19 +0100
Message-ID: <20261023171433.820092-10-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb96ce cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=0GeEMZVGUYcv1euD6hYA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: MyLUdzuinWvxD8edDw8QBYML3xSEg1IC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXzJUWvUXoSR6T
 dqKYrZUmjHlcKPZn5Mkd+ZOrMWQvgTchZo3nSZPy9yoAxVWGRa/KkN+A3WTCSKNCsimgnOj1LPS
 dIcTmKpiN1g5U81ynDUF+ygrTp4dpAELetzWRWT1Lfre8ffE2BJgXrHE6GlwWTPW++U2MbWseFw
 EbM6/bcQ6arp0rZJzDSpr0k6h2UWhjmM+Kpne5NjJ+94iDqEv75sBNCWDNH6aUmFv/h1fLcizaS
 jqJQpzI366wqevVE4xBYTrBcTNtHdfm3E7S6lUD9C0VNFiWPr/ky/11P0lDsovYncDsoi+Xyj8u
 ixFmezIzJ2fG/CnQadFhWVLv65hs1CTmSTW+9TLImszizPWUPk45T8TUTdTnszt7BXRObhVTUoT
 8swKSChlDoL4yn7RmQO4oz6J8t4O3AI5+dsPAyEAxONyx1Q5uLdjHRMh62voGShee/HmdhAj2U3
 QSPrxK+YAjSH/2knnTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX2Hd2vK/CSsjH
 ZZcxGTy85Fh968l2bjKK66AIl46Q6dqtOTffKXoG9mlrGDrkn3tQtJzLfJcEeVVub9QIYZT1A2R
 W9kDP6lEXcfxkB5UvKvTm+NuOey+6p8=
X-Proofpoint-ORIG-GUID: MyLUdzuinWvxD8edDw8QBYML3xSEg1IC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The speaker protection VI capture carries one 32-bit V/I word per
speaker. Add S32_LE to the q6apm-dai formats so it is not converted.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 58beaf906b9f..9002acf0e0cd 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -202,7 +202,8 @@ static const struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
 				 SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_SYNC_APPLPTR |
 				 SNDRV_PCM_INFO_BATCH),
-	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
+	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+				 SNDRV_PCM_FMTBIT_S32_LE),
 	.rates =                SNDRV_PCM_RATE_8000_48000,
 	.rate_min =             8000,
 	.rate_max =             48000,
@@ -222,7 +223,8 @@ static const struct snd_pcm_hardware q6apm_dai_hardware_playback = {
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
 				 SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_SYNC_APPLPTR |
 				 SNDRV_PCM_INFO_BATCH),
-	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
+	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+				 SNDRV_PCM_FMTBIT_S32_LE),
 	.rates =                SNDRV_PCM_RATE_8000_192000,
 	.rate_min =             8000,
 	.rate_max =             192000,
@@ -641,6 +643,9 @@ static int q6apm_dai_hw_params(struct snd_soc_component *component,
 	case SNDRV_PCM_FORMAT_S24_LE:
 		prtd->bits_per_sample = 24;
 		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		prtd->bits_per_sample = 32;
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.47.3

