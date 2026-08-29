Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DFB367B99
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032421; cv=none; b=X91lDytPgMgDR8m8Coz0gummlC1DdDwIo4gi5bduPrkpz5WZv9414Blf0AkpIhYc2gBuuQS/6kRXinwpup2bhYbOg+MqWKpvyaqg07+b2YyTdxj8GFSSocIK0eRx//YbiyFkzmKqqIGJbpeg5WaC/Vn4ehNyJH9vT2M6+3x9U8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032421; c=relaxed/simple;
	bh=PYY9YRoXwVt9ZtCr2VOyzXNfCWWVJTDZHV8PRm29vsU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MgjdjD/y/DqfneemHOt0W8Em4HE5vtklg0H4wmTtqDJYzV0aQo/paLKXTnr0tfOEZvu2mF0dAjXfSqgU6qrd80opL1cPPmD/MU38ubJN89aKyXQ4kiSCPrSHbALQeiJHOdFiZ7TUf5utQmPhEzG1yKU3tlw6mi20zuYdyj3xA/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPBsudnO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h9oJExeF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPBsudnO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h9oJExeF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGxOQW1742845
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dC2uPKn7Bz9c3JOaJ4q3xOJQPSlGj7uAtT4
	3qOT5EtM=; b=BPBsudnOUJX+AFr950m27W/F0f49ufZHGY5ky5OUJd7wOg+094e
	hObU4ab9EfnxjPUNAGKKd8k2yAIbwNGRNw8+lJMgbd85J+jNjQRyzmYvqRamXPzt
	vKX4c/5GDNuREoQ1VW6OBFscl6G3hvuCgQj/qmqKv57FNC5YHtqnPg60lMc1XvuY
	U7d9cJNiTqc3LjIr9KEVPVXIZowVWE0tpSMlkwgJ1WPMUYaSaYq4IxuBVhHFnpm3
	IlbUK2J7pYSVJlOO4v5K3ubRsOCtaOlFdCKUty4B6w7e0XFGt6pp8khgZEFktKKB
	B3YfpOdTvApkurs1fJPoNNyMorSyR8ZS1Jg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq81g3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:40:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52f52ccd459so32130061cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032418; x=1788637218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dC2uPKn7Bz9c3JOaJ4q3xOJQPSlGj7uAtT43qOT5EtM=;
        b=h9oJExeF5tPpLHNsMJYmOgdTyZR6Ca34RIcDDaGbcSUZTIrbJ5KIN3fqIb2FOCqLUo
         4sh1wpMTU+5vJ+70dXuMHoParz7j49zlymB9gqZFUW+9ONdqgKfAImKa3KL7wLSlexEU
         FWoOpTxYsqGr8jUvZiqFEqt5kJMJk2S7uS/6BVBEC9nLuAPEzNnprGb1moMUPIICrKM0
         lxXQiqRFlFwkEvtdzegcIV0cW5dkPIpuea+V7KOU8MyA0zpG6wtZcKVB5cOwzJ/sUv4s
         dtNXMRDUmskcUNaiVQI8Ss5PUfhGHG2Gl57WZ/4B+zDY5II40PxWa6ay+CeT/XEtFGUc
         NXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032418; x=1788637218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dC2uPKn7Bz9c3JOaJ4q3xOJQPSlGj7uAtT43qOT5EtM=;
        b=a0vE31t6+yQEdzwG0G7bn0c5JMVw+4IcnIwW0wYImmlI3f2Q0WoM8rzcqOnESbySAR
         kp90+ds97OYjdwMj/Je43cqdEvoeQZnAoYv+JibykjexpHexeDwkYJBe8cnA9ULncRWt
         ahKbYQ1l0tc0FoAxQY/wnLFI3HU3hoDjGdJ2Ha48g8DjkxmTbFOJPCOKL7HaWcJF+/AX
         nKxzquZfz+ysjASkEyWOiamtISdfXaZDvZKp9Z97yUuNjp5zEBZIlRnN7879nke7dD/Y
         B11iiMuYMDIUYOKk2u7ifLhIlO7w859l84kF70TZdlzmCnxgCZqMxNoRjSo/0jsdvRjs
         xMnA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5tg+qVZPCldHA3GRyVQO0M9K9ZWvG8httBT9UsVgl36Pk59V64IkMWCfMNiPAhPL0KwqtF0mERGg9nGg=@vger.kernel.org
X-Gm-Message-State: AFuF++mIHTzp+eByqJPLSjNXFfgpVoJH5U6GpGwNPOJ2jb1qFo1xIBFI
	3d4pzQ0MRdPf8/ufoE0wCw/Vo9HKZW8lpdZXwzQFdRhPWJjid2l3s2PMYoR35uMjaCAmatWa5jk
	G5nEcMEYvlb46Nn/Bo+uB54O/0h7m5xh1YCsAguQ1kuw6uVMecrPMEG6Tkb8zwb6I8e0=
X-Gm-Gg: AR+sD10e+ODLN78lCGlEwf0Gm1oQrNL2287X4LCMvNc9GhjR3v1oZLpKWJJ4Y9cUHxu
	qYT8PXdLtIWEvhIjiU5MdhYnI9h4+wl9nMnYTdeartv6AJ6b6z2OYKwZO5JmyBpOIFuWxsBkgF4
	9tsBlJTnzW1HgqhYOdq+cJ02SRpMGDF38mwCvSVBT/kGzvoOyEM92JdtdwwjpQW5T9t8XD3zOkT
	2Ornw5dEqpxGgy92pyF9C3Tm1faS1jjPXWSVCM3gFwMRt/AQGkTOkmwZGYFe9H+fgu3g2QHdEkm
	qEHwFU8Nm60MmP+PmV0Su87L7Z/l6mlaItMEZr1rnS6d8AfkJAvxlhc3db9O2s3dA8TdTQq9s55
	H6KuqgJ2Oveb92DM=
