Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916764;
	b=WD25xpTH9B7bGmqu3euMiJyMlY/HEh+PRwN9sbUz7cfhdqOXcCggLzi+uceroRgnlab0
	 bvJ594CGQu+IiE4qTg3g66U0jYlLV47RfvryRGi8w2VGlx+V44XH5tbpek4PEhnStHDOI
	 4TAHFRmKhMQ4XAj5alXJZWRFYiIW3nlCKQtGAuvcxSCfgG5PSPfRAhpVsPTOjsJBtcUQV
	 0qbVbrHydJ2pqFaZM1EqD4e+0DkkqDjEPaeCobfAliGVkfQQpCrVJPBa6HfXDVXc3/3PV
	 YProInR8W6SVq5ek207FlgNS7unByFH9AQHBvs6eJr30nVRQnPIrwAlqay5aynZN1OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=J3c83wlfldpWr+oBalIwteVuMUPdu9SiOyKFY3VWvq4=;
	b=zduZ+GCcos7+WFQzCuaRTwUYKypywraHAeGYPycnHLtmAY7hx/B0M1EviX8iWJxkSXFI
	 UGVbnw50VtE2qwikJevMPUcVwZAouH+d8iisb5oQj6jmvsEXFlAQnAjQrwo5C0uB2Q8pe
	 ysGMlr1Zl/EYIuQuiQfry2PVD6740AWjHYCvFSaMl2GBm3C6Rv8ajO/rfQSAOTMEDzPsS
	 2swrGIyF2SwzQZTvgF/+T1HUCTA1PcTuLC9NGV4DrPOPymN3YHe/xQ4Gzx136T+QE0ydV
	 vF1rbbL90Jv2jOXC7DVYtvPMx071t1q+/IsMiK86xZFP/qQXgU+zTq4xrQx4nGlFq0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VShzzm8D;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BC4606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1BC4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VShzzm8D
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b75712fb57so5838559a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794916762; x=1795521562; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J3c83wlfldpWr+oBalIwteVuMUPdu9SiOyKFY3VWvq4=;
        b=VShzzm8DEr8gPcsnf3TqytgQgE/YeO/Nf4p5Q4XL0NEDuVJpC7mUfCUpTZcodoaInc
         2jbqRdH57Vjx3iVw0L0i0QSPJ4RDDQ5kwC+zIC6n4v6+w3AoNB5LOKsKp4+5Lj4Ua2KQ
         xknzg4sXTw9/R0frAw1Xy7MhyT+tyEZQGghaGGGeycxtKAUTG2CHjBqE2pRfHf3rqA/3
         jDOBqrjEhMCaZ1+YaS2h9fZcom0RedcKkdEiEGXIXo67rW4ODsL6V6CKeJWXx0c/D9wQ
         FXM0cZk2S5tDhBNimeBm+/fy0/WBGo08n5nfSMMx/kOlj5+5Nh9S4d8k1i1JCnZV3K+b
         yCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916762; x=1795521562;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3c83wlfldpWr+oBalIwteVuMUPdu9SiOyKFY3VWvq4=;
        b=AFP6SRZZBQhGUF9AiJD8MKH/eWVo31R0psYg+Uy7KW+mzbPM+Gq9mAS0+FjRaJ4jPl
         JwM63yirHg6fSLj2yjRNJ79wCfQhv9+27qARVRvs4P1OU7mo82UpKBGdApjTwp3v/wLO
         6LvA5KQI1vfmLD55m+PidayzJc8aPnIlmCxInTGOQ5nSft1aNOjI9og9s0a4NUZ/P57s
         krpsJeY3bAhXT9c/1BqUmou1Uw1+fphv/Xnm46AObZ5kMnbBw+DqJpD9jiiYeqpd2PjI
         G0ee4gv9/U7s3VoHG8immtV04U4KugWw0AisaP5D40S+IY8k3Hqhy/z/TNJi5xX7iXAr
         aEcA==
