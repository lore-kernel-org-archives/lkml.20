Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935343;
	b=oUtSf0rHQtYOMVgOYyW7YCZSTgtskZjFTNBiyhf0g3LMqSyVdeCKjLkXTXSdyX353U+4
	 Xqgt8YKZCdIiw/jML7UwEp5v/NO964LqYjFZGG5O+ZsCmdFnsUSTX0dw6RdF7nT2NOuFz
	 JOn2A2PtIgA8Ek6O44WCARXTEqymAgrGCZkC0b9odph40fCrqwiAVTBAnxkVTPu3jk5Lx
	 UShLlrZue2KSfkDKXMJj6NM5iGNb8UVyrs3gU5rPWMKmQjB+13kA89nqP5lG9OO93dTcB
	 aRZLUXUjkqhQ3CZ0CqrNPXeTZ6xQybQlanhRsvwCOIzsPW6JPbeuGNLb7UG8wr8LA5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VAfyAkYxyYktUSO+F60vOX+g5stCoRKsvnWPeKrgISM=;
	b=W6DT+WdwtRfAItl9/l46pBAOwvrjDc/ew5UsBZYevRJgOr8HuGZk5svez9jXe8vIVx0D
	 jgPrARNRSLjhlyJeEDY+iCZeeRJ30Xf6CVimpVVmQJRxpg7Y3F1nXuTcyaPkhoZB5mxCZ
	 nvN7hsI+aWgQecog1g8mJM4qnoZI/JrT1ek19qYFhfJCcU5Xt2EoLmBSLTManHcrjab+o
	 s16rESIrDqsZOWz8tkvf8QobZClanF2dtwGx80HPN5iLmtuq8WW6FGNObemmDOejxz3fK
	 T310dzO5xrAp81AedUcAh3CeFmMFKjvwbebKfJ//N7WJJwKjs230uhGKVbOQCRh2a3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvQrKbg6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R34SvqJk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFA5606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DFA5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvQrKbg6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R34SvqJk
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQcuq4169875
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VAfyAkYxyYktUSO+F60vOX+g5stCoRKsvnW
	PeKrgISM=; b=VvQrKbg6YAJNRoLqeywxzQApdWHhLYpK3IWofb6bDkLhFku8iEu
	7HSUQfW300l2xR0gzH357+e3ETlEj2OSzPdHLe35Hl1avAOnZVzpkMkaDchT80Rw
	NPtNoTGx8ceJG4gYBOmMlYZtiv5u/JKm+U9CK7PTsjp0skTxX2ZamzzErb5f8BTE
	xE6aCZIVdWl8yIEHbIpls5Lby7eKAHt4WXvkpyez46VMeBo/5fPI8+xK269BBj12
	r6/xa6jizijESq05TOQXM8bZbyNZsqBHDdldP/VFkm+E0Jzo68tYbWx3wEZNh3tZ
	QZvKhS6VmXb1T3WUuAbJNqYVnSeU93VsbWw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve2mvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:09:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3821eb27024so99842eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794935342; x=1795540142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VAfyAkYxyYktUSO+F60vOX+g5stCoRKsvnWPeKrgISM=;
        b=R34SvqJkgmldOrBZLin3eH9Rx1JAtQAtPmQrFsy91mZAvGNyqWMUFectI5DAF3Vg6b
         z+q++xN9pHSatGU4g4XWzYQFIqMu8aQ1h0gItBXFhk1LkHhEqbtxN9b+e4yOHp99AKsc
         GglvDe6Cxk5M9xpcvFIH+Tbo5t1RY1RaxoJEP2HEZh5XvuulMEcgj+98G4i40PLD1+Pa
         Nh56qYG+SQYlPonimAlNqrQljjoZB7ECUR0sI+eqdi6bqyEr8dThwL8L4WE3Ea/+Pa8l
         vs/CfwGt1yxFGZOvbIxNnwjbSmecjh4BLnugVgp5eVvG1p/3ZXXfVhxFf7ThVgwrCf5X
         iXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935342; x=1795540142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VAfyAkYxyYktUSO+F60vOX+g5stCoRKsvnWPeKrgISM=;
        b=zlOj/M3XS9sedSBuhNi4xgvM8P3PRzhEO4RueXYnwV6rrwiHnuQsM0LdnpFKKkdiHt
         0B0/16oT511WixqXn7coWZA1vdQxB8sEwNfkkvcf1yivcK+oWpDHftHV/FFBtTXWP6Y0
         b3hzko1pX9rHLSZ9OaGeGr+v+rNHF2ED64I07lyx/079lb3Cu9ahyLxzTa3YxC9KmW+o
         v+k9zqFAAc/oIz/XFsvmkfpHZuDEbCc4m2o2AgSZk1K+a7AjXCY0ugpddlMuvS0IFvZ1
         Z9zBz0SaoGaj1nr0vrFkKZDUgn6vfXR/MLlnFYmzSWnMUQ9teyUTrHZ4/GxuYADox2wH
         kE+g==
