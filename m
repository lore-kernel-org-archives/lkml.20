Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F226F39184F
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791610415; cv=none; b=nDT17k8oxetihxNO8w2nkZ+UyU5sgxNwUE5RvAQ1IZRP6xV3tG/sfA2MCNOknSDFk0IQjOkiJBBqvrp9eUBZC2a617+yiUxVQxSwOgnBbx497BvQaxOp6Gw5n58vCk5DSczcgMPga9QmJl9zLvkstiRRe/43DCLegxvu+X8krIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791610415; c=relaxed/simple;
	bh=mKjBkoicB4lsITmUvx/elieS4iigdeZqxoKhvRZox9s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NZaR4A40AcxMn8qXnxT+I8c6fwNzcTupqDYRX0JGhjxekuxgQHyj2B8+bdCrLHqUPto3WPK5D2fCn+j8FFaILxelOU32xCpcVd+r8zHtatF4ebvTWurVIs2ZaklkoqdgigHO4F6zWnHqezrAWB5aCegbWuXBsWCWBFCkvozHF1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ig9NbE/L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hpIlcqMk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ig9NbE/L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hpIlcqMk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A2eSBL529085
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s2r1O1AAKXF
	38pJJeX6hQa8Gey3z8SLxPhW3IGwND8w=; b=ig9NbE/L/ryY7V2ADfO5eGd1e1o
	DWUEtRF7mIYNDDZfdKVOHoRVXqdJ3SRaYk/RFbeT80nYH15TLH5Y6B7hNufOs138
	oLZmno38nt5mx5M40PqFGlcwzZcYwzT0bUbM891bl9t0zcyNe7snvK7TRWTcqrkA
	84CmcRoY+ghoMJWMn2AYLOeJhF/z9WWl1Y/LJrskN8nP8OgRMNVQM0wseo13eiEl
	iQ7USCn27DD8rKWB3qGfFBAvcWx9/ICtIm0Xh4JWDLnGCzDuIhb5ui056XxHMTMN
	m2K1YEFfylzOtt2U/H4gTBkL0rbmGt/RtOR03NuEpNsYmKe/1zXGUVxGNhg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2f8kq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:33:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88f2b158139so293503b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 22:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791610412; x=1792215212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s2r1O1AAKXF38pJJeX6hQa8Gey3z8SLxPhW3IGwND8w=;
        b=hpIlcqMkWZByEEG60V9YxQA4WFu4cvWSwk8DgNoIPJl9ZPVUW4k82uTHNppT8tuyHe
         tO0gHdsbXQJE7TdO9dU/OfA4QZIRJr+e0QYgO21dnN14WdxP6KxJWj6+AgwSTxWeaowV
         2KpSFW+5ijD7KBTTvxkNG00lVD3i8TI3OygCii62qJCZWFAbRF0MsaE5Ema4087uOy7u
         dZMnlR7qatlK8jw2zL+gnO4RUJq+88hAd/uFVQGx2FnJU7Gy+mobVH+LJXDytmtgyuq3
         emVKal5Pnfep/Bv30Q0SZYxdr1tHuobu1DeE+HO0cyc7dzDN7OZTkfW0nyzkZ/M1TT3f
         +Y1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791610412; x=1792215212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s2r1O1AAKXF38pJJeX6hQa8Gey3z8SLxPhW3IGwND8w=;
        b=SwAu1HbconC/Mz++I2o1cGbS+KklBSwqXay0aMiPuU8ERKtCKYXL3fDVIRG3+KBeLw
         CDtUqIrKzgwJekalgejIMRPzf24CQOICX+CyQdLzZGpQ3Bex7zeBSHKkLAU/i5kEgcYD
         f9F7J6LVbkEgQxyhJMzzhmhbCOjhk1fWTae6KgprWSc84QZSe1d06gTwavbFHufirBbX
         zwou5vUGICAuR5AO/jNZA/gEYx4wzsuKzk+RFYrXmVSbhr7WQNCiqJd6vRMcrn0nRL4r
         pRHOF+ejzsgGEHHbnKYn3BK6HkXQG7nCH82gag6M95w+cGBjzhN7dmF+IK4fDZ1WmP3H
         b56Q==
