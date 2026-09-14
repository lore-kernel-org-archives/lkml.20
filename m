Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25853655FA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789357402; cv=none; b=i1OfDFrcWNNdakQ9ClVwPlxll3WZZoPIxRNfty+UvnFDG/MEr0HsWDalUIfeuinUsL+2PNsXDIDd1No6ELsmDMOwbw3XaEruAQnuGvPKkgOzrtsuVUs/+EbxE5h9/MPsz8GT/uZq9uD2vufJHrVSduaMNKOL8m0Fl2UfcYc5dHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789357402; c=relaxed/simple;
	bh=0DJphAlLU4Lqq36X7R5fjqAeZSPkUOxhBf+KhiipwAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NtLaaxS/Q54UAeX2iItNSMMsaaGoTNdQzcfEh8BVW1hbvkMyUwCO/dRnWCBthq79Zi6IbHTSZD7qvxLM5IyjszRIh5hCG8+i1V3R9ClayPcoFlGY0LXhw0/rn8ylsO8WLKh5uNhfxnND9k+BfCPTF8PUGe/vaVn/pjmi9qrg52s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWLBXXSp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cnRAiMsN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWLBXXSp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cnRAiMsN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2fUCj2243248
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GAsbxYca6VjWpMbSwguYm2YOe+ZCO4Pw6f1i4SctU5c=; b=NWLBXXSpLxZgDioU
	+NPIKIEO9L4JyP0OPnx0JOuCXzwT2qIA76HXXvko4tn8xnE6MBjaWapmh/fwA0Yn
	NsAQPnccB8b7LLPASjtOdWu3oaD4LJECVZLvhqq1x15Rt2xTWcdT1zQEj31mFHNw
	NlaBBCmvAscqDwwc1h//fPbXWwuHv+yBRTKsEDFLNaMpCXHJ0MhdFZWk1FaFLeNl
	FxDqf5wBpPW2RztQlSgSJKzXU/oVDvKI34kLAojzUFixaP6usZcN7+I/wEonEIpS
	s6w3QBd4Bw2CFp5HIXkMfJsdSateEu+O067N1Trtj5+sa35NoOwSniFPC8MYPFJ0
	C4RMew==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh4rnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:43:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-399271df9d8so753768a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789357399; x=1789962199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GAsbxYca6VjWpMbSwguYm2YOe+ZCO4Pw6f1i4SctU5c=;
        b=cnRAiMsNxQZWAN7w40OH8IUeVnM59j9xPCkawDxdbZobEfVhnIY+tuukc1PlB8Pkq9
         awnHMRmwtHJrbHD22pcZRUeZVMw3eWjsgyvu+lya8HlL1oxGL/7WdXinK2htkZXZUY7z
         E/qBGtZun/nNyIGbTECnkiiqbQI5SkF61eZx5yu+LgvSF+Ko4yQlbKInxZ/bhvk66Qo6
         qzv663WIkyb+4wKfMlOKqugGLXOPOQcdESOVil3Ft5yBmVOVnvf0jmlZuWINJP06urqA
         84BPrUd4UrpsYGkgFGy3/yixe3mCW/UN3Tqr4MsYp4vmsXwURtDC7FIl5WXZt51E/gMm
         DtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789357399; x=1789962199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAsbxYca6VjWpMbSwguYm2YOe+ZCO4Pw6f1i4SctU5c=;
        b=dqcbxKFLswOPakD4GaY9jZXh7e2zZQawuDC3uZT5a7kAu/V7unFoz9FTrfy0/juhQt
         B6uUpJDCuuvJLRKo01tS4wf4QoxXw4oW5fpVbWSeWXZ5zzoZtaIcSVK5uVaHcJufxr5x
         iaMNY2Wz2PvTmcotpDBYqaoFX9uAyxXl2scEec5SBelPfMyKtovXWQGPN7LRHf+wkKMt
         ZsymvX9lz5/ieHXUE8xr6lrqLu/0w63x7srLcYrNJT5okDydIqjUnpvqeORWamuxSBYZ
         f5oYx3HfO+jDZ0O7ffLY6p/FsxUy8pIckZxz7K0kmwiHfIT+YO2AtoPaTBUi+OYDMWxS
         Y6pg==
