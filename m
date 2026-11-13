Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596050;
	b=Axtg5dJeWVYz2nfMjH0Zu4zkeLXt5kTVg4o2hd7HxdKPW0y7aT3SvLjic39qvdFiAyU6
	 vNQvQuIzsYFY04AOZc19a8bv/22j59EwwUuUH1AzIaSxfIHQ2EgXb+OdIuOOC/q1S3Fwg
	 WG5lEfGIIXkrCh1Z5qe6oGj10sR5GIbKfEI/kGggfFwCSMJo9PImX4yG2vVf9GtxnRZaS
	 aU0GW02k8DbULfISPGGk/MUJZ6ZgwTRPWg8LIorQHY4wyKaEY4kpPNKWR9v1IU+Hj3S93
	 7PEQAELX42r5ausTlepwA2+ErAw1Xiz5FcUWcuzxl3Lx5+Ntt/7WDO/FQwoCTagkRmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596050;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5blIPjIlG4Tqncmpqw1YPjyfSrVOP4aLHlJQeJVXqWw=;
	b=YlxqrKdyD4yX6MfJX+OwODP3CPWZBqkfhllSunjX2gAV2Ld0ngoIlUeT8DiBrsWJJBxJ
	 EuJTnTxLQlTR1s8NN5VJscy0G7By+Nul74Dh/wOkftvJb4POvYYTZZLx6ndgWQtpMmxkB
	 AlWREgJOXEktgMdJC3KYw46Ak4tuLmT3XjNilm1IRxjFX7VJSuenRJVvb1l6LzAJfnjG5
	 EOybxlNrIb4FRaW+CFfriHv0c+3oLoaQoWUxDTH1matEQDgpfztuvJRkJrguzilS47BI3
	 Oit+MwxdQNV+JdOJAuTacl35p0UAdYaX00lUyY1cIaymU1xrWaWRAb06Ub+fy7JngBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F4C3p0uT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yiu9elz3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD66606A880
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDD66606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F4C3p0uT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yiu9elz3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRTDg533308
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5blIPjIlG4Tqncmpqw1YPjyfSrVOP4aLHlJ
	QeJVXqWw=; b=F4C3p0uTcayVoNsjTKTmaLlVTDIWq5+em3PnoebAU5jDnbrofFq
	S36f7AG06UvYBUS8nh6TWKxLxv2n3JzVOfe7E8l6EhAbBbSo3Ds6jW37Lmdvr73W
	LXpfxW3WsTp1uKcxD/eh1J1jZPXhwKVBUI5+G2kw+1P3s+6+Xcay1DWE/SAudZt2
	rXMDKBdh9EebD2IH5Jd8Iy3H1zH9eA7+wJpEq7Uik6dow/eXQI4zKibhYbjIR//2
	1RTWK3wr/co5+1woLUhgplQt4kj1d+QJ8CI5IQbm+U3ywe9cFYTyFLkJV9zdWEJS
	Jse6WhxgFbl1UOH5gJevTA0ipc46NPISVRg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvjaasdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:54:09 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2e2cd9c85so1180319137.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596048; x=1795200848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5blIPjIlG4Tqncmpqw1YPjyfSrVOP4aLHlJQeJVXqWw=;
        b=Yiu9elz3NW5WVT99hbtJmQx1POhb0hNZUHQEhd+9lXM+zd/O7Ifa8OOqH/qwRXr4++
         qE4kKCJ3YKA9Q66JX+OKwBXBFFAhtFOoISvb7izg2RqLBRVF3amr+ca4406BVP0jGwyf
         HSvSd50aVhbtihZKyd4wkvebfWSvaza9v67Im6Om1UyKg75VBB/o43WSrSlzP44b3ea7
         nFVxThmG2ryltwZlBCLzAJ3TEnXinCqQyWevAr6T+7uZ9lGwBtns71AbT7qEfagMwWXm
         4K9RygAxeHBh1nXSHDEAJBDv+5pm65LTPqkLF0QsyTACjBdBPno2FV/AvLHTPcs5RxTd
         B1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596048; x=1795200848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5blIPjIlG4Tqncmpqw1YPjyfSrVOP4aLHlJQeJVXqWw=;
        b=nnsCTZSAd3mW6gtRvnEDT+qW1A7wKKwJYh1uRM5MEl6bzx6h/h5933v1vXqJZHjCCl
         IoYEKdYyXwyZk3SzzYNy10ye6ba5n7xzGGYwKLdPy1Difd4PADdrzAKXqHmb0JgaT3NE
         vd4Fy9alNq1xEjr81HpjQ6cQQGZ1khs0jfRAEwMAqDZdgb5iGfItKz7j2nrYsWmV+Tys
         w9nAN8dLUsQwnuHBEnWIeuFzH5wFLZbvma6uY486FRTT8yW2EOLkmEUw9oRPceCR5IOE
         /nEjnE7xStnBGZvjZOC8VpB35ZeP8AOy2ejN17wItJ2IIHcPOTMPbZ9o1pgQV7Q9gndH
         8M1A==
