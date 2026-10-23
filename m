Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775626;
	b=Ouwkj22bp12XxlqiqMwNSOtUT/QtNnd5fZ3DUu5wq46rFbD0RFsh8f/xU8aVhCqVf4D/
	 f9Yo4pQkheekobv+AwkJuwRmo/S3wujYiv61w0wYnD561rbxFwYjeftc7ivpnal3+TN2p
	 2kJfTf1iaP1jOvfXJktu9s36xS1xW+JPtV5mkPjgxQiPHJtvU1Qo2Ywxv5LURIYHlwcfT
	 wYt8ytRH/QZ4sUzIY5uK7LeJvRBlKXgNwVqqYmHtMSE7xJukoRSyKVqEJDOu06wNXD+i/
	 AU7b9MiS92kRcZ6xgM8FA8+RPqcMU8X78uXIXJM2RVvrLFcALxqMVS5xShWvCfI/uSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775626;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OVN8MgXLkPAfIyt7U5VOdTrAwJealQJYdpA+B6fu7mM=;
	b=I3BxHE+3miob1onUHDyjngrhkNaOj6uL6tCZiK0MdgjTybSqoWFTrSgFIM9rLmnt3t/u
	 z89NDaFPwQqbvJOI56Fs9cbreE4AsS1b15Q7KmIijjba2to8qb3bZveRRoTWvHV/sbzbQ
	 y/wjYQP4YPnCLfV7qpH5TmloUuHnP94aliExFO9QTWUZBkj8Njn47sT/byswQkBw5K43r
	 03zUMXXZAaLrOBypXaeSDMJq81e0/gCk/6cx10UL1i0t34+aCktrYOHxfbQ4hQ7npKs4e
	 Q6pJpUJV5kwRq3KjRBDIq+Y4efxhV36i3eItQ55ZHIuDhHDYnt11if/1CVfPRHEFmsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G4KCQuA8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bTFELnSr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AF960A380B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86AF960A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G4KCQuA8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bTFELnSr
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5sK54072768
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OVN8MgXLkPA
	fIyt7U5VOdTrAwJealQJYdpA+B6fu7mM=; b=G4KCQuA8mq0zHvgxNoXLnzzir9y
	cGRhcpq/c8z5hVGSfNyivwtosnmsmGswmIVBiTvpKTp0KU3R5m68mPkPgYJ3zBA2
	JJvzIXWCd0Axev4irJEclxFoEpwM0jNudpVvEDBuCjDbDsjN5c1fHihjM1SMcZui
	cMmZkA56HRloilbt3fM4uTUIk1at0UDfW0xMg13JZBIvRCBMWQXQhsHzuXq44Nqy
	hdJt7sCWrs/AtKnxz/d75lq597wZU0LfedY/Bi7x1r7T+pObS4T2v11jzlAaqfBk
	h1E8WkRCi/E1y8KXb6yssm0JjXkc/uJNuaXpkC7COhtPPlXOSvnhZ4+Vpmg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw14w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2373e9b4so119314485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775624; x=1793380424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVN8MgXLkPAfIyt7U5VOdTrAwJealQJYdpA+B6fu7mM=;
        b=bTFELnSruDdiR7Cp9Hu9Cug/m5RTxsIakwzHQqHSfvQsT3h1+akrvleli9Y3T+3mX/
         1g95qHQpuK4MvjkZ80UrQkUH1luibazoEgDO8WyGRvuWRQC/3aUJg0sWrGpgQq0Hg8Gg
         S9OUwhjZ6SPsMkq8ntQfrocsxN7JZ/vwT5BwAC5JYef/qbKdO8Q8le4tAt5I6QisKKdH
         21BRNudnjaR8HQmVCXODhVueidcT3k5zPjjdnV0LkJwmDkP9SjNbSz8el3eWIw6Uj4pF
         8ADhcYkLMs7ANwaAkz2FhNc/ffIEKJ3xcfF8/z70oSbulthF0K6Jdc84oPk+Kpttt9MU
         ZgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775624; x=1793380424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OVN8MgXLkPAfIyt7U5VOdTrAwJealQJYdpA+B6fu7mM=;
        b=cgBHhytMxO5kUQe+kPCdWoKBjdA6FcXyYLn7lEkBsSUrBChTgT1NqTPKv8Bnf0fY2+
         9I6WtOBXgrai3giEGrG0YHp6qgpN4Bpw9Dmi+DjNLjG2J7R/19y+4unGgb/VUTo/PMpS
         wdLo4xM9vbZ14Q6cpGdj7KlaX0BKMSNVHOJ8c4PV6LT4vyKOzBWaW+GVivuIOYewIUp1
         vDQp0xAZX/S0Fr7qu9wwRVhNraNNGFnxx9Np0eV+VGoem8ajLGAB7+BoydigTO5mtcYn
         S8rWJuoudhWCZFJmnNzXfEywsdX5YQWEONmoR/OxwscsIfIeG+FJvyoPTPrIMMuXhur3
         BCUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfeVaCfiZsY5Grs61ft2s8UzgOQK5yxTBhaTO528rwiMxvcsx0XEhwQexfVfzxRYuOgDiMKfpGTdVbNkw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIC75pwRlCqRVzbMy+zcbdi2w3mziPOsQ2DN8Wh0dfsBCa6IBZx
	9d07W6dWJXkRJjX+GdEY6bDjZULJ/m0XVsuywNzcc0a/5Pyz1DHeS/Gv1wl52DR61eR4TCmHwRp
	Wm75csUO/WGs1exDrPFCH3OtRe2r+a2eG7xXqeJXjaXCGvMZ0QPtxMOlcVWH9eMgUrzE=
