Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B4947DF94
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 16:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791044130; cv=none; b=ET+KnxoJgFwDJfNbXFm1OOHeEb4Mfy4ffTuRIu21b34R7ogSxY88MJJGBQmIYvf6MIJNaN4oLw52KS2p3etukrVPaq8DCSqKD8ULpwZSMYkIUowJmmWeFtDStHe0c6mi1MRoZpqlXU6xxd/9r4akxexErUB1xQFZP2BXdaUI1T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791044130; c=relaxed/simple;
	bh=bxisQsgFDxVcPmRAf2hDN2l4UAGPTaJHRCBSnoTYF8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m8vVUIbwWz716/BDOL7TRgaEVCFzAFpUTpE7cGfRyt1XLW+8mVVTU034ZDWtux20/mkmx2kv7FK7unl1RnnDuaVPYxnrGsjVsZCkMAGt1i9NvL80e/4VFDqVN+GLE8A4i8FDrLbjjPuBHL0kYNkZ4qcYPBFBYMgb4WKVh3oYEh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRGb9ZGx; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRGb9ZGx"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398a5aad413so236851a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791044128; x=1791648928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u4MTgteFvYBViboMc4I1zLfVHFmkPVniNSEl6gM5tLg=;
        b=ZRGb9ZGxEIjiLbvPT0Y9KtSw79gTMBDgwwxLUNXSKAS/UOnmLimfP6Zzzu1vdgee1d
         6U4fFSsBVsBFzqg7rc15Y9+zJEuUD/dwHJFAFjxk+pAZeLWVOj2ak7Hv2RpuhI0LSZZo
         AVQFe84QYmWy32jcM3s5g6Ucsu35AuhHiGO3NW3P3K5jeJyfCbGweI+beyDteJdSex7m
         AqQ0GBYaKYZc6UhbeqBy52VEw41mnWNmG2M/T1dgTkuH5DJarZ5/iNAvZm4KEqp0IJGz
         +lilYT5qgUterLGOZxNkZAxDAQHtxSUnuNbdYTjf0vSrOKSXDtpovJpy9t+nE7ebJIx1
         IJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791044128; x=1791648928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u4MTgteFvYBViboMc4I1zLfVHFmkPVniNSEl6gM5tLg=;
        b=FEB5p+/qJBTnszDVlIiBLCF+H2kCrha34XTEWCaV2o/sFTIOWCju/2/J5uEOWp+Ty3
         MQZMTojsmYdUhM92MBuV286JW+aC8P8HXp3Vcry2S3dK1aRgkkckywbt7l9dN5oSbw1f
         evqaFtdE4DfJtI6ytkieBfM+2Ve58VNN8B55Z45ihYP4UsMS4xjDH5/LbqlLlA+gfeVj
         IhPmkQWvdpue1olZEj+uk109qy+1HoSoMFeHb692i8lf6x8uXbmuUeM8NfKuP06kkZfG
         7/9aBiJ5BNSp5gBem28FugobqGH+/ajA8X+E95/N6LadoGk9ygdoY0ccB55iItFejUJo
         GUnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrj7kGl/tYeSgewRjHvNQtEPk3pY+LRB1cIEX1CX3hI6uDAUw+eTbaN/+hlQz4lYSDatzhUtrM2Xbaxzo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI51po3IU78NB9UzLp6uGBhzeRBEDbAJwX9E5HmGUFgaHXB7l2H
	ytIL+MAJf6MrpgLkJzxIpAJ/MGNXu6QKH3k6b8G3eBSvXJP0r7WpqHKWWxXZrHQS
