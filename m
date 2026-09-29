Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D9A50129D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717733; cv=none; b=n5yIVnoR0qSn/QT47YgwseGMiV/wUlSqOmVSRrWOnXfhiYXnIGUUX7v77ZavvZKFBT0HNVkefWnNgKAz6i5PeT0YbbyUCkvgOYWSTPHYxQbRmO1HOidPp9bRTPp0RuDn0y4a38pI+fsEm2ayKJH2CqQiENIRMyuV3GFcZDWpT8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717733; c=relaxed/simple;
	bh=DfUyGXAigUOuE5hAQY8vlBtickimUxiN0dtZr1aGGUg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AAbWje9xVrIser0nTU/2dYdg5IeWYQjuW2mCmNMW8VZt8lREEiXLm/cC6E58+gcHOKCeGYugD2knsX+EVkmtta/Jz/fhO9xOSFStMCfe0dk/idUtb0JasJM8SnYv8Ac7TQyfeDmHSITC8ofMtmHric+jjGAA/RpQ88CFw8K5Gsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1J9L1ZA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ivebPjT9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1J9L1ZA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ivebPjT9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68THf5i1858221
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rNWQbn5BoFz
	a8fHCsTIRq2Yt6o/OubhO/LVi7rDZ/Jc=; b=l1J9L1ZAExmknpE9xfQcdyPpLvc
	pf2BO9KDSOTP99Ujb4g91HCHQg1O1qNtPLZLgzsQbcVjBTmtrg3MjyKqb5/ZUk9N
	+MJI972VCVy5i1C2QxPOspYBq8EFaODpxYiwyqio0tEc9E3+GXZdWrEyma6xmVPf
	vhKvISlP5eAWcqb7zNTJXk6cLwxv4kW6+S4wh8RjKrNYyM5SWEKTY9f2DCjxkmON
	THxTOTE/y5I0+FGy7mqKMU0HwKmj2O6VSjZaYTgrkPdBcEo779a+VIHCvZzg+RAo
	pEPmHxcgwA2xlcXZzJceylKYfSyQgS0LI3l2J7I1u6Yy0+uK/BTF6wlrkvA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h08e0kr89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1616443eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790717726; x=1791322526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNWQbn5BoFza8fHCsTIRq2Yt6o/OubhO/LVi7rDZ/Jc=;
        b=ivebPjT93AyqBUQBFE8CWqU1PSJACUXOOT5K+P8DENp5kvtKVWdqj/j7WcaYIyS55G
         RxGFJ/4jAkSUbHWIen1PPcP3X9jNJr3der3+pQyGdlEXOk8ZikqAff/y5dZkyRHNw2HA
         Rb4lbdRuRKSSBCFVFSycM6xhewFnWALsr1+91lk/1wkC+U1qFpFYNzqabPm4k5yYUasd
         A0bbxgQm5gkfINMjr29KhDcFEHxbLpntnxu0qIq1gMh3GUmASs82Ah2bKbvf3b1gyBjs
         RL5xcDmbcEvpAO/zsjWjB9fogx4UcA80PPdmF0Go8cJUFXPRDauQp4aPKGBpK4WOfROC
         wz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717726; x=1791322526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rNWQbn5BoFza8fHCsTIRq2Yt6o/OubhO/LVi7rDZ/Jc=;
        b=dEtUCqoWLflpXXBG7OZUG9fA3nzG38QPfNeIKFkTroahj6d1Jq0Rm8SMwVj9atRKK1
         x3Z2EPUTcddFWSfFyYWovFqMsXVpXGLvW8tctNnJitDT9erbf39jvhE0FSimaEfrPpBU
         piRwSZ5X2i7cVvljgzbD8WMW9wgw3FnydhWa2QItNRuKT6A7DYiFqyO+Rxr6tSuamjtl
         KtRS7it+5lH/vOcxZrBbNGW6ZBKVbHJ9jihOBHNtzmAcOAWohL6JWDXksyo+dycjBoM3
         viRqnAfh4L/evaAXNlOsH5zJ4s2up6+XBkWlhIQIRIcnrZqh8omjuv+a0+8WR17dOiI6
         Jb8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwMWsFPd5Jkh/rX5VtCymdNCl351DHNhbGaKbGfLHwEw85NdskHS/iRSYMOiEKckEjGY/a87hNjW7uViwA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDtLGQNmD766s8oVjAiVQ5Sw02+yWezTH8No8GGhvA10XBSRTZ
	6R25HqeEkpXM71wRrIi0wBzqR/+DWxmeMj71VdQNbGEux6fwxia1WandQhcvcjI1NtVFLjG/PHi
	48c9+4dGSS/CDEIFjjQniBNUcu/hbGJkBqMYH3PDOV2NbG+lOjfYQpGS9sVV0PO2+6O0=
