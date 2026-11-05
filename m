Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894571;
	b=f7fYNLTpYqjK1F4EQNQYMIQe+JajiB7uFB0YKETNGRfEbON3OfuFKsilyAXu13M7xLM1
	 NrIOQCGCgjtoahygu4p/1xKCYqa6PQ7Hp0TQGRCfZLqWwgFM7K4IOOTBa1dMGwBfXWttB
	 Uxblf4dkF7fK/Crs29i0/ZnfBsZGGK9JrlNeezWibPyLEfSvqZZbGejTNe8KGTppt+/hL
	 4tmz+SClpFmGhDwpo9pCT75HFkH1BNBWkaK3rinZPZIVqBASbjRjIhuyHDUCE0iUaBBpA
	 RBaqcVx1OyiC0jw7xfG7sUW7K4LtSf2l8FTeGftiDaBcXE00krpQ9j6aZ68hG9VNlew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894571;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=34g+gM68eFDTDCVBvHfun3apqlRNOTVBacuR7uGRASI=;
	b=IOuvZWPxaK4rVm+LJB5/iPOGax3gD5uGK3a+i15C1XFpVx+eXbcJz/rYgam1pMz+iCDQ
	 /A0CtURGECSK5Be6FR4OG+ZPSiFB3bbCnGNm2nDs7i8pWMtvVh+BjRctvh6+50ydQ5ldv
	 1eQGYmrZ16sic+B2xFX9XcV9YSLL1ht+93AvYqBbaARspknj8ZKp1gyLRhgkqmIkSkT3n
	 kSgmfT8fZCjI5NPXDqtOdESM6oMhD8ilOvBg5TKFaL5OHLSvnFMoczf3cZLIoSw0/Kiit
	 HN6xSqGZGEFLAxEzuWFrqc0Bydlr1wW3miDuupVA96ge5OdfvgbpDdG4j2JKMl6fl3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZyJBQkxp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c2rEgnbs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC3D6083608
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCC3D6083608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZyJBQkxp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c2rEgnbs
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQGBw1049828
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 16:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	34g+gM68eFDTDCVBvHfun3apqlRNOTVBacuR7uGRASI=; b=ZyJBQkxpsyP7gHjC
	PFpey2bsuaOeurJClX9QcG/h7iR1XaIKYkeyA9e760ktwGPzGLlDENrMRd/3h6Ua
	Oupo19XzwJ8OvAQugvaGDrTcWRukQJfkmywsws2Dtj0BxU+y7QCZmDmizTcD2pOW
	CGSe308g7ZhpfAG5R6RSpEJnPSzqFxfMPxk703NA7cb727y4E/BzEc68ZPzD4anS
	hC5SrTBpjN8LURnxEPfjZ92bq/0RQfugZRJ/2mqXq6Op0WfozuVTjQ+w/scKfVLP
	KEyyAZLgXrOyR6vWKSWwmWM7d15CANx/tFZQYAK+ZWFAUCHqUWKxnMl3m0mwrxV9
	Rs7pWQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaahwfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:02:49 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eac1e41c2aso625895e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793894569; x=1794499369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=34g+gM68eFDTDCVBvHfun3apqlRNOTVBacuR7uGRASI=;
        b=c2rEgnbsltCVcdoOauiTp69I5Xf1+JIZq1nNcaWVLyI4agU7u06s7Z8AcL12JuQKLC
         3VOBQtBPCOFc9cr3lRGow30CYVLvynTlpEhA+il4eGWdV11DbXteDxz3w9v5rLtPWnsV
         j7FAm0UCftwAViA4O8KonbWycZpK8KQGOiUVWUPa/K7nt1LC7c08uCiY8Fvv/u4NGzu/
         lh1aCKTp7/h4FpabxypigznrUvM5hxH9HP2XmAuo+E+GYJKMekHpSuwEFBLBr2oHeEC8
         AmUZXjmlXBwL1JYJNuZ25Q4HgnE6Puo0nvePrhEnCmMmusZhfuXx8T54m3DVZOQGMFNz
         n9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894569; x=1794499369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=34g+gM68eFDTDCVBvHfun3apqlRNOTVBacuR7uGRASI=;
        b=PqZxFUQfn+OonuY3Al6Q9TEsNOXC9ZFYqtOxSChpwyrYAXNEh/5Fk1lGr82k2llykg
         yH8Kz+jE1raHbBN0RQWTZpndDqagWiDL1U5X7ovAg/N/KEiMIyjlsFyB98Zr46o2MW6h
         mi3RxVe3ZBJoLrpJwJY3DRK8RGshql9HSBthLtovpuvtKtMl2pDaMLGtaS2fj3OJFoGA
         tLiAN9CNf0SoTmjb7JgSUBkAmj5gc9b79yws07nnZc6lwW/VtMIhYjqP+At8ZPTezbDf
         jeVpf5CKdCqb4VDzQ7hmqAj6fzFkZlldEky+sIR1wupsEfkJhxfRUMlEndeiNolr0Sfn
         H8NQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+lAEY45yX+tCDAFTu2CShKeJAd5V9IC6rEfGID+ANyg8pWQkkpixkNCj7+ef1lKHCVFNO7YbTdej9vQ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bwOSFSNF3XFSrtoSpr03fCnV7gtb9womSJqDoGA9qOtd4fqTa
	3nUNyVuO5mE08uLNmUlrQNik1IF9D4kI/s23s48Fa7GpfVZWzIVoTt+t1lrM6QDaMFYUDyxVO/+
	2Zp4ZXJ0XUkSHISIEzTBvSlXKuYB31RfjEGrIwqpfjs3GDdSyJoSmpsaIWuWK+npf0Ng=
