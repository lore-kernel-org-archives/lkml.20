Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515774BB5C7
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622186; cv=none; b=QEIVxcEnociRVl62Nzcxxsvnf7OyxqoM7HfqvCxpSeChg7zOoGejlAa9G/a505ILiYnppWC96cR8huUnAD4ZdV7gzkLEdam1ahZNRAzIZB0knw80NCpaqMBuAyvwwYa5k28KAvXIWPHhR3xWu9HQLjut+H46iJVm0avUPnAyb+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622186; c=relaxed/simple;
	bh=0vlezWZK4fA+Na166NVdgqHlRZAT3nhTjycS7km+CQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jL6V62pPZ1oXot5/21QPYFpaoxvOnjWqKaWmL09I0eRq9vm9gTYo5fq9S2QSxnLyPgWE2dbdXS+6STLSue7ojZHs+qm4Wo9mhIqiV+3ZS0EXbFM7bMPLHmR8BaS7QQSmzmgc6JPYyu/scY1q/nPAouiHKkDzkp4bluF/jJNy38k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0i9/Zc3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uq106sup; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0i9/Zc3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uq106sup"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685EhZPF3166429
	for <linux-kernel@vger.kernel.org>; Sat, 5 Sep 2026 15:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m1DYK2Eht48WiBu7IzlXKngOjp19WSTBRUJqw/HlGt0=; b=D0i9/Zc3VKRn5zg7
	tSHp3YUm8ykn6xaGVmpo2XbstGF8w/Dhj5PyeoT0XESIc5CglJ569q1UlTii14Tg
	Ake2PbFU2G/5uBPI4rjenWlGexBWvIK/cre5jH9jIpAloR9hRq/Cav1md85ow8Ky
	ABum3tHylsSXycP/5Vyw7nPAR0CkXRu9l3jNmoYWbPbLcklEcgx9tELoU2hNW9nl
	S60ndYsOjepGcIycvb1I8UBcYXOwCtq3R90RpCogLJ0dAvu+79280kVNCVX4gbVx
	1lH+wL+i0e3T6KvuCd0Ls1NeGCDLLq18U5dywJBNmu5OioZW9Kq68DpclEsCN4eF
	MiOFyw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany1ex3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 15:29:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so3268958a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 08:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788622182; x=1789226982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1DYK2Eht48WiBu7IzlXKngOjp19WSTBRUJqw/HlGt0=;
        b=Uq106supuX208g4Qu96sMQ7s7VDF8e5zTG2Em6FeDnxc7M0G5ZgmUtZ5wGT5iuEXOq
         E7al/O1bbkhTSpZWBtUBL6R3ROq03+57HxqeOCwoudSvtEqaVxzmr7jmCxX5zEGh3Z4i
         gHoPntkX/z0zHAQ70cXpN1gNAfO21cCqOyaOentmstHgQcE+79j834vrQtP0cLoT0SPN
         MQWQa9W+NpFmFXjqe1dy8L/Gsa/Ha5kD6+ZgKqALnWyKeZWhQAtQ6pIEDLVT+S/iqnph
         egfdLofkauhkVB1H/+xaZdxRTqMw/iYDMFNc/9Yam1qLft3CHl1pLEXmXwuD1aQm5tQB
         OZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622182; x=1789226982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1DYK2Eht48WiBu7IzlXKngOjp19WSTBRUJqw/HlGt0=;
        b=JCkWthP0EZTDCDJrOOnAeXmknFXId/F/ZbUJJI3DB4E2wKzT/2ny+wINx2rmlIgefS
         MsNUq+7GYoFGD2EnFT7CiHtjwmVhOGDljgN+vuroi8T1diL+0uRMfxghD2xTLf/f8OLi
         NV9DZui5DcH0XEHDBO1DBKsrDv+aWDrAp4R5+2fe2O0Cf8xU88pXZDaF6AZaq98SOorv
         2P3Ow9yP224wO10xJWntET3u3eAlk22vIXcrVxzVreevni6z/Tam+hY/0EJ3aso1vvs5
         SM4BOTIx2VavrjZBR/l2lLp26yAf/twHgX8WPbNxTmi4xtBDjLqWmjdTT2qneQ367RQA
         iFwA==
X-Forwarded-Encrypted: i=1; AKwUvBwo/BONPQeqAmFyl2R0bbAmG+kURoRydS0OCKD5Rm0+Bz1e5kFLD1F75OAjxlWrnTi4/aakeD2UkVfzT6w=@vger.kernel.org
X-Gm-Message-State: AFuF++lrPSsgZX1Jo+MEZ7p9p45YN7AJIxvJ8+Lo5BeFOXENSUsyCRLZ
	IpC4bscWx9oDR9RklBJKFhTz7d0k5a+7mI4HkiB6CxWuOuA4BYVGY3gDuG6jzaWLIf3XFmZS5j/
	mnc+2j4cUTtaMDehnNlX4+2i6wV76D5xXMdMiXIhcnxUd6SmaQMHNmi4poPigmWfOhYMOBNiKV9
	g=
