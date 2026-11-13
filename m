Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596065;
	b=Cz/tuyO27DwjZyV/RxnpDJwL48dl2OCjL6IBjpVJd10H9f0OB6TTlI8/df0mubB7UERd
	 HTjbJEEyEDbqrIgWORCDhOI5PNd9WZ6CYcFQVAQyUD7xtfYfz8gDwdcWmkDBilNRoO5qa
	 06oZXLAhNyoWmza6AZbNPqWVBWTli8DzSHbiSkChveEWkqTU/MNUOdbEb4IAjHtHjP0Xg
	 /YIPsIEhoB1DC+qv53bsmN5m9qM10hYqARQzr2/3FiHccpKHrdt6vdxKcvb/KNsLYl3mZ
	 QmSClYvMWXfloICR5UfTc5vplQJZ5pgadT7kOagOKSmrRv6l3qvDMykaqd8Z7sqbrYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596065;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bFSR30B2bkPRCbYz2BJZupFxQPy9Yao/0YJYDzUTyEA=;
	b=onDi2YzOZ8HVi2J0z4pU432Gg4qYZmU3dXaebMfeDplMcifDcIHLglc8kMVi95KHeBhX
	 mBxUc3P4uTzYHt+OhUdftuX26JAROBh99BQ1Q0W+9b4G+qvMmsEN+Bcyuz7LCdRefCoSf
	 V73/PSXjiciP+Rm2gaTDyAm/cuMRKNScSrri8j/XSPUpbs5GMvLAcK7nyyZRRkIL015ov
	 PbUPKbSA4QABqTrPdEk4O1Ly1FjgqnvE7JLz1p8Y0lfuz4lf7MR+Slp/2/ZMokJ7B178H
	 O59jzMU86HBuYVoUZFcRZRgpS32NkGgaf69/gKjwv5FFJ3fKDEIkYxxdf/fqU5456MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ld4ElCrg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="G34/IVMc";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767C760A2637
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 767C760A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ld4ElCrg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G34/IVMc
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFQxXA2022396
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bFSR30B2bkPRCbYz2BJZupFxQPy9Yao/0YJ
	YDzUTyEA=; b=ld4ElCrgHBrdb1bK89sUY9Y0VWW1yeEnLrRGJh0xN03W1dlcvBd
	tJViTlVgW3oSS1XyQDJmFsss4tKNjC6hhy/IcDCDHOsV/9hOpEwvlaX4WDUYh7wV
	q8Aq+qMC41ViyWiJEvbNLOW1TBiNeHQnKxu9HKAzpYIO3C57TpfHdsnnpMkUr8WZ
	f2g5WfDOrzelbjUianOxb2mh2g1r3e0W6h4V6oGFtepWASZ/scemh3fpLKHP3Oa/
	6WZHWh1SRktSHBuORlNyz9rTZvuXdS12aPFUKfCul3gOlzUHoq0t8JtP5RyvnZpG
	GmILK/ps5VBd5Dp/vwblu0eKSs23ifdiqrA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g21vsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:54:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3969a2a7so225010085a.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596063; x=1795200863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bFSR30B2bkPRCbYz2BJZupFxQPy9Yao/0YJYDzUTyEA=;
        b=G34/IVMc9o/i49qjR/rWI10JyBUKPOJhJdvvpQ5kXF0tCron1oEcZAblkDlCQHpapc
         ZHlHcUjrGNCuTRKf6ibdn89MlhccD0ufBOquUT1PErU6UjRb0QVeQfnQpitIjvW3xVTv
         yAcd/+9m5BCAvYZcB+AibMa4dNxO1aCCNB64f9wWw9UoaFc/aXNY2cLj4xnRxGkriexh
         wFDBQi5kkA/lGSMa14SA6OxP7T6gjT9bhpBBIPXlAA56zTAuxmgRaQAVKw70OrmXuYV8
         CeS9iH50qh8Ou8CCjif1hZ+TyuqB5XXinyopHrVWsd/MjOing5pohMSwyRE2miiUxDzY
         5x2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596063; x=1795200863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bFSR30B2bkPRCbYz2BJZupFxQPy9Yao/0YJYDzUTyEA=;
        b=NZ31Hh1SxM0DhGGw4gZMM3CTx4ef3CBqUXmAd/ddj8FrgGu0swEBHo4RGqTEbUTRTk
         HmbVBu3oHi3M+P3/p3a61o8GEp81GZo9cxmFsV3G5qomigdMc+XN29APnaP3v85kQBPg
         0CCuwXQ1IWy/Q2A0XsGtgmwIANb3mNGEtmEazYTAmCpF8HxP93YmZXf5IGHa3WaTnkQJ
         WVORpBSgmcEmqOhLL4KCihqKBdbccFaYiZT88VWuRUVigQmuwgfdYLeK7yXbswfuH+Xm
         aI0ogjRaXyh5rHn3RnzXeplnrayefjDyudZyXrzn0PQ+K+Wg1mJKxxpVW+OxaErKrBzU
         E4fQ==
