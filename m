Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953664;
	b=XuoSewjxLMZQj0tyKKF0CK7C8Vm5JENbEWPgQykdGlovOTO6G4CQbqS/u3B643V+OGHl
	 0qzVv6CjxF95H01ujZAF4z5mvOhdX5FwrKjvqrbKWTzgQwvnrwcr7Pee76gVwI4l+Aqu7
	 S2oDLk5EV9aE0+pPCJWlG7mhk+l1I9g1voHKQRSBjfzdWmqZKPg/17WDFnKn3wD7bpXsY
	 dol2ThWIsJBpbF0++XdgRFxlz/nBhjp+L39vHzdLwaZVgApWrvdUV0IB0OpZ7oS61ezS2
	 JlWMZOigrl+SKv8/qIcVd1tsVbkQ5fMb/ZtAc5cB3u3EIpBaihQ97aou5OfkLGXULEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9tk+I4vZOr9XanR7g9lQ0IcR5uGKfPMbK/eELVN/uXM=;
	b=H7trXy+ehGLvKKMcbzepALrJ0FCwrGqU6QyInFBL+TBFpzBjHNL1roLWwQQqgJifP28v
	 UHhzCo1L6ysf7BlrsZHnKa8qAJr5KziV0v33a9MuA/oFrjD+ARhQ4gkO0veuzQ3QPVIK1
	 I5Pqfob1Id0+qqk2D+w3hPuMUh2w4WdFvcvL+UV7W0VeF75Aesa3kfGM1JYEtqYeKbE2/
	 wKiK/SIz5DdQ2lk9xo9MxfnamUiE9cjRPM2wdBwaLyZTWzKIW80bweu3SBNPFZTm12Scc
	 SijLi9RCyflLeqHVf4Yy4qNKADxaS0oaCybS/EBYkyQpDVvtMzsTZFdmTRZMP0qv7UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E5z0jlUu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AoSR8SL3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AC8606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78AC8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E5z0jlUu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AoSR8SL3
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R21n128919
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9tk+I4vZOr9
	XanR7g9lQ0IcR5uGKfPMbK/eELVN/uXM=; b=E5z0jlUuI84O/9TmJuPY8MefdF+
	ncOvlz9BVDgebFROOGx4/yn5ZcGe+YXewiUd/VCnYAS/v2sCHOP1pln2r7FQXNgJ
	fu5XF/4Vq9Pa8lMbhGpAUwFlxoU7QDULMx5ehsChvwbtVfOYUBWVp43qfL/9yCkq
	fBT7ArP1Vu/yMdjY+eUceDAG8vXkp82QwOZrPyuWJf/zWJc4wINevAACZiMfjCe/
	fsc5Z/2tM91xR1kAxjnoKR13HI82vgqwiLhK08ulH3ZbXGeB+RYLexXTbyBpeBRs
	hxeB89qBvAmH92WSPpH0RD0hAtdPvLIZu7JZS2lqnw9ZU1wbitewLY2swAw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9svh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:27:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso632297a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953662; x=1794558462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9tk+I4vZOr9XanR7g9lQ0IcR5uGKfPMbK/eELVN/uXM=;
        b=AoSR8SL3i823moGVYyzm7GRUwif/+xj1twJwQ53T8u0dq+/4k7NaZA1TAvN/b7OwNv
         FPDyOdf9DtsvJUjVl52MxDbLPQ4Iolem4IyKuevmgYECvgp/1c36NLUipq1y/uFpk6G8
         e5eohCHhVZ943/K3eGRTsXoMa8K8GBuhgyI2mjL4ujDXPKQwHRRXjvp/Ighj5Yo+81Uc
         z0OfWymrT7K897arwStwgKHzANfa3ggy+wGZ9b+WKXcd0cPsUksjWfs1dknllJcGOhcm
         cfrM+MKwMJf+jZuCJsKGJmJkdOhue4Dzbp4XpIEQxz9j9opWkb1Mb3//Qmmr3zmdpmpa
         RYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953662; x=1794558462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9tk+I4vZOr9XanR7g9lQ0IcR5uGKfPMbK/eELVN/uXM=;
        b=X6MbWVrbOD69z13OD8PPT7V86G/yuWmhCpUxUC9LsqmvTCg12x+ibfa3aEQX0QrWOc
         U81q4D9/U45W8YjCWuAl8DfSpiilOte4CCfZ8tvfGFIr1Bs9bslh9QLwgVymItRM6GGx
         gfrRiLu+4cGMOQ+/eRHKbPqgdCQv1KCX/2/P97UsamPc3F873U/j6/aiV7iqyP0lEVi5
         pSn7/9HNOyayfkBNEKipXNHlu7prmzRsTQAwDQoqBSCT8P0i6fAvv2dt3ayR3TgWxEL1
         lTttfg/S+vlE90yb5NsKaH2hRxNoJ2JO4/5K9svtbqr5pQJ4Xm5uymTY+zxbkTC48ZBI
         4+yg==