X-Gm-Gg: AYBFou0md2SYOwRoU/cPx9raqPxc9pbFRdQiJyYd2mt5+YsB+qpkgNEbSU2EmpuBVEs
	CbduGCNQ5ZA0Jhvx9dZSwPnl924erFnjjXwtqp8D7Qh7q/vPH14q9HgPjAD06xstYGU+CksAn6S
	4kanVewsJ0wuS6AxRqRQm0OBlt6i/b8RDKbqJzyWexUXuVJcrkjvgq9ihRvHBy/oInfpIys4Sdc
	kEtV+AUi5eVYK5xfAWJb36HbUPx5ENjmqfpit17waXhSbRfamdF4SI4bANVdMrv6B+/oApuGXGT
	5+bfJZ7ybr5CqlHNwC9q7CLgoO763Cm+PvaFLgzdeWVlmTGxMI2pY4FTLaashtpMDVOdY9d/D7f
	dxmJT/1E7oYsbtS1+H0rLs9Odxk70oaTfWnVUoPtvkpldmq+WTXJ5KfQCpsuOMYCvSTyJElPFxE
	hWgQgmjsdedYotJHCEsB7DiZAcAL/1rXjc/FPg+6h5W6LhyZoLympSoPgEMfFUPay/61smlJ8eH
	w==
X-Received: by 2002:a17:90b:1d43:b0:39d:fcbe:fe04 with SMTP id 98e67ed59e1d1-3a78675860emr1921461a91.2.1791044128127;
        Sat, 03 Oct 2026 09:15:28 -0700 (PDT)
Received: from DPBox ([82.152.91.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4262f0sm3778648a91.4.2026.10.03.09.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:15:27 -0700 (PDT)
From: DemonPlayer <a18165943161@gmail.com>
To: linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org,
	DemonPlayer <a18165943161@gmail.com>
Subject: [PATCH] HID: apple: Add GANSS GS3104T PRO to the non-Apple keyboard list
Date: Sun,  4 Oct 2026 00:15:08 +0800
Message-ID: <20261003161508.22671-1-a18165943161@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GANSS GS3104T PRO is a tri-mode mechanical keyboard that reports
Apple's vendor and product IDs (05ac:024f) over USB, over its 2.4 GHz
receiver and over Bluetooth, so that macOS recognises it without a
vendor driver.  hid->name is built from the product string only and it
differs per connection mode:

  USB:        "HFD GS3104T PRO"   (iManufacturer is "HFD")
  2.4 GHz:    "GS3104T-PRO 2.4G"  (no iManufacturer)
  Bluetooth:  "GS3104T PRO"

All three descriptors carry the Apple Fn key usage (Usage Page 0xFF00,
Usage 0x03), so hid-apple claims the device in every mode and applies
the Apple function key layout: with the default fnmode=3,
hidinput_apple_event() resolves real_fnmode to 1 (fkeyslast), so the
F-row sends the media keys and Fn has to be held down to get F1-F12.
That is not the behaviour the keyboard has on other operating systems.

hid-apple already keeps a list of such keyboards and switches them to
the fnmode=2 (fkeysfirst) behaviour, but the match is a case-sensitive
strncmp() prefix test against hid->name and none of the three names
matches an existing entry: the "GANSS" one misses because the brand does
not appear in any of the descriptors, and "hfd.cn" does not match
either.  The non-Apple handling is thus never enabled and users have to
pass hid_apple.fnmode=2 on the kernel command line to get the expected
default.

Add all three names to non_apple_keyboards[].

Signed-off-by: DemonPlayer <a18165943161@gmail.com>
---
 drivers/hid/hid-apple.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index f6134c5..75092ee 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -373,6 +373,9 @@ static const struct apple_non_apple_keyboard non_apple_keyboards[] = {
 	{ "2.4G Wireless Receiver" },	/* EPOMAKER TH87 dongle */
 	{ "Thock TKL Wireless" },	/* ENDORFY THOCK TKL BT mode */
 	{ "USB Dongle" },		/* ENDORFY THOCK TKL dongle */
+	{ "HFD GS3104T PRO" },		/* GANSS GS3104T PRO USB mode */
+	{ "GS3104T-PRO 2.4G" },		/* GANSS GS3104T PRO 2.4G dongle */
+	{ "GS3104T PRO" },		/* GANSS GS3104T PRO Bluetooth */
 };
 
 static bool apple_is_non_apple_keyboard(struct hid_device *hdev)
-- 
2.56.0

