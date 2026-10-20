Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481961;
	b=QC6s25LeYqxSeG84yOEAfk+PHJcnsWCy8ie3KHAtZCsi4lnInpCkCcPBNFlU0KZOutgm
	 E6DKdbWk9Vk85gNwRb6/ZA1/5UQT875C1OcLjef7E6jeLvoTzSTSqDhslni+SN2TYxxPE
	 5XZMyK/5WX2tPsWCEJh2OoPsgoA4EVybyzVp9N+E5d4XWi0jly/XdmYsfCn2wUKh6WJac
	 nU8KbPD2o0sObaByok8zelugx22ljhK3rSN90Tz6VEBvXDu7dVncDiU1XBF+fF6Evuok4
	 ZFK6rKCPofrUCwrs7K9LyTpvtR08zUL0qiPcocqcF3htOySPm2Z8nXDxAYqzF3kYEHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481961;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VgK2cMLsx+obslnqu5sYrnrzY/q9pv3tI9Vj5znR6zc=;
	b=tlExPUrHQ9h4i/nHuxnRG2oeS7A/uKpZR5tJTx4Q4fYfyeNvWk2sl4rpc5mkxYl8TJ49
	 UBGM9mhtKGBeqm2xQT8O9qJg4y1sOA8vfRcq7vxo9cgEoTT+dySd6miZTQ2n/d6YNvC1j
	 1xtJWkqjWhnTw0tTeAInwXZvJcyifP88j7ye+ItDBcjYK3hFencQM5RtqJM28b5KXpvtT
	 PYylxoqXeLYk5G39YQkcNP0LbQ/5PeJIG/XnhrFeX1CM2vyQQznmERKt+EPcxsNBhWEt/
	 iK5FFxR9055PgQL/fwILbdFo4YUI7KpQvoRgNTC1Io5jmgIEk2E0kVeeEL2GEfEh4BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ahIuoD11;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Azf8emJA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFB360A262C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FFB360A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ahIuoD11;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Azf8emJA
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tBF32877684
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VgK2cMLsx+o
	bslnqu5sYrnrzY/q9pv3tI9Vj5znR6zc=; b=ahIuoD116fOXstk31lDWAqcUl2c
	d9HLvw7XoiG+xdPmPzCdZ7vTt6TFxsnb58rMI+tae31LlvxJk5d87DRHcXiwdefp
	V0EGRJejVm5imVGORfkfcEivb1HKZfjtxAMQ432rrL4uDcrJA4Xw0t40VaakucJb
	L8jeTUbWGCpaOIdRBVj7bmSDTdebKP+h+zCO4dDpSsX7VIcGaPH8chYYxZL0eQxT
	aiLnjBgaNjx/8NkfPNQoOB5RY9FEIm9tfDNfVfT3D80xPWsa/EFcDhF1QU5Ay/Bq
	s4/3fluD3kyD617vP7+l0C1Lyk/S7+czMIcvBK60rQnD3zrmcM0opv+UenQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5psdwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so762855585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481960; x=1793086760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgK2cMLsx+obslnqu5sYrnrzY/q9pv3tI9Vj5znR6zc=;
        b=Azf8emJAoiw15maE5HDW/GMy8BwaGCiEO6QxCS52EaeR1cR1pMbzDpNThi7Fh+bQW8
         0rsnzIaSyvG3DECoPPt6aXEtzbCDqa8cAyBparKUDbPtesS2alKLQatZ3b7CRtleJisK
         lJWiuavugiqWHKhu9tug84JWCKP9eKPIWvqCX5JC/lUYimTj8IxASJJI3qjMToXZRa5w
         RyGYBXrl2vv/A2BRFdnwLfJ2Fy6YSA3pCLTfSyzxqTwjy94DFn1fRUxPaB/5FnsPmx7G
         hA8wFLM5bNXV/OpnuzjCuPpPoWxabcpSTaAPl2Y2mzHFXdcXrSaaF3iVwa9mdEbGZF7S
         rANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481960; x=1793086760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VgK2cMLsx+obslnqu5sYrnrzY/q9pv3tI9Vj5znR6zc=;
        b=n/Xa8EUnUv9S8TFU9oVpumXpL1cmTfyNpTFnu5HfPe+vUG8AEwRK80oi0h4J9lm04c
         J9rEgW4cK4TSNFQyPDQNhc3NgS2Ltd13f6pUVAD36Ej5dujaOWqbcq8vEmLOPimlFDNG
         5WuCCQmCli9ea7dcKlAc1IJ7rJdFTgnzYaD623EkY6AYFRSfRLMixwyKk1kRb2WCvK63
         /4CnXgvZ5jVkkZewb8G2U6AS6+YXwxWEMs1llPTKtKwmOx+5jZW4Z5FfmJWAjPN4LEFQ
         GHCwjFQGn/sVtIrWpS5WQUZRmklHsG3azsQNCy/XQBfNbQwGtCJEnWp423EtOcZazmNr
         i2Jg==
