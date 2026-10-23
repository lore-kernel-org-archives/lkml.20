Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775905;
	b=sbN/WW7Cbvg9eHnKoshAUA1TSW6ujLy4em4l1bWnRx/kdqnIfxlxiQEmFy6bzrVBP68d
	 Yr4yQN4Wsd6AfnxyxOq+nJl3u7RY/2+rq5IPvRT+QAWfudf+C1WHTRwg2m9g430mVkatO
	 R2nQHa+LHkjks0ukyUs2zEJS2oefOOSEUWU2wJQZo82bNlyvGM7KRhT+qrBLEwrdfpLpL
	 9qODSNYY9uCsu5DOP3cEcP/PM0GRvC05HPlAagWXHh02ZhA0XBeRlxX2DWcb0xPOuJ6YC
	 n1TmT+CqhWK/BNcNnd8wOA3c6N+LiSzJQdzp+/UrsCJ3I46/Gg0QQ/F3FaKwDuJIJGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2AxabcwP1wdLQylwZLJfYrMIN7TXVc6ukYLWP49lQy4=;
	b=NEc5nigzDErSvI2/8JNgI6agu/IITT286aBgpg/KeOoye9glO7Jm3l72T27Fu9N3gJnx
	 n3sw7tkQbsON0Sgriy1u3eN0ypAiGbYmSLxkJp5hyqmYsXo6uCUeoJYSPwEFM+RD86R+f
	 inS42rANwMcyHvP8aGoL/vTT8oQQObUa2P0xXm7hu4VvKl9GsIOgk6PkXik7FzEJY3Avh
	 qbG/Y2otuIVK85cjuKbYId249jM/UMg/d63JBBaKe8+8JdxWJV1a5ZSKDuYdIby3AUF2O
	 rXsfnz09CZWnKDE2+Rcfjm4FiXD/zfCslhHLTQse2Kxgim9dm40bGx/8ZTBS/4h8EyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eLEwDo0Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GgVMQG5d;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D62F606DC53
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D62F606DC53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eLEwDo0Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GgVMQG5d
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE67H53019035
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2AxabcwP1wd
	LQylwZLJfYrMIN7TXVc6ukYLWP49lQy4=; b=eLEwDo0Y9THbq+Cv2a8kMWTVYFZ
	ffKuUL0fxL/g4CesQIjb6FWgd8miI8Te0TYsTJAufQ75f5lxf8FB7wF2U4/XpGH5
	LIoOFKaJRz1E26vatvfUB37GUpftBICkEywphBNIjf611Z/noua54FbxeBo8hgUf
	jJpyPyqJtmv5LkfjxdMheuLowvdK0OL65eJPY81D6eJxynwxG+rQMAZw5fWHXZap
	1R0aTO/5JqGRs+lRtZtWMEpiFeCNymOjIKvTZB1N/zaipbqJRN9Q7KOol+uzUPWy
	7Tu4sRKR81Ax8k/Ii7itQavDXhZARedmb72llQE+zzGFK41OR9svCnyjqpw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykc5yj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caa0ce0cdso141319185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775903; x=1793380703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2AxabcwP1wdLQylwZLJfYrMIN7TXVc6ukYLWP49lQy4=;
        b=GgVMQG5dcObUSFXg5F8eY4fTgFCJrOqqhSSEPvhlIOopBrY8eZk2bWM+drxhpm5jSs
         wCQPWNW/DtTizX7YelbutBIzGEpbLDSpYfieUgFwkk3j4EdctdStLdB2qnILzqXnS9rS
         r9HlXun0YUL893imMWUyiAoD27NRiUhAYF+yU1gmTe5GVTnFyCESU6YKKB6JVEPt3SFv
         noTjc9GlNg0EVd/6bVZupVkLf0g6N1gFNSlcmhOgd50iGqs7wqFkIHWrRMJBwyI5Hbk9
         A5ay1crxCi4vXBHAhiFrFdF+7RC2JBEYWQ77WTj655RO0mmo1XG76/rurosVrgdKkFXt
         ncZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775903; x=1793380703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2AxabcwP1wdLQylwZLJfYrMIN7TXVc6ukYLWP49lQy4=;
        b=ClC5Llv7qblylMZBG+fLfDf7tqiqM2zAYUGk0xAYNIc68E5Ly2Fpuh5E/XLtxWVNF4
         3M6yf0KAEbpmHoabAUjVPFiJoNa2ISzAIPq44dtWUVhbCHJpUg+Oxhw6uCZU/C5GujO0
         L/YXD33GvZd+hDlC5U9S57AY2rgT7CmPQPV2m8aS8X0zMSTdF3fvQqPim6mpfbqFmHJf
         YCAme6dcHJUnGFCc8WIxWJ1k7OHe8TF0pWJUdy00Hxix7ZbKU14WXMiNYcxWsBdMkz1u
         5/tu7fwEaMdp9+HiMGF754AzimvVPM/iZAHe5iRkzAzwSr4SW7L0wdQFhQLmlmWeVMaN
         Rt6g==
X-Forwarded-Encrypted: i=1; AKwUvBxzQEtcoa35TuvHa0gR5BRBxnhd6K9Bv49UR5LqzDMEFUBGm6hvv96C0c1hmnNCTD5YolrnESXs5++zuSc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLC0YyqEgdEXKRQKdV7rlQWc4Vo2S2U8ishcuidddjuuSbE5iFe
	bb89uw2e103YUDmIhukWUHgn2aBuY0ti+/nqBjLf24X/BTszUAuU71MnR4ytNVmHXL8DIeh7lRf
	noJUYWu6ZnEuiozbMdN1rq6as5cFpmWv0EGCwZ0pHtx7VU9gJI2e8Y9WfMZZIcSjWoc0=
