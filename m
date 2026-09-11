Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4749037F312
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113617; cv=none; b=jRKr0hMO2CMx/TZYP9od/VhSz68HCfKIJ/ug2cyLQ2d9iChBkTmH0FE9VwkWsVLrQn+xOQZINF3e1ng/nop6Mc+Zw6QrvLtwepY3PiVetuBh2SCkOyIrHizhbBbu3582VPsdfCRgW4VRUqsIojlFI3mKMSh3rJYRn1CwdfK7VqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113617; c=relaxed/simple;
	bh=TH5vzca/DE4IuRYl8j+UF5OPl0hEyeQJ+vZNfQPGOzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N558BwrKwsI17P19cQiZh7pcnYj9TiFDkBw8cfyweHsF2uCFfuhdishgy4TJpIieOOc1UNJhDjiiK6ZTFtR9ZGBE7VvzFKtzorr8YgbFCC98gr9DWQUyUtRE2NOEFLrTpnSXhaRDZrvjc+CYiXMEqs+p5qjsdY0sqtxzvuIY+nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oWkv0nKT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B8h07lgW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oWkv0nKT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B8h07lgW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kk743016909
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wbT1Cc1NciLh6CzE4VxkkwHzDMNo9OI1Hd3+UmFrYNQ=; b=oWkv0nKTkLj/ssAI
	Ptml9jB9An7x+gcoWGVhqKTosW2rXuaVPhvQ/kgX4Pg9fMrbLUj6qJ4ADBcAnAr5
	LmWrepJebisl18xJNlQiGWqn+oZy57eIdlTc43pUtxwYm5EUACvkjItLKWOiP6gD
	Wuew2wRSBHg3jzkn//TNkr6lo1oqbcs1p2Xbw9mN1W9PfiCe19jB43HADhz9plHz
	h+cIMtXBnyGm4o6nISfXM6YW1DnPQ8ArrRoV3TrLNJfjB3R6VF7Hns38P+ncuHOG
	cbtMwvtvWqJvfNpoKp8Y64oh+uxxKBHQqTrTzVUKqRbfj+rh3LsQ1qjHiiHc9hHO
	VSK4Mg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwvx44kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:00:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-384d033f7f5so147338a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789113614; x=1789718414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wbT1Cc1NciLh6CzE4VxkkwHzDMNo9OI1Hd3+UmFrYNQ=;
        b=B8h07lgWPFPNPI9KOkQ1Z9B/J6/2oOVQZvQNF1zeLWx1RlYkjE5W/xM9WMvMp/RnRU
         4EaNBSO6lJrdR1aDq3v1a4V0D4XSn/CtpFrJOza4GoRlpS2GckRS9mNZDN1nVqvwavNs
         B24xK/Rcmm/IcspBHnO8CciOXxu6TPnZ+KxDFbDlh7eO+EBZ4Kw1N1ElgZuUFEpSsLvI
         uA0YFe3yGL35hADu2/GlnSBWhoiG4NkHjkq3soxzAfydi50Az2puvYbxlHVmZ8V0HJVV
         JJo5SpxAeyN19ta6r9l00eoemlcL7dNNWdaHGmjj3jVMbn4I9EVg015JD/jZQn+YEriF
         OAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789113614; x=1789718414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbT1Cc1NciLh6CzE4VxkkwHzDMNo9OI1Hd3+UmFrYNQ=;
        b=T6p4uJncapKezhZ2mPApNLZq6Modh3ZFuN/4ZjO+9dVqef1EPhZZoC1kCwoUEnRa3Y
         3AolOp8YwI8/sHYzv1BLAPVDvZAivVKuuA4MrsMrKhVMBdM42Yk8IBzHHkMpAvLtdkHV
         peuYVQW6gK+rmMc2DH3Vpn79FADbG1JW8f9keHk24JQHEMCtk4aQv1U3vFj3+q4FGP0/
         CEWEO4gepYd0ydxjosn0GslrsPWBRtanVvi9Su6IZtLgzJygg/92rXkwhP5+sOFCmoS/
         lardG91Idrb/OjECvIGnevGBaCp15iemKH9f9OUXAyPGrj7euFG7C7hoo2tmbJSBEZ0X
         2UNg==