X-Forwarded-Encrypted: i=1; AKwUvByD3b678sx4iW9Gq2hMYyqFFN29cPnkl4m4BwGHkGMtlnkj9aB48KwPxQ1Bp9LdFc/WaGIymkj4aKZCiUw=@vger.kernel.org
X-Gm-Message-State: AFuF++mUQaQiaPP83uVco/qLtHppS45jxSKgO7WE35AtQsV6sLeaji/W
	d5GVyVEP5lQTf2bVe+LxftyYtIUWVCQTUfuCwB/9fExAf4MognOvdbZzTaynAvhijHADMPe1+Nm
	WOur2+8StZkcwKWZqRapN7L/EG+5j2+tyLGvMZMpUFo9Iag3nlUbIr+zMowfTuabZWKk=
X-Gm-Gg: AYBFou0sJXf43n4dCsgjTK+rft64cU0rYYXwuc5f6BtFBZ3+rw1sR0taG6cl2AB7pQn
	JlDOHQJmHUHW/a91m7EbrDpb0ArF3se2DjcbRRXwqOqoYdSgFUb84mtyJXS4/J4fFQaFs6I/N7y
	DjbnBeq/Gy7a83KMepoMSplXDb1O0PjC3hPU/DuNuhxX7Cl58VhS8SaNgzS1sDpgyHOpu0ifSn7
	lPrewIeQAORCPZWvI1r9bOHxYu8gaC43L9zA2aJ/Lk/Iqf+OAGZJyeK7UdIg0IoA2QJTdOyea7p
	sy8r8MGAGp/Ak+LHaLgg9/yZFOnosI2vH2ei5REVk9ytMFWVm8UZ0NilL38FicBL31sJCzCWB29
	X23GM3dIxlNqD5IH7Od+f8fm+dYV6uGIt7f+XjHtIt1p0nXs=
X-Received: by 2002:a17:90b:440c:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-39dec137c0emr1127695a91.3.1789357399158;
        Sun, 13 Sep 2026 20:43:19 -0700 (PDT)
X-Received: by 2002:a17:90b:440c:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-39dec137c0emr1127666a91.3.1789357398697;
        Sun, 13 Sep 2026 20:43:18 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ee07f2sm21250894eec.18.2026.09.13.20.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:43:17 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 20:42:57 -0700
Subject: [PATCH 2/4] Bluetooth: coredump: Fix btmon heap-buffer-overflow
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-misc_fix-v1-2-558c1e4028b9@oss.qualcomm.com>
References: <20260913-misc_fix-v1-0-558c1e4028b9@oss.qualcomm.com>
In-Reply-To: <20260913-misc_fix-v1-0-558c1e4028b9@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Manish Mandlik <mmandlik@google.com>
Cc: Zijun Hu <zijun_hu@icloud.com>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: bz14iHBX4FbYviiGhkZ2Mlp2X6oorhcf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA0OSBTYWx0ZWRfX7/dwWBDWBXmq
 kQi3vCdiL0PghE0fuiEB25BPt+arl7qSmGmiEU6WzQrxVnw45YdssJgfTHRQCWJkzn+Whw79ArO
 Gh+H9xT2yjin5JmwkWss0/tjVpZ7YBCV/ChTboGECib9TV5l0x6MRw/SYrvCfavckElY4RRlA3e
 2QIkEDiCT4SB2GC+xJX4BTE8v0MuK0qiqW/ZZdX4Et2TpA1h1hsyyKFB2DBIpgb8VUtinG6mmm/
 9p34y0mDzFGgF9acNif9AyIIE9dnWcA2k3D4rpoT0m59AVeeKlCqu9Ph099WPhlXKAmvEYrDA7S
 qoEdESAqajwken/oWCq11djL3sZBr2j10sZSeZDXUv0EYKn/WrK0hgZATRTyapUYxZ/2LVhx4j7
 2Fx0BAf3+tr5DxEeiXUt8ueiBEPgP0WkfQHkIJjHh1qT7WieHNH5vXf+6Y/FLOpfyAayTDXtat1
 mOBkV78O+c8AdeMGGgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA0OSBTYWx0ZWRfX+bY3tZf7PvjC
 yEMOXdAjH1f3h7f2w9bqD0YPZ0xYlX8irmgENnOwGFBifIsfijBOzHJyCKI3vdn9m98cCILtdnI
 E12N0OEdOcryPr3TwMbB6Sq6B5+3EEQ=
X-Proofpoint-ORIG-GUID: bz14iHBX4FbYviiGhkZ2Mlp2X6oorhcf
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa76d57 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=veR8huZC2ww56zqa0CUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140049

