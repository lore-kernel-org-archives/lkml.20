Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626A92E5429
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354063; cv=none; b=hXkFBeBZg80mwTDzeIbF6b4ejAea55nGNbhSHELXziwKW6wIFeXteXiE/blTb0u8USlG1sTxkqksbMBeuDlCcluh5e4RUtJpNm190xQRPiZmlrfDlxlwtHuMyPLcDILlIK8vq3tQ4UdS32VRIrUn9g1+FsjYLjYGS4wYyS6crlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354063; c=relaxed/simple;
	bh=FeX+5SSAOfbaQ58usKljVzvtDRwIa0YCMI07fyqDuvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fq5rbzT7M7U00V7x9lgEqwuR804nJS7wKQNG8b57zhUOziekQR1MimLM00eyGgyr4zl2lhRmHJKwTuknKAVJGb545Ky2pCJqz5O1r7UwWSVnr/1UKiBh+/7RofmXSMTNLyQWwXJmVPDkO7JGUCW+feU0dG3OfQrR9WwdqRR1Iic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dyrhaJJQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SrrZl/HJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyrhaJJQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SrrZl/HJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2eZi2404295
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I39ywH5jWkYs6V2okSMHwL6YcA82wKWv6kdA/H5Q9QQ=; b=dyrhaJJQZ99mTDYw
	XX4Xa0Sj6NKrCWxo4kKNIUAbC1IxTF2HcDTXFPahImeFuZtubpVrxtC1c4ZqBgGv
	IVNkeTPowg4qYxC6NYqp7Pbva3LY7rFmXZGLU6tb46dOH4mCByz5WYaaGzRfwfmm
	sKPxaeEO/xCt673+0FrshYOb1dqJow1TCS1qRn5M1UjwUZpmFtfzZ9eyBzCwb1ja
	yH186sUSmizR3MrGZd7nNFHNQIolb7iNTRIcrwzlb/O4PDsCt5rJcAr2XUBi6ZhK
	IL5CDRc/Ha4TSKBVEpOODqPlMLsDLskq9vkMQ06jE8BCM1BD4AJAsc7zb2QG9ALt
	yb0gSQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cmqx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:47:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4bede5bf2so147549a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789354060; x=1789958860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I39ywH5jWkYs6V2okSMHwL6YcA82wKWv6kdA/H5Q9QQ=;
        b=SrrZl/HJ1naUDbRoYM5+YYs1crID8CHNSx2nxHNQSbpDTkfClM8swmklQa85gE3YxN
         T+Y1d5d0IXE0CGxB3SU/0Clsq6eUWau+px7XM+D7Et1BVq3KK7s5w9ZWMxkMXUCgY4my
         qKnFU2kQHwk7d3EtnDU9B1lEqNTgQp11l9BSLDz6R8MfB4vLaOiGZNsbHHlLTVIKnqA/
         UUajmWxbtkzHmkVfxcZD9qscioeQgiHUXagjbWUffRegY08NfY9nWI8SOv17o2DljrA+
         BK+3SI/4pG74rOLYECdLmHyXAKELehndIAd/XSUB21hQGq/niGq1k/Gfa71U+5/xle5r
         T2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354060; x=1789958860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I39ywH5jWkYs6V2okSMHwL6YcA82wKWv6kdA/H5Q9QQ=;
        b=HK8Z+zJ1CKHq1Yyu0PS22HbzSmzmzkpMuX2gCjCLJAh876OLCnukYpZLfdl7tlsoRX
         rP0a52wujFhlN7au7wruI3L+gkYWL256M814bqRf9V4WOlBPFEzCe/zdhFChbDUWh6X/
         fmT+2IRrnn5vbI/gGSP9xp8vpCHD1agZBIi+JycTPzntp9vaXW9Zi5/faEpYzeDBFBLE
         nOMHhVix8UzyVKKGmFgE0+a7WkvCeCL3FazNDxp2FLjD8bsVB7fZOCW033nhrA+natRs
         JNM6M+MV6CwahF82EhiCBE5ocDUdbLtIEvQfB/6ACxU0Az8/SDJAD8cG6HTUMSVd9RVl
         JMTw==
