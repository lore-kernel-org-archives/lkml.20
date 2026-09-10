Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AED4499F1D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050950; cv=none; b=blo5aa5TO6wetHbT5zt+IebPhmM5m7mznqMRY7f2Oon5vB3WBNcS6vYhyC9E/XReYz9LY5CQv25EUm9ZuePneO1xUxQz+l39Gy8LOHWNRuay8RhFcC2i6JtMbrtgP8o76xSCsNMNWZ9foaHnWYIYXpJule0MzB7Jr5grA9sbKgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050950; c=relaxed/simple;
	bh=EiCMZi7d5KkdXuY7/xcVOQAc9PXEO0YMgOdZbG2Zr+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BczHc30gHdtqhMgXvYZO8rB9ieFtlGYLqWG5iW1BL9IUOf7fpDY3v8XLeGUOHKVMyMO4tE5NRpcIlENc5q1or9cfzsCUORu26xx3z1oYJnJqyTYNQRN56ybwMf7lpD8ePxrxpVrNpyBgq13FSWlAHeA3mqzVY6PYfmtEJmZul80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WL52885S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FqOkxOnP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WL52885S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FqOkxOnP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7iqF780825
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3yjqGFveYAg5N/c7ZDihywXXnO37kbnrZ4JILQgcx24=; b=WL52885Sh8BG/xPl
	yNc7Z1DNFwVTx73rTmxs8nPU5yvc+I2mAl7wDqNQLo8SGXk2Se4N60nQ2HXEI+oo
	WEAWQx2LTSd+boBPnKN2VA6gEadPrx/kS2MBmLBWdC3h11rgTCwA1O25o+7TZM+Z
	muBxOlOKivqKiR/K/gUs8GGvv6J8635J53KQpzKrneD/CE1/mve+PMJF5ht+3F29
	BtoXNGIU/ny/KU9+T/MZ4rv0+b7oWHYNn7ykw8lZyqMUhAgp2vNkzjBgZgiRFK/A
	Vma4Synn4AQJWUwYGE3z2UhvgVLBW9ds1p2oFyZriqN7GMsaO+N9Kk/woe4oQBsL
	hYowlw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrak9rw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:35:46 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b381f60c4bso253943b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789050945; x=1789655745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3yjqGFveYAg5N/c7ZDihywXXnO37kbnrZ4JILQgcx24=;
        b=FqOkxOnPItwv0E7K272w+OVNqDok4uEgM63F0uGxDbXV+buTQXFWCkAVKA2vgOrRfT
         GHfKIDaXIjb0j1KblZ7vGe8cawVLYnqsPo9WW3UuXMKOqCGVsm3u9TCE+wdyeriSMPkv
         vN8jQk43OTVOH6iXQ7O7EtDxhZ+h3FH9MSdEtM1wg9MZxTexE6ql5+kox0auK4RlEBwL
         2OpWAytTin0Q0QOMG8vWvQ33Bkfmr7FzSik8rgQBdFg61wZflCiYCmbQngqFmchi3dEV
         SIuLD5TyzgWlTiKWTTwGj3AnkiEdFyJdHsQ5QJ0mvxjBlSh40Z/gtZhasyOCzoPwQ/vL
         CaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050945; x=1789655745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3yjqGFveYAg5N/c7ZDihywXXnO37kbnrZ4JILQgcx24=;
        b=FQS/bBEtlpGgC6LldeunC5Uu/15X8YqzAbpyHBKCYmumQatHgg6mqpQxWHWrI4p9WE
         xM/76oZS19eDP/VIVLMwA4yXTyjTIJumml9KID4Fnlr+d+nBtQb6uEdycZ7ruSEXtDsY
         ic86Va8YPChwxTrcSEPg3hENjuOOKvPCEKzEPp0VnPMVNDadq3H3IvBhNnv5E+bkx1ym
         /wui0drISRMK1dbwnsMQx9e48huqH+owM1VM5GlbnZkuLg6h2KzOnkda5mMNQ1f6y0uz
         17bYJvqcbo5YtWH0R45wOEyOcpap79vSPNuHWRiFOopeq/b/UrNiU85RKvXnVrjf+tLg
         bGaA==
X-Forwarded-Encrypted: i=1; AKwUvBy0JlWI84O9l3a+Eix5cXhyePOm0GFyPPzCynSvsU83G9zZ2IdWaps+6ab6GkOjV+m1JRO9et+Njm+y2VU=@vger.kernel.org
X-Gm-Message-State: AFuF++ldmjKMlMTskfCLyvTtLfVrdmkCarUl4HZJ/z9hqx804idUkdlx
	Yinp83VMyT9bnLJdiiW7MVfb/gYOEOKMXEKPa1EZYVYK8QbpjjxWfout85fITJZp+y4R1oHldQr
	m7EODiJBmPApln56gYzOtI2DWa/g1eRMnCqOyqiCYqzzn+IMzCLfXQ9O2Fp3x3fAy9nY=