X-Forwarded-Encrypted: i=1; AL+hErHwvC+skT0YBlSJ5RC9O0vjB6HjfH1Qf3E3c+SF49MmOVfHohsuwowTeXi5wnh6PEgZffmYWSZKeDjOfJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KnUatue9Iasy52fZArMxHzaKR/LwDuXhpAig99l1wR79Pj/CJ
	leW6/RdALOenXvAJqrd8edhdb2cR7QXCJyTn0yJdDgCYoOse7fcq4AGfqjfjMEvQcJk42K1XSVN
	IwlWOFnejUsL2Te4ZwBCwy7ldKh1CigHLcAO6PwgI+H/AJBQk8bH85H0NjibYANEoRaw=
X-Gm-Gg: AYBFou3ta9WXfHQCjhVHtN/msXkmEq/0u6o0a0XDwLvv2rc9kj6es2/7iN0sazfEryW
	g0JpJdbqEeyADGmZpWdbJpb8bqHKi4pdfdt1VRqECBG9SeFDMUeLEc7N841TY8diuXRcRUypu7k
	sTl8JZdMrKseQHdcsCTbZBZkeOvcC+b1BgRNO9xxkmQINbpY6/zEeU967B+j0wGr9f0KQ7OQLZ2
	M/eEH0dG+3meUaOhRSchETSz5cWg1QsV1A5J5hrTLCTk4XlzRZc1MKQ4JswqKFTRO22sA3NHz+Z
	uTZj4jpYmXFLRDUnwjagaO5TBxo5PxzdRaXNZ3R+DHEoV+/TvXAmV68f3TrpNVj/htY9DKcw5G2
	PQhD9Lhu4Q+nj62UnnaubkKUJPVSPesCqmwMR5UUWXcGXNXuXRkw+BWaW8xSP+RFTomYwZ9hTlS
	PtQA==
X-Received: by 2002:a17:90b:52cf:b0:3b0:ae41:2706 with SMTP id 98e67ed59e1d1-3b0db5f60efmr1936186a91.4.1793953662480;
        Fri, 06 Nov 2026 00:27:42 -0800 (PST)
X-Received: by 2002:a17:90b:52cf:b0:3b0:ae41:2706 with SMTP id 98e67ed59e1d1-3b0db5f60efmr1936132a91.4.1793953661802;
        Fri, 06 Nov 2026 00:27:41 -0800 (PST)
Received: from hu-taparana-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c42a72sm2433951a91.3.2026.11.06.00.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:27:41 -0800 (PST)
From: Tapas Rana <tapas.rana@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Esteban Urrutia <esteuwu@proton.me>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        prashanth.k@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tapas Rana <tapas.rana@oss.qualcomm.com>
Subject: [PATCH 3/3] usb: dwc3: qcom: pass live SS-link state into PHY at suspend entry
Date: Fri,  6 Nov 2026 13:57:16 +0530
Message-ID: <20261106082716.128968-4-tapas.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
References: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfXzsmDQrcisc4k
 bhMHHSrQXxBDgSVFdr/PGjVMEuaYMLSNyfFnQs+BOqpd9lqyfcmaey3gldVY8en9loqTGeNkmRQ
 W8JPRpR3j9BDFGU3YZdyOjzhfEU4w+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX4aLIHbOQGHQ0
 bo1RNZ9l5Icxe1tcqausCvapgKO667/hEnitWF8U1nXRqDVJ4AXmMUQuuVX9Y1gRy77JqNXNF/F
 SS8WuPeQKtl1aS3s/KJr52CGIXVEauSEx9g0VbEI4BLgz29qUnSi1ssNUTc+A3nydrA4+0w2YWi
 v8nSTF4PoPOdPw5HQGRxmVBIIE5m7hVyb0zKbVZx7hqqjIlO2DiuU4ivKJULa+UCsjmKP3vMmPo
 VQdn4M2tL3rrYLaaMCGxagb/NHyDtK07JFADi2RZ1l1b+ZrTLdSvbeM6/27IpGV/8kV8hJoJoKU
 +EvWdyhUY2UXu7yIU/QY+W81pJNu5tQKfNtakkG9Xom5ZZr80J8c8rTCfIXLRrKbLshRJOtNOGE
 a37qq3i1hMbA8aAhlkQKjkcOF9pwMIV+7THiPqhjXcGir/Q+zs6uQLk9eSJX2f397XfYpnlyBWf
 u5g18PAwKh4qUoUbubA==
