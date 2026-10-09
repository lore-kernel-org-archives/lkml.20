Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60D33D3CE5
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 05:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791522303; cv=none; b=NE1dS8ByGSGTLwkTZqf7PX8Rj8zSbcLPtFuIhcfTgpKST9pIMaO07szLIZ/5iHhdp4c9zqG1QqFehuQC5/Z0ziHMgSzuiisRdXAQM/5UXUP31COrnGf/B8mdnjT3seB+YTf1wk8k4G8cKzgyZEA6wsMm7PuiQkFkaKYY/QQVYnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791522303; c=relaxed/simple;
	bh=bZxLCwanPVCt7fTYXMHOHM3p9tdM8lOdphND76v9MSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qZSHDxxgoEEftPXWxotD9nGl79FxOhe8hYt1aFZRsv9bR+vSmxgS/EQR+e+uWyX/SdIdDNmTgAcl8Ne/3MLgJ70Pwx1BesdUlbCOy+arxwkmBm9q3qzxa3z3/r16Ctu69B0UHwX/6rk91fmjAqRtuWnmpVvtCE+R8uSFmJPNW2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/JPCTbC; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/JPCTbC"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3115c4451c8so5151694eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 22:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791522301; x=1792127101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9nzcEWRTzfm59zGLMlJVKe3ebiLwVSDP7QGjSAIGyLc=;
        b=T/JPCTbCGBeEZSIuFSJ8QazTGIEwZSGQe9k0Pai3pptJe81vZaJYjgxaqL1SzPdVSa
         UDJFILO1UZrYGx6yFSRMXu52fmydk+PpB2VRCYNhneUItdUDmSwJt2r4cTleL+12hIbR
         briBNtg3O5uHDjywk7rxWQ+fSH8FArSt3hCIn4oFeDe/45G6H9+kYM7Axlv7CwTxDCuu
         wyWzwGImUsZgW07m5VugqA1mP+4iSN1PRYFbj4DTy5z+vLgdNVrb0D0/clAsj8HisjL5
         dQ02IbnnTZXDY1eFIa23L+W04aUB/8GPq5EqcM+d8fKxdca6ESZK+AehgNPKrOYcL+Ch
         GQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791522301; x=1792127101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nzcEWRTzfm59zGLMlJVKe3ebiLwVSDP7QGjSAIGyLc=;
        b=kShWMwN2q485puX4Cl7efFoCqgSHdIH9eE++MLx3hI+LXEbWC64D5AWLGH1Z7ibYgo
         mOx1nyBBuQQtQoWj90Nnnda0pwQExm1omQ//gbxNCs5KMIsYJDU+KLj5+/6Wf7sw1aRM
         B1YVBxg06KHCgYQd4f8tqhxhGkNJy4ebr4y6ib6JP6fomCIagqpK0QKF56Ajy0Zn1CLG
         LIX0HBZGELjmL65dFFLkLkgxz2/c442N6GfePylv1GLuFBRLwEskoij8BjhXWw9riaZs
         nfylwu9RUVg5GPuqyNjga6cQDPCamTMDC+8RSbFF+oMv6n30sRh1m+yHJg2FLid9RQ4r
         Qrfg==
X-Forwarded-Encrypted: i=1; AKwUvBwkoD4f92B9sk90+iphcoI8eu0MPmfOjP3IiI0W3CUtxA7GIYDAMcrWz6D29hqV7hAAHzRth6TSXku55wk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+GemaTbAo5Knv1ofY1rU7DSSrasIBw104NKo5r+NIA0YYdVJL
	H2CRakaZG+tcLZi9am0RurY86ci5BFRwD6/5U/AHSmJBWOOP6b9yJzEI
