Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957852;
	b=z7G5exiy/r3m9A3oq1Ec2gP5Ny5DE9EUaFMatcmy+2CxA8bunROzeIptnI7oMKyTd+yv
	 oksxupsUK8dTUHUXUDxX8LLVEtMGwBJQH8O4Y8sUXnE6VvVq579sZfk6e/U/ygnOkZpSj
	 E2pRLXhGPx/PEp46jm30lf8tY0TKbWa8bCvDR8xJitUwehi7ywwAK9ZIMjenIwG2eiLqZ
	 gfw05Tki88kIVeom3LC9iR7NPhmclmDvg7B7h6Jb6c7gASBNKHN7K00uGfLPJ4BOtm043
	 Q4usiOONxi7i73saIlGnnQka+Y811zhG97eVm1b6GT2WXZMngVd2pez/6zvhnZM7q0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957852;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HBbUQlfTSYAO8YxabN+7DdZdsoly4nqQurELYImyMjc=;
	b=BHDZBKQOxidMkujqfyr1NONIg9nI7jDzsPY67ZUoEBQZ0ZhU2WqeJfj+RPNkuFpBvbXW
	 4Hi0Hjj/OMQbhncc9QVZnHwoUtQV95womu9unGSzCxZyLqzbntthD9KiqylfvMcvll9nj
	 Exe8/Rp0O6+zmQzDKwNf/Wp8kFKdndJv/sAjyPda1Gr2sKvTYTZjUTyaxomGfC7tcdu4H
	 2M2Y0WUiiizlMMEiNUMS33VAl0P4N9lCunq9a/Wgb0k32+OprC1sLfSxDKQekPqQSrZsN
	 4suA730J3MAop8bVQuHim6ikVaW/Il+cNaJQdtBqZr0EHyFwDCGH3mQ6EFJmmZeh9uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7zHu4ds;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S3u+PiwU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39F0606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A39F0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7zHu4ds;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S3u+PiwU
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RSOZ3284390
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HBbUQlfTSYAO8YxabN+7DdZdsoly4nqQurE
	LYImyMjc=; b=g7zHu4ds7H3HSU/ADy0o+QM20WAsN2sOChWdy1FcSmYrOpDbZTo
	4TzRMXxw/dCzY1eqIpP81aSGCvcG4hx9xNLkm5YWoQ0qAPlpmg5ZHqLEWeGkC2gB
	biyGY+c2ysIDfVQPBoNWr5QXisR+74MC5N4BoP97F31Gz9i+H4IxvE8WOjIWkY9B
	3iCxXGx9jQjCTt9qPjLkQ6rUrQaYeHrmU/+wLhIPHQMF6mFZ/9e4AkUL1KpQ1MYZ
	tg/S/vVB8JRo3u4vcPhmOkh5m5P9HE7cv0+MQC1BDGYZrKQx/oSahxHU+beW+f4d
	oSAD/82avSSv3i0VRyobW/OsqHbITB/wIRw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa25ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:37:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-370230d93efso591182eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793957849; x=1794562649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HBbUQlfTSYAO8YxabN+7DdZdsoly4nqQurELYImyMjc=;
        b=S3u+PiwUSZcNHHw63LW2UckMuz2zFqSAWWQdqOpYPRjVSkJvrRoZQTkBQoaq6aGSXr
         c7RSavgVKEvdAO2U6ZUvLwLFtaJ0/+bhblt9goAE0GlJ6rQz5/Yl05s4me/AdTd0Dcj/
         WaFjvB11eTs5N/5+6fbSDkKFI8TNlOjibsLS0FuVIh4WJfvUK5wKSeSGq2KH5lQacsG2
         F/nZ7/4ThsHCYcduYR+UrjMQHl0Dj0MigfM1RZZ1FpO8IrB3sC2gk1E95WKASWo/GGO2
         dYpTFPaL6l6epmTJbtuX1afG8VyeBimthRaTjXtRhU2XhIsLAbBTt9dAHrVpLH4eMvkJ
         mIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793957849; x=1794562649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBbUQlfTSYAO8YxabN+7DdZdsoly4nqQurELYImyMjc=;
        b=gq1VDPkRYc1KAre5fq8vHuEgk9zKtxg0IX8l3nZDk4aPXcivPFPJsyUcQU4IIM1VE9
         bE8R8RqnqppZbFdD6pe07GKsxcbrBHwWzorB4YdwvchTsMqCX+Yqbmn35LZIvJy/tZqo
         f3A6u2Ye76tosKqXxtGIlVjZLmONOph0N1/ed6BqBgSqb+2mUMYPnTEofJrY5zULlxWR
         DyUBFVlhcT6rtUTm+Jznms6rsiCXOJX8nA6K4urVQImfGDD7GXaR7evScw94sYQqwdsL
         ZeJ4KHeijGAnHiXi7Y93/h81btI/cgk8dhPq7HwRWxyvXfhqPCkVupPzYGEOeMgl+1fR
         RbRA==
