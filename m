Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875914;
	b=lGV1YTCC6USUTGOK5iGr/3E4AuB0e+SnhxJTggIdj3oh7uzBQwz2sN7oIgCjcNAp5yhU
	 cY3uIAzQ4YT3vAfsKhoIsmjQTSPVHKsma4N9rYIGkznAKXQlrb0p1NjGJ6d0qGtSRjUUK
	 TdoFpY30XnfSWkPYbdGefKN7lskLkCAGsA2gnNXth2U/o7zItT+kckzal/YthSuQtyvji
	 6czXwU4mmFEdKEPhAMAX3mRcW9XLIeQrksvPeELmQKN3mN0YbrjON1pvADwP1wrHd50Zo
	 dS6tIk0mampLLcolF5reejJfL+YFlR4pjU1nd/HnD7oiyR1va3b6Ul8WimZSoYtc/hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Rno+ABKVoCHjtYqyaujA/hiDFnvF78Jd9s6HELBuDFU=;
	b=flb6CKOHwELCA7XyiS1LRUS5ETPMRSSXg5x3nBSYDQ1DQ4KG6N1mkVKIMoBR59sngyip
	 COPOqAXMJZ9sOk1G5vtDZwYcXmy6wKtfqUPEX99TuBiZ9fk3Eu4uXuXNLBMBnDMhoM/EY
	 oQw4N5976ZU/F8p3BSEJgKlHwQU4EsEpq4lBQamP+/p9mZDSquoZ5zPpbwrUETa1dHVTA
	 bliQKjUWIOn2wXW4n50BEtSq+6XueKP6xI0DowTrG9ly10beT+VwVZcmm3+CKVAviOSSF
	 gx/MAAVtLUB37GG0Ixt06FB0afOLS0pY9TULxsmyfGsOAcVs1jO2Yv0ETupSg/eJSfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WwflIkof;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E911606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E911606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WwflIkof
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ed1414df17so6000095ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875914; x=1794480714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rno+ABKVoCHjtYqyaujA/hiDFnvF78Jd9s6HELBuDFU=;
        b=WwflIkofOYTZE8YbyzmanHfUgdq+9tDgbdm42MZGM9d0xsLQD9m8OTQ2m5vpUtLY6A
         JpJw/oa0SAH+q9pSL3RmlLTHm5ad9cnIWZpYxRPKp2CYfV6dposlRI6mq2xzLKhQqcnV
         DaOm3RCxzY1A9C8E2KXCc6xLkdwYTyTPwCuefxOsouGF/pGplcvdDfv/8bExeiazmkb6
         OU0dl4ZnpdJmwg6RgbmsHZHCnrlqSzKrJRcFjiY+dyKA/QoycIhAtyHjw50SEKR+D9+C
         9LPHetngvd4hZUNpfjsJG6cptQTfmFZq8NRgT0Mj5ri02jKVDoCxS4h7tlyc2DGSL5v5
         ivIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875914; x=1794480714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rno+ABKVoCHjtYqyaujA/hiDFnvF78Jd9s6HELBuDFU=;
        b=pxHHo8mQBZrLJZXUgdY3sq5bqcY8zvP1k8jZdEDVOeo1N8ho/0RSy7rYNiR+Trwe7d
         gsAhFgDhr06W1IRAsGIOk+QcDy5v5hkHra9Z0uhx0qNzCEXWVANYaW34SbhN1Pi8jHc6
         toDmiMNVtPmqhIEbvdgoaFmGdT+r/FaHoaol+NX6zAUr/F9Lg2S/KttgOT8henQy4lwL
         lsKnS5oH2zERY5eLZuL2orVUX+Zp+M+3yd9uxj+F0fBIvizkFJWz9dDtxeedU464uAfQ
         c2jlgjzzrlo5QMifg6FVim7tNth7KzFEWRh54sMQJGoxn62lk52HRP09SBxe8Xsq+duf
         UlNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmMdBEJcjXfcA8W7hB5Wf7VG1UmK7xMFarZfWIUPCXFz9cWmPFVuoGNlvAiF3hAXykevDNhxJKaN1/0KQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P1E5Aw+O2OTGwUZyJhpaDoJdqbf499j8G56EmTjUHY3pjmcNT
	gCDR8T7inN7pEjyp7ljozERjqxUno7LND/xUxVmLBJPHRI7kvGMCfgNj
