Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418315;
	b=eTotxIr5b69pB/Ewtx7ENXIQeGY/IqCD5g3ovJUBkxz0xzvrT31Kr1oeXTlzyTsF/CqJ
	 wBjsrlpLzZyJ6GYdxq2OCvLdV+nfS2pfOq1rCSENrPYmqK1ozumfF+6cKnQ92RXzN5VaT
	 HPSrzNUxpJShHueidQRkXpkEvY5CUSSLW8HasHhSExDbzrLbZON7ZTHcPQfcS/AdkNZve
	 zHbY2nKvjUsmWdjw+egnXkc85tW/9wsNSqiHP+5obceat0jq7ZYPVa4nDU1Erpgj/NDbF
	 BQk5z+IW2mlMe6Jep3R9VRq0seN4SsCNA41RhNXNk0IoxscWkJPtObrSll/CVnbNqxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418315;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=otvmRpR2mK9xATk3zKc89PSH5qkhX1CxundPT37cRfY=;
	b=DGbLDOmQEskL6qhnx4vuNdNzctiqDJ0PGHvWvAQNl3nVtjpWa3nvjH7c+QcBR7ww9yIh
	 Ug+B1j2jo3YbsYq9r3nJKjPt0xuW4G+2zmY/85wcXOmlLcWnE7O3X8zFKTBVRH7B0vXck
	 /6jiwyUSgz1zkKXmuyx2ZFEiXmSgv+ROlOebKpJzT96PywkSKodd61kD5wOxJU/nfZ/jI
	 JnJtiZB2uhLCeAHodgQmus+y1KQx0xribqHtS+0HVheJY5cyRGwnu6TcyA4CUeSHIYaWE
	 48IAyCE6MgWB7MiWYttlUww32doQoNVJOPIIJhpAT6LceHKxf3QsYWZq8n6vbcbeZog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BkVMxjvy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iSHwcQhE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB48606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB48606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BkVMxjvy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iSHwcQhE
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0Dch2316073
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	otvmRpR2mK9xATk3zKc89PSH5qkhX1CxundPT37cRfY=; b=BkVMxjvyHZZaGmpJ
	UILkB8hwOEjHL8wkNRNqodvVze2CZkaZqngmCeeg/nES7D0hVxx5ex5XBThvtUAj
	lchHR5RHtI+dquTcAvY3SDbB7kO3G3L280SzNU3SZzmyuRmkjj2tucwc3HwXcSxn
	p38RHfxFbSsd/v525qhhri4dgNtH/5ZLjyuDuVDL7ZW+Jn9O82nXFbzX0BDa7qi2
	ezm3y1MliNRajb00qh2vhTS/WBm8QMhY3MvRp4XxV2v+gUCdCzdsTR/tinsYHQ9L
	ovRGb5Lq/AACbymkxO02zGKsrgnr2+ZZqrdnYM32uKHvm1bn02pfrXeZck8WOvQq
	wdk2hw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh3xg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:31:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9995cea88so31789195ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794418312; x=1795023112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=otvmRpR2mK9xATk3zKc89PSH5qkhX1CxundPT37cRfY=;
        b=iSHwcQhEcQt5Y8gamVCHQGAwvFJXUpTbtIlbcFdS7ycMGuld5ObCXGDg22lW6UpW/L
         iwdO1T0LMoOTuYyRNsjpUQ101UsUQ5zU3J0q4DfORISdKpi7DaqIAHlYkfacAys+VCRo
         6LB/CX/LqiOByOdx5mkB8qMK+l9maReuWPKFzg5CCYjqalSVqQlAWR8RNy/0Ow6WOlny
         HC0Mhq8DMebIKU0Grui2KTKR+OdPx+UxohTYBZOs35clh85tzcOKUSMbbLJ+c+sPHzmF
         F/8g4AjM+vERJjq1KglEZWQPzMlirR9jpblmZDCTxbtUf3JMSO2nZiPCb2g48vW9bc/h
         KLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418312; x=1795023112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=otvmRpR2mK9xATk3zKc89PSH5qkhX1CxundPT37cRfY=;
        b=1Yyfb/5roBB1FMHFUxUce6tm2rPfn7infpCnsyLRUyax/j2IIMkrBNinDXwDxgRgyy
         qQUdXJGL2n4t+yEPHXr7s5yY3MK666oP71md9vV7Ru70Qv9H0Cj6Qt+nwiLTcOeSFbbj
         oq1lpEGBiKDM0y4KNwLdgkKqCKNihTL0YrFU/WoTttp1maeLwqHOeM8vR9XMMvDusQ7y
         kVxvR23mDo3Jc2tsdbp7xxyFQrDTvf6+hMFUtUJme/sULcgoBTaRpX1BEusjL2SjnDfO
         K2g3ohW6YlhwBUP9C+xjjrXaTDkrG85BHfVCrpaN/ukVfV5QXviSZVth6OtNGYEOKLEo
         yKqA==