X-Forwarded-Encrypted: i=1; AKwUvBz2v5LjzoVw2J8uV+IMmVMaMpXSIPUISYauJFycIohKxJl4x2VqR3OrKFsxY1bhJF/jr0fIOsi2oL2/v8A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJE9vH9dO4ohaDAsqAZAPxqvHNBox0+BopA0pSGWXUbqqYcetcA
	duMqcHbD9cI3MBKT6ztPIEPIUfI+qg1u4FG0+9NXCTxsA6LRc776b1+RPwWeSL4ssvTkBqVnbt3
	0A9+titne8zmfYWpIYmM70g/UwPeTr9grAqINYtCJqRrAkRxnbutwAKPfNEUoZOx5+tE=
X-Gm-Gg: AYBFou3p0c7j0o/vRV23YwSTSuvoqSKriJ4u29m000qnDlgTdBmwRtAODa/I2OZEfHU
	xfBtzgUMrMtuXjofC9lks/pV2KeFsRGuM0eL8AUl1ztmpV3xXeiDK1nbdk6Bn+9or9AYJxbiU2V
	M/kbGf/ok++2sXodFqSxGa96qKgxiDr7/Nlak2kJceDr36JcoMVKKjXi357N3vY5Xm3kxyRyzez
	ScYlOujHLBK89Ks9HN1EoOrG0OzhdKysKUc6Q5zE7yGds+YU22VPzF0Uy8ZWqm+X93/KvShiEhU
	UX+AMxRVsPNh4WwZaAJXVx6+2MRsgx71upGQ7ikLk/OUwBKETEmVWEh+7ZWmJXUQKPtrObJBW5H
	ldDPtlc2jcvBdMw+8nStu6FPUjep0x80=
X-Received: by 2002:aa7:9311:0:b0:878:38af:1970 with SMTP id d2e1a72fcca58-897c8c82152mr3343489b3a.60.1791610412439;
        Fri, 09 Oct 2026 22:33:32 -0700 (PDT)
X-Received: by 2002:aa7:9311:0:b0:878:38af:1970 with SMTP id d2e1a72fcca58-897c8c82152mr3343456b3a.60.1791610411803;
        Fri, 09 Oct 2026 22:33:31 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89928fd8469sm174028b3a.61.2026.10.09.22.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 22:33:31 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, p.zabel@pengutronix.de,
        wesley.cheng@oss.qualcomm.com
Cc: sriram.dash@oss.qualcomm.com, jack.pham@oss.qualcomm.com,
        krishna.kurapati@oss.qualcomm.com, shazad.hussain@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v3 5/7] usb: dwc3: qcom: Support broken suspend for SA8255P
Date: Sat, 10 Oct 2026 11:02:44 +0530
Message-Id: <20261010053246.2991984-6-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
References: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfX+Gljs514Ho1d
 Zd3WgXRe+4CfIfs+EOjijcLG2XhaLidh4CswEoa93VlP1zcHlhdGp1HAQhacsCpiOmrvcsBEbYB
 64XkdNcGDojth3DtqY2WdkTnTGDVLvc=
X-Proofpoint-GUID: NuXz5DGFA2YcsMqnkHgVVB9eVWhT2fNs
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6ac9ce2d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Hs89NwRFLGOCp7u7dokA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfX1sIBUN0HRn95
 h7Pic7MnuIXu/ULf8fb86YzD8QqwOmw+224kJ+SA9MnQDIZ0z1K6u/zCivIW/M19/uv/hmYZCf2
 n2i3wDEqPZgTEHsHsOkPEfy6v8IPSlTPA7OlkIB3OXqvP/QcGB749aKJ/7DLLMW32rRJ1yPmj6q
 3l9QjNL+gBOEfVgs/KIEgcNn8VUVfwdZbb1Yy7AeLIrDrY0EfBVHYpF1z6pfe3lLKB19mPO7Nwd
 Pc5GgZVv3FpBulioYhe4xe1DZWmsmu2/p2ApRYc7pHFMeN8roMom/CwUsgUipRF2kdoJ+PTyt+5
 sLhxvXZS6ifWV9JgZAOuLh2v/e6AiQOJmTAhLIvqCd/6GSx6Nr+poswoGIEZ4i6oj0RLFnf9rXd
 +vfXHkbLa1+eFBpKoBhH7xZLahq2MEqNfUlwYT254edrN27vGvP2TJ+AFW5WRhr537tsYd/CoAr
 1GqldwtrL7c3by3Qj8A==
X-Proofpoint-ORIG-GUID: NuXz5DGFA2YcsMqnkHgVVB9eVWhT2fNs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100021

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

