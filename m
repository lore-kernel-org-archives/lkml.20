Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775620;
	b=pvBDmQh/oKcWBQlMpLpCUq1v6JEgtuzRv/q17L593IfGG+x2srmOzoCDHvPg3s65vSOx
	 LhqPA4YxcfUmiqdk4JPZscwLEsG5MDkEDRkuVRDNH+AmNEIiWsg/3rK4TOqr5j6dCv0MZ
	 kxmRtWVBmjeCHbD26/qrqaBVKQx+OJjAJZB4DuvgXPRVhiI/T72l0SatiUhqp00LOabh0
	 6sTPr9b4ebK+Ka1jPN1rKnCtEXxCwi/DHeG7zcSz55fLZB0NP+g7cBDrA3seUDJCL0kHn
	 ThLmMPUnoFlVWqnCW1kqv85pDtGls1yRsKVVYaT8G4E9aO6hQ6SrYDzzCtPOTwEkD6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0KktU0YK7m1nYEceS5jqmj/hH37F3E8VJWvAd659eCE=;
	b=gcNmD2vyPZqSd5xUbVn08/HgIZ8L8cNq1oRqFUzn537wzZLVh1xQEQt81VDI7yY61T2U
	 X4Z8Qfx4twg2rqMGV5vcaffHBdiryDt+rvspgYxYZ39IJ1LAshSP7IZ2nBQi4P1n+mMnd
	 7wh1C1gvtcd4H3+br1a9hkVMcOlF6tkbkCVm5jI+87JPZ/DN8KBRts5LLasV2OlLDjXFD
	 8/uZhj02wy2sZODx0wJKbKCulD6vBsdWpfgPTFayX7bND3DVyRZGqPC6olLeo548WSAg0
	 BIe3PU+Syl7Gr2IbnrH/mTjgXvrNuIas9DYab1ahVSvNlptvaUY8kedm32M8OiZJjAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="DiRTT/9r";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IxYuVicj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B12660A2610
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B12660A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DiRTT/9r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IxYuVicj
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6u2B1492294
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0KktU0YK7m1nYEceS5jqmj/hH37F3E8VJWv
	Ad659eCE=; b=DiRTT/9rC9jF3og6bW5vdTTBFKFT0N2RlPAn4SJRXS5Lh/Z78ID
	DVkuxm42xTrgUacl4kTlnpXEJpXVNUNVvPHsvWDSw+a5ppgz4FR4oagPu0QfyoDb
	xkvMbsk9ATu761kyOvP3DTiQapl2XiqzTKssijE1gTKUuOUFTFg176edY1/qgpxl
	fxERIkU/VO6AlSQ/YXdCZx8hPlHUav1M41K+3wx3McdlD/3xrpJc1WsGH6dDorhx
	eXeQt7+r9kFWrECAZZO/0giAokfcUPON9Ou4LffhQfjxjhUwYq6lZyQAGChCNdpf
	PJnxyRJA07JUo4oZ+/5deGDqyZ7CyP+hIIQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmav65j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91961d4b31bso27512956d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775610; x=1793380410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0KktU0YK7m1nYEceS5jqmj/hH37F3E8VJWvAd659eCE=;
        b=IxYuVicjOjbLSyDIn4pw/XgHL+hsyZ7ne0xrjPoD5wkLzvU5sChhFyUFGbZTDRc9sX
         uRhkn30jaVoWNGXkP21YXCaolPKlLcieQo35Y+uhroDAombsA3sgWvL1Q4Mrsb43qCF1
         L7lM8ZrxEePgBnLW5dVNe/A1bw9XKkPaJRhQrxXxRyELILj2vrb70FssZNzsk/Nl8ks0
         9cgzPM9PDwRj8vxAdo8stxHa9kmC7n0upB9EzcHiLJldY1UyNLu1/Er42iPaJyeNOMhs
         giS+3GvdasddtiXYzBhigm45Iw5ESRBKZDBxvnkWOQGhNSxnoqQFrcyK4XMt6VSxmpGw
         b1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775610; x=1793380410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0KktU0YK7m1nYEceS5jqmj/hH37F3E8VJWvAd659eCE=;
        b=idNnsTE5WBeylT+toWevPUoj6nwnRL04NPyI6lI3KkeG0mXQJ26LBl0tIItjVJNQuj
         2p06fsbxTsllALPG4FhEHFDxCJeou9+fjwLAhVs+BD7yTcLb+vtjU1uSXDhhgY9NWx2m
         RQWwxCYjHJWSzg3FS6BnJ3uy1D5oA9vzFtWuSwLV4IOm7XtCftICgaaHg1F+w9yxWxRz
         NJT9wXsiFxnH2yR5ZEZLq9dXs/Ie5mqtHzcQEg8ktflBsTwhYTj2X+kJYp3vYIJBpY32
         x0IszpXlKB2IrgeRiKUMmKuWYkmLVLej9seCuk6r5H59ML8drRHg4eBBx3ylz3PTArOa
         OKag==
