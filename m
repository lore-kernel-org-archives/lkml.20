Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EDA3C09F2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379697; cv=none; b=kz4bPCv7C3aYduRHG06E4GFLEVMXMLQHqHzX8Q6GHci3oex7BJQDUlKRxq7v5r1ARlzSQ2sxIYaAWlj0jBiHqLV8uc2ATwpMwWzWlzyfGXGGqoukCImiJPop6JCds9bB5+ldPvtgNTt5NVpfBui12h5e6QfRKjPwMJ6k46TM/GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379697; c=relaxed/simple;
	bh=C0TvK1tf0KLvXbbBhNT8Ocws0Ga9btnZtn4piTCQI+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/uSsHurLxIAP+5hOeg84FZOFNELshIJ9q61WVr+s9X0EaYuFnOFindMT5qgmPP+8lv3L+gIAuldi27DpVBNplM2lQ2RtfoXEaQXLDpnUGiORhtpuLFZTw8b4SHWY0fEPcky7dh21C6YV/Ptt0t2khxf/Qy6C6ShlLHRA2aPr2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+qVvV11; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tiry/9/8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+qVvV11";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tiry/9/8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr6hk2209801
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 20:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iYuD0uDqzSw
	HU/LAQJijWaTr64DX3VL/giE1/pE1aNo=; b=M+qVvV11pixl6KhVG9hStD56ULl
	HhKND36J+s25d8SnWLfEnCsAY3W2C+ZhwEZvtp7qAul1VrhtgDfrrq4DaqJ3ZzU1
	z1zZQu9vbVN44CrHCtmJU+rAK+B1f0vMgFdTAr7FwMGklBBSqneXiL8iZGWwEqXh
	UKPvlcpUK9dyrnYdJkNRcw7esBUv8iKEk/AQRSCskMJq0bPHgq21fdTbJ32poy2+
	nMQeKmQOL7itoHtqWbqTWimQkXWx/kGoao7+tLDMxjUAW76/aGKeVdqzanROnKgS
	lo+j+Cfv5Cx+MfNlIJRB/dUJu9xj5DWvLtvOl+rDuVSDntH2ZqBUk0bbQfA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s3n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:08:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso1861093a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379694; x=1788984494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iYuD0uDqzSwHU/LAQJijWaTr64DX3VL/giE1/pE1aNo=;
        b=Tiry/9/8WQgvFZewA2Dg7qbXJdg2YSILS2CkJ8HMfcVad3x9xnWBj2P8QuYZID4XHO
         zmbL1dZnKEMvweSvGaWVbRVz2DuzP2/5/0z5PcNFf+IuekQ3+eK8/N5et1dclf7fAj7b
         jA5YsFy+cc+xhlLmXF3//LDTpgXP9TyYFzDPni/reM+oJsxG0CV4tXGq/+oWGzlUqcEr
         zjq2OUQjSRPYUn7HOJVJIFQiLdaI7ivTE225bh5HHAEkJyfQ7xb6NQNdY+echpf7JLMC
         dA5WueRGNoekxutNo5GLokC3TxJWFi8aDGy/OucgxnRE27DKpOk9+EAlfxPD4LaEa9MH
         kSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379694; x=1788984494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iYuD0uDqzSwHU/LAQJijWaTr64DX3VL/giE1/pE1aNo=;
        b=QDeNvTpTpUrMG3aIc63gAffAZjxzcztp6GSAbNvWW+wu0afZYqle5JqnxBTiNx3GuT
         Fgjw7mSiCirGhtfKWSRz8OQH+tGrr3PZXrbNwMhVr17CTnFXm+AJtBhQTU14rkS6oHM/
         /WXzbUPPOAxp/u3wULnl7VvEiTBUX78Vn4XByY4AzxE9nPaI/2UJzxnTOMV/MzOElSy1
         zKj7F0p+zHoTNDUhhpMGaQqwTgA2G6+1jm9SpIu2WGbyFst4Jh4IDkZBVFh1YXjtB8yi
         eFMJv5mqELJt1v1i0gpBFEIfWrlfM144Nsz60vRb8nXQ3OSLUBGCmKVbDnjXEvdGiWTh
         RBbA==
