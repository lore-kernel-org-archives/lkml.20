Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CCB3AA1A7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770758; cv=none; b=CyEOD4K+aFlp3KgZuOFcbCgtMEHj7yPwC6fxZYuoFxcCFuorwu5jqUbAOb3XyAuElOUt9eFojyJv+y1ilASnRF2PKDgIyIRDRdP9FmQx6Y/CulzrN1nKDYlX7a6GlE779tQSfmwzHz4yQ3R/2CWSShe8AbV3ZMDLkmbisC5EY+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770758; c=relaxed/simple;
	bh=1YVuQIRYSqkNtX77g8NT7j+E7lFkBcy3hwqxZOroS0A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RHVz5MzoYsfgbvhWe4qvbo9fQOgFSafSkl3ap4k+2vaQj3JTtqwUvieH7LJ3tP2Xmnw4oBLX0OnpNatbhFxb1y3SgQbdYBBwnbgBnZbwnpC4pxDAxfzAzB3+MbayCA9FzBaetq0QDGtZNPwMM7VKHxH1eV1cC35yUQiOzWF2LWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTe8eMD/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jMZAP5Jj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTe8eMD/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jMZAP5Jj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777DIk2838543
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:45:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NzkvIz4E8Bn94zq8Ipxaeb
	3rY0VkEU4sbNM/KCYhWbw=; b=kTe8eMD/VwQniEkZyPEVf3PxaSUvVj7+v/mJHW
	VTjfq+13qU3IIFTUGmCSiPsNWLmwHaCPU5J4KpHU1vzbOWkpsdyJhKDckUsOxIQ4
	Lp75wd7x66qLcPMSW99XxSVZj9fSxlMfFFT8Tmcvlmzc+3qSofpwEgk1PRA7xlc+
	agJGfnd121ZvnNUEJQzgJKRyf2Fg0dvngOa4+RPyxEg2OCEFS0EO3GeIYa7fe6O1
	jsNb5koSoWRjw+p3x+stGRCFHgFMrY0eT7UQVFvQJ8QIq9Hbz4X7Dh49f44Y7O5F
	iH5FLPmWqQTdT3U1vCSvgt3usZDy9YA7SmLIqwwYT6bdu8rg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuep1p7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:45:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398bb9a6408so941912a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770755; x=1789375555; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NzkvIz4E8Bn94zq8Ipxaeb3rY0VkEU4sbNM/KCYhWbw=;
        b=jMZAP5JjzD3clZd6euRVlweINPMf3qCSmf4OeNB0Bl9Xh3HaMGyNr0E0OQWPPmYrOB
         CRVlmcp4SkdvEit4orL2j0K5sC3olIFJkx7Mj46UiEr67F19re/ytbWsorCkABExXLBR
         p6sTv3xtK5CPpnNKAR18sfC5RL3GaHTqr3NzUmV4xcteTZ1AXMyi5D+DL7sWkX5fHvWK
         51fxZgN/FoymCjWs/gu6HTScGu2uuA0CTQhQXTKSZgQu+Cdzi3LBSsRHMQvOeUUz9DO3
         Afp4tGkwxJ6LWyA5rkGRcBWrPxBUPDnEZ6RIb3MMGRz/U0u1P22lut0sfK4YKV3VlRxF
         /Sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770755; x=1789375555;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NzkvIz4E8Bn94zq8Ipxaeb3rY0VkEU4sbNM/KCYhWbw=;
        b=VX/eFfDVB04MlhQjIbWwR0R86nTaT3NdTdSEpT3/SP10TBb3lkxDbmL1wIxPwTM1C/
         /fODm06KUDIVq6TSK6Jlpa1sTkFfKXalz3LpsHHC/9hRpHeaT54qEp6viqTUouzYA5k/
         NaHDmB+AfCzioQLDIBDPSSagAjFmKzVDPXviW44x6KPQJI9D3frgYfA4LVXG43p3BdbY
         M21hFOGLVnVRNE/v8wQvjmUimPF/osjxCTsJ6KwLUm9OSm5rzMX1slrkenrr+Z6tbpYd
         FxKgOQcy7igWAggBbyTTiFJNXnLCNIt0bcEVGukX/WIq1r6uGDbJUjXW0BJgI5oTssdx
         7cuA==
