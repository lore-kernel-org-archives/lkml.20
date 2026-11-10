Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319926;
	b=T9fb3iZwKAt8x+OPy3+AXWW23Xx8y9uo9bI2SyhykHIbwtFQeiYhyFpJlWlpWv+2pfZe
	 ZznLEdio4FN024L7sKRpVAfgk6Wc/ewKgYodtT6XXE+xso8AUsjqn00W85aWAPBaW0GnE
	 n4WzrGUby3ZOb+yYop13GiqlM29kuMm9D3ouVCk0pGOumKvjuk+xPrzDIVHGLO2NuNi0T
	 WgIFSd7qlHhQtmyztUBvCIZ4fxqhm9hW930Tdbbo7/T18WMLfbdZH/5rTDmJvDm3GL3L/
	 4hUOdvwKXPNwJ/ZtenMrfoZinJEmyJrHPzABcgBjHbG4k08IVEP/r70N87hwnqnFunA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2mhps49jkazEfpgVWRSAiF/UKHaCp2mrSjBq5r/twrM=;
	b=eebDDkDs1LZf1C5AUIezVn3mJyLV3ymdGplM7375E54E4fHcVAp8K5oZ1GbWB3VwXAN2
	 Uguks0WyJB8KGdofVgft6mZzhQ8mf+Ta318S8XYFzM7y4DKUouT/gJdJ/EbAkRJfYe8Hq
	 3Zct2QBE3+DE5pSdxD09fxmdtJreNhbmkg+0w0BjEP8hQP2JOuy4WITECOqPTQqvlElaQ
	 ClPLEdiRwc4GV3RdbHzPBdA2T6KPv78QxWPePKRwMEFWpNCf3X1Q+olEZoGzMFTt+QLb3
	 j1o3JnuSEhH4B2HXZ+3ySBDJrhUg4xKn+ix/ec/keGCKqKuYfZcV+XCBLs4EhMkwTBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mM/jPauF";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QMdFysQK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E42660A3832
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E42660A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mM/jPauF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QMdFysQK
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA6Ys3217056
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2mhps49jkazEfpgVWRSAiF/UKHaCp2mrSjBq5r/twrM=; b=mM/jPauFksBQ27Nl
	vJFbuBZBpaRX56t6K17dYrYBsf6PnHvo7BS7hnwhdoeOvnliy2hNNkTEcOhDvqwu
	zn9ugQSwBs94XR7EeZWmVjQ5tnY1ddU+dS2+g079Dzn/wbCYbYGem9lbInM0mpvW
	b6n8dwl9sX+5OjUuEDTmmXzlPezQ+s0D2ogzz0UuIP4JY5UksscN3meF6Z0q2o35
	KrWHTQie4rju/XEOJau+cMjt0cfxWHwhzU4a6SkFScOtK6CZP1vxFGCwX3S83hU2
	nGAQI3mf4E68iv+nJy0vcNk/3N0cE9UGuRGbj6jO7863DLWCHw/514zb3FWT/Y00
	hJSQfA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtda07n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:12:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36efb506f29so2082580eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794319924; x=1794924724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2mhps49jkazEfpgVWRSAiF/UKHaCp2mrSjBq5r/twrM=;
        b=QMdFysQKeSuRHTDSWYxfErRMlVSGw//aKZDn1sFdUF1S7euKKW7u/53iTNzDs6xkG2
         JuZPulbn1yAOiq2+U2fDkYaaZJ207l30BIRvxKaRbEkRyRxaT5BpCO0/rT04B7nwFtDH
         Wg3+LRwjfwJqQjAJ2nIlUMkzu1r9hcMvMQvy2CX0liuUbFp6XMyoB0NkRrAbZ6pQbRqO
         6tIIW9OK12xqfT4RgmzWnhuq8KGe+zdu/51c1mjqbgc+FLjzrJ8xzisAqqEl6qkz0Ahu
         EkydGgcy7AWuqz3OolDOmRsWCHXtTDABgfQAt0WsYh3P0Wu5oDEFO6uJUiY4fJw6lG2B
         7mew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319924; x=1794924724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2mhps49jkazEfpgVWRSAiF/UKHaCp2mrSjBq5r/twrM=;
        b=uYRUsdabMZcFrul1iMTWrc4nRH0Q1yMEdx0xnYvcMRASBPVDMNoka5tM+UjPj5NlWR
         7Bhh+mEweUovubEgc1JpWeAPj+eYc04oDido6PxUH7sdXtBaNkN7RlTaNQRrUmiW0zw/
         ycW0H5SW6sO3Se7bOAnfE5laE4VaXe8XVsKabJmR1gZf680Gj7GbeVMqVCzfMIvtqGM+
         /ra1x97jXC0rIXg2ITnmBca+zRo/7DKSQIc4B3duBLzL9fY/yGtyimCnykMd4khJ6jSs
         SWvx/qB9IWF870ciu6EJYPb7YVL3dI40SibM8arSI4pqnyuKkeSCLQWHYX5O9iw1UZtR
         yCoA==
