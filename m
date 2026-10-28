Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214007;
	b=GZIokxwhH7OiXKYirEWqwFBVCzvpuXXkVMvRYhdt2Hbbrd+YS8CukzPvUaRQmRiZuYLV
	 aNuneNpfYZs2VVVXknhlA3cJ5XRrbjs1XbfmSQVaapBWf7NOLMNCeGn1pgff4Fei+2lGY
	 Km9u6hmwyahKoE7/v02f3TEbIfTIkuPAj9fXSVGTbkGYTIaW8HbKLb2jTBlDoO8vRUuFo
	 FSWTiuVApe6j6cqfCZanpFWaTfKeSml3RmuryDKCNOc/MBUsgdiSOfMooKFTehvo6kmFT
	 dH3kP4d7dhtqSzp5E5nGeTZXNIs2/nDx9rsyzNEL5CqIKjxAGhUBBUTqJFJbCPmLGrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s2r1O1AAKXF38pJJeX6hQa8Gey3z8SLxPhW3IGwND8w=;
	b=0DXuKhoGaU6NWNCeqikZPiCWjO/di3XJq2uzWHQU+3oEHPa/jBeQ587i6x4CaZ1OxpUM
	 93T8wn+peqCV0WspfyhtWzuk8TYSblOZclYKld6TNZFDicrkmhiItHSlDMouUhS+ovWnq
	 63irD+o3TYHtp1jwrSY6JK6tGD1DfdGCCvryqbz5kjqUKrb3bcLi3ViJ0/ehRX4VsH1H5
	 1ScEkAAmW6ppbnVDvhhhnbKk+KtStxK342/vdPEE19iIuBrIMoEt8bdy6+MZiuI+qpQ2F
	 XxvBxSj48+8wjRGyv/81vTzZbglJ5CNODvqHONMS32gNqcs8nWVOTRI4RE8gopYbtwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pYr1aR4G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XnJ3m3l8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65A0606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D65A0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pYr1aR4G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XnJ3m3l8
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPqxH1395713
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s2r1O1AAKXF
	38pJJeX6hQa8Gey3z8SLxPhW3IGwND8w=; b=pYr1aR4GsEEA8yxLn0KUnFyTLK2
	bxMyx1u9dCtSYKETwbW4hU05ATPI1/R5bxi0CnpYuuOBg043D/ojkwhC8xLGGZFi
	vMm0uFtl+0dMUHzmOqZMttEmCt1A9ExPD2OM8Ia7VJanjKRi3guT0SzhyqsUttoE
	sUHEHDb2d6Qls0aL4jqZ1VPEC94nnfWO/Tx7DIYIvhzaXWt80/9lGLchTVLpgAej
	RM5ak261/k0oQryJUeBy9yYF/WsgYMXreLeF2GmVgN0SfiYBAbQ7kj519t+IK/nZ
	t5D7ogQYA0NJ2zGPeG6Gd9PIhoATe08E3z9iaZ/Y71KlV1nrdYHlxiyFHWA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjhhs6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:00:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2319333eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793214005; x=1793818805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s2r1O1AAKXF38pJJeX6hQa8Gey3z8SLxPhW3IGwND8w=;
        b=XnJ3m3l8bZAeFLl+e34bG/8RWt1hb4W8qRLMzOjszgrOdBBTjpmQX/DkAFDYG3xmj1
         y+zfSaXxns2QGuPLq4fKitRQkkZUcPmLzHeiBDLXkpuAZdE0uwNxGEGA0txagRRFNueX
         AYo7EqXOkVugCBzsWq60MgQCTei9JVem9bfX5j87uMHVrT1WWmI+Ga1IuP6vLwBvNn+k
         jmX/D5Zd5Kmc+eTRMbtjOtpOLuiA9qdjWxfzdUWVSXhOIGbuyTxCUNb71ili/HigA23W
         U8w5ahoiZo5FJj2FKmG2I48HmUZev3iI77TuWyy0hqjgtreL3xlo0U/lbcRiolRCwiuJ
         XkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214005; x=1793818805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s2r1O1AAKXF38pJJeX6hQa8Gey3z8SLxPhW3IGwND8w=;
        b=knglAwgSlewRi9MkcJe15OszQ1lKjtW4VsFSl93VqLWgqtzIZagZpbPqHrsKFnI7Mr
         UGZQhlutJV1HCSx7wSu3kU3FPs+JqZHDZKlX3iIUsGXFAeg4/zp2AJT8SHQ7aI9MmNyv
         AdlL5gyJE132a1lqBbPYKbuzJ9ypEG24okJ9wLe96iS+3eZv+f6x99q19/NYL++jiD8E
         0km5SCGu4pWN3AtUScJ3I3JLDzguntsCyIfv5jl21X0HQeUY93aQZXa9oHSYdCFtAmD5
         dme/sVoj4Vh1AH4dyW/1WGIJ7RCui+vOV04oJz9n3E7Y7hl67VDkpjAWcqo+IFmFuPSl
         yZSA==
