Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775898;
	b=PfskTYkVYOGD8wCk5r2wikb8/ftYkEcR9y4wDcI6K2HEyqxmZvWSuFRCftqT3o3x0pju
	 T3hTJCJs7IRymkmPnDQFD0Ul/hVhNrENhj6TbRWCygcRngFBDBjajmifYyKYJYti/SDsU
	 IkN9jDeHqUSnYg83eJeE5ua/9y4/pZJqHHQU42sdCtdrX/K3k7Wb54Cgk9LOS2GW45kyc
	 zPwr2F/KGzYmuNFdMZ6fJ+XCSUdrjwOyIPnkozYyN013d1pztJ81NUREEH2Gx/ighL6Lu
	 YMyN74rTIJEvYMffbCH5QeYiZ/gUdrBeYRFKD+hG+jvP/67y8jjfQht9pmCnR3ecrDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775898;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=U+BHFh2JR5H1czrBSRnQE+UUSBqRmAYSBtaatxRecFY=;
	b=ZdXJlnfd9/2n+0z41HTGaHBFtVeytJkEWaVbrAEl/5J/P/2Nu02qWPOIYPClfxPnWymi
	 1hw6IzhpQwXdjExhzMi5g85R3MLCABDhtFpuI8JJa75qe8IxgbkeK5noZ7VhH2s4DK6ae
	 fDYq9fkskcPQcSWMHrb2LT+2sN7QbOK3eQ3veIq7EmA6zu+igMNVzZhpbdvLvsvQ5BeEO
	 LsO0mKm0H8eW8kyKWhpJyUwbgAqGO0vo0Xew0V6UzpEFy7nfy3lLoiyfO9AoXfKQK9nEZ
	 U+tRUJGS+NGzTzqn/DX1Klo5cXgSHFxHfQwjLZeM8+AyjK0ePB4Ou4299g1Sh8Ph7lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="o/NHi7bw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g39UPkV4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8092D606A97C
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8092D606A97C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o/NHi7bw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g39UPkV4
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5twR4072840
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=U+BHFh2JR5H
	1czrBSRnQE+UUSBqRmAYSBtaatxRecFY=; b=o/NHi7bwzHaUe0zx+U5i1aJzUbk
	n1FftPGLzrrQVKvHI6ZVfl9YPuLD2ka3yB5oegvIeLmF0RNOkDyoWYuXfSCS+Bn1
	FyH7+3rSnw38pzaskxoZqgIFGkkitbOhKLsY3kt+oqDfEWLYaayJ+KQ8TzdUj80g
	VeU8GaORhFGG6XttX2cSEagqinBCIgUFAWp+tXQerlen3kSKcTGTI2Jg/FzlveVe
	OS8/PlNhJfTzeJQsKoK8yX8J85lKm4okhodWfLS6vhzyKFSt1F/dSKPvkMNgAZaf
	iChj2cGz+hQfv8f19rNOPEdGwVgRpMdBnzSzjBXdVUuzcX5C7SwEF+8fExw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw15g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so215393585a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775897; x=1793380697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+BHFh2JR5H1czrBSRnQE+UUSBqRmAYSBtaatxRecFY=;
        b=g39UPkV4pLvc4/l28+QEGdyveARjouVsOV9CiIGV0+6XLV8Ehppgz/tQHfdkmK20er
         +oPO8PyEo1I1s1Yix8+hN4oRKS3HIGyBYeBMEasnEnq63CEGDKH3CT30YUKgcKLNb6b7
         AvRoxD43K0851R84MXJovjKrLrl63wTVvmPp5Ai7Kl91o19nve6mzj9gDWtZ2vuvxPJf
         OR+pQPSSQlzgmnxxEzNDxpPbHe/4/9AP+fBHDMA2Bhsbp1mKc2OXC1UqEJZWP2UDk6VW
         O1G6/XbWX8TYSDAUOSSod7JuId5BGS8T7ZjsMquiJs/SZ6njO4RBGNdr/22+UYdMUzBN
         0HEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775897; x=1793380697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U+BHFh2JR5H1czrBSRnQE+UUSBqRmAYSBtaatxRecFY=;
        b=d9EMYigKXKJC4aQiDzkoweA31WZ+HgLAu+Pe/2xyjaEybL73sUpcX8PjOvUk9Rcdp4
         UhwuOg5qwVNMNc1NZ/avrlKstBE20lUuJurjXrn2hJ05UCbsGKk/U1c0o+B1ZfDZUSiD
         kRVOMpz+wzzVVo9eai+p5GtSlZPB5zxxZmGTesD8KzeUvQ8mnILl61qC1mKgT8rI13y0
         FYHjmrf3Xd58h2t4VEUGcb8QYxqk+ycWIAVbkicMjOaBPDQVe9D1BKyGj8TtIwEfyDvK
         qPadw/Cv+hHhabvJCDqF9tGPQ3MM4oOLLiAiz+k70/dKkciCyRKF76C1PylARswsMs8H
         al6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzZm88MjqBHyvpWPm1hP0VpEh7J3mMAJrK6wopB3fFdK76NoHCvJMJlcxf2EwihuUubD6kMmgBLcxxRtDo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMoioUt4WMuCbCpvMj/MRnp/CFOX5WLcddwpf9jmlvweqYHfM8
	rL9uBPn2qEUh+Yzf+xpqICX6Ymrp8ANCSom70chlKHz34twdku8YIKaj1R565hJj2bokBNjkGF1
	jSmbs4syyHyZpfE3E/eybn2/zN5nGT8Hrgh9TBv0vqcPSBf6syk+qfiwU8ltPJgz2IVQ=
