Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF263BA237
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975442; cv=none; b=cN6ef/Fdxj6pLhy4D7bo+DIADMsCI05arhkLmOh+GlsVWs0VSMThID+ND7BCyvUNZN+h2MfICPDrhc8wPECAI+szN/0X1szKJHlGhOMb3+fVN+Lg5F452cxhQaM2VBIGSFdQ7bZ8MlpnVWFvb9z1/QImh1xGX4ZHZpJI1OQBmCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975442; c=relaxed/simple;
	bh=UdIyyP1ApsBk1pCqs7Ih4NsoUeemI3hETxT2kMh9j4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H/yieF0xEUW5p5HrhGydaMLoYSAt6aYyJJhGVDuKp9fvDirN9phNvw1T5OUrFjb8G9lkGe5UNwH+Ku7Qumm9nyeEiOioRJ2JEEQMlrtvB382IClNfP4QYL014jpCbfZOCsgWSLa+7mOe8lwOuFoLfzzhjEiCasdalHeNISq7uqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ub3/tZ84; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XaQ8VEWn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ub3/tZ84";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XaQ8VEWn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7UL0A2873874
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tji34sWOk4uE2FZ5pTc7yNpCndx/9KM/rdx
	f1s+86uc=; b=Ub3/tZ84k3vUxE4iC1baW5k2p1MU04KVWUM/xJAn6K083nQw82z
	swvcB8YJ959+Ogch50H/ygEpl4H0yCFaG9tP640m7cUUbz+7oJAQIh63gxZNj82V
	Dp7QN2KQnfZcq6Vbo2Tq+ZZKe/bb0oyfnJsDi8vYEeAggzhEKKenHf/OJQTS76lh
	Q9CO9AZU7mHvi4MoAdvufCGIHQ7vnXJa2aXW9edhguc2qD1kKo1k4Q6dCiIbyRSM
	GNQb5PxAL7lgQ204Ublnbcugsmdf09cgQAFETETnMiajbX4nRMpa6l3e0fkh3WBJ
	YNz0VBe0b10vyCeOzHRmcV1TaBA0mG7jr1g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphj676-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:57:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so5217535a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791975439; x=1792580239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tji34sWOk4uE2FZ5pTc7yNpCndx/9KM/rdxf1s+86uc=;
        b=XaQ8VEWnVrGETMk3d5WPxL4QuhgEcLN12mQy/z5silq+nC8NeaO4gQUqF4+9PMp1rt
         i/g2d1BDK0ipGuaBO5QAP7+bz+V2nFHqpRqvNJsn7ilt5Z7+vI4J5kDxdkjW93uUHnwa
         Fs07b57yPTdjNMP3gutiL/sxvJOhzTY42b6YOMnvZXAiBiN/7Zl7+4IdpKxiKBkyKcAk
         thPIzM91dgpOnUTdGzcFHDIXZYl32cnu5ZBGtnE+BTX1yP9x3qsWpHA5ezkYDq8wwhca
         gSjH9nX5W6H7+7pe20C+15SKLOUUvuiCInuHJjjv3pg8fRBSLxPNEzspEfBwssEnYbRw
         xzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975439; x=1792580239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tji34sWOk4uE2FZ5pTc7yNpCndx/9KM/rdxf1s+86uc=;
        b=IqeuGOfsumcGvWpTKQfDqAZFV3h3xRVVve8NTpqgfAgAHVqxHmYXRrOyxKNUnjSWdE
         8+ZKysFN86WQQghIyyMPhZgAC0nWjIQi37qQlhaLV74lPYfMlzc2mS3dMPJtW4PEzaSI
         IWfAW484C8UR29KKPNCr6cevrDvPr8uFpFKUwnDLdv1DgUkd5AYtK5Zwy9y7c0KVRGKa
         v+BjIbqkwFI8kiob40JtNyYTgEajYEdHl1FD0UR87P+cCABnQW3yx3I9jYUb2wpUsv7t
         XuaUuMPXcoNiA/vebNi1o8dSRgzm3pZV8Mi9a4pw8zG5f7a3zAhrqphttIP2I6d+8HZh
         suLA==
X-Forwarded-Encrypted: i=1; AKwUvBzkTQhNqAd173VqR7fkgoBg2SetKaq6sPilaKFOUmys72y/0q1+8WV/WLorut8Ld5IHPWRWhpJUZEyQYxQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhWF8w8YnPHb9P4iXG5FLy4TI/dXIhpUKAEdWfw4H+iToYH+3o
	WLef4/EUC28hpV4tYJFzhil9k16QEZtaHHhlVgHRxMo9W26JIuUPCWsF6Qfv0sNHVJnF1KesP38
	8gcH1g/jVBOQEpdTVfh2rtbw6n2pdwWxM8E7zjer+QPv0aM5cVEkQfGJ1Yz+TqNfhNFA=