X-Proofpoint-ORIG-GUID: dkBEO0FfEAqhvy5ZOjV6fiAL0FkM-6My
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aed8f7f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=qBW0Ez0WUtIADFg3DaYA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: dkBEO0FfEAqhvy5ZOjV6fiAL0FkM-6My
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

dwc3_qcom_suspend() puts each host port into autonomous/wake mode
without ever telling the PHY whether a SuperSpeed device is currently
attached. qmp_combo_enable_autonomous_mode(), made SS-aware in the
previous patch, therefore has no live signal to act on and always
sees QCOM_USB_SS_UNKNOWN, falling back to the legacy receiver-detect
mask regardless of actual link state.

Add dwc3_qcom_read_ss_state() to check each port's USB3 roothub for
an attached child device running at SuperSpeed or above, and pass the
result as the submode argument of phy_set_mode_ext() so the PHY can
select LFPS detection when appropriate.

Signed-off-by: Tapas Rana <tapas.rana@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..d4ba095e47eb 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -19,6 +19,7 @@
 #include <linux/iopoll.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb.h>
+#include <linux/phy/phy-qcom-qmp-usb-ss.h>
 #include "core.h"
 #include "glue.h"
 
@@ -66,6 +67,7 @@ struct dwc3_qcom_port {
 	int			dm_hs_phy_irq;
 	int			ss_phy_irq;
 	enum usb_device_speed	usb2_speed;
+	enum qcom_usb_ss_state  ss_state;
 };
 
 struct dwc3_qcom {
@@ -251,6 +253,34 @@ static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, i
 	return udev->speed;
 }
 
+static enum qcom_usb_ss_state dwc3_qcom_read_ss_state(struct dwc3_qcom *qcom, int port_index)
+{
+	struct usb_device *udev;
+	struct usb_hcd __maybe_unused *hcd, *usb3_hcd;
+	struct dwc3 *dwc = &qcom->dwc;
+
+	/*
+	 * FIXME: Fix this layering violation.
+	 */
+	hcd = platform_get_drvdata(dwc->xhci);
+	if (!hcd)
+		return QCOM_USB_SS_ABSENT;
+
+#ifdef CONFIG_USB
+	usb3_hcd = hcd->shared_hcd ? hcd->shared_hcd : hcd;
+	if (!usb3_hcd->self.root_hub)
+		return QCOM_USB_SS_ABSENT;
+
+	udev = usb_hub_find_child(usb3_hcd->self.root_hub, port_index + 1);
+#else
+	udev = NULL;
+#endif
+	if (!udev)
+		return QCOM_USB_SS_ABSENT;
+
+	return udev->speed >= USB_SPEED_SUPER ? QCOM_USB_SS_PRESENT : QCOM_USB_SS_ABSENT;
+}
+
 static void dwc3_qcom_enable_wakeup_irq(int irq, unsigned int polarity)
 {
 	if (!irq)
@@ -359,8 +389,12 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 	 * freezable workqueue.
 	 */
 	if (dwc3_qcom_is_host(qcom) && wakeup) {
-		for (i = 0; i < qcom->num_ports; i++)
+		for (i = 0; i < qcom->num_ports; i++) {
 			qcom->ports[i].usb2_speed = dwc3_qcom_read_usb2_speed(qcom, i);
+			qcom->ports[i].ss_state = dwc3_qcom_read_ss_state(qcom, i);
+			phy_set_mode_ext(qcom->dwc.usb3_generic_phy[i], PHY_MODE_USB_HOST,
+					 qcom->ports[i].ss_state);
+		}
 		dwc3_qcom_enable_interrupts(qcom);
 	}
 
-- 
2.43.0

