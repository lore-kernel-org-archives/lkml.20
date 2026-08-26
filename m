Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7679F41D11F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750781; cv=none; b=MIuuJaX1StN/FLcFtodoP82AL/MPwRIJ52BEUeIsL5lsWXwzyIDfbL4qLbDIiFFewAKV5k8C/pZPt2HEgzajaCaJNhO1gfcGpRNQKt6BNtLqpTrPd0q5TNRnqMIAgIvaZnDc7DY75rwZb36XqyW57ChyNUfLMPosF5Ox/q7DCTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750781; c=relaxed/simple;
	bh=Zza1N3Y2FKmg1mQy2qIK8tXblDJiQpYmkV3BRv9IN/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gJMCO/bRXn0JYep/rh8SouMigQtpBDdzjdKUJjhf2sNskfiZY4Vel54zhiZ22FAWvzYk6HoAhzBkYmgliOuiQUvuAivzrHd0yur6tdDFz9w1vbRn7x0NqihvyIHxCnj6KZU0eRgJaBfE6/OIYoxdl06aOo7qBOKp1Ha4WcUHE7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VBuKGqmL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtZyIM8r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VBuKGqmL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KtZyIM8r"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCUL3Q950231
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ulzrg5Jgbzcu7NdvzxEDb+qFiWQRuMHzc+1iwLtcyyo=; b=VBuKGqmLiocUIwHt
	0iPDM39Avaueimj6DQynSuQtrxeXR2hrt4lUfIu0mKH456ajW4UTxZMwiYvEZJ6t
	Qx0AKeeVCL4Ox/EZDdLyuTCZOfe3hl7U52dY8dYvxOGn7dhb6AaFBJDZ8xSxlrkU
	1U4bHrLMjoik9OGXK4iWtCYkqp+oVJNTb4Ys+DWyeORKWr9lr4XyIj/JLpAd/5JB
	nDORMRVKOQv8rbvrCupunqmb932IItna0cLDS+oJvkfzkOtsPiOl44HayYT3qBew
	mEgLgk+awdOc2IpDQ/0Y4Mkw9PC70t2BeA64JfS8G6Gxnv5q3CplY6hpP+PzbrzH
	vB93KA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga07586p7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:26:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso1330693a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787750775; x=1788355575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ulzrg5Jgbzcu7NdvzxEDb+qFiWQRuMHzc+1iwLtcyyo=;
        b=KtZyIM8ro8bdB7ncnzDC7O9ewnOyLghw0rFCp7oKmhpe31+ynaPnh0E+KyzAn1mlWK
         QpNmsyNBnzzzVJhgK6ReKp7pgI3wJLddLEwLO/TkY+lenC4+c4yDRWKA2VnqlxMVcKrM
         VfHRFbHcjrz3gbv6cYP8M6aFgx3s3oNMQF8Djp3i6HaFZJvCLMzuy7g09AhAb87m4YZ1
         5CGpNsdnieG4qwakX6QzNwP6G4ldk7FA+g55Rvlf6Z7gl5ZHBlb/TbTVqDNY21Q77SGg
         S6PygNL6ojggmgKNty9LuHzvrFMbqCeRTq/HkCAeTxxNQplBcIPyRKeP0nrRjYy25ln/
         kAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750775; x=1788355575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ulzrg5Jgbzcu7NdvzxEDb+qFiWQRuMHzc+1iwLtcyyo=;
        b=pStTQc+LfBHOkuk24duaLYxRvV4cSBfN0SPblKgixP2o7fkICzJfmEAwGQ9QFRP/rS
         Zf7HjDFTQrLc83aZ9PMAwWoM7LhNMUC2VdXEempA8fV5USHcgUQcSVX9d7IRzoQPb4rT
         4qW2TRU7fbNa6FCxB+htIGKsrAfPf7HBJsm4hDPAcfFMZ6IyFnO4GfsYNhquAw/RDlkN
         RPAQOiyk9CKlm54+c87JIyGKVMFwCCmmasFwow1T5yzec2ewkwKRboPuNI88E7yRv7a+
         Tkm3O25DHPWHljj6YfCiHExELt83Pyc/mcPww8bMxWCtsI7Gb5frnglCUoGyxfPNd7hb
         7Bbw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3dyVL1A5uQhgMwlWAaam2VHv/2ay0zzAur3Cc73t4ERHP8MQfISMSuKaUjysxZ6L5gsOl20tPNQBaxvk=@vger.kernel.org