X-Forwarded-Encrypted: i=1; AKwUvBxt4zquF1uvKPCRBuvvhkZC7dHHkgyrw1SSHwuI7FZf/9g+dwxHWuh6KnQgJcbr6fQniTdCpkdOZI+9lKI=@vger.kernel.org
X-Gm-Message-State: AFuF++k10iiJp5+bvm0cXXz8ERYmU7kWiRKS9TuIbgol3B6VA/gl3Z5H
	9Xyg130S9GnZcx99sDr5U2eAlJYC/KIhuMU+rY59Fn5VBaqr8p1grvvNKlyGcRcfdM7u5eaCeTe
	jtJHa7Du+DFn7GOYGEJ+LQ46yRj738lG0kbuTh9O4gKwLjBa1LkQcOfyVQllNB0C6ek8=
X-Gm-Gg: AYBFou3qTx0APRJwjzA+nFu6QaYUhlqJDg2acxL4h8vaaCPYttn8zAzTddu4/yznt1b
	E2xBwHZMFbPMRoIlXNTmGhRRn9CMD2Cd0BAxwEIURQGJEH/70dJN67dEBa/oHEgduqfJTZm1CGU
	RAAauHyD2Y2vk9SNGpFgXXVUAd0+uW8KBLRPaozTZQ8z7HrvlWj/FdMMOC7MQ8gSpuZrAfF/I/u
	ZEysSCo9yjBs2xzrFFKrlbL+coaQdYjWjJlmv3tBBgaZ6KCbxQxxn7PiZsqRnZAOlOr5uP81NEE
	bwR6VizAAPM0me3+VaOmmoOjgLJIieI5V86w38O78cZxZ+hq3JOMGBIvXKqY2r8hCN2QMs0bM95
	Kp2enwDrLjT1lCv555bOH6gb7aBaLfXZVV3Q6D7DBSvaKTks=
X-Received: by 2002:a17:90b:2688:b0:39d:e1cf:db40 with SMTP id 98e67ed59e1d1-39dec15a5damr950720a91.5.1789354059903;
        Sun, 13 Sep 2026 19:47:39 -0700 (PDT)
X-Received: by 2002:a17:90b:2688:b0:39d:e1cf:db40 with SMTP id 98e67ed59e1d1-39dec15a5damr950695a91.5.1789354059455;
        Sun, 13 Sep 2026 19:47:39 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed295esm25945014eec.15.2026.09.13.19.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 19:47:38 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 19:46:43 -0700
Subject: [PATCH v6 1/4] Bluetooth: btusb: Add recv_intr() hook to
 btusb_data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-btusb_qcc2072-v6-1-137898715844@oss.qualcomm.com>
References: <20260913-btusb_qcc2072-v6-0-137898715844@oss.qualcomm.com>
In-Reply-To: <20260913-btusb_qcc2072-v6-0-137898715844@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Pauli Virtanen <pav@iki.fi>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfX9a/5KGYlcadG
 lR0d+0ncDITyCCKO5pfbEKyfN9NONsbFvqQwg+vufEUGYDM85Go9e0JHy5hzkkNUEQiT5rXePFs
 KwC1A9gHcH75NGszj+EnhcumsRTCqO9OKDucqDbnddLV2vvYigUXR4WcWOPR4CHMQ3JcsCFUhBH
 MJ3g2+0lKlIYIHsw7EbB3GtGBhcA3G4bMJSdcnBN2do+Uw/L5BVht/eefhYe77xZTdybrfVnFzx
 Q0d1LBgOVmR0RbRJOx1FJVf09ej9A7YQSbcnD89hCtTLqIMjTwm1H/MPbHNT5BJoh/fqbTumCnL
 7ePBipiO8P8hYau+ADu88X0S4uxhxX9vipwS6ibLy3NnxcuCbV7dJGCDWwFyEfMECLIiJUYbtm/
 +0gVbed9Qro5x+3cmbPDYFFuZ4GcKKdNTxQDVQRT7Gb+oMWjn+G4smagBJXLptt/kTcLIc+reAr
 vOAahW8/IRT7o06uytA==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa7604c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=I7BhAMs4-vxSTl9LnVYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfX0kfk79K0FRo4
 SHsOBBsf9KKDgXHkjVoyW2IkiPsQYE545SiViJ8Yyb1sKxOi4HmaUUGzKNOT/FGWK+8xetGJ95M
 QNSEghlNt0szXGGNAPo+sewm5L2lQ8M=