X-Gm-Gg: AYBFou0wLQJTXipDiCbt659Vs0tlz4QRyk4R1uR3pjHIYyqxuafVhfaipLREdItedS/
	5Lz2dBLVrs+1BCSHqZVmkyhCJlKE2cXWpJuGbxHLLjaG7mzq30e2Yr2RqezzpLX3vY3w7RMhdun
	hzbT9JbnAswLEe3AtWXQIwsp+KDpb7e7slTCrG8NLK54egC9AZQLHqxrNdokVfSwlheD0J6EFrs
	zICDyBCLFOWSiop0syH4Be1VCU3ZMsO3JiyJt26/n6DufOJ+brHM7H3Ab/GyLAQLn7Poi6PA5Vp
	ljqxO6vd8j+JvBk/AiqYnXILIC9cAwMRLfor1xnLJexHBrCW1LKJpm1xOELyEvvNzaaunNsAyDP
	R4lsF3MdWuS/k
X-Received: by 2002:a05:620a:4725:b0:93d:23b3:5088 with SMTP id af79cd13be357-93f6f907cc0mr529821885a.16.1792775624481;
        Fri, 23 Oct 2026 10:13:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:93d:23b3:5088 with SMTP id af79cd13be357-93f6f907cc0mr529817285a.16.1792775624049;
        Fri, 23 Oct 2026 10:13:44 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:43 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 7/7] ASoC: codecs: wsa883x: Fix VI sense port channel count
Date: Fri, 23 Oct 2026 18:13:16 +0100
Message-ID: <20261023171316.819857-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 35JrByxZO3mKDoSLCmW1Er8FSllNbn3D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX3rw4TrMIYB0G
 /VaBb1XcICmxCkE22SQjb8FPxq7ILl1D1mTyYYQ4X5NJdUJnKtp6Jt71k7A0moqh8TSEm5ag3Hv
 YLrbBejl9MIRbRWJ6B8Rwpd3KTHIKlU=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb95c9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=AfZmRdYrrmokTClfqrwA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 35JrByxZO3mKDoSLCmW1Er8FSllNbn3D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX/rCS1Rwgz+Ef
 ELEAPA6+nM+UyJje1psHZmrYDREElRNEfjhKCY9Pb5xHONy0WHsTgwxcHnIxPS0Y4ThAh1i75RY
 drr6/ClrvCvoIZ/ZHNF7F4ob3AzEpzIu8oQpl5ncSbstNklEKJvM6sOezW04EEUj8sjMnczL5cc
 wyOKBPSeUwTXensmm2rqe7KNXTRC3qfm5pmGI4tq1VY5Rzd/ofUKHfD7jZ7zcy+eHaHe9ZiHNPw
 /+kwa1bzQrOvQyuBp1qcsoiuwNj6WQWTSuzfUYnwiPEhoE1PMjwMU60TSH5K4ZMg5/MKMsjFGqw
 tsttFg8CVpDouismGo25YzZlpM5gxuh5dXT6jhdOe/wSIjSPbHM6MXGs+xQ/p+3OVFXfZrkWccY
 wjaD3QOAqBfU3LE7iAKpj1WaRg3Q2/q4U192q9Eo+wuel4+by/G3c1X3amuEjQQDoAZnC5MbPur
 YKi91y9nb4auGFKBvSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The VI sense port carries both the voltage and the current sense data
of the speaker, but it is described with max_ch = 1 and, since commit
ed3b274abc40 ("ASoC: codecs: wsa883x: Correct VI sense channel mask"),
a channel mask of 0x1, so only half of the V/I pair is transferred.

Describe the port as two channels and set the channel mask back to 0x3.

Fixes: ed3b274abc40 ("ASoC: codecs: wsa883x: Correct VI sense channel mask")
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa883x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index b09ee3db7ed5..17d8babc6123 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -552,7 +552,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA883X_MAX_SWR_PORTS] = {
 		.num = WSA883X_PORT_VISENSE + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
-		.max_ch = 1,
+		.max_ch = 2,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	}
@@ -573,7 +573,7 @@ static const struct sdw_port_config wsa883x_pconfig[WSA883X_MAX_SWR_PORTS] = {
 	},
 	[WSA883X_PORT_VISENSE] = {
 		.num = WSA883X_PORT_VISENSE + 1,
-		.ch_mask = 0x1,
+		.ch_mask = 0x3,
 	},
 };
 
-- 
2.47.3

