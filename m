Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CEB3290DB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848310; cv=none; b=TxYG+zeYrQyOvRPPcWdc0k857M5dFB7DNIfd9huCju3BaYF31veOdtqddNbash8Vuzx2CA8F+v9rtel6+kpL+QK1YoYBTh9eGTiG9k+q/OrZx1+DhKAST5BqMSIwxsIOLWHeof32H3PJ4wNbQjhifL9WLsP9c5Z8Kn4iUgHGY1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848310; c=relaxed/simple;
	bh=0vkb45uA+f1IecX8p6Fn//JP/tyBGpSwpx6m5DP9MwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X1v5O0B8zDyMYPJaapXNRguEim33726wiL5EGcObp+JpEdCjPl7LYAlNx+outHeq8+bF5xYeY58ghmDN/oDdlsQwd58q8fHO8KdIicAsR3+C1oDFfKhZSVwzYMHWUNaMzffoI6xFnhg2j75ufiSMoNP0ZkF+3p0155ccLBtX9Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PYoWSoj2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q2+tzKGj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PYoWSoj2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q2+tzKGj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687NlMcv2132553
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 06:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nqBXrvv1RYaPwCQj7BRN37
	7mYup6Ff7fzyJcboTfiN8=; b=PYoWSoj2pXhhQm6ApjggiKMv7gYTMiux4Ckc1l
	lW2pmLCXE0VqJMPEdTyjN7G8T1q9h0lvxaIWDIPLezfAJ/4bFSvYCK/iIsCAZX0R
	GR2v0CnL1n3xTbXo+yVurutZT/NnFx3ckKkDstlHtjCJpH1I1FzJYHsQId1rFrQy
	M1yWwGy0a126L6RKJeS+Fa9FwcjQrrq16gvUXeSq+OoSXZednIP5/vfXcaxP/BJR
	21AQHoVHAk42dGLR1Cx50pFZvsH6BZKwyZxdJROb7yV8EK+3SZ9WJlmKWwINkCVK
	ZLQOye4YnPHC59MKE2e6zYFxCxoXw/xEtZ6VX+AXMr+y3gsw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuykbbyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:18:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398d292eac1so8855959a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788848308; x=1789453108; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nqBXrvv1RYaPwCQj7BRN377mYup6Ff7fzyJcboTfiN8=;
        b=Q2+tzKGjD2lNvhcxCzZoW1TIKNiz+6TcmGxONmfNyGnS0riT2vr/E78VfvmqIrJj9K
         iUO/+V9nKv5xEIL23Aj42NaEoBWSrBNjFRgQzfkcvarz8BgK3rpknPik1A3O4UysWsAI
         LnlnsdXME/KlUp8WOVOXDN1I/6+PwC0k5Vlzek86r2xzoSfn/HrOjHOFFwWG/4vudkLK
         hYOc9tR2z46tYCd2T5eyfTkiuGXifwqi9GMz+wkvkhYT04H/6pEM+jSdQoMwNCY/jMNn
         kjeSr4UbdI6E8vQTNHF5OW3UKpGuq4mGxOH/FtbVQtNzh4uXozc8cuKRMBUqcho5OPDy
         oePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788848308; x=1789453108;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nqBXrvv1RYaPwCQj7BRN377mYup6Ff7fzyJcboTfiN8=;
        b=FXTvB6TTgE7f15v/AiWV3N8v7BAxG6k13sV53/n70gO7wPSjNGH8ueg8Hx3nGMMWuD
         TCqCVb7uOeEkBI1xpe6uA9Y/De1hs9pkEUj3IAb1omEx88+PBFZ7Oe5N+mxcYE12t9j6
         KJTkvGJejACkCb7qSyPu3nRts5KchiZC+9p9jiqLFc+ReJTAc10O4I/g03kMQK5TCYwl
         N3mFcHz51cbr0PVbtXr/dhGU5hr8KUE9wS11e2ci2uA+b4Ke9JI4S+37Eu7DRiaRqQiF
         eAM1ds0MRYP8QU1hkyrHSUj1wduZbTuFQxOZ3HzMcIKyyBByQUqXocHOhqLrwK8Dk7nu
         NRxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLFQYnQMMT2i7T/qf7WChmk3Xm+/qfxQ82vRkOlJwEvDi+DBYOS67orJOhAzLzjRz3nxbl+TuolF1w4z8=@vger.kernel.org