X-Forwarded-Encrypted: i=1; AL+hErEvKppVZqjSEuF9SowXLwDRWogiF4JWvBzUclBEKAPrbtYGw+GybcshACqHYGmA6TrSN19DFpGnNlTV4W4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/33uk9MQjgODnEC0qzWygw80iQHJFjxrHAkKVsLjBBWGrXvFK1
	VzGM9xko8TqtEglXYmliCdmzuGwLN7LBdrZdp5eAcIIqZq35G2Kd1cGMQl85k/Q2cPC5gbG8zHT
	K7cxO9dCGBXmQhXR8Y+DFbkf9EsQ20Tr15t2XWETl4gbd/9dTjuny5UrArL7ifKrwKKkJ8FA4Nu
	E=
X-Gm-Gg: AYBFou3WU9mowg2GSd3VA0Dk5zrTYvcuFEfKzZwn3IEPokT99Zn/6zLRcPJwJfuBOpP
	cG01JoxeNHYfVk+nh5xV00PLQDcD6vxvNuT20yxfdcrzN/C+1H3jPazbz+hbdPLzFzuTVqxVWCh
	dYV7jpkne9WSg3PU9/URNmFvneXhxvuRcQqrWid3Q/Bnwj5ciG4TiaFtN08mtgva/J4YLA/Mg+3
	e0MzWB/DYOJNdR2yhLhrxL3CAO4JYJ93MdILUaOwuzzzzUWCe1uiM6dHo9W8Tlk/aa+bVA+LpPx
	V5SKZh6MKyLzGC2WpO8EFIc8QJ04gcrlY+Kl+JRlkhdwmT/z4YEsMTN6DRT18J2n+55mJsVUNpc
	ESJHB+UVNwWB6k/iRyx/IOMStPznsIrhG9ODIMYej2fdW8bP6i0OHeRby7rBeYA==
X-Received: by 2002:a05:6102:441c:b0:7cc:115:ddf4 with SMTP id ada2fe7eead31-7d64d847dabmr1495147137.25.1794596047728;
        Fri, 13 Nov 2026 10:54:07 -0800 (PST)
X-Received: by 2002:a05:6102:441c:b0:7cc:115:ddf4 with SMTP id ada2fe7eead31-7d64d847dabmr1495126137.25.1794596047168;
        Fri, 13 Nov 2026 10:54:07 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5b4a3fcdsm45640325e9.0.2026.11.13.10.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@nabladev.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        devicetree@vger.kernel.org, kernel@dh-electronics.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: st: Correct white-space style in stm32mp2xxx-dhcos