X-Forwarded-Encrypted: i=1; AKwUvBx/xGm22B8m4pS2kohvBDnm+bKlFJBQjq6Ecf0duuqCLL3KlkCSp1uX9vQlC7P90ooHQc+oZIphEBtV+TI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8POs3ODTdJ4NDQqyKx+Wk8sRjror+4KqWscYNq+WTcqEHo6mN
	29N//vC1fzkSe2WeDpwzHyclpljc5mqPFbEmc/M/5VxOW3LLGheTWU8rTJjW27P6tqoB8OTZNtR
	Id6oIw9yRQrUmPjK/WuPn+vEHLExSahYLGZgu97Qi03gGg29tuMNSKn1N7dpDgwS5Lu8=
X-Gm-Gg: AYBFou1tIcsoKWykqOxeiRlzbkWvYDVElF9tOGSL64xLQ8AGIW2JyPpXW8fv2zKJN1G
	c6FtRPA60jpvLjxfHJA9EmAVg9GIkcOKe7GruiXHHd6sQovLE3MHLzUQti6FCsF4xMMOd2xPZfB
	jkAcdjgVK+yQ/B/XdBmzghANYKVsFrdPoj8uT7QLkn2ut2BvSJi5nuIddj3BvxXa95u7oswEC34
	Q0Ad0oRNLPRHzfKocnaFRU8YzaLRD5xqdS1An2E93tUxNj5lFrdIokNJrrYb83ndY2yQdGZ3xvI
	ECXMVlB6GqiOYgOHbax8ByiKYLV0AF84AqssLPjehS8XemeyH+J39cprYSniU2dw/IEfzZKDDGa
	D/kkvW0TB1+WNF9VEpgGZMJJKPyi2UREAqT3JXArVpEgKCBpboU6XAyy8qLC407O5lUtm/7BChK
	mNBHrMJQ==
X-Received: by 2002:a05:7300:3aa5:b0:36a:2059:6c85 with SMTP id 5a478bee46e88-36a20597091mr4198746eec.34.1793214004705;
        Wed, 28 Oct 2026 12:00:04 -0700 (PDT)
X-Received: by 2002:a05:7300:3aa5:b0:36a:2059:6c85 with SMTP id 5a478bee46e88-36a20597091mr4198684eec.34.1793214003947;
        Wed, 28 Oct 2026 12:00:03 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm8639936eec.27.2026.10.28.12.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:00:03 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 5/7] usb: dwc3: qcom: Support broken suspend for SA8255P
Date: Thu, 29 Oct 2026 00:29:35 +0530
Message-Id: <3a4bdffa9101fa81e4511d84c5a3ddd0b972efe2.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfXz/kp9+MkhNjd
 AJy37/mVZUwnudi2+qXMC0QEiusFevJEprngZwZn4oAEWx2ym1iD1hLeEG/xT9FVEAzYpLLlqXQ
 7cRoLzTq4dCdWKV5Ezqawo1RKJzXT1Q17AAPJHKCTAXsuLZum8doWZvoGoRgENpNJI82hSklIAA
 qMWUoj8dNibXqFm5QSlbgq5xG6tGyjIFl6cwQTuLQ6MK4fSHtgQb9JSJuPWuO4J8F7+/tADgmRt
 8xiX5CdcXsjXo/W3xV4YMWxVNXjcYFmHRW3AkloWq8M0ctyFh267CgkHl5p9fv9EkH5q8kdz3Eb
 jQ5JOyOuvsZBZfX9/EqJL6r9loSx/EAlnqK0B+Pu2KaHqKiwHDJ+BX267Ae3gc9rsoezMPRF2fI
 Arf77t32vfEQlsDO0g2YjitDirGISIDFffZlqxvsFDII0/SufVaqxQ3+aHrwqIG4VlYKjWwhAZ3
 aECYCfyTLT6pQc5jqeQ==