X-Gm-Gg: AYBFou0Mj1PALqNvz4Ty/49e9oj0SuXCMgacIdwQHB9om/zBpiTDY73WHk52qRd2YO4
	0+loa+H6zcPabZ0tUthmA8oRLypNXXddlQR7TKpPBrO3OIA3oSpK+DVozPf2JQF3PmO4wGyCiij
	n+tJnJV37iJeviAFCH9Pe4JUlk5SkvCoqI8YpAnzZsehFBCpCwUtGe977w6986oomEVVOAnnyPb
	IVZ9QL9tzzBtt4KvX87Qr4vglEPKLUJ0qQK2d0kJC/5NMKdjplkn4e/FYOXvLLyduT61FglF/jj
	NKG2UyJnHp+xvNg0PpD9sxzKou43+sA05Rhhl44qu+l2PWCefmmX2w2osH+Z0NegSeXkd6g5wxd
	5YyTh7xVNUxM4
X-Received: by 2002:a05:620a:4042:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93f6f94f9bemr520782685a.34.1792775903393;
        Fri, 23 Oct 2026 10:18:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4042:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93f6f94f9bemr520777785a.34.1792775902790;
        Fri, 23 Oct 2026 10:18:22 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:22 -0700 (PDT)
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
Subject: [RFC PATCH 20/23] ASoC: qcom: x1e80100: carry WSA VI feedback on the WSA Playback BE link
Date: Fri, 23 Oct 2026 18:14:30 +0100
Message-ID: <20261023171433.820092-21-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXyUyN3cYOe6m/
 bUhZrNA3R3eRO71hpC0su55m5UDBPk9hUfkwQx5ohulqkD2LuTYNKVs0Wnq3+J7Vcp7yRfZvAa3
 TmeuFsEjkEwkG6j2VDfWLZ8EPXGe/ArMEAT9qCxeBoBUOMJ2RKDMGXGLj63RhzOf2xpXRxxFbbz
 uOtCJxGX3PBSXbLkftJ1jGJLufeA3+Q4gbX3+W8jjGJzRlLoV+EEXi4Z+2B6h1dQPEQrvHw0+EG
 VlNWrEJ2kkU0lH89nz7ZmQZUVvXOyHCuAAkgairHMYOHs2AQ0aWKI9BieYYVE2i4J8OJz036OV3
 eQRqu0Itl+sYysHRZjNovWGSFoxk+etQV5nVR902iXl45yCCZOOWgTlMo3DgTy8sFO25VJTMmZC
 vgvQT7JNUOurSQNeKO+LZiam8I75vtfK5tuEYjmVxb+YV+kbj6RhvEOoBkyUDsyrBK9+P0ldqh9
 UdlV+XudwNFx8DX6HMg==
X-Proofpoint-ORIG-GUID: MAyfNZ13S84-DEWD3727Ycy1NjvrXP7s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXyUcbHGIs5ncE
 A9xIoFdytS9Bq/S3/SvCR1QfvpcWod0bEqhnLCg76JWqMx8wODHKhBqYr3qL+KTmiPCTqwwLcV8
 PgtQAEBI63ALQU5V2C2FWKlCyK19AsY=
X-Proofpoint-GUID: MAyfNZ13S84-DEWD3727Ycy1NjvrXP7s
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb96e0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=UI3T6_Nygtay_5UDmqkA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

Speaker protection needs the WSA V/I sense capture running whenever the
speakers play.

Set multi_direction_codecs on the WSA Playback link so it can carry the
VI codec DAIs, with a params fixup for their 8 kHz, 32-bit format. The
core's capture stream events for such links power the VI widgets.
Nothing changes until the DT adds the VI DAIs to the link.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index c81df41ace88..23a28c60bfb7 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -6,6 +6,7 @@
 #include <linux/platform_device.h>
 #include <linux/soundwire/sdw.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include <sound/jack.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
@@ -68,6 +69,25 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
+/* VI codec DAIs on the WSA playback link run at 8 kHz, S32_LE */
+static int x1e80100_wsa_vi_params_fixup(struct snd_soc_pcm_runtime *rtd,
+					struct snd_pcm_hw_params *params,
+					int stream)
+{
+	struct snd_interval *rate =
+		hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_mask *fmt =
+		hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+
+	if (stream != SNDRV_PCM_STREAM_CAPTURE)
+		return 0;
+
+	rate->min = rate->max = 8000;
+	snd_mask_none(fmt);
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
+	return 0;
+}
+
 static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_pcm_hw_params *params)
 {
@@ -175,6 +195,13 @@ static void x1e80100_add_be_ops(struct snd_soc_card *card)
 			link->be_hw_params_fixup = x1e80100_be_hw_params_fixup;
 			link->ops = &x1e80100_be_ops;
 		}
+
+		/* The WSA playback link also carries the VI codec DAIs */
+		if (link->id == WSA_CODEC_DMA_RX_0) {
+			link->multi_direction_codecs = 1;
+			link->multi_direction_params_fixup =
+				x1e80100_wsa_vi_params_fixup;
+		}
 	}
 }
 
-- 
2.47.3

