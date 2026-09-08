Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D598C41F342
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856116; cv=none; b=pPGEPjzFDHBw0KhxWK9ordbS2i9tiCuEUVT5QVKDZHINUO1boJQGGnnZXrhPKuaVVbmpdsCtsxPCHQ0BrC7WC0zN6csydBFnCnPGC5BCHkZWCCOnLlK1hPgAfCTo9LkYC+IXSIVo1xLWOQ1UxIdIDBAaHXJYK5/C1rTKemEXv9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856116; c=relaxed/simple;
	bh=jgbIWUZotqLNAmjyHA+4y5+poGaryVyTdhFwgQ4PRR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DtodLmzx4GCXKJrjRPA9i3Ij6eXfdWApkaOP0u/yS9MMl2v4q5F6mIMqnlULET/YEro2YsOhLDo1WBrRDtvauzTDXTCV/zbkwLensB6MHckTj69u+RKzxt/7UWt18FVmOBWfcyjKy9B7nK/0LwHjGjH4m+xtfVb2atOgHKwt0Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFmZHgrO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QnLKQENn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFmZHgrO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QnLKQENn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LmHa1477802
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 08:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zibPbvEPSDmpsn54/8kMAHnX3dgw3O0JPgV
	qMqW2UcI=; b=PFmZHgrO8LCR89b/LvxXyddVFs9X86mqbfv+MXNjg1kcTYWemKR
	/joav5ivxgtaPacb5bGiK8yNnWwPAQdS8/zVRKhyDFdm58jhchiYnqxJb6DQA7p5
	Dy38zmo81zN4oO4o9oPq3T/qvKuKxjD5GOjC6+Mi0KQYXDmnYdgSr2DW+2FBYz4Y
	6L8cf15fy4zCcxC8rudd0pvV9s7faIisBSTzXYaU/xmUl5BlVQ6OplEXy/qb5wC3
	Pr+4r2WyassrUcRS/WGJHrgp1UKvhA81a9pAeUxcTyfV3GHt8+TnYA1EHBqxYWFK
	FJZVW1G3ihtNgTm+m8oQWUi2WSJ4LZxgFCA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjh0cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:28:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9375d92d8cdso837952785a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856111; x=1789460911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zibPbvEPSDmpsn54/8kMAHnX3dgw3O0JPgVqMqW2UcI=;
        b=QnLKQENnwtTyW9mI+1aVvU50YHD6LeO5fKHMkerTATgVk9Mz4G/sIJMw1W/A1UIM6g
         rUhAbytSXcUTsiTEMPgZcV/StMAKcol8YRNfl8+cYlInmUSu9LN+/TVOOKsFg2IoPUSK
         v4c9O5A357EfXLurfINK5yJWmndBw1QtnfFLqhuMg6+2j7PzI/w0mNYIhLLwZzVKluv9
         WlTIOBhvrr7rg3N63xW+xeHkbxCbI6lUoefz4lju8W2yHm0b/lyJYBwQZQ946oczVq6C
         F5GJl0y7ASJmCQRZOOZXA9xwdALJ/XUD3X/BDJQz3OqD8kGx90SL0t6y7Q5aZMfIZCV3
         dKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856111; x=1789460911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zibPbvEPSDmpsn54/8kMAHnX3dgw3O0JPgVqMqW2UcI=;
        b=I402Nxa7ynmVetiqsrRBthOgCGTefNiJ+m6eW9ZUKKDogc9MrNEEkKylxj5D2VNlWe
         zxukGkixgr1gzl1cpI8mEDyns5gHIr7b+Xt6cdA64JP2XtNH2W+PnB05Rzh5DXUipFdM
         7uXWj0DHPRqm56SM/Sn2+DXuyK8ItMln/mE7VFR2tl36RMJPg1PQhfl8NAVZ840fQ4nR
         p7FTLOoTCSfOex0V83bNv8UFomuLGvdYoLzsP2mQ3dWKK8Oa1c5J50ir1aM0aiDp3plt
         fjHawnHt58Ub6GB3yq9nSouqITE+t3fsYWbHQYa2UkER0eXiu9VQW2BhUczz4d4iYDsH
         W7jw==
X-Forwarded-Encrypted: i=1; AKwUvBzS91RYqOrcLDeRUJPNk5BXNZJdB5QHnO6XHfUy7iwI4JVmUCpCFzuDr7XuVqpq9JrxWOZN5ncgrGCrr64=@vger.kernel.org
X-Gm-Message-State: AFuF++l7aBy7vA8l40Ne9jsWhEidWo0jskM3bcRJZ+Hlw0dTBBN3Qwwd
	zvNWUY+rUM7sRcpSM0MAsAlhbcle1UoupJH/4fzgnlqG9AoEkrxTet/Szr0SCxaXX/Cf0JNq3n5
	Nsfa8vwCpYbNYRjM0u3B58df+6zZHB7a9MbdRBT1Mkve0pl8sZYVkcFafeineuMBXaVg=
X-Gm-Gg: AYBFou36Q533zgraYmgsx/ulUuWfYf2Qe/1sC5HsZV5kAGH8DJdFdG5Geb8gDi8NJpG
	R5b4zDwciyrjlTPWvflFZZ5la2wD8u4DMOkTfzR3FT9HapNMKj6YYGlT/tGqdws/+fVVeVTwRgI
	0HOhJVrrN2vzu+sXTsPk2Kue0U6ip8bd4XM3COer2i9naPJN8mOnt0cU+oGGkplCRnAAuXBuyZP
	iAvV2WIKLGuXalbhiAPKnWE3c14Vy8KsFwG2PrD6by+Le2qOACdijImWwSUwFH2+WwOnuHENu8H
	P6HBguYAwoVz7rPhY8fOIjqZnyeRfHskoU0WbbiVqcQZVtazNSt1pF7qRQ97gMV3F85Oqygl4uP
	XnZqZcEs9eifUdQ==