X-Proofpoint-GUID: uKpA7GkYhVmpO4UXA_1ygXn0F1G_Fwbi
X-Proofpoint-ORIG-GUID: uKpA7GkYhVmpO4UXA_1ygXn0F1G_Fwbi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140035

To allow a vendor driver to assemble and handle its non-BT frames
from the interrupt endpoint.

Used by Qualcomm QCC2072 support.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 83d122de5d7d..5efcf31e432b 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -1067,16 +1067,17 @@ struct btusb_data {
 	unsigned int air_mode;
 	bool usb_alt6_packet_flow;
 	int isoc_altsetting;
 	int suspend_count;
 	const struct usb_device_id *match_id;
 
 	int (*recv_event)(struct hci_dev *hdev, struct sk_buff *skb);
 	int (*recv_acl)(struct hci_dev *hdev, struct sk_buff *skb);
+	int (*recv_intr)(struct btusb_data *data, void *buffer, int count);
 	int (*recv_bulk)(struct btusb_data *data, void *buffer, int count);
 
 	int (*setup_on_usb)(struct hci_dev *hdev);
 
 	int (*suspend)(struct hci_dev *hdev);
 	int (*resume)(struct hci_dev *hdev);
 	int (*disconnect)(struct hci_dev *hdev);
 
@@ -1577,17 +1578,17 @@ static void btusb_intr_complete(struct urb *urb)
 	       urb->actual_length);
 
 	if (!test_bit(HCI_RUNNING, &hdev->flags))
 		return;
 
 	if (urb->status == 0) {
 		hdev->stat.byte_rx += urb->actual_length;
 
-		if (btusb_recv_intr(data, urb->transfer_buffer,
+		if (data->recv_intr(data, urb->transfer_buffer,
 				    urb->actual_length) < 0) {
 			bt_dev_err(hdev, "corrupted event packet");
 			hdev->stat.err_rx++;
 		}
 	} else if (urb->status == -ENOENT) {
 		/* Avoid suspend failed when usb_kill_urb */
 		return;
 	}
@@ -2846,17 +2847,17 @@ static int btusb_recv_bulk_intel(struct btusb_data *data, void *buffer,
 	 * same way as the ones received from the interrupt endpoint.
 	 *
 	 * In H:4 mode there is no interrupt endpoint and every frame on the
 	 * bulk endpoint carries an H:4 header, including the ones sent by the
 	 * bootloader, so the regular decoding applies.
 	 */
 	if (data->proto == BTUSB_PROTO_LEGACY &&
 	    btintel_test_flag(hdev, INTEL_BOOTLOADER))
-		return btusb_recv_intr(data, buffer, count);
+		return data->recv_intr(data, buffer, count);
 
 	return btusb_recv_bulk(data, buffer, count);
 }
 
 static int btusb_send_frame_intel(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	struct urb *urb;
 
@@ -4387,16 +4388,17 @@ static int btusb_probe(struct usb_interface *intf,
 	init_usb_anchor(&data->intr_anchor);
 	init_usb_anchor(&data->bulk_anchor);
 	init_usb_anchor(&data->isoc_anchor);
 	init_usb_anchor(&data->diag_anchor);
 	init_usb_anchor(&data->ctrl_anchor);
 	spin_lock_init(&data->rxlock);
 
 	data->recv_event = hci_recv_frame;
+	data->recv_intr = btusb_recv_intr;
 	data->recv_bulk = btusb_recv_bulk;
 
 	if (id->driver_info & BTUSB_INTEL_COMBINED) {
 		/* Allocate extra space for Intel device */
 		priv_size += sizeof(struct btintel_data);
 
 		/* Override the rx handlers */
 		data->recv_event = btintel_recv_event;

-- 
2.34.1