X-Gm-Gg: AYBFou0pkXxbFgkOTprh4xgBeqJw9Gekqg/hP4T00AcbBqR8eSjS2xJ4mKWRQXCCh+t
	JGeKO/C/ejSNE/JG4rhuAKRAGiEYNlyrCSkyRW7M+y9gxpfvnge/+Zc4ASNcnb5OKSytlIVbLlF
	bnMpCaacuD3rb5MvBauBoakDym7RxEY1glcsyWmQMF3yPaqq93+zwSZrdwUE2nLXQfMwN8BetfV
	3NZTqfnF1D4s/6W/6cNbnnJMQ+jO6uSeopn1XnOCZY19iCwz1aR7GyDDCBR5xthPBnZs0wLRKxr
	rZox9bDdflrsNykiyt0sLXq+XwP3qyZnD+gruUKkNC4gZjQOa7eV4SAI1Hojj8wPgjr4DKodEC0
	99INPTJTTRuv1xQdWEAXpWLKeN4vOHTXCcx9/1Gkl6TTUQ40lBTT9Bf4pUDqBVXJuMabJ3A==
X-Received: by 2002:a17:90b:5804:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39b087e4c2fmr22010624a91.24.1788622182127;
        Sat, 05 Sep 2026 08:29:42 -0700 (PDT)
X-Received: by 2002:a17:90b:5804:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39b087e4c2fmr22010587a91.24.1788622181565;
        Sat, 05 Sep 2026 08:29:41 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm23592635eec.16.2026.09.05.08.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:29:40 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 20:59:09 +0530
Subject: [PATCH v7 5/5] usb: dwc3: qcom: Modify interrupt handling for
 eUSB2 Phy targets
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-eusb2-interrupt-v7-v7-5-820cf5377a70@oss.qualcomm.com>
References: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
In-Reply-To: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788622149; l=6273;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=0vlezWZK4fA+Na166NVdgqHlRZAT3nhTjycS7km+CQc=;
 b=fqAYeayRuF80MQHmjWGW+p52Hhfe0N8b2XCwhMvq5pKCiatZ8e5jgunbPWytfIT0k+gB6d1gi
 bAgj4qvkvF0DWRCds99/v2AFIEAG/P3q0GAWHMD7oDU0kzoqjHoVrhR
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9c3567 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=Sf5RIT6NobiIG8tfIdUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: i-Dqzw7A-u8f14242Y3bJ1LrpDxsqj9h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfX8Sg/CvbHdmd8
 YoIiAdkFp/KrpHy1j89sr2uU+Pu9HRv/qmLYVRxHpjnvwmaycFfksoiOhwaIZ9334rj39QivRAw
 aMuwCp/OcZE50cgZmqbKT/EqByZHeEvBNU6n6wG7Mprh+2vjxG0u2kQ7K9zNkqpeBGit2SmhYmk
 eMbCwGtr5VAKykiqTKdJWeG58+4DeXsAoYrIxn9YJxUEwvU+MEgTd6l0l4P/9UyReRl5WXNnU91
 4JZW1iDJGcmzLxskIn1NzksDQ9hSZU+T3boCxRoxiXWbekiMaGq2mL5RBGlnyNeZk6Nza3jAIVm
 v9IsW1LIhNW6dwldpc5b7mHBXj8abxAqkvU+8QDKmsqMBND9x4G0qw/EFEt1bXImSJnG6PQQcRj
 rj80UgeVOjQiuz1qMQoWkq5LVAbS6cVAXJOcJSvNr+eYGK6/MC8682eI/EwiSPfHqd26uexsTpV
 +CUQkh3U0HEIMF/Fb6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfX4Z8Q+eiBeMbb
 cykQjBv0W6wpQ/ioVpRYsVoDoSzr4bs7iCZE7TMBXZt4qx0DdNz3UCPeJs1m/y1qkn4Al34I3/Q
 uR6YYJAo1/dU+eOW72QhFlFzJfUvolI=
X-Proofpoint-GUID: i-Dqzw7A-u8f14242Y3bJ1LrpDxsqj9h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050170

eUSB2 targets handle wakeup interrupts differently depending on device
speed when operating in host mode.

According to the eUSB2 specification, remote wakeup signaling in host
mode is detected via different data-line assertions based on the
connected device speed.

When a low-speed device is connected, the host repeater drives eD+ to
logic '1' upon detecting a K-state on the USB lines during remote wakeup
(eUSB2 specification, Section 5.5.14).

