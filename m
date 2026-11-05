Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894570;
	b=mI84YUQ0l4XJfRFP8HYMZ0ewBcEQa6aqeDwoGnbhW8nehumPhbQFilMdDad7YUkfDcT7
	 B36TCEaBWcmkSwN4M33W1o8oUxJeShaV01hFcTvoTxEfUGBGTGqtC0wlgn4Vce7GpGSFe
	 x+sFZP2B7BcCXA+gIZ5bj6mxUkh/gxu9gJ+TZ4tKRbb6HSHswWiXDMG41cqxSDDgzZh3j
	 wAeFvDsE1qUk8TLPEwsQTkmOSS3/wvDjvzJq3/o1Jo3nAzd/1qp99H0DhPpenoABCg+dJ
	 K+aODks5mxFvA/muTG9ZH4F+IA0Z+xhUYOXb3W5acYXNWOipAVOMSMLhm2LtxNf8oIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=59A5myhJfTbtqqUcRR0wxFA83rvxy6ek9LfK2/taTUI=;
	b=qImASB4oYg9v82ROxMGqBQbv/epca6vF/wfbTxnmcV9QMyaTjYLgCmTqAyyvIQ0ajT4P
	 PIhSPnro4R2DsS5+uRXLlGCXIr5PAYDFI8TaorQY/nR2QhMf3GOdeaSvu4cQkPgw3N7nn
	 bIzBC0MbrFM7ZwKn++CM7GUv/LS9fLGfV37yqxJk5dKJIeH6MMD6tjeSdUY3jTfUO+EOe
	 pgViEwHuwdT8v+4ERAX++IJv+DdoxuPpRLX9ok4thdqc8narEwF4nGjETqAZqobeTXCcU
	 4RUqRgk8RsR+bddlGIfVfnFUUQZJJVX3foT/rK9GIhvcvPcJDn0cwK9EQESCVKKd7cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Rn6A/FvL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZocNlSZq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A94460707BB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A94460707BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rn6A/FvL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZocNlSZq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQ99e1049706
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 16:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	59A5myhJfTbtqqUcRR0wxFA83rvxy6ek9LfK2/taTUI=; b=Rn6A/FvLYA976pVX
	Hm5+ZYCMYx+73yQg9crAG+SWsd+ISPbY2tB39YhOKFyd6feT4QOINWoeecSyoflN
	RCErtNKolS4U1UJzhETvAJ08IWq1bNB/j11AGpxS6Ix7lhIBhu7U6QdN+vMUH0TA
	G58tFVhg7+1E0KmV+LawiskbGUPuVGOsPz1eWO5EsZbavjNcPEOQke5naoeGkhxQ
	nZRLX1EKEkLDEKw2zdJN2rb23chHbvfkagWZUCbrctYAGvdiMf0QXXTAhPVJw+zm
	xn+L6Uk0Fm1/3YN0bs/ICZbYKd5SKOuQjxkQ48NguUFza6hIDB4zf5Gze5cICG4+
	nnKaLQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaahwf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:02:48 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ec3e192929so613777e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793894567; x=1794499367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=59A5myhJfTbtqqUcRR0wxFA83rvxy6ek9LfK2/taTUI=;
        b=ZocNlSZqBkr3NYz1ghsmFvXfm/T7fwgrw/1pIcmN56nOSW6ke1XWXLaXPS+grERExO
         4AycjWSHPZwEnOg4FowV2Ces/N1UK7O9tfLKi9OZU4cUBhMSeGzfcQ9qWXR6sSpluQ7w
         TFfr7tT+dcz/2HybTLZDVNS/GTiO6TFMbroI5TLSRD1DrInJP0WMJtPOCtWNPbGwQM3U
         PkA7WpEVEOHASILmWz+vn17Sap9fF+tsbiUBZmxtwCkncjXhCNlDdGii3Jv+0x4atzDY
         HPr63MDmPSVq3kuG7UkTiF+9ykTisttLrbyeQVFEf8y2yeGWKykSH6uu/ol/Qkh8V0fa
         +4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894567; x=1794499367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59A5myhJfTbtqqUcRR0wxFA83rvxy6ek9LfK2/taTUI=;
        b=DSilk1JJU532OfSikmNQbgUXyTtM1skrnt3mayeYhRpDnHmSGI0Op5IEqaEJJ2zsyl
         HcCVLK6nrlNbCrQFkih2D6NIIOJT86ex9xevYdyE0awBOXmRNjxBESjNiJHWPzZSezUZ
         sliPR4hSzMHOIligiVBk4uxdXDZKavmjNlfLgYBEDNwfyF8uNXOeE1T72Gna44c8LhFC
         gYmwqjOQqvx0YS8ZLtGTzJjVaJwlcHHqGHLfjQ3Nwp7L4aah/Uo35Z5/PBN3kaQJ/qHB
         l3870aV4oF/gyx/AdWFeYPYZguU5DL90Qv4mbNNNlJVkGq6o7kHRMMvx3RA/V7pNVeF8
         T9+A==