X-Gm-Gg: AYBFou0wNDeh9FLpP7yi1VZ0l3uxy8ZMjBrCK2ylJ7Qy1SYNFzXLfTdP7Xf7xaPAKuO
	m+9DWneo6t5w/gYB2GLi7AmU3poeuunakEfLcu25YC2BX7+883tQAf7x0Eybp5GIvnhsGVLYqkr
	DinnlAcCVZfyKktlzi2t2FjKDPBm/eQ8TgMbE6U9HnBuRrd2uCATxRj4/Aa92XtEd4BgTDidSa/
	o+CsZD9wKfVP9m1NhNTN9lT478FZgDM5Svddbuh0ebsWhM6Zc6g+NvR7/XCr9oHuQzYOLKeqBtU
	ha4OfNXWyjta/atqrq/lx/SOXblxe8P/JBQRr4PVU3SVfRHho9+Nix3IsPRgPfLCpkQw1uyMGSj
	wfd+4TXteIZ55bUTucY1oqTeTcrMH
X-Received: by 2002:a17:90b:2d06:b0:3a7:cffb:8b8c with SMTP id 98e67ed59e1d1-3ab3ad0e976mr7839180a91.43.1791975439037;
        Wed, 14 Oct 2026 03:57:19 -0700 (PDT)
X-Received: by 2002:a17:90b:2d06:b0:3a7:cffb:8b8c with SMTP id 98e67ed59e1d1-3ab3ad0e976mr7839170a91.43.1791975438591;
        Wed, 14 Oct 2026 03:57:18 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac752d590csm2294922a91.2.2026.10.14.03.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:57:17 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH] usb: dwc3: host: Mark dwc->xhci as null if xhci probe fails
Date: Wed, 14 Oct 2026 16:27:11 +0530
Message-Id: <20261014105711.1708244-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -xm6HrHwNQPhGO1LTH-amJqi04Mm-fWU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MyBTYWx0ZWRfX/rnUliSBSGrz
 FuMPyWJDGEPxPLs2jYog5eEbBe5XFbb4Znag1OHT2h1MxgF5K4irgEVxOEQjHaxjy5YNorQ4+4c
 DvNDKMzmWZDJOOvV1wem86/7JpB939c=
X-Proofpoint-ORIG-GUID: -xm6HrHwNQPhGO1LTH-amJqi04Mm-fWU
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acf6010 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=byRqvHi71s-wVIH-LgMA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MyBTYWx0ZWRfX1MCmpQ7F+eLi
 IDp4runFoqjKhobbP72z1aRMc+EnAVGOqcUVDL8l9CC4IEZDxDQz4NSipVu0amUvX3chy4dIs83
 V9ivgbd16K+qpGMg3y6MmWTGZiK/ogiximlsIlLX8BDFJwsUPRLWgk48ID23NGNgnD1uDtmq5sr
 RAqEBuOFGd6opZCWHcYD2Bcpwqif3oJEjIOFgGWl7eXrbeyBdOMfvO7Xaie9T1dqjMRN6+xhQ7C
 vtSQatqj7pzPUL4ViE+xstFm+I7jm3CtAZvkidJQpSZ4aIKS3PWoC6EMnW7qMb8VJJqHeBAGZym
 mhAFONZBr5fYQb8Q0EJP12ym96wjT+vsfdYOsUPfc4Tw9f2mv6BX2ckdVI4CITfAgSLdDTrW9oF
 a9SAXPusWggABy5SHXBsSTDdTvKQLMHMX1sa853fS7HkFV35aesCSLU0RNZFw0f2xtZMkqSIo8k
 KEykoT9kubCqnr8TymA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140043

Currently dwc->xhci is not cleared when xhci_plat_probe fails,
leading to null pointer dereference in dwc3_qcom_read_usb2_speed.
Mark the xhci pointer as NULL to prevent this.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/dwc3/host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index c5674161b2b0..b01cf49454c2 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -219,6 +219,7 @@ int dwc3_host_init(struct dwc3 *dwc)
 	return 0;
 err:
 	platform_device_put(xhci);
+	dwc->xhci = NULL;
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dwc3_host_init);
-- 
2.34.1

