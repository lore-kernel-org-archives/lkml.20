Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922738;
	b=S7UMaorkWt/Xh/PjyJEVer3ZbF3LLT6mNN6iRLcqijHHk1rjt+36TXglnCZsitx7HJh5
	 uThR5jKv5r+qsuSqs8uvh6HaoBKZmJtC6InexPJQqqsKzNdvuI78n5VxTl8ZjRUSHh7aN
	 ORkwTRnubKHqRXHCUZI+BExq+DNRLlSrkkx15b+TqVVbkWbHr5m0v9znym2USFLEXvhlZ
	 yOOPuns2rcbHyVMmZu1m0Q79VKSyJgz4Gc/EyasROa8y+ERhXTVtGVVS96iR4Hl193+m5
	 uDI1zO9m64i3wNsIsdoo9IeG1H3PYPMRU5/f9BkL0CwlEhn3AXN2WdNXo2PSyaG/vFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922738;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=paAaVYHLFrA+QS/mFBTaOWWEsc1rhEBK7fRyLBDWW4w=;
	b=mDLttHK1BhiL/pZUjczn/l5Te/ViL7lcewU5tuILInWcXkKYJZ6tYyXmkHv/+UISY0j5
	 XS1NHGCD5yR5d1K9aK0NZmQtwj5NVCctfZwzVQap3kRZHxq36WAfl8VY8Q3SVQJLUbRip
	 rra9RCXez21OYyqVqUDouArIFRUX19riNw3jgJGiTFO1c3lhKyJhzCxocMGc5g1igb/cu
	 2cwtedlPIrimA6WZ9QbsNRSO6jM5+tos0rSwTw0XLxWKVjgiWHEZedzQOQcwdZh/ClURL
	 P8NLOiY98ZdAqiU0vr7p4GO+Icw7HInfZJkFuYSb7S3LuoNORhA0CN6GlK1npJQDFhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nhXQjsl8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="IIs/8KKm";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9390E606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9390E606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nhXQjsl8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IIs/8KKm
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC3vGv2096558
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=paAaVYHLFrA
	+QS/mFBTaOWWEsc1rhEBK7fRyLBDWW4w=; b=nhXQjsl8FjZYXud61fLT6Mshb8U
	Z8t+fMsevFc/Tl1Opma/c7OXs0Q3HkS9p9g8RFSSu3Oe/pj4OqFU1hxNEIXE1V5w
	ZVtRWKo6EdEEdRyydPvpJn6XsG9xlwyb5a9k2lQXz2oC4ZAo2EyBlbG13Y5eiuTb
	MJIfWstq56H6cFSSHjpgDnaGduLPeIyetmBLB3HyLfWCCCHuSb4xziw0xPAFswtM
	Of/PzEWomB01n6ZoBiXMaEyMImBNsRzw4WEHRtADt90sRFiNioudBuGdDsf+2X+W
	5uxwUNGxu8TyM2S7D0sL5vNXxEofPT4MesjQ1h+6d763/zlMTWLEzSrV0BA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h2smv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:38:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so1169066885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794922736; x=1795527536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=paAaVYHLFrA+QS/mFBTaOWWEsc1rhEBK7fRyLBDWW4w=;
        b=IIs/8KKmxVUsDgEeGx22I+gxEhLpO3Zorqu+dOT9Iws3z67U2MF2nzcrNXzkSEaEFv
         O2isXAZ38dpA+WjY/2GenB7soND0BR1f7oHky0oZx/h2UOEkZlqQqE0gBIBDRzU8MZa/
         fym4h9ZF1JphFO5WSaT0T6KSjNDiqx4S1Wi6J3rvSzX2YUU9+WcV+gYiqIjbvTG371AK
         7is/5COHwEkVi4ytL9IGmfQbwPp6Xd4ZxP8/tJsem0KPkJbaGF91xyB4/a4duvmp6CSx
         MAIcZ5OFogrLwCRUMhhtgDv69Rup+QTQRuMAN7yTPMUvm/YmGhleapGtL8U5hvf/DI6c
         SQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922736; x=1795527536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=paAaVYHLFrA+QS/mFBTaOWWEsc1rhEBK7fRyLBDWW4w=;
        b=ztDBhq+KoU2T0cW3l+T3bGfPmhzZ0PEhrOpPuTlMqPrOKGBfYyDwfsWrpeVn8+XZBS
         SRNUd1Eq8bkv7O/1sUkelTLUTmsdvaAvtD3qAXedBpNHfw3UHL7IwUVumU0aytx+Aicd
         w5l7ygUBYEOUqo7t/h6UqEHuaRKBEBoITHC4cakUEGPwk5U0mOCpwsJQl7j7Q5FhPXTF
         DxZ2VUo8EQ7cHnWhWQUOgQJG4kHLl56APw9KDxCVMcg1ymmini1wlP8fLqOJrY+ONicZ
         L5iB7O2sXXh+k5pRiPLIhEJUUUgVE1uSPpkMQ2VPJMLmZ4kk4sCs/Cq0z4FTwhSjHWhn
         aq3A==