X-Forwarded-Encrypted: i=1; AL+hErEGJPPSp0neslHqBx2Oq9sIPXLJbvUbmjgwrIsQ1qhOtFWQLf7wI2MBCHfZGbBaxwnmJDJc8d0xAweEDQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WeaixYYGMaApNfzsB2Gn8bfiO8k232mjYH2r/sFdvtJ8IUzwL
	0P/s3U+hcz3jHLVuLf44kgxFkOtv91TrugFkO6ry1ZmeLXpChBtMJt0CcEqlu7rEcaWdGTusHzL
	3zgyhYIdLLOfIn/G1ojZQdqM6JpPO9j/qf5GCEL00IByc6xoE26zRIGnStRd40RA3FqM=
X-Gm-Gg: AYBFou2gJXV7Ttim3ubhrWBbhVShIS3so3QAN1/+mENfsaH/wdX1mxdzWAd68gLIV2i
	9IUyG5Cf7uuxkyv1cO57BPAqHPbXAKGRjyZNWVhCwd4JRjNRN/D5xc1pzauWHl8kXdf+yVj/71H
	JoRGCCV9gKmIbltnYot8OQN88XgOcjqVliK3rKyDmuPlGObK/F2NjmGzVDZPWZURQBcl9Cbex9g
	t/He8hRQdHWIqn7sI54imCtwKqeo4u9PklRcuDofROe/FBJAME93oYyrR1BP6UsGsuIU8H8LRsT
	TCVPXFACo7mvqCZkKjmbK3/V72OXez+w+U2aaKNK59UxnCi7R7Pm8DmJOgisY8bRbCPAwmZe7tM
	H1Arld8Kj1+dfst31YxAEJH8k+lZVulNBsPeyTVOVQku2OgeIMP4CqFsE2ULHcCC7hdbMtPpy+t
	23NfbPlpB4pInIi8s2I2twHuvnLrE7dLNSjsmfeElO5Q==
X-Received: by 2002:a17:90b:164a:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b182f5a30cmr2942312a91.40.1794418312173;
        Wed, 11 Nov 2026 09:31:52 -0800 (PST)
X-Received: by 2002:a17:90b:164a:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b182f5a30cmr2942283a91.40.1794418311566;
        Wed, 11 Nov 2026 09:31:51 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c42c11sm237305a91.2.2026.11.11.09.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:31:51 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 23:01:27 +0530
Subject: [PATCH 2/2] phy: qcom: qusb2: Add charger detection support
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
Message-Id: <20261111-shikra-qusb2-charger-det-v1-2-5a9d919c66b5@oss.qualcomm.com>
References: <20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com>
In-Reply-To: <20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794418296; l=22926;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=+5o2fRk4SGOPPm/ZSNnqD6Ah36z+fkN8a8M9tLB/1WQ=;
 b=v/iTr/gd8B4+PdioG5ny9IyN6k80+xItf9RqxTfJrre32oUjlNw2AYGYU6f5+htAr03WYHP1v
 W+YcRKy9AX3BpdwyszWe2M/bh+j7o6QrEK+TBCnULhSE46Y4SaWA8f5
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OSBTYWx0ZWRfXxvLe863pinkg
 PUKjGTOdPb1rLroduqWiZYlmDjktqwFOSTbe76GdtRM6rOC+DVc+lr9otGSf7uphxw/Qq2NvK2S
 lxpF/uSS9UWB8WXcKSVn4ts/RCET6SE=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af4a689 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=C7_gml_Do48l-12NHYUA:9 a=eh4htEx1MinpzGgb:21
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ZVu765xRA2xhpi7FAk4RhfUSwiYf67h2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OSBTYWx0ZWRfX1w/Fp0b2EICi
 obc9gRJIgl4u1mBqzvwuM2FGqjIgHzsWF5/ETUwSjAF794kAOzMG/WjAzPa/1/AhFm4q3YTS1Gm
 Csl2TfQAOMamXmfa7fN+ZsZLksIR4Zh41ekB0fxOIKYLMjRXawU/Ses9ZVV9XA28LDqxMhAk3v4
 exr663GEUadY65V84e4db3W2Ccsl2/dgvIOGiFtKC5Uyupf8Dfpxz61lVlR9cLza9XMeYwkLA7p
 axxxeGTHRrPtDJgGcmgHCuqT8iw9KvHP78BWiCVFHgvVaVgPwPRfOQtWgMbY9vWBFHhJudQ50Au
 pZVxgI6cywHTU0DHdldSLInBtOxOq8u/tWJiWggH15lfU86G4ugjsLHhsQkgbP3N9xmXl65N0tT
 eHZEE2UB1/aDXy/Dclt7BzMiTSh29rO/iPrr4YN+AZjn7d0E2GMYfYt/wH/RWi0YA8lpZf75epE
 Ao9R/SUGukKGQFA4v4A==
X-Proofpoint-ORIG-GUID: ZVu765xRA2xhpi7FAk4RhfUSwiYf67h2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110069

QUSB2 Phy is capable of performing BC.1.2 Charger detection by controlling
the dp/dm lines. On platforms where the PMIC isn't capable of performing
charger detection, the responsibility is delegated to the phy.

On Shikra CQM/CQS platforms, the PM4125 relies on QUSB2 Phy to perform
charger detection. As part of this, the following changes are being done:

a) Refactor phy enable/disable calls to control regulators and clocks.

