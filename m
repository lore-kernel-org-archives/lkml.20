Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804173914F8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050948; cv=none; b=hlmFbawBmP4fzTtx8n5Ebjfw5BpPWP6HJWKKS0stD+MTvav6WTl+OPQUMFKtgdVX+0vIUup1WcV6APm90zUX7TEBNb/hLUK55UUoU/ZjT85LgcFkArez7Tr0P3wh5ngAiWlc12+6WQgAn7GFOVbOIGAcj6+jNS1KSdkLm61dTn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050948; c=relaxed/simple;
	bh=gyIjtai3FPdjNhwgiTWZ85vEZ87YqCCs99cbS7IrqwM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BWKk/t4fsOO3wd1Yt7Cp3flAdk4qyTIA319UorbOxxxf039akgAqNheeeX5yvp0CoptJm3LDWfl+oZGPPrbB7LwKA2gmmtUvB07AWQanWFXjV5Racascj3QmRXS7vx6Q5NoDzTZG9VyIFpEUcT/HXiCJvRTyxLFIDgggLPdzNXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iPOpHo9M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=da1vizNc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iPOpHo9M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="da1vizNc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ADc9Ln1068035
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iI/I1Y90k3wTNupunWuPwY
	ZhHEdHNfgMTHLTvCVK+nM=; b=iPOpHo9MjgpwY7ZsfnyDy8PwJF68rcPF6TDQmr
	NwnBWSAad4HGCrUQIt0OxD3ScypAbAPt3tE+nlVXjahepzyABPQSiAU0OyLkjKZw
	Q1ZGW0uC+LA8ui/5Z2Sv0M1Kn3dUsHxdl0jkY5uIfpYNQsmvFcLxzqtFmNJRg5my
	9qDBYqhpKmCbVcl+ZIQNXNAkeHTVcIEaJr5Nkx4CNPUWj0UmIi9Gu7nXhvT2r1ox
	HsC9z03ksNKIvYu/hoHE2BNHFOpJVCR7hPHX/yp63rynNGWV2dgoFLWx6geow5O6
	h/zbE4yrC7sxhrAPUd7OrKzv84/124/UUl7R2bkY9CcK/NNw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwkw8cau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:35:45 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-48ade85cef5so676087b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789050944; x=1789655744; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iI/I1Y90k3wTNupunWuPwYZhHEdHNfgMTHLTvCVK+nM=;
        b=da1vizNc/kvdHRFSu0GU26vxGJF+ghldPM1SVCww5aTgyRUCppEWAnxCn3EMtHPea2
         ya8efhXWZYELuQD/DZryiPuWj8nWZt7+SzyHfVcgRGfsIJwpbTsLWulo341ztG3/4wgQ
         nE0FvBWfIva9Bkx1XXCp8QFIpu5+4nKcV1pKM97GiOffb7gIzOQH22YlOsJfb5ZQLrfm
         kB5BrSbJnYZV75SJzB+xM/fafR/2JpaPR1pNEE5awtOtEA0CJi3ftPfUZ2nN8esscezi
         8lGrmPeDH11upuiX4dnyGLnPj0fcXLvzPA1x7Vuzbjd4Up7BKnPbD6tcnYJBrWgOeoRX
         vbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050944; x=1789655744;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iI/I1Y90k3wTNupunWuPwYZhHEdHNfgMTHLTvCVK+nM=;
        b=dKgapRWqbRjRbEcs/EO3tJSHM1CFc8KFLtXCxjG9bTPbWYUIWEHFMZJcdd/bfMPyWy
         heBUWieF/I9KtyxLcTqRwhN7ZYlbYjXMsdW7eMSNXzTdO8pgg3XupBL1MYBnugZa4eTH
         QmC56Kbu5YWvfhXCWAa/ACR7DRo6Dca5/L1Uw82XL7/eaUujZJEwk39Tns2U+CvGqETm
         5Y07bCBe9dhxG1BhzddsKTDAB6TYuCOFfA+d2YV08bNfdObn6HVQSMp5vVlwuJeZPBAb
         YPnOPXaQZoWH+TN+Cz4Cxsm/SeES14Dx3Jv4SSaV35XQJSVJKKo0vhcGZ/Ma7xuRQaRY
         BlYQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+d3Wuw3f8uHIsoIYZ7eabFrH2Szp/afHaZfrhVyoVnecSRM3vz7PbD/AlGu491RkGk5Q3OeycxnXRd6k=@vger.kernel.org
