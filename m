Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720486;
	b=bK9+FkLOomRaz1ZoSmneWrC7fJpWiGy9jwU7V09I1HTN9IgsFnBmj7CwFuEzK80B/TAD
	 qbjlj3rkQJTl7AU7eYf7TdeVx+4mzoE/Pe1h6EdagFKk9Qj297glgcIzS078sDz12Y3n+
	 INEqDHWyy362Vk+oUwwsksqC5Py6MBzr7pfCmbSJX3FawlPSZnhtrVBXzoIYkKhnbbIKH
	 7LYcF9wotFHCn/2mfX5D2EXWY+ssBg3FUEUgvIlo3wLbsYyOyDVuTVA4rbG51pXsON6hJ
	 YtjIsMxuyXhVzwLAHpfWQThDEM1AIBXcg7wIqNCe8mSRi3jPzIBcy6GqINfbnj9xZLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720486;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HXm4k1DgFKVbkmW4Q/hr4ib09JC8zzKQS2UORh+nT1g=;
	b=VzAwA8b0UTdPFxbUz3bUpXzGEHrjmpa58a2prdmsdRFDi3gQDyaHIheoHpmHuZFUIMh2
	 DavqtO0jJCFPdOvCQpFtAkSsH+s+me05KKHrsPjexJ+YxykD2WGTi9GVc8VnElniPDyoX
	 qIBV/Zfuttr88cxxrkpFW0UVtwMK8Emv3aCnpbo7gp55wFPvf5XDBLYvL8+KWX37MG7sW
	 qgOekgFHKtEzwRzWOoKni+BxGXILHcQzD5QoAWOMx6p87o531K1TV948EAdXQMXLOLkdn
	 FLgXlz5o593X+QuDbdRDmD0Oys0rj9z/0CutHvSa7aUNMcaYFHrTS8HekS6XQHP7zbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gmh0VrmU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SEI0thQK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A189606D834
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A189606D834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gmh0VrmU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SEI0thQK
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9x4v2001396
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 15:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HXm4k1DgFKVbkmW4Q/hr4ib09JC8zzKQS2UORh+nT1g=; b=Gmh0VrmUZrbKQ0Sw
	GXT46v0BH8wK3Q1VcEXg/gDf+6EX3CQkt0Vc6tQG8kE0WtuqLO2kyqSSD8WcAth7
	iOdM3P+vqf3dtD8thq8R5LG+nY0dScJ10GMW5Qtu4/nk1+V9yEgLFn1ZO7Shutay
	pd+YKqkZ7/Hr27193aIQ3oa8Qy/InKWdM88abkYlZsmoPjsGzS9ShlLVVimOudiA
	FAfibXGcRT3yxkcAeJhSihkQtiBlzk+72YWYUFUz930e16qLPMF+aL0wYp31ztlO
	/P+4yI1KiQ8RSH49DRUbpeJNiLf6GgZEMdEDx33UvkufbFbIwSk/Rsoog4yDYr9d
	h9AyKw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5jhak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:41:24 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so9765555c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720484; x=1794325284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXm4k1DgFKVbkmW4Q/hr4ib09JC8zzKQS2UORh+nT1g=;
        b=SEI0thQKeQ9RyuMOl3NStIEuiVkNuQsf9DUu8YB5LvJDHMcDL6iDuDy+bOAD6/KCmt
         B93mO7JsHVaFtw1HhI0xGy1JkoN4olgzkB2u/CPSVu9sJhMyMx621K6LgMXAN8iqiSLM
         duVPQFh1w+Bkx9DCtBbmlmsViM9V6jXZRC4vepzWbJ6i+Y86XX9BD/ThHAfnEpbIakKV
         +O+pyoWN70QqbZm0LYrk9SwqjVC/QKt+Q/vdhbOT0A89FZdWxLQtoAMHKQ9ToPHhHnMX
         M/oHTI6XxBYq4rBZ3yy2Os2w87twLcxMa5PD49Rsz867z53jWIkiJ/kl5EPXWwxaKmfg
         9jJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720484; x=1794325284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HXm4k1DgFKVbkmW4Q/hr4ib09JC8zzKQS2UORh+nT1g=;
        b=x3BmWR2WdYP0ZBA6DqznX6fubR+MBSx4itguBV217jPhkamceaShy1aGWJfdh0IrAf
         mggoGBi5FAI41yPuwTvJphGLSroWpSCPwF0Uvk8W2vlvqZVyVMXuqRY1/Lf2UXi+TTgM
         oZzgG8vpCQjzKuFPnZONhCtsnCtOEjVIpOnLreCXydw1WenzU5v8hdZGL4BrcyezgBpX
         u4c7ycptDhm6h5j/QtXR2tFbsvwwK3N9/9Ze79Q+uL8by6VUnPGqVE2mYV+QlJOPrZtC
         48K6jgaOXyT5wu+nTNw9l5M++6FKGXGDnNjcRSzHUUYtR4J9DL4ctG3S7JygCYqGtzuq
         FQJg==
X-Forwarded-Encrypted: i=1; AKwUvBy6hlhqLmDiNldc6NF18Q0bg5clATgM9NUYzad3PNWNNLN3Epx1L38hF9Q3dg6Dbx201iI+/Ax0yQgqSMU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p9cvoXJCv6ar1nxyRDvB0jBN7+LsgDeAUHl4oqFENArwMIgH6
	V96cc0yscxG6ge1q+vSka1xXerNDnF0x7SN2t6RLEmvbM+jq/XID3ZsGs7h2gFMWxuvV4mAxmeT
	Fr+1BsCfPiec6ZAQjIRGtRMB3elybfwV0yNbMilsO+lfsJpcoQ5x1lIjJKH4hyPCF9II4gziDxy
	4=