X-Received: by 2002:ac8:5d48:0:b0:52d:2ddd:27c with SMTP id d75a77b69052e-52fb95f60d6mr206700341cf.31.1788032418183;
        Sat, 29 Aug 2026 12:40:18 -0700 (PDT)
X-Received: by 2002:ac8:5d48:0:b0:52d:2ddd:27c with SMTP id d75a77b69052e-52fb95f60d6mr206699991cf.31.1788032417790;
        Sat, 29 Aug 2026 12:40:17 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm212416845e9.12.2026.08.29.12.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:40:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: rockchip: rk3229-xms6: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:40:13 +0200
Message-ID: <20260829194012.107758-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=PYY9YRoXwVt9ZtCr2VOyzXNfCWWVJTDZHV8PRm29vsU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzWcMqWLs/zgfHWLjLhZJLNAx4ncT4EVpq9rf
 nxmpuXChd2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1nAAKCRDBN2bmhouD
 1/BQD/4sChCgMTqvyxUFlH7n+eaT665GUPdiOe+/Fi6nOuSPR9nbymJM05DyfaeVmG2KN+h7GA2
 APORSPp0WD+fzr4cP3LUEPvHvMGXfDH09KmavTDHJvOtqQ7RbiI740fKMMfC8SrY2T84s+SPN2/
 DCs8Och04ySRJE4NjOaMBCX7axazvucNs7G1Nk6lHemzNEKM9IbOM1Q7dpl3u0RMd+UUf+M5kCp
 RfHbpvhjQ8gAuqrKlJrwruhT+EdpWa3will89qC+GWjF62vMZxlyZzHxnUFGjIzUAIxdIhi0kkG
 VmMbzbAsmeo0CivgbQz0j3XSUzR2BucPg6ahSjyR4/ZQLR6D2K4kT/XWEool9WrCK4WQo1fEm/3
 Q0sdMLTKxyXcMXMc0Ps7oKmMX3S3nN4+ZVjfri59POt2xMugbofUaAeQzuIjiwqh8dt5WdfC0G8
 vIjKE8aO4UnhLgDKJ5lE+0cIS3VGJbeCOXrvPtLt1z8zg7zjX7kzecgJhWJpIIoonVvVcVIyrp7
 LfC/ZxdcdL5dPVtFWlPKViMfT+E6p2Tg/Ev3qWqEQn4BsJT+Z88f3l76RG0+OUKcbSaZhSwPaM2
 wGBGGi083TilyFXrDjR+c0mq6Mbbn4b5FmIYIdxjeR8McUVQhu82WG1s+RbfidzXTp5htwhy+Hh QepFMOx0wX6md3w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Rdul4lTUOIaKxNcfYLfLudXnhxvk61dv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX5I2OKZKsaVKM
 Ikkgrdhnyrh2RodY4EKMQe4bZXTM2rYBYJxhsLRrpIHQtv7bYIxiXvWOUFNtdqG+7oybcdhFMut
 vFkDD/YMe9li533Vym+781ttISVwAIw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfXx1+4H0paNo2x
 m05sakao7ZLOQkXEluoITSX2f/D6SwP6gZCBMmJkVJc7H5lJYRhKLCZ73ZtWaxfa7p4d/SNLehg
 VKIuLOSa5WQiN/YQPWZfaI/F0iCRLBD0+MiemYixvscYl7SMoemUrXwRtqzjlBaWvvZXPIBEUmL
 8iGQlAH0NToGbn8l6WuUel8Fbv0AWzIzwJ9UPVGiDfPI3gB6LIvTdn0RihLIxs/SEJS9ODtFkiQ
 OYb/ajBWxHDx27cXP7HHDE1UoGNSL7W8FHu+Ai5X7vnuMswiooIIkJ7SEkTvYbLJ4xdtbkeFpEh
 FP11q2aSC0pau/ijxze0P6Y5eDWziYNHEURdRrYb7ztd49UMCJLUxXZgzQKk+/vxqEPCQ7axb16
 hoMcB3lNk5wUCFfgwiCdGMrFENgZWXo9ChEm6EWz0oUcKGe0c3VOhrFmfEjfdJGvAa7GhEkcnT5
 LewBzYmgefP54OxIFnA==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a9335a3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Ta6ShJ3tCWu1s0TIFCkA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Rdul4lTUOIaKxNcfYLfLudXnhxvk61dv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290170

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/rockchip/rk3229-xms6.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3229-xms6.dts b/arch/arm/boot/dts/rockchip/rk3229-xms6.dts
index 28333449c43a..6fd3e61c89af 100644
--- a/arch/arm/boot/dts/rockchip/rk3229-xms6.dts
+++ b/arch/arm/boot/dts/rockchip/rk3229-xms6.dts
@@ -48,7 +48,7 @@ blue_led: led-0 {
 	sdio_pwrseq: sdio-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpio2 26 GPIO_ACTIVE_LOW>,
-		              <&gpio2 29 GPIO_ACTIVE_LOW>;
+			      <&gpio2 29 GPIO_ACTIVE_LOW>;
 	};
 
 	vcc_host: regulator-vcc-host {
@@ -163,7 +163,7 @@ mdio {
 
 		phy: ethernet-phy@0 {
 			compatible = "ethernet-phy-id1234.d400",
-			             "ethernet-phy-ieee802.3-c22";
+				     "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 			clocks = <&cru SCLK_MAC_PHY>;
 			phy-is-integrated;
-- 
2.53.0