X-Forwarded-Encrypted: i=1; AKwUvBzZ10wiLuA6l3DD8Qf4JpYefPBU9JhBLGrGSH8L5CC/JH82pTFCrYXhl6K+BoDPrp9jc8tdIwFrpObZHZA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoGjBWlN8CHclg3M0vF7dnCtBD5CakFuG0DhRd1a4KYTj1XcnN
	YTGjgyJXB+F2gv4jCOlF1GoPEIoRnr7UA0leyjdEK6gaOJuLNKP3s26JUv77d4W2MsJvRPkY9k1
	OUoT0SkSJ370II/PYrbiiSsndIfzODWXO1nYChySF6A3a27B2w4vkJPiUjrwgI2rg/pI=
X-Gm-Gg: AYBFou1M8vNz9vU8xnuyPWtKSCAXxfx1Qj1VbGJ6y+/5r5JiLrZxn5UYF7ZhkhJI+st
	wNWdx/b9FxROo6MB8sZIVOd/N4ihapdlPMNUzTw4g73Qc9BB1vgBfr3WS0Ikjl78J6klpLXz4zI
	oB3QssMTwCwi8+Amu3BJ66oFTerF/vgvC0myCjmg7OwlPhEXjD3L2EgbSVCrFkRLgp1h2h6OhA9
	RdVjp4prIPpzpe/SBFM8U/TSJ7R2rTzJTrcxmVTtjpAnI1tWPRY51pg9bROvfVZeRLfnnKsRPxU
	fYo4zSfl7+2kctGFk7FBE8h1ikUkmH1J6sGkSP1g8PBJyzisFaMemuML/Bl9Rnsy//UhoL2b4Jy
	TEOz6I96sSmFF
X-Received: by 2002:a05:620a:1d09:b0:93e:9292:1b9e with SMTP id af79cd13be357-93f6f570994mr507406385a.1.1792775610407;
        Fri, 23 Oct 2026 10:13:30 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93e:9292:1b9e with SMTP id af79cd13be357-93f6f570994mr507398685a.1.1792775609670;
        Fri, 23 Oct 2026 10:13:29 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/7] ASoC: qcom: AudioReach and WSA88xx fixes
Date: Fri, 23 Oct 2026 18:13:09 +0100
Message-ID: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb95be cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VY0Mi7k9gUTMOwSAwkAA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX8JqWARGZA9iW
 d2e2V3mt1dRQzQClR2W6q+qhIisPsb7rS8AAWzGE00C7nlknlW7K3t1S9z3TPDcxKMkCL7SEYTF
 xerLDgz/P86yHNdfg/ti1HjmBFwTHQ0=
X-Proofpoint-GUID: RMEHcGEyxFmb5MaezHAxN89dWb1ee8DO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX2/28FrhZ16fW
 bDigyJzR1X6Caz4Aym0A1CnTc7mpsviwpChnhmeW5lngBndAcQhfIFkeyJ+MqNwCw1gCtPcIuZz
 ff2+8WRIa/unNvcePUC2DA4NABGatu6C3NGOb9JTkq/RgXqdKeKk0wwAfXQeNfo+2AnJIzgWgxr
 X4Yt4YaSpO1YdtE7Gd8pc2kPiB0BQwcpB5g53s5CWGK3TO2FS7gA/NYLBo8Lb5Avq/BrOUGxq7c
 pLo/rVJuZcnAdExK2YKNnyq1iXvgy1anyt9qQFQkxTMvkGqN00QLF8jmM/BO2FisDnkDL/mtgFL
 5N6OTMY/AAmCf+ePtWMyGG5bYcNSrwBiuTJJRwwpbHnjk6OZRQJc0YmHsjMmcwc05Cj5NoUSEyT
 gGgOZkPoxumHQzSr269kxjiXqn1KB45A82J6AZIVFiMgdVSxe9fmISgf0IGpQoknrox0VzWZtUO
 Swm/0pxEYSExlBPA/Kg==
X-Proofpoint-ORIG-GUID: RMEHcGEyxFmb5MaezHAxN89dWb1ee8DO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

Fixes found while bringing up speaker protection on the Lenovo ThinkPad
T14s Gen 7 (Snapdragon X2 Elite) with WSA8845 speakers.

 - AudioReach: the module cfg blob size was used as an element count,
   so the allocation and copy were four times too large.
 - WSA88xx: speaker temperatures above 45 degC were rejected, runtime
   PM was left enabled on unbind (NULL dereference on wsa884x), and
   the VI sense port carried only half of the V/I pair.

Tool use: an LLM coding assistant (Claude Code with Claude Opus) was
used for some of the patches in this series, to debug the issues during
bring-up and to draft the code and commit messages.

Based on next-20261022.

Ravi Hothi (3):
  ASoC: qcom: audioreach: fix module cfg blob size handling
  ASoC: codecs: wsa884x: Fix VI sense port channel count
  ASoC: codecs: wsa883x: Fix VI sense port channel count

Srinivas Kandagatla (4):
  ASoC: codecs: wsa884x: Accept temperatures across the full trim range
  ASoC: codecs: wsa883x: Accept temperatures across the full trim range
  ASoC: codecs: wsa884x: disable runtime PM on unbind
  ASoC: codecs: wsa883x: disable runtime PM on unbind

 sound/soc/codecs/wsa883x.c      | 21 ++++++++++++---------
 sound/soc/codecs/wsa884x.c      | 19 +++++++++++--------
 sound/soc/qcom/qdsp6/topology.c | 31 ++++++++++++++++++++++++++-----
 3 files changed, 49 insertions(+), 22 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.47.3

