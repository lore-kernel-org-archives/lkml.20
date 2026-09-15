Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E95244E66D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456625; cv=none; b=RJ6CGmpatHuC+eJewbBPRUitl6RZyq3fwVCYEGm9dbTNE/e1v7b9AFAD979FwhrkTLJI5UCqb3ga9X+oja0mb9L7b75W2M3kU16D941UKeEfGaivZBB8hLFh37NwJ5113GR/wdISFk2rZWXV/kGc1BSbxIrYqb+0A6VpGqZ8Z+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456625; c=relaxed/simple;
	bh=eLTEdh5CFvwbPjheikZKqnmvnX76F42E2jbZEEV3dzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DEvhUS7uP75NvVmU7t+ctWlUZFksUtWyKgWr9I+X1gp7AkWo1JLUJzxQt4qgobb6BtQt1EIp4EBR1e4y/Z6eUXRL9DEYniKoEqfzoirrZRHSXhG3DFnDLcTwtAcQB4JyH53rjRnm0YUMwkat5WdH1xHQn+LutoSMXPhfJdbRHak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7TFToeB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQ/M4Zvg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7TFToeB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LQ/M4Zvg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZTPO3316461
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	03K3JYYH/TI0gehAvshcmsYiXcqyxVgQVe7B5LINZPE=; b=h7TFToeBWimVbRuK
	QFPpndcbP6SgGwsJyKfEaPXsul2JrcVBIcNFDWAU16XnldGTBc/GnZiRK2vnSLG6
	7wwbPz3Wi2NAWZJWM1SFV/31iEand/ozc9DpAHEuoJJJiq7MoakcfNWWz4F/gLkw
	tPRbOx/qtbg8DYZMg/wdPXij9j5fRp9/tM8DXvW4qXY4hLE5WWDzpFPNEGSshlNW
	AB+Yt4Zk1gDUeT3FhDXzcABfz8gDLhqrmO66IAkBcoOvmIjea+R6QT0P46JWH03a
	dyXCdgZ4Qt58mXkX6gF+Ff6/kXnNy4jfm3r/JmOgM2kODDnJXtCHhW6kcb37OFiz
	r+ohfw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux0dds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:16:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso7835166a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456618; x=1790061418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=03K3JYYH/TI0gehAvshcmsYiXcqyxVgQVe7B5LINZPE=;
        b=LQ/M4ZvgpR57jNWyTZgrCZZkiVupi49MzN3glQGMLrxc4it+hYeggb+GIb0TnXDRqY
         8VLrpo7FY8nt8FUMehI8cRkiuaNBG/ndNTfv8OS5SXD3qfvHa2/Ble3NoD6ZhTzX0qCa
         WkrI11A4MA3IhtY6LXGl/GGAwEwqAjzsSoCfyQh+psCwpOhjVIT1l4yLyIcmffgxCrMv
         ojB7p6H/Ab/DsbJ6LFeqGqH4GE+qD/Edx+VeaAgi5K9vxrVD3awGRurZ2dNerPnCzDHo
         zgq8Q/l3ESoBt4eE8Woig1V+Az5HwnJuDRmvQBXd50U5KxlbWG2vtJRDUT62FNEDFfbt
         X2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456618; x=1790061418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03K3JYYH/TI0gehAvshcmsYiXcqyxVgQVe7B5LINZPE=;
        b=asTspfWK2DM7Stj1zYKza0+4zkbCKaWwS2J6h6AUfkAoTNAMxzIfc7IXQc1Bencsxq
         gafnJuQSO3p8eW/kiIsVvi9G9wYP5NkzYqus/ZUhHx08bpCXtDr+VUtWBb05Gb0gjta6
         yp98m4PqHT4lBsRIDBZ6WatSeTvGHW9+LitBvq582iLY1s9ZUZBtRnIZazo2SkK75aks
         dOK0wcxswNt0WBoVnvl3J4xxN8jILaF0fQwbR5GqvpgH46L+OOsYh+RDb7taPYHC0l31
         fPjTtI95ukhEX0HHYXAP+34uua5tT7PdhIQXRUcS8cZrcHmu24LWofC0v7glyZxCqJ4b
         KvQg==
X-Forwarded-Encrypted: i=1; AKwUvBzBREi2o/+MgY3rv4vK+Mkgno9pdA05PkFqSVxuUsG/GVy+Muyt6XBHMG1/d084c4nHXZDriYXbMjUN/v0=@vger.kernel.org
X-Gm-Message-State: AFuF++lTsKy8hX/Lfl46hkqcBsh12vaDGC515WhL6HI/zrAznuakUOZL
	oSFuZ1ZaQK2NqAnhU3vRyyCr2nzX9WskEl3DOfb0FzLe0YdCY7LfqNCGRbc+f86ViE/gShXzpvp
	cLpQXB0DXgTeJgt1/j//2eLOmL7ED1YqILbPLqquXe3ogXa2CZnbfiobf0V4OVc78REE=