X-Gm-Gg: AYBFou3pmX96T6GpZU/0GMkzr/1l6tKaax2ylOI/jctFvAR4LUV8zY+K34oJAnZPEpo
	6G+ASOERKQRh1NU47FF+syxR+wbprgPaB7D9UMFa6LJm/TnGF1HT1/7tDItYBum6BYLK+Zk36et
	Ciu6rjB/0LAz6eNyElTZnwLDsWRBQqdRXQbZ3C3/vJY0gJWWDjVkhQoe2L+1l4FGto023ARkADv
	pNUypv5sImolkxt3INEFcbBkkijDdiMTF8SZ07urbikDTR+SuNuB5efPMJT/KGI24z8dtOWIX0H
	rSx9mltxjYBTeyFxmbgk/5S1zHN6MQMFQ9uO3I4Zq3pGfUtOYSFaEsZ7RXcMuvlSUNIaCsRW2Yt
	vWowNHoFoogtX+ow0OBv62HlUSKuXQpLT+Gc6u0zDVibnewmgZoZLYN1JTw==
X-Received: by 2002:a05:6122:3115:b0:5d4:1193:73d3 with SMTP id 71dfb90a1353d-5ec6894bf5emr9727480e0c.14.1793894568726;
        Thu, 05 Nov 2026 08:02:48 -0800 (PST)
X-Received: by 2002:a05:6122:3115:b0:5d4:1193:73d3 with SMTP id 71dfb90a1353d-5ec6894bf5emr9727404e0c.14.1793894568060;
        Thu, 05 Nov 2026 08:02:48 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda20521sm11065672f8f.53.2026.11.05.08.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:02:47 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 18:02:02 +0200
Subject: [PATCH v3 2/3] ASoC: qcom: common: Add SNDRV channel map to Q6
 slot helper
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
Message-Id: <20261105-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v3-2-29e06613115f@oss.qualcomm.com>
References: <20261105-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v3-0-29e06613115f@oss.qualcomm.com>
In-Reply-To: <20261105-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v3-0-29e06613115f@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2144;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=PB2xbFqRgMUG4atgisB8EwU4caRe51qu9rLYrESsFBw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq7KigaTg5w6SITfHlnkVrD4JBkEpgmgeUVldrv
 nmoTg+PxhqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauyooAAKCRAbX0TJAJUV
 VrBFD/40dYtqvjA7O4JctJu2A3E49/7nEjDc/syzyOkQrSTTDNFBY+mADWy/JsdHhaPO7VbRE7c
 oj4zJ6ashWlSVttfnWlMGUwwxTjOhoMhnXG3LgRLmdowYIhWLgMuaalv0IJMdW9jWHlSiYhSnuw
 YpLUQaJkVFYP1xMqgm4lLAUrRN6mLenoTNyAc4zLi7iHxYKhreVuwMa75awHszrSrsy9ri97peh
 JG7UexUHwtO+uBlyxoX7ZuES8XrDsM6I1Oy0Y//Hpg6VkO30a2I3kIdvsbWvjfJl2358+9Q33rk
 V/UJRsXi04LR+HjQ4q5wUOM7AMcDvs5b7vBDB5CxIdsWVc+f5RL5bXaJINGjES4uC9XKY6gTfIF
 RVC+zqS6e88F2fhqVo4MWloZ1K5tLK5A/FInoSkw2Im8m8FzLhOdhk0e5Xt+zMMr7dSFA6xGQ0U
 P56SZJMQx3YY4dyo650goEuhf+SrOLUIqmmVfCxfXat+Nm7Lsgx5aN6bLZyvxkV5qhFnv0CDU2+
 IRN8e7HdW6dNBHHIlFcKCXW5HqCMrJcw9KbarARv+KFhrmt+la6tCi2GhcLCSkitxSKS14ealHb
 gZTj/YTeyN72wOb0uvcrIdw/Kd2lT19P5yRKwbScKA/Uyo7fu8SusqRUpd2iWxN4uJHWcvGA5N2
 pdFcy6s5KE/ziKQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX65/MNutPFWV8
 U/PcCYgrcCMIiSs0DmjRanuRB2tKn9YubEHtJrERJQGoZOn03lNN2RWlpzU6FNfbt6z1ZC6fltH
 z4FlBs9Fs2I3AV4GHA1DBunrE+zhVNUWj6eejdndWHm4JH5/DlMIisgBvNm64T7Qg1agXdWi4Vv
 qSfXgi81Qdj9Fos3fzhYomaggN2BZGykUf86+Ufmj4ENNwGJBfq8f4O+eaKSEDnjAIhAnCvNiKD
 4G/U0SjagWk7QK3hT73ENnl0MsWs0b5o6B4UFriZ76jHBDHv3xTylnlDtUZKthsTzRzdpM74Fmp
 DILRBICK4RpubjVyonCEf2U/VOBl+m9TKGUtatYE/MrX8AM4jkmrMJiAwyMHllebVPi6q1wJ6gP
 jXlmoShE/kmq/+Qr5c0U+FRZBqrzXdpjrpaZJOzgzDL7wXwOXVvTOk3lpamWCiUQTiAiCNF/tnO
 FNp3vUJd6Nqc91nMwuw==
