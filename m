Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794782733;
	b=f2nMez2XM1c+97B1VdWwUOlo4QPDq5vgq504vSLYPy/uLcZKnY1dZSlzUBo3mOywwlZl
	 cEuMUhhKbdpcLSG87QugiiK9o7PtnMuq9HsnGBD21t5+v6W+mHWAkQ7DMZrJLXmaDz691
	 CG0zG6jAoatm2Yr02N5ql0kx9lgnM2W81E3hJHZYdb6c/N3wqlu1vubMji/IUj6rERoG2
	 PphK3NbWOE1IkA3jSUdWh2eR4LFIaHwqifNbeufPmYhkBehelJvtxwwHZER5/rNr4/huz
	 y1+LipUJa1PinVFcAYZsv9aXU1gG5MqvNnyfWH2Kj93xwWCpoUpNSEX0+Nrjd5/DSQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794782733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GOr05e4sBQgtPWColaaByvA3KE3CX0khn1f+6+vSgZ4=;
	b=uP2LbZBorZZgJ0p/KGSnHWO8L27NK6fuC6Q6qIub5si4iaGcEn8ceB8G6hfvbftqW5Eu
	 sFSAFSRoawWOZ1XeDjd8ViuHGDBh4XPXcSUENFh/B+NBkRfkatAeIhlJt35fonx5kxLUW
	 4d7/JQyJKqUl0bXsmh8aY+i9jQJWpbQhCP0QMOyglhtMjrhds0QW9fMDaiBwjHGXRtURC
	 HdfjRUb1M6Wr5RV2VYu6JdXGmHQlPHV+vwg9YJI8FfKwdV0QWHbZSqOjsvHLkMKZ9KIDv
	 WdzneV2bTRZDXnZLjE5SK/cORzntoW7ZchPiGoOl9spaQd7JgmD5C+JYoss80/ohxMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=AatWGr14;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F227C606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F227C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=AatWGr14
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso6898285e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794782731; x=1795387531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GOr05e4sBQgtPWColaaByvA3KE3CX0khn1f+6+vSgZ4=;
        b=AatWGr14KzZxwc2Z0l4MTY5LVwBIFm7TniTPp9oDrlmZmcasvjHGzXaxxX+5IF0CIv
         MRe/plwx5R4zIQKLFXLOcxDmWfFy9xVERl/TyGv7ie8CuOk0NjQ+5ggsW6xcUtlzYgpH
         ZvPkid8BDnHSJEYaB23vIiIgLQTz93ppSIORNSBDQxtzOMSUa4AExaNwAsXlW0i+FXTb
         N/rhn1fZLTUbH+qzhRnkso7hg6Qgexz4QXZnpHmKj4UFghVQjqKdPcr8vKSAhs2BlcVY
         2P1+EiMnSCezLhIt5+tPeFS4iS1j9n7qG9TMzmGBuiGCU/q03qFoCR4HWBc0FYk8ET63
         6CJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794782731; x=1795387531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GOr05e4sBQgtPWColaaByvA3KE3CX0khn1f+6+vSgZ4=;
        b=H+QsgqW75iBO6HQBDnay8ccwQfQJFSFMJMubOG0ziwnv5zhDZwYQY9hfSmHrGXFszR
         L9LkuhnQWEVMdBhse/+XFZYDkQZbpwSj+NR6tvk6/aI9uQWkycj6rW0EvU3Mf+05AoUG
         F2wfKZAdj8RgoZ8M1+OeWts/IoKgLpXG+9miVPBcJgrauCiIF+RB0tsNPa0DuRhljIsR
         2P2c5FfYqzKVF1mObGKq8DgiaH83tClWQM5T+qdp7u8PDMprERuvYFJ5RRlSSzWF07IM
         0z2ezpkovTNI/oiOMPYMd2OJHAdmAXPp2ZhjBcOY5II9/ljJK0REuEresr5Teho07oZt
         t33w==
X-Forwarded-Encrypted: i=1; AL+hErFsn4LHc5z+bZDmvRsoH1hOj8Ywci3nD8LgX6OqurBApkHujqVhKq74tRKXDVe7Z63wBlIY1xacyK/qCq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JPgC3RWiVO62n+cJ15dPwJiNfH0WnKbM65cIaNwo0GnnvbDvU
	CSJDes4rZSpb5ZI/WCPX4gSFGoSqL4avTAaHjlFue0AFF1tufwzwJw4d
X-Gm-Gg: AYBFou1TKJwwgE/tTORe/mZ9usWrnnjjOxP9JLMLeE3in6oGa/hxiO1YS34IP1i4uIL
	nElq5mZ32Ds9cp0NoXpv0VBlZZwVe4oj31shaezxTfrjdanmW8TVhfLOLj5mFw5UQq4yZ9u+o07
	sF+/k5B7a7DANDjgpvZb84TTND/R3/PxazVDNFKAmCc5Sti1Jkpxvfq2RuXiZObbe7qwlTtNsDp
	mSN3lxgY1PvCdNh+CtEFfbRLBdlAYujQtoHnomd6V3/D2NeYoGLkIF+IAhws1yT3AlfzHrXOdsy
	G++1vl804zSh4WdpTOj/+QNMMBfD3uEvA2yi2mg3zFGEffnH1UHzBk/WcBssgdr/f1+3Uwvfu+Y
	9GBr2KtvFD6LJkLHN0+1uoVE2HNQLl2lfAWjowE6/r1b2GIG1Qz5TtCfzk7biSnTjkZQ3huS+NG
	fIExz7fp77RbVbfXBtnVMCTqQ3n+PMJa5KJaHZM0qso8l/HYSHjdvzPbo9J0q/rH/Jswj0ndX6d
	IQAgkru5V8TKnyL7zKYlK/tz+3Gp6mefTF82JK8mng7LDr4u3WFRrOLMLp8UNOYhHeszSBdISVr
	dLWsFxRf4AmJhn4jnrdcIXlClhtDKTm7DrCmIv/RnlY6hWz746QgbMuq3vLPBCgFQdyLwIwlu1X
	y7A4YyZ+6LAqFJVW1GXjfDqsfTbp8XCdzY+HwZkStcqi2GIRta2Wi4nHYayBOKJxuWbNFxOL6cR
	ePfw==