b) Let the usb-role information coming from PM4125 to pass through the phy
so that when a vbus active signal is detected, the phy can check if its
SDP/CDP/DCP and pass on the role to controller only when the charger is
SDP/CDP. In case of host mode, the role is forwarded without any charger
detection.

c) Since the controller probe relies on phy probe to be completed first,
during phy probe, it won't be possible to get role-switch handle of the
controller. Hence check for controller role switch whenever a role info
is obtained from the connector node.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 606 ++++++++++++++++++++++++++++++++--
 1 file changed, 574 insertions(+), 32 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 2e5fdb620cb2..549dc8d1378a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -18,9 +18,31 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/power_supply.h>
+#include <linux/usb/role.h>
 
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
 
+#define QUSB2PHY_PORT_QC1	0x70
+#define VDM_SRC_EN		BIT(4)
+#define VDP_SRC_EN		BIT(2)
+
+#define QUSB2PHY_PORT_UTMI_CTRL1	0xC0
+#define SUSPEND_N			BIT(5)
+#define TERM_SELECT			BIT(4)
+#define XCVR_SELECT_FS			BIT(2)
+#define OP_MODE_NON_DRIVE		BIT(0)
+
+#define QUSB2PHY_PORT_UTMI_CTRL2	0xC4
+#define UTMI_ULPI_SEL			BIT(7)
+#define UTMI_TEST_MUX_SEL		BIT(6)
+
+#define QUSB2PHY_PORT_QC2	0x74
+#define RDM_UP_EN		BIT(1)
+#define RDP_UP_EN		BIT(3)
+#define RPUM_LOW_EN		BIT(4)
+#define RPUP_LOW_EN		BIT(5)
+
 #define QUSB2PHY_PLL			0x0
 #define QUSB2PHY_PLL_TEST		0x04
 #define CLK_REF_SEL			BIT(7)
@@ -30,10 +52,19 @@
 #define QUSB2PHY_PLL_USER_CTL2		0x10
 #define QUSB2PHY_PLL_AUTOPGM_CTL1	0x1c
 #define QUSB2PHY_PLL_PWR_CTRL		0x18
+#define PLL_RESET_N_CNT_5		0x5
+#define PLL_RESET_N			BIT(4)
+#define PLL_AUTOPGM_EN			BIT(7)
 
 /* QUSB2PHY_PLL_STATUS register bits */
 #define PLL_LOCKED			BIT(5)
 
+/* QUSB2PHY_PLL_PWR_CTRL register bits */
+#define REF_BUF_EN			BIT(6)
+#define REXT_EN				BIT(4)
+#define PLL_BYPASSNL			BIT(1)
+#define REXT_TRIM_0			BIT(0)
+
 /* QUSB2PHY_PLL_COMMON_STATUS_ONE register bits */
 #define CORE_READY_STATUS		BIT(0)
 
@@ -57,6 +88,10 @@
 #define DMSE_INTR_EN				BIT(1)
 #define DPSE_INTR_EN				BIT(0)
 
+#define QUSB2PHY_PORT_INTR_STATUS	0xF0
+#define DMSE_INTR_HIGH			BIT(2)
+#define DPSE_INTR_HIGH			BIT(0)
+
 /* QUSB2PHY_PLL_CORE_INPUT_OVERRIDE register bits */
 #define CORE_PLL_EN_FROM_RESET			BIT(4)
 #define CORE_RESET				BIT(5)
@@ -97,6 +132,29 @@
 #define QUSB2PHY_IMP_CTRL2			0x224
 #define QUSB2PHY_CHG_CTRL2			0x23c
 