X-Gm-Gg: AYBFou2v0UZQtVDIik7ihBp52D5PRBT6Qvm4HLMrEqOzAG7yi//jLKNlpZRTjLNfNOe
	PFqg0GF+VLzLtlu3OnbEF8E0BVeYPmixjr7Z3pvf25g/i4lyigPVgR4tyWy7uherjWqnw8dgeE+
	+U4lOcN0iWMAXL1mF1Syvou6JjS3upRNTRkKbMR71ywur7a8sx7fQjN8/qHQrzvrUBoXrKJgb55
	uVolYC4etzLALo3+y87H8ZWkxW9ylVvOjayNma2V8W+qZJ6BVkuG6TMM5YU9M7nsb6Ln96RExWy
	AAKFtwnWwpMshGMzQPiD662dc2bxGaE8MmfqGRZAYyhayjzH8IRVTwDP6HKPBolHEW2yM4RYmKo
	cRj6+DdD3mCydMRViPU9iNJEwyjEYI+y5KjCQqBLibGgyS5vz2tQnDtfjr46qNTwPocVxxTs/Fl
	NJ7TxGJX8ZqyLCpkkJf/BLEzUpXFxXTrdp8EcDbkwL8/8zYJgx+me3f9jQOZx3H7NpL6Rtg/sWQ
	ISOUanA
X-Received: by 2002:a05:7301:190a:b0:33b:ecf4:7f80 with SMTP id 5a478bee46e88-3536c5e54a0mr1837405eec.22.1791522300872;
        Thu, 08 Oct 2026 22:05:00 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca6d20dsm3416926eec.12.2026.10.08.22.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 22:05:00 -0700 (PDT)
From: Priyanka Mani <priyankamani2100@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+baf3cbba7dd980984f0d@syzkaller.appspotmail.com
Subject: [PATCH] ihex: reject firmware images smaller than a single record
Date: Fri,  9 Oct 2026 05:03:30 +0000
Message-ID: <10da8e7f7c7070fc9a9da1d274b78f1d3f379703.1791521373.git.priyankamani2100@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ihex_validate_fw() computes the end of the record area as

	end = (const void *)&fw->data[fw->size - sizeof(*end)];

Both fw->size and sizeof(*end) are size_t, so when the firmware image
is smaller than a single struct ihex_binrec (6 bytes) the subtraction
wraps around. 'end' then points far beyond the buffer, the

	for (; rec <= end; rec = __ihex_next_binrec(rec))

loop condition is satisfied, and the body dereferences 'rec' while
walking records that do not exist.

This is trivially reachable from userspace via the sysfs firmware
fallback: loading an empty image (write "1" then "0" to .../loading
without writing any data) leaves fw->size == 0 and fw->data == NULL, so
the first ihex_binrec_size() reads rec->len at NULL + 4:

  Oops: general protection fault, probably for non-canonical address ...
  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  RIP: 0010:ihex_binrec_size include/linux/ihex.h:26 [inline]
  RIP: 0010:__ihex_next_binrec include/linux/ihex.h:35 [inline]
  RIP: 0010:ihex_validate_fw include/linux/ihex.h:54 [inline]
  RIP: 0010:request_ihex_firmware include/linux/ihex.h:74 [inline]
  RIP: 0010:emi26_load_firmware drivers/usb/misc/emi26.c:86 [inline]
  RIP: 0010:emi26_probe+0x283/0x1690 drivers/usb/misc/emi26.c:232

A valid ihex image must contain at least the mandatory zero-length
terminating record, so anything smaller than sizeof(struct ihex_binrec)
cannot be valid. Reject it up front before the wrapping subtraction.

Fixes: f1485f3deb89 ("ihex: request_ihex_firmware() function to load and validate firmware")
Reported-by: syzbot+baf3cbba7dd980984f0d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=baf3cbba7dd980984f0d
Signed-off-by: Priyanka Mani <priyankamani2100@gmail.com>
---
 include/linux/ihex.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/ihex.h b/include/linux/ihex.h
index b824877e6d1b..61f1df4f7819 100644
--- a/include/linux/ihex.h
+++ b/include/linux/ihex.h
@@ -48,6 +48,16 @@ static inline int ihex_validate_fw(const struct firmware *fw)
 {
 	const struct ihex_binrec *end, *rec;
 
+	/*
+	 * The firmware must be large enough to hold at least the mandatory
+	 * zero-length terminating record. Without this check a short (e.g.
+	 * empty) image makes the fw->size - sizeof(*end) subtraction below
+	 * wrap around, yielding a bogus 'end' pointer and an out-of-bounds
+	 * walk over the records.
+	 */
+	if (fw->size < sizeof(*end))
+		return -EINVAL;
+
 	rec = (const void *)fw->data;
 	end = (const void *)&fw->data[fw->size - sizeof(*end)];
 
-- 
2.43.0

