Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686448;
	b=1IgHoidZrvPptxiEBz7sXMddEaHYuUQRKTeeE4WLFsSd/cFgjFL1/ILXsB7cobUawThv
	 OI1uFHl/J6PLr24hkYOH3FnYxHM5Qn1n6d6LOf0DcW4XkI4dlTxgkJWl20fyomJmz1HKN
	 6jt2F/Cp06xBOjgLYhAOpUHLRG5AEqwAlgNWW6altr8NCOrTz522WWJHdruR0IQeY8php
	 174XgQuSQ3ONBWD4fQovBMSSW23QG2XJcXiBZxEwv+x1QSPJfuH3mA5h3HSi+rGmKgJEo
	 uNHUZL3vW4GdWpMrAE8biog778hT/dLUTkTGPDCkZ2CDxQ650VwPlbbNRa3OPaaFvDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686448;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cmLsmwoycaOlY7rck5ZTRAIGMqEJQy3dpojcPtnT2js=;
	b=3y4T6Bd+vwBKYSDRPnwpiBQPYhtIthdvinlHIaPDjJXGIAPsrb5uvrawlCANTiSs2+wX
	 VGFb5WMoEY41jEYcoWjmGrZsJvl4z7WDqogqVFbKuE2DM/rk9T98XTbgTsB7RiePCkAgN
	 J9oRg6nko1f4+8z6twpIlicp0BrLeVkU36MXLqA/OngJkmY2oW48jjpVBjcukPegBK4EX
	 ilf+NysaY5itH5BAO7h8iq8c0RCNBvodnuAiUTa7CgtNjSX73xDSU8ILx6Y2cftASDJyp
	 2nfwlvg6wruFcsTaI7A1FbeUAEawUIQh1wZlBZNTo9WLfVXHQMsKBPCgtcQ6xd+IuTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pZRF8ht2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UCNNnsIS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EE5606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86EE5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pZRF8ht2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UCNNnsIS
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31eqku4002830
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 06:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cmLsmwoycaOlY7rck5ZTRAIGMqEJQy3dpoj
	cPtnT2js=; b=pZRF8ht2hgSHW291i5O3z73nRN7NmpXzRFglnWgQwJA0xOuUvDB
	wE+/qKLEqk2qHTu8eyuQ1faSo7WmzJF1kuxAJtOG7IOKh32vjoZNAiy9XTVuTR2a
	+ReHxL28FPjgy/IRmtwfNFCjGstOGIlYrVP6CGGKDeNX69ag31Hx41lT/bepbEO1
	mdIPWzjL/r+OLmIsk2ImOaeMsnWoadthnSlawO/XGTUoC5m/7BTiiS1KnGIcZMos
	iIhQE3CBJdwajev36Te05vyt7C9c+adUZ+J3f4CwdOX8VJd4tvFRxUgqeZrnKJu1
	21UynGItlPHL79qWwWmH7A5JXPIvBMRk3Aw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ej7h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:14:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3662e7a9299so15288192eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793686446; x=1794291246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cmLsmwoycaOlY7rck5ZTRAIGMqEJQy3dpojcPtnT2js=;
        b=UCNNnsISsBvsE5eajT9paFCqWbsyihc/WHTKSmWTl8/rk5YKP9Xb9pwNlveZplNLkI
         t47MNxbgBEPneGUbVh0W4tFWXbhmagBzFqXNtrk+qZlPeJd3IJ2UCY4XZ0Mqedbawmr6
         QJyExejJ4pLonaFn7rH1L02jTcMExw3CgsSiuCeueoViBKXvE+qkUBZvm/8AwoRywzfA
         hCSxqh9nkPs3vwcgE7Xz9ONCkrzwTxeIhMQvl5yiXt5YArdJUxCr4tTnGv79eEOGaY+6
         ztJr4RDByMLw42oLY6inaeBZqf0iZSZ75gKfivGZtt48VRZNZcs/eFztMlbQXPPeUZHy
         ofXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686446; x=1794291246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmLsmwoycaOlY7rck5ZTRAIGMqEJQy3dpojcPtnT2js=;
        b=CSOBISHxQTHzyXWsJm3x0/0nWgxtZBiexUsUW4gC4a90aLygSVBnr7rZaiymLvleY1
         owU6FPwF45dmb3EFXHEJNSM8SjILiIODuLfx6wCKWHPMEfLDyF2sv3ANSRytmFwubbTv
         klR4bcf7Z/mFdqAzHeFMk4pqpysgB4282o2V6IpaP2PXm/7qxFsyqlezIsCbgCyKse6l
         5QWVzvM1VPHoTypWGaaLDGx5rTMPfDV84P3hMsnaa+LzlWmf7O/Xg2pgE7N3wyOfDefl
         teUEe41H3MNIANwmHnhd/B0UyxQhISrwduT3mUGoOwYKKq7CgkWM4kaWF7zUEmBO87QG
         PyCw==