X-Proofpoint-GUID: 1uCk_39oxEGK7HOuas8LJbOmMrgdGRl-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX4XXrk1uSlg4Y
 emfZpxi9fiqFnIAc3SXDt2U0vpb4FbGMIH5G4eusyKuolfJRA+8y3sABMsHhLU4ugd2AxUdT0vR
 yY5FutM+sYU0K0h76XNNvNTfZdpUzhY=
X-Proofpoint-ORIG-GUID: 1uCk_39oxEGK7HOuas8LJbOmMrgdGRl-
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aeca8a9 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vP20N_l1vn5n2xwiar8A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050063

Add a small helper that converts ALSA channel map positions to the Q6 PCM
channel identifiers used by Qualcomm machine drivers.

The mapping is useful beyond a single machine driver when exposing
writable channel-map controls.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 sound/soc/qcom/common.c | 30 ++++++++++++++++++++++++++++++
 sound/soc/qcom/common.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 83b745f617a8..29b2df21b765 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -6,7 +6,9 @@
 #include <linux/module.h>
 #include <sound/jack.h>
 #include <linux/input-event-codes.h>
+#include <sound/pcm.h>
 #include "common.h"
+#include "qdsp6/q6dsp-common.h"
 
 #define NAME_SIZE	32
 
@@ -327,6 +329,34 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_GPL(qcom_snd_parse_of);
 
+int qcom_snd_chmap_to_q6(unsigned int pos)
+{
+	switch (pos) {
+	case SNDRV_CHMAP_FL:
+		return PCM_CHANNEL_FL;
+	case SNDRV_CHMAP_FR:
+		return PCM_CHANNEL_FR;
+	case SNDRV_CHMAP_MONO:
+	case SNDRV_CHMAP_FC:
+		return PCM_CHANNEL_FC;
+	case SNDRV_CHMAP_LFE:
+		return PCM_CHANNEL_LFE;
+	case SNDRV_CHMAP_RL:
+		return PCM_CHANNEL_LB;
+	case SNDRV_CHMAP_RR:
+		return PCM_CHANNEL_RB;
+	case SNDRV_CHMAP_SL:
+		return PCM_CHANNEL_LS;
+	case SNDRV_CHMAP_SR:
+		return PCM_CHANNEL_RS;
+	case SNDRV_CHMAP_RC:
+		return PCM_CHANNEL_CS;
+	default:
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL_GPL(qcom_snd_chmap_to_q6);
+
 static struct snd_soc_jack_pin qcom_headset_jack_pins[] = {
 	/* Headset */
 	{
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index 37b185a4968f..2b1d30230d77 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -31,6 +31,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
 int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			   struct snd_soc_jack *dp_jack, int id);
+int qcom_snd_chmap_to_q6(unsigned int pos);
 
 
 #endif

-- 
2.54.0