X-Gm-Gg: AYBFou3RfF4JGwnD95C83IEM+sij1maeNAPDEifqXukoXXSYgxLUJ8QpQCIkFRgeJsF
	Kei76Usv6kM7tTqXPiB7+wg/3oueTEdWnixoZXvw37sT4a1l8KFPN5wY87u78EF1phteaKCKODA
	4TwmxUEJ8KiIQntc6g7h3FNIfeIxHXO3/OtqNpMI1AGvjPRP6i5FLKc8IRnrdfC9iU4obaJg+WR
	UT1YH9pRBK3mQU+lJnQUnCK2Z5hdnl3PxLmYX2aqSBAOvDJWyiRb/MKXk/PeQHTOgD/bkQETmDc
	pIHxd+RnJ5L6Vn8imJdRjzL5sRU8y+QE8B9yJMCvYFkCQ7gsv7wGEq7BY8eMwFOgboY5lb4AeGi
	7pGekZysMeTlAP1tdkLW+MIBpKyGwJQVSe25gfxE+5gNqI8x6kgnP
X-Received: by 2002:a05:7300:e9c7:10b0:342:78aa:51f7 with SMTP id 5a478bee46e88-34c675c97bbmr708987eec.38.1790717724994;
        Tue, 29 Sep 2026 14:35:24 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c7:10b0:342:78aa:51f7 with SMTP id 5a478bee46e88-34c675c97bbmr708947eec.38.1790717724278;
        Tue, 29 Sep 2026 14:35:24 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c391e25e1sm1512570eec.30.2026.09.29.14.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:35:23 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v9 7/8] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Tue, 29 Sep 2026 14:35:12 -0700
Message-Id: <20260929213513.2401005-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfXx9L0F6EKypdi
 d+Le5uCjBiBX6hX40Pw5ExjbRAihxDn8tC9E/hEvvnnprLWb4IeigHJWMiiipOJUw37NknvuBBH
 WLz2MX0PrigQ+BGFCgr7Kxd5yNCgflA=
X-Proofpoint-ORIG-GUID: BwWAUSHXAFHpgSOUN5YTNvBaHMH63h6n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX8pvwPT71YjJT
 ZMQzjzAkxGBaEbG50uVyX4AG/cfwWh9JBKwr12g37jaVUwYOzBusHpyrL/ah9nyygd4X5udQfnW
 /k7H07V0+pm+VMD33pzzTQZvKTp3Hqz+hUgYWz2k8y/c1LCwEIMeH6eV3rowA79p7iXhpK+xsgT
 m3A6J1GWclV9FPSSa79SxoMiWHvGkXfWoIcK2h/X7lLn81Kd0wO1xEwmCz7GC9Vm3bM21rwaAHO
 YSPeBdA5lm/OJOLaClxYSMX91oXGtFE5+GdNMI+WtvEhZgC7+Jp5fYZ70vVhemTFHqIzn2l7alY
 PCZ3E50vuihjRVssJ2P9ol0Gupr8fOFUcBad90RutkWAbN4JEXZhLi808ytKExDrdidKiVaxrCG
 m04VF/nnQfdISpj7JB0zIlL3o/z1VRlDTmoYPjW+y2pXhWdRpaD9CK9NKDGob6g04AcNjkv0Txz
 eN0qrIIHBifRzz3ij3w==
X-Authority-Analysis: v=2.4 cv=WJ7qzXsR c=1 sm=1 tr=0 ts=6abc2f1f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=dOwNoGVJVf10FbPJOZQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: BwWAUSHXAFHpgSOUN5YTNvBaHMH63h6n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290086

EUD provides virtual USB attach/detach events to simulate cable
plug/unplug while maintaining the physical debug connection. However,
the current implementation incorrectly sets the USB role to HOST on
virtual detach, which doesn't represent the disconnected state.

Fix the virtual detach handling by setting the USB role to NONE
instead of HOST, correctly representing the disconnected state.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 5a21a2dd0b0c..f6a5c2ff03bf 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -313,10 +313,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	path = chip->paths[chip->port_idx];
 
 	if (chip->enabled && path->curr_role == USB_ROLE_DEVICE) {
+		/*
+		 * EUD virtual attach/detach event handling for low power debugging:
+		 *
+		 * When EUD is enabled in debug mode, the device remains physically
+		 * connected to the PC throughout the debug session, keeping the USB
+		 * controller active. This prevents testing of low power scenarios that
+		 * require USB disconnection.
+		 *
+		 * EUD solves this by providing virtual USB attach/detach events while
+		 * maintaining the physical connection. These events are triggered from
+		 * the Host PC via the enumerated EUD control interface and delivered
+		 * to the EUD driver as interrupts.
+		 *
+		 * These notifications are forwarded to the USB controller through role
+		 * switch framework.
+		 */
 		if (chip->usb_attached)
 			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 		else
-			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
+			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_NONE);
 		if (ret)
 			dev_err(chip->dev, "failed to set role switch\n");
 	}
-- 
2.34.1

