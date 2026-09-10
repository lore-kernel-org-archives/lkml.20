Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A666649EC76
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050950; cv=none; b=D5M8ZeqGeZokPn335CrOYgnLs6iXOJ5NoS3uFhqdkCmXeI/CCyXO6TRF76QuA/hzt086bpovWc4/qGS/hgqHsFRIaCftJw/MxeTTOckf/S0LBb5onuSE5/fT1IunxhVih1OLtltDswlpjJNSAqTy0sAmDhJYd1zEdj4w7LwiUoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050950; c=relaxed/simple;
	bh=TH5vzca/DE4IuRYl8j+UF5OPl0hEyeQJ+vZNfQPGOzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rvmvTyQr2pJUts5+5AmBnlpjvLafA1edI+Bl/gIJwZtRyKC9MDf4JN/2cQGVWAS3q9nxD10pMBvo88vhXKKuFihHSz+FH7q4qJ9Ec5gmd1xbN24ct9pkpds6s9lHsrEg2SwXi5vAaG1N9In4yFlRl26KJxQ26QMYUE08JWXSxVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bETx3LvJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZs2Xcuo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bETx3LvJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZs2Xcuo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7hSG244676
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wbT1Cc1NciLh6CzE4VxkkwHzDMNo9OI1Hd3+UmFrYNQ=; b=bETx3LvJNofwr2lM
	ywe+xf84VBHLyT3fyEHZQIW1usQOhyBBly/12dbNVK1GfFE3X1BiWW6nxXB3IMb0
	v67w2Oi1yZHI89k+9T0p6KzT2C/vG42hOieSxQrohSlM1r40aHQ4MCnq1BcdYo8b
	sqhtkIkWfT5bPno71zAt/i7uSTtCRgDg5n2atniB1AkFmeCe+yhGk19r0K7rxWOZ
	B9iK+iy7JRz0uECMQD7iQppoeGLJfEOi49p5+635SS2NsoqUJHmpPCyJHAUeyPAB
	1eAnLEZcSraO9qliD9eZyBwgZXFpfl4nVZz5B5tU1yOYFLZKIEF1bUqrgRyLQYwc
	t9Pu8w==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfmh7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:35:47 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b37f6353c3so485657b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789050947; x=1789655747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wbT1Cc1NciLh6CzE4VxkkwHzDMNo9OI1Hd3+UmFrYNQ=;
        b=QZs2XcuoxpzzGgiAPBactYYtjha78IBdSNEGDOGdWKjAtk9qpusOJTIVq64ztfYI5T
         Us7JMypg5mPJ67rZTzHRUR/I1MLvFn0J2YaIgxwWrkRpktizkW4dn5kpm7znEV+FZrl1
         VuMAX3zjYzFuzbw+As1CzhYFTOa/WJM1U7YUV1grQio7mcJra2Sv2CxziWiqpf+UP8xJ
         ZoP4TIYFP+lp5k0bolZgwrIXg2o8Z35/q1ZAf7dddg/A31eo74d59NGRavvkRxwh8B64
         kqORSXppKRmqNvq/kX7JSeR0LUZUWAQRC9hnXF9mOavvdWeCAF1XcIlV+yrsOnmTGCIO
         4r4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050947; x=1789655747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbT1Cc1NciLh6CzE4VxkkwHzDMNo9OI1Hd3+UmFrYNQ=;
        b=e82lrFVacad5EMfURWT09faO579qoBm1Dnz/QSLpEhggxguKkVsFnvY3RDuzv8pAml
         BHRZO5/AtkvTFQmQ4Zl/7fQvRT3rh3Itm4+RZabIg/OULdyGFLHbgNvmQ69SBeezEog+
         1R0Awl1aUndruIBila2b2Qs/v4O2MdNEOtRdyC2nBCWPhpDc6xe1Oh2Mrtr1UX/QOPU2
         XXbkIaFE+UyPwSYOWIL/1aVlXVK9o+diOJ1iM9TmF+1tCeFKYWMK1ZeyWYMnTmRuJ/jL
         /FtpHC2Yl+xNNJphvWmtPf6LskkGNUsUZ4Olt5yGBfxSoAV45M091Nv2xGbOyjtwiNKW
         5c6A==