X-Forwarded-Encrypted: i=1; AL+hErETvcOqnBuh1jScX8O2ey/uTs4bPGT9xNuZSo62BiwCrlvcre6y7lkvDf9AjSUP8mDLGzZc03A4//ApSK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FvM4NU4kg25pjZJKzIlzE7XsNqnElZe10yV2ElAwtwg6bbRUO
	XuLaZySulQTLJQ4LGUaQvhtZsgneK8vseJWt2BJ/d4B5m4yxB9HNSw65
X-Gm-Gg: AYBFou2Qaev5rSsF7MTpXeobf1OpPTd1OU1KB9HS+bO7sCpnbWCHY+QrQQAyV/LQ6PU
	QKVIq/KBSy7fglXoG7UGAxryih/LsSdvXuNogpdlNq3KMuQLaxJY32Ju/Ug7QZuM5s421aYKMH8
	as0mSn91maoRlb891QaHvMdRLLQZtbcOLh0ip6ko3xmRGXAqxzKk38VIid4f2uErmS2I910EETs
	CxYQ2DzwOoOHkLgf9RUPuIkbRrDv7bkTUnngvzu3j4FyzIoFnUyOrIryJFKek2IU0SjU02spXJ8
	R3DJnsuRPhuzpn/kj9a1cbfHN0nKh8LfRv25NpnpZPE+UTUn+LVzTWymUDlsXo5xdTertp0kvm6
	DUrZTwkUS6U8X7CjdD9icqEoAF4gea0MtTa2iFGMyS+feE8rqV7D7Z7Ft3tuOnBZsRP2/at0s8z
	KqWWMCRWx3zD1hauZiPfbdnnWfyTPwhATcfUFxg6+8Ik8DeqOChFXVyOA8+1FATGilQ3RnJxebn
	mRpfJrqymACRkVC9kvdpNH1JYOsv3Dvulv6AS6zn6wYVAM6caI1HZ1BwI1PSvvnXbHlduL+bTF1
	uFTUiGvPfx5R+cBW5GyxkIFvn239zJWx2Z0JC2JhGZpXAC8zq9GruYH2
X-Received: by 2002:aa7:c9ca:0:b0:6b5:911a:f4be with SMTP id 4fb4d7f45d1cf-6b7c0bbe4e3mr7963601a12.13.1794916762099;
        Tue, 17 Nov 2026 03:59:22 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611bdsm5687407a12.8.2026.11.17.03.59.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2026 03:59:20 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v2 2/8] char: xillybus: Safer access of unaligned pointers
Date: Tue, 17 Nov 2026 12:58:56 +0100
Message-Id: <20261117115902.41359-3-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261117115902.41359-1-eli.billauer@gmail.com>
References: <20261117115902.41359-1-eli.billauer@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Use get_unaligned_le16() rather than dereferencing unaligned pointers
directly for portability.

Fixes: a53d1202aef1 ("char: xillybus: Add driver for XillyUSB (Xillybus variant for USB)")
Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260805093436.59740-1-eli.billauer%40gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changes in v2:
    - Added Fixes: tag.

 drivers/char/xillybus/xillyusb.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index c4ddde221f0b..16d6101d9269 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -17,6 +17,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <asm/byteorder.h>
+#include <linux/unaligned.h>
 #include <linux/io.h>
 #include <linux/interrupt.h>
 #include <linux/sched.h>
@@ -1957,8 +1958,8 @@ static int setup_channels(struct xillyusb_dev *xdev,
 	new_channels = chan;
 
 	for (i = 0; i < num_channels; i++, chan++) {
-		unsigned int in_desc = le16_to_cpu(*chandesc++);
-		unsigned int out_desc = le16_to_cpu(*chandesc++);
+		unsigned int in_desc = get_unaligned_le16(chandesc++);
+		unsigned int out_desc = get_unaligned_le16(chandesc++);
 
 		chan->xdev = xdev;
 		mutex_init(&chan->in_mutex);
@@ -2105,7 +2106,7 @@ static int xillyusb_discovery(struct usb_interface *interface)
 
 	/* Phase II: Set up the streams as defined in IDT */
 
-	num_channels = le16_to_cpu(*((__le16 *)(idt + 1)));
+	num_channels = get_unaligned_le16(idt + 1);
 	names_offset = 3 + num_channels * 4;
 	idt_len -= 4; /* Exclude CRC */
 
-- 
2.17.1

