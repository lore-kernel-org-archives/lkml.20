Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0350442A149
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856119; cv=none; b=Xh1Yv1qNfBX2Y5VeLIN6totbcCv4JPY4FaNbVe/Peo0Q6yfjgE1rcfjLjsZLDfAEIljXuh7HBd4cDaUHm5XXXvuJowPEwfIor0gJMojn8TJgPKfoaBQAi2N4II0BY3C0J+IHx2DAeaQjeyYPZPVWyhT94GGhPBpk4EEhgiFiuVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856119; c=relaxed/simple;
	bh=5yK5VjioLO4s2+u2Ao+PUYV1VoXMngX3XYw8sOkTCrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldVl9j1pxeAmiIaj+GyGTHZBiKHcrClHofS/C3aghgVT7dDqVfiIykVMvkeQER7LTmT64tLXzMpP8BSoCKe7XHx28eDLn9UlDlpLz8b/CdhqXEFBqIMrENpYh73wN2BQ3Ut8EzH662hechCTC3IUBdvW9bgxiz6tidMKJN+vMTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2POOVhh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G39Xp6X1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2POOVhh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G39Xp6X1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LrbF2154211
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 08:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sXjpkE7BmFu
	zBqyfX3D2KUtSjVLl7POjhlaiCf0eRHc=; b=i2POOVhh8JifsAe5NPp6xZkg4Al
	VQY/oYKGSyKOfGw/u8RdVvGbOYDMfg/ECodVTvhUQWkwNTfYxaTvHfFVP/d9WjdS
	TU4lyQcOo3F9+GotqtkLhg+4rf7OeTrVJsNNHQnZ8oXj7rQ3VF3gMtT2So0XOF0Y
	kVM8qQbRo4SbMVe2do0sQCnzNs2BvUrPdfsdCPEkZSQLgtrGW/s+42LiDIzVNdp7
	eFmRlr9tkiV+40GYYxej7ueEiirWMGUYLnfzCfPimphtah93WFNwCHD79s/5qh2R
	A4qYFjZvGg7Vgi6ENYL7w5cTyfd7y2b67zvK12UX59Xes8N19OCK1cgzEeg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwjfr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:28:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so696631085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856115; x=1789460915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXjpkE7BmFuzBqyfX3D2KUtSjVLl7POjhlaiCf0eRHc=;
        b=G39Xp6X12uRpMG9uavIh0izM1mmQMjDRbQP5jvuoVHkR4XddS7iB0d+o7pQqE9OjOU
         uyp0IpiSCKBZFvbWvVPPqP4FchCR9OlW43sz20JdPq+StO/tUyTTAM+dYkC8XvqPBHqo
         KIrgMKilLUTfj+DhBWomvwjn9ioBmp75HtsvIWuLHe7bzfxp/FPagByEMHdzVuEf4DR7
         k+hAc6pXgAhWZqeco6fcbqHLdOp5nkyj7GnxN3f1tC3zPn8Fn6zmRuSnwG+XOjn83mnz
         nh/9bFtA0lzE4z7XXq+cxltYkumyCf0jQzAb+mmSMyexv1rluXgLJFbR4PrSQzzLwn+y
         8u1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856115; x=1789460915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sXjpkE7BmFuzBqyfX3D2KUtSjVLl7POjhlaiCf0eRHc=;
        b=pUL1sOCFX81/uuvK0XdNnwWXiOAQrEBQzRlWs7sHgCX/ZYalkJhAOSvoHIaC+aVC1J
         TdXimT0USvscduImqkKYbtFBMSII3tCmZq/SZRm/klgW/9/SqLrkPJQEEFQfSQ3dW8HX
         4pS2jP2536jcAQOQWl14olAX5G01ozd3WYi1gVaFACgdMnqMOSYspvwW65hEtP4uE7vy
         ClweuBD35nvxQ2MwaLWMaMwGS0/WIb02qsuZaBBtoyrVj7imRvAeWG4dlzvRNF1IYT98
         7jd4sJPomoHqKJLsq+N9QqZqXJnMaa/Q5REAzEmldQSN6Oc9iGDsl7a+xZRws3SmLyC5
         GiRw==
X-Forwarded-Encrypted: i=1; AKwUvBzt2ByuY9bMJwIpJrsGLcOYoGjdD9QELzBqjgkF4sA+zNmFD9sPbu+wshLx7GUMjPmoPcCPX9GQQnHDmk0=@vger.kernel.org
X-Gm-Message-State: AFuF++kqQG8LsOASvJ0JmKa70JmkfvKQU8cfQwcN4y9OD0P82zzFOxOp
	Srhr2/aIlelZwO6T4tplPGB1vd/Q6grY129K3kO5fC+E8pO8oeUpqJCic7/UwCthIHAYLou3593
	bL+GZsTYDOjvJ6G6pS/BS7fTj2Pw5WsaCTTjBmX2MqN8JOxBYGmgNI95F00Z9aVnAtxE=
