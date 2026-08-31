Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3418635B650
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152651; cv=none; b=sQDFgJIjfHuD8p+kiicC27lAYPk2o+bOZPUSvSisDEV6bleyeurOXu6445P8KWRKQBhufxagqDv9DitTKKLsHmNFAESnEs51QreBgI2Kr/0Ocyc767Hok64pYpAgnqIMH80I8foy8jnE/si+DPJnug9WygCV3rO+cV330trEyGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152651; c=relaxed/simple;
	bh=hk5q5yfj+3CPDigdHZN7M00PoR/wM3UngY2XD3eFsMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ac3in6Ww2AtkioLTBQtIn+1GPPrCbewPD18gwVIzo6/F6JtpbNvaN1ZpXI98Ayk1fbH6sIGaHYBexpALSGcz4XwGMFPeR/rd+9v95cz2zYvhSOKRd+J0e2Ba3QLKJjz+rAxXseIEBgkYUQ3EpzLT2CFK4q0LGJDNHxuK1FSCHIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJ80pIuf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YNkBKudD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJ80pIuf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YNkBKudD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52VuA2680030
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EevgHx2iszFuWOerb/OAKLPO/Caest+ArOwuaL8Y/vI=; b=mJ80pIuf3EneOkN9
	0XSPWzxQ8ffC3mgzXLufVkdLo35MenwgSPX/md97jc/pKOCVYTnH/ClCZaUHKdKZ
	yCVlAaGXROmiYIIqlnBieUcRzV+Uw5zYnxW3e/wpnr0MhRgWluEl44oFb2AmXKrK
	DNo3fkO7w8tXXm0pyj3x+iYsQnLNDVXaKTcQ0MU/46iutYWz1wlYYnR55ejylJRA
	Q+1kLRpYOHEwuaJTtq1UbQbKcnGX4Pt1GxmEcw3lNpnNnKDi//w1xKvsO04jIbaO
	YcjGT/V5XlSMLzHjKJS0oQhHheKezR3Orx89Mq/4aELtT6IoaZNy6rzABe8Ot+qa
	rsxfkQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhwcn95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:04:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84f19ee5162so799503b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788152648; x=1788757448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EevgHx2iszFuWOerb/OAKLPO/Caest+ArOwuaL8Y/vI=;
        b=YNkBKudDQFUdCVb2O9G+HBhlkH7jzEoJ/mJAZiBRApLE86uyl9hrrpUhsVbE0ouQPc
         70ZOPPuNMrQ2P5Rxt1dj6YbXvlwDc7hPsQcH37VhEyq+EmT4LuMT8bXvA9aSK8PLwWl4
         RiJucfPyipodpIsct38QBfW+GgjmVnBkwhEbJPljdOGfSuhjpXAO8Pyl2zcQ5hSK/dqM
         63BAk8avEEDDFFY7u2bbI5JFYe5koWf01o3eW3H03x1TpuLrMNsAHenNt57oCnpak5TU
         zWvpaqRyRabrbwWoUi0BXDiE4jltlodzi9ImAZpjsAq92STsnUi498vI2kOX8TJsE5Dm
         2DNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788152648; x=1788757448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EevgHx2iszFuWOerb/OAKLPO/Caest+ArOwuaL8Y/vI=;
        b=B3eZcHHQ0OwcD6Ww5NOE9yypGa/+6fkuS7LVLgd7i8ddOybk3PVIulvn5tDawm24YY
         Ga2voqq/F+nDNNMxJCQGHtzShQTjtbwT//zIOpWxfa4y6xESNs7FeMSNx9I1DIJ1kF4j
         9hFPtT6Wsol18gwWF1Hn10c5Q6y7hy3dolyx/y2oqqXzXt1cUXzmysBfrcOtgIupNzfk
         o0z8Ni+TIv2bHn5qvQA6a16OwIIKdLI3VQlYAZzvyFfDJqzpY2gXfuDM1dkwBZz9vbvc
         WDeRo62dOhgGBSXzUWgYjLBvQwOzHbQejwPm4ud/LrMooZIXBBJkqbEi6363FYVDNL0I
         W9ag==
X-Forwarded-Encrypted: i=1; AKwUvBwJI1CzAaBOrT0yR6Nt3cTUe5LVpR9PNqdxmZtf0CJn88g8K/bVYA2OU9/Rt1kos7QiPp/Fu0iL6HXJd4o=@vger.kernel.org
X-Gm-Message-State: AFuF++nuxSwEpv+5gbC6SQJbW9sBISLILdStU4HXbmLhpowiuu7LYZxd
	yrjw5lkB9E22O8hqcTq+/brEmiG/IirzTdbn5kv1NJUalt4VWcyWMaGvx3vqsEobXqCcP8f1NZS
	RJbHz7RY+fyJdmWOeFBvYLy6+yEeNNgxphSNB4Heos5SKN9ST0cnvgpqzj0A2UuvG1y4=