X-Gm-Gg: AYBFou2OtrPpeVgqln75dD1u5M9+mWEqj7BBhP5ms13KF8j7+r79ftO8+nAyJZmrTc7
	zbvATHAsmAOQOrtaumgPx706m6o8y9nJGlkwKxfRIE4sD03WAhnd5ji/TyibFj+ububWcBy4avr
	sI4GkcaXj8wkDnMk8HlC+7zfohUo/gadMBHRL9TSonFbp8xBea5D5jdV0WkOsVateo6HFsUNx8M
	rDbWR/FCb1WDKIDkt6IMergV7hCibSEPcVhkmMxWagllP2P6KRH0akkRTqp05QNkUEkohQGggPm
	eeBXo2ODiXnI8zkvcmOkvuege+CM/pEInJgKnISwDMNIU5e2jUpAgaJktY8PJ54QuBSKNZGWQf/
	O1nVtGccZW053KVHacCqVbs1AsT/DKom4l/uqxejFg+Tk3i0=
X-Received: by 2002:a05:6809:38e:20b0:4bd:c8be:1e0a with SMTP id 5614622812f47-4bdc8be2b22mr7374886b6e.1.1789050945560;
        Thu, 10 Sep 2026 07:35:45 -0700 (PDT)
X-Received: by 2002:a05:6809:38e:20b0:4bd:c8be:1e0a with SMTP id 5614622812f47-4bdc8be2b22mr7374874b6e.1.1789050945067;
        Thu, 10 Sep 2026 07:35:45 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971246d9csm19056119b6e.7.2026.09.10.07.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:35:44 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 07:35:35 -0700
Subject: [PATCH v4 1/4] Bluetooth: btusb: Add recv_intr() hook to
 btusb_data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-btusb_qcc2072-v4-1-e78f04b7675e@oss.qualcomm.com>
References: <20260910-btusb_qcc2072-v4-0-e78f04b7675e@oss.qualcomm.com>
In-Reply-To: <20260910-btusb_qcc2072-v4-0-e78f04b7675e@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE3NiBTYWx0ZWRfX4+wPc6TH4ZOi
 rCbwymxg+hMKNo4a/iZy6Ord2ybtvh/McCUjwu93/197N0bJjwGNK0ByfLLxpInjWMkKI1TIY7V
 An9aHbaWuU8YhHsUX5GMwyX9J8GBGfE=
X-Proofpoint-GUID: 0rs-oE3Fp4uZ3DB9LLdmjueJWjItHriA
X-Proofpoint-ORIG-GUID: 0rs-oE3Fp4uZ3DB9LLdmjueJWjItHriA
X-Authority-Analysis: v=2.4 cv=EspHPicA c=1 sm=1 tr=0 ts=6aa2c042 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=I7BhAMs4-vxSTl9LnVYA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE3NiBTYWx0ZWRfXzpD8YmdkH7zm
 RVvRrPOlQcWFg27IeAZgiyCcIDjsBOAAT9XJJnJS6ws1UNERGE7ZfjZmy/gTYyfk7JQMS3Hgql4
 t1Ihor+D+MnLIL9NyhFj+a49MGVmDJxB34JVuY2hL5vipSkUpT1/jHrWGEJuYHOjVMx2TvCWkaV
 poMD780YU5jithhHk6t36SotlW2/4ap5rJR2lalLriPBkdfsdPzsJjGVhBacNwOa1czOamcAT/a
 V5rDOWsSlTGm4nt83gxmXAvOKAokxD1OfJFAgIsNQaoWStiMb4YGgkWKtaErbydGMbeUWXEg8Gs
 jQGjpyOFpz7eYcWCFgT5BKICFhhYS03h3e2E3+jVvySh6JA6VOLaRbfciVGA09gA0UnoQfBFCdk
 j9AVY4fqZ1XC6ZcX8wVO0FcBs8m91Mmk8kGnGmWc0x17u/CKLTbgyjOXjnLHa5Hvj3wRq8ZEkLx
 eyXUk7ypgbrcxtALrMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100176

To allow a vendor driver to assemble and handle its non-BT frames
from the interrupt endpoint.

Used by Qualcomm QCC2072 support.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index a47b51ffdcd0..53010732d9ec 100644
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