X-Forwarded-Encrypted: i=1; AKwUvBy/P3QWWtU0UStcGxVjmfGIYCzGN6TgZW3bsE7xouuy2rrI4Jr98nzYGGS/AuHIrzvNv82+7ow0uP8PcEM=@vger.kernel.org
X-Gm-Message-State: AFuF++nF7qLP7U0Tqe/90mgfbLDTN8Tzln8Rj7kEzusHs8IEUATO86tJ
	ZPqTbQSSXNKvYSAf9yZR6e2Vg3PFI79MgUrBRAbP5Y3YwS2GIeeZBqKpHESy7mnxUfp1eUcDplp
	t82a6WkHPWM2hlemY3DBKsBu2TyLoCsd8X1EqQ/yoTH6VJkdVM+hrur4sOFonO1SCFEo=
X-Gm-Gg: AYBFou2vdbw3OyyKYQE/2MGo778zN6yaewySaPxawqxRfK2b9o/NYpgio3sCu56VA4r
	ybRKB1PPZLiW3UUnE9zYbsACxOyJhxrL1V70G4l34jZKzUah6xFo77+qdN5ZLR05CT1iLA20FJj
	uUOArbXTKjPbP3fynsd9fMLriN3DNV2M9dKtT6lI8ABIhjBXtUN5ECycXnHGz8FuOgecP2qvmpL
	mw9HsQmxCJQA0lMhKstiCID0rAMdM8DSfLMQHHVuk4t59N6zY8oLzSo2PYobmegCsTMEPWMBbrC
	wbQtNLXAUMxlo5N5o32NoC1kT+QNGMFjKmnMwNNsRVEMPumFtn89XIGCuVnKCYQ3zamyAnk25Qp
	XPLpAJ2A0iaXoSGH0VQxkRuQ9FuXbMVANcU0KHSRtOElEX4c=
X-Received: by 2002:a17:90b:4a8f:b0:39b:3505:c72f with SMTP id 98e67ed59e1d1-39d9c5cd597mr3017174a91.6.1789113613412;
        Fri, 11 Sep 2026 01:00:13 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8f:b0:39b:3505:c72f with SMTP id 98e67ed59e1d1-39d9c5cd597mr3017125a91.6.1789113612747;
        Fri, 11 Sep 2026 01:00:12 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf31c1sm4422328eec.1.2026.09.11.01.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:00:11 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 01:00:02 -0700
Subject: [PATCH v5 2/4] Bluetooth: Add generic support for vendor packets
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-btusb_qcc2072-v5-2-422754f4e938@oss.qualcomm.com>
References: <20260911-btusb_qcc2072-v5-0-422754f4e938@oss.qualcomm.com>
In-Reply-To: <20260911-btusb_qcc2072-v5-0-422754f4e938@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExMCBTYWx0ZWRfX+ggo+1kloQpK
 MAAbeh1J1DGRBFizzBYvUVjr+VbGY83lZ8GWfIMaAPsm3UiNIfYuxt4ayjzc8gl7eI3vwr/vA8u
 wysb5sIeuUx+m1p2ngNrzb6IH2FV+WEKnfCAMkG4SD9OuK3xAlaMYlkBWgVR8H6XjEQIyH9C6/T
 72dC2jqW1VmC+njJo6DEh10KqtMSJLAUEtftwsFc7SmmL1/X+UvPgqlk/Fd84/jmN91+yb2N8Hb
 fdvkJ3TKHfSYpjJiqUQHDQ12XKVvcXa7+1kdp4vVkSNQeW2Fz3BwpDhlu2Vw3BLag2ItWlH72Pk
 48bnl3KE3Lv6G9J23eEDgnfm+fTJwfxAaWObNlM3kr4knzuj0NPSU2q26IQpyGPnbRs/uoNJu/P
 t5Vbg2vogHoVkgADACQVDvqTWj4DfICF29boeIAXNmLlD+MtzGwDPC6sE5WsOlBOnGdK83x0oP0
 sLwz2vHv5IIaMESd3dg==
X-Proofpoint-ORIG-GUID: u_iqjdTp9vSVcHVjjzQEqRIX6rJfg6R8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExMCBTYWx0ZWRfXyZQp+vLeZiz/
 /48q1H9J0/xcHxt5uZjUJZNS5wZJgkpxguAPbUmLYq/VgmQipTwmS7LMQLzWRIy1qLBeAg/tKm5
 F1gRyu4o71I21exkuM9oI1y/MUvts00=
X-Authority-Analysis: v=2.4 cv=AdkkjHXG c=1 sm=1 tr=0 ts=6aa3b50e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rupOQ6kNMCESZWuvRX8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: u_iqjdTp9vSVcHVjjzQEqRIX6rJfg6R8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110110

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