X-Forwarded-Encrypted: i=1; AL+hErES/jdbgPd+T0IuZd1m326HudFGUSiQn30DPdDOuUH7FOP3s82FZj/jrQUoqqMARPjAmnhITYztK9ONfxA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lIB98lj9omApRJ0ROiYsDkf/WIIhRrbJlnIkTZ62Yld0T93SP
	Sek9GiL2I2UbpGFK+zBhWvDnmS2Cf1kOZ0H7iv6UAmJsBzpwNX932F7bxcYmXk5C8/K3GxW0YYp
	XOsEfRqWRVEbelu9rHtbFHSy2NaVqvaZlgAmWH3868RxnadlzYzQxgZMhgXGqkqDf+Uw=
X-Gm-Gg: AYBFou3w4f9GGMyT5DQzXZDMydMfOQwUvK2MGst1pk4ppVQmLsRDFgv8ViBMQZtZ+uS
	p7+6jIcMsOasGruloi/soe61R9tDLtLknbyUOPuGcpjqVTixDqQ0b4jYwUkmUzoKusi4YJXJYw+
	B5xwT8VdwKGgdjQ3jJ+7feepIt1hdgK4hzDQR+tdCCMpsXeawUAXts678xT4A2dilPvO3cncgly
	zPx74iykDtlC2MxseB5kq/ANOXGhB5VMTCiIRL2ymtn2QfMdZTRt3Yvg1LDfAcD0Tk1XeUtlOnH
	RIC1FsB3XlSDyPSDo39fEN/103fDHlxzCoTmJk2v3wKmMV7pKGOQ6U1ow0ax9llZ+iWZHUvamHy
	LVtuyf+Jg5lolJLLobY5VGndBXufWivgwCknIKWqMDWpqy81DNvGPjDc92HSBLw==
X-Received: by 2002:a05:620a:6508:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-9494b9c5b55mr2121290085a.1.1794922735611;
        Tue, 17 Nov 2026 05:38:55 -0800 (PST)
X-Received: by 2002:a05:620a:6508:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-9494b9c5b55mr2121285785a.1.1794922735149;
        Tue, 17 Nov 2026 05:38:55 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a3ad4ecb62sm4066504f8f.57.2026.11.17.05.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:38:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: freescale: imx8q: Remove undocumented, unapproved aliases
