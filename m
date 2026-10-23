Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775620;
	b=JNJD2C+68/LYDE+iGRmd1c14XuPIB2BdgYfiK3L0H5FQYUZGh8lo1rikJhX/VjOMXTlp
	 cPB4FN3F4ETgumpYamtsTopdCj3rY3ocPaN8Ru15OeM6U2W3BuLsoSAy8l1mSZIXtXJub
	 s4HlX2u6kEWR9htO3xzXqLxEHU4mdmg+ek0D0vduvDj3JWzfOp677s7tbVMVzPtKqTONq
	 y/NVSt1KhX1S7ABd3PRj8HN+UpQYPnADMr6j7nYpyKocOyvhp+bbTxO8ulMdVHiDtssvx
	 z0IHtYtCpU93ZftpgQgZAlPrSrj+VgZz5EKpNXzpWenwDBVQthQii2HCa0rkIGJ5Xkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/3qcXBr+8U3iiR9jdlQnsF4QPjQRPb1kVgXwS+tD2A0=;
	b=4ZgbjzDan455niBHY9ZKdjNxb2+xMsDEeSbxskpDCOvqcXAy2CUuY7w659ZE5TdRbFAk
	 Pc4W/BPQUPMZjwC3FtJ30n+isjenNSQ+hHF/kcVKiSN2OMLdbLaad2f4l0YGfS8XPIs7h
	 yX3Tn1gkqawpyKYQ1ufVZqVcPRPATB5iBRtdMdet1e4yq9UkDiszF7qN6Zxwd7TGoHzT0
	 vnp7bvwmrhCGqbizImFBaj+Utp10AJ0wK5c/Uv4jBnN54m2UhEW/psabQW4jJRqUFnqkR
	 /JZs3UtAt4e06dR0+1e+5aBBGzhouoiBSNvHa6HW+eG1h+EA5yDbhKHdcqOKREigfwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2G5gMQC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fghkG4vD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C13860A2612
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C13860A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2G5gMQC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fghkG4vD
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG6CBq2215802
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/3qcXBr+8U3
	iiR9jdlQnsF4QPjQRPb1kVgXwS+tD2A0=; b=Z2G5gMQCm+vqU6kIQYzTU1m29Gx
	Fnzb4cOYuMa9pySdUePtV8h12nQmLt32YELoWePDc6xblfNFN9dGmdNCng8LEbhP
	oxNhc4yAl5qi5Dk9vFIowLFdHqw7Ot3JmPdu6fqw07YU4HZvXM0ARWYxW7x0yKo4
	SppVr8f/DjMKOOiWMTC3gu6vYHn3RUgCn/6ADIqHN7+FqWqwKZbLDiLFye1RlpWQ
	eF2FXabEK/tZLDsKs0J+luQ89MhMbwWXTxyC4B4L2heNKRwtC28LcDa0fQuMck8z
	+OqjltE/IecfFrWPBJeNWqd2NNk54A0s5iUOTp1zoIhbVDKrag2LE/7cezw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgatc88j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so186048685a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775619; x=1793380419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3qcXBr+8U3iiR9jdlQnsF4QPjQRPb1kVgXwS+tD2A0=;
        b=fghkG4vDozhUpOPrxC8tbd1HEob5mgwwQgUhf0AOTjkBc3J6pzb374seMM/6BDaYYW
         ZP610lp0Pk60NBhmwxZ4FKG+M4QNgyIhAoowYvFD7CNyIMoeqPq6F5ZY/t3k2Biqi8oN
         VfLhRGi7gck4/dqmw0SDgDvlkrtTgftGR9iQoUTA/N/R7g5Nj7ZdY4RRA9UR0Wj3IHEo
         78mPqeR/SuUa9w5Fc6oQak+s4BwrWcPYn06vcC2J9tjQ1Uhc/Cnf7SMBkjQRN+QMLpyV
         WTV5wMQUKMXXlgsGPCuaNTq76ziYJKnw7/N+Vcpl6cLV5HJp800zliAH1WJVz7j4clHk
         2v+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775619; x=1793380419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/3qcXBr+8U3iiR9jdlQnsF4QPjQRPb1kVgXwS+tD2A0=;
        b=CxFdwwJKMj9sdLq8eYGrwhmAJe1i94dfGcNOsPThiWB0NzzuGjpGgyl3NT3jAxvd06
         gHnQzNQSI6nLNm2Kxwbnz2sMtYbSFhWvBguWp1KCJoB6yC4ufmzYFdAbOV2QOxBIZ2rf
         qPuZ+wUZwy5PkkN1gtBo4yMtNYQtGCg3bSvWtCI2HkhUmcsxDG3xOighP7lGWWfKm4Wx
         HHC6XV6/XHR2CV/MS8MrwrTX0ehmvoM9aOuQh5jpucZK2LwNqm2PNWT13h0akZV+JQB0
         Ry0Il4c+Qt8VVGj/RsJRwLWhk0OeNpAdkbSZtWAl/H1IUt0fi+UeXksmzUBo96aFl7H8
         R1qQ==