When a full-speed or high-speed device is connected, the host repeater
drives eD- to logic '1' upon detecting a K-state on the USB line during
remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).

Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
eD- line states, query the phy type and configure the wakeup interrupts
accordingly.

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 63 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ba26e61df915..2d1e66ff72ed 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -86,6 +86,7 @@ struct dwc3_qcom {
 	struct icc_path		*icc_path_apps;
 
 	enum usb_role		current_role;
+	bool			has_eusb2_phy;
 };
 
 #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
@@ -273,15 +274,23 @@ static void dwc3_qcom_disable_wakeup_irq(int irq)
 	disable_irq_nosync(irq);
 }
 
-static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
+static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom *qcom, int port_index)
 {
+	struct dwc3_qcom_port *port = &qcom->ports[port_index];
+
 	dwc3_qcom_disable_wakeup_irq(port->qusb2_phy_irq);
 
 	if (port->usb2_speed == USB_SPEED_LOW) {
-		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
+		if (qcom->has_eusb2_phy)
+			dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
+		else
+			dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
 	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
 			(port->usb2_speed == USB_SPEED_FULL)) {
-		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
+		if (qcom->has_eusb2_phy)
+			dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
+		else
+			dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
 	} else {
 		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
 		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
@@ -290,26 +299,38 @@ static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
 	dwc3_qcom_disable_wakeup_irq(port->ss_phy_irq);
 }
 
-static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
+static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom *qcom, int port_index)
 {
+	struct dwc3_qcom_port *port = &qcom->ports[port_index];
+
 	dwc3_qcom_enable_wakeup_irq(port->qusb2_phy_irq, 0);
 
 	/*
 	 * Configure DP/DM line interrupts based on the USB2 device attached to
-	 * the root hub port. When HS/FS device is connected, configure the DP line
-	 * as falling edge to detect both disconnect and remote wakeup scenarios. When
-	 * LS device is connected, configure DM line as falling edge to detect both
-	 * disconnect and remote wakeup. When no device is connected, configure both
-	 * DP and DM lines as rising edge to detect HS/HS/LS device connect scenario.
+	 * the root hub port. For non-eUSB2 targets, when HS/FS device is connected,
+	 * configure the DP line as falling edge to detect disconnect and remote
+	 * wakeup. When LS device is connected, configure the DM line as falling edge
+	 * for the same. For eUSB2 targets, the lines are swapped and rising edge is
+	 * used: DP line for LS and DM line for HS/FS device detection. When no
+	 * device is connected, configure both DP and DM lines as rising edge to
+	 * detect HS/FS/LS device connect scenario.
 	 */
 
 	if (port->usb2_speed == USB_SPEED_LOW) {
-		dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
-					    IRQ_TYPE_EDGE_FALLING);
+		if (qcom->has_eusb2_phy)
+			dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
+						    IRQ_TYPE_EDGE_RISING);
+		else
+			dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
+						    IRQ_TYPE_EDGE_FALLING);
 	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
 			(port->usb2_speed == USB_SPEED_FULL)) {
-		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
-					    IRQ_TYPE_EDGE_FALLING);
+		if (qcom->has_eusb2_phy)
+			dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
+						    IRQ_TYPE_EDGE_RISING);
+		else
+			dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
+						    IRQ_TYPE_EDGE_FALLING);
 	} else {
 		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
 					    IRQ_TYPE_EDGE_RISING);
@@ -325,7 +346,7 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 	int i;
 
 	for (i = 0; i < qcom->num_ports; i++)
-		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
+		dwc3_qcom_disable_port_interrupts(qcom, i);
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
@@ -333,7 +354,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 	int i;
 
 	for (i = 0; i < qcom->num_ports; i++)
-		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
+		dwc3_qcom_enable_port_interrupts(qcom, i);
 }
 
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
@@ -628,6 +649,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	int			ret;
 	bool			ignore_pipe_clk;
 	bool			wakeup_source;
+	struct phy		*phy;
 
 	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
 	if (!qcom)
@@ -698,6 +720,17 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ret)
 		goto clk_disable;
 
+	phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
+	if (IS_ERR(phy)) {
+		if (PTR_ERR(phy) != -ENODEV) {
+			ret = dev_err_probe(dev, PTR_ERR(phy),
+					    "failed to get usb2 phy\n");
+			goto clk_disable;
+		}
+		phy = NULL;
+	}
+	qcom->has_eusb2_phy = (phy_get_type(phy) == PHY_TYPE_EUSB2);
+
 	qcom->mode = usb_get_dr_mode(dev);
 
 	if (qcom->mode == USB_DR_MODE_HOST) {

-- 
2.34.1

