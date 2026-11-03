Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702530;
	b=bcZyfaV4dSSbPhUnxRoUiudC7kv08IQmdVTdc4UHUj3UJR0IKuM5jjJm3/Tughc5ugFk
	 JX3iv4YMtEgrpAaHp7visQ6AYThq+Qv3gTVznM/9pyK/IsoyW6nrke3uN6nVcmYgc6VIj
	 vXb8t3BUwcTfg1R0ZKwScoVlfjt6v+6bhz1kU1PXVnZdHEHctkw9ryvA9nGXJrBOAEE28
	 1sz7FkYIQbm/YBoIV/u+3+NvDavZNj0Sz/HOhrj5ZJto2FE9XVZ+iyKnYdVzM0jrFYI+z
	 Zv3pjvBGVE3zsCYA2svGdhOEe1/c/VM1MddNwh9+lGZDHhqrB477/KrUybghWzazGLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702530;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wUky4id+jp8YQ+y/i0f5IenruvHIfgyCfa+AfUKoCwU=;
	b=f0c8GyZj/9Q5Dzu04Tuem25LpOZjdmQ7WHRlI8vYH0BhQRC8Pc/bJnJ9TGwj5fSQvNzD
	 gHDVduRcOFYA5CU53zFnp3Sqa6ykXM/kMRIjJg88fuG2Y/HFNZH5bNWuipeNBxtXu9F3K
	 HUsNiN17ZK/2z7dl5o6qeRRmp0jVpCX8p548pWPl/J0cMEF75Swnq01eHu7D+bxI057Lr
	 ndTIRkODEgALRHAmYMehjhUr8D1jYyOPJEobu7eAX1IcMd1kZikDyeKc2oYHjHbjje9Kx
	 ZJTFSSoaDJDDUOuvYJQM2LPS1/89hrJYc48nf6wZKtxKzrQJ0VVTHeE8m7AZ0OWNBTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jV+jB2z0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAHloy0q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07906606BF82
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07906606BF82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jV+jB2z0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAHloy0q
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAEgB1476061
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 10:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wUky4id+jp8YQ+y/i0f5IenruvHIfgyCfa+AfUKoCwU=; b=jV+jB2z00pxoabHh
	SdiGwrQlLUNusuWkGYEQd5oksX4s5Tvz9qroCiq6rSWoWPPnNGRDgM4crPEVMaaS
	rLqwgkvvR8hgTfr/S3eypnQFlACByLQur3d9Z0JVTOvOY97talx8qasYYazGDf+n
	R/o4JuINZEtQkSjKCycLeEmybrG+JHBBanAAnU+2lTTQ8uQ87IBdMQ8ReudNuW4s
	O9GKEfrxVxrnT51T7PeKN9GmeiyrAD8pKXV5ez27PXyDw5TIfvEfrCHNEHU+U6my
	+gH6jh9emSmvAC+FKeBZ5kfpICJH0vQ484Ee9gKy9wKhJhEhfRN30no4NIUBPy5x
	lCXRIg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5hcd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:42:08 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eaf1553b78so642479e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793702528; x=1794307328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wUky4id+jp8YQ+y/i0f5IenruvHIfgyCfa+AfUKoCwU=;
        b=cAHloy0qo3HP9wcV0PCNyLa0HXWcO1GwXESNIU7vuIrCe3ox0BoLsAH7CI+bhp2K0D
         IgM4Cu+KPNdYBp8iw1PNXNsQ5p93Srhid3cj9z0q69H+o2yAWuaeiK5IBLNYPBDSAYUo
         3JB3JhD31naGI0HyzjvbEEyTdeHXVkAXK6MXLo1APm8TB+9XU6/CBwoVuNuDfzHhyKB8
         vl/9TGwwipkd23+Cz7kdr/KoWdgCvwMiSHGqWrSg3PVkJG4s9HpcdaljJ+budyqWLbMH
         nTO5Bt3qSc1sl6Bkna0RMQHLkbi/IfI0rR0nEN2fZJJpFyrZeK6pAi7Eshuzcn/58MRU
         EhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702528; x=1794307328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wUky4id+jp8YQ+y/i0f5IenruvHIfgyCfa+AfUKoCwU=;
        b=LOQ1fUOnNTjv5riJfl3d+AqdjJmEc2JwD7xqzP+Py8a974RyIm/O5JMhuxhbu5Pzij
         cXbdLQBG3z457BtqeyOdggJ6DL6iXUpZlL7dxlSL0+EulaQMV0KvOT2RDDMbgdE8cB/c
         qCGDfvmOXiWSfWe01Jc/gE2lWJ8Gc2vDha9z6vaCW6FxiSwLKRZGovnBE8DqQTJU/XDv
         1uOU9MQmuvSAehAAeL4lewO3g4SKAST4ltlbY0EV4aJSjHaZ40gpVtk3mjkXrZUo4Rfs
         Msdq2G/n7jec5+fACpKYS3MKnZLzgsFqD4Tt0CkjrpDTnRslXJ6zLh0FO79zdAvaBwjS
         j7qA==
