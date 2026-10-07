Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AAA466AED
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363658; cv=none; b=f5RX+SX8LrZ/eIcEj9ZcORRfX/REGwTEsGh+5JWSOSkFrDMfiVb5TXC8LRgyqPS0iJdyoMA8qCCFFhYsnxdckqp4NRhpC6ObGbhOEWs+pnsDwBReOzUJ+yonsD7Qn3WLvR/NcdF6KbdUvTFsAnc/wJx5ttusAaLcY/E0NiYnWhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363658; c=relaxed/simple;
	bh=DPgKLvB2PNcWdmQvkIzprusFWSgbJAmy+ICrqd4Fj+0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VC9Cn11YLkepq/wALRYKcg6lJrxitsv9amQAVzewrU8wCbEUGW8vb/Q9En7YWPV+REnqawOIVkhBk+Utawb4nx0ZcoWfaUnsuBtOjbR8WpEP5azOUzdNNE/lz2V2MFkhL6zR6BNTMQ2LFcPpp0VlOXXrSBeT75JYYJh7O2s3jHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itMUy/L3 reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itMUy/L3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jjD3151975
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XU1FwuBtbti
	AGCfwU3DbkpmUGr7mhTNOJFzOVECWXN8=; b=itMUy/L3SRtQBTA5YPer24nNTW9
	qUUPFiOqYNNGvFJMTxL7j3Re57tgl0hmsQMs5iYpDL/MOh2CK/ebiCq5BYOh8PdS
	AfgZ18Nud/mi57+PTN7JtltE3tlOIATi/wLjpZKXUz3mLog4PnutU0y4msrDZ1of
	D7vxe5R5WyJQrZzxzON+ch0Yqrair9If0jpeb+a07vx+GcIPm+zMB7Q8cKBpvMIq
	6sDPCToiGDPCj+sEktkp/0AYxe+tdUopzGOY9Ec56qrX+uaqJtJ8T7mEqZY41Veg
	QgZTAEegKLsaIETP7YYPnX0k1/o+3xnPzRxxUuwkdAui2g70a6Wg1XLflJw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c719bqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:00:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb71b1443so721323385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363653; x=1791968453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XU1FwuBtbtiAGCfwU3DbkpmUGr7mhTNOJFzOVECWXN8=;
        b=1cNhoi3lVwWAidDtq648+vSIGxrNnE6QKlLKW6G131Ctz3x6k3R/anfkXbGgrwwfbV
         8IvKLPqnmN4q3/crjZ9O1LgpOEMDR0f2AFZnI+CjJ+cSpEdAZ4XhMB7+NdabOd4Bgt9J
         ioGMpxnYRDnkZJnkivNjQHwRKZd6wE388GoqGWYIbTXfTam9wUAFZXpv68Btil3eiuG6
         bY+Qm1E/czzMcXM+ZwRfRkfNXhpPCNLeYk1Mbro7lcdZnxSOXixSDTVkvJwh4CK+Jmel
         pYxwE36TLkwZZDnveheTQ4flNfNgwQ1mTmEOYcxqBJeXtjw1DxdfcXbsUB4+o1xdMZZh
         U1wQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPMTBiBYkqbP4YIJHvYNKMCUrYT5E6mPYcKLWMEp9NdR26xElIvQq5lkiyqe4m8RZDaLHV+U/0PAGqFzY=@vger.kernel.org
X-Gm-Message-State: AFuF++ngZ/GMJJwu34YpyTU7B6X3BQsWYaPMMAMq/qaH7pIq4IMy//N1
	JFanyqXcZOrAFRB3YTwoTUqPff5L9DBjgqpa3t1DrYkXTVFIoXQEuM2Zp6FDxWhw0mySttxF++7
	S3pKCgoAMpGn0eTWTiwdM/ImLfbBHT/bmpuSBcT1vD/k7jIkvRJC1MPD+lM7FBYWAlwY=