X-Forwarded-Encrypted: i=1; AKwUvBwqCkUz3dMCRk95kPl8ixbiijPEhsxsaXqKSXp2d9fCpAHSBaY+A2C4pvFOCFvSnj5zKDAK60r9Otz5rns=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQk8RFd0yKOSoqGaMaJq2qRo+pnsXSB5afsVt4f6I+fzXSwytL
	7D9d0LTaWnAJ6UM81xKSTw2BglYobFziJEYSLawwd3V2VXVSiKgoLMO8M+wSyfxNIk3//Rkd9I+
	2DEQY2gHmzaGA3/aDhnidZbwGlROJ3rF4QpDx3X2q+OjdBYkE6lFM3GcG9iiDur3u7HQ=
X-Gm-Gg: AYBFou1UgkZNHGIzbncQuuVfkMW/u2QVu0cRMOuW/CaBBl6chBfh843luAeXZZ2+lkm
	eBSFUuXHYJ9Nthu/OZrJSK0l581+A48D/7fjjSQUHBDlNqRsEqvIyuACvjKpnj8WLKag+Lhafqb
	fRzGIzvSNO8dqIaHbLpun4j+zheqHfURiwq9yYqWG1XI8sqwsTPT8BqYCk6SzusngJpuK5kiIag
	k1KBWwyy6qqnIrgMI3l8c2H4De9ptQaXQWbTofEgKda5teOXKy/PlJFCar1+IIHEdCMU9vP9czr
	RboQI9hAoJfOUJjjiCotcCGpndPbsBrS0GICoJlMeyAiZfnZyEsbrWwNEPMP/O+0m1ihZfbYSVY
	r2kycrad8U7ZG
X-Received: by 2002:a05:620a:394c:b0:93e:5861:34df with SMTP id af79cd13be357-93f29d7be8dmr1654905085a.47.1792481954677;
        Tue, 20 Oct 2026 00:39:14 -0700 (PDT)
X-Received: by 2002:a05:620a:394c:b0:93e:5861:34df with SMTP id af79cd13be357-93f29d7be8dmr1654884485a.47.1792481948317;
        Tue, 20 Oct 2026 00:39:08 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208e0sm4566271f8f.36.2026.10.20.00.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:39:07 -0700 (PDT)
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
Subject: [PATCH v2 1/6] ASoC: SDCA: propagate sdw_slave_read_prop() failure in class_read_prop
Date: Tue, 20 Oct 2026 08:38:51 +0100
Message-ID: <20261020073856.1177749-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad71aa8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=w1d2syhTAAAA:8 a=EUspDBNiAAAA:8 a=jwOcZKWdBhvvz7EOEfMA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX6EbdwVYu1XF0
 kAl0IyGJ55PBP0L5a4JCVsbXzdfgBcBRm+e/mdIBQ5RyrirvxdIrSRfwkg/9j6LJZ76YBRmq0Rp
 cXFaa3UUFbtLbhtE0QbKrDqlBCmBlp6+CupcX/qxFLoGnSc8rG3jLyWELufVPJD18ouG/5y6HnO
 jRJKR7LFSzEu/C/LwroWsfyI4vrVWpKjwW43GSlPgk7QpuRx5hyvGEIsdRsS/YUfPfBLTzIgoXF
 UWm7Us7WbVEhIGhGqqR1pjrFqBgG7x/c4bPYLxskX34t2Q+e3n+deRXveviztzhL55MiLsG7cXQ
 zYh6G+EeuHQzPWCYl66iRiy8FKeKNLfyF6vJAIZBJrbKcLJc3zdJXQVMGTYYQIPU1fmkOdqo/gY
 NOBtWTXkuIRiSyD/IxNiemj2N/GXzow1LkYr59ycaTz0VNMJO61jKjWTKp7z+Vq904RiCAeF3an
 mVoCEXz7FEARKgiIDzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfXwARNZ9nGqry6
 Fuyr81XEj0H3Kj5qX4ZP3oCkhzUhhGpyranhXwSLp7uLMwP0FcT6kL42AR7aSoZwEuEdLOViJBn
 7bu8j/kkYeq2tSNrSFaFW1q5LNL12hI=
X-Proofpoint-GUID: lpAPlueaUL4Fkj3gV1ukKxKtWqSxGBww
X-Proofpoint-ORIG-GUID: lpAPlueaUL4Fkj3gV1ukKxKtWqSxGBww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

sdw_slave_read_prop() can fail with -ENOMEM; propagate the return
instead of leaving slave->prop partially initialised.

Fixes: 2d877d0659cb ("ASoC: SDCA: Add basic SDCA class driver")
Cc: stable@vger.kernel.org
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Assisted-by: LLM
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 79fdb672be1d..bcc660aeb739 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -27,8 +27,11 @@
 static int class_read_prop(struct sdw_slave *sdw)
 {
 	struct sdw_slave_prop *prop = &sdw->prop;
+	int ret;
 
-	sdw_slave_read_prop(sdw);
+	ret = sdw_slave_read_prop(sdw);
+	if (ret)
+		return ret;
 
 	prop->use_domain_irq = true;
 	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY |
-- 
2.53.0

