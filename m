Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20613DA5C3
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888767; cv=none; b=LHK9paj0bS4g9bMbN08b1e9Nf2CGV8oHclsLlWbg+xwoqZaqiIF/3KeJJLVk95oSQMmCAwrEWusFDqEOxV8LoqMgzKFb4BfsRuM34VRfDsiLXxV9En76+a8Yn2QBMcSGbirznmlJQRktQA3t4KFYnwtC45KQO2S2TTm/+cna+kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888767; c=relaxed/simple;
	bh=0AqniGQU8cTXS1MhWWTaCnZ2cP21y39x+o6P4wCFwjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e76FRVqHoX3g3uaEd/sMEOWaTUwXRBe5975QThS6w6CFbRxkxTprq72AQwP3ymduVA86Py2LzU8GGTDIBUc9NCPbAjDkrQ2a0NGuRGyXjBzCjQ3XaSJr7hI4dOTHamw23EdS7x1CnQFIhTUyAu9lsQz0JFZ1RifE3IcH6wcR37w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWMBRIDx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KMtMc09G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWMBRIDx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KMtMc09G"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K54sFn1609165
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zBkLhviN2smtRvzpD23/LACWcR8x1x/ZnjkuF+1FbWw=; b=XWMBRIDxc63hFYaX
	JfocXmOiccOAbTg5JNpQzC63Eg9Zf2WArmcVOki8CYx34e6RBlrNxlzffCcqU332
	cNB/igk+Hng4GZkhG04/r8m0CqI+XK8vvlYYxtSkuMkDObxMErLbqYxm/aNMelru
	9N/Aaj2XDZpirGYDRmowcI/SwONhw8cjZBkJP4PmERFn786M0BgfhS4U/i5gAykK
	MiHx5MwWJoq5KUxx0RycoJ8FhwLfR4I2jK3fZwVO+j3UgVMxl3aI96QUJXFFSCsB
	ds0yVVCdRzcFjY6by6srP/vXQuTSsvkn7AAX+uJHSl/VB+COqs3mFzoKC73N7bBm
	WRPCRA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjm32fm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:19:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d001671a54so41830615ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 00:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888763; x=1790493563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBkLhviN2smtRvzpD23/LACWcR8x1x/ZnjkuF+1FbWw=;
        b=KMtMc09GeFRTeGIT4XNkZvhRb0L3GsIt6fi6KbjzxXUEMfm0tdO5v98nJgB7c/1Hag
         nkxpVqKqMsS8PTVFrDHZbjpgQB61l075tWiwB0EEe2SYnWoZdGGKGx0ahi7cqpO01kO6
         5DSzvc8+9k25ZM3do5SW7Kd50nJLm1uf8a9VaO+ToBniutsTXiHdlXf00CWwLJzJVV45
         LiObnUPeEsu4N919G+Sc0VmzY04uT2uZtQcVRzaq4m4v33ddQ+UIVgTEh3mfAfKsKisz
         2UmI9q6YjuYJWkMXE38eWbPdefICgFEt9lRh+MisHq4k4r5577QQ1ZiXOUqTV8FXWvFa
         PDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888763; x=1790493563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zBkLhviN2smtRvzpD23/LACWcR8x1x/ZnjkuF+1FbWw=;
        b=xHEhr83WJUKVmRgDA+ZLB4Hj0ECPWq8xHoOoculGR8PgrQq8uURG1B16u8zqHKcuGf
         Kxg0QXatTgzi/La67lO/GPnwfMMhMKqoF4MrsApYA5QOHpRk0Oq9mzyJ73sTqtKp8Sun
         2gG1Gak/6UTyY3EF3KeSf7IEnhbW8022LwlCDNwe0O2noe85fVDDuLaDFF7KThZukdFb
         hMdJRKny5wtRHtzxx75jTe9pTfDXFnSX0UgMrPDz7gh9ssUg9ooyG6Gzjg+7zUHXA8lp
         bwLZDAfH6PLHhszAWkBHTBYJ9Xk2gHQQCwelddUboJN9Ohd5E+yV4I9mjOnZ/GxFBbFq
         Frag==
X-Forwarded-Encrypted: i=1; AKwUvBxvoS3jEOwvbyJV5FK9d6OeYO9y/l33hCK/dpaDbveg56nhgbaj4ZshBEaRB3XQMJZdtdldXj3K6TkxJ2Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kzfEmXtFsaLaZjCoJh6RZ4ZaElO56CXJkLMhM9MxOfqTNNuN6y
	Qts3NBxAb6FRD55Ve0ramtWd8icTakNGFAos8aCsuUZ1yv3Io0EWda9Ot0zrfdIP2GibJr+NpBT
	8R89ZOxEar99DjIB5muA00DbZ0Tk4Dgo1ObodSA/vRtyaA/DsT3niogzHLebRNnPdNAU=
