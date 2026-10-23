Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775887;
	b=Uc9RqWZNByFYXL1GHIVnr05NI15yLGomi3VIqEhhuhhivKfn1jL6oHT7J3WX1Ma0RKFQ
	 fRe7p0UYU5Xpb3gHYPFq68voPyH5LLSnIR+sY38ddjZh7MSOvXUfVXC2mj6jl63vBTlTY
	 2QR/Mn/wZHdtf1WhEZBMoRgFfpp7HFX72yopLPppcyOdBNAjW43E+iCfewE2RcTdc68wi
	 VeGvRSwTAzazA76M9FZh3Cs6uLYVjsLAGAda8Gy3P4IAv2tJRPk8vSDPt39V/IIfxyXUF
	 JazCXv+88Qb2sJ070CFQXdFIPnGEoZWmP769hmgyemK1POeRVQSNRAVsuKUkY4VjdPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775887;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5T+eklRSuPXOFCyqOwoiO+bLFastCsJoWvpm+QdwBPI=;
	b=PTD+m34q9/fFr9/eAJPJSn30nDzxYqlKHLuvYU/VZnAgkLaa43WL2Qr2lMbLq0F/r4Xt
	 hsVGTJLVuRRxtL5H8LvjoVki9z/1XTx+5xp0LZj9BQQ+yf+pgh/hsMqvO/sTtuPWHjsC7
	 6XgrlCnVbrlp2fcjDUq45FF3dpBT8nDR9WBC2Ja5beFajG1/6Sra8KRRhuBHch37TCF1o
	 WkynzjImCOmtJJ55qu6TGzlzkFuQmBonUhQdwNcxy51NBjNR6pbHasMMJtJN4qvM1Z+Hh
	 bDzsaj/t/O3silKbZYDhmnbPElziZ8KMmK5vFOY2st7JJ3CWCtJ4tYtEYsflFNBNjzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHBfgWfY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JlF5tTdT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D9960A2616
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0D9960A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHBfgWfY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JlF5tTdT
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6r301492208
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5T+eklRSuPX
	OFCyqOwoiO+bLFastCsJoWvpm+QdwBPI=; b=CHBfgWfYo193RQkrldZ8J0KogoN
	ppn3J4x+BoXgvo6Ii7dPPtTab9kJlel/eIEE3Ed4Yw5Gn5UH1K7296cuSUfGjMoF
	5FqcMZPKI1ZjQr/CrVJdnjfn9c3w+agHBix8+6C9hfSe2TNEdFc//hPs4ZI3g7Lz
	GruvMK/PUYuQcKTpkhyte4Et8bY3H2va6T8bEJQRPQcsYyosF4jiapUgwYBbNnkn
	dbk+79V0OCQAsjEPsWsXUc1yPrr2A3DBTqBccndaaII8kugvthM+40TQB1uZCC3M
	y0M2d+sgDmbSe4552H1MiZF2YG9l81R7luns2EHgwUjN8gZFtGBWBzFxe2w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmav6t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2373e9b4so119840085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775885; x=1793380685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5T+eklRSuPXOFCyqOwoiO+bLFastCsJoWvpm+QdwBPI=;
        b=JlF5tTdToMf1M8+qngUfLf4dSVnbTeDbH1qstrEDxu32HlUsDBNjqDidKGJvKgGtzZ
         B9UGPi4rPk9XwIByN3B4JoArAbOlx/14pl23T8aMlRtA+ZRIomrOUY3Z0+wU1qEF7dxs
         CnhzVSz7tl2rodGPYDBvOxz8jCCogqlN7DZPwivOnvAM5yGu2X8FXFjuvaoiEOJi01sU
         /620IM9o4qk2SJ+rxCO87/1/iWrJr1QpJ4GxBHy30hm/Y3TTotHfxC7qyARBaqSab/l7
         dg4tatfmnuUGIUW2V0ZFK6RXlpP+f98LCjovVJvsvne6VyPR17KZyvoMm58ZCH9qu8BJ
         trdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775885; x=1793380685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5T+eklRSuPXOFCyqOwoiO+bLFastCsJoWvpm+QdwBPI=;
        b=A7GgZiwDkWW6bnlMXm94WnuKK4/bUSqatX4W5dC9B/4qpZLBVknIcR5D35d0jjrH5d
         dH93lvX7QKNd7+6OIfc/jtqGInW+KkJOrirZTAAJql36GQAk48b3gDpXauMTxJpgUcuf
         KFAzNPS+csbO3K7PJu4KxNGCo0qrpTP6KCMsZcv6L5M1FgLFZ382iDMyxiIlgNvt/fdQ
         hvAKo4ELX2v2bvZ1ldxkiYviFs+rL+iRXn5mdURdhZTGgRilDxxxd59AoRuK3ZvmVPQV
         Wfea5wsdhnUrCT2Bj0wcdJ2yc11umbB2vKUzW0t+LpP0gQ1rJVtcj68WN1xSmi6gnUp5
         EgkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwK6FMsYuIdtFjOSgOSWar1C0iAGQXuahLNzTwZajNyvwRQAVDJtcIVFl7miOpizOjI+E4cxw65NUCNwHU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxrlrBDyMNBBLousk53FP18EJ/aSIOK18r94YtJFPGYWPx64Nb
	UmISyWqVtx2SMu+CbxWF1T3ggVoSeNV+YAgXowpAd/Z/aFitAMCWWVuxVIyZ5aVTHrPRXbUpKBt
	tE0sFFNf8PYZ/uReK/VOiOEAfqQNlwVcX+GcjUisSeSW7lOPHlFZlE7VFqbigQwCSt9U=