X-Gm-Message-State: AFuF++nLIxOHw1wOutFlLpIHt+WVEEEqz5ksOR39OQu9pIAOxP8eTHgg
	gi6IvpK7JhEUGZ4ZKLhLPnLNdNQ4ctAMBePRFNTMPv5YJ6BWJ5GE6QUcTRaRwcc+BHMS1A6q79y
	yNxieD1hGKRNj8/53ECHMDwe+qhgOXGiad1zuj0TLogWbMD0sHxpu1Nu0xfMtMsaWjDeUmSZwSF
	0=
X-Gm-Gg: AYBFou05Sc9sZHLhRXQjzZf+dDiLQMmftx1MWcI4769QgKLIT7ku0F8RZHIMkZ/lRKK
	Gb5dz5lPIw5w+jUgO2lNEjuLSHRMxmSjhexeLzJoHnxtee01ZkLBG7GTXiccbU6kNgv0WiKbMgm
	3HG0ibWIa1eYVHw8UEkPAs4I4Uzz3VJMJ5cKf8YUCPtKzGzW7+UCgK5JPT+g9xHiofKIyw95L3F
	QtymD+K7tq4XRWS8yEsusZJBj3T1mI9Lba/aVEIFIHveqkXyt76PE+uOwMRxe/0YJLdNcA29lRK
	orv/ZTFsncb/V0R1FQe3cVMbJtVVziiThVW9q3OV8UzpKD7VzeXC4H4U4lZrpRfozm7gYHiYKad
	k1H8N9shoWbeNI3uss5KzF9CfAH9gUp1kiCLer121M+n6cOM=
X-Received: by 2002:a05:6808:3089:b0:4b5:8402:958d with SMTP id 5614622812f47-4bab05475d2mr21914802b6e.5.1789050944364;
        Thu, 10 Sep 2026 07:35:44 -0700 (PDT)
X-Received: by 2002:a05:6808:3089:b0:4b5:8402:958d with SMTP id 5614622812f47-4bab05475d2mr21914780b6e.5.1789050943915;
        Thu, 10 Sep 2026 07:35:43 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971246d9csm19056119b6e.7.2026.09.10.07.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:35:43 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Bluetooth: btusb: Support Qualcomm multi-subsystem
 QCC2072
Date: Thu, 10 Sep 2026 07:35:34 -0700
Message-Id: <20260910-btusb_qcc2072-v4-0-e78f04b7675e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADbAomoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIzMDS0MD3aSS0uKk+MLkZCMDcyNd88QUMzPTVBNTM4NEJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaAO4kSCJxAAAA
X-Change-ID: 20260910-btusb_qcc2072-7ad665e4560a
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=EZNd0/mC c=1 sm=1 tr=0 ts=6aa2c041 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=wiGumk0A3tkkXcSz67AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE3NiBTYWx0ZWRfXxoXO7MEUUsWc
 wxRu7NsmnlLKCOGm0DIlzZkGFPxPkK0jQCU89ZHMh4txRu/jhTHsIwHuwbkO1sKnfVzlshBYGRk
 qsYQaH7fE892m6sBpPIIN2TkP8gPFGY=
X-Proofpoint-ORIG-GUID: A9s-aMkyCeL4yUPTjfnAu98u4JLQgV1v
X-Proofpoint-GUID: A9s-aMkyCeL4yUPTjfnAu98u4JLQgV1v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE3NiBTYWx0ZWRfX+muMlRQ4NA/y
 GBZhtqN12SCI9vjAOE1krd/vAgi0zkYv5dNVw6w2Zv/PAVQrG07t5tqyOn+1X1PS+fLP7DZeWHA
 M6RjYRsRnbv+mw4P+3asWlflbte/HRMGHgUmEU8U/hKrvEJ9nNmxZgpqteNLoTuAoQsfPRPIyqA
 spOmjbMaB32wHiR5unXf/nuFSOjSYO5tbFPWMG2+CTdg7fFVWY206xmL0BfRaAb8bYOkdxhJkjs
 PHrPhy5YxQvOFr4Evr4P/A591/hIdoMffJ7RDwS4wTyx52vtb96EYkOS3eCaba9JEvRgoWZcotT
 XeEz83sjOdv/M9oVtQLdQJcshmvwEF8HZby4Y41VaJmqzR5gXzoY4sbh8/4gclHZuWHMOMNyxsd
 QpldAQwP8RO3FmHXZP5774biFXbtmFbPQEd3SKDCkZ1KMbgHTkx1yTAGYrJwh/zrUZQDAA9EZNh
 LeyWwpT4AipT89V83pQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100176