X-Gm-Gg: AYBFou0EeA4TJAcKJ6UsbH906IpCqEuJ3CAemMobvptv26XeshqWSPmsDpfThPqSTJV
	lEAya3ACoHp8jPmImIXWHCNPmCYOviD/fg+rb6mGBDkviQGdm6s5rMbtqWKwhRFUSrj3AKo+jWo
	+on/hy3IKJPvsrCoMeOmfwLrW64ne5PCKhfOYD4MShmmMKQ6TwTur/xBgHlI+Ast8lQ3dW8swx3
	MBQv/W+nZJZJs5TKvds+MMyoLhD824MH2HcxfizC27ZAN0y19kpMZQLW6qF4budmMl7MSfV3GI7
	Xh29t+FHcbKso7r4/6ntSsPyZfGTLGFEloBNlA63jqiugjPvebCnDL34aOk=
X-Received: by 2002:a17:902:f641:b0:2dd:c100:b2cc with SMTP id d9443c01a7336-2ddc100b379mr57625435ad.55.1789888763430;
        Sun, 20 Sep 2026 00:19:23 -0700 (PDT)
X-Received: by 2002:a17:902:f641:b0:2dd:c100:b2cc with SMTP id d9443c01a7336-2ddc100b379mr57625295ad.55.1789888762980;
        Sun, 20 Sep 2026 00:19:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:19:22 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:25 -0400
Subject: [PATCH v8 05/11] riscv: dts: spacemit: k3: Add Zic64b ISA
 extension
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-5-5f14bc5c23d3@oss.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
In-Reply-To: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
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
        linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6915;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=0AqniGQU8cTXS1MhWWTaCnZ2cP21y39x+o6P4wCFwjg=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HSejbp8OLZ+SctWE4f55wbbOB/93pb3dmDT1POuEi
 lqvg587OkpZGMS4GGTFFFkOH23J3vrKJ9r3OecPmDmsTCBDGLg4BWAiP74xMmxXXC1kf4kt3ZTH
 RdR0icTa9ubyNX//iNhWX7p0PTwswoqR4fLHy2eF5658cK5srcz79D93rOb7v9b0/amxn0ffN6R
 vFzsA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-ORIG-GUID: JzXS7OYwr0Yk8FPKSHP8Ctz_sDm_fh2f
X-Proofpoint-GUID: JzXS7OYwr0Yk8FPKSHP8Ctz_sDm_fh2f
X-Authority-Analysis: v=2.4 cv=DtfDa2/+ c=1 sm=1 tr=0 ts=6aaf88fc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UGsqu9ZSYe-JSgDVrOUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfXxPuvgIjaOrpo
 71ktnUjk85cK9HqdySwxtoOkdrvaFpYIhh67gGTVP60SbetnpS3/9GPvW8ZCLNQQqHOcbWIfkZv
 3OyIPtsmDfSBW9itD9kEfE3PBiV4FftXuMPN3kyKsQdiBvD1jOON/nk8rdRP0UI6Bs0GvlVsH/i
 wFjxW7y6aYSP0TPVt6cF/3bPTfzazeGu4VvK/W+WQzf+Ew2EA85bci7xdzIP7s0yAlNGVVZObKu
 03hPeo1ohJ75WnYBlSKYhZ1byaSMHgDyGSghTp+a0ZJwUgX98GMJlylsbtFFMUoFFeDLr/LpdK5
 2h1oz13AzzR85XLyzCydITcQVFvyGxuHPN/iGe32bulD9l2tpClnr9mGDP6aQHN+Sx/BNiCAFPc
 mf2/B/g/lGcudI1lpiNAXzaxm2i4Fjb/fsgjiT9+mtGAbvKv52H1LjPSufb4AcsoFs3DHyYoqd+
 BWp5gLmQlPbZh7CLshQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX8dwnjFaEIuWD
 Q8WvJHJvdvMdg1SsZL8VIbhbcEZ2JAEqWoXcjV8UfDQ418sP0c0WwxgNO8F17nG8n6da0wWAnKi
 IKhHI2Xiela76RAwVt29SKbxfGsqhZQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104

The K3 X100 cores have 64-byte cache blocks, already described by their
cbom/cbop/cboz-block-size of 64, so they implement Zic64b, a mandatory
RVA23 extension.  Declare it in each core's riscv,isa-extensions.

Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v8: No change.
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