Date: Fri, 13 Nov 2026 19:54:03 +0100
Message-ID: <20261113185402.183367-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=789; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=8Co3w560jrj0hkoBQfgpSV92w4nLlNZ2yKdgRK4VsXA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91zLBYTXZN4JwUJB5ATvPeHihZEaceg22dgyQ
 oXMh/poDMyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdcywAKCRDBN2bmhouD
 1zwpD/9HHdOVPkCYc/ZkoTHeCwfHgj1qnHMhAOqNoHoABa0ykth/ZzERBSFOXlnfLRB6U/kJSHD
 LTtjX5ypIQnhzs66OAbadpoz2thfGBrCY0c5u/I9C9mPW+06COXIoty5p9K/umkrxAtrcdBXTRZ
 zpMbGdo8tZ2zp6CrjZhk0eAu0Xmf5Pia8sTsc76agOiAHQwSN/gIS5aZXI+QNICnqV6CEGeAl2K
 xQPJZFTIj+uP5y/qy1/b13d5mU23Ay7NeEpmIXAhSrvWvc1i8+MDXqYH6WqxIlgIerCAESWRFAk
 WbvVphDqvgmzkq13kyTUkKE3bIAHCyk/47Y4IvIfX8sFFLXgEs1i73nn9VeXoKplXnJ15xAwhJL
 nk9pdUqF5kLsC/jTRocUq1RMp68RGntnwtfxzMYfQSQEPh7CRSZ/2AKy0IvQgNN0BdmrYJ99ex0
 C2afV9PEtUpTAW9N0sjH6Nckt5PioeYhFFLopQBKZYX09TfVuulPg0/lIfgDHesKDasekbdboWA
 3bK00HEP/kujIl4yNT8vz/yMR/UDSPAPKJ+JYLwkGQ2uvqVf61YnjNI+sEpd7SQctyQet+Y8Om+
 vF/SdkFcG19/gdw8PmgwJPQVBHcGQbiVnlbMwQEewYi9o8y42l/hhNL/kYgK4ylKm5N1QOvpmCd kZNxbeyEtae6kKw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MJiazMkIFav9pJ4Vqem47DQkRBzO9Rpp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX1z4k+RlgWAW1
 uYe3k0ZkKR8KKD0Qhqx0TtiBwrYTij+5RY400IEb6TQazbKF+dMSsNlHlPxT5Y5Pq8FWDezxoLt
 2JTTL7B5KHi1ih56mRrXiue4p/6Nuhk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX7SBWZCdS04p+
 hfRe77Ys7DL5ZRKJE59bmxTroYUHvT3fg0Zxeo66VfxHCKtQGyEk5GCVNw5997hchS9yX75cBll
 n5KM2RNy9Hbga3yt7+/ILPtIEhACKES4nJBG7mx1sNnxEau9qBng4A+5L+XWZ+IbRb31i3Vd4Dv
 wcS1348tN5pj25kNCigChWJn3AQpz/AFARCqunfvv0f8pHVXYY7c45tA3YSDyJJYJIrSfb0Oy3S
 mGo5UkC+tgALaJJ0rEt2NO1rguiQESM524ns/ILMzA1KwUvUccLCVbrZMDIiQx2YGdtlf6bWU8P
 TKSlyn+yMPSSR0k5mIopkT9JEylH4Efff3VEOYGUXym7Hf4pgXBEskJTh1KfjCPAcghShSzELGT
 iTGh/5We9th3VB/17uirfbXL3CfRr0ZyuUEmtrBVic+8VILZ+wN2TDiVQrEYra8GBZMG532mDwT
 wtHKrPzVME6/9JOb1yA==
X-Proofpoint-ORIG-GUID: MJiazMkIFav9pJ4Vqem47DQkRBzO9Rpp
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af75cd1 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=F1UETNCCN1grUUcvQL0A:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075

Correct minor style issue around white-space - missing space.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
index bcf63e2ea989..5453389c3ef0 100644
--- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
@@ -97,7 +97,7 @@ cm0_cube_data: cm0-cube-data@200C4000 {
 			no-map;
 		};
 
-		ipc_shmem_2: ipc-shmem-2@200C6000{
+		ipc_shmem_2: ipc-shmem-2@200C6000 {
 			compatible = "shared-dma-pool";
 			reg = <0x0 0x200C6000 0x0 0x2000>;
 			no-map;
-- 
2.53.0