X-Proofpoint-GUID: z9zZdrTl6fV40Cg78VdHArIT2BtTaJW0
X-Proofpoint-ORIG-GUID: z9zZdrTl6fV40Cg78VdHArIT2BtTaJW0
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae24636 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Hs89NwRFLGOCp7u7dokA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfXzLYiefiHNCmN
 uCbyst1stsdzoqyK24lrwmWOnqXBjEnE3wPrHbdgmdu1UJujkDILtWmRCsjWq9WhXvTcTgth/zf
 i4HVfHwPVJTz+N9lY6qMbAbQOrd2oMY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280075

During APPS Suspend, the clock controller unit disables all clocks
to the CPU and subsystems, causing the controller to enter the
Power-On Reset (POR) state. This results in the loss of
Qscratch programming.

Upon APPS Resume, the USB controller does not have the proper
PIPE_UTMI_CLK_SEL or VBUS_VALID. Hence, if only the High-Speed
PHY is used for a controller capable of SuperSpeed operations,
the controller will assume it should use the USB3 PHY and not
the HS PHY as configured before APPS Suspend. This behavior
disrupts the normal operation of the USB controller. Similarly,
if the controller was operating in device mode prior to
APPS suspend, and VBUS_VALID signal is not set after APPS resume,
this will cause the PHYs to transition into the suspend state.
This behavior disrupts the normal operation of the USB controller.

Address the issues by ensuring that the PIPE_UTMI_CLK_SEL and
VBUS_VALID are handled properly after the system resumes from
APPS Suspend. This is crucial for maintaining the correct
operational state of the USB controller and preventing
unintended suspensions of the PHYs.

Also, as the controller is starting from POR state, make
sure the controller Reset is performed.

Because the controller is reset on every system resume, the
Qscratch restore is done whether or not wakeup was enabled, and
dwc3 core is told via needs_full_reinit to fully re-initialize the
core on system resume even in host mode with wakeup enabled. Wakeup
on this platform comes from the PHY interrupts routed through PDC,
not from the controller staying powered. VBUS_VALID is only forced
outside host mode, matching what probe does.

The XHCI controller is reset by the same event, so also set the
xhci_reset_on_resume dwc3 property. dwc3 passes it on to the xhci-plat
device as xhci-reset-on-resume-quirk, which makes xhci-plat set
XHCI_RESET_ON_RESUME.

Also make the .prepare callback return 0 on these platforms. A
runtime-suspended device in device mode would otherwise be left in
place across system sleep (direct_complete), skipping the system
resume callback and with it the reset and Qscratch restore.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c      |   3 +
 drivers/usb/dwc3/core.h      |   3 +
 drivers/usb/dwc3/dwc3-qcom.c | 107 ++++++++++++++++++++++++++++-------
 drivers/usb/dwc3/glue.h      |   2 +
 drivers/usb/dwc3/host.c      |   5 +-
 5 files changed, 98 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index d9f4e4109abb..d782d5ef9c57 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1697,6 +1697,9 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
 	if (properties->skip_phy_init)
 		dwc->skip_phy_init = true;
 