X-Gm-Gg: AYBFou26ys5kMwcjD0engMqJ31JWS/WD3lL0imfSMGVetWcm5/nFpl8o4hEZ/c1p1ek
	g8qaxEAF/UW0Mlf0Zv8hmfCDirkHyA81i0ueuy1jqnEdwN5chfHQDGxcFXoJg1hyBB/ZNEI7+QU
	iZFBsi5yjK50BiKyrzcqGtgDTbXfJdbsMOf5fw6UbtSoq1p/B+e5ZrACKaLMyLmr+troHrjGHg/
	8WWP9iwqcn1DEoD482IoEHN+rZwCCc29xO5CYLtCiRmQMrNw6p5MGJaiL1/cVeElkt93+KcUkAk
	IqRmoudwGJpvUM7Ch83kRkVOdwhRktPTuttAYpq/EozquzCWBPIQsKZYXmASKkAprlhR/QBz4YX
	oGJfvqtBXbIqMPQ==
X-Received: by 2002:a05:620a:4857:b0:939:5d22:d1f0 with SMTP id af79cd13be357-9396dead4a3mr2191183985a.2.1788856114745;
        Tue, 08 Sep 2026 01:28:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4857:b0:939:5d22:d1f0 with SMTP id af79cd13be357-9396dead4a3mr2191182185a.2.1788856114348;
        Tue, 08 Sep 2026 01:28:34 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm369414605e9.12.2026.09.08.01.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:28:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/6] ASoC: codecs: lpass-wsa-macro: switch cache to REGCACHE_MAPLE
Date: Tue,  8 Sep 2026 09:28:03 +0100
Message-ID: <20260908082806.648797-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908082806.648797-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260908082806.648797-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6a9fc733 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=_mTl3-Sb4fPHxIs9D7QA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX9C//mwjOy471
 hD6KvVtvhcnguISD1T0E8cPy+O7g8ox7/8ku/CE9dTReUPo8RPTfaS0UJKmBZ3t6TiUEpIAzEJI
 pAk8OAlOa6QwyIaIkNIBq2KVEGaBSPxEIqsosn+mtqwFY3D0MS/WSQu3+xJ0j8KBHdzJd9izsj8
 21Ym+BO5dhpDi6zZQQ8PsLxeRpvkURjMhupTKjpJgi/lqG9SC5Ef8mnqCdgLxl+wMRUNqWUszHX
 Od0MceQVVnQLHWxz8r4urehfqXaS7y1gMLM16WvwGc1Afq26Yr9aAV1SONbKYr6+ajJ6S9DT9vH
 A5sCTG3xs+D39W5MTUsXFx/9TOVb5fVE7g27NRZFNNBlSQ0fhTfdzzy9WcnJXgEjqoukoS5j0vC
 ltOTfUKq4BjW97CtHCg5xAymBk8z8QAmEQEwLHGReLG2n+kqz/NMVHEy7Cp85WTiVi2W9IhNRGJ
 hzxR5l1p+U9psvSGrPw==
X-Proofpoint-ORIG-GUID: 0qITSihpKJ0rOMZiq93zCK055uzvSkn6
X-Proofpoint-GUID: 0qITSihpKJ0rOMZiq93zCK055uzvSkn6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX/a9rmyijG4x+
 8vrqCia1e7Z0iz6SDkGXbjAkqNBob1sj+47vqCocnGi6FnfeOecI38gpN3tGYuZSjjfJOFN+ih6
 fvUZF5tnPJc7wBA7awFEfCf4qwKIPjw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080088

REGCACHE_FLAT hides missing-default reads by returning the zero-
initialised cache slot instead of doing a bus read.  The caller
can't tell that value apart from a real hardware value, so any
un-defaulted, readable, non-volatile register that gets read
silently returns wrong data.  Since commit e062bdfdd6ad ("regmap:
warn users about uninitialized flat cache") regmap dev_warn_once()s
the first such miss, but any subsequent miss stays silent.

Switch to REGCACHE_MAPLE.  A cache miss returns -ENOENT and the
regmap core falls back to a real bus read, so the caller always
gets the true hardware value.  Write-cache behaviour is unchanged.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 4d7e7e30f460..d254518634cf 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1109,7 +1109,7 @@ static const struct regmap_config wsa_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 32, /* 8 but with 32 bit read/write */
 	.reg_stride = 4,
-	.cache_type = REGCACHE_FLAT,
+	.cache_type = REGCACHE_MAPLE,
 	/* .reg_defaults and .num_reg_defaults set in probe() */
 	.max_register = WSA_MAX_OFFSET,
 	.writeable_reg = wsa_is_writeable_register,
-- 
2.53.0