X-Gm-Message-State: AFuF++kyFArMl1/Q4XGhRpTzpwDDJuBFop/XDf36IzwKvBHaeOBwsX7s
	ryT21hLR+7pCD56+fGar9UtVj0/eSP0nGwYb4YcHOfse7Wi17pTwzEG8OBA9lNgPb4cmjw1C5Lt
	Wnbcdb3/Gem7wKNtajgFVy/3DcBoXhGMXkVke2u/M1qvEmk9oPHNtfnwKXEs42E4gcEw=
X-Gm-Gg: AR+sD104kWMVvq0y9JNNIExOuupegdLrTjwmZQw/+HX8eLKDcuTO+yyWVxDx4+JXm4I
	SMX3iqrcdFeJ0qbi4a4rE/z8jCMTKjKtyYoMWPFSQDX/97RGXUw65iDw7QSGYMLjE4HoMTk00ZP
	81m71LqBhESyFWXXBtw/bESlPW8XB0bQpYFGnJhLHdDxv6Joqe3y+YsQ92PIeNxUY9fNsi98RRD
	IyuU1McvWQeTM9nni/7kPZVrmQx/tmVAFgdhECRvzhBv8yXiZhHtbciMCKkxU2rnmjw5171IDoM
	xtd18+cF8eLvXEvZXe91/jgAZTdeY/66aG+RtC9EEITpIogkCQKWlHezmIelkGUVa2m7Vq1+vyp
	DOAiD/444yw3qGOz9pCOEbbZhDpGn8GmnXg==
X-Received: by 2002:a17:90b:1845:b0:395:4e0d:bc60 with SMTP id 98e67ed59e1d1-3966d85dd8dmr15798797a91.9.1787750773125;
        Wed, 26 Aug 2026 06:26:13 -0700 (PDT)
X-Received: by 2002:a17:90b:1845:b0:395:4e0d:bc60 with SMTP id 98e67ed59e1d1-3966d85dd8dmr15798645a91.9.1787750772646;
        Wed, 26 Aug 2026 06:26:12 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668767d65sm4581108a91.8.2026.08.26.06.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:26:12 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 18:55:50 +0530
Subject: [PATCH v4 2/3] misc: fastrpc: move ADSP duplicate session creation
 to the driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-dup-sessions-v4-2-35555d2bfed4@oss.qualcomm.com>
References: <20260826-dup-sessions-v4-0-35555d2bfed4@oss.qualcomm.com>
In-Reply-To: <20260826-dup-sessions-v4-0-35555d2bfed4@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787750757; l=3234;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=Zza1N3Y2FKmg1mQy2qIK8tXblDJiQpYmkV3BRv9IN/g=;
 b=MvYtIoBfRHzr+9ZlxzKLLMoppQsZDe6pf/KPNN/1QMZ5lRfEuP0Dwulclq9H09nsqHriGV/ys
 J1Twvj9xDNPBP2Fdaacm+ZxMCdQ9/9E7ncnRt/0xCCt2ksAYoackshw
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-ORIG-GUID: bDvEMj627Yrn6-0-nfgDOXVZrw9vpKjo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMSBTYWx0ZWRfXxY7TABxDkDgk
 1f6DpWr1dy3v5njfpnBuMX22fyZuIsB3MbT7EBh3TMdBriJAciwZR2dYrjF/2dTAi5W8bJPlyON
 uzN84bLKkYgeLy/vafEZ7luIN3fpBVeU90Q+oV7bnt3DGTmypvxDyZqBTcl78q3Kde+ctVF6I4T
 QTzrv5gwm6hbP+TGJgwShL937rD/fhK9vI7IWCQZ0xW2BbeWRvj/4OardSnrWlWPDKHufXYex45
 OoURA005zwRrX9dBwT3hx6OC43FvwCc9N/T/NvvwM3TM1q/VC8IyRoLvDPC6j2zQHwJaT2pEnf7
 dM+G70Tl9Uve5c04rZVC0MTC0ljGmAF5cq0wLT3cICqJ3bw1/Plzs3hVmwWNSLIuGsdxs1xhGHN
 UMLMDDSIBJ+B9Jo04Jdxc208BUxbxykA8Fd7Jlh53yKYFALrI3b3a4t08b3foAU/5y7gOD5jPbF
 sSsvog3XK/iylrgPqNA==