X-Forwarded-Encrypted: i=1; AKwUvBwvRApLyHBaEsK9ZepRobaa+VlN+BjKRtGK/cy5DqPXwgtRed7vwA9Ncah1LxSusPVI9Sow/UKKzl+hU4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+Di6TFJEeQHrwZJkr1GnCjs2zzbLQC1EBZG+FoQJKJBb1W3fI
	IGnf2ugNod3mn0AsPeloFFvREBSrZmZq4h+RVPQ5nil/xSV33oB7dEMUhpICmLlNl2CwbpX8pvh
	htD4rnshS4cnF2cDmE8cTduybw1043Dw3CiVqvR6KFEYdbbtFvCkvfyaI8c9IlHFkG3k=
X-Gm-Gg: AYBFou1W0Q/Qzz9KNJTALN8B6Ehp/Pnso8n79IZpej7YLmzyLjWsUR6ZrbySG3POptv
	qVyAw8D2xXQ/jSr26Ex0BM9vzSOvD/lHc/t0ClbaNo7MHUNdH8NQEmg4+mh5rtY1pcOrAt/aFZp
	6qKRAZhyf+L7vRlaAKYf2vESTXCHCjuaRVk9bAl+2LoiduQaB8mQscrBJy/+XnYR9YwjkUr9Oyq
	tPqx5FtFX7X8mqLln5akh1nTtW2rnFWYmklq0E+MnqrBFc4C2KrRlF0m0DW7in8CazmijNJtm16
	iljl6v9pDbzghSwXJsmNeJwofZsUMy+mPlk0P71HKDQGVQQesXBMQekOA7P6Cp23ZEmi2tY8Dka
	CiPTYoFTEk5lPzbNQxR4xJebVKA1OhCOQtpS9OllEqL+qs7n6kFEBb70uEg==
X-Received: by 2002:a05:6122:4b86:b0:5ea:f220:fd6e with SMTP id 71dfb90a1353d-5ec6881fc37mr11241103e0c.11.1793894567238;
        Thu, 05 Nov 2026 08:02:47 -0800 (PST)
X-Received: by 2002:a05:6122:4b86:b0:5ea:f220:fd6e with SMTP id 71dfb90a1353d-5ec6881fc37mr11241010e0c.11.1793894566492;
        Thu, 05 Nov 2026 08:02:46 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda20521sm11065672f8f.53.2026.11.05.08.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:02:45 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 18:02:01 +0200