X-Forwarded-Encrypted: i=1; AKwUvBySgI7V5jNnO4LTvvKk2qYCDFZTraoS171jjDX6Ra1EvAk2IRwSJJNigei53rQmzQco4SagIx0XPOpnXCQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pH0WiRmLMzlbxP9j3noRwm3gWOxYD6nwQe4wBBCWTAnkNpM41
	+7ByG0eHu7rdq0NAuO+63xnOTasAwp+3WyCCMq4/BTiugHt8l4xDByjH7NfEeDV6XNHityCUTr+
	5OTSOh3NZE3UgD0BJhsyZoSv83UrkFHBQGBsqRUlOcZlqFIy6qooygbhvXPDzVRMPPRM=
X-Gm-Gg: AYBFou258MROkI2lgl3rqFEQnvMKkBnUiZFGFZ47+fsD7p5wZx/Vqu/STSyGomBjdZ6
	VP7RMiMI6M2jh9PbLDQ7jw+8hs4REG9/3Q7wHT0kB1C/Hqbx9geyuV+/s9Ugyg/QOCdhAElihjx
	04dnSbEDGhkLoJPAGYGVw9JxK45sA98kOX2qC996HdjbqajM1kXLJUduMIE2fQGzgbSDNKsyc4a
	1w1OumqxgSfV3H+DjdxmrCJCRTIokmYN6UMMgKMJM9g+Za6x0dldGAwD0qB+oGkXLIL+rOTjvwj
	5EDB7daBLoeWUe0bEjhIMy4F34XHn9GzyGWBw8INmICPA+JA3/kzGrJFzktD9IMC5n3lThqxp3S
	S2c9gwRnNvF0GL2mB5RuGKoxHVE1iqqn9TenqwutG71/Jli85W6MJPHkB16qJw/18BFVy/C+Kie
	DylA==
X-Received: by 2002:a05:6102:3eca:b0:7cc:2cd0:e73c with SMTP id ada2fe7eead31-7d072cb04f3mr4044828137.25.1793702528175;
        Tue, 03 Nov 2026 02:42:08 -0800 (PST)
X-Received: by 2002:a05:6102:3eca:b0:7cc:2cd0:e73c with SMTP id ada2fe7eead31-7d072cb04f3mr4044813137.25.1793702527720;
        Tue, 03 Nov 2026 02:42:07 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae0f4sm21625057f8f.58.2026.11.03.02.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:42:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 11:41:59 +0100