X-Received: by 2002:a05:600c:3b9d:b0:4bb:5dbf:af06 with SMTP id 5b1f17b1804b1-4bb5dbfb103mr167096955e9.9.1794782731226;
        Sun, 15 Nov 2026 14:45:31 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-9c24-a600-021b-21ff-fe38-46c2.310.pool.telefonica.de. [2a02:3100:9c24:a600:21b:21ff:fe38:46c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e0dsm17912227f8f.15.2026.11.15.14.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:45:30 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	hverkuil+cisco@kernel.org,
	birenpandya@gmail.com,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] media: i2c: saa7115: only select SECAM for SECAM-only standard sets
Date: Sun, 15 Nov 2026 23:45:23 +0100
Message-ID: <20261115224523.820853-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.56.1
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

For the SAA7111(A), SAA7113 and GM7113C the chroma standard (CSTD bits
of register 0x0e) is selected in saa711x_set_v4lstd(). Since commit
a9aaec4e83e6 ("V4L/DVB (5408): Fix SECAM handling on saa7115") SECAM
is chosen as soon as the requested set contains any SECAM standard,
even if the set also contains PAL or NTSC standards.

Such mixed sets are passed to the driver in normal use: for these chips
saa711x_querystd() can only determine the number of lines, so on a
625-line signal VIDIOC_QUERYSTD returns all of V4L2_STD_625_50 (PAL,
PAL-N, PAL-Nc and SECAM). An application which sets the detected
standard (v4l2-ctl does this before streaming) then gets SECAM decoding
of a PAL signal. On an SAA7113 this results in a picture without
colour (U and V are a constant 128) and RDCAP in status byte 2 is
cleared, so saa711x_g_input_status() reports V4L2_IN_ST_NO_SIGNAL even
though the decoder is locked to the signal.

The intention of the original change was most likely that a single
SECAM variant (for example V4L2_STD_SECAM_L) selects SECAM as well, not
only the whole V4L2_STD_SECAM group. Keep that, but only select SECAM
when the set consists of SECAM standards only. For 625-line sets this
is the same condition the saa7127 driver uses for its SECAM
configuration, and for the sets applications pass in practice
(VIDIOC_QUERYSTD results, V4L2_STD_ALL or single standards) it gives
the same result as other decoder drivers such as tvp5150 and adv7180,
which test for SECAM only after PAL and NTSC.

Mixed sets now keep CSTD = 000 (PAL BGDHI for 50 Hz, NTSC M for 60 Hz),
which matches the behaviour before that commit. This also stops the
driver from programming CSTD = 101 for 60 Hz when a set such as
V4L2_STD_ALL is requested, which is reserved on the SAA7113 and selects
PAL 4.43 on the SAA7111A.

While here, document CSTD = 101 in the table above the code and add a
comment that CSTD = 000 is used when none of the cases match. CSTD = 101
is listed in table 42 ("Chrominance control subaddress 0Eh") of the
SAA7113H data sheet (Rev. 02, 9 May 2005) and in table 26 ("Chrominance
control SA0E") of the SAA7111A data sheet (1998 May 15).

Link: https://www.mouser.lt/datasheet/2/302/SAA7113H_2-87651.pdf
Link: https://www.eecg.toronto.edu/~tm4/SAA7111A_4.pdf
Fixes: a9aaec4e83e6 ("V4L/DVB (5408): Fix SECAM handling on saa7115")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/media/i2c/saa7115.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index f4015f11367b..a33487d37d08 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -1007,11 +1007,16 @@ static void saa711x_set_v4lstd(struct v4l2_subdev *sd, v4l2_std_id std)
 	010 Combination-PAL N (3.58MHz) NTSC 4.43 (60 Hz)
 	011 NTSC N (3.58MHz)            PAL M (3.58MHz)
 	100 reserved                    NTSC-Japan (3.58MHz)
+	101 SECAM (50 Hz)               reserved (SAA7111A: PAL 4.43)
 	*/
 	if (state->ident <= SAA7113 ||
 	    state->ident == GM7113C) {
 		u8 reg = saa711x_read(sd, R_0E_CHROMA_CNTL_1) & 0x8f;
 
+		/*
+		 * CSTD is cleared above, so it is 000 (PAL BGDHI for 50 Hz,
+		 * NTSC M for 60 Hz) unless one of the cases below matches.
+		 */
 		if (std == V4L2_STD_PAL_M) {
 			reg |= 0x30;
 		} else if (std == V4L2_STD_PAL_Nc) {
@@ -1020,7 +1025,8 @@ static void saa711x_set_v4lstd(struct v4l2_subdev *sd, v4l2_std_id std)
 			reg |= 0x10;
 		} else if (std == V4L2_STD_NTSC_M_JP) {
 			reg |= 0x40;
-		} else if (std & V4L2_STD_SECAM) {
+		} else if ((std & V4L2_STD_SECAM) &&
+			   !(std & ~V4L2_STD_SECAM)) {
 			reg |= 0x50;
 		}
 		saa711x_write(sd, R_0E_CHROMA_CNTL_1, reg);
-- 
2.56.1

