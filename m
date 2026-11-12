Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472459;
	b=249X4I4ONGHRSaufIzK4WARTs9NXRNoEYhLXixO3D6qHOCvAc2rZHPf7x+0GLE4prG0t
	 FvaP8GeWekACzfAfGS2lWCil9xV2cug7incrgdQfe/3qLWLh1fBggc6eoae5Kk7P+lFWt
	 lFNgEiRqS21hlKg3+rg0bbHeS1GJXP9TGMS+6+/Ej19owfY3BTcpZhfkTgiKSLepIJofq
	 FODxVjGbN4HuI9CaZERtX3dHeKwK8dBqL6C456XFmTvvR6mKHgEr11VHRdAW9XQEDuEMj
	 bpVX7ODjRA6DG2Tj2oiZ+vH5D8KBM216CD0heFh1aO0riozdlQtARPCjjmtRJhclm6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lCEAyTVsKfqf2TuD0MbUKn2c2nJtOpDVRa0HC47OHj8=;
	b=KeH0vbiEoLs7jdhc5LQ1tuuJZi2N8qUhvWd4DiYlAOvCjk8Eh2CacDpjkEsEE/5UKdyG
	 xFpWdbe94Ha8UIx2uRbogoubYTR0ICjpBheDp0dYJokvTuLMTrN8PTcRLDspzWCwT7UAw
	 7gXYlmnItRj+rTfAh5WMCojvKCSUzNhonVnlnFMMpr4vj3lJOpATtgfcG/6MOieF54mo7
	 BwXCMk6wx29/U3ZlolBxiIxOa5+CDTh8OOvVFrN3G3YMLa+AyZHwgaQhZ7PWnJc6hX3e4
	 sHBC3w5ytP71R6ljIdsNuceX1PHyJktwT6sA/NqKqbBT8K3yy/3jaiR+PhtpgncUOLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ebXST0T4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AflhbXMn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19856606A8BA
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19856606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ebXST0T4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AflhbXMn
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZQ8L4092474
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lCEAyTVsKfq
	f2TuD0MbUKn2c2nJtOpDVRa0HC47OHj8=; b=ebXST0T4Q8PYIyuHJxnW2EU1d7D
	47DArYhnx2wuor8XCNT4mzvfpg9fY7gcClF6hBO+KGUy4WjBwcJqJuGCnE7LyGsw
	V0h7wpSQO9PhK7zYHSOT5rfQEdTZvoTC9Jc5A88Q/0HCxuiJyfDa9jlvzt3Cb5B7
	Dnsf8EDJR3JH4k3Na4kVfKzCCiTA/QbYhTDl+idNnrVMmouA7FL7PfrsZy7RLm0L
	mtg5E54RzNrs0XipgSKGfuvPRJniNxTqgZ5uZfOfIPYLKnjvgG58PInor4gW+Zes
	EF2k87vUVlcM+BdwICHsbVZz9cN4isdnPv6QpoRjJJLadiW22j+9jL7+2Yg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8hybn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:34:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea26178b32so3816095ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472458; x=1795077258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCEAyTVsKfqf2TuD0MbUKn2c2nJtOpDVRa0HC47OHj8=;
        b=AflhbXMnSngbZc9iibNl3tWDyawGvcbezmok6YhLz3Rs96qfcRtIO/rJdoo3gsgKHp
         mqp23qu47b4M+SV/6ZFfnT2uNkRfG94UXgSjt6eHVp8k0AlzNzOxlyxiDTlvxnD0P8IX
         eCiP3LB0SyF/joWoBC1Rqx5VBig3s1QY+NXV7w/hQ4Px/iRwKyeEglgB6/Mi2NvjWuMD
         No/IBFQh6ax7hl4kcrYCVAGnqpLA/DQ86NRcZlvuW7W2wOu6b6U0kfJuZI7x0YqlFcWV
         esZq2ReVspek2iMXYbuS9DVa3EBP3rt0XVUDQ4E+n2r439W+k7A/x0wzjwMmVxqIfNQL
         ZmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472458; x=1795077258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lCEAyTVsKfqf2TuD0MbUKn2c2nJtOpDVRa0HC47OHj8=;
        b=wNR5yEE2NmO7zjk/RbLZQushrftKudPNFz4iUXlaMYRLYns9iVtOD1EzYutrMgzeFp
         dpKXIFKghav82xqLEP+i1y4XWVR6Hgts+o4d5NaUCaLMUUKwnaZIa50qt//U9vse1F8k
         AuH/5NQaKdkQ+i1mMvjCSmxnym/YwGVe37/UI/0iTQ+b/M0YhJ/8upcjyOXG4BaPAzwK
         AvdusHpMknufpmW5juqsYFx4VXnxzxyJ47gO0Iwh3d1Yn7WzsmrwtKH6e6YsBW3+Dplv
         hR+uA4HRyFW9oPIr+Fpx0ZjtBEPSSycRhMWM8J6glgxaXjrT9asNQClIrTgYUB7/p7Kk
         kbwg==