+#define CHG_DCD_TIMEOUT_MSEC			750
+#define CHG_DCD_POLL_TIME_MSEC			50
+#define CHG_PRIMARY_DET_TIME_MSEC		100
+#define CHG_SECONDARY_DET_TIME_MSEC		100
+#define DP_PULSE_WIDTH_MSEC			200
+
+enum port_state {
+	PORT_UNKNOWN,
+	PORT_DISCONNECTED,
+	PORT_DCD_IN_PROGRESS,
+	PORT_PRIMARY_IN_PROGRESS,
+	PORT_SECONDARY_IN_PROGRESS,
+	PORT_CHG_DET_DONE,
+	PORT_HOST_MODE,
+};
+
+enum chg_det_state {
+	STATE_UNKNOWN,
+	STATE_DCD,
+	STATE_PRIMARY,
+	STATE_SECONDARY,
+};
+
 struct qusb2_phy_init_tbl {
 	unsigned int offset;
 	unsigned int val;
@@ -478,9 +536,425 @@ struct qusb2_phy {
 	const struct qusb2_phy_cfg *cfg;
 	bool has_se_clk_scheme;
 	bool phy_initialized;
+	bool is_phy_enabled;
 	enum phy_mode mode;
+	int vbus_active;
+	int id_state;
+	struct power_supply	*usb_psy;
+	struct delayed_work	port_det_w;
+	enum port_state		port_state;
+	unsigned int		dcd_timeout;
+	bool			dcp_charger;
+
+	struct usb_role_switch	*connector_role_sw;
+	struct usb_role_switch	*controller_role_sw;
+	enum usb_role		current_role;
+	struct mutex		role_lock;
 };
 
+static int qusb_phy_notify_charger(struct qusb2_phy *qphy,
+					enum power_supply_usb_type charger_type)
+{
+	union power_supply_propval pval = {0};
+
+	if (!qphy->usb_psy) {
+		qphy->usb_psy = power_supply_get_by_name("pm4125-charger");
+		if (!qphy->usb_psy) {
+			dev_err(&qphy->phy->dev, "could not get usb power supply\n");
+			return -ENODEV;
+		}
+	}
+
+	dev_dbg(&qphy->phy->dev, "notifying charger type: %d\n", charger_type);
+
+	pval.intval = charger_type;
+	power_supply_set_property(qphy->usb_psy, POWER_SUPPLY_PROP_USB_TYPE,
+									&pval);
+	return 0;
+}
+
+static bool qusb_phy_chg_det_status(struct qusb2_phy *qphy,
+						enum chg_det_state state)
+{
+	u32 reg, status;
+
+	reg = readl_relaxed(qphy->base + QUSB2PHY_PORT_INTR_STATUS);
+	dev_dbg(&qphy->phy->dev, "chg_det_status: state=%d intr_status=0x%02x\n",
+		state, reg);
+
+	status = reg & 0xff;
+
+	switch (state) {
+	case STATE_DCD:
+		return (status != DPSE_INTR_HIGH);
+	case STATE_PRIMARY:
+		return (status && (status != DPSE_INTR_HIGH));
+	case STATE_SECONDARY:
+		return status;
+	case STATE_UNKNOWN:
+	default:
+		break;
+	}
+
+	return false;
+}
+
+/*
+ * Different circuit blocks are enabled on DP and DM lines as part
+ * of different phases of charger detection. Then the state of
+ * DP and DM lines are monitored to identify different type of
+ * chargers.
+ * These circuit blocks can be enabled with the configuration of
+ * the QUICKCHARGE1 and QUICKCHARGE2 registers and the DP/DM lines
+ * can be monitored with the status of the INTR_STATUS register.
+ */
+static void qusb_phy_chg_det_enable_seq(struct qusb2_phy *qphy, int state)
+{
+	dev_dbg(&qphy->phy->dev, "chg_det_enable_seq: state=%d base: %pK\n", state, qphy->base);
+
+	writel_relaxed(0x23, qphy->base + qphy->cfg->regs[QUSB2PHY_PORT_POWERDOWN]);
+	writel_relaxed(0x35, qphy->base + QUSB2PHY_PORT_UTMI_CTRL1);
+	writel_relaxed(0xC0, qphy->base + QUSB2PHY_PORT_UTMI_CTRL2);
+	writel_relaxed(0x05, qphy->base + QUSB2PHY_PLL_AUTOPGM_CTL1);
+	writel_relaxed(0x22, qphy->base + qphy->cfg->regs[QUSB2PHY_PORT_POWERDOWN]);
+	writel_relaxed(0x17, qphy->base + QUSB2PHY_PLL_PWR_CTRL);
+
+	usleep_range(5, 10);
+
+	writel_relaxed(0x15, qphy->base + QUSB2PHY_PLL_AUTOPGM_CTL1);
+	writel_relaxed(0x00, qphy->base + QUSB2PHY_PORT_QC1);
+	writel_relaxed(0x00, qphy->base + QUSB2PHY_PORT_QC2);
+
+	usleep_range(50, 60);
+
+	switch (state) {
+	case STATE_DCD:
+		writel_relaxed(0x08, qphy->base + QUSB2PHY_PORT_QC1);
+		writel_relaxed(0x01, qphy->base + QUSB2PHY_PORT_QC2);
+		writel_relaxed(0x1F, qphy->base + qphy->cfg->regs[QUSB2PHY_INTR_CTRL]);
+		break;
+	case STATE_PRIMARY:
+		writel_relaxed(0x25, qphy->base + QUSB2PHY_PORT_QC1);
+		writel_relaxed(0x00, qphy->base + QUSB2PHY_PORT_QC2);
+		writel_relaxed(0x1F, qphy->base + qphy->cfg->regs[QUSB2PHY_INTR_CTRL]);
+		break;
+	case STATE_SECONDARY:
+		writel_relaxed(0x72, qphy->base + QUSB2PHY_PORT_QC1);
+		writel_relaxed(0x00, qphy->base + QUSB2PHY_PORT_QC2);
+		writel_relaxed(0x1F, qphy->base + qphy->cfg->regs[QUSB2PHY_INTR_CTRL]);
+		break;
+	case STATE_UNKNOWN:
+	default:
+		break;
+	};
+}
+
+/*
+ * qusb2_phy_enable_phy - power up regulators and enable clocks for the PHY.
+ *
+ * Used by the charger-detection path to bring the PHY up before programming
+ * the QC1/QC2 detection registers, and by qusb2_phy_init().
+ * No-op if the PHY is already enabled (is_phy_enabled is true).
+ */
+static int qusb2_phy_enable_phy(struct qusb2_phy *qphy)
+{
+	struct device *dev = &qphy->phy->dev;
+	int ret;
+
+	if (qphy->is_phy_enabled) {
+		dev_dbg(dev, "PHY already enabled, skipping\n");
+		return 0;
+	}
+
+	dev_vdbg(dev, "enabling PHY clocks and regulators\n");
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(qphy->vregs), qphy->vregs);
+	if (ret) {
+		dev_err(dev, "failed to enable regulators, %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(qphy->iface_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable iface_clk, %d\n", ret);
+		goto disable_regs;
+	}
+
+	ret = clk_prepare_enable(qphy->cfg_ahb_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable cfg_ahb_clk, %d\n", ret);
+		goto disable_iface_clk;
+	}
+
+	if (!qphy->has_se_clk_scheme) {
+		ret = clk_prepare_enable(qphy->ref_clk);
+		if (ret) {
+			dev_err(dev, "failed to enable ref_clk, %d\n", ret);
+			goto disable_ahb_clk;
+		}
+	}
+
+	qphy->is_phy_enabled = true;
+
+	return 0;
+
+disable_ahb_clk:
+	clk_disable_unprepare(qphy->cfg_ahb_clk);
+disable_iface_clk:
+	clk_disable_unprepare(qphy->iface_clk);
+disable_regs:
+	regulator_bulk_disable(ARRAY_SIZE(qphy->vregs), qphy->vregs);
+	return ret;
+}
+
+/*
+ * qusb2_phy_disable_phy - disable clocks and power down regulators for the PHY.
+ */
+static void qusb2_phy_disable_phy(struct qusb2_phy *qphy)
+{
+	if (!qphy->is_phy_enabled) {
+		dev_dbg(&qphy->phy->dev, "PHY already disabled, skipping\n");
+		return;
+	}
+
+	dev_vdbg(&qphy->phy->dev, "disabling PHY clocks and regulators\n");
+
+	if (!qphy->has_se_clk_scheme)
+		clk_disable_unprepare(qphy->ref_clk);
+
+	clk_disable_unprepare(qphy->cfg_ahb_clk);
+	clk_disable_unprepare(qphy->iface_clk);
+	regulator_bulk_disable(ARRAY_SIZE(qphy->vregs), qphy->vregs);
+	qphy->is_phy_enabled = false;
+}
+
+/*
+ * qusb2_phy_forward_role - forward a USB role to the controller.
+ *
+ * Only called after charger detection confirms the port is SDP or CDP, so
+ * the controller knows it should operate in device mode.
+ */
+static void qusb2_phy_forward_role(struct qusb2_phy *qphy, enum usb_role role)
+{
+	if (!qphy->controller_role_sw)
+		return;
+
+	dev_dbg(&qphy->phy->dev, "forwarding role %s to controller\n",
+		usb_role_string(role));
+
+	usb_role_switch_set_role(qphy->controller_role_sw, role);
+}
+
+static int qusb_phy_drive_dp_pulse(struct qusb2_phy *qphy)
+{
+	int ret;
+
+	dev_dbg(&qphy->phy->dev, "connected to a CDP, drive DP up\n");
+
+	ret = qusb2_phy_enable_phy(qphy);
+	if (ret)
+		return ret;
+
+	ret = reset_control_assert(qphy->phy_reset);
+	if (ret)
+		dev_err(&qphy->phy->dev, "phy assert failed\n");
+	usleep_range(100, 150);
+	ret = reset_control_deassert(qphy->phy_reset);
+	if (ret)
+		dev_err(&qphy->phy->dev, "phy deassert failed\n");
+
+	writel_relaxed(CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
+			qphy->base + qphy->cfg->regs[QUSB2PHY_PORT_POWERDOWN]);
+	writel_relaxed(TERM_SELECT | XCVR_SELECT_FS | OP_MODE_NON_DRIVE |
+			SUSPEND_N, qphy->base + QUSB2PHY_PORT_UTMI_CTRL1);
+	writel_relaxed(UTMI_ULPI_SEL | UTMI_TEST_MUX_SEL,
+			qphy->base + QUSB2PHY_PORT_UTMI_CTRL2);
+	writel_relaxed(PLL_RESET_N_CNT_5,
+			qphy->base + QUSB2PHY_PLL_AUTOPGM_CTL1);
+	writel_relaxed(CLAMP_N_EN | FREEZIO_N,
+			qphy->base + qphy->cfg->regs[QUSB2PHY_PORT_POWERDOWN]);
+	writel_relaxed(REF_BUF_EN | REXT_EN | PLL_BYPASSNL | REXT_TRIM_0,
+			qphy->base + QUSB2PHY_PLL_PWR_CTRL);
+
+	usleep_range(5, 10);
+
+	writel_relaxed(0x15, qphy->base + QUSB2PHY_PLL_AUTOPGM_CTL1);
+	writel_relaxed(PLL_RESET_N | PLL_RESET_N_CNT_5,
+			qphy->base + QUSB2PHY_PLL_AUTOPGM_CTL1);
+	writel_relaxed(0x00, qphy->base + QUSB2PHY_PORT_QC1);
+	writel_relaxed(0x00, qphy->base + QUSB2PHY_PORT_QC2);
+
+	usleep_range(50, 60);
+
+	writel_relaxed(RDP_UP_EN, qphy->base + QUSB2PHY_PORT_QC2);
+
+	msleep(DP_PULSE_WIDTH_MSEC);
+
+	writel_relaxed(CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
+			qphy->base + qphy->cfg->regs[QUSB2PHY_PORT_POWERDOWN]);
+	writel_relaxed(PLL_AUTOPGM_EN | PLL_RESET_N | PLL_RESET_N_CNT_5,
+			qphy->base + QUSB2PHY_PLL_AUTOPGM_CTL1);
+	writel_relaxed(UTMI_ULPI_SEL, qphy->base + QUSB2PHY_PORT_UTMI_CTRL2);
+	writel_relaxed(TERM_SELECT, qphy->base + QUSB2PHY_PORT_UTMI_CTRL1);
+
+	qusb2_phy_disable_phy(qphy);
+
+	return 0;
+}
+
+static void qusb_phy_port_state_work(struct work_struct *w)
+{
+	struct qusb2_phy *qphy = container_of(w, struct qusb2_phy,
+							port_det_w.work);
+	unsigned long delay = 0;
+	int status, ret = 0;
+
+	dev_dbg(&qphy->phy->dev, "port_state_work: state=%d vbus_active=%d id_state=%d\n",
+		qphy->port_state, qphy->vbus_active, qphy->id_state);
+
+	switch (qphy->port_state) {
+	case PORT_UNKNOWN:
+		if (!qphy->id_state) {
+			dev_dbg(&qphy->phy->dev, "ID grounded, entering host mode\n");
+			qphy->port_state = PORT_HOST_MODE;
+			qusb2_phy_forward_role(qphy, USB_ROLE_HOST);
+			return;
+		}
+
+		if (qphy->vbus_active) {
+			dev_dbg(&qphy->phy->dev, "VBUS active, starting DCD\n");
+
+			/* Enable DCD sequence */
+			ret = qusb2_phy_enable_phy(qphy);
+			if (ret)
+				return;
+
+			qusb_phy_chg_det_enable_seq(qphy, STATE_DCD);
+			qphy->port_state = PORT_DCD_IN_PROGRESS;
+			qphy->dcd_timeout = 0;
+			delay = CHG_DCD_POLL_TIME_MSEC;
+			break;
+		}
+		return;
+	case PORT_DISCONNECTED:
+		dev_dbg(&qphy->phy->dev, "port disconnected, resetting state\n");
+		qusb2_phy_disable_phy(qphy);
+		qphy->port_state = PORT_UNKNOWN;
+		qphy->dcp_charger = false;
+		break;
+	case PORT_DCD_IN_PROGRESS:
+		if (!qphy->vbus_active) {
+			dev_dbg(&qphy->phy->dev, "VBUS lost during DCD, aborting\n");
+
+			/* Disable PHY sequence */
+			qusb2_phy_disable_phy(qphy);
+			qphy->port_state = PORT_DISCONNECTED;
+			break;
+		}
+
+		status = qusb_phy_chg_det_status(qphy, STATE_DCD);
+		if (!status && qphy->dcd_timeout < CHG_DCD_TIMEOUT_MSEC) {
+			dev_dbg(&qphy->phy->dev, "DCD polling: timeout=%u ms\n",
+				qphy->dcd_timeout);
+			delay = CHG_DCD_POLL_TIME_MSEC;
+			qphy->dcd_timeout += delay;
+		} else if (status) {
+			dev_dbg(&qphy->phy->dev, "DCD complete, starting primary detection\n");
+			qusb_phy_chg_det_enable_seq(qphy, STATE_PRIMARY);
+			qphy->port_state = PORT_PRIMARY_IN_PROGRESS;
+			delay = CHG_PRIMARY_DET_TIME_MSEC;
+		} else if (qphy->dcd_timeout >= CHG_DCD_TIMEOUT_MSEC) {
+			dev_dbg(&qphy->phy->dev,
+				 "charger detected: DCP (DCD timeout after %u ms)\n",
+				 qphy->dcd_timeout);
+			qusb_phy_notify_charger(qphy,
+						POWER_SUPPLY_USB_TYPE_DCP);
+			qusb2_phy_disable_phy(qphy);
+			qphy->port_state = PORT_CHG_DET_DONE;
+		}
+		break;
+	case PORT_PRIMARY_IN_PROGRESS:
+		if (!qphy->vbus_active) {
+			dev_dbg(&qphy->phy->dev, "VBUS lost during primary detection, aborting\n");
+			qusb2_phy_disable_phy(qphy);
+			qphy->port_state = PORT_DISCONNECTED;
+			break;
+		}
+
+		status = qusb_phy_chg_det_status(qphy, STATE_PRIMARY);
+		if (status) {
+			dev_dbg(&qphy->phy->dev,
+				"primary detection positive, starting secondary detection\n");
+			qusb_phy_chg_det_enable_seq(qphy, STATE_SECONDARY);
+			qphy->port_state = PORT_SECONDARY_IN_PROGRESS;
+			delay = CHG_SECONDARY_DET_TIME_MSEC;
+
+		} else {
+			dev_dbg(&qphy->phy->dev, "charger detected: SDP (standard USB host)\n");
+			qusb2_phy_disable_phy(qphy);
+			qusb_phy_notify_charger(qphy, POWER_SUPPLY_USB_TYPE_SDP);
+			qusb2_phy_forward_role(qphy, USB_ROLE_DEVICE);
+			qphy->port_state = PORT_CHG_DET_DONE;
+		}
+		break;
+	case PORT_SECONDARY_IN_PROGRESS:
+		if (!qphy->vbus_active) {
+			dev_dbg(&qphy->phy->dev, "VBUS lost during secondary detection, aborting\n");
+			qusb2_phy_disable_phy(qphy);
+			qphy->port_state = PORT_DISCONNECTED;
+			break;
+		}
+
+		status = qusb_phy_chg_det_status(qphy, STATE_SECONDARY);
+		if (status) {
+			dev_dbg(&qphy->phy->dev, "charger detected: DCP (dedicated charging port)\n");
+			qusb_phy_notify_charger(qphy,
+						POWER_SUPPLY_USB_TYPE_DCP);
+			qphy->dcp_charger = true;
+		} else {
+			dev_dbg(&qphy->phy->dev, "charger detected: CDP (charging downstream port)\n");
+			qusb_phy_notify_charger(qphy,
+						POWER_SUPPLY_USB_TYPE_CDP);
+			qusb_phy_drive_dp_pulse(qphy);
+			qusb2_phy_disable_phy(qphy);
+			qusb2_phy_forward_role(qphy, USB_ROLE_DEVICE);
+		}
+
+		qphy->port_state = PORT_CHG_DET_DONE;
+		break;
+	case PORT_CHG_DET_DONE:
+		if (!qphy->vbus_active) {
+			dev_dbg(&qphy->phy->dev, "VBUS removed, resetting from CHG_DET_DONE\n");
+
+			if (qphy->dcp_charger) {
+				qphy->dcp_charger = false;
+				qusb2_phy_disable_phy(qphy);
+			} else {
+				qusb2_phy_forward_role(qphy, USB_ROLE_NONE);
+			}
+			qphy->port_state = PORT_UNKNOWN;
+		}
+
+		return;
+	case PORT_HOST_MODE:
+		if (qphy->id_state) {
+			dev_dbg(&qphy->phy->dev, "ID released, leaving host mode\n");
+			qphy->port_state = PORT_UNKNOWN;
+			qusb2_phy_forward_role(qphy, USB_ROLE_NONE);
+		}
+
+		if (!qphy->vbus_active)
+			return;
+
+		break;
+	default:
+		return;
+	}
+
+	queue_delayed_work(system_freezable_wq,
+			&qphy->port_det_w, msecs_to_jiffies(delay));
+}
+
 static inline void qusb2_write_mask(void __iomem *base, u32 offset,
 				    u32 val, u32 mask)
 {
@@ -767,29 +1241,16 @@ static int qusb2_phy_init(struct phy *phy)
 
 	dev_vdbg(&phy->dev, "%s(): Initializing QUSB2 phy\n", __func__);
 
-	/* turn on regulator supplies */
-	ret = regulator_bulk_enable(ARRAY_SIZE(qphy->vregs), qphy->vregs);
+	/* Power up regulators and enable clocks (including ref_clk if needed). */
+	ret = qusb2_phy_enable_phy(qphy);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(qphy->iface_clk);
-	if (ret) {
-		dev_err(&phy->dev, "failed to enable iface_clk, %d\n", ret);
-		goto poweroff_phy;
-	}
-
-	/* enable ahb interface clock to program phy */
-	ret = clk_prepare_enable(qphy->cfg_ahb_clk);
-	if (ret) {
-		dev_err(&phy->dev, "failed to enable cfg ahb clock, %d\n", ret);
-		goto disable_iface_clk;
-	}
-
 	/* Perform phy reset */
 	ret = reset_control_assert(qphy->phy_reset);
 	if (ret) {
 		dev_err(&phy->dev, "failed to assert phy_reset, %d\n", ret);
-		goto disable_ahb_clk;
+		return ret;
 	}
 
 	/* 100 us delay to keep PHY in reset mode */
@@ -798,7 +1259,7 @@ static int qusb2_phy_init(struct phy *phy)
 	ret = reset_control_deassert(qphy->phy_reset);
 	if (ret) {
 		dev_err(&phy->dev, "failed to de-assert phy_reset, %d\n", ret);
-		goto disable_ahb_clk;
+		goto assert_phy_reset;
 	}
 
 	/* Disable the PHY */
@@ -887,23 +1348,15 @@ static int qusb2_phy_init(struct phy *phy)
 		dev_err(&phy->dev,
 			"QUSB2PHY pll lock failed: status reg = %x\n", val);
 		ret = -EBUSY;
-		goto disable_ref_clk;
+		goto assert_phy_reset;
 	}
 	qphy->phy_initialized = true;
 
 	return 0;
 