X-Received: by 2002:a05:620a:a2cb:10b0:939:a0bd:2c95 with SMTP id af79cd13be357-939a0bd2f2cmr1108820685a.4.1788856111283;
        Tue, 08 Sep 2026 01:28:31 -0700 (PDT)
X-Received: by 2002:a05:620a:a2cb:10b0:939:a0bd:2c95 with SMTP id af79cd13be357-939a0bd2f2cmr1108818385a.4.1788856110780;
        Tue, 08 Sep 2026 01:28:30 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm369414605e9.12.2026.09.08.01.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:28:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/6] ASoC: codecs: lpass-macros: switch regcache to REGCACHE_MAPLE
Date: Tue,  8 Sep 2026 09:28:00 +0100
Message-ID: <20260908082806.648797-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX3lZkAUw6LMCG
 4NqINWdSvHffv1juPB0Oie5CV/iE70GBoTpa0AF3+KujO+zSa7JDCZJn2g9vgiuJvgViJjMICBW
 VFfdx4xLTFPAiSWuiIOncvJOQBLGAAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX6Alg3vKbTGhE
 gYrrA3eajKCEDs1Z3qhjwxfNFkWclvtvBv71zThmdSHm6EOMCiifY46b4KQ7eaHkShTv3YdByxs
 zjtX8t/61i8sDj7WaQHyPEftkVpvv+0Ik+9jWGMJf563J/HESlkaxdaFVV3uPZb39tbO/1gNYgt
 eBFCG5Lcti+JomLNMEV+im9XhwVCmHjIXt7X3wjIJeDCrVNqbfeRh3cSFcVLoNcd9PmazL4Sdwq
 Ih+O+KvcmcQXSRBIgENd4p++4DqnT33SAeYn3mWPjltwUqd2wyWFNmRVeuuQyGdww+t4wIo2fdB
 8qAofG8+5sBvcwtTv8dGq12WvJHuqsJtXHYcT1kjtzXXYkOIB7F/bE5L1W0P50XEjow7zoPhkmG
 DubdyCWsN9YJ19aSlKkh0ak7ZFj7cKfWsVRyJpOMsFgJxMSkgwYT9CBlGqWypUgLag9mcN8a/aD
 9j3FBcp+EpjXokErXhA==
X-Proofpoint-ORIG-GUID: OvBuGv6dvrNhISWAf-wWoubp-2bs9YUJ
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6a9fc732 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=E_LEQPGuJuUiLMbzXFoA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: OvBuGv6dvrNhISWAf-wWoubp-2bs9YUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080088

Move all four LPASS codec macros (rx/tx/va/wsa) from REGCACHE_FLAT to
REGCACHE_MAPLE, and fix a latent v2.5 Compander1 addressing bug that
the flat cache had been absorbing.

REGCACHE_FLAT hides missing-default reads by returning the zero-
initialised cache slot instead of doing a bus read.  The caller can't
tell that value apart from a real hardware value, so any un-defaulted,
readable, non-volatile register that gets read silently returns wrong
data.  Since commit e062bdfdd6ad ("regmap: warn users about
uninitialized flat cache") regmap dev_warn_once()s the first such
miss, but any subsequent miss stays silent.

REGCACHE_MAPLE reports a cache miss as -ENOENT and the regmap core
falls back to a real bus read, so the caller always gets the true
hardware value.  All four macros are switched in the same series
for consistency.

The switch surfaced a latent bug in wsa_macro_set_spkr_mode() on
v2.5+ silicon: two Compander1 register addresses moved on that
generation and the driver was writing to the v2.1 addresses on all
versions, taking a silent bus error.  Patch 1/6 fixes that and is
tagged Cc: stable.

Series contents:
  1/6: wsa-macro: use v2.5 Compander1 addresses on v2.5+ silicon
       (fix, tagged for stable).
  2/6: rx-macro + wsa-macro: sort concatenated reg_defaults before
       regmap init so regmap does not sort a copy at runtime.
  3/6: wsa-macro: switch cache to REGCACHE_MAPLE.
  4/6, 5/6, 6/6: rx-macro / tx-macro / va-macro: cache switch,
       same rationale as 3/6.

Tested on Glymur (SC8480XP CRD, WCD9378 SDCA compute mode + WSA8845
speakers): HPH playback, mic capture and WSA speaker playback all
work with the full series applied; the "using zero-initialized flat
cache" and "Unsorted reg_defaults" warnings both disappear from the
boot log.

Srinivas Kandagatla (6):
  ASoC: codecs: lpass-wsa-macro: use v2.5 Compander1 addresses on v2.5+
  ASoC: codecs: lpass-{rx,wsa}-macro: sort reg_defaults before regmap
    init
  ASoC: codecs: lpass-wsa-macro: switch cache to REGCACHE_MAPLE
  ASoC: codecs: lpass-rx-macro: switch cache to REGCACHE_MAPLE
  ASoC: codecs: lpass-tx-macro: switch cache to REGCACHE_MAPLE
  ASoC: codecs: lpass-va-macro: switch cache to REGCACHE_MAPLE

 sound/soc/codecs/lpass-rx-macro.c  |  4 ++-
 sound/soc/codecs/lpass-tx-macro.c  |  2 +-
 sound/soc/codecs/lpass-va-macro.c  |  2 +-
 sound/soc/codecs/lpass-wsa-macro.c | 46 ++++++++++++++++++------------
 4 files changed, 33 insertions(+), 21 deletions(-)

-- 
2.53.0