X-Forwarded-Encrypted: i=1; AKwUvBznjIjBg2ODzt0UgdeAOZYFglUs6zT8g0CYw3rU2W3KXZU0mrOg30heECo9bv3C0CQgc7O6Dc1XIx4ogDo=@vger.kernel.org
X-Gm-Message-State: AFuF++n1pt7Q2U4rlLjqOenOB+p/0EPNJP5Jk7lTMV3lI92FxUDsYJbB
	3UbYBXSoL+4adOgJ0FFAGbkYhn6asULs974lTUO68yfHLCQaZQN0aB8SIZsTWTmYxuaY/jB5ec9
	FTupnrxfNMk1ia5aFFOW3qJYDL/yupJUPl3hnjhffIDdWKtu+FkwjaI+Q5xpS22tBKpU=
X-Gm-Gg: AYBFou3HA/ojUrTrJXRWRFGHDrdCDQ7bxC5lcCn89a4R0cVNfSmms6P+rMpgZO62lCR
	ux3Bwu56ubresDxQG+PH1ysjrsx5dDKhwDAvM9Gzjz74OoRtiwffbKgjbJNzUj9c71tq3mt3rai
	0LdHdRk6MCMw/aLvVnjiUPbceHyM5lmSwZIc2LSIdjeOn78kPFynoWlZ/ZvdfmU9c9QmuQWFP4m
	AGZ7YTHvxVtrIic9rM0HpWiWztALjQyFEjrxMavf8HsubobMiFHjPstaurRW/5UmuZzXvSFvkzr
	eZle4QwgmkYGxKd+MXcYksufrpIQEQXL72yUt8ya2V4DvX6ra6RsdLkV92b50tboWHmysJvySTD
	igblg+IfqYck6yHeT5zcDtjbBJLJIGgQuI8W+RsH0H2xh0dw=
X-Received: by 2002:a05:6808:198c:b0:4b5:8402:958e with SMTP id 5614622812f47-4bab0d6775fmr23425619b6e.6.1789050946672;
        Thu, 10 Sep 2026 07:35:46 -0700 (PDT)
X-Received: by 2002:a05:6808:198c:b0:4b5:8402:958e with SMTP id 5614622812f47-4bab0d6775fmr23425595b6e.6.1789050946220;
        Thu, 10 Sep 2026 07:35:46 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971246d9csm19056119b6e.7.2026.09.10.07.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:35:45 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 07:35:36 -0700
Subject: [PATCH v4 2/4] Bluetooth: Add generic support for vendor packets
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-btusb_qcc2072-v4-2-e78f04b7675e@oss.qualcomm.com>
References: <20260910-btusb_qcc2072-v4-0-e78f04b7675e@oss.qualcomm.com>
In-Reply-To: <20260910-btusb_qcc2072-v4-0-e78f04b7675e@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE3NiBTYWx0ZWRfX0pmYKmUPto/Z
 VRZ7fZ+HgqxsrKES0+jYfhIMInxx2UacSEW1PM3ah8H1vjwHNiQVIcwDJwx+aS79VvBXN8RcAe9
 RoSTk7joJFL2tn4DEhjyBjkADf22Rao=
X-Proofpoint-ORIG-GUID: Ub9HoW6IErOBN1itinfk9lS9_muk3clm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE3NiBTYWx0ZWRfXz2W54eCI9c/U
 YFH8SAxhvNe1DGiA2TLnSufmUtAqq64CE+2Qp54RWer2Wc1oCCZ0/qZcXH2lekV9Yd8iBeIoA+t
 LshSjrOLAjIcN/7sIphLng4aXq8RF8ih33lHQA02UKkWBHpUKvaG30+q6fQUbh9cFHtrOPl7ldM
 fMmBJKY5JuVqmWra+mM2f6xrI98W297UN8sdIvMekYp4n55mHlRcfoLf++xUOd0pQMm/w3citlR
 AE1PfyPBevZCGmKxikPoVmdanw62YHLbcJDGOCMymqaXv4s4g1vlopyjFk1We/0bZSRylApgH+q
 g08nwELpYZVu7pMkRBtmfT5apl3ZLs4djW+BspLncefRlWEUkAN5N1AdoIF2lvXgALGDcBes1vX
 nmcZT1FNsfK0Q8/GA7G570smfw1dJcCHSdO9WFkAs7nC1BqExcCP4Z4uEWQZbG0aeqvJ67LZYhf
 VQFZhBRqdHYQUB9vaTw==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa2c043 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rupOQ6kNMCESZWuvRX8A:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: Ub9HoW6IErOBN1itinfk9lS9_muk3clm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100176