Hi Luiz,

This revision addresses issues reported by Sashiko [1]. Fixes are listed
in the changelog below; false positives are addressed as Q&A further down.

[1] https://sashiko.dev/#/patchset/20260907-btusb_qcc2072-v3-0-1f65350b03b8%40oss.qualcomm.com

Could you take a look at this new revision when you get a chance, and let
me know if you have any further comments?

False positives (no code change):

Q: Can an empty vendor packet cause a NULL pointer dereference in
btusb_qcom_send_frame()?

A: No — vendor packet's skb->len can't be 0 here. Both producers of
a HCI_VENDOR_PKT skb already reject zero length before reaching
hdev->send(): hci_sock_sendmsg's "len < 4" check for userspace writes,
and hci_send_vendor_frame's own "!len" check for kernel-internal senders.

This patch series supports Qualcomm multi-subsystem QCC2072. The first
3 commits are simple dependencies of the last one.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
Changes in v4:
- Fix memdump timeout blocking btusb_qcom_reset()
- Fix missing build information on driver rebind or resume
- Link to v3: https://patch.msgid.link/20260907-btusb_qcc2072-v3-0-1f65350b03b8@oss.qualcomm.com

Changes in v3:
- Remove socket option BT_RECV_VENDOR_PKT
- Fix heap overflow in hci_send_vendor_frame()
- Fix a stray NUL byte in the memdump file header
- Fix PM reference leak in btusb_do_reset_work()
- Don't mix goto with scoped_guard() in __qperi_tx_sync_evt()
- Don't mix goto with scoped_guard() in qperi_handle_evt()
- Prepare btusb_qcom for bulk serialization mode support.
- Link to v2: https://patch.msgid.link/20260830-btusb_qcc2072-v2-0-5c0e0c9dd98b@oss.qualcomm.com

---
Zijun Hu (4):
      Bluetooth: btusb: Add recv_intr() hook to btusb_data
      Bluetooth: Add generic support for vendor packets
      Bluetooth: btusb: Build the driver from multiple source files
      Bluetooth: btusb: Add support for Qualcomm multi-subsystem QCC2072

 drivers/bluetooth/Kconfig                   |   14 +
 drivers/bluetooth/Makefile                  |    3 +
 drivers/bluetooth/{btusb.c => btusb_main.c} |  127 +-
 drivers/bluetooth/btusb_qcom.c              | 4542 +++++++++++++++++++++++++++
 drivers/bluetooth/btusb_qcom.h              |   99 +
 include/net/bluetooth/hci_core.h            |    5 +
 include/net/bluetooth/hci_mon.h             |    2 +
 net/bluetooth/hci_core.c                    |   45 +
 net/bluetooth/hci_sock.c                    |    8 +
 9 files changed, 4843 insertions(+), 2 deletions(-)
---
base-commit: 755cf7adf8dd2d12627cb7de223d35b12228e2f5
change-id: 20260824-btusb_qcc2072-abb918ab4220

Best regards,
--
Zijun Hu <zijun.hu@oss.qualcomm.com>

---
Zijun Hu (4):
      Bluetooth: btusb: Add recv_intr() hook to btusb_data
      Bluetooth: Add generic support for vendor packets
      Bluetooth: btusb: Build the driver from multiple source files
      Bluetooth: btusb: Add support for Qualcomm multi-subsystem QCC2072

 drivers/bluetooth/Kconfig                   |   14 +
 drivers/bluetooth/Makefile                  |    3 +
 drivers/bluetooth/{btusb.c => btusb_main.c} |  127 +-
 drivers/bluetooth/btusb_qcom.c              | 4542 +++++++++++++++++++++++++++
 drivers/bluetooth/btusb_qcom.h              |   99 +
 include/net/bluetooth/hci_core.h            |    5 +
 include/net/bluetooth/hci_mon.h             |    2 +
 net/bluetooth/hci_core.c                    |   45 +
 net/bluetooth/hci_sock.c                    |    8 +
 9 files changed, 4843 insertions(+), 2 deletions(-)
---
base-commit: 1b737f2ef1686d0e5a7661eaeb097aad53ea7040
change-id: 20260910-btusb_qcc2072-7ad665e4560a

Best regards,
--  
Zijun Hu <zijun.hu@oss.qualcomm.com>