X-Gm-Gg: AYBFou2nVYITb2O2SGZ+UljHLEAK4E0ZGO0bijyJaBCK2I2te5KU6XjZlasmdmexxtu
	CMa2e4vkpdREr3yx103b3ugnA5eAYzFXX+Xiej1oumDRV3EFFWZgJUPO8bX9ERNJyhmzp4mFwaf
	bwOBFqWq8rjOJxfURpIV6QxSGUtzJFseemBfDd8Cek25ykRCovPWUsrHJvjY27csPrl9nNOVh4s
	lUlKxYuwxdMZLe/nUtSAi8MI5RuQ3HK51/Yes6QL5ywEexVCuGcqBCFhDxjCh38wNKesV47JwaF
	ZlHOEqFF8B+W6Z7uYKtROOuVbIQdlf4SOcaMCKsw3LHlRt5hmO4p3jsGqMecp+wFUJyhXUpghf3
	ZdFxJq+wNRvuy
X-Received: by 2002:a05:620a:4515:b0:93e:4b3c:19a1 with SMTP id af79cd13be357-93f6f7e9cd4mr552308185a.44.1792775896761;
        Fri, 23 Oct 2026 10:18:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4515:b0:93e:4b3c:19a1 with SMTP id af79cd13be357-93f6f7e9cd4mr552275785a.44.1792775893579;
        Fri, 23 Oct 2026 10:18:13 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:12 -0700 (PDT)
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
Subject: [RFC PATCH 15/23] ASoC: qcom: audioreach: add speaker protection mixer controls
Date: Fri, 23 Oct 2026 18:14:25 +0100
Message-ID: <20261023171433.820092-16-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: qmmqWnCjeSxQnIaZhXCu5j4QTFNRUuvq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXx6LS7G8An60w
 7bgzD7KplRJla1zbqZ5s0vYGMFT7hww7nFFum2mErYeYG6SH2t6kpAgyBUaWN4+xx6W7a6WR4lw
 GwN5XB2a2tDVcOKqv+Bj+VLN+1bGMQA=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb96d9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=z7hZsS5TAAAA:8 a=9gDSyMU-ReTuyL3ZNT8A:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=Qe1wxHrAD-1Q-kOd8w1m:22
X-Proofpoint-GUID: qmmqWnCjeSxQnIaZhXCu5j4QTFNRUuvq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX5Z13RR1oArTb
 OWaiotvmtt/hi9pyGO5bZIiTA2FnFafQ0wU8AHTtty/uFeBTu+nw0sCgITUt7R0lbRxmzmKZEVB
 2LOinaaomyat/CRKmHupzMf1HKDPr1jomTN00mOi1Ft4JgbNK/oSDiZQZKLwMTlNx5LybKiLFZs
 DeoNwQawWalsAQ3qQMfn3J8uEhcpy4QlqtnRoDdNQ2l8u6XmRMHRbwfjdkl7XMyWyfVdoPGE/Tt
 GCcpRqlL43tZ68e2RwoK1EXhcLjhkqckoeD5m2J0jF2ZhqsPHiDyzcKCskp/uuo4G05sMJvBHfB
 Ik9zdVeJDvWIbtjS3FlJdIb2MSMTPTVAwBR3knaLB95M+JHizlGuPcT3inLNuXIOZsqmunM5Q6M
 e517yH3OTM0FKw7fFSpSYNw2aAA4/95FBvWmkcFmhccLXIv/Atupc8OIW5g3UFo4tBRNvALcP3R
 XsnNoGNecv5dnEIenFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Add topology mixer controls for the operation mode and the per-speaker