X-Gm-Gg: AYBFou16bsOMc5FhZxHU8IzmzqsTYwmYpvQL/m61n+qwWzl6Bh5T8I4ZbFcSzeKEB3Y
	ghjtB9C7bRHTHyapb1m5pZXjatctnZoaIrS2GeikynnSzVRWRQfncFbGhsZDugtQNy909Kae5xf
	iwWqovbUbU2ef9Cs35Uf2qAkmOWopykjOtfYHg+g9i7E48Ql6+NqzkAezwJWpcxBhD7XcbrJsF6
	9t4BQG919zxjiD3KiIyjoVLm+C4S6UClL6RXFEfGBOXl6tMQgM74RPTakhPJxYdS3b7DOw04gTk
	qWtwl37+lrLdeyR+UhrRWdDBDdHBlR3RY76gE8aoZEr7giuoWLe3jE9Lk+E=
X-Received: by 2002:a05:620a:4013:b0:93e:9809:dbf9 with SMTP id af79cd13be357-93e9b8e0532mr261078285a.76.1791363653153;
        Wed, 07 Oct 2026 02:00:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4013:b0:93e:9809:dbf9 with SMTP id af79cd13be357-93e9b8e0532mr261071285a.76.1791363652377;
        Wed, 07 Oct 2026 02:00:52 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:00:51 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 01/45] media: qcom: camss: report probe failures
Date: Wed,  7 Oct 2026 11:59:57 +0300
Message-Id: <20261007090041.3732717-2-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX8VYH4MIlQX2Y
 J+es4+UscpMWv0fOcnKHLf3W+ofw4zq5ojmjmFLlnLvtGakaZ89qTBeHA9ld7xw5kNIQvbOC10a
 RfHY1CRcay1uDZ1Tcnoxcf+XRp3H5xs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX7Vxo6wQMD9l1
 yK7vIuKjeAnNSWlnUj3mopd6CHmXxKnoDzABCGsq00RwvFMhF/w2N0Pgrm5GuO+u5LEnGFnrzjE
 x2uZRtKiUuY7C+7+FLlUDz1/mGpiiwXoQgumNUyr3QM4hDiPTUV+O4M46MH7JyCVD7K0H0oo4wv
 iUb3wnfaxXiOxvan8fx0VKQaGF0w1utLr2unI28WVUya293XxwJvdy3wRec8pWJsrmbR9ejXCPK
 rt4cF7YNLXC4thCdOrOlzJivNnp0x6gbL9aKAxLlwbfHlYLo2PEO9jTIf+vyJuLWFoq8Y++2JYk
 HHBiEhBYuBw5URuU0TWQkJv//QZy3JJaxgrojplwFrBwDEHESkUAOy4BU+KKV9PBw2G4l1W0a/5
 riN5W81tAePOcNDIkuITw9aBpJHHzkaZfIhM9SH0uVUwPnKXSeQH/8h/LSf/XvP9CWb2h4kBU5i
 RApIlHRG/arrPl1r1kQ==
X-Proofpoint-GUID: E-8pwEdNpVKtLIS8wwwhcazGysiCxXO9
X-Proofpoint-ORIG-GUID: E-8pwEdNpVKtLIS8wwwhcazGysiCxXO9
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac60a46 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=_ke9eFR7E5bWC9if0q4A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Report errors returned by interconnect, DMA and firmware setup.

This makes early probe failures visible in the kernel log.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9bfb0290395b..1f662b1caf5a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5418,8 +5418,10 @@ static int camss_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ret = camss_icc_get(camss);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "Failed to configure ICC: %d\n", ret);
 		return ret;
+	}
 
 	ret = camss_configure_pd(camss);
 	if (ret < 0) {
@@ -5432,8 +5434,10 @@ static int camss_probe(struct platform_device *pdev)
 		goto err_genpd_cleanup;
 
 	ret = dma_set_mask_and_coherent(dev, 0xffffffff);
-	if (ret)
+	if (ret) {
+		dev_err(dev, "Failed to configure DMA coherent: %d\n", ret);
 		goto err_genpd_cleanup;
+	}
 
 	camss->media_dev.dev = camss->dev;
 	strscpy(camss->media_dev.model, "Qualcomm Camera Subsystem",
@@ -5453,8 +5457,10 @@ static int camss_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 
 	ret = camss_parse_ports(camss);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "Failed to parse ports: %d\n", ret);
 		goto err_v4l2_device_unregister;
+	}
 
 	ret = camss_register_entities(camss);
 	if (ret < 0)
-- 
2.34.1