X-Forwarded-Encrypted: i=1; AL+hErHfm2o8oRULhSiJ+QbCjVqQ+VJNklr6P4waWwynrES/pNOyrh9eKrxKCqBGGGJzuLOI1IJ/XZSvlQAycQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wTOU8r+I5JutjptmkxCJTvC6Dg5SZ+pXBWawEBAW3Ev3Z0Pvq
	b4N5gA4de5Sresou3aehtT5j+iVYERznCZJHT3gcQRH/Glw3HNbfqzalgq35gw526iqgYfNBgTL
	Kl4L46zKaASakjwdrqXle0OFhfWOkbdxm5zDyCAcjPIqVlO0EksZye9LoSVkda2j3jro=
X-Gm-Gg: AYBFou1KL31sr7aTq46gQcbuoR8aD8a4eV2diDROrzS4F5+g4tACSqswxrqvvr/aMjN
	ahkiWq9mcWXQno2EvoAU28ZsAOl7xu2O2aRR1bQpnlW8XsReUxVDcTmIgZZDEApG/tyKU2jy6AD
	ceQYIXXv0o+okXrqwHVNiOcqzOqQzejvZWXX5CHenjc631TXv8dBzFP22XB2UFv2yNLDFPiN5g6
	vOjXhc46968f+GB+g65tA0f7BHRMILGfoW7MUIvzQqMIHVxkpRtUXJ2vuhS9wH/xljRK6oxVU5Y
	WwUebo7xEBLEhoZkw5lcVRVrB8APSyVx3JayDbtrL5/CHgbj/ricJ3G42iW+1hQMgNx8yS8hN4s
	XrO8LG8Lw4sPPOPMDMLm8WONxH3TxQ1+QBTfukYaZTm8MZ3NfAq3R95adt5GjpeC0nqnxxxuBcq
	HKp37wHQU=
X-Received: by 2002:a05:7300:cc83:b0:36a:18e2:64c with SMTP id 5a478bee46e88-3751eb8a9c7mr3451766eec.11.1794319923883;
        Tue, 10 Nov 2026 06:12:03 -0800 (PST)
X-Received: by 2002:a05:7300:cc83:b0:36a:18e2:64c with SMTP id 5a478bee46e88-3751eb8a9c7mr3451676eec.11.1794319922726;
        Tue, 10 Nov 2026 06:12:02 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm8059128eec.27.2026.11.10.06.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:12:02 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 19:39:53 +0530
Subject: [PATCH v2 5/5] media: iris: Free the interrupt in iris_remove()
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
Message-Id: <20261110-iris-handle-unbind-v2-5-86d5f6f1dea8@oss.qualcomm.com>
References: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
In-Reply-To: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794319890; l=1091;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=jIb2ycQ3moYpdaKxeD/lr+k+JtQ8YBIbnmK+M8ixipI=;
 b=TbDLgkOUwKMhe4NZ6wbIy3aRKhV6wvsT4DQz52wV913++1AVqsyHCTkZJ8guxxsBmE646qDPd
 qRNWEfzSd5GALHgQzZuwWrBPCzsFo1GP2Px1FeL0mpfUltKUfq5GHvM
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: jIABZ9mfu0rIHuqZ21Hw1F4RbLO5b7Vi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfX79OD1SO725sA
 rLIPC8zqailBvfGHUDIUtBZo0FTEMtm5vHNZlmM8oTzbyHSn58YmcEJXIE9/Cfs7GXjD9KxDw0B
 73fpmMZMaIAltpmWrG1OlB6nRG2/74g=
X-Proofpoint-ORIG-GUID: jIABZ9mfu0rIHuqZ21Hw1F4RbLO5b7Vi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfX2aA9UzidZRdh
 EITluCbnXKkKY/+CtFWqw/W6FtcDUYAupEoAaew6UzvQGjUhoxfGcGEaYmPM9DL0zXBa3DELmu1
 7nJTaJfzUPvG2UdB+xY1pGSOKBYvoY+xUygHIEYDdbOiCRJagZEXJkMLTMrh72bcD5kscbhbeEF
 hrSEiL2JZ2WnJ/DmnahNhE6XqlWXyjffDSHLnPhnsVajxJxAvl1Ow+0Baurcw/lxBfTioYcX7S1
 YLC+9vyJERYSTgAU52DTZc7kz32Nb3ZrFcWpZsHpGS5mWMvG7v6hPlRCewqSNLwC1xNyhW0Abjb
 T6ic2wQzIWWMOwJUSXZQ7ZJWKBXXAlpgiXEq7MlrnLUqWsI8kAyxg5LgtITDrblC8pw/lLNFVNV
 /rzC1oCfJsAEfFzvVAUg7JYYiXB0r01wNYr8uUpYI8KaUdPwGJQ1LnhN8+V6AB6Qry3TBkVTmtU
 akrgdlMebCORRgNv+yQ==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af32635 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NKppu6mipZSEaVxE2m0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100056

The interrupt is requested with devm_request_threaded_irq(), so it is
only freed after iris_remove() returns. Until then the threaded handler
can still run while the rest of the removal is in progress.

Free the interrupt explicitly in iris_remove(), right after the core is
shut down.

Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 51054862bc64..925a450a8597 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -292,6 +292,8 @@ static void iris_remove(struct platform_device *pdev)
 
 	iris_core_deinit(core);
 
+	devm_free_irq(core->dev, core->irq, core);
+
 	iris_instances_vb2_queue_error(core);
 
 	pm_runtime_dont_use_autosuspend(core->dev);

-- 
2.34.1