X-Gm-Gg: AYBFou3gQDudfX/4mg7v3eHB6bH05t+G96w4PAISYHF3G23pih5D3zVBHK4icltMJ2i
	H9CGstvt+wrRfJdBathh2p+v1lwRbHhiKp3KABH+8Q37LVOZ1l+M9BlfUthhc9TASYOEd40zvAD
	w+7b0WT9PkefdL2floxufFpitMDFGsfEfT4lVmCFKEGABs5GK7WwSA4s6kOm+73I6Ewka6uld2z
	cEXQ1KzwhyUsTwJ2VERH3nfhQ3SVobVpaXa8ARrw81iakBDLhZQZu4Y3srY9mOFFInsE45qkXHm
	uMp08xA+Git9LGsnw8x/cXnB97BM86UcFsNfQc5KSAYKVWA/S7yKhAHXZsIfU45oOP0w8wuMPU3
	ji6cj26pL9vVAu5sh8Hql4y5KZ72veU6/DlbjgRPAO0h3zf+C8nJTkxsaefve1uRO/q03/ozcuB
	0rxTgjKf6b1pM0CpLil7YjDILZIYOhDkPq2SU0yh6R+lUZqpvoEtI6A7OiPuc+ZZSRioqNwrdVa
	kOfzt18qrlBesG8iQV+a1M6g54Dv5rvtY7kwUFP1Li+a6Ny1ORDuiWCl0ScsMVHUzHRHZ07ggAd
	QutVtqYsC+N8QCN4t3bNnKeWi4d3eKHNWCN6UKGbdFN4zyx6
X-Received: by 2002:a17:903:4683:b0:2dd:b837:48f7 with SMTP id d9443c01a7336-2eb3649f118mr178999575ad.25.1793875913587;
        Thu, 05 Nov 2026 02:51:53 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed090e515bsm15755525ad.42.2026.11.05.02.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:51:53 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] media: gspca: tv8532: bound packet length before frame_add
Date: Thu,  5 Nov 2026 19:51:40 +0900
Message-ID: <20261105105140.1446192-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

sd_pkt_scan() in the tv8532 sub-driver hands the two image lines of a
packet to gspca_frame_add() using gspca_dev->pixfmt.width as the copy
length, without ever looking at the actual length (len) of the received
isoc/bulk packet:

	gspca_frame_add(gspca_dev, packet_type0,
			data + 2, gspca_dev->pixfmt.width);
	gspca_frame_add(gspca_dev, packet_type1,
			data + gspca_dev->pixfmt.width + 5,
			gspca_dev->pixfmt.width);

gspca_frame_add() only bounds the destination frame buffer; it copies
'len' bytes from the source 'data' unchecked. 'data' points into the URB
transfer buffer at iso_frame_desc[i].offset, and the isoc completion
(fill_frame()) forwards whatever actual_length the device reported (it
drops only zero-length packets). A camera -- or an emulated /
USB-redirected device -- that sends a packet shorter than 2 * width + 5
bytes (709 bytes in the 352x288 mode) therefore makes the parser read up
to that many bytes from the transfer buffer, past the data actually
received for the packet. Those bytes are emitted into the userspace
video frame, disclosing stale transfer-buffer contents; for a packet
positioned at the end of the coherent URB buffer the over-read may also
reach past the allocation, depending on the endpoint's packet geometry.

Reject packets too short to contain the two lines the parser
unconditionally copies. A short packet makes the current frame
incomplete, which gspca already discards; the stream resynchronises at
the next frame boundary.

Found by code review of the sd_pkt_scan() idiom shared across the gspca
sub-drivers. Not reproduced (no hardware); analysis only.

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/media/usb/gspca/tv8532.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/usb/gspca/tv8532.c b/drivers/media/usb/gspca/tv8532.c
--- a/drivers/media/usb/gspca/tv8532.c
+++ b/drivers/media/usb/gspca/tv8532.c
@@ -251,6 +251,16 @@ static void sd_pkt_scan(struct gspca_dev *gspca_dev,
 	struct sd *sd = (struct sd *) gspca_dev;
 	int packet_type0, packet_type1;

+	/*
+	 * Both gspca_frame_add() calls below read pixfmt.width bytes from
+	 * the packet without consulting len, the last one starting at
+	 * data + width + 5.  Drop packets that are too short to hold both
+	 * lines, otherwise the device can make us read past the end of the
+	 * received URB data.
+	 */
+	if (len < 2 * gspca_dev->pixfmt.width + 5)
+		return;
+
 	packet_type0 = packet_type1 = INTER_PACKET;
 	if (gspca_dev->empty_packet) {
 		gspca_dev->empty_packet = 0;
