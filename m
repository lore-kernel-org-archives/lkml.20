Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481953;
	b=K80XFyKApS2/fuHt9ocT1fP2w7TUxLKujmHoOoimZxf6EJrX7GlKWpyt4MAceYxU2Xej
	 Cw+4gxsuTDGcBVqe10Kt9L9LnQK6nQnLfUYJr1bLbmfKEMppIJozDZJdU4+601XRDM0SJ
	 zhzr7G5eA/ysMhtjAz2OqZqT94rdXrEsgX66roYvc0cyfs9lfLkra+HssOCt+0jJ3gaWz
	 V62tQ0rFPjHBl45FtC6ggqVPspb+1UjERUrelEUYy3f55ff/1amHdxXs0UqLKfw/tcFRv
	 QID/JF7vk2imfmjJ/T3ePa/3iEW8k4JFI/jxwHqYAXJbMd20c0gzfE4atT0PG/2ceWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EyaVBfoPjvnSMo2Diw9nR7qJvmDk1I5n9dnvXC2rzQM=;
	b=gcICXULsFdgyFEQGybdWNw7sbgak/JXUzAGrCJZsls9ymlGvthUX6gSCuAaZx57Iy41F
	 zP3WiPzvHLrE3FjBZqOyvri39LCwUm55LmI9E/BRRMNjFsp4ZeoQ0D+1t1toq1yBrTf4s
	 qZ3T9z2i92fuTtVvxVhSRbwlSrgM+ZmOMdOjFW011Loz2jWTao+zRPNsCcduG/FopwzKH
	 XPqx7DTBhZhvQdCw9rPKP36uxOJM+QVK6Snkr1qz16SfPwz4Dfz2b5FdaYxssjjJrIVtI
	 xk3qTJyGG9lS/D1KEVN5gN2ZhxiE+1ZqkD4YEKkQDfXw3z2rrJsbBuI0ioR6pebKYaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHjw9wPk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RY5k3Vfw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E05606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55E05606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHjw9wPk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RY5k3Vfw
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tAkL3485726
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EyaVBfoPjvn
	SMo2Diw9nR7qJvmDk1I5n9dnvXC2rzQM=; b=aHjw9wPkBTJ0aaaTt7OQG4XQbHy
	ihAM7SSwPiPp9jd/PR4jv8AGXcxfeMcJSXSaTf6C/HBgzZlGhb9DHif6AUYHft0g
	bIDvc0vlrlRlOhrVNAM3uh+2o6gDtzfI/w4fZhqDHMv5b+btJWw4LadULgCyr6E5
	PBCWZlvUsXq6zhGS4gDwqgssG57HTYHRjMGdYHEeNDKf/Jiu5f49N1yK7ljpP/2V
	IAKDClWfq6QiASUVdco43Dp0PoCmOOHem0PM5qW/x6yV6VdtWXgSFUFeMZBe50e9
	yyWu5G3u3iRzttQGpXKVvfylxaHzf2Bkn+PssUyK6e4gA659dAoCCbIAAYg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1e19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1e62510cso707173585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481952; x=1793086752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EyaVBfoPjvnSMo2Diw9nR7qJvmDk1I5n9dnvXC2rzQM=;
        b=RY5k3VfwPH74jNv2cEz9JB+Tjv3DVKRJaVoEz0Fk/80A02R+I6K9p3RddB8GgYg/6P
         LzAsNAoHKX+Y/oRhq7PzUkKGsZvM9r+PmFt8Xk2P0C0CdjSk0xWRgmLgbEQhJ5SnjI6y
         CmZau+4Osn3MqoghV7tyjdqddrEebwOyrHeH8vkxDjtmznFnZlDEQgcoG23JVttSVO+l
         K3SwxbPBBD+p0L0hY6a9UB9eH4RIyclzWxAG3B0+YWhrPo7CilycPRyaSgqkFAtn76t1
         XWSLMxz2/OillcD5/AE34qt5AIqpLGVD0Pgg2pJkEaCcWELrQep3H7hCKN8lU7Cu8dj2
         dNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481952; x=1793086752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EyaVBfoPjvnSMo2Diw9nR7qJvmDk1I5n9dnvXC2rzQM=;
        b=RvTC7FyH6Z6PpzoFX4bKcz/udC673O9TV6SQB8u25ItfHoXDYq9092nmTVS2STyO8L
         8UOnMHk+6fltaHYtC23L2iy8vTfSIhVVp+ywcEXbw483LHanuTCw6VvXrreqcf2Pm36B
         KRE8UQNA38Vd3USair7rvI9UgmL4OdBHKcYorcnPxir5rsdVg3pMqcwYsgUJWyWvo1nF
         4TUEP9993wBIzAS8Mjj5emA7Phb+3iIcvJGi6i3eMUywy7rKFuhfI8NICjsiwK3ACB1y
         CkOt2HoA2zj4MhU9X2e/RDMV+qb92hibKA4kImDfbrQp1HnTqQPRBBpbqIgA+SNsdZbH
         XEig==
