Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44342DAFAF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377630; cv=none; b=sT5Ad5ZkT/E/N6a1yMmdG7KogUxP4BoVLQWocTP2qHLplOKMMgwujmRsxkLlgmSbWDx7ayXZAC1ez4+y5BZ30wj1jh3RfWfBkRBOIOKtMxfYn1HaBF9Eh2ZQ6JyhJ0Itwu2JmKSOvTiyWnZrox1DaVeWtpCrzmjdAex6O1XbuMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377630; c=relaxed/simple;
	bh=FFibmqjaTTp0azbD2/5lfm/ngI1GENEIA7NmD92VrPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZu75CrjqZHRhyIfiFqLxFCy93RtL/HeRDmW4JSpiVbZ3M1Jsve6tHFvY0pQKqS6tZBCOzubtVaEA4Xm0kR7T5qFhnEBTO74gyaQO4r0q6VSWbTg/0A3iF6lESChcsPEF6ZcpP1mzZ5o6k9UHVgGsMdh214Jhp4XUbf4LxtWUzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLFKLOo0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Novhv7RH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLFKLOo0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Novhv7RH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr6Rg1650766
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Zozg2cEJHYL
	XQKYdU4uKuodhSGwLBzeEuldBLj6EsgU=; b=DLFKLOo0q26OrbncUQUU88QZG2W
	y3M+K5gS1al2wODWXNVz4vP1N0nWAqJzrc7fzDguo+yXsSFRhi6aJmkT1y+AEWyw
	xypvzrLlGH05FLzvt1UvLZyMPXRWx0ulU6lUFw6aO2FrDgptM29iZMHmr7MJi0EY
	JB7BrzFvVvxsmUAd44/Wor8bCUECxMXot+QtC3u1MY5rfG7JvOSSGFyVUTIeVeT3
	Ki8+wfnvxqid5Iy3PGrxwfj+9FT2EYxyTGklHG7K/2hUYRk/ZpCSAxsJhSjNnzQ/
	4dzW+7dK4hHzwD/4w2WP0daoGEddQXApyIcZLqeJRwOoOZEleTlodfSkuqQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4sm64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:33:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso255969a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377619; x=1788982419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zozg2cEJHYLXQKYdU4uKuodhSGwLBzeEuldBLj6EsgU=;
        b=Novhv7RHbX8jNmQHuxjZZ9g/og0WHCyTdZj1qa7SOTXEACpyFo5vEOrX6NABV4WbDI
         H/La4VF7wSx9MfAA4xZemHadz2Y7RuKIs0SPrvK0eGfUCEoJZOOUhuPiFa0Q/La/K328
         ob2P6mkYnNau4KMKt0qWxmq2IABWF/BXj7SmprtPIUS7NB5NYpXQ8CP/f7nCyOzU94PS
         oCKwvv0Q2TWTY99u36r+zeF8VsWPlsLGlWEqd7/2AMCq/LBFysvBa9GG6XLTEvVLiKcv
         Ud5MNph42REbLMqlHAtAKL+f7H8HNAluqwngKGwEwXS5yjSKcT4mN2geos61xRt5cpvq
         Vh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377619; x=1788982419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zozg2cEJHYLXQKYdU4uKuodhSGwLBzeEuldBLj6EsgU=;
        b=YINQXvmvibhw0SGjwSpPGM7FacD5g8nNuZTsRDsbqdkBhpyjLqALs/MgNK1EmvGb6w
         9aAt43CaBRxKyA/PgN7arX73nsawS5bOEiN76dkurXEEtuDNJQdbajeEN6r/WcXXFt1e
         hol6YrHeokeu6cA3X2RvH0UGExH11WhLUG3dZk7GhIHjYYtjQkkynCsaCco0gxxQUZ7w
         7tmH5wZDR4bQK2rxK5bGhIQpuGzuf90Zivg1nRX6KG6Rk2K5ib/TL14t4cTK/UYIwJZU
         FqNP4KshpoiDtx6PWhJ4XKWA2HwEWjRrUWUNdLkJ+EoZZToaPsL6LahSlOa6h+QmxZ9U
         xs8w==
X-Forwarded-Encrypted: i=1; AKwUvByPZLgPGBgJJhMlxT6tzfnQI8L1IJl9LtPcHI/Mnk1/pmiWHflTK4ITMf/CVCquxn4U4wGOtZRJpU2ag04=@vger.kernel.org
X-Gm-Message-State: AFuF++mNfdmlXpt1S0kl3jfyVTVUrPgaH/FEnRXBMG/uKpSYPISVBT3p
	iUv4204yCLRgR0F/t6V65DT/RXAOFg9U83TGA7t4MPGTR2D/1jZtlICM6IB9RPTSEkeYm1x1dc0
	8rYIYuUe0Zh2pEeSCK8WVXqXXZ/bhqQTA44xbGBlVqIXqnl2pA+MGyAq+qOX4AQlYD3Cfdsn6G7
	c=