X-Gm-Message-State: AFuF++l0J9wLum41b+PhCyVYktQsI9n2LWpYCW82wakZrfurtvI/xjDq
	ZcYBS1bidS1Z/0tm+nRHtgTjQPfmlIRMEUxqFEZlVJ17UNPavH+l3jSSYSW05E0xfjqpJ0bBv8g
	9PPt6bnFgvXHFpa8v6mpbfvYN6BAkaff9u2I+0VxNKOSZlUPKXtPibA5LWWg5gMaTQ8Y=
X-Gm-Gg: AYBFou34oSsw9vhlGnWga0cR5Zl2yJlaUXlO/X2n/JMWxIq523ieKLxYrR2wuVfwJuI
	k2ZeMKcsi6XOgI2kcZQF5XlMI7BQWx6Yoy8AUdQpOl5QC+nfPwfWUVB/4fJVGIoVD6+6YUWH4NC
	AB/TZBQinIpkqHgxVn7fsipuoHppcWnfL0nykhtL25J9JJKpXbceffdnNr6CerMca575vzKD6g/
	AAq0xaDvt56U3098NSW65QU//ifhPcnrFhyWysH+EOjpdl6RpUJbdcmzoYjcUnclANiL/sP1mU8
	g+VJe/dxGfHcG0pSl4pMNjWkPzea1Mvo/++fYu3iybGWFMK8x/4s9KyCXCSP8W306fOVs98Vsyf
	anj3hip7oN7MwVl//Cqfkp2O/YQ==
X-Received: by 2002:a17:90b:55cf:b0:396:b918:c2a with SMTP id 98e67ed59e1d1-39b261b1a52mr45423777a91.12.1788848307797;
        Mon, 07 Sep 2026 23:18:27 -0700 (PDT)
X-Received: by 2002:a17:90b:55cf:b0:396:b918:c2a with SMTP id 98e67ed59e1d1-39b261b1a52mr45423727a91.12.1788848307279;
        Mon, 07 Sep 2026 23:18:27 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm38764157c88.5.2026.09.07.23.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:18:26 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 11:48:22 +0530
Subject: [PATCH v2] pci: designware: Set DMA_BYPASS bit in outbound IATU
 CTRL2 register
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-dma_bypass-v2-1-c3c81d408c0c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK2on2oC/22MQQ6CMBBFr0JmbUkpCpWV9zDETEuRSYRiR4mE9
 O5W1m5+8n7y3gbsAjmGJtsguIWY/JRAHTKwA053J6hLDEqqSmpViW7Em1lnZBbGmF6jtGfsa0j
 CHFxPnz12bRMPxC8f1r29FL/3b2YpRCFKPJWdrY/aOnXxzPnzjQ/rxzFPA22M8Qsimff3qwAAA
 A==
X-Change-ID: 20260826-dma_bypass-bbbf8a0c9af7
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788848303; l=3163;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=0vkb45uA+f1IecX8p6Fn//JP/tyBGpSwpx6m5DP9MwQ=;
 b=4nGNOTQPE33vcPSpAvAcgyZUyyraOpcxnsHpPSw2ZMCEXniZH1i9O+XKVh4/wgzdQZSr3oc4E
 +PqKejPn/ZcBOgO3TCwwX0yk15D9n17RDVfl/wjI7XCOK9pDG9SEyjd
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA2NyBTYWx0ZWRfX756UBLldacdr
 e5EjTfJb7m5siewMc03iM4RGhfoWbBv72W17gGnxP2MWA6Qvn0Cuom1oy+dwExZrCWqcgzfZq5W
 9VhaQgE/5vWz8I2Ag/aqUFGlKQW/5YI=