X-Forwarded-Encrypted: i=1; AL+hErHlsV0ICwvFTBPSucD5xNzFfYughjhzr9eQXaB3nguzxqb4W3mt01cmMMEHUMifMmwQyNSv17+2ik4jPe4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NDcOKuDfvxIOQ424fsKWafdogFyV7xBXZbcOMqW+ZqRdTCV9b
	+L4EmOWy0ABnoOgdspTA/iTgNwFT7x9DGvowrW+2QVUUM0XWQ3RvxgxvAoau0ErNNDGavq+lTGB
	OhCdKfzXG3LCQfDoNpGUaA1o1EmEwZv6iZy7+y5p7CBwAaF20IUUDZDS2kBOGJvks4rU=
X-Gm-Gg: AYBFou1wpJc/DaaNuaCX9lh/T7VqJeq2iXpnIC00G7EukuAhnm2Qj6Vvi7rzKJssdRR
	vRsa5Bdf7pCD4wvtFGFs7vYoMu+RUa5G3YvnNOziQAreY+mmxeXDAvfEzrIkGuHvLwlA2lsJdQm
	hZC7Ziai0Y6lch/2GE+uHekxS/ICdAIG9RD6ETTJvvgAsxW7bjVVLTVetSMwHr6ioiTnvCTx3S8
	ArFTTD8qfIZ8veJsFOLn1y3iSyiwrg/fNM6tApxo3hr/hNV1y3DXvxf0j90ztfAjcj68Ntm8z8W
	YmqBDpPZnGijzq7nwRuHptrEWAg44hM5x/8xEXj9+uE2yzS3RVxFgjR6AtxgQvfm6H/iTn1aQcs
	XNqJYP6JXr67lFDdCwk4E7sYAz8G6+XN+aUFJjrqW+V5ia0kvrog9dhgyOh+sfg==
X-Received: by 2002:a05:620a:2a04:b0:93b:cb6d:6d73 with SMTP id af79cd13be357-9494bbc9e5bmr584300785a.32.1794596062269;
        Fri, 13 Nov 2026 10:54:22 -0800 (PST)
X-Received: by 2002:a05:620a:2a04:b0:93b:cb6d:6d73 with SMTP id af79cd13be357-9494bbc9e5bmr584296285a.32.1794596061777;
        Fri, 13 Nov 2026 10:54:21 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608c5debsm6433223f8f.42.2026.11.13.10.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: apple: Correct white-space style