The virtual HCI_VENDOR_PKT (0xff) has been defined but never used by
the BT core. Now, there is a requirement to implement it, as follows:

For Qualcomm multi-subsystem BT chips, the transport wire carries both
BT-HCI and PERI-HCI packets, where PERI is a subsystem in the chip, take
the upcoming QCC2072 as an example:

    Packet type                 BT-HCI indicator   PERI-HCI indicator
    -----------------------------------------------------------------
    CMD (Host -> Controller)    0x01               0x31
    ACL Data (bidirectional)    0x02               0x32
    EVENT (Controller -> Host)  0x04               0x34

There are also BT ACL packets with vendor-reserved handles found in
existing device drivers, as shown below:

+--------+--------+---------------------------+
| Vendor | Handle | Purpose                   |
+--------+--------+---------------------------+
| QCOM   | 0xEDD  | Firmware coredump         |
|        | 0xEDC  | Firmware enhanced logging |
+--------+--------+---------------------------+
| MTK    | 0xFC6F | Firmware coredump         |
|        | 0x05FF | Firmware debug logging 1  |
|        | 0x05FE | Firmware debug logging 2  |
+--------+--------+---------------------------+
| NXP    | 0xFFF  | Firmware coredump         |
+--------+--------+---------------------------+

Implement HCI_VENDOR_PKT to generically support such vendor packets,
which don't follow BT SIG's vendor-extension framework:

- Log them in btmon as they appear on the wire.
- Add hdev->recv_vendor_pkt() to handle them in hci_rx_work().
- Add hci_send_vendor_frame() to send them to the device driver.
- Allow them to flow over HCI_CHANNEL_USER, nested inside HCI_VENDOR_PKT.

Also solve the same issues that the commit below fixes for
HCI_EV_VENDOR, which follows BT SIG's vendor-extension framework:

commit 0bd606b31d40 ("Bluetooth: hci_event: Introduce
handle_ev_vendor() for HCI_EV_VENDOR")

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 include/net/bluetooth/hci_core.h |  5 +++++
 include/net/bluetooth/hci_mon.h  |  2 ++
 net/bluetooth/hci_core.c         | 45 ++++++++++++++++++++++++++++++++++++++++
 net/bluetooth/hci_sock.c         |  8 +++++++
 4 files changed, 60 insertions(+)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index c12cd6873f65..b26004a05368 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -23,16 +23,17 @@
 #ifndef __HCI_CORE_H
 #define __HCI_CORE_H
 
 #include <linux/idr.h>
 #include <linux/leds.h>
 #include <linux/rculist.h>
 #include <linux/spinlock.h>
 #include <linux/srcu.h>
+#include <linux/uio.h>
 
 #include <net/bluetooth/hci.h>
 #include <net/bluetooth/hci_drv.h>
 #include <net/bluetooth/hci_sync.h>
 #include <net/bluetooth/hci_sock.h>
 #include <net/bluetooth/coredump.h>
 
 /* HCI priority */
@@ -641,16 +642,18 @@ struct hci_dev {
 #endif
 
 	int (*open)(struct hci_dev *hdev);
 	int (*close)(struct hci_dev *hdev);
 	int (*flush)(struct hci_dev *hdev);
 	int (*setup)(struct hci_dev *hdev);
 	int (*shutdown)(struct hci_dev *hdev);
 	int (*send)(struct hci_dev *hdev, struct sk_buff *skb);
+	/* Receive HCI_VENDOR_PKT */
+	void (*recv_vendor_pkt)(struct hci_dev *hdev, struct sk_buff *skb);
 	/* Handle HCI_EV_VENDOR; return true if handled, false otherwise */
 	bool (*handle_ev_vendor)(struct hci_dev *hdev, struct sk_buff *skb);
 	void (*notify)(struct hci_dev *hdev, unsigned int evt);
 	void (*hw_error)(struct hci_dev *hdev, u8 code);
 	int (*post_init)(struct hci_dev *hdev);
 	int (*set_diag)(struct hci_dev *hdev, bool enable);
 	int (*set_bdaddr)(struct hci_dev *hdev, const bdaddr_t *bdaddr);
 	void (*reset)(struct hci_dev *hdev);
@@ -2395,16 +2398,18 @@ static inline int hci_check_conn_params(u16 min, u16 max, u16 latency,
 	}
 
 	return 0;
 }
 
 int hci_register_cb(struct hci_cb *hcb);
 int hci_unregister_cb(struct hci_cb *hcb);
 
+int hci_send_vendor_frame(struct hci_dev *hdev, struct iov_iter *iter);
+
 int __hci_cmd_send(struct hci_dev *hdev, u16 opcode, u32 plen,
 		   const void *param);
 
 int hci_send_cmd(struct hci_dev *hdev, __u16 opcode, __u32 plen,
 		 const void *param);
 void hci_send_acl(struct hci_chan *chan, struct sk_buff *skb, __u16 flags);
 void hci_send_sco(struct hci_conn *conn, struct sk_buff *skb);
 void hci_send_iso(struct hci_conn *conn, struct sk_buff *skb);
diff --git a/include/net/bluetooth/hci_mon.h b/include/net/bluetooth/hci_mon.h
index 4b2a0af4ed58..7710688c0d30 100644
--- a/include/net/bluetooth/hci_mon.h
+++ b/include/net/bluetooth/hci_mon.h
@@ -45,16 +45,18 @@ struct hci_mon_hdr {
 #define HCI_MON_CTRL_OPEN	14
 #define HCI_MON_CTRL_CLOSE	15
 #define HCI_MON_CTRL_COMMAND	16
 #define HCI_MON_CTRL_EVENT	17
 #define HCI_MON_ISO_TX_PKT	18
 #define HCI_MON_ISO_RX_PKT	19
 #define HCI_MON_DRV_TX_PKT	20
 #define HCI_MON_DRV_RX_PKT	21
+#define HCI_MON_VENDOR_TX_PKT	22
+#define HCI_MON_VENDOR_RX_PKT	23
 
 struct hci_mon_new_index {
 	__u8		type;
 	__u8		bus;
 	bdaddr_t	bdaddr;
 	char		name[8] __nonstring;
 } __packed;
 #define HCI_MON_NEW_INDEX_SIZE 16
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 46453bc4ca25..c71c1e7e1f37 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -2912,16 +2912,18 @@ int hci_recv_frame(struct hci_dev *hdev, struct sk_buff *skb)
 			    type == PA_LINK)
 				hci_skb_pkt_type(skb) = HCI_ISODATA_PKT;
 		}
 		break;
 	case HCI_SCODATA_PKT:
 		break;
 	case HCI_ISODATA_PKT:
 		break;
