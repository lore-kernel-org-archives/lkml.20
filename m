Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793435030;
	b=bq26ZeFJ2+rLHTHI+yXtOgz8gNupz6z/SZStnsc3J4utkNwoxbAveGYLsD3MNQISzUxz
	 50nI5mQJjAWGN7U9W5p3Se1oOn53tc9ssMMZGmtzPW8dvJUD6WJT5Dqk7HP2JKuw9MU29
	 KKa9c731MAlVFuL4eZpvU4TXOt+F2VX+/TTNpV5vt/2qDqIpG6k0pcShhCM+W0lecO9vm
	 MFsU7XGAoAjUwcNmP0JLg63ylC2lCdcHd++TYtR3EhB/bHrMP2TDCUgV6gskNiIpergaZ
	 lx1dpBAy9m01DFnV7hc0x93IM6F6IK2doxYHb/+vADFDu0fYwf+0FdiLXWtYiwWK8Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793435030;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QFOpLTe4a0GH6IrBUWG1rlaEM4FZttQUc4FaLGB4FuY=;
	b=sTP3arTgVf2X5xcFqqWULfllz5TGr7Dwi2V9EAXYsE+hn2h/x0d4mcfDnNktkRLdGUcs
	 LSzmygRey/bMz940XONrzqVP/PPJTfAfAO7VcmbtJtsdnNjbf2eZfTUmNZxvs9G0FytC7
	 SnHKZUSqRytFMJ86anPoTWJ8/T/vvRTsV6+vYQ9+Sbxu3gl9Mbi3z/Dtct6gFKgPoxFm0
	 6SP6zM+KniCQk867OcRVMZ7C5mrIaWieYPPZfmr3oK31GVwkTwIVmmENAzQL2xD8esHuk
	 e5nWPhNIlPw77oimexJ93ghJJTZEAjZ5I5Q15cdkjsZlPVqq5rv0SLpmquiuL1mPDDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jWVWVG+j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EAGPj+uA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F141606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F141606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jWVWVG+j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EAGPj+uA
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4a5Z32142556
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QFOpLTe4a0GH6IrBUWG1rlaEM4FZttQUc4F
	aLGB4FuY=; b=jWVWVG+jRk7JaZ/tPBpElR7fJTsO3IJ0QcE9wXVq159UaI7Dyq9
	OIpPRJt178AqfnV10bSQ5h914cCA7cPI5Gf6QBl8M0B83dSICQjp075NBsAUAbwu
	RmR9xjU4HmQlUo4DKoBiHsSXTAQqDlEFUCIigfQkxR8xxEqF0AhSuhbWDXCPBr3G
	jk6W43+ZzBCV3Eob8kuRSuQBTAMKSK8nMqmiqtogv4j7sJYEIPRCvUVGN5xcofZA
	89QQGriQY8l8IbHwEm5Pem5qGzD8sPSt3qRCI9P7g6nGXaWNjlZpDV/K1wMbjsY3
	q7wZuP0m+VSHtyCXkb3AWqvHYr6P0wfgKGA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fryph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:23:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so6146929eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793435028; x=1794039828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QFOpLTe4a0GH6IrBUWG1rlaEM4FZttQUc4FaLGB4FuY=;
        b=EAGPj+uAtBkGlTE9VjSru5XcqELeettSeimHb9HBNsVJx6EIVBQ6RCoYAMQ3xmVRHG
         2QhpsiDi1EAQpuz533H6s/EmoOnSvXBwdIWgJBgtkvRdq5nHQAfRb6GuoX3QX0I2TEP3
         BXsW9mvF68KAlcbLLaBhqTwMeNWkJqR816PwWoXinMMeUQE0zhBVR7b1Y2dZcqnVVeMU
         Ao01DlGcHd3+s8c/vf/t6MVrL/vmMSiFkbfr+TBlPFD6yVXjLKlOnX48xfNb4UYqGg5e
         aFREgKzX0i4KQtFaq07DdRAoYpSFXKKPxAw6MwkBRkezWqsAY6EMkQvN8WFd61MGl0R8
         iPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793435028; x=1794039828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QFOpLTe4a0GH6IrBUWG1rlaEM4FZttQUc4FaLGB4FuY=;
        b=gLELbOuVWD2XeUDkgAtOUrUg292lrLhpISRXzg0oxvXCRLMKjBL4xd1w5hYuznIppv
         A55QOb6c3jR/iHSlRbDNmEQeO7AvES6HNR55iJ6rFazR6qriEq6Buvkp2XI7PwnrF3rS
         ozjr5IQSD67CcXBGdeVso7liynpDbGtlYujGEdqHIAKvdB1xOnfYGUvx40gIX6iVkR5v
         T4RRhzrDhZEPr83WQXiTOrLTgoy1oFc4mx7ESVs/iOj/JwQ+C9hOMyCKZZya8wHN0gVO
         dc9nrqfB35wjc7AOlyQqNZWcBr19CeMigEFoI4NRlfX+E8XmNalro0g6rsT4RfzDG+jZ
         7iTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzk1NTdY/nj28Zv8LXMAs4SmWfmA6ssd7BPim9vb2omobOj6fMUXWJj8g0xztYZmbIfltkOsYOZxF5+VIc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJz7qQr7zBzDtcypdgdDfPFPcSGZwHNIKn1ddSO44eZN1K1x3fd
	vecxjvG/MOLPg5MdMYQgnCCn9AyW5KtIpo0AugfBZ+b4SRnnGo2KHswjqNQgz1DRZU3iFtZL452
	/dWx0UZ2CCwI5abEaG0A1pTLaAlikvmig/sVZaHhhHpVL6AhDNZR2+3vluusZ93oHAcM=