X-Forwarded-Encrypted: i=1; AKwUvBx5MqgL8R4/Sl0Sc106NLoxZnRSlOWWMOu9raHpfUEXKVpRswkByhfqWBpTkTI7t1AK3XzOQqCKFeg0cjE=@vger.kernel.org
X-Gm-Message-State: APuU4Z80zOzLQV0I+ce9UeB1Nay94VK37GRYci4x5fTKcDIR1uPbj1Yq
	XetTe5KDJR6ZgSNHm72k9Qp0unwjHp/ZgGXx/yWIj+o+l4VrxegiO5oQVF3kU4HnHYnu7GBLlmr
	KuTpn6GetbhlHrwOL1EdFb64TRAsyLW9DiIDB9u7fbMCD8161jy3YnzFdZVnQQ4Lwclw=
X-Gm-Gg: AYBFou1lU8w9EV3jwWg0v6yI3fDy0ss+mGhc5mFkaFne1NHqEw7yDLKUKhZ9kkTczqV
	0jtfewG2frt1IW2s3hAPlqrckLBeiXpSleM2DmKGKuYVepbyLCNrTXnMjbN23tfSaycJIM0iAEv
	2adtnz8eGWRUatfDiO4Xvu8UIeK8IvM9Wj5lNJkPLAW0z+i8cO7DRZJUQsksMv2EwOq0pAfo7ed
	4kWWwy1E69T7RCgzc5cGdmf0HCJRUv9LxtVwprQltyyae42Q4IRcttkIW7ca0AJHg67JdXpmvFn
	RUSPujzlbKIYfcnAQBZBiS7qb25kY63QT8BRIdKJx156XSgQZ9HmRZ2Ccnz64S39Ue+TpJE83dg
	Cay9YuoyQ+SkkP+rkUE1cfY6V6Ot1j2k+Yok4c+dIWAamjT+7+9zKTF9XaAc5lMTcU/mcHWKUFH
	9hOKRyQeHV4MMGdwCEby/Lqg==
X-Received: by 2002:a05:7301:152f:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-36a42397b34mr13292162eec.20.1793686445858;
        Mon, 02 Nov 2026 22:14:05 -0800 (PST)
X-Received: by 2002:a05:7301:152f:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-36a42397b34mr13292118eec.20.1793686445074;
        Mon, 02 Nov 2026 22:14:05 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36c8d3277e3sm1947091eec.29.2026.11.02.22.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:14:04 -0800 (PST)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [RFC PATCH 0/1] usb: dwc3: qcom: Keep wakeup option default off
Date: Mon,  2 Nov 2026 22:14:00 -0800
Message-ID: <20261103061401.2942139-1-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyNCBTYWx0ZWRfX1mhgDOI7f+Nt
 iNEUuBNKFcoQsFNK0D1gagYBPFetcyWx9eRN4U0XbhJKfy/gAROtE1/mAN1s8RGfPP+nweZ+jZj
 F7rOfl1BG7liAhAj+PeoDg1jlEkYuEhKd8KeaOEWoATyDDIWCLYaMn20pPKlwsINR6u55519FoF
 Fh7yxwQqGgX9GgQILO8vjWrQHvkhbZavzTzpIOTtwA2ji65+pU5pFCmxARPrBOCr7H1+wAfdWBi
 8j1LPVs45ZYqcleL7b9dbtSULqlfz36cg4qJCXbNgQZF/LEvF5ACXgL3fri7UCxfc56Z7qXdr4p
 oWUFqKysncE4EkmA6vD1bfh53lCvTg/w2c30+G0JZI/e1/M6xR6IHkFEJLxVGmCIaiHlFP+TNgA
 OO8PV1p8walAGk0JLd4pffeTOyazwzAZqXcPBUMCEMPKI42E09lEDxBuZ7oqjOD1dJfKldXgLYm
 KHm3qnMpIKAWiz9Z/OQ==