Subject: [PATCH v3 1/3] ALSA: pcm: Add snd_pcm_add_named_chmap_ctls() for
 custom control names
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
Message-Id: <20261105-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v3-1-29e06613115f@oss.qualcomm.com>
References: <20261105-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v3-0-29e06613115f@oss.qualcomm.com>
In-Reply-To: <20261105-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v3-0-29e06613115f@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4766;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=UmDyy0KAjftUcohtDwuaxWeD/togauQXoNkoRvIpz+E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq7KifIxy2fN8biif25RowK10MCi/o5gkFYVFGu
 BX4EJXwBRKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauyonwAKCRAbX0TJAJUV
 VnboD/9szSXt7IGTCuQHaULNYKcqJPeGMrDle6z7DPhHp+Yb6V2CTOLitdg0s583gdUuEXQ5Qkv
 wdqSW1P32pXwGCu/XWLsIIs4gutFrbIHwlicVGmLbdhxe99wrZJjtKKURQEhaNOeyKLV2WNkdCT
 wHmabLXESSF2BJhXhEmHHtx42AQiSZCHtf3O2p8QOxF1zyt1KmbDcQaFoZkOvUD2eNLBgTRXlFp
 FbsrZ97tuQSyKRXjVh1ARXCzmQAND1vgz68whbAjg33gypOzOTQopt6VbLkemc1OFWfD7df7ODc
 3dSdfIhcX16mM4HUIZJtaPYmf9o0nTHTaQxPsiRHTJSMgsw9QkW6wNPIlybMaiCrqcyU1seTh32
 o3JzhyM8chBH+0lqXdLIeVDGOcOzK0KYgv9+NePgBG1tEoZ2Nrg3H777CnfdZtMbz6mIzEkPiHI
 vrQmBshMOyux85PlWVOPzjKXgrUAZOnpNrk++v+Lt+ubVJE9hJfvIVSWMWFsF1i/YBW3dEOdBJw
 shCe3SDbs/tAQCjZ1qkelsJwYHKe32fozzffaH4gg+UEHflG8OiBxlnSgzjXzYFxXZgR77y6jRE
 cDS1XdPh+jiyChwkufqI50kQXq2sLNcZDFFnpi6tSnVzoYiVbr8UczP3ynE7unn0PgSJE7zAi2+
 LDDSeJ8XpT8Psdw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX9/ntDL5SkrZo
 6cWhdQFSAXlmSH7GM1rluPuAzgj8+0F6U+7+3h2wzHtMRpgVRL0z7M8PHS/jL9+vqngkpfvfgCH
 rFl+b7MhlPKpSq0T/sg5lpvXr1P620y2DZzEiPx/tTno2ca7c5p92vPIpxPFLNerFgcAM0IhM0k
 z6S5XJ3EHylSCRcTaV6xJfCCAtQW4w89QMGptbmpT0o6B8lkYXvtCcTRtSVkM9vKZAC+zBuI4yk
 +j36AxaPT3vc3jdN35cbHvljFveJgP78mOs4Gl93extjzN4flUg5cMeQLVbSyv2wyV71bXU9c3z
 goM/kza/3SXetT9ymtpbex6YVUTqTfCt+mznTPChy00R3XtOv7KReXzNe33/6tfFFtMV8h31IKK
 +5LJ5ihLAjqxU2bwzAAjotGJo0UBUi+c3qptLYRRiVyUhx5doKnj4kyB9kzq0oeoxkj2slVCpNE
 utdpgR6Ovd/2O6VlrPA==
X-Proofpoint-GUID: DF6BDewvSEf4B5SdcOo-U_ryYcPGNTs-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX2wwpiWpwwV1c
 JpuQHgA/T5JkZspJ60PGiehqFQhs1H2smXfm/tUTDg24j8jN1hF/KiQtxE7xZmpakXdPREZMCe/
 rdkevdZXx1rciYppbEQwZha+0IVTPbA=
X-Proofpoint-ORIG-GUID: DF6BDewvSEf4B5SdcOo-U_ryYcPGNTs-
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aeca8a8 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=X5dxnz2IbiImVrLPgzYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050063

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Add snd_pcm_add_named_chmap_ctls() to allow drivers to register channel
map controls with names other than the default "Playback Channel Map"
and "Capture Channel Map".

This is useful for cards exposing several channel map controls, such as
Qualcomm machine drivers with both HDMI/DP and WSA speaker backends,
where a distinct name makes it clear to userspace which backend the
control belongs to.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 include/sound/pcm.h  |  6 ++++++
 sound/core/pcm_lib.c | 48 ++++++++++++++++++++++++++++++++++++++----------
 2 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 1cf511f8d880..58f5533a0315 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1501,6 +1501,12 @@ extern const struct snd_pcm_chmap_elem snd_pcm_alt_chmaps[];
 #define SND_PCM_CHMAP_MASK_246	(SND_PCM_CHMAP_MASK_24 | (1U << 6))
 #define SND_PCM_CHMAP_MASK_2468	(SND_PCM_CHMAP_MASK_246 | (1U << 8))
 