X-Forwarded-Encrypted: i=1; AKwUvBzuiZMlabb4SrcoXM8wNEq5p88yOU84IG2RB6CyIkuJOyZGGwPphy5UrBvZ4eIUOUdwuz2RJwbjaI5CdQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++mmWJ+oToMM8w/uxO6X8TYTh04KFkKVKSkBwXMk9OGyPAa3b8V+
	pxxtJnBoH92AZw8P6iHzZGE+SlCRK1QKWRcGYKIOixFbJlQeLdtLBTKeDam9Omh3i1mrO7D3dyQ
	5VPqoNcfxYQ9ez8xtAMPPlAYz61Qp+fOWNZSDKFMoWDQnAKwLYCZNRiE6ZzKA1UCQHQ/M9+N62h
	o=
X-Gm-Gg: AYBFou3CGETpajzAP9hKsqMYwb1CnNKob5uDUkws9QpW8QnCVnG9lZa8sz8yzw6D8/i
	iGfkP3GXOgIx7SWrWisY/UFCdRHEalR666KFZSDMz9/q0703xyeuCKpe+6TxvVnaoem8zrOHJWl
	JTWMi7y0A4XiJQKfwLQ/NxGi0TV9FWBCsjlRXC2I1DLEcA5m3Erirh1VsR7dXbV7FKimK2NospX
	fsB9GnD2LbIfXqc3GUmLpA6TF+vN07vM2lyb4WbgPzPpFpzEoCjCjn/GGu54XF+z19pbMXg8uMi
	DCrNwv0YdO/CA7tybok+gfZVA1GogkLIg9dkTaI6pgxfajGgjiWBq0E/5R7NteERMUXcRxqEPee
	kVmmWyIrL6n2/jzI8CCWVawrk9smQgzsHuT+GbvfQpl3xO94=
X-Received: by 2002:a17:90b:17c5:b0:396:d28e:b52 with SMTP id 98e67ed59e1d1-39b3d7595b4mr14416455a91.3.1788770755218;
        Mon, 07 Sep 2026 01:45:55 -0700 (PDT)
X-Received: by 2002:a17:90b:17c5:b0:396:d28e:b52 with SMTP id 98e67ed59e1d1-39b3d7595b4mr14416414a91.3.1788770754682;
        Mon, 07 Sep 2026 01:45:54 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm23622117c88.13.2026.09.07.01.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:45:54 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Bluetooth: btusb: Support Qualcomm multi-subsystem
 QCC2072
Date: Mon, 07 Sep 2026 01:45:37 -0700
Message-Id: <20260907-btusb_qcc2072-v3-0-1f65350b03b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALF5nmoC/2WOyw6CMBBFf4V0bcl0QARX/ochpi+kRkBaaDSEf
 7eg0UQ3k9zcmTNnIk5box3ZRxOx2htnujaEZBMRWfP2rKlRIRMEzCDHlIphdOLUS4mwQ8qFKFj
 ORYoIJNzcrK7MfeUdy1d2o7hoOSyQZaOyXUOH2mr+5e5Y8uGG1jPKaFJILiQolQE7dM7F/civo
 W3iMBZQbdzQ2cdq7nF5+JZM4EfSIwW6laBBFkoVufjnlfM8PwHBd6nXDAEAAA==