X-Proofpoint-ORIG-GUID: 10QnyZSAhyQJe7_EqnibqfAIXkdCV2f7
X-Proofpoint-GUID: 10QnyZSAhyQJe7_EqnibqfAIXkdCV2f7
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae97bae cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=Pt4Z8C64eHDFcQK2EPwA:9
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyNCBTYWx0ZWRfXz1kbC7nzAcny
 ncOPKJmBEBp1fhTb2oNxKbdDGfNyTQ0TS34zZgSAZow7fLVz4TeEKmJ1QdRW7l0Al+RO2j/8k0z
 0I3Nq6m0xqbCdwCX3kyY5U4y8HpkXlc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030024

This RFC proposes changing the default USB system wakeup policy of the
Qualcomm DWC3 glue driver, and asks for feedback on whether the change
of default is acceptable.

Current policy
--------------
When the controller node has the "wakeup-source" property, dwc3-qcom
calls device_init_wakeup(dev, true). USB is then a system wakeup
source by default. Users who do NOT want the system woken up by USB
have to disable it:

  echo disabled > /sys/devices/.../<dwc3 device>/power/wakeup

Proposed policy
---------------
"wakeup-source" only describes that the controller is capable of
waking up the system (see
Documentation/devicetree/bindings/power/wakeup-source.txt), so with
this patch the driver only marks the device as wakeup capable, and
power/wakeup starts out "disabled". Users who NEED USB as a wakeup
source have to enable it:

  echo enabled > /sys/devices/.../<dwc3 device>/power/wakeup

The motivation is:

- Users do not expect USB activity (connect/disconnect or USB line status
  changes) to wake up the system unless they asked for it.

- Power consumption. With wakeup enabled, host mode system suspend
  keeps the controller and PHYs powered (dwc3_core_exit() is skipped
  and the genpd is not powered off) so that the wakeup interrupts can
  fire. Today this extra power is spent by default, even on systems
  where USB is never used as a wakeup source and the controller could
  be fully powered off during suspend.

Comparison
----------
                       Current (default on)       Proposed (default off)
                       --------------------       ----------------------
Initial power/wakeup   enabled                    disabled
User action            write "disabled" if USB    write "enabled" if USB
                       wakeup is NOT wanted       wakeup IS wanted
Unexpected wakeups     possible (connect,         none unless the user
                       disconnect, noise)         opted in
Host mode suspend      controller/PHYs powered,   dwc3_core_exit() and
                       wakeup IRQs armed, genpd   genpd powered off
                       kept on
Suspend power          higher, even if USB        lower, USB fully powered
                       wakeup is never used       off
Attached devices on    stay suspended, resume     reset-resumed or
resume                 quickly                    re-enumerated

Possible regression
-------------------
This is a user-visible change for existing platforms. Many Qualcomm
arm64 DTs set "wakeup-source" on the USB controller, with this patch:

- USB wakeup stops working until userspace (or a udev
  rule) writes "enabled" to the controller's power/wakeup.

- In host mode, because device_may_wakeup() is now false by default,
  system suspend takes the full power down path in
  dwc3_suspend_common() (dwc3_core_exit()) and dwc3_qcom_suspend()
  powers off the genpd. The controller resume may fail if power down
  path has not tested.

Comments on which policy is preferred for USB controllers, and whether
the regression above is acceptable, are welcome.

Peter Chen (1):
  usb: dwc3: qcom: Keep wakeup option default off

 drivers/usb/dwc3/dwc3-qcom.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.43.0