X-Forwarded-Encrypted: i=1; AKwUvBxQDbT6kPuFcbzd1WNXVQeI10k6Y8iyo0MkEx2YombGzWmiW9y2hb+MX0Zkw+lBjJrzYeeH13Q/GVlzEV8=@vger.kernel.org
X-Gm-Message-State: AFuF++koHY1JxLLZE+ulv5ob2zAQuZC+gVddDgKN6jz6DBi1GMwHghr6
	tY8upA8uO1FRltz1Tr8F3YoSfvZ0CxjlUH36eHIYgt2DGlCTwsBzBGShDmDRE1CJxcnsFoU3fF+
	i5f0pQMQ/BJcd9bdn6aJfqsgb0g7/L58rOSic0zefAa+mzVRXxH/MdmCcA5E5oeFKxy8=
X-Gm-Gg: AYBFou0iF7DZjctugERFjnElACs2vQIBu+W7BLNz6HKVS13DjDlmO3P1xc2vcWYaX/u
	nE5H9E6Wq+3W4BktgSDzyihtZ6FfKQOXZ1spZljbHCl6i87vcUBaY49RIi12q6BuZVuavq3npeF
	mEKtKEFOHzRVuRVsk1tVvLoGLSoSQqOYu6mzKklH9Uco01hpSrsL5vXCHFEpjcgyGM6+chtSB9E
	cvrI64wDghyeO97dzePbx6u5A+TAN7TxXCSV4+wRDaEuO1xlr0386wkUj3FCSTM8A8mPJg8gli8
	5Npwz1BwVb1rIYvHw9LsYLcm4rOBgjIBfoCSxmccRJusDW81z2g5myYOLaOlj9M5vFzlj97EA9y
	4qxKYScQ79n0w3i3J9ucCgSMAIhE=
X-Received: by 2002:a17:90b:4c05:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39aedebf901mr10811253a91.3.1788379694184;
        Wed, 02 Sep 2026 13:08:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4c05:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39aedebf901mr10811125a91.3.1788379693552;
        Wed, 02 Sep 2026 13:08:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:08:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 5/6] media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:02 +0530
Message-ID: <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a98822f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=gqQKJLWYzfjTGvuwkdcA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: k3c_jKdxKfc7fBC6z0Jzc4M_UG1t3XJ1
X-Proofpoint-ORIG-GUID: k3c_jKdxKfc7fBC6z0Jzc4M_UG1t3XJ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX5j6WtQ8AM9jw
 PJ43shoMfmiiGsTfuJeN7ihYVcTTdBPXEzfwq43ZmvrhnMbtpuQXx9DmSV05ozDRiAPZ4LQrZD0
 F4YdZyT2KHudt45f/37uDpdq+TKlJRP/ZAo5C+zCz2uyuLRO/K7/op9Qe72InDF0SnP3Gz3d22j
 5a3tr6FW2xGgp7A9qpo3PM56ldHZSzScyc4Oluq08NLZ+7C7Pb8uwu9Hefzc4YxvOdns+WN8lkv
 IOjkS8vXMUGvf40XLk6s2Iio1irgWGaoOK15y6q0evx0PaMafXca9FX0V21ruvQJH8I+pkKf8Df
 JE3qfO33lb+KexsUmRTIUgLvhG/B1VISR38OdU0hBlzYBBwyq+WcWwn/6ie0VVwrWbq77nrqKd8
 jbI3R8lT9z1sU/tfAnAmQ4xGs6aTnFBTPLNaVNfAJuwYJ0eSlcnRwbSqQzR2qL9qfabJp6NInfM
 YoQNs2bO6qldZ8NiFIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX8ZLzgYyzN1j/
 JWqwG7r+4sM8KVEyTbVA8N5saTlK3/TR6qjLtGwfU0C889B6++ZMwv07p0eMdGBVz5k9SX52lHl
 5BAZ0Y4JahJmfYLbad901qNvSw0Kg/c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..557bffb2c2f1 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -888,7 +888,7 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 	dev_info(dev, "4GB mode %u\n", vpu->enable_4GB);
 
 	if (vpu->enable_4GB) {
-		ret = of_reserved_mem_device_init(dev);
+		ret = devm_of_reserved_mem_device_init(dev);
 		if (ret)
 			dev_info(dev, "init reserved memory failed\n");
 			/* continue to use dynamic allocation if failed */
@@ -930,7 +930,6 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 free_d_mem:
 	vpu_free_ext_mem(vpu, D_FW);
 remove_debugfs:
-	of_reserved_mem_device_release(dev);
 #ifdef CONFIG_DEBUG_FS
 	debugfs_remove(vpu_debugfs);
 #endif
-- 
2.55.0