X-Gm-Gg: AYBFou1PMV/xwV7Wtkejp15FEv9I7T6sGCoIrxdOefstDdwo9nqLdJfvZ2iLpauHne8
	ZP7GALPX2WGzvtpMzx01+OBZoTn730gaB+92yLIPRuBKhAoui9J0HIuHLdmZD4/YdnCl2jMu6OL
	02Uc5HZvqZzlASuos8OSHCDsWtyCBZdGGFRL6Lx0yUqE5LDfLzgRUSWsVMtgZlL7RvE/BEa/JZl
	Xi4idooW0R3du6LgZlaEhBxAS/Eg7ORfC9MrBeCV30e6DMr72G1Oc7/wnPQhXvjMF0fEFXw0UwL
	KJ/Q7ivzr6qUUBZ9q1tPMx6Tc0/cX89FHmI5SQpEnfqTuLn+thGwzrqBfBzdrzjvgxF2NY4/JKV
	AzNosiLTYNtJnlKctyZoyMy6U0CiDwmqQFTkVqnyJ27MeiWGZtlPKpP1Nelh8bj0bTc8k9PGeXS
	xHMSQer0HD
X-Received: by 2002:a05:7022:7f12:b0:1ab:faad:cc9 with SMTP id a92af1059eb24-1ac5bbb503dmr20130160c88.11.1793720483446;
        Tue, 03 Nov 2026 07:41:23 -0800 (PST)
X-Received: by 2002:a05:7022:7f12:b0:1ab:faad:cc9 with SMTP id a92af1059eb24-1ac5bbb503dmr20130107c88.11.1793720482869;
        Tue, 03 Nov 2026 07:41:22 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:41:22 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:33 +0530
Subject: [PATCH v6 02/12] dt-bindings: media: qcom,sm8550-iris: Add context
 bank subnodes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-vpu_iommu_iova_handling-v6-2-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720462; l=3839;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=GV25gcoT1/60Yt0829YKr8Shzic4HV1Zb1QglfVRCeA=;
 b=74qDk2Re8oqFa2wcVddC5r92gJxVkM5PGUnsDFizEntDIBCnt1OBNDo9JIcQ8uh9Jeh7xS3zK
 jf/t90lqyDkCEz3jiVnqBCco53fBj++wlYfGDIoxjK1mlLDblUVtCH8
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: ywJ2eEBvZHE9AXNvzPIyGGeZHstFKOqP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX1ZqV6GyVAFwY
 7IllGGcbBpjUpatXf4Fw4jCS8gjVn5dM30L4P3ZPHldgKuJx3HCQje/73aoMMSGiNYZiIXWhQk9
 I7fY6WW3l6bHkhqTjGReXKXzljoXok4=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6aea00a4 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=w7pRem5UOBajBC5HA0sA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ywJ2eEBvZHE9AXNvzPIyGGeZHstFKOqP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX8ZSz4iSKjKKC
 Vb9w9t3llup+0rfXrpd5IEyXIWQ8OzA2m8UNO26lExa/dhKrwiZDUnTykxb6yVyAM8xjssbLOHb
 GNYSHpJIZsPWm6r6M2M1moLmCXywUIVvkOR+Pq2SgTku/LV1yK9uUq5ni8aEJdHCUcNY6zb6XzJ
 2GknhLC90imTC7TSY/W/BCebFqWDDIyikgmROoPZNuMNzJvsYEm8HXRSFhW+Jauog0Z9IxqyFYz
 964HbYhmiHOnmwshnmIXhbFzNO92FqQtRQMXp+qhDT3ZsV9YN/m//tBXdHjJPoWkJAsILOduzTC
 5Kq6dlBBgdnshto52XjKzavXPVAcz29ox69n1a+AZ1p4gsAB2dPRiQooC1Rc3lPWowykA84krfV
 +IYQycGveaxad0Qe/Shkjyuc4fJ1ilmxqVMJ57nWaP7nmd0omHc9G52jlJKTXOAygrZ5Y3yFILX
 A3j4/0RMHS7HDyT0PLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030062

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was
discussed and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach was
later concluded to be a hack to avoid having subnodes, and was NAKed by
the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

Update example to the subnode form. Doing so, it picks up the supporting
properties needed on the video-codec node, address-cells, size-cells and
dma-ranges to declare 1:1 DMA translation into the parent.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8550-iris.yaml     | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..6ee9d23554cffb30c92017ef99de15c2493455ac 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -98,10 +98,10 @@ required:
   - interconnect-names
   - resets
   - reset-names
-  - iommus
   - dma-coherent
 
 allOf:
+  - $ref: qcom,venus-common.yaml#
   - if:
       properties:
         compatible:
@@ -177,12 +177,23 @@ examples:
         resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
         reset-names = "bus";
 
-        iommus = <&apps_smmu 0x1940 0x0000>,
-                 <&apps_smmu 0x1947 0x0000>;
         dma-coherent;
 
         operating-points-v2 = <&iris_opp_table>;
 
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xe0000000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0>;
+            iommu-ranges = <0x25800000 0xba800000>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1947 0x0>;
+        };
+
         iris_opp_table: opp-table {
             compatible = "operating-points-v2";
 

-- 
2.34.1