X-Gm-Gg: AYBFou0L4vvuaP8CkfC7ebKc9gAWm2+sg0BDDR3mEnGVWsZVCxSLxE3BY+Z4cNZ3h3b
	1tEPvxG5LFZQlwgs1pCuXEmhWfw+jo5bYEikd8cojreM4j10P5XR/mrk1+GJ+SKEHaAxKGzqT/F
	0yt2iIKWHYaW3++GfZCdddae+7EZrEJaIjIySm4dzYaU8nWM+xOiljLZ4vI94eBrwtsj29j7VHy
	h15/BZibHmEw2p7ndNfv0yJ4S31/VtNnofboy55474IHQQolJzwMGlCqVfGVUMGLk800XEKPSAk
	ah2Cv/S8vljgEaRmS8vkswG4W4C7KuMkIwy/asnZ19XRrWaAY08vOI1/lUWHBlrs+f3vnX8ggas
	3e5fed9xSYH6U
X-Received: by 2002:a05:620a:6403:b0:93e:a71a:5de0 with SMTP id af79cd13be357-93f6f908691mr502263285a.26.1792775884568;
        Fri, 23 Oct 2026 10:18:04 -0700 (PDT)
X-Received: by 2002:a05:620a:6403:b0:93e:a71a:5de0 with SMTP id af79cd13be357-93f6f908691mr502259185a.26.1792775884048;
        Fri, 23 Oct 2026 10:18:04 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:03 -0700 (PDT)
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
Subject: [RFC PATCH 10/23] ASoC: qcom: audioreach: support up to four speakers in VI feedback
Date: Fri, 23 Oct 2026 18:14:20 +0100
Message-ID: <20261023171433.820092-11-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb96ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=0B2h0znxLllEwdGFOn4A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX1JWOhDZEcDGU
 D0F4V9UuONNudi07Y69yKZmWZ/+VgPKsG9SwJRGF5K66KrYCEoDuH54RBkjtymrCwC+gVx2IYTz
 cnOZY+JHpvv+bD6AZDF+SLAFIqKZ17I=
X-Proofpoint-GUID: 4ivIJmfnno_8hHznWw8JLzg2AceBFh7H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX5FPoTmXX38Rm
 h+Nn0t7331YQGSO4zqLDuw9GE1+/Gmz0I4uh6ZywSvMCkQAftOfbtkPbWZ5SN8vnLvqKeWnOlwP
 IqP6gC69Q1Tt/Pul0BPndI5C0ai3iBacVx6Dwd2Abswgh3jVDlViN0J0NJiCNWHdMSigjiedcMh
 OfK63q1ZQfmUF62RkvNSz7AJaBMp8Wx9CpNTF7NNGDUmfnmyijR5YreHEMtk8RU1/KqCyppg0k1
 tVyMaofkn7gz58VWwpAPtQzk4hTMeUnlyjwgA3H8QmhN5XKgvaet5/9OSS6FDrGmx0WVRxtdc0R
 OGJJFd1oNgTObtkKk2UNZtrXOGcSkEfHPekFIo6MREupb7AKk1HK7omysjJupciuIyktRHxq7zL
 ho2/NtBL5XbIqlMYw9n1uEe4MJcKeYDjEXmH7sVmH1J6huNSQVL82KQFvfbkzuRWDwFDY8lIwoK
 4K02l5F+4XMO1MJL69g==
X-Proofpoint-ORIG-GUID: 4ivIJmfnno_8hHznWw8JLzg2AceBFh7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

audioreach_speaker_protection_vi() rejects more than two channels,
although the rest of the function scales with the channel count.
Laptops with four speakers need four.

Raise the limit to MAX_SP_VI_SPEAKERS (4).

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 2 +-
 sound/soc/qcom/qdsp6/audioreach.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 75995426b9f6..24198cde8158 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1508,7 +1508,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	u32 num_speakers;
 	void *p;
 
-	if (num_channels > 2) {
+	if (num_channels > MAX_SP_VI_SPEAKERS) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
 		return -EINVAL;
 	}
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 4744d3117010..c8c7fa4f6f70 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -696,6 +696,8 @@ struct param_id_sp_op_mode {
 
 /* Speaker Protection VI */
 
+#define MAX_SP_VI_SPEAKERS			4
+
 #define PARAM_ID_SP_VI_OP_MODE_CFG		0x080011f4
 #define PARAM_ID_SP_VI_OP_MODE_NORMAL		0
 #define PARAM_ID_SP_VI_OP_MODE_CALIBRATION	1
-- 
2.47.3