X-Forwarded-Encrypted: i=1; AL+hErHkl5LT+jx5EPm4ONcEqtd6NBAMf9lkXYaalfmZp7LdyRExUeKLOAftWvOK1tEKmkfN255DGwaR4y8I1gY=@vger.kernel.org
X-Gm-Message-State: APuU4Z95ua31UIcCILbqgdhXMuh6n6noEEJgFs8nA/zB+TTXzc+6vj8f
	do4PYsiqW0xB0pAvdnpdtiVcbUinO15xE50a8GbjgwjT69y4QizWMx7+yLLdRLDZwi+nYpU9jav
	d2bsHbQCX3XEikj159Z4PMZvnJuPbKkyH1NlqF4kC3CQ50Iz/7Squ07jhuxpVDAMC3EU=
X-Gm-Gg: AYBFou3TXpx0bLtHaXcSDvdyRGZ9p6xSbT27h6hhSdDcDEtDBjEwLyOe7kpgd39O7JO
	/emdLXmNYQXPPvDUotB8AZA85Ew8hkgNcBNhxf+ztHxOGyAKgwzH9isENKMCHifShVRv5ea93Ra
	jHpg5G25NJEiFuNr7AaK4TSygEKWnlxRTZxAmGRx6uRr3qvvsa2LJMrG3jp0LyKRW+2vstCae2L
	+tsn4vqASzXVNO/zNYaAcsJLnCw0KIB9Tpamc57vmTCjVlC2qFZzsepF2LIZzITr9LfBO3QGa0I
	5M2MAb6CC/ChzH/1ps8OYU7W2zckQ4w++Pg6BdY4wWA82kjVczp+jhHfl7rVWh6Vnz1U6aXSE8+
	nZg5jfuHx6hWuH2Xh2qp6qb2hC4kjvuqPV/J4sDUOg0Ktb8pc6bUjCZzI43D980arXqC/y4IXMr
	GkEw==
X-Received: by 2002:a17:902:fc8d:b0:2e9:5714:607b with SMTP id d9443c01a7336-2edd7146534mr83242275ad.0.1794472457699;
        Thu, 12 Nov 2026 00:34:17 -0800 (PST)
X-Received: by 2002:a17:902:fc8d:b0:2e9:5714:607b with SMTP id d9443c01a7336-2edd7146534mr83242005ad.0.1794472457290;
        Thu, 12 Nov 2026 00:34:17 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4b950sm29351705ad.13.2026.11.12.00.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:34:16 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] PCI: qcom: add support for the Shikra PCIe controller
Date: Thu, 12 Nov 2026 16:33:53 +0800
Message-ID: <20261112083355.3884737-3-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112083355.3884737-1-linghui.wu@oss.qualcomm.com>
References: <20261112083355.3884737-1-linghui.wu@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX4+kEqPgr2Jnq
 4p+8ss17RXxALAJA6lRrIvGEpgg6sgtf5NCvPS1+SST08jE2Vt132ZfIMF1nkuzsgWKA3r0RNni
 jLSWLuPrXiPKnSl8s1cgUUgPLUPOX/8=
X-Proofpoint-GUID: k96sMiZ7gIjDGhONHNoQQHMEhs5E3aV0
X-Proofpoint-ORIG-GUID: k96sMiZ7gIjDGhONHNoQQHMEhs5E3aV0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXybncqDK6Jl7m
 T1fyZublKVdZLUzf5CTEdR8ZwdJJfgwE1aKjLkr0cA5drnfYsIvv7MYl+L4UChX1jmUz1WF+wKX
 /3kFc8tHvmnxeyXmW8vU/QBphDFUre3C44lY9t4O+DVixC4Ykf6eefgXPNhA7tAxfdTOYokPlzT
 zpR/24DC/l+TReXnaiNntpKpavnrUfKPrJXzsk90/Ifg0Qs5VmROV/v7RwnxdQQHu5fm7ooGnvl
 vlvAlIQPl4LONzHHzHjfHRs5vxIE4b0s1qS8IHCu8pTvad6QzXfzao82WoxkgaBQBDJvGXsdNFE
 IuDpdVdc9vk5ppKWnq+FhIBTd3Myrq2l2NF6feJolITSAYccufk+/7r/b7C3MoIVUhduIJpnYWJ
 l475Q3NBSQIqbb7O+Gn0XtYqGZn+Ajp42KT+dJEdLS9HsuFeqDBwx/u/7frbYmzFzrWogv8S/nz
 F72xIjBtKC+j65tGaQw==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af57a0a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=OQKFvcYlbweCljSKIGEA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>

Add support for the PCIe controller found on the Qualcomm Shikra platform.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index eba1b2cb30f0..7573c509d7ce 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2623,6 +2623,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-sc8280xp", .data = &cfg_sc8280xp },
 	{ .compatible = "qcom,pcie-sdm845", .data = &cfg_2_7_0 },
 	{ .compatible = "qcom,pcie-sdx55", .data = &cfg_1_9_0 },
+	{ .compatible = "qcom,pcie-shikra", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8150", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8250", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8350", .data = &cfg_1_9_0 },
-- 
2.43.0

