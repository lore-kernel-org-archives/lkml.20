Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793861873;
	b=SsChYOISF5+DF2HT4yalDRvlJiNCjpwahro5g3iOCHkgN5WehbU8bHkF2f11Ji8qLnEo
	 /S2wbW/SqUPmdsZ23u6LkEdj9zpgGYKKqHr19hEA6AuWGFoClxrGwOT1Rkr5bTd3SPwpn
	 JxilyjK3go4kKWZLXjJeQdZykueZ76UhonBoMdhp258Zs4+6GBnaXzZG6b60Jdt8ung4Y
	 oDKstPbK0Tif58WYHhelwNbZc73t5rO0E+0tQKtc2TG458ic3nDlERSaOm1SGr5LRBROn
	 P/DoMBn6zydx7BO4zGZGoM+dPSejQ0PRPTmgiuNGq/uyQK97hb/5qoAVAiAYWMeDBDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793861873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6hwSEt9NR4XCAdutgyCrDTEIinZfZHUBtwMhgIOAkGk=;
	b=UFtA9qPDwkLIeTAE2sJT8yBIz58YRwxpoIaMvKRofSDcJG2okz+7sd69uXz2t+/1qFTA
	 FPWsu1Den8UVyfCTimkmEuPoRVN6mIDuy0/5eRcJ85amV7juQO5hhEknfE8fRwpcFAD7y
	 ZGlUdTuwzPXZkCSw1h89l+Rz0O0ARv2yE2HmlxxonEYCboE7HYrGxvXbAit4Q/U/BY9KH
	 wnkLpBkXe/hyApo/+3A9NJmMgLADdgVfkUoN+sN97MXqEsys+uXkgvlhmLLay1jK6VAKe
	 N/Z5+53blpVCG24B78szLYURC5MFFuqgba7HOwNjNmdaMM6ADtZ38s4W6EdnuQ8O+QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w53KNXqT;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECA8606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ECA8606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w53KNXqT
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-89ff475a152so677817b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793861872; x=1794466672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hwSEt9NR4XCAdutgyCrDTEIinZfZHUBtwMhgIOAkGk=;
        b=w53KNXqTSxpG9KIbuNF7y8eO65nqBB1x8uGYhoEV6mJ5FaEXb2jhxCO3I6Pu4YAljA
         f32GdRMMfAz6NQAGle60snYmqEeFvqTyTgGJ1Fc2ru4uGMr/XYGwqd0KnrrgL+CHqydJ
         quF1ZJjACvPR0jhw53RMAa/LcVHLkKs5G0Eg48C8z+XNvDbanMNqVeEbS3l5K7qP3c7L
         Ggq5le7p5czWt4evISjmcbBiNshO32bSbGO4xnmimVXGdE1irdB4bSHLrVjzqE0se9Vi
         GUEaFsRj8J9ifE+/YGb+LN4q0lZx310/ic5ABMOuXHpp5qm05pNE1FlwnycRJo2vNUxm
         WX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793861872; x=1794466672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hwSEt9NR4XCAdutgyCrDTEIinZfZHUBtwMhgIOAkGk=;
        b=f0PCeyMxnmiOWrUrRpYvOP6R3H3GtViVWjqVKBLJodq4SH8piR/044OsV5EXgI1Mxk
         nrOeLPzNx9m90YghHgSNiqjJnRVxSB4K993Wyz3qBtp58wXqKqWc0J1EarflsN7OhJVr
         hMZ62aC/IIs+tASfKh2axxOxbXNa4BcovBxqICeBXTsvTPYboeH6sMMsRW5Q9QlJys/c
         8uJVCCiwH02M0Hrf+GeOfOPlVxzfLRs9m7dn3Lh4ejKCK03PFHSQaFZcrdTYEXc62hij
         f16rsSQi6qHs1/RdIabdkespN0wBgryhcySAGZbWGWt8cgkDOmF0hrdz0PvkIpcNbt1/
         3sXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZsmMApVr+LIVCyFxguP9ot/15uPWllryezd/2clveaSvbpfxahf2SnYRZrW0dWqC7ul28V1acAcwh94w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pDWMPWL0Rk7P+cruDp14SDeZ+T5hiMU4NyXZ/WcfbEBcbdf9g
	uv18v8U9JE+u5gkCLoWGOz+ygS5iGjAtbVgXhi82neImBskb/JMYZJsJ
X-Gm-Gg: AYBFou1mWXgE4ptIVLASqMV6d59SIGa7dfPxJ79IfFcGBNXcCZGst0cDATB+ZmazqpA
	kGMOjObdhG881au3EOL6zOI7c8cJw28rTDRwhJmk8ft5jYwQbBCrpLtrGWNxHCSB0Qu+SUJbzbk
	J+AlGp/T+1g+B8diBIqo8pd+8WbWfgRNOg6oE/ABuKS9DVsY6VIAKNA0eS4bzN8o/zzq1VfAHzR
	TAuiqCGbB6Rr3NMwYZVMQ5JPqPhsW/xc9j8A7PVWR5J19aHtZp2iCjsxEsbjb+OmT8X2U4Rc0Kz
	mVyaybR5C8luwqJu6Nh+HQsDqqmD9yMEC/h5VwD/tmnCdXY/Y5ZZnLxH94TYMsVmSuaeFdNIfEF
	wkLMdhwCB+VTjYa77l5u4CUAfwyGBoLq1DCayFY2d+dJhU27PQ8gZJy85pzsyu4XD2U13mhi+EL
	YA4n/F0B5M8T3x1LxL7oGi0eksL9TVIP9UZHS+mFeQsOIaWhanCS+LbtkcIn06uRILVX7VlaSck
	Q5D3Dt7+MNHuDsHl9W70S/4p04OdSrlhMv2FDzNORIioLRQ/0+QyLh+qSsLzXbgczqGeWr2rUlE
	w1qCK/UFNq98Awu0PsgsPCgBWwUnrOHhFshHrljfm6XEodgV