X-Gm-Gg: AYBFou25XMZetuLEwQky5nDGodOrV8HwSE9TfJhEJSpRDmUyqsnsF5p1jb/l9tswqmd
	JnNmFvtDyZTHsv1j1s+oFhUeMREdG8Tzry8Nq2QxjIBCtAznTIIUAmuWdblTwEYvYBjGJ5qEUli
	SJVp24AwqbABIOwGSF36ttF6ZhjU4OY+tFc7v6B0h0/AFhRsRwO4hJGHkvId04l6IfMuRH8DKXB
	1ocFJQS43GuIAVFObFvqadHgVOUWbHVo2PdVoVM25bAj8x9ysmSXoTsVZOC63n3o/PistIRm+A7
	EpmB+i0ia/fcW4VzMG+CuIq1jmSWZnsbS+I31anyLa6gG+1OB1868Q8S3Pc08PmKNAVGGLu4E5G
	+0CUXwyJxq9j42j86q52eAS2hqlk=
X-Received: by 2002:a17:90b:35cf:b0:398:9beb:a2bc with SMTP id 98e67ed59e1d1-39b0881d765mr1404423a91.30.1788377619325;
        Wed, 02 Sep 2026 12:33:39 -0700 (PDT)
X-Received: by 2002:a17:90b:35cf:b0:398:9beb:a2bc with SMTP id 98e67ed59e1d1-39b0881d765mr1404366a91.30.1788377618602;
        Wed, 02 Sep 2026 12:33:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:38 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/5] remoteproc: keystone: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:15 +0530
Message-ID: <20260902193318.1996827-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfXxAx0Zlc+y0mS
 E0VX/hWnhmudWoaobkz4y4pJlaMdqcvE5JraTeKZ9h8vp+0U92vUX6UDm5ew/GqxUl871wW1Nbv
 HULk3Oq3XcLkwmXfDMhGNXN0sTXeYz7fh5T285GYtimNdE1hrjyJXXaXa5yIzpRFE6EjLqqAm/E
 n3XincZ/nPGQ5KMxmIqYv//eGukW5hFAm25/YPxEZ2FcxXIyixbwHq4kgfKr1SiuMQ0ZI90kbAj
 mCjdFtqpAPIyH4joLstCYssgJ1zJ1XQyTtWcU/bxzfMDtjWPbi1HYY/1TJ1OgPzFkoxCdUJ0X3q
 tl76dDk6yd6NKss8CiMT2wWxCa9myrGQanVbywlnn3P+FL8Dq+fzqNqMdPEdZRWsmyXYHk/khX3
 9Sig1rQhmXfgaCTrnUzPAogeSdDwPwYLsVPXY5F9G1ndw3RHTFWXMIvAC7xF7wRsMoWQc9bFm35
 7ZeR9rsOhm7KEdDc0EA==
X-Proofpoint-ORIG-GUID: _8iGKyNr-IPYcoBJzJr_sxMoxZzaC3bZ
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a987a14 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=eZD8004roD30yaJJyL0A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: _8iGKyNr-IPYcoBJzJr_sxMoxZzaC3bZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX/0G9cqYzmfHb
 xy+mND9H6YM7EMoug37LYYlAIY1grmwNRjLTYLAr4VF2jAWZJJbkBF8KFtG/1iOd4mKY3mceLUw
 89yU96EkquypUIDmby8MO82EJv1a2tU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020173

Replace the hand-rolled keystone_rproc_mem_release() devres action with
devm_of_reserved_mem_device_init(), which handles the cleanup
automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 407d6034f748..d390f56b4994 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -330,13 +330,6 @@ static int keystone_rproc_of_get_dev_syscon(struct platform_device *pdev,
 	return 0;
 }
 
-static void keystone_rproc_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static void keystone_rproc_pm_runtime_put(void *data)
 {
 	struct device *dev = data;
@@ -426,14 +419,9 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get gpio for virtio kicks\n");
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_warn(dev, "device does not have specific CMA pool\n");
-	} else {
-		ret = devm_add_action_or_reset(dev, keystone_rproc_mem_release, dev);
-		if (ret)
-			return ret;
-	}
 
 	/* ensure the DSP is in reset before loading firmware */
 	ret = reset_control_status(ksproc->reset);
-- 
2.55.0