+	if (properties->xhci_reset_on_resume)
+		dwc->xhci_reset_on_resume = true;
+
 	dwc->gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED;
 
 	if (properties->gsbuscfg0_reqinfo !=
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 1c8d441ea9f8..3cbe4eeb0a5a 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1177,6 +1177,7 @@ struct dwc3_glue_ops {
  *	3	- Reserved
  * @dis_metastability_quirk: set to disable metastability quirk.
  * @dis_split_quirk: set to disable split boundary.
+ * @xhci_reset_on_resume: set to reset the xHCI host controller on system resume.
  * @enable_usb2_transceiver_delay: Set to insert a delay before the
  *			assertion of the TxValid signal during a HS Chirp.
  * @sys_wakeup: set if the device may do system wakeup.
@@ -1433,6 +1434,8 @@ struct dwc3 {
 	unsigned		dis_metastability_quirk:1;
 
 	unsigned		dis_split_quirk:1;
+	unsigned		xhci_reset_on_resume:1;
+
 	unsigned		enable_usb2_transceiver_delay:1;
 	unsigned		async_callbacks:1;
 	unsigned		sys_wakeup:1;
diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 508b1ee7cd0f..3860ab83c28c 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -68,6 +68,10 @@ struct dwc3_qcom_port {
 	enum usb_device_speed	usb2_speed;
 };
 
+struct dwc3_qcom_priv_data {
+	bool broken_suspend;
+};
+
 struct dwc3_qcom {
 	struct device		*dev;
 	void __iomem		*qscratch_base;
@@ -86,6 +90,13 @@ struct dwc3_qcom {
 	struct icc_path		*icc_path_apps;
 
 	enum usb_role		current_role;
+
+	bool			broken_suspend;
+	bool			ignore_pipe_clk;
+};
+
+static const struct dwc3_qcom_priv_data sa8255p_dwc3_qcom_priv_data = {
+	.broken_suspend		= true,
 };
 
 #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
@@ -346,6 +357,23 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 	qcom->wakeup_irqs_armed = true;
 }
 
+static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
+{
+	/* Configure dwc3 to use UTMI clock as PIPE clock not present */
+	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+			  PIPE_UTMI_CLK_DIS);
+
+	usleep_range(100, 1000);
+
+	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+			  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
+
+	usleep_range(100, 1000);
+
+	dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+			  PIPE_UTMI_CLK_DIS);
+}
+
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 {
 	u32 val;
@@ -398,6 +426,28 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 	if (!qcom->is_suspended)
 		return 0;
 
+	if (qcom->broken_suspend && !PMSG_IS_AUTO(msg)) {
+		/*
+		 * Only system suspend fully powers off the controller and
+		 * puts it into POR state. Runtime suspend does not, so skip
+		 * the reset on runtime resume to avoid needlessly clobbering
+		 * state that was never lost.
+		 */
+		ret = reset_control_assert(qcom->resets);
+		if (ret) {
+			dev_err(qcom->dev, "failed to assert resets, err=%d\n", ret);
+			return ret;
+		}
+
+		usleep_range(10, 1000);
+
+		ret = reset_control_deassert(qcom->resets);
+		if (ret) {
+			dev_err(qcom->dev, "failed to deassert resets, err=%d\n", ret);
+			return ret;
+		}
+	}
+
 	/*
 	 * Wakeup interrupts may have been armed by an earlier runtime suspend
 	 * even if wakeup is now disabled, so always disarm them. On failure
@@ -421,6 +471,18 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 				  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
 	}
 
+	/*
+	 * The reset above returned Qscratch to its POR defaults regardless of
+	 * wakeup, so restore the configuration done at probe time.
+	 */
+	if (qcom->broken_suspend && !PMSG_IS_AUTO(msg)) {
+		if (qcom->ignore_pipe_clk)
+			dwc3_qcom_select_utmi_clk(qcom);
+		/* Make sure vbus valid is set for PHYs after PM resume */
+		if (!dwc3_qcom_is_host(qcom))
+			dwc3_qcom_vbus_override_enable(qcom, true);
+	}
+
 	qcom->is_suspended = false;
 
 	return 0;
@@ -445,23 +507,6 @@ static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
-{
-	/* Configure dwc3 to use UTMI clock as PIPE clock not present */
-	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
-			  PIPE_UTMI_CLK_DIS);
-
-	usleep_range(100, 1000);
-
-	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
-			  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
-
-	usleep_range(100, 1000);
-
-	dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
-			  PIPE_UTMI_CLK_DIS);
-}
-
 static int dwc3_qcom_request_irq(struct dwc3_qcom *qcom, int irq,
 				 const char *name)
 {
@@ -640,8 +685,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	struct dwc3_qcom	*qcom;
 	struct resource		res;
 	struct resource		*r;
+	const struct dwc3_qcom_priv_data *priv_data;
 	int			ret;
-	bool			ignore_pipe_clk;
 	bool			wakeup_source;
 
 	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
@@ -650,6 +695,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	qcom->dev = &pdev->dev;
 
+	priv_data = of_device_get_match_data(dev);
+	if (priv_data)
+		qcom->broken_suspend = priv_data->broken_suspend;
+
 	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
 	if (IS_ERR(qcom->resets)) {
 		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
@@ -704,9 +753,9 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	 * Disable pipe_clk requirement if specified. Used when dwc3
 	 * operates without SSPHY and only HS/FS/LS modes are supported.
 	 */
-	ignore_pipe_clk = device_property_read_bool(dev,
-				"qcom,select-utmi-as-pipe-clk");
-	if (ignore_pipe_clk)
+	qcom->ignore_pipe_clk = device_property_read_bool(dev,
+							  "qcom,select-utmi-as-pipe-clk");
+	if (qcom->ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
 	qcom->mode = usb_get_dr_mode(dev);
@@ -732,6 +781,9 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	probe_data.ignore_clocks_and_resets = true;
 	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
 	probe_data.properties.skip_phy_init = true;
+	/* Controller is reset on system resume, even with wakeup enabled */
+	probe_data.properties.needs_full_reinit = qcom->broken_suspend;
+	probe_data.properties.xhci_reset_on_resume = qcom->broken_suspend;
 	ret = dwc3_core_probe(&probe_data);
 	if (ret)  {
 		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
@@ -820,6 +872,15 @@ static void dwc3_qcom_complete(struct device *dev)
 static int dwc3_qcom_prepare(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
+
+	/*
+	 * The controller loses power across system suspend, so the system
+	 * resume callback must always run to reset and reprogram it. Don't
+	 * let the PM core leave a runtime-suspended device as-is.
+	 */
+	if (qcom->broken_suspend)
+		return 0;
 
 	return dwc3_pm_prepare(dwc);
 }
@@ -864,6 +925,10 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
 };
 
 static const struct of_device_id dwc3_qcom_of_match[] = {
+	{
+		.compatible	= "qcom,sa8255p-dwc3",
+		.data		= &sa8255p_dwc3_qcom_priv_data,
+	},
 	{ .compatible = "qcom,snps-dwc3" },
 	{ }
 };
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index 72c5593e657a..028a4f8a4fac 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -15,11 +15,13 @@
  * @needs_full_reinit: indicate the controller may not remain power during system
  *			pm and need full initialization
  * @skip_phy_init: skip xHCI PHY initialization on host init
+ * @xhci_reset_on_resume: reset the xHCI host controller on system resume
  */
 struct dwc3_properties {
 	u32 gsbuscfg0_reqinfo;
 	unsigned needs_full_reinit:1;
 	unsigned skip_phy_init:1;
+	unsigned xhci_reset_on_resume:1;
 };
 
 #define DWC3_DEFAULT_PROPERTIES ((struct dwc3_properties){		\
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index 3fb8be8be590..a9c81def13c2 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -130,7 +130,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
 
 int dwc3_host_init(struct dwc3 *dwc)
 {
-	struct property_entry	props[7];
+	struct property_entry	props[9];
 	struct platform_device	*xhci;
 	int			ret, irq;
 	int			prop_idx = 0;
@@ -177,6 +177,9 @@ int dwc3_host_init(struct dwc3 *dwc)
 	if (dwc->skip_phy_init)
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk");
 
+	if (dwc->xhci_reset_on_resume)
+		props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-reset-on-resume-quirk");
+
 	/**
 	 * WORKAROUND: dwc3 revisions <=3.00a have a limitation
 	 * where Port Disable command doesn't work.
-- 
2.34.1