X-Forwarded-Encrypted: i=1; AKwUvBwA9qb/3a2rgF2KkWTYtHec6nva9pkHpeScElri4DjTjJ3ALf3Su2kQKOe/VpHTNFL+jIzudts9BJ2gu0Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjqkF/WEb3yAfVTfSQvWwe7c8hUQ3im4BpWPLo7qf3OGBAfKyb
	Jx5YAdek6plqhugA1UtnZp+olEHEXgIpPQXqAVQ7ceYoIfqn1gqcaQWx8a/2Vt0jOY6KboacbsO
	M1EWR5kTCpD1FcPsFEcYwzMQB8bSEF0kOV2HH+uxwFmgU2WefKuS+f4PtreGOvve3Q84=
X-Gm-Gg: AYBFou3hTreIMakhkTOSpj+DrkJyYOWDJbNDP8oGsJ4/dQXcgtCr9oL4P2DhK294Rfw
	kfCt15+RIpP65618oXtpmgWpZXtvd8Xjz+E8aBvIN9dYI+cmX9wRXVUwkr3MeZNXiMTvOzxlM6X
	g16NEykJLwxNx93bcyXEyTau71TzPzJ9CQYxknD+MJsxiqd7BTZQZZWrFhwoJ1ezI75A5srAjlm
	nosgN9zOS8LQS8LehyKVJx+SMjF03vY4Vo+ohP1UCtk2qhi01Y1m9ewUa2b0zw0luY/r35QkxJT
	kQ36DW1y0vHZRQF5S5IE567n4yLTSBNJx0NTzSz4JLhj11hJjZbpz0WM1FUdGqQggWn1yue2cX5
	btyOwBrRQQBxf
X-Received: by 2002:a05:620a:1793:b0:936:df48:d507 with SMTP id af79cd13be357-93f6f91b90bmr519825785a.18.1792775618627;
        Fri, 23 Oct 2026 10:13:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:936:df48:d507 with SMTP id af79cd13be357-93f6f91b90bmr519821785a.18.1792775618196;
        Fri, 23 Oct 2026 10:13:38 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/7] ASoC: codecs: wsa884x: disable runtime PM on unbind
Date: Fri, 23 Oct 2026 18:13:13 +0100
Message-ID: <20261023171316.819857-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXyiE1oEtCRV0I
 wpxQupCB5BiJjpwSWwVVXoM7dc4gI+y3TO9xhJoGKri5ycnivAwkU2ariC8Gs0omn/JbsUecV/Q
 BOIU2Xce+yD7hG2eyY2pOpLICIGBHsLNEK8s7Eu5w/33vSFiq8P4YcnVNPm5giTRsrhM5bT0O0f
 0O1Zz5abuKCq9flqT6xORTOf+G11+q0iwTMX1Yz5XyilW0ArUTruWGgXSN6zwC+DexE+ETQzMOC
 tojiqFpY9fAa0QfuVA2GXsFkS93vAlkk2XvWsvPzjYugW83N0MOP7GvXgAge+l688BaI3O0b/9M
 nWSRUMl7zYCaClsIGFBtQR79QiaBNocdpG5rLOgSaDEOjKIQueXstu303P7/1ifbAOdVb72jviH
 PFIwMWOZsgTpQBS3D97JTmGSArZFS4HSXtUOCdDdytcSoUjr6wkcf2f1vrxdKSd6QGEqhzZp+gN
 fBmqCIbZrYIQuM1krXQ==
X-Proofpoint-GUID: 7KOW99wqkmPounPiIKyDnNgL7CsSXv2C
X-Authority-Analysis: v=2.4 cv=Scxi5fRu c=1 sm=1 tr=0 ts=6adb95c3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=SkocYiaHmpXiBWnVfSkA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 7KOW99wqkmPounPiIKyDnNgL7CsSXv2C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX3pEOdTHRrd1Y
 4Hw2zLMVr3X6rZGQRDmyCNoCCKtbLyeFNue2fL+D/WYpv4i+Z2gl2egeMM6A3tiOytyanfXTav5
 JsH7nHOE+ijwgcH3E28K9Nxw5K20wkA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

Probe enables runtime PM but nothing disables it on unbind. The pending
autosuspend then runs wsa884x_runtime_suspend() after the devm-managed
regmap is freed, and dereferences NULL:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
  pc : regcache_cache_only+0x18/0x80
  lr : wsa884x_runtime_suspend+0x24/0x40 [snd_soc_wsa884x]

Use devm_pm_runtime_enable() so runtime PM is disabled before the regmap
is freed.

Fixes: aa21a7d4f68a ("ASoC: codecs: wsa884x: Add WSA884x family of speakers")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa884x.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index f0857c0588d5..3c008224d32e 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -2125,7 +2125,9 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	return devm_snd_soc_register_component(dev,
 					       &wsa884x_component_drv,
-- 
2.47.3