Date: Tue, 17 Nov 2026 14:38:44 +0100
Message-ID: <20261117133842.245262-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117133842.245262-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261117133842.245262-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JeiN87X/rish5mj+l3Crpb2AauVxvJ/WY/Ci16QM4HM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/FjjEkg6Na1/foI5YSMp5p9UhUDig2YlQw9xp
 vUEnFRSVwCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxY4wAKCRDBN2bmhouD
 15rXD/9MxJ30eyPs75n8xdTYAn7I3NcEN5UEhdv+I0gAg80tgBOUr+MQi83c66n9apvVaONT043
 emhah3MuQ5A4QyA5LX/NnGbU9bvH2aNkw56RbHtIHeN1rTz3jopykskPSGJ8G/xMhxI/aWljQ+V
 j9Ib3ZMcGqaSgvaIoHDj3ITViJypxbWzk9sX81qucr+OD/7uSJahsmOcbCFBrEcx2FZDSSxgX7U
 iRiB+OqYKRSIRx9Hg0Hf8CKz552A0Dxt3GUio9njPEMAbgxPLpndiL8LbNVJyTSVc2UVpbUtOxm
 SUg9Q8e1ndUkjhEu4eDp4+aoc5ZyQOfvoMbzjGdnwEBdAwEGv1sY6LPA3AP0KU0Qu8sVyVYWRNO
 wG497ztclVJSENcQSZ6aK30B5o1hJm48lGynDAoF9/WiYka8XISkrYervUU0kXrFUV3nMpJfoBU
 RSp5aFppqdP1FxTM3YJ3vuH+4MeK3Z+e/q6g6wWGqUIS2c1nt9QmVOeJuDDjnO+QnEsq9jJMCNj
 Q5DlAQmcX/aip5onLVyiWznY77Blei8124tCLQqn6EPKuouuruS3knrCO0jwn1AOLW5PE4/VHVt
 XFaDJ+V+G2ophCoRtJY7uu//+/GvEXOTawW/5ZwcKWG+wpRUXlPJJSlWVCGFIDEKyOxJxoU9ySY IIkFguXhdIIJhtA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UVvO8gUA32LNfjLgr-ak7rMiy6h1iM6m
X-Proofpoint-ORIG-GUID: UVvO8gUA32LNfjLgr-ak7rMiy6h1iM6m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX2+ZsyNn8mzDX
 7bSD6drh9D/6N0aXQyKhE1X5FIdbaO9Duo+vaYOczGS1U0kHOGuceNq91KX7Kl8+G6+9+Sc5/RN
 Brt0sHzzKXSOHUXbR/RmGdOkq3cTRwZStKAvYJ+bfNf6c91/VfiB2/X0xDX9o/aIjwSC48dH18a
 67Bdo/fjeImWRbN0uPI6zjy7MCsp22XbjNe6tW0uQQcT6wNTPg7HMAV2ksI4gFAQk8LByo3BnoS
 hl7yqgxCj7H+HIEE4kivQ2KFa+2DGGj3ywcfczOuLlFqGe2hW0+BQMW4GRO+WTXSrAs7vPyrUaY
 he9CkZ7Riyz8E1HRHori2tZ1kwOopOBcSo+c2ATjU5FUAHCsyEeidrAFbo2evieuY92HgQ4jWeb
 Oov3+HJSS2DKXXdf1FgqMF6HebCkiKGFi0Hd3zLynee2rrcuk+ofltfymfWEFURC8ScINgNUu0l
 T/bvsrhO/KX2Ngbz5kg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX2jREBuOwJPGy
 1MgU9I4/cx277WdD8z09cLlkFcfGNePYOn44dvYOztY/CDlRyQSScWIJp5gksKlCn2cMymxaGDu
 aNUFnn0j+Ac8rRfeE3AOYA6fYiQ5jvI=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc58f0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=uBP-owwiYe2Lw3drMN4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170054

The vpu-core aliases were never approved by Devicetree maintainers,
because they were never documented as actual ABI.  Drop them, because no
new custom aliases are allowed for years now.

Important: this will break users of this undocumented ABI, so these
should be updated to use only documented and approved ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi  | 3 ---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 2 --
 2 files changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 9f9b34153ad5..f9d1c166bfcc 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -29,9 +29,6 @@ aliases {
 		spi1 = &lpspi1;
 		spi2 = &lpspi2;
 		spi3 = &lpspi3;
-		vpu-core0 = &vpu_core0;
-		vpu-core1 = &vpu_core1;
-		vpu-core2 = &vpu_core2;
 	};
 
 	cpus {
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 7c4a50e0ec9e..82f640efc74e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -50,8 +50,6 @@ aliases {
 		spi1 = &lpspi1;
 		spi2 = &lpspi2;
 		spi3 = &lpspi3;
-		vpu-core0 = &vpu_core0;
-		vpu-core1 = &vpu_core1;
 	};
 
 	cpus {
-- 
2.53.0