The collected coredump data can exceed btmon's maximum packet size of
1490 bytes, But hci_devcd_dump() forwards the entire coredump data as an
HCI_DIAG_PKT without checking its size, causing below issue in btmon.

Why ?

For a monitor packet, its payload length @len in header may exceed
BTSNOOP_MAX_PACKET_SIZE, btmon uses it to access payload in @buf.
so cause heap-buffer-overflow.

Kernel:
include/net/bluetooth/hci_mon.h
struct hci_mon_hdr {
	__le16  opcode;
	__le16  index;
	__le16  len;
} __packed;

BlueZ:
src/shared/btsnoop.h
monitor/control.c
struct control_data {
	uint16_t channel;
	int fd;
	unsigned char buf[BTSNOOP_MAX_PACKET_SIZE];
	uint16_t offset;
};

Issue:
ERROR: AddressSanitizer: heap-buffer-overflow on address 0x51b00000065c at pc 0x7f50b987a029 bp 0x7ffde88dc8d0 sp 0x7ffde88dc088
READ of size 17916 at 0x51b00000065c thread T0
    #0 0x7f50b987a028 in write ../../../../src/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:1096
    #1 0x5b4f3443ae3a in btsnoop_write ../src/shared/btsnoop.c:289
    #2 0x5b4f3429cbf0 in data_callback ../monitor/control.c:969
    #3 0x5b4f3444fa9d in mainloop_run ../src/shared/mainloop.c:104
    #4 0x5b4f34451da6 in mainloop_run_with_signal ../src/shared/mainloop-notify.c:196
    #5 0x5b4f342953fc in main ../monitor/main.c:303
    #6 0x7f50b8c2a1c9 in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58
    #7 0x7f50b8c2a28a in __libc_start_main_impl ../csu/libc-start.c:360
    #8 0x5b4f34295ed4 in _start (/usr/bin/btmon+0x29fed4) (BuildId: b41caafb24db693946c283eaea48112186863d2d)

Fix by forwarding the collected dump data as an HCI_DIAG_PKT only when
its size <= 1490.

Fixes: b257e02ecc46 ("HCI: coredump: Log devcd dumps into the monitor")
Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 net/bluetooth/coredump.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/net/bluetooth/coredump.c b/net/bluetooth/coredump.c
index 71fc8dab4004..61b45ba58a65 100644
--- a/net/bluetooth/coredump.c
+++ b/net/bluetooth/coredump.c
@@ -250,36 +250,43 @@ static void hci_devcd_handle_pkt_pattern(struct hci_dev *hdev,
 	}
 
 	pattern = skb_pull_data(skb, sizeof(*pattern));
 
 	if (!hci_devcd_memset(hdev, pattern->pattern, pattern->len))
 		bt_dev_dbg(hdev, "Failed to set pattern");
 }
 
+/* Align with BlueZ's BTSNOOP_MAX_PACKET_SIZE. */
+#define HCI_DEVCD_DIAG_MAX_SIZE (1486 + 4)
+
 static void hci_devcd_dump(struct hci_dev *hdev)
 {
 	struct sk_buff *skb;
 	u32 size;
 
 	bt_dev_dbg(hdev, "state %s", hci_devcd_state_name(hdev->dump.state));
 
 	size = hdev->dump.tail - hdev->dump.head;
 
-	/* Send a copy to monitor as a diagnostic packet */
-	skb = bt_skb_alloc(size, GFP_ATOMIC);
-	if (skb) {
-		skb_put_data(skb, hdev->dump.head, size);
-		hci_recv_diag(hdev, skb);
+	if (size <= HCI_DEVCD_DIAG_MAX_SIZE) {
+		/* Send a copy to monitor as a diagnostic packet */
+		skb = bt_skb_alloc(size, GFP_ATOMIC);
+		if (skb) {
+			skb_put_data(skb, hdev->dump.head, size);
+			hci_recv_diag(hdev, skb);
+		}
 	}
 
 	/* Emit a devcoredump with the available data */
 	dev_coredumpv(&hdev->dev, hdev->dump.head, size, GFP_KERNEL);
 }
 
+#undef HCI_DEVCD_DIAG_MAX_SIZE
+
 static void hci_devcd_handle_pkt_complete(struct hci_dev *hdev,
 					  struct sk_buff *skb)
 {
 	u32 dump_size;
 
 	if (hdev->dump.state != HCI_DEVCOREDUMP_ACTIVE) {
 		DBG_UNEXPECTED_STATE();
 		return;

-- 
2.34.1