Date: Fri, 13 Nov 2026 19:54:15 +0100
Message-ID: <20261113185414.183418-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=18307; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=iKBmoS6Lts9jzpkYWP5HI79d7lCKZGtVNYeu24QXbfA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91zWiN+SmeMj4z6T7lHHQabnZ/fC9Ynt8/olK
 1cd/eV0YiaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdc1gAKCRDBN2bmhouD
 1xmRD/0cJBeOKCQCMEg1r8dF3/paVx/k7n/15SVWjx/D/XdpNGLdHGfJQKwO+G+UuGQ+jcFN68S
 /5RBt/2Pigcb0Zdu6aj0zdRxnOE0qR5IOPBFBzPx5X6/b8YAapjlixVvB+PLXw737zn4hLNTSTh
 Wr/TTSC/GCpld/J1JZw7G9MuVZmqfBCBnDwGmXE1+U4E+JYE13fxnCR46MDhOR5SgvOUmK4I2mN
 KV4KyuBy5lJTlDpa1YhKCKAn7UnNq1yPQguCI9Ogjc7v1pKN3f5LNP8cSl9cwG87Wmv/BPiLRVq
 Dc5dDuOE7FxNaIY1idEuGw8znyKX81WypZ2FAb0NFHGUNC+DYvoMLcoQSCmSx9m1M7bxGkKPjaM
 zvncuYY1CaXmppt5BMTFYNQauPSTgNAdizCU7nQg3oJsMasLpRo9vT7fpqFKh06Lt2yfyi1G74d
 g3Z5+/5MPuCtdmCAJfYe45izfTYeCWtLsF8DYFHpJULHf9FaCWxLNb+LlRPjxdwne+GsDLWxtNI
 lHSorJqP6DmJt5gJGF16sj80mhqtUc2C9XHSbwz5MkLE9MdmyJ6cYlw/02CIzqgFkLEEG02jZMr
 VZdP6o4q34zbxJqe8ID0gD8sPk9rYoshmMOgEIRvOtx12PlvwjnvDrudS4wc9VfqhT55g1GXV63 rsUZaX1U2FdxCSA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX+uvvsicOkmuf
 3VpwLq3Evp3PhiV86LBzwA04wsJMN/14DxMQnFXPUAvNsYrnrjD/qbrRSA8DwJMuCiEXOPLCbs7
 3+epiS69CpMUt3ClnVDajFEYx8JIQ+J6Xs1hMDopkA4mAODg+xhfqCwv45qxiGowooCGPx5oQfP
 1AN9uI4ERNmCjU5moskeUSZkgPaExe5VQsGG1kJs1V7MPIZpI42KMa0wqriyaRlWypyQeL7GXBr
 R3fbEiaWSXVRBv35OxcyYPW3XnhC4ekPH/O6cgKMLRbP2y7CIEouMOs9MKIwojsHmV3Xp2qhbXb
 D61CC/nj24hu2LSFbtm46QTUVKbvsUWFVHbWn+UFvyqqCcnEs02zdUzAIGKUusmkwNDPuiPNRDV
 0Y1+b0hEqNaGZKcYF5hJhaoPiDTcktYf/LkoJPltLGovbiaxpyXQbhxj5l3ABP4n4QHqLOdgqGg
 48zZXHb617/HelfGiRw==
X-Proofpoint-ORIG-GUID: UDwDr3QSU7L673OR_8ZTM_NlmTjnJn_5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXwS6mrhmgdSAY
 aobLjXILlOGCkou3Ezuk2aKeV9+OlCTPvrVpBzGoo05GGwDR+bI8djfJ4r0sCoMsQTPFXjVPfBY
 I83VzXzOmZ/+cMhmZjHfgt4K9dMQOW0=
X-Proofpoint-GUID: UDwDr3QSU7L673OR_8ZTM_NlmTjnJn_5
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af75cdf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=dE7Qyx03IvCetochvIgA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075

Correct minor style issues around white-spaces (e.g. double space before
'=', missing space before bracket, spaces used for indentation) to fix
dt-style-check warnings like:

  t604x-j575-j773.dtsi:27: [mixed-indent-chars] too many space characters in indent (more than 7)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/apple/t6022.dtsi          |  8 +-
 arch/arm64/boot/dts/apple/t6032.dtsi          |  2 +-
 arch/arm64/boot/dts/apple/t6041.dtsi          | 96 +++++++++----------
 .../arm64/boot/dts/apple/t604x-j575-j773.dtsi |  2 +-
 .../arm64/boot/dts/apple/t604x-j614-j616.dtsi |  2 +-
 arch/arm64/boot/dts/apple/t8140-j700.dts      |  2 +-
 arch/arm64/boot/dts/apple/t8140.dtsi          | 74 +++++++-------
 7 files changed, 93 insertions(+), 93 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6022.dtsi b/arch/arm64/boot/dts/apple/t6022.dtsi
