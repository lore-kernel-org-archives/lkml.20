Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874781;
	b=ROEfma97xkwwJM3GukU9Q7dqLy9MkC22+fkfvQR05F21XPSzZoFZQ8g/QfyXTjEudUod
	 DCIdb7ZFa5UOdMjkPRGu23/DvpC7DiHBUtL/crhTA9PPTEbM4pmx5N4Q/L4RleFCkFD42
	 F7FnNFvJYB4qo8ddLf72nM7HEXR9RuxQkz+Hmteoxf8CMWVG7QRhGwGriHtFi6I56x4in
	 yM8C4KZfcvn6biTBfQS+v/Lly3tr+yedbhz6PzGk9uk9e/+grmkv7zVXbBBUuf2FUBAqk
	 cAV3HHqXgyS3dw+mswTjZvL0rHOUIoY7SvtLF80Gm7XCrdlkEQxAld2Xro8wAxTh6Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v0rbKVQ49enEBCt7tCDTAR+n/t5wNOavw3KdPMopqog=;
	b=hzzeO86bwzgZKLkmdrinCcKRtxaKvts1VnSgomuSAnfkxqDahCffF+uTUEcF0uZGgv3A
	 STpkLh2hWXjJ9NaTJ5LE2pgt74/sNR9jl9/85TYwz6xOoy+MkekgjQMEoR4oib1tMjRqb
	 5vzAL5NSMLGtxebYKH7iCvRuQAvyY8LUJIRJU7MrpxPuif9XPtb6Bfl0sGm9Z/6GR5Cx+
	 M/3jjpe9w6bXc1hKfwlphWAhk5LcwRlfp884XXHQ6m3I1Wol5iNi451B6gSsSyH/NO99o
	 rnLT/YIuyK6RRwJd3iqgXFgZiP3jt3zplPi+5ZLBG7vxEYknxdQ1xG7nNjqN1W5au2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PiyCf7pv;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D636606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D636606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PiyCf7pv
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so129935b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793874780; x=1794479580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v0rbKVQ49enEBCt7tCDTAR+n/t5wNOavw3KdPMopqog=;
        b=PiyCf7pvWgT8fxkMzrWLrIH3dgWUniFK7soH84AMstFJO8rYlWAtORcQBiHnBLeWPs
         NNiNzOZ90aMMgi1JGENjNURKZuSo7+lErbIWOjc5muIfBSs844BTQkHcWxt2sjSVemLv
         b3jJ5uCjGu0G2T/wb9Wa+QFDYelGltdYmY5h4VRnuOMkrCPEzjrBCAm6MIBGdkmt19UQ
         LvVCLVo9liYpYgh+TQc2q0TU6SDfDG1kqIqXyyJCrWt+Btx9S/nfuS5iOpyT3aungVc7
         6GLIY8/kha3rjXXouZf+UbCmMRwFLQVjIb12RlcJnnxROwl0eYmuG9QNAQBaNeHrjgzR
         tYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874780; x=1794479580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v0rbKVQ49enEBCt7tCDTAR+n/t5wNOavw3KdPMopqog=;
        b=reTt74zpm5L3ptuuzvVP1AHMnJg8w3N8DYJxGqVn1tlXLV1Wox+InVDfvKgxviy1AM
         X3Pk5kBu1tld1OBWrWwbglXCWfK6sJvXLf1K10jVHQ8Yidv2L2CzWgP4xlQx/bz0rdD1
         BqfEBGKcNa7MdzGe33mat16Svb2Vzq3yacFHRowduYKDi9lxBVZbT4Mfbh8/F9OzSBFC
         qKzGNI++5EEQRdV4CrO79P2QyqBGvir3X3l4maPABo5DXD8b4vhqCAfeR8lBYrDyZmPp
         FXvpWkXhdsBaiBuMvHrUnW/Q0meDAqYqI7nALVZKcCpHgdEObW9UWfB6uQbEK6ykAcl/
         z6sQ==
X-Forwarded-Encrypted: i=1; AKwUvByTBvDfvF3jDaocjwjt0oGS7ASNZg0B+YAu87K7RpDd4xbuE/atdpXVo+iwfzL/BLzowfIRlKO8WI/lWQs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GTNR3hg6Xq+iCDPTt192tWx4ZT/CISJ17yr+zrrXr+RVqcvkF
	ScVu0Q9oCEZo+8DTSkGU3u2+T/jhVW5V0KQyheXI6rve6Vcy1vVltEI4
X-Gm-Gg: AYBFou1QM9QSJBQFnEYoLg8fUtLkaIK2UzfIiRQHv64CHHYeqyh03aQ34T0PN8C42zw
	mU75Jn01RbC7aobsRHu9Sk6UFuRh1jfMswF1L5OrDdTty59m2BDBGUBHMQetEN6vlij76+338/L
	rxbBgRYok9dYg3bQLLV86XpwTpSHqYjkKJdsT32whxQuEY95duAnyPUFeCDm3aShz6UdGj55swf
	c46aV6FFIaKc2jtNgx297JKWUGEc/pQWuMSRZzbpbt1MJuIQ+0Snpw9fg0TtndLN1mo5TvBANDg
	HlP4UKkXM9p210wuu++Xy+66VDW7yo34WeX7nFUR9wKDkLvF0th4Outq9BUzVgKIXB4mqhDWLhA
	s5ki0VhFsCxmJ7GckD22HDQ5Ylc015XclXXoy3b7JCsh7mnoLFfr7CTbjAMDUzU6FFufVH7Mbr1
	+UNurgLXPd3bxvMVJ0APcskoQLxIEbPYew7g6pNAAaMw79qMJpwV42EK800CWd8/KxdbMfWmPYd
	lvt6bff3gWd5rjWbv/dGf+yYkVIka4vM+YdM7UZxEMPTygpo+LjjrAXqF7IPxTUtDDOJ51YHnxq
	XNrPtrYnb0EHlggDL42g4fedTGqDJ6DkbDeGU0BPwSx1qOkL
X-Received: by 2002:a05:6a21:3b49:b0:3e2:aaf9:3a17 with SMTP id adf61e73a8af0-3e92895901fmr13076159637.25.1793874780263;
        Thu, 05 Nov 2026 02:33:00 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb5d66a91csm450865a12.3.2026.11.05.02.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:32:59 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] media: gspca: etoms: bound device-provided length in sd_pkt_scan
Date: Thu,  5 Nov 2026 19:32:45 +0900
Message-ID: <20261105103245.1436719-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105065728.1351098-1-hj351016@gmail.com>
References: <20261105065728.1351098-1-hj351016@gmail.com>
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

gspca_frame_add() only bounds the *destination* frame (image_len + len >
PAGE_ALIGN(sizeimage) -> discard); it applies no bound to the *source*,
doing memcpy(image + image_len, data, len) directly. Nothing clamps the
device-declared length against the bytes actually present in the packet
slot.

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
v2: wrap a commit-log line to <=75 cols and drop the space after the
    (int) cast, per the media-ci checkpatch report. No functional change.

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
+	datalen = (int)(((data[0] & 0xc0) << 2) | data[1]);
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