X-Forwarded-Encrypted: i=1; AKwUvByu+9yd50jRw7ScL7ujD9m6JJRgL0TxJTiCiNdiFZ30WO+PSkPdBGCcekeeoPvcuGmAGnF7x4FqgOCA5gg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZbrE663TfAq8Q8lIP/dH9Z3Ci7ArYZH804ESstbA/lwlOOy1w
	q+/NSMV80VGcNBW8UgehxKlNLn3oNQGuXxBjWmvlTBr4Q8fDTH4WQMBr7hxOoNDy5J8XoDjJni8
	qLEcrGETpb03XT4gJEV55Ce1Z6wzVC8+KPICVX77u/EffuGWgLFjQ+txxQQBcP7oyXQs=
X-Gm-Gg: AYBFou3L7XWbM85hX/5O96pLFUvFvfY6JtoGUy1BOM3m89eHRL1VPluqy56apHbMtGP
	g1pHaGRYb9bnUS7/r+ctdjfKL3M58oLnjcpeFL3dFujgX3xqOIEAZixI5+Scf+IMlPUorGjLVAT
	DV7mTWpNkZpF3UTvHbQ+5BQatKcGgWyRSWhqzBrmwM7vEV442MBFlD1/YHWK1OFjXBuewwFFdNr
	ei/GyjXPsDurr9aGVPgmkwIvP58JK0dPe8qX/MyFxyDnlQ8lndFKyiH+XhseThYGHeNcF75+xs4
	QHMPJMN7J40qQcxfytOm7nLjsR1rWPhTuMyvebvJvMmf79J8fESEI3ssjRQk22jepRZAvl5ZV8g
	8Xqf7CReaEqKs
X-Received: by 2002:a05:620a:2254:10b0:93f:2ba5:170e with SMTP id af79cd13be357-93f2ba51e72mr983915185a.18.1792481951395;
        Tue, 20 Oct 2026 00:39:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2254:10b0:93f:2ba5:170e with SMTP id af79cd13be357-93f2ba51e72mr983913985a.18.1792481950954;
        Tue, 20 Oct 2026 00:39:10 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208e0sm4566271f8f.36.2026.10.20.00.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:39:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH v2 2/6] ASoC: SDCA: drop pm_runtime reference on probe failure path
Date: Tue, 20 Oct 2026 08:38:52 +0100
Message-ID: <20261020073856.1177749-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad71aa0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7vtXEAv6VZJtN8Rt8ykA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX8fdlJlPypaPt
 EkNhkgpQBIWpJn3+pOd6RFuXiOkDq0BWnWTEMYMLLjaNvthitSGPVpTz+eOf75dvb8yahe18QYa
 5bzB5FLV/7OhqmuYA+xpyI5QfAZ3WeM=
X-Proofpoint-GUID: f0zEhipXJSNWFRgcfOxu3JHPU5UJxOUT
X-Proofpoint-ORIG-GUID: f0zEhipXJSNWFRgcfOxu3JHPU5UJxOUT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX4Q6wVZlkqFzI
 PKSx4RMqk8Cg3gFniNo2LNqYUbEdXvpOCQsTig14OBprn6RcgiiNSLqNp+sLsJsMBQJ7Wnnh6fb
 w1lxK7XvSLus7kucI0lKQ4oOilppJLwsrJMtgcoKZI1rkdSraHpntPM1TWlqoPmYMV2SUcxDSVI
 pzq8D2cMDz+jWdxgx+al7NHEPgzX6wkcry+3YZgCeYpdjE9yzlPb6XLr1UDkFcoV333TX7moe0N
 M6HK0D1PcHAuPjZdRBSynyvpzIDFSNRqv2Css/CegLyrqHnak4I4oPiBosc2opkr3kxyXmgwo8p
 BYNSSRxy2GMhrZDJSDTykq6ina08mEfAJ88vQGasEhOZmq+8LHsFPJ2LfZOQXVVfvvffFUayksr
 KCq3le7MXcZa7E9I5DlOutnMaigNAH1lzZad2yFcpmfro+Vv51oyLOkptCr4URZEZAkSY/3+lwn
 v6RlZ/9Lihtbxs4JAlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

sdca_class_probe() takes an extra usage count with
pm_runtime_get_noresume() to keep the device powered on until the
deferred boot work has run. If devm_pm_runtime_enable() then fails,
that reference is never dropped.

Drop it on the error path.

Fixes: 2d877d0659cb ("ASoC: SDCA: Add basic SDCA class driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index bcc660aeb739..ca311209c6d1 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -197,8 +197,10 @@ int sdca_class_probe(struct sdw_slave *sdw,
 	pm_runtime_get_noresume(dev);
 
 	ret = devm_pm_runtime_enable(dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_sync(dev);
 		return ret;
+	}
 
 	queue_work(system_long_wq, &drv->boot_work);
 
-- 
2.53.0