index 0feda70568ee..56e3b3f0b6fd 100644
--- a/arch/arm64/boot/dts/apple/t6022.dtsi
+++ b/arch/arm64/boot/dts/apple/t6022.dtsi
@@ -79,7 +79,7 @@ cpu_e10: cpu@800 {
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
 			next-level-cache = <&l2_cache_3>;
-			i-cache-size  = <0x20000>;
+			i-cache-size = <0x20000>;
 			d-cache-size = <0x10000>;
 			operating-points-v2 = <&blizzard_opp>;
 			capacity-dmips-mhz = <756>;
@@ -93,7 +93,7 @@ cpu_e11: cpu@801 {
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
 			next-level-cache = <&l2_cache_3>;
-			i-cache-size  = <0x20000>;
+			i-cache-size = <0x20000>;
 			d-cache-size = <0x10000>;
 			operating-points-v2 = <&blizzard_opp>;
 			capacity-dmips-mhz = <756>;
@@ -107,7 +107,7 @@ cpu_e12: cpu@802 {
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
 			next-level-cache = <&l2_cache_3>;
-			i-cache-size  = <0x20000>;
+			i-cache-size = <0x20000>;
 			d-cache-size = <0x10000>;
 			operating-points-v2 = <&blizzard_opp>;
 			capacity-dmips-mhz = <756>;
@@ -121,7 +121,7 @@ cpu_e13: cpu@803 {
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
 			next-level-cache = <&l2_cache_3>;
-			i-cache-size  = <0x20000>;
+			i-cache-size = <0x20000>;
 			d-cache-size = <0x10000>;
 			operating-points-v2 = <&blizzard_opp>;
 			capacity-dmips-mhz = <756>;
diff --git a/arch/arm64/boot/dts/apple/t6032.dtsi b/arch/arm64/boot/dts/apple/t6032.dtsi
index 2a3a1fed59df..6115ab8db5ef 100644
--- a/arch/arm64/boot/dts/apple/t6032.dtsi
+++ b/arch/arm64/boot/dts/apple/t6032.dtsi
@@ -415,7 +415,7 @@ &ps_afc_d2d_0 {
 	status = "okay";
 };
 
-&ps_afc_d2d_0_die1{
+&ps_afc_d2d_0_die1 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/apple/t6041.dtsi b/arch/arm64/boot/dts/apple/t6041.dtsi
index 9110d05c896d..319035493a77 100644
--- a/arch/arm64/boot/dts/apple/t6041.dtsi
+++ b/arch/arm64/boot/dts/apple/t6041.dtsi
@@ -323,7 +323,7 @@ soc {
 
 		pmgr_gfx: power-management@288e80000 {
 			compatible = "apple,t6041-pmgr", "apple,t8103-pmgr",
-			             "syscon", "simple-mfd";
+				     "syscon", "simple-mfd";
 			reg = <0x2 0x88e80000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -503,7 +503,7 @@ serial0: serial@429200000 {
 
 		pmgr: power-management@502280000 {
 			compatible = "apple,t6041-pmgr", "apple,t8103-pmgr",
-			             "syscon", "simple-mfd";
+				     "syscon", "simple-mfd";
 			reg = <0x5 0x2280000 0 0x14000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -521,15 +521,15 @@ aic: interrupt-controller@502400000 {
 			affinities {
 				e-core-pmu-affinity {
 					cpus = <&cpu_e0 &cpu_e1
-					        &cpu_e2 &cpu_e3>;
+						&cpu_e2 &cpu_e3>;
 					apple,fiq-index = <AIC_CPU_PMU_E>;
 				};
 
 				p-core-pmu-affinity {
 					cpus = <&cpu_p00 &cpu_p01 &cpu_p02
-					        &cpu_p03 &cpu_p04 &cpu_p05
-					        &cpu_p10 &cpu_p11 &cpu_p12
-					        &cpu_p13 &cpu_p14 &cpu_p15>;
+						&cpu_p03 &cpu_p04 &cpu_p05
+						&cpu_p10 &cpu_p11 &cpu_p12
+						&cpu_p13 &cpu_p14 &cpu_p15>;
 					apple,fiq-index = <AIC_CPU_PMU_P>;
 				};
 			};
@@ -537,7 +537,7 @@ &cpu_p10 &cpu_p11 &cpu_p12
 
 		pmgr1: power-management@502800000 {
 			compatible = "apple,t6041-pmgr", "apple,t8103-pmgr",
-			             "syscon", "simple-mfd";
+				     "syscon", "simple-mfd";
 			reg = <0x5 0x2800000 0 0xc000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -545,7 +545,7 @@ pmgr1: power-management@502800000 {
 
 		pinctrl_nub: pinctrl@5081e4000 {
 			compatible = "apple,t6041-pinctrl",
-			             "apple,t8103-pinctrl";
+				     "apple,t8103-pinctrl";
 			reg = <0x5 0x081e4000 0x0 0x4000>;
 			power-domains = <&ps_nub_gpio>;
 
@@ -557,19 +557,19 @@ pinctrl_nub: pinctrl@5081e4000 {
 			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 819 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 820 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 821 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 822 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 823 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 824 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 825 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 820 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 821 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 822 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 823 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 824 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 825 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <61>;
 		};
 
 		pmgr_mini: power-management@508300000 {
 			compatible = "apple,t6041-pmgr", "apple,t8103-pmgr",
-			             "syscon", "simple-mfd";
+				     "syscon", "simple-mfd";
 			reg = <0x5 0x8300000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -585,7 +585,7 @@ wdt: watchdog@50836c000 {
 
 		pinctrl_smc: pinctrl@50c824000 {
 			compatible = "apple,t6041-pinctrl",
-			             "apple,t8103-pinctrl";
+				     "apple,t8103-pinctrl";
 			reg = <0x5 0x0c824000 0x0 0x4000>;
 
 			#gpio-cells = <2>;
@@ -596,19 +596,19 @@ pinctrl_smc: pinctrl@50c824000 {
 			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 985 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 986 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 987 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 988 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 989 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 990 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 991 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 986 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 987 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 988 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 989 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 990 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 991 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <24>;
 		};
 
 		pinctrl_aop: pinctrl@510824000 {
 			compatible = "apple,t6041-pinctrl",
-			             "apple,t8103-pinctrl";
+				     "apple,t8103-pinctrl";
 			reg = <0x5 0x10824000 0x0 0x4000>;
 
 			#gpio-cells = <2>;
@@ -619,19 +619,19 @@ pinctrl_aop: pinctrl@510824000 {
 			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 700 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 701 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 702 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 703 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 704 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 705 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 706 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 701 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 702 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 703 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 704 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 705 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 706 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <85>;
 		};
 
 		pinctrl_ap: pinctrl@51c000000 {
 			compatible = "apple,t6041-pinctrl",
-			             "apple,t8103-pinctrl";
+				     "apple,t8103-pinctrl";
 			reg = <0x5 0x1c000000 0x0 0x100000>;
 			power-domains = <&ps_gpio>;
 
@@ -643,58 +643,58 @@ pinctrl_ap: pinctrl@51c000000 {
 			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 478 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 479 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 480 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 481 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 482 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 483 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 484 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 479 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 480 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 481 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 482 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 483 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 484 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <200>;
 
 			i2c0_pins: i2c0-pins {
 				pinmux = <APPLE_PINMUX(56, 1)>,
-				         <APPLE_PINMUX(57, 1)>;
+					 <APPLE_PINMUX(57, 1)>;
 			};
 
 			i2c1_pins: i2c1-pins {
 				pinmux = <APPLE_PINMUX(58, 1)>,
-				         <APPLE_PINMUX(59, 1)>;
+					 <APPLE_PINMUX(59, 1)>;
 			};
 
 			i2c2_pins: i2c2-pins {
 				pinmux = <APPLE_PINMUX(60, 1)>,
-				         <APPLE_PINMUX(61, 1)>;
+					 <APPLE_PINMUX(61, 1)>;
 			};
 
 			i2c3_pins: i2c3-pins {
 				pinmux = <APPLE_PINMUX(62, 1)>,
-				         <APPLE_PINMUX(63, 1)>;
+					 <APPLE_PINMUX(63, 1)>;
 			};
 
 			i2c4_pins: i2c4-pins {
 				pinmux = <APPLE_PINMUX(64, 1)>,
-				         <APPLE_PINMUX(65, 1)>;
+					 <APPLE_PINMUX(65, 1)>;
 			};
 
 			i2c5_pins: i2c5-pins {
 				pinmux = <APPLE_PINMUX(66, 1)>,
-				         <APPLE_PINMUX(67, 1)>;
+					 <APPLE_PINMUX(67, 1)>;
 			};
 
 			i2c6_pins: i2c6-pins {
 				pinmux = <APPLE_PINMUX(68, 1)>,
-				         <APPLE_PINMUX(69, 1)>;
+					 <APPLE_PINMUX(69, 1)>;
 			};
 
 			i2c7_pins: i2c7-pins {
 				pinmux = <APPLE_PINMUX(70, 1)>,
-				         <APPLE_PINMUX(71, 1)>;
+					 <APPLE_PINMUX(71, 1)>;
 			};
 
 			i2c8_pins: i2c8-pins {
 				pinmux = <APPLE_PINMUX(72, 1)>,
-				         <APPLE_PINMUX(73, 1)>;
+					 <APPLE_PINMUX(73, 1)>;
 			};
 		};
 	};
@@ -703,9 +703,9 @@ timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
 	};
 };
diff --git a/arch/arm64/boot/dts/apple/t604x-j575-j773.dtsi b/arch/arm64/boot/dts/apple/t604x-j575-j773.dtsi
index 57573550cfbb..85690720d213 100644
--- a/arch/arm64/boot/dts/apple/t604x-j575-j773.dtsi
+++ b/arch/arm64/boot/dts/apple/t604x-j575-j773.dtsi
@@ -24,7 +24,7 @@ chosen {
 
 		framebuffer0: framebuffer@0 {
 			compatible = "apple,simple-framebuffer",
-			             "simple-framebuffer";
+				     "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			/* Format properties will be added by loader */
 
diff --git a/arch/arm64/boot/dts/apple/t604x-j614-j616.dtsi b/arch/arm64/boot/dts/apple/t604x-j614-j616.dtsi
index a64797518eae..d8238b40d143 100644
--- a/arch/arm64/boot/dts/apple/t604x-j614-j616.dtsi
+++ b/arch/arm64/boot/dts/apple/t604x-j614-j616.dtsi
@@ -28,7 +28,7 @@ chosen {
 
 		framebuffer0: framebuffer@0 {
 			compatible = "apple,simple-framebuffer",
-			             "simple-framebuffer";
+				     "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			power-domains = <&ps_disp_fe>;
 			/* Format properties will be added by loader */
diff --git a/arch/arm64/boot/dts/apple/t8140-j700.dts b/arch/arm64/boot/dts/apple/t8140-j700.dts
index 15c21c9e3f2b..cdcd44e72bbb 100644
--- a/arch/arm64/boot/dts/apple/t8140-j700.dts
+++ b/arch/arm64/boot/dts/apple/t8140-j700.dts
@@ -28,7 +28,7 @@ chosen {
 
 		framebuffer@0 {
 			compatible = "apple,simple-framebuffer",
-			             "simple-framebuffer";
+				     "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			/* Format properties will be added by loader */
 
diff --git a/arch/arm64/boot/dts/apple/t8140.dtsi b/arch/arm64/boot/dts/apple/t8140.dtsi
index 3b4f7695552b..676f6a19f69a 100644
--- a/arch/arm64/boot/dts/apple/t8140.dtsi
+++ b/arch/arm64/boot/dts/apple/t8140.dtsi
@@ -152,7 +152,7 @@ soc: soc {
 
 		pmgr: power-management@300700000 {
 			compatible = "apple,t8140-pmgr", "apple,t8103-pmgr",
-			             "syscon", "simple-mfd";
+				     "syscon", "simple-mfd";
 			reg = <0x3 0x700000 0 0x14000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -182,19 +182,19 @@ pinctrl_nub: pinctrl@3081f0000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 473 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 474 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 475 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 476 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 477 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 478 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 479 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 474 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 475 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 477 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 478 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 479 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <30>;
 		};
 
 		pmgr_mini: power-management@308280000 {
 			compatible = "apple,t8140-pmgr", "apple,t8103-pmgr",
-			             "syscon", "simple-mfd";
+				     "syscon", "simple-mfd";
 			reg = <0x3 0x8280000 0 0xc000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -221,12 +221,12 @@ pinctrl_smc: pinctrl@30c820000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 572 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 573 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 574 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 575 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 576 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 577 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 578 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 573 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 578 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <6>;
 		};
@@ -243,12 +243,12 @@ pinctrl_aop: pinctrl@310824000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 380 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 381 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 382 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 383 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 384 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 385 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 386 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 381 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 382 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 383 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 384 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 385 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 386 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <57>;
 		};
@@ -265,12 +265,12 @@ pinctrl_mtp: pinctrl@314838000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 1128 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 1129 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 1130 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 1131 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 1132 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 1133 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 1134 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 1129 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1130 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1131 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1132 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1133 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1134 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <10>;
 		};
@@ -289,23 +289,23 @@ pinctrl_ap: pinctrl@31a000000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 263 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 264 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 265 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 266 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 267 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 268 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 269 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 264 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 265 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 266 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 267 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 268 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 269 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <216>;
 
 			i2c0_pins: i2c0-pins {
 				pinmux = <APPLE_PINMUX(171, 1)>,
-				         <APPLE_PINMUX(170, 1)>;
+					 <APPLE_PINMUX(170, 1)>;
 			};
 
 			i2c2_pins: i2c2-pins {
 				pinmux = <APPLE_PINMUX(165, 1)>,
-				         <APPLE_PINMUX(164, 1)>;
+					 <APPLE_PINMUX(164, 1)>;
 			};
 		};
 
@@ -357,9 +357,9 @@ timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
 	};
 };
-- 
2.53.0