X-Forwarded-Encrypted: i=1; AL+hErF53ShTqcVxSlMBg3L70T/B8f/34lVBypY8QsMuI4XWJLWb0g7r6FNiMY2Yv7zmup8RK2d07O6LROoA86M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CNEi9P+MEmjkWlh33WqKasOllvlQroV4hDElInBwh7yFuu+hd
	9ObW7RVJJI8a2jzaSu/K0rBcxHIyS5RBSefzB8eCcnVDgHbNKTw+mZwY2tb5ww/hWrPHPmkAM/h
	4IxBQMJHc1/008nxm2bYQiZO6x9Ao1xOJcYCWTtvAxwoSVCmdimbOKJKpWA7jdXVHsII=
X-Gm-Gg: AYBFou3UbCKRx06zDpoxjmHfkv1qySvbbWiCwh20PKrtV11zMkkapt/260xnaSXuYaU
	1UScGLjbFj9uU7XMTsAwrcWffB7yS1Rl3KpeqclZ3ens642yKNIbvnSGlI9nh6umPqpszcqFY6H
	ruO+7zCnSOAki9sXU95PAPoA9pJRsdvL8JhgvdgpAjgBQVFlQxUKcMphYbbIiXVa3r8TVfgEebb
	gPLVVtsCgswonzttkiUhKfl5pIWKdyutbgclIzRh9HWovgreVinmF/AlX3fUA672fNzMZPbgw8O
	L5FPTK1E0cqouyVmLLnuG0mG2+3SglsyhW/VPzC2rAWa9wwu8PSkzgN94hLJP0/aPmIY8lJW7Zy
	q4npXnf/gtrCBte6Stbw/JziA9V3OU+lYDGswUR79NcXb7EELUdf2QTbxMPB83tXAeokEQTfZ/r
	+4jw==
X-Received: by 2002:a05:7301:4610:b0:36c:a281:1bc with SMTP id 5a478bee46e88-36f75a2b0cemr2691300eec.16.1793957849271;
        Fri, 06 Nov 2026 01:37:29 -0800 (PST)
X-Received: by 2002:a05:7301:4610:b0:36c:a281:1bc with SMTP id 5a478bee46e88-36f75a2b0cemr2691259eec.16.1793957848748;
        Fri, 06 Nov 2026 01:37:28 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm10548494eec.3.2026.11.06.01.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:37:28 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-sa8775p: Use retention for USB power domains
Date: Fri,  6 Nov 2026 15:07:06 +0530
Message-ID: <20261106093722.3261172-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-GUID: 2cA3DTp9OUGeC-UzZ5GugjZTz2MIcZ9g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfX27Yh3G1uuKGz
 KOYeEVcaYFg+li0HA8W9FKZoYSW6wtNRqAczKtRTZjpw4A681LG5pqjO8oZEF9+omUGPAWIC/v6
 OXo0cdh3zWT5VzW+/eV36wY1rlGcvh4=
X-Authority-Analysis: v=2.4 cv=e7WT2qp/ c=1 sm=1 tr=0 ts=6aed9fda cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=rGLbVbw0NfjaWOq_wPUA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfX19Dhjt84zBU3
 CYLqN14FcG1gwmURm25fmzjB1uxtnmcYyiYZC8bh0dMefe+1jiM6y+hXB3PoE908TeszmGm56CH
 vUKJmlR798+WAd5O9X9irDYlMZQzH9fs5n/aJKp9WUPOSQ4NtcO9RbbR9U9l8bQ82pou3etbLOQ
 Q+vO+cmhtBrLoPBArRezNajKoncb7Hdz0ymxm/qJ28JIQEQv0x4FP6JpbTc5NHJOZX9wShR+bHy
 T6wJFZOmnaAV9ZP7vJbAkuxBD402uGEFAtqWMoLJGZbtuDB2v/yyxWg7iA6q9HTg+Ewkfht+ktJ
 fnR9sWjGIjUuq3GS/IEmKiRVeS5/ivW/gyFc5UfP6eqns3yU8rojaqZvkER81TjqoK4z+6ldTEf
 dB+XPqUOJm+Pt5hFaLUnTlOrUpYkYFXMbWXaPAOnGolQn97TnBXMBlYHVBAnYJxvBU5ftb/O+03
 17vNAmEyRjEbmg51pgQ==
X-Proofpoint-ORIG-GUID: 2cA3DTp9OUGeC-UzZ5GugjZTz2MIcZ9g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060038

The USB subsystem does not expect to lose its state on suspend:

  xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
  usb usb1: root hub lost power or was reset

To maintain state during suspend, the relevant GDSCs need to stay in
retention mode, like they do on other similar SoCs. Change the mode to
PWRSTS_RET_ON to fix.

Fixes: 08c51ceb12f7 ("clk: qcom: add the GCC driver for sa8775p")
Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 drivers/clk/qcom/gcc-sa8775p.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index 0e02af686614..47acd1b58f13 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -4260,7 +4260,7 @@ static struct gdsc usb20_prim_gdsc = {
 	.pd = {
 		.name = "usb20_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
@@ -4272,7 +4272,7 @@ static struct gdsc usb30_prim_gdsc = {
 	.pd = {
 		.name = "usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
@@ -4284,7 +4284,7 @@ static struct gdsc usb30_sec_gdsc = {
 	.pd = {
 		.name = "usb30_sec_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
-- 
2.43.0

