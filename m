Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793241184;
	b=w68B10QZWu86+FWv1565U3caALIX5xhvNps27NOkf/LVBHMVv3VLq/oyT4POHmEZN5gE
	 59EvH9RvdgoFeVOzz2hWga4N8+wUC40oEv0rx4XRTViGOW1rSvZZJrJvmu2cZ/1Y8Nhyq
	 YPty0OhIGUaWcim3lu478Ki7qXKRlv6/GR7+DOhkilvS6pBZK3xvlpjOZUzRTQWUfRthr
	 H9+224hlnzAECglUWYUVRULK6psD95pO8Dp0tYRlKSqgE7MCGF7oGgKXJKdiPZ/mq4kjh
	 LjijVu4BaENRCUGKuIkslq7shMkxH24OQb7BWlFEdZOC3wrTochLVSXkRMh9jsp/CVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793241184;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=4PJt9j4HcMbX2U0OhRHELbhgSvMBy0CM2TxRYy3T7fc=;
	b=aX3uqudVcvl/GXnCbnPzXxdsCCRdN39lhr7ll/XqKLy4U7yMcjBEIdfcAOZr2Vk+LPFd
	 srnOr1zGUBBmxnCMQVjxp6IV9loV0dwJsbfefP23Io6SMpRyHIgFLYGCaFrs2WIPzjApt
	 v+6Bgi43eWGXarckZU21Gg9q3fPys8LQn4IJi2v7y5YH4GcD0O7hyHfBx/WQcduMX0V5R
	 kTTh6Ie5Euec6QTr1iO1fOPmpO5she9zxkjTL2vfyJrzefq/1Gw4NBehubms1SV1itwdR
	 /r+OMwr5gie17il08pxycaRxwNe1H1xKJ1ZVKnUbL33uVLzgNqC7bbXyNVX7J6y8QQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=mqn7wanqn5ak5opvlpoc36mtuq.protonmail2 header.b=B9q2kGLR;
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C280160A2608
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C280160A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=mqn7wanqn5ak5opvlpoc36mtuq.protonmail2 header.b=B9q2kGLR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=mqn7wanqn5ak5opvlpoc36mtuq.protonmail2; t=1793241180;
	x=1793500380; bh=4PJt9j4HcMbX2U0OhRHELbhgSvMBy0CM2TxRYy3T7fc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=B9q2kGLRLsBh1MtKWrzodivqUADi4nYHImcTWygIXNV325NX25GcgQxR2lHaUYkTj
	 y+aw19MzBzWVXpF3rbQZYbg5VPke0uEK5s92MLQeqmDgJAhhJQS6YFT4yBhLl8Hpfz
	 t+2oID27PMAQt2lPZpKIz2GC+xHe5YKkGdN1UU7ijineEhWnrMXWaL/ry4dGF0WzHu
	 wG6yEO6nwmw5CW/nABZU4sxH5b37/dTsOomAZ4DQKom533XfypJbUlVi1t4WIDIfG0
	 JLlM3qv1Lapc9SxRso35MdJtpiSJOCD42HN20KvOmhD2bB09WhivX3xbhEyUA2YfHS
	 svS85HUtOw/uA==
Date: Thu, 29 Oct 2026 02:32:55 +0000
To: linux-bluetooth@vger.kernel.org
From: Kyle Pepper <cochcoder@proton.me>
Cc: linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, marcel@holtmann.org
Subject: [RFC PATCH v3 1/1] Bluetooth: btusb: test reported maximum LE length on TP-Link UB500
Message-ID: <20261029023235.1280321-2-cochcoder@proton.me>
In-Reply-To: <20261029023235.1280321-1-cochcoder@proton.me>
References: <20261013032742.497402-1-cochcoder@proton.me> <20261029023235.1280321-1-cochcoder@proton.me>
Feedback-ID: 97716137:user:proton
X-Pm-Message-ID: 6647e1af1c4dff928fc1eb67f934e9c094048253
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The tested TP-Link UB500 (2357:0604, RTL8761BU firmware 0xdfc6d922)
reports maximum TX and RX data lengths of 251 octets through LE Read
Maximum Data Length, while LE Read Buffer Size reports 27 octets and
eight packets. The previous RFC demonstrated 167-byte HCI packets
with unchanged LE credits during ASHA playback.

Use the reported maximum TX data length as the next experimental host
LE ACL length instead of an ASHA-specific 167-byte constant. Require
the observed 251-byte maximum and 27/eight buffer reply; preserve LE
credits and BR/EDR fields. The maximum-data-length value describes
Link Layer capability and is an indication to test, not proof of the
physical HCI buffer size or pool layout.

A direct HCI user-channel experiment sends sixteen whole packets at
each HCI payload length of 27, 167 and 251 octets from UB500 to a
MediaTek receiver. All 48 payloads are received byte-for-byte intact
and all 48 HCI packets complete, with zero pending. This establishes
251-byte HCI acceptance separately from the reported Link Layer limit.
Only one packet is outstanding at a time; the experiment neither
installs the revised callback nor streams audio.

Keep this a TEST ONLY RFC. Eight simultaneous large packets, larger
HCI limits, mixed BR/EDR capacity, other firmware and sustained audio
with the revised callback have not been established.

Assisted-by: LLM
Signed-off-by: Kyle Pepper <cochcoder@proton.me>
---
 drivers/bluetooth/btusb_main.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/bluetooth/btusb_main.c b/drivers/bluetooth/btusb_main.=
c
index 92a78a7e6..b654cf5be 100644
--- a/drivers/bluetooth/btusb_main.c
+++ b/drivers/bluetooth/btusb_main.c
@@ -2972,6 +2972,19 @@ static int btusb_setup_realtek(struct hci_dev *hdev)
 =09return ret;
 }
=20
+/* Private diagnostic: test the reported Link Layer maximum as an HCI size=
. */
+static int btusb_ub500_test_post_init(struct hci_dev *hdev)
+{
+=09if (hdev->le_mtu !=3D 27 || hdev->le_pkts !=3D 8 ||
+=09    hdev->le_max_tx_len !=3D 251)
+=09=09return -EINVAL;
+
+=09bt_dev_info(hdev, "UB500 TEST ONLY: LE ACL MTU 27 -> %u; LE packets %u =
unchanged",
+=09=09    hdev->le_max_tx_len, hdev->le_pkts);
+=09hdev->le_mtu =3D hdev->le_max_tx_len;
+=09return 0;
+}
+
 static int btusb_recv_event_realtek(struct hci_dev *hdev, struct sk_buff *=
skb)
 {
 =09if (skb->len >=3D HCI_EVENT_HDR_SIZE + 1 &&
@@ -4715,6 +4728,9 @@ static int btusb_probe(struct usb_interface *intf,
 =09    (id->driver_info & BTUSB_REALTEK)) {
 =09=09btrtl_set_driver_name(hdev, btusb_driver.name);
 =09=09hdev->setup =3D btusb_setup_realtek;
+=09=09if (le16_to_cpu(data->udev->descriptor.idVendor) =3D=3D 0x2357 &&
+=09=09    le16_to_cpu(data->udev->descriptor.idProduct) =3D=3D 0x0604)
+=09=09=09hdev->post_init =3D btusb_ub500_test_post_init;
 =09=09hdev->shutdown =3D btrtl_shutdown_realtek;
 =09=09hdev->reset =3D btusb_rtl_reset;
 =09=09hdev->hw_error =3D btusb_rtl_hw_error;
--=20
2.56.0