X-Proofpoint-GUID: bDvEMj627Yrn6-0-nfgDOXVZrw9vpKjo
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMSBTYWx0ZWRfXxLspn5pcVdHx
 tvl6mRuaADT8G17UODNdr0WzJZ86wXsiVqA5lo7n9ogV79PN5k4AC+Mg25CzIWlnxH5ouVDiTyi
 n04kRx/NgIeKFb7/0QUoAW2DuMxBIqg=
X-Authority-Analysis: v=2.4 cv=RPiD2Yi+ c=1 sm=1 tr=0 ts=6a8ee977 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cClR-N3A75S5OZrvWOIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260111

For ADSP, only a limited number of FastRPC context banks (CBs) are
available. Each CB supports a single session, which means only a few
processes can run on ADSP simultaneously. If all sessions are consumed
by fastrpc daemons, no session remains available when a user application
starts, causing the application to fail.

To work around this, qcom,nsessions = <5> was set in DT to duplicate
sessions inline during fastrpc_cb_init(). This policy does not belong
in DT and should be handled at the driver level instead.

Remove the qcom,nsessions DT property read and the per-CB duplication
logic from fastrpc_cb_init(). After all context banks have been
initialised in fastrpc_rpmsg_probe(), append FASTRPC_DUP_SESSIONS (4)
copies of the last session for the ADSP domain.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a153107d0085..98a61b8b9013 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -34,6 +34,7 @@
 #define CDSP_DOMAIN_ID (3)
 #define GDSP_DOMAIN_ID (4)
 #define FASTRPC_MAX_SESSIONS	14
+#define FASTRPC_DUP_SESSIONS	4
 #define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
 #define FASTRPC_MAX_FDLIST	16
@@ -2368,7 +2369,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
 	struct device *dev = &pdev->dev;
-	int i, sessions = 0;
 	unsigned long flags;
 	u32 dma_bits;
 	u32 sid = 0;
@@ -2378,7 +2378,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	if (!cctx)
 		return -EINVAL;
 
-	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
 	if (of_property_read_u32(dev->of_node, "reg", &sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
@@ -2399,16 +2398,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	if (cctx->domain_id == CDSP_DOMAIN_ID)
 		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
 
-	if (sessions > 0) {
-		struct fastrpc_session_ctx *dup_sess;
-
-		for (i = 1; i < sessions; i++) {
-			if (cctx->sesscount >= FASTRPC_MAX_SESSIONS)
-				break;
-			dup_sess = &cctx->session[cctx->sesscount++];
-			memcpy(dup_sess, sess, sizeof(*dup_sess));
-		}
-	}
 	spin_unlock_irqrestore(&cctx->lock, flags);
 	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
 	if (rc) {
@@ -2629,6 +2618,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 			goto err_depopulate;
 	}
 
+	if (data->domain_id == ADSP_DOMAIN_ID && data->sesscount > 0) {
+		struct fastrpc_session_ctx *last_sess;
+		struct fastrpc_session_ctx *dup_sess;
+		unsigned long flags;
+
+		spin_lock_irqsave(&data->lock, flags);
+		last_sess = &data->session[data->sesscount - 1];
+		for (i = 0; i < FASTRPC_DUP_SESSIONS; i++) {
+			if (data->sesscount >= FASTRPC_MAX_SESSIONS)
+				break;
+			dup_sess = &data->session[data->sesscount++];
+			memcpy(dup_sess, last_sess, sizeof(*dup_sess));
+		}
+		spin_unlock_irqrestore(&data->lock, flags);
+	}
+
 	return 0;
 
 err_depopulate:

-- 
2.34.1