X-Forwarded-Encrypted: i=1; AL+hErHjMd2CV1ikzhzeCTyiaJSAmi6jak5EkfmJwzAeHGL8a3AVSwgUMeMBalUl56TDqLoq05BaSFRx4eJDvCs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/APDG3zHaO+F7OmfgoMkzPoiCGksVjWXCdfzGC+h35GRoaOlK1
	XHXx1SMK5F+otsyOGNHURZNZP0znHX3NlO4apiZhpMWu5RixEb8TCumUFx2VCKYVDK+sMG4CDvd
	OatAMNt9B799QQlIUk8rcjALEiiOfFN03gW+44SHhGgSTibjGMu3t68x86L4fQDasek0=
X-Gm-Gg: AZFdTZdx4oFUcgnMt+aoLjqmkb+aCD4IHFJleVr1eDDaX5zNyu+gC5LRVyRydLDfQtf
	DgYDsughzFKiKo5Id9HsL1wXNejLDWM8BtBwGald2Ld4GiRK1iC8Vxb13fdTI192jaWRY6XV531
	ve8lKGiZmVmbUYwWB1Y6kULNFdlG3dY2m3zIBWo9O2ipUNhp9iDlYJVnxgkWm6dgCTFcy5u06GY
	1aXVwaC5n4WjfDd257aYsDVBtJtmDqXc+0rEayCf53hc4ZA9tEC65vIzwfVX9qr2Ki+rKjtV9aq
	c1hTVkAeUn0G7pPw/3c5GwnaBSI6QYwDhltfDK6C2SgEwFPJCRhdoCs6N441WmQT0Kseq4mTcWI
	1wvyX36/ybC4ltfMKzfR5A8tsnPI6PLkiUM9TM4Ao8LpsYwpf0AwyfaLUpgMmQwHV0DbZbZvG7P
	bU
X-Received: by 2002:a05:7300:d210:b0:382:6868:b1aa with SMTP id 5a478bee46e88-3828101e947mr70422eec.21.1794935341403;
        Tue, 17 Nov 2026 09:09:01 -0800 (PST)
X-Received: by 2002:a05:7300:d210:b0:382:6868:b1aa with SMTP id 5a478bee46e88-3828101e947mr70377eec.21.1794935340795;
        Tue, 17 Nov 2026 09:09:00 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38116afd7f7sm8859876eec.17.2026.11.17.09.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:09:00 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-shikra: Use retention for USB power domains
Date: Tue, 17 Nov 2026 22:38:30 +0530
Message-ID: <20261117170854.3257471-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2OCBTYWx0ZWRfX4Y0EnhowlGE5
 08m/tODmo30wYBEUcfvxAEnfCAgJyB8ECnHuOC7WvCLzmpjP0Y6E+vDHKkLozX83YV0Kgeiqdju
 EretUfY2hHdTSsfS6AflKX2EhBkKV3g=
X-Proofpoint-GUID: 3gtb8DgZCb9UchnlITDUcr9RHwdYz_DV
X-Proofpoint-ORIG-GUID: 3gtb8DgZCb9UchnlITDUcr9RHwdYz_DV
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc8a2e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=iCUNF_J1gHVpXzmuRuMA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2OCBTYWx0ZWRfX7D9h3RhqTUCq
 KnQndX82i26zpvWBQ6wgaTqLbi3K0voUVYRTF128dHRqXLoOgwrMkaHiDcE/x5vDmaLcJdBm0cK
 J2O3TUffnBf5LXNA+WEBmXglx7DVGneFfFLt5aWIeAR6ahEpmRdSP0WiE2frGiCgBfIJAg/9ZaN
 /jxsTAFIJO7GpqHA7VI8/agoaKS9Lvjmorh0eh3ru9M2oAWD6YU6uErFHHKT+LUrSWeH6OYf4Zo
 UC+J/QyHpPypiM/4qNk69vUKU55V3NcLZ2dIwYVMb29TIoXFo9deX9LZYh5+tloIRH2qJMrHu13
 gH3stumcFTeyySXNZswLVmXS1IMbPpAGOwbZeJzgnpS3vZ1RtV+Zx+/wKDzcHVSvOm0S05Kt5C/
 8O9ZjmTALLHo7HFypL/HgRj5pT4iORQ+ciS26gZAT+PJJgrC2A4kx56vpnQYa0gFWddnkIAu8+m
 CPIVJJIZUYbJ1gHXjbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170068

The USB subsystem does not expect to lose its state on suspend:

  xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
  usb usb1: root hub lost power or was reset

To maintain state during suspend, the relevant GDSCs need to stay in
retention mode, like they do on other similar SoCs. Change the mode to
PWRSTS_RET_ON to fix.

Fixes: 01cf3e27824d ("clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC")
Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-shikra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
index 13c99a883e29..4f860985a8fa 100644
--- a/drivers/clk/qcom/gcc-shikra.c
+++ b/drivers/clk/qcom/gcc-shikra.c
@@ -4049,7 +4049,7 @@ static struct gdsc gcc_usb20_gdsc = {
 	.pd = {
 		.name = "gcc_usb20_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -4061,7 +4061,7 @@ static struct gdsc gcc_usb30_prim_gdsc = {
 	.pd = {
 		.name = "gcc_usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
-- 
2.43.0