X-Proofpoint-GUID: enH1ex2_L9abM_3jv5mMpm6s1RuoUszY
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9fa8b4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=12MQry4_jSufYgdODo0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: enH1ex2_L9abM_3jv5mMpm6s1RuoUszY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA2NyBTYWx0ZWRfXwyEEOHGixjN2
 ROFmdFSPBOQUYQ5TNrvYtw/ExakqgXMOGyGWssTDithDd1UNhp/YJX81GChxVvEpjZlxgLznzOH
 PAE0VJzC0IxrU20TTXBRyLRiPfI9GbajthqsUAQ6hUtw0S6Kr1hNUkzb3d7o5eOORL7z6Oxz+EE
 +AFR36b15CgcI03kbAJen3/k+7QJJBFLXFcL8indHrhXHGK4n8wF/TC4q61drNwVMFLsHUXwFll
 QZuYro82vh2BeV9n4P7UrYazfBNloM6LXP4RSdEFBexBl5RW8nNSf2T1IzHxUIL4Oo7w3wwBdIq
 g6rZ8e6bB5hoIS0HRIKcNZlL7+vZOsaA/S3QLh3QMwC8FNFR74PlMnedRAkcnHuLGlg4YHOXcJH
 14rqqJHIowIDUxg1o2YFc4LoleEYupZ9NpDTi/yR53SyyAswccZfTXOamC9HueF5I7lcSZ215Sf
 WnLu8Ou/aS9q0rmyp0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080067

An outbound iATU region matches any local (AXI/application-side)
address that falls within its Base/Limit window and rewrites it to
the PCIe-side address programmed in that region's Target Address
Registers before the transaction goes out on the link. This matching
does not distinguish CPU-initiated transactions from ones issued by
the internal DMA engine (eDMA/HDMA).

Example: outbound region 0 is programmed with Base/Limit covering
local addresses 0x8000_0000-0x8000_0FFF and Target 0x1_0000_0000, for
CPU-initiated accesses. The DMA engine is later given a descriptor
whose destination is the host address 0x8000_0080, which happens to
fall inside region 0's Base/Limit range. The iATU matches the DMA
transaction against region 0 too and rewrites it to 0x1_0000_0080
instead of passing 0x8000_0080 through unchanged. The transaction
then lands on the wrong host address, causing data corruption or an
IOMMU fault when the rewritten address has no valid mapping.

Set the DMA_BYPASS bit (bit 27) in PCIE_ATU_REGION_CTRL2 when
programming outbound iATU regions so only CPU/AXI-initiated
transactions are matched against the region; DMA engine transactions
bypass the translation and go out on the PCIe link with their
original address.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
pci: designware: Set DMA_BYPASS in outbound IATU to prevent HDMA
interception
---
Changes in v2:
- Rewrote the commit message according to suggestion(Mani).
- Link to v1: https://lore.kernel.org/r/20260826-dma_bypass-v1-1-3a53dc748ce2@oss.qualcomm.com
---
 drivers/pci/controller/dwc/pcie-designware.c | 2 ++
 drivers/pci/controller/dwc/pcie-designware.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 593388f29bdd48381cb04710f445042aaf2be29f..9297d0e607e3a1caaeb585b23742f9a29607b7f2 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -577,6 +577,8 @@ int dw_pcie_prog_outbound_atu(struct dw_pcie *pci,
 		/* The data-less messages only for now */
 		val |= PCIE_ATU_INHIBIT_PAYLOAD | atu->code;
 	}
+	if (dw_pcie_ver_is_ge(pci, 460A))
+		val |= PCIE_ATU_DMA_BYPASS;
 	dw_pcie_writel_atu_ob(pci, atu->index, PCIE_ATU_REGION_CTRL2, val);
 
 	/*
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 0735ae94092404bc2976af67a58f6842cc5e5c50..668a5ba1c6f59aef1aaf15566b77a649bd282ce0 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -201,6 +201,7 @@
 #define PCIE_ATU_ENABLE			BIT(31)
 #define PCIE_ATU_BAR_MODE_ENABLE	BIT(30)
 #define PCIE_ATU_CFG_SHIFT_MODE_ENABLE	BIT(28)
+#define PCIE_ATU_DMA_BYPASS		BIT(27)
 #define PCIE_ATU_INHIBIT_PAYLOAD	BIT(22)
 #define PCIE_ATU_FUNC_NUM_MATCH_EN      BIT(19)
 #define PCIE_ATU_LOWER_BASE		0x008

---
base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
change-id: 20260826-dma_bypass-bbbf8a0c9af7

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>