X-Gm-Gg: AYBFou2v4dQjmvUnJg0sPj274WCg5KW+DkKgBSTekeYsVGzQvlM8l+1Sb593ZbITAFk
	gfZJ2zzMpw7/Mv/xRtJXALfF1AOWQPXZ/iLX5vDz8NnMaIjex3MuctZsn4ygVQUB/bjEMGPsYMk
	CiHZoQHfT64caSWlQ7qGnQthFCPYA+qrMwBAa/nQO3bwrrrhKPv1cCvxYuCvY1WZ/xuCWztQxft
	u9/rWeyqKJPQ3BHnT57YKrDdgVftUdASGpFzcV7z+hNMsDFpZnvuQxm9xhRIIhiE9EjDg/J2Rne
	oOW//qtZjgTn0tWZEk5kSbgox/U5HCCDjSXBnwJu6rYGMQI16VbUSniobIejJwiKDlKLRvfsKpY
	MIZ2b5hEJbc3O4TKEa99n6SyGoS3bTbk+ewS0EsGICiwuv1iHHduJp4s0PoPPa1CLG2QF8MAb7L
	8F+Emdy1YMTQ+N6IFLseDPrryNgnVFpEyX
X-Received: by 2002:a05:693c:87d0:20b0:36a:18a:e00f with SMTP id 5a478bee46e88-36a42406487mr7309431eec.34.1793435027965;
        Sat, 31 Oct 2026 01:23:47 -0700 (PDT)
X-Received: by 2002:a05:693c:87d0:20b0:36a:18a:e00f with SMTP id 5a478bee46e88-36a42406487mr7309415eec.34.1793435027529;
        Sat, 31 Oct 2026 01:23:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6eabbsm15329884eec.24.2026.10.31.01.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:23:47 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
Date: Sat, 31 Oct 2026 16:23:18 +0800
Message-ID: <20261031082318.1146398-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAzMyBTYWx0ZWRfX2JpOn6tj54rS
 to5p/oOJMlqhIf2zLmb7O3E0xncS0LDZslF5hesnxqIZ+7DBnTHLiHcsrZNArjS+zKoVGSY90La
 oEWi1kYuAc3YVDhmR/H4OFLmXvZHaLM=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae5a594 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IADkTxCLwKcHhP5_0iUA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: DbHw_AZIkEsuXbsPmsHB3mQwsfPR_yw7
X-Proofpoint-ORIG-GUID: DbHw_AZIkEsuXbsPmsHB3mQwsfPR_yw7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAzMyBTYWx0ZWRfX8ZZ/C2a4I855
 EzWcjBcACD0WqYjszBmGRl+59QJ4k+9HN1Bs+y5YpEL1ETX0d8my0fwrS/p8ia7AZZFzMgDJous
 Bi52g4YEkcuiQs0OT7vUj8e9nzjnuTrYBT2aUuKjsdTj4xGLAXfb3SyFTd+VEoyt0Y9AfU04BeY
 9HNaHK+0mCBXvMXhpWJqNFejWxEI37JimbCpCzTF8WujO2xJhGQpcAwkivznwueY5cG4WSVYCDi
 JKWy8xgLI1QWAPGxN1TkTWa6z91311j84A4YzAI1+kCsx4LRH/wUnT6XMmdSfXJKUtGBLWvMFIl
 udoZ2aESml6FZS88di4t/OE/rGDBsJMPriYoltW6ZrR7+TXF39OuPhHlUJo39z2h3t8la19V04i
 6qTvFWJmWd2hrPJ8ifZn9UXrxwzn3BpVZ71NwfrgTZ5XkMGrO2ft3BV0BUemTsbLETktk4VQNdK
 iOFxaPopvp4KFuELBHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310033

Derive the backend channel count of TDM DAIs from the cpu DAI TDM
slot mask in the DT, using the same DAI ID ranges and tx/rx mask
selection as q6tdm_set_tdm_slot(), so the channel count always matches
the number of slots programmed into the DSP. Each board then gets the
channel count its dai-link describes, e.g. 4/4 on Nord RRD, 6/4 on
RIDE. Keep the default of two when the link has no TDM slot
description, and fail the fixup on an invalid one.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v3:
- Propagate qcom_snd_get_dai_tdm_slots() errors other than -ENOENT
  instead of silently falling back to two channels (Prasad)
- Link to v2: https://lore.kernel.org/all/20261029022340.591372-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Cover all TDM DAIs (PRIMARY..QUINARY and AIF_TDM ranges), matching
  q6tdm_set_tdm_slot(), instead of only AIF_TDM_RX_8/TX_8 (Rafi)
- Link to v1: https://lore.kernel.org/all/20261021025310.2072026-1-shengchao.guo@oss.qualcomm.com/

 sound/soc/qcom/sc8280xp.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 9aae6aadd43d..8cc75a7ad866 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -303,6 +303,26 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	channels->min = 2;
 	channels->max = 2;
 	switch (cpu_dai->id) {
+	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+	case AIF_TDM_RX_0 ... AIF_TDM_TX_12: {
+		struct qcom_snd_tdm_slot_cfg cpu_cfg, codec_cfg;
+		unsigned int mask;
+		int ret;
+
+		ret = qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
+		if (ret == -ENOENT)
+			break;
+		if (ret)
+			return ret;
+
+		/* Same slot mask selection as q6tdm_set_tdm_slot() */
+		mask = (cpu_dai->id & 0x1) ? cpu_cfg.tx_mask : cpu_cfg.rx_mask;
+		if (mask) {
+			channels->min = hweight32(mask);
+			channels->max = channels->min;
+		}
+		break;
+	}
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
-- 
2.43.0