+	case HCI_VENDOR_PKT:
+		break;
 	case HCI_DRV_PKT:
 		break;
 	default:
 		kfree_skb(skb);
 		return -EINVAL;
 	}
 
 	/* Incoming skb */
@@ -3048,16 +3050,51 @@ static int hci_send_frame(struct hci_dev *hdev, struct sk_buff *skb)
 
 static int hci_send_conn_frame(struct hci_dev *hdev, struct hci_conn *conn,
 			       struct sk_buff *skb)
 {
 	hci_conn_tx_queue(conn, skb);
 	return hci_send_frame(hdev, skb);
 }
 
+/**
+ * hci_send_vendor_frame - Send an HCI_VENDOR_PKT frame to the HCI driver
+ * @hdev: The HCI device
+ * @iter: iov_iter carrying the frame
+ *
+ * Return: 0 on success, or a negative errno on failure.
+ */
+int hci_send_vendor_frame(struct hci_dev *hdev, struct iov_iter *iter)
+{
+	struct sk_buff *skb;
+	unsigned int len;
+
+	if (WARN_ON(!iov_iter_is_kvec(iter)))
+		return -EINVAL;
+
+	/* Vendor frames are opaque, the caller guarantees the size. */
+	len = (unsigned int)iov_iter_count(iter);
+	if (!len)
+		return -EINVAL;
+
+	skb = bt_skb_alloc(len, GFP_KERNEL);
+	if (!skb)
+		return -ENOMEM;
+
+	if (!copy_from_iter_full(skb_put(skb, len), len, iter)) {
+		kfree_skb(skb);
+		return -EFAULT;
+	}
+
+	hci_skb_pkt_type(skb) = HCI_VENDOR_PKT;
+
+	return hci_send_frame(hdev, skb);
+}
+EXPORT_SYMBOL(hci_send_vendor_frame);
+
 /* Send HCI command */
 int hci_send_cmd(struct hci_dev *hdev, __u16 opcode, __u32 plen,
 		 const void *param)
 {
 	struct sk_buff *skb;
 
 	BT_DBG("%s opcode 0x%4.4x plen %d", hdev->name, opcode, plen);
 
@@ -4063,16 +4100,24 @@ static void hci_rx_work(struct work_struct *work)
 			hci_scodata_packet(hdev, skb);
 			break;
 
 		case HCI_ISODATA_PKT:
 			BT_DBG("%s ISO data packet", hdev->name);
 			hci_isodata_packet(hdev, skb);
 			break;
 
+		case HCI_VENDOR_PKT:
+			BT_DBG("%s Vendor packet", hdev->name);
+			if (hdev->recv_vendor_pkt)
+				hdev->recv_vendor_pkt(hdev, skb);
+			else
+				kfree_skb(skb);
+			break;
+
 		default:
 			kfree_skb(skb);
 			break;
 		}
 	}
 }
 
 static int hci_send_cmd_sync(struct hci_dev *hdev, struct sk_buff *skb)