X-Received: by 2002:a05:6a21:8281:b0:3e0:df81:23ef with SMTP id adf61e73a8af0-3e928aab8cfmr15657881637.74.1793861872246;
        Wed, 04 Nov 2026 22:57:52 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb469a8e97sm1832513a12.29.2026.11.04.22.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 22:57:51 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] media: gspca: etoms: bound device-provided length in sd_pkt_scan
Date: Thu,  5 Nov 2026 15:57:28 +0900
Message-ID: <20261105065728.1351098-1-hj351016@gmail.com>
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

etoms sd_pkt_scan() is the gspca pkt_scan callback, invoked from the isoc
URB completion (fill_frame() in gspca.c) with (gspca_dev, data, len) where
data points into the URB coherent transfer buffer at this packet's slot and
len is iso_frame_desc[i].actual_length, i.e. the number of bytes the device
actually sent in that isoc packet.

The subdriver overwrites the real packet length with a value taken straight
from the first two device-supplied header bytes:

	len = (int)(((data[0] & 0xc0) << 2) | data[1]);	/* 0 .. 1023 */

and then hands that count to gspca_frame_add() for a header packet
(data += 30) or an inter packet (data += 8):

	gspca_frame_add(gspca_dev, FIRST_PACKET, data, len);
	...
	gspca_frame_add(gspca_dev, INTER_PACKET, data, len);

gspca_frame_add() only bounds the *destination* frame
(image_len + len > PAGE_ALIGN(sizeimage) -> discard); it applies no bound to
the *source*, doing memcpy(image + image_len, data, len) directly. Nothing
clamps the device-declared length against the bytes actually present in the
packet slot.

The isoc transfer buffer is usb_alloc_coherent(psize * npkt) where psize is
the device's reported wMaxPacketSize and npkt defaults to 32; this driver
sets neither cam.npkt nor pkt_size, so both derive from the device. A
malicious camera can declare a small wMaxPacketSize and send a short packet
in the last slot while setting the header bytes to request len up to 1023.
gspca_frame_add() then reads up to ~1023 bytes starting at data+8 (or
data+30) -- past actual_length, past the packet slot, and past the end of
the transfer-buffer allocation -- and copies that adjacent kernel memory
into the vb2 video frame, which is handed to userspace: an out-of-bounds
read / kernel information leak reachable by plugging in a crafted USB
webcam.

A 1-byte over-read of data[1] also occurs when a 1-byte packet is delivered
(fill_frame() only drops zero-length packets).

Keep the real packet length, reject runt packets, and clamp the
device-declared length to the bytes remaining after the header offset
before passing it to gspca_frame_add().

Found by code review; not reproduced (no device/USB-redir setup on hand).

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/media/usb/gspca/etoms.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/gspca/etoms.c b/drivers/media/usb/gspca/etoms.c
--- a/drivers/media/usb/gspca/etoms.c
+++ b/drivers/media/usb/gspca/etoms.c
@@ -659,24 +659,37 @@ static void sd_pkt_scan(struct gspca_dev *gspca_dev,
 			u8 *data,			/* isoc packet */
 			int len)			/* iso packet length */
 {
 	int seqframe;
+	int datalen;

+	if (len < 2)			/* need the 2-byte packet header */
+		return;
 	seqframe = data[0] & 0x3f;
-	len = (int) (((data[0] & 0xc0) << 2) | data[1]);
+	datalen = (int) (((data[0] & 0xc0) << 2) | data[1]);
 	if (seqframe == 0x3f) {
 		gspca_dbg(gspca_dev, D_FRAM,
-			  "header packet found datalength %d !!\n", len);
+			  "header packet found datalength %d !!\n", datalen);
+		if (len < 30)
+			return;
 		gspca_dbg(gspca_dev, D_FRAM, "G %d R %d G %d B %d",
 			  data[2], data[3], data[4], data[5]);
 		data += 30;
-		/* don't change datalength as the chips provided it */
+		len -= 30;
+		/* the chip-provided length must not exceed the packet */
+		if (datalen > len)
+			datalen = len;
 		gspca_frame_add(gspca_dev, LAST_PACKET, NULL, 0);
-		gspca_frame_add(gspca_dev, FIRST_PACKET, data, len);
+		gspca_frame_add(gspca_dev, FIRST_PACKET, data, datalen);
 		return;
 	}
-	if (len) {
+	if (datalen) {
+		if (len < 8)
+			return;
 		data += 8;
-		gspca_frame_add(gspca_dev, INTER_PACKET, data, len);
+		len -= 8;
+		if (datalen > len)
+			datalen = len;
+		gspca_frame_add(gspca_dev, INTER_PACKET, data, datalen);
 	} else {			/* Drop Packet */
 		gspca_dev->last_packet_type = DISCARD_PACKET;
 	}