X-Gm-Gg: AYBFou1VdmNq8AtXS4GJW9gbqmn3jmTXmMDk/LmShXS7Mbq+6TJDIbtv+DDTFRGGafF
	1rVnTYy5Y+b2WRee9/GxuUj9PW2C0ldjZ6E4MERkheQSP7raLXR6+Z4s0ns9BlVdqqEwTCJc4d6
	tLC96moMZdfBVwB/XwHSyK8fyxZlfKFZ22Zb0GPtquSJ600Stb6bOiHy5UOvdDQ/gXC8ulamdLi
	h+rx0UGVeWBLH/1Akh+bMquoQj6XyHa5182MR5zGS3r47Hnlmp38OnGYeGXV9UiFQe42C9nZeIA
	Ir65zVxoh/Or5CHVE6v5YbZhIkhZ8A/xX6mk+THIdejPYJPAHqilIV3MQv/MgkxLSd+dQX0qw4M
	SjuLG2azxfPoxfVpAynTdWHysy4ZbT5ixrzNgJta/6pn2F1w=
X-Received: by 2002:a17:90b:558e:b0:390:3936:8760 with SMTP id 98e67ed59e1d1-398ba71d770mr9616284a91.0.1788152647747;
        Sun, 30 Aug 2026 22:04:07 -0700 (PDT)
X-Received: by 2002:a17:90b:558e:b0:390:3936:8760 with SMTP id 98e67ed59e1d1-398ba71d770mr9616240a91.0.1788152647281;
        Sun, 30 Aug 2026 22:04:07 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0df264csm43017912c88.14.2026.08.30.22.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 22:04:06 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Sun, 30 Aug 2026 22:03:50 -0700
Subject: [PATCH v2 1/4] Bluetooth: btusb: Add recv_intr() hook to
 btusb_data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-btusb_qcc2072-v2-1-5c0e0c9dd98b@oss.qualcomm.com>
References: <20260830-btusb_qcc2072-v2-0-5c0e0c9dd98b@oss.qualcomm.com>
In-Reply-To: <20260830-btusb_qcc2072-v2-0-5c0e0c9dd98b@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 1M7YzM7nNnXhVauc5PsgBtA_Kqz9Sonu
X-Proofpoint-ORIG-GUID: 1M7YzM7nNnXhVauc5PsgBtA_Kqz9Sonu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA0MSBTYWx0ZWRfX+Z7wzxGJ+Pt5
 GodwnpF+fsgz4fZgF/MQKR3EVaJ5WrVm6cSswqRA3nAdzb5etdgtp/IlUW5wCScToDflxNhlrq+
 V9ic/A5fJYblXxEZpNYiwFddJT3oxiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA0MSBTYWx0ZWRfX6jxCD3lEwV/A
 RcRaQ2zkaxqo5q6cqrf01STFJIFaYiLVLZCjYLwRT+0U3CnWEZzd92i6FQkKRpqw8Nfp/mNPhWo
 PfOWJ75MYJ3bzxb5/aoCKTolFYNaaPDv//gMcRiF41wbFE5KlYMPz1YQF51Mvz9d38gyWFm75n/
 ugtVgi4L11E1akjUBxyvitn071qP/b/OtCZxT+lTrBmBBux3J4lCgvt4fJJp7vIrmSiGp/3xi3t
 UzdLV5dpTVHkIlL4MbJ5lxNMgRz38ex1FBZq7PzO4eaxEEJKIdYszYgJX4iHtcYItRJ689Rb9ql
 HaFUT11Q12HsQvluD05TPMO/PIzPu/uv5/LqqUZdbeWBDFBVlc8x0jWh6KDz4mI5zSsT5QSUUq2
 lIOdWktTQCoymbZaoj3+Z7ZqAMEzhkQU5cmS1ibKFAPo2VCJU2k7wmHdDm9B8EmNwTEgalumh6Y
 MLjrTTS90cWOM9bQMLQ==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a950b48 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z8uIRxzjlBKXrQItdqYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310041

To allow a vendor driver to assemble and handle its non-BT frames
from the interrupt endpoint.

Used by Qualcomm QCC2072 support.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
Previous version:
https://lore.kernel.org/all/20260713-btusb_prep_qcc2072-v2-3-bbcb651285f2@oss.qualcomm.com

Changes since previous version:
- Improve the commit title and message
---
 drivers/bluetooth/btusb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 84614e60d142..79dc6b15c5f5 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -1034,16 +1034,17 @@ struct btusb_data {
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
 
@@ -1508,17 +1509,17 @@ static void btusb_intr_complete(struct urb *urb)
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
@@ -2723,17 +2724,17 @@ static int btusb_recv_bulk_intel(struct btusb_data *data, void *buffer,
 {
 	struct hci_dev *hdev = data->hdev;
 
 	/* When the device is in bootloader mode, then it can send
 	 * events via the bulk endpoint. These events are treated the
 	 * same way as the ones received from the interrupt endpoint.
 	 */
 	if (btintel_test_flag(hdev, INTEL_BOOTLOADER))
-		return btusb_recv_intr(data, buffer, count);
+		return data->recv_intr(data, buffer, count);
 
 	return btusb_recv_bulk(data, buffer, count);
 }
 
 static int btusb_send_frame_intel(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	struct urb *urb;
 
@@ -4175,16 +4176,17 @@ static int btusb_probe(struct usb_interface *intf,
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