X-Change-ID: 20260824-btusb_qcc2072-abb918ab4220
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NCBTYWx0ZWRfX1aW90Z67qKl3
 6H5cIoJZCY0HYXLJ/jqMTbGnzvmzOWSUS5BTP7p16OuSND5gc7aW0QXSD5enkKrWJrTtDJnZqW7
 UAp/Z6CCqLvE1vdEL4ywFv9uac+ybZDQfw5wPd8zMT2u4MVZHReVMcoqnV4aMOsk0FnotCzg7vG
 EqgFXgeWCVjPBdbqsFAushp8eH9KULvmADh5A+tObib4c7d5y4TVLd0vsdBOsD+La8kaNItpb4l
 gg2+epYeC7gkZ5VgQTDZiwOO+40VX4yAnDIdmx7c81xrgCho9vlI0oA6UibVGRSaS/ln0R1cA/t
 hKLj4PwloeOqUvze4A8itSC7QgXRIqGh3+vAhnM1zI9mvIlKXzHlFCI59nlhh+hrRdO9FgRBog4
 ordCKYsHXek9ou+86D8sE9hKmVgLQzlwJV1Qy9eaOwQNTPDgaTBQWN6ZuwH75Ux6DtZ+hCVwqHs
 82grpvaPkLhzK5xEdwA==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9e79c4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=wiGumk0A3tkkXcSz67AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: JsxeKZNcRcyO1LfvqHf34JCAIVN4sBds
X-Proofpoint-ORIG-GUID: JsxeKZNcRcyO1LfvqHf34JCAIVN4sBds
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NCBTYWx0ZWRfXx1gRmB4a13mE
 ok3BG5kvAj7YnUdqSThBo+XjA8uKFSXJ4zJyDFFpbQNiHGbn9f1Z6kQKtT1AW8zY9VK7uP2iMod
 ZEDHt/hDzxLT/qFu3fRV/Zk+AJ+c5U4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070094

Hi Luiz,

This revision addresses issues reported by Sashiko. Fixes are listed in
the changelog below; false positives are addressed as Q&A further down.

Could you take a look at this new revision when you get a chance, and let
me know if you have any further comments?

False positives (no code change):

Q: Does this explicit padding with null bytes break userspace crash dump
analysis for btqcom_submit_memdump()?

A: No — this header is internal and appended as dump data. Its fixed
512-byte size is enough to delimit it from the dump data, so it doesn't
need the text end marking like the external file header.

Q: Does mixing goto statements with guard() declarations in
qperi_try_wakeup() violate the scope-based cleanup guidelines?

A: No — all the gotos happen after guard(spinlock)() is taken, at
function scope. Since every goto stays inside that same scope, it
doesn't violate cleanup.h's guidance.

Q: Could this cause a kernel panic if a zero-length packet is received
for btqcom_recv_vendor_pkt()?

A: No — not reachable from a socket write, recv_vendor_pkt() only runs
on the RX side. And skb->len can't be 0 anyway: btusb_upward_frame()
pushes 1 byte onto the skb right before tagging it HCI_VENDOR_PKT.

Q: Can this lead to a null pointer dereference on the transmit path
for btusb_qcom_send_frame()?

A: No — skb->len can't be 0 here. Both producers of a HCI_VENDOR_PKT
skb already reject zero length before reaching hdev->send():
hci_sock_sendmsg's "len < 4" check for userspace writes, and
hci_send_vendor_frame's own "!len" check for kernel-internal senders.

This patch series supports Qualcomm multi-subsystem QCC2072. The first
3 commits are simple dependencies of the last one.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
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
 drivers/bluetooth/{btusb.c => btusb_main.c} |  126 +-
 drivers/bluetooth/btusb_qcom.c              | 4514 +++++++++++++++++++++++++++
 drivers/bluetooth/btusb_qcom.h              |   99 +
 include/net/bluetooth/hci_core.h            |    5 +
 include/net/bluetooth/hci_mon.h             |    2 +
 net/bluetooth/hci_core.c                    |   45 +
 net/bluetooth/hci_sock.c                    |    8 +
 9 files changed, 4814 insertions(+), 2 deletions(-)
---
base-commit: 755cf7adf8dd2d12627cb7de223d35b12228e2f5
change-id: 20260824-btusb_qcc2072-abb918ab4220

Best regards,
--  
Zijun Hu <zijun.hu@oss.qualcomm.com>