-disable_ref_clk:
-	if (!qphy->has_se_clk_scheme)
-		clk_disable_unprepare(qphy->ref_clk);
 assert_phy_reset:
 	reset_control_assert(qphy->phy_reset);
-disable_ahb_clk:
-	clk_disable_unprepare(qphy->cfg_ahb_clk);
-disable_iface_clk:
-	clk_disable_unprepare(qphy->iface_clk);
-poweroff_phy:
-	regulator_bulk_disable(ARRAY_SIZE(qphy->vregs), qphy->vregs);
+	qusb2_phy_disable_phy(qphy);
 
 	return ret;
 }
@@ -921,16 +1374,83 @@ static int qusb2_phy_exit(struct phy *phy)
 
 	reset_control_assert(qphy->phy_reset);
 
-	clk_disable_unprepare(qphy->cfg_ahb_clk);
-	clk_disable_unprepare(qphy->iface_clk);
-
-	regulator_bulk_disable(ARRAY_SIZE(qphy->vregs), qphy->vregs);
+	qusb2_phy_disable_phy(qphy);
 
 	qphy->phy_initialized = false;
 
 	return 0;
 }
 
+/*
+ * qusb2_role_switch_set - USB role switch callback.
+ *
+ * Invoked by the role-switch framework when an upstream user (e.g. a Type-C
+ * port manager) requests a role change.  For USB_ROLE_DEVICE we kick off
+ * charger detection; the state machine will forward the role to the
+ * controller switch only after confirming SDP or CDP.  For USB_ROLE_HOST
+ * and USB_ROLE_NONE we forward immediately.
+ */
+static int qusb2_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
+{
+	struct qusb2_phy *qphy = usb_role_switch_get_drvdata(sw);
+
+	dev_dbg(&qphy->phy->dev, "role switch set: %s\n", usb_role_string(role));
+
+	mutex_lock(&qphy->role_lock);
+	qphy->current_role = role;
+
+	/*
+	 * If the controller role switch was not available at probe time (e.g.
+	 * the USB controller driver registered its role switch after us), try
+	 * to look it up now.  A return of NULL or -ENODEV simply means there
+	 * is no controller switch to forward to, which is fine.
+	 */
+	if (!qphy->controller_role_sw) {
+		struct usb_role_switch *dsw = usb_role_switch_get(&qphy->phy->dev);
+
+		if (IS_ERR_OR_NULL(dsw)) {
+			if (!IS_ERR(dsw) || PTR_ERR(dsw) == -ENODEV)
+				dev_dbg(&qphy->phy->dev,
+					"no controller role switch available\n");
+			else
+				dev_err(&qphy->phy->dev,
+					"failed to get controller role switch: %ld\n",
+					PTR_ERR(dsw));
+		} else {
+			qphy->controller_role_sw = dsw;
+		}
+	}
+
+	switch (role) {
+	case USB_ROLE_DEVICE:
+		/*
+		 * VBUS is active; start charger detection.  The state machine
+		 * will forward USB_ROLE_DEVICE controller only for SDP/CDP.
+		 */
+		qphy->vbus_active = 1;
+		qphy->id_state = 1;
+		qphy->port_state = PORT_UNKNOWN;
+		queue_delayed_work(system_freezable_wq, &qphy->port_det_w, 0);
+		break;
+	case USB_ROLE_HOST:
+		qphy->id_state = 0;
+		qphy->vbus_active = 0;
+		qphy->port_state = PORT_UNKNOWN;
+		queue_delayed_work(system_freezable_wq, &qphy->port_det_w, 0);
+		break;
+	case USB_ROLE_NONE:
+	default:
+		qphy->vbus_active = 0;
+		qphy->id_state = 1;
+		cancel_delayed_work(&qphy->port_det_w);
+		qusb2_phy_forward_role(qphy, USB_ROLE_NONE);
+		break;
+	}
+	mutex_unlock(&qphy->role_lock);
+
+	return 0;
+}
+
 static const struct phy_ops qusb2_phy_gen_ops = {
 	.init		= qusb2_phy_init,
 	.exit		= qusb2_phy_exit,
@@ -1131,7 +1651,29 @@ static int qusb2_phy_probe(struct platform_device *pdev)
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
-	return PTR_ERR_OR_ZERO(phy_provider);
+	if (IS_ERR(phy_provider))
+		return PTR_ERR(phy_provider);
+
+	mutex_init(&qphy->role_lock);
+	INIT_DELAYED_WORK(&qphy->port_det_w, qusb_phy_port_state_work);
+
+	if (device_property_read_bool(dev, "usb-role-switch")) {
+		struct usb_role_switch_desc role_sw_desc = {};
+
+		role_sw_desc.fwnode = dev->fwnode;
+		role_sw_desc.set = qusb2_role_switch_set;
+		role_sw_desc.driver_data = qphy;
+
+		qphy->connector_role_sw = usb_role_switch_register(dev, &role_sw_desc);
+		if (IS_ERR(qphy->connector_role_sw)) {
+			ret = PTR_ERR(qphy->connector_role_sw);
+			dev_err(dev, "failed to register role switch, %d\n", ret);
+			return ret;
+		}
+	}
+	qphy->controller_role_sw = NULL;
+
+	return 0;
 }
 
 static struct platform_driver qusb2_phy_driver = {

-- 
2.34.1