Subject: [PATCH v2 1/2] arm64: dts: qcom: lemans: fix iommus SID mask for
 ethernet nodes
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
Message-Id: <20261103-sa8255p-emac-dts-v2-1-05f9355df966@oss.qualcomm.com>
References: <20261103-sa8255p-emac-dts-v2-0-05f9355df966@oss.qualcomm.com>
In-Reply-To: <20261103-sa8255p-emac-dts-v2-0-05f9355df966@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Jb7Uu8eDKmxeuPJ+cG/Fp+9EJ1Cb1pVCLeiG3jtX670=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6bp7mxuNVqXHR04a520lmNEQ/flnPb2mkrOMu
 7B9m8qjWgSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaum6ewAKCRAFnS7L/zaE
 w5/BD/oCRiPXuFwoeQm1Ic4o4j3gx5oJdO6UGAruazfnh5oiBQDqaBIw4zUI/mYpzrM8DGupgsi
 RtHcYtr9xsYKDLSB/Zhwlmm3Fahigrb2KqxRajOO+K1GqUIxdovKp+wXsr/LP/PZLOgNVyLWXt4
 Ju+YlFTQxZQ88cWyKnCzC/Iq68tO7twu9U9OJ36f/P34QQ+kH9f6Dd58DuQ+7mmc22Zb/EEnDIK
 LSWd2dNXH5kTq/18KrkBzIpJy+pSowCz7+eHvfVIQC3ixE7lbRyzvwJVkMaK17VeEN/JppFjVP5
 73R5HIX/cfXrZyT0Ttsr3UBS8ARu0dcJ+HWN+N+3SzL4WGkmBOxO90ZY153VbIFxbQQl2FvRujA
 FmXiRJGpA/tSOB7vAzICIt70aoaro1Wue64EbqYqCQLL8zZBRfduhzRDQpQTXCPkNRvto/gZdzf
 073oboRNCJ/zsl0rGKtOYSIz/Km8xsgJFYmfWKRHH6OwFWvq4Y6iUmoeYSQrWqKlA5t/2DBu8SO
 1b/XMdZvKvVip0oqdWuDH2MOpCF2z5GvOw1PTFTFJa/372BxvSJkyLxX5IXbdDQGKpq1Ea19d1f
 MRuO08OYQQeBZa1XvnTxjltzb4DhsRbsbphBZrf+mlYz1X5mirU8uIaP5Py+Rix2gGqMfMtiti4
 o6csCIpWeCH99HA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 38L7WS1jf4_50G76NSVFm0mrYdyS4-IP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX3RxM6YIxJhtJ
 1taoantTkOn/fqcs2F1hIzujpTr4/SNO0XRV9OABiRgCua/yCbMMUD2LL7FzV8Av+Mi3purYpfa
 uxd/cg7D2NMZrcEdfyeK6Dixtd9RkVM=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae9ba80 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=jHMX-OgH2kBFWhD5V08A:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: 38L7WS1jf4_50G76NSVFm0mrYdyS4-IP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX10kIGIdnlVep
 3DbjaVfCh69lNyBh0QLA+kBGDe1PMFzA7GfPt3vxStnbyyq/JW6+QX4OzP5dWkOUgX/TiSkNud9
 ihfgeZ+zKnZWadJ+M4QqkRARRmUerPbReJY3PtODiR9NT7GPia6G/wlwWWS1ajF45MA4SO9XM2H
 n7YHEsSMasS3L18UPYSUiQYtDqjgukmrs1ydar2txDyNPmxS67Y666AX8NcvxC1H0vN8ShwsW2/
 Mvv+RjgE42yxNjufbtqJ3cV6GWK6m74XxTd+IY3ewNXZPst7tsZ7no9uHbokEDFGRAPXWAgtuUS
 N1qftXEIJO1Qminv7trnm6CmQKSMLP/4GUBxIvWyjj+r5jm62TWJoYFLLYNVgjLG9sW2Zx+0E/S
 CwEDGJnvt5YFOXLkXtIlLAf3AA8vrqKY6/Ck5Rw1/LSt9B5jeOSSZNKV6oKNicpFxt3Dv2F6JDL
 R7/LShLAo9i2RlnwmTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030042

The iommus mask for ethernet nodes is wrong, it makes the SMMU mask 16
stream IDs per MAC. We should actually only use 8 SIDs. This has
triggered a crash on sa8255p after a boot firmware update. Use the
correct value of 0x7.

Fixes: e952348a7cc7 ("arm64: dts: qcom: sa8775p: add a node for EMAC1")
Fixes: ff499a0fbb23 ("arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 5284030fe69da9323571cf64db218ee2c7169509..915b3be65ff1302e2b05dd2034e73ec4a0970a6e 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4395,7 +4395,7 @@ ethernet1: ethernet@23000000 {
 				     <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			iommus = <&apps_smmu 0x140 0xf>;
+			iommus = <&apps_smmu 0x140 0x7>;
 			dma-coherent;
 
 			snps,tso;
@@ -4416,7 +4416,7 @@ ethernet0: ethernet@23040000 {
 				     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			iommus = <&apps_smmu 0x120 0xf>;
+			iommus = <&apps_smmu 0x120 0x7>;
 			dma-coherent;
 
 			snps,tso;

-- 
2.47.3