R0/T0 pairs, so userspace can run a calibration and restore its result.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/uapi/sound/snd_ar_tokens.h |  2 +
 sound/soc/qcom/qdsp6/topology.c    | 80 ++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index 7ab8e11ca5c2..db62dc7f9c8a 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -57,6 +57,8 @@ enum ar_event_types {
  */
 #define SND_SOC_AR_TPLG_FE_BE_GRAPH_CTL_MIX	256
 #define SND_SOC_AR_TPLG_VOL_CTL			257
+#define SND_SOC_AR_TPLG_SP_OP_MODE_CTL		258
+#define SND_SOC_AR_TPLG_SP_R0T0_CTL		259
 
 /*
  * %AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:		Sub Graph Instance Id
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 5de7e821e5f4..6316d1ab0675 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1463,6 +1463,73 @@ static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
+static int audioreach_get_sp_op_mode(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	ucontrol->value.enumerated.item[0] = audioreach_get_sp_operation_mode();
+
+	return 0;
+}
+
+static int audioreach_put_sp_op_mode(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int mode = ucontrol->value.enumerated.item[0];
+
+	if (mode >= e->items)
+		return -EINVAL;
+
+	if (mode == audioreach_get_sp_operation_mode())
+		return 0;
+
+	audioreach_set_sp_operation_mode(mode);
+
+	return 1;
+}
+
+/* One R0/T0 pair per speaker, written as a whole set */
+#define AR_SP_R0T0_CTL_COUNT	(MAX_SP_VI_SPEAKERS * 2)
+
+static int audioreach_info_sp_r0t0(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = AR_SP_R0T0_CTL_COUNT;
+	uinfo->value.integer.min = S32_MIN;
+	uinfo->value.integer.max = S32_MAX;
+
+	return 0;
+}
+
+static int audioreach_get_sp_r0t0(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	audioreach_get_sp_vi_r0t0(ucontrol->value.integer.value,
+				  AR_SP_R0T0_CTL_COUNT);
+
+	return 0;
+}
+
+static int audioreach_put_sp_r0t0(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *scomp = snd_kcontrol_chip(kcontrol);
+	long cur[AR_SP_R0T0_CTL_COUNT];
+	int ret;
+
+	audioreach_get_sp_vi_r0t0(cur, AR_SP_R0T0_CTL_COUNT);
+	if (!memcmp(cur, ucontrol->value.integer.value, sizeof(cur)))
+		return 0;
+
+	ret = audioreach_set_sp_vi_r0t0(scomp->dev, ucontrol->value.integer.value,
+					AR_SP_R0T0_CTL_COUNT);
+	if (ret < 0)
+		return ret;
+
+	return 1;
+}
+
 static int audioreach_control_load_mix(struct snd_soc_component *scomp,
 				       struct snd_ar_control *scontrol,
 				       struct snd_kcontrol_new *kc,
@@ -1503,6 +1570,7 @@ static int audioreach_control_load(struct snd_soc_component *scomp, int index,
 {
 	struct snd_ar_control *scontrol;
 	struct soc_mixer_control *sm;
+	struct soc_enum *se;
 	struct snd_soc_dobj *dobj;
 	int ret = 0;
 
@@ -1522,6 +1590,14 @@ static int audioreach_control_load(struct snd_soc_component *scomp, int index,
 		sm = (struct soc_mixer_control *)kc->private_value;
 		dobj = &sm->dobj;
 		break;
+	case SND_SOC_AR_TPLG_SP_R0T0_CTL:
+		sm = (struct soc_mixer_control *)kc->private_value;
+		dobj = &sm->dobj;
+		break;
+	case SND_SOC_AR_TPLG_SP_OP_MODE_CTL:
+		se = (struct soc_enum *)kc->private_value;
+		dobj = &se->dobj;
+		break;
 	default:
 		dev_warn(scomp->dev, "control type not supported %d:%d:%d\n",
 			 hdr->ops.get, hdr->ops.put, hdr->ops.info);
@@ -1548,6 +1624,10 @@ static const struct snd_soc_tplg_kcontrol_ops audioreach_io_ops[] = {
 		audioreach_put_audio_mixer, snd_soc_info_volsw},
 	{SND_SOC_AR_TPLG_VOL_CTL, audioreach_get_vol_ctrl_audio_mixer,
 		audioreach_put_vol_ctrl_audio_mixer, snd_soc_info_volsw},
+	{SND_SOC_AR_TPLG_SP_OP_MODE_CTL, audioreach_get_sp_op_mode,
+		audioreach_put_sp_op_mode, snd_soc_info_enum_double},
+	{SND_SOC_AR_TPLG_SP_R0T0_CTL, audioreach_get_sp_r0t0,
+		audioreach_put_sp_r0t0, audioreach_info_sp_r0t0},
 };
 
 static const struct snd_soc_tplg_ops audioreach_tplg_ops = {
-- 
2.47.3