X-Gm-Gg: AYBFou1qRW5RXXWC89xwpT5kqE43Mcsos8WjE4CwZT+aRS9luviEbRH25P1ZkPfq8nr
	Pd51cM11Awz7md1xtbgmGe6SmDsLl3y9RDJ2hDsY2oBb7ua85QkB6HjS0wcPsAa8V0VZz5LOPoS
	GAY71J+8A0cP6O0PL2hVAVknL/HBBNeGcgfSqkIs8SVeU6Ovv6yC6fiUJx0HzSs+S4d5JKgyw3y
	TYbU2NBa5SX8CaUDUZ6i0fID/7IgvEuhqOJ0atk+dtorj1XuYFeBDDmGsU8ZFRN32mnZoN9jbZo
	i98AYP3gJ+wiG1apo9N5/TZg1gZ4tctCdrP5d+ptGs+ov/TWxAGAdh68wAye
X-Received: by 2002:a17:90b:224b:b0:39d:e75d:f33 with SMTP id 98e67ed59e1d1-39dec09a541mr11810760a91.19.1789456618115;
        Tue, 15 Sep 2026 00:16:58 -0700 (PDT)
X-Received: by 2002:a17:90b:224b:b0:39d:e75d:f33 with SMTP id 98e67ed59e1d1-39dec09a541mr11810682a91.19.1789456617515;
        Tue, 15 Sep 2026 00:16:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:16:57 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:31 -0400
Subject: [PATCH v7 05/11] riscv: dts: spacemit: k3: Add Zic64b ISA
 extension
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-5-aa35ebd9ae96@oss.qualcomm.com>
References: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
In-Reply-To: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6899;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=eLTEdh5CFvwbPjheikZKqnmvnX76F42E2jbZEEV3dzQ=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7bcmypqkGf20YnN82XfLzHzWXatfrZ3c/4/mbBK7
 bfwhsKmjlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZjIq8kM/4xcN083UvR7p3P5
 35s7b14WS7no33dp35ez4dLNLnnl63EM/yytdwRN0bh8Kd42Kb7oQUhK4A6Ov3fjOpmrGL633XH
 pYwUA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX02B1MVVqlHeq
 4OZxaeTB9ngRU7fOXyJb96oc/pMEvX16pa6b/Vy4WNOKUGIDTGSC3DrL5Mlow2PEgllUrF6DhGL
 iCRIbzJrcahB3VKK5JHo9+gsCR79PkQKo1+9uROZLJknQDRRJmWIOCwRfcJJylcWr85V1/LkPA6
 JkVRePJgzmKw9VgabhBLBCJckxadvUu4nQxLuz0e4jlZ52EtU6xxjvbAxLkAyjZtfzwWL0EqgZX
 +e3HDCBFln9tgVMqAU5f8shGeWsqcpdibkqJ2yLuIWry2OHyliymrCLj8iaugDrguTk/AszwojT
 xMtcBlN4JYz7jI+7fZosqVgI6/TG9L1EE+8Fm+0i9OyagVIoiMHH+8OWeIGo3acmBlFHmCCmpOM
 VLppKR65u1ZuGEaX5GISi3rn5jNIwnB57pv+zMzHOsjVfZz9LrKwhDHZpmlT1w+UssmXIVUs/Gw
 eW966Ees4JdmA9wurag==
X-Proofpoint-ORIG-GUID: CRAvaFZyMPPN0rBsPjEyREh4nVswwEdK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX3hhKfn9pGuTb
 mjQHYRtiOQcUPVtAMLRhnBcKaMhXvxUVPOVAVBo5tWk9N7+lUn45pJ2bnKdExzlliquodekp7oB
 /88jzHmcRFv2FffJUl5ImkqQ/KuFbpQ=
X-Proofpoint-GUID: CRAvaFZyMPPN0rBsPjEyREh4nVswwEdK
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa8f0eb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UGsqu9ZSYe-JSgDVrOUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150102

The K3 X100 cores have 64-byte cache blocks, already described by their
cbom/cbop/cboz-block-size of 64, so they implement Zic64b, a mandatory
RVA23 extension.  Declare it in each core's riscv,isa-extensions.

Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7: No change.
v6: No change.
v5: Collected Reviewed-by from Yixun Lan.
v4: No change.
v3: New patch.
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 48 ++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index c3f2dce0969c..799f0f00288c 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -38,9 +38,9 @@ cpu_0: cpu@0 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -79,9 +79,9 @@ cpu_1: cpu@1 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -120,9 +120,9 @@ cpu_2: cpu@2 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -161,9 +161,9 @@ cpu_3: cpu@3 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -202,9 +202,9 @@ cpu_4: cpu@4 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -243,9 +243,9 @@ cpu_5: cpu@5 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -284,9 +284,9 @@ cpu_6: cpu@6 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -325,9 +325,9 @@ cpu_7: cpu@7 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",

-- 
2.43.0