diff --git a/net/bluetooth/hci_sock.c b/net/bluetooth/hci_sock.c
index 070ca388f9ac..406b70ecaf33 100644
--- a/net/bluetooth/hci_sock.c
+++ b/net/bluetooth/hci_sock.c
@@ -228,16 +228,17 @@ void hci_send_to_sock(struct hci_dev *hdev, struct sk_buff *skb)
 				continue;
 		} else if (hci_pi(sk)->channel == HCI_CHANNEL_USER) {
 			if (!bt_cb(skb)->incoming)
 				continue;
 			if (hci_skb_pkt_type(skb) != HCI_EVENT_PKT &&
 			    hci_skb_pkt_type(skb) != HCI_ACLDATA_PKT &&
 			    hci_skb_pkt_type(skb) != HCI_SCODATA_PKT &&
 			    hci_skb_pkt_type(skb) != HCI_ISODATA_PKT &&
+			    hci_skb_pkt_type(skb) != HCI_VENDOR_PKT &&
 			    hci_skb_pkt_type(skb) != HCI_DRV_PKT)
 				continue;
 		} else {
 			/* Don't send frame to other channel types */
 			continue;
 		}
 
 		if (!skb_copy) {
@@ -385,16 +386,22 @@ void hci_send_to_monitor(struct hci_dev *hdev, struct sk_buff *skb)
 			opcode = cpu_to_le16(HCI_MON_SCO_TX_PKT);
 		break;
 	case HCI_ISODATA_PKT:
 		if (bt_cb(skb)->incoming)
 			opcode = cpu_to_le16(HCI_MON_ISO_RX_PKT);
 		else
 			opcode = cpu_to_le16(HCI_MON_ISO_TX_PKT);
 		break;
+	case HCI_VENDOR_PKT:
+		if (bt_cb(skb)->incoming)
+			opcode = cpu_to_le16(HCI_MON_VENDOR_RX_PKT);
+		else
+			opcode = cpu_to_le16(HCI_MON_VENDOR_TX_PKT);
+		break;
 	case HCI_DRV_PKT:
 		if (bt_cb(skb)->incoming)
 			opcode = cpu_to_le16(HCI_MON_DRV_RX_PKT);
 		else
 			opcode = cpu_to_le16(HCI_MON_DRV_TX_PKT);
 		break;
 	case HCI_DIAG_PKT:
 		opcode = cpu_to_le16(HCI_MON_VENDOR_DIAG);
@@ -1863,16 +1870,17 @@ static int hci_sock_sendmsg(struct socket *sock, struct msghdr *msg,
 		 * since that gets enforced when binding the socket.
 		 *
 		 * However check that the packet type is valid.
 		 */
 		if (hci_skb_pkt_type(skb) != HCI_COMMAND_PKT &&
 		    hci_skb_pkt_type(skb) != HCI_ACLDATA_PKT &&
 		    hci_skb_pkt_type(skb) != HCI_SCODATA_PKT &&
 		    hci_skb_pkt_type(skb) != HCI_ISODATA_PKT &&
+		    hci_skb_pkt_type(skb) != HCI_VENDOR_PKT &&
 		    hci_skb_pkt_type(skb) != HCI_DRV_PKT) {
 			err = -EINVAL;
 			goto drop;
 		}
 
 		skb_queue_tail(&hdev->raw_q, skb);
 		queue_work(hdev->workqueue, &hdev->tx_work);
 	} else if (hci_skb_pkt_type(skb) == HCI_COMMAND_PKT) {

-- 
2.34.1