+int snd_pcm_add_named_chmap_ctls(struct snd_pcm *pcm, int stream,
+				 const char *name,
+				 const struct snd_pcm_chmap_elem *chmap,
+				 int max_channels,
+				 unsigned long private_value,
+				 struct snd_pcm_chmap **info_ret);
 int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
 			   const struct snd_pcm_chmap_elem *chmap,
 			   int max_channels,
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index bb16738bb591..d7d63f5109f4 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2586,9 +2586,11 @@ static void pcm_chmap_ctl_private_free(struct snd_kcontrol *kcontrol)
 }
 
 /**
- * snd_pcm_add_chmap_ctls - create channel-mapping control elements
+ * snd_pcm_add_named_chmap_ctls - create channel-mapping control elements
+ *                                 with a custom name
  * @pcm: the assigned PCM instance
  * @stream: stream direction
+ * @name: the control element name
  * @chmap: channel map elements (for query)
  * @max_channels: the max number of channels for the stream
  * @private_value: the value passed to each kcontrol's private_value field
@@ -2597,11 +2599,12 @@ static void pcm_chmap_ctl_private_free(struct snd_kcontrol *kcontrol)
  * Create channel-mapping control elements assigned to the given PCM stream(s).
  * Return: Zero if successful, or a negative error value.
  */
-int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
-			   const struct snd_pcm_chmap_elem *chmap,
-			   int max_channels,
-			   unsigned long private_value,
-			   struct snd_pcm_chmap **info_ret)
+int snd_pcm_add_named_chmap_ctls(struct snd_pcm *pcm, int stream,
+				 const char *name,
+				 const struct snd_pcm_chmap_elem *chmap,
+				 int max_channels,
+				 unsigned long private_value,
+				 struct snd_pcm_chmap **info_ret)
 {
 	struct snd_pcm_chmap *info;
 	struct snd_kcontrol_new knew = {
@@ -2625,10 +2628,7 @@ int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
 	info->stream = stream;
 	info->chmap = chmap;
 	info->max_channels = max_channels;
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-		knew.name = "Playback Channel Map";
-	else
-		knew.name = "Capture Channel Map";
+	knew.name = name;
 	knew.device = pcm->device;
 	knew.count = pcm->streams[stream].substream_count;
 	knew.private_value = private_value;
@@ -2646,4 +2646,32 @@ int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
 		*info_ret = info;
 	return 0;
 }
+EXPORT_SYMBOL_GPL(snd_pcm_add_named_chmap_ctls);
+
+/**
+ * snd_pcm_add_chmap_ctls - create channel-mapping control elements
+ * @pcm: the assigned PCM instance
+ * @stream: stream direction
+ * @chmap: channel map elements (for query)
+ * @max_channels: the max number of channels for the stream
+ * @private_value: the value passed to each kcontrol's private_value field
+ * @info_ret: store struct snd_pcm_chmap instance if non-NULL
+ *
+ * Create channel-mapping control elements assigned to the given PCM stream(s),
+ * using the default "Playback Channel Map" / "Capture Channel Map" names.
+ * Return: Zero if successful, or a negative error value.
+ */
+int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
+			   const struct snd_pcm_chmap_elem *chmap,
+			   int max_channels,
+			   unsigned long private_value,
+			   struct snd_pcm_chmap **info_ret)
+{
+	const char *name = stream == SNDRV_PCM_STREAM_PLAYBACK ?
+			   "Playback Channel Map" : "Capture Channel Map";
+
+	return snd_pcm_add_named_chmap_ctls(pcm, stream, name, chmap,
+					    max_channels, private_value,
+					    info_ret);
+}
 EXPORT_SYMBOL_GPL(snd_pcm_add_chmap_ctls);

-- 
2.54.0

