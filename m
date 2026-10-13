Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51923D7D64
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888039; cv=none; b=UKCvLKFwAi8YejllPBm2Ih5lFLMaD9otqzOlN4TNRgys0Bhl2pINpzZt4AmcG8vLWcKVvNI/X2WpDI6lxsST6ARnk98unXiMKjMrLnrEn5fD0ZAf+JyL6KUv5oeovpTZixyyUQM6Z0FbkWiZqdBEzhNttVgtW25nu3+FhKiwPUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888039; c=relaxed/simple;
	bh=0fzWyAy/nfhnOtEhk+RqCh8SWnJzy8Q8sfxOeIbh9H8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hAy21afcKm0nJEu5wNo8M51UIt2NfAy9hPuRBRKW9mFZBYfEeCiF9hydpJKPovjYeyzMoY0jtjMp928chdxyW6KnmJa18fJ0Aes5vLY2D/jy1dFg8LRzqJ7CpESaTZtuS1xN5Z2j4EJ6gE4rIZXBBGSQ0jq9bYGSkRu1bZp2y0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXbAEoY6; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXbAEoY6"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so25448585e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791888036; x=1792492836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gONIKQ4rX9ITqHiZzYiyq+xmnMFwrf3i6s0S4mlLaM4=;
        b=HXbAEoY6gXiXFR8ZrN73wDY1VKGJfZqLp4LcAMWj8oY3NTO+l7SgUyJVWnN1D3eotK
         bevjTfe9p7E8PIQCdNy/KLcb54sGNdrJqen1wK7m2kII7o9OMe3OKWbHnY6eiIN23XQ5
         hG/hFfZBQu2OfnR0x9Thki9HZWxPW7WkM8aHoQiOx19rAkNzclCFtcoVq3w8m14d/gAG
         C5gzeIa16IiqT2dagQ+Iq/AoTRrraa/GY9obnszYmkklO3UPF2c/KiFu0KUyjaGN/Lkv
         o4jCWWevSqMZ4tz8jyoUZj6cLgxNa/qWosuoU4nmtTiLeQP2aK8O5pqfitTKfUmfk53d
         608Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888036; x=1792492836;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gONIKQ4rX9ITqHiZzYiyq+xmnMFwrf3i6s0S4mlLaM4=;
        b=Pmr/tTsOaaNrCH8qOia2XCIvR9aj8l/I4AZ+/qho0rlc6+5JuztK5QNTSSAaTSPymd
         Ej7WFHlRuaQuufkqvWsE1C7lJxxvc9NwBW1D7Po0su4RAxbg1i2PhABGWdbea9ScQesI
         KNYZF/Ky4qEash/VrzNLZkhmtjBxAxBs4/ZFDBR1ePstQGeq28vr1UbT/dGO3V2CN9iK
         7jNx47+aQs1RQmVQdcUcflddv2PXDFQrFjFFQaRLimnjSYuUmFiutX4YSzw2A+74K5ZN
         7U1t11XgOFTcm9bjG8yKyJxV3NxG+eppHpcuwZJi8SANAIzEHLUcGimMLOk0kzqbvtVk
         SgOg==
X-Forwarded-Encrypted: i=1; AKwUvBzSZiIeO50He9JqxAKqcXV/7ztyr6vhhpstDp+Iao/OUOTPA9gq1jzJY+r++HxWgOkVTGRFfrdJUioyeWQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIP9keLSPf2XKms1Z6w2uKLrEdkx/W87GsxAzf30WlNI25I/7M
	WoPXollvNpedxex2urPTZyoQwdbNSGToMI0P9EYlrTqnYlrdrW6dD2nj
X-Gm-Gg: AYBFou1G57+swJx4kPWQSN4oD7XmQcyLN9MHnUQTh06bZBzsrLnlagCtfteM9SH1yk8
	u2gYaTsY2ZX2TikF+3MOkiHr3kigPek1O4J12CUVQlfZVoeujeFe6szb1WKpat3nFSbk/XkTHtK
	OqOQlhK6RYX1AvS96TMlpMy9TheomEFgtMIXBpL7zrYzdO9trgK7Md0AFnWbF3qprnW+S2WtQ8v
	XRvh7zXE2FlXMwkOB+xMlWPYve7KmzLM8i+sWBemBrwDq1Ebc29m6psg5/SW4IsKJyx7xxWn1cA
	rXErdV+4w6NGOuj5YPCh9iTvNYIaEe8NolQGIaBvW7JsdNJ7Ujpp+D0gvfCwHvQcdLJBV78ghGB
	r86l+ZEoCJ3sbdEBVpAi1joKhsbjCf6Ax2RP5fOnp5Iv66GH0RQDTRL+7hbJ4eD97uZWTy9uuwy
	eIxSgY5w0Kb3CxpRVL6xkB4oVHY3+725KqrK1z3iahRN0x/WfuvMVynSaEUW8fU1CRMnoQEi1bE
	iU45PvoUZFuRvwxRbRgl3buBRPVplQ0L1n4lZrm6AulnLNEZXsDdvt1BA==
X-Received: by 2002:a05:600c:3ba8:b0:4a0:174:579e with SMTP id 5b1f17b1804b1-4a18e4ab221mr274320445e9.28.1791888035627;
        Tue, 13 Oct 2026 03:40:35 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:e22b:cb88:4091:8aab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19471edd5sm455396445e9.11.2026.10.13.03.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:40:35 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Joshua Leivenzon <hacker1024@users.sourceforge.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luke Jones <luke@ljones.dev>,
	Ivan Levchenko <me@livan.pro>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v3 1/7] HID: asus: Fix up Zenbook Duo report descriptors
Date: Tue, 13 Oct 2026 12:39:58 +0200
Message-ID: <20261013104033.36079-2-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013104033.36079-1-p.pisati@gmail.com>
References: <20261013104033.36079-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Joshua Leivenzon <hacker1024@users.sourceforge.net>

The Zenbook Duo keyboards (UX8406MA, UX8406CA, UX8407AA) ship the same
broken vendor hotkey collection as the T100CHI/T90CHI keyboard docks:
the Input item of report 0x5a is preceded by a single Usage (76h)
instead of a Usage Minimum/Maximum range, so none of the hotkey codes
get mapped and every key press logs

  Unmapped Asus vendor usagepage code 0x76

Extend the T100CHI/T90CHI fixup to the Zenbook Duo: the descriptor is
90 bytes long with the bogus usage at offset 66 on the USB hotkey
interface, and 257 bytes long with the usage at offset 176 over
Bluetooth.

The dock fixup only moves the 12 bytes between the usage and the End
Collection item, as nothing but a bogus trailing 0 byte follows them.
That is not true of the Zenbook Duo: the collection goes on with a 15
byte feature report (also ID 0x5a) after the Input item, and over
Bluetooth a further collection follows it, which a 12 byte move
corrupts, leaving stray 0 bytes at the end. Move everything after the
usage instead, after dropping any trailing 0 bytes, and allocate the
two bytes the usage range adds. The result for the T100CHI/T90CHI is
unchanged.

Signed-off-by: Joshua Leivenzon <hacker1024@users.sourceforge.net>
[pisati: fold the USB offsets and the padding removal into this patch,
 bound the padding removal, move the whole tail of the descriptor, and
 end the branch chain with a plain else so clang does not warn that
 rsize_orig may be uninitialized]
Assisted-by: LLM
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
Tested-by: Rebecca Mara Müller <rebecca.mara@posteo.de> # UX8407AA
---
 drivers/hid/hid-asus.c | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index bd46aba6622a..34739198d90e 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -100,6 +100,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define QUIRK_ROG_ALLY_XPAD		BIT(13)
 #define QUIRK_HID_FN_LOCK		BIT(14)
 #define QUIRK_FILTER_CAMERA_COMPANION	BIT(15)
+#define QUIRK_ZENBOOK_DUO_KEYBOARD	BIT(16)
 
 #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
 						 QUIRK_NO_INIT_REPORTS | \
@@ -1579,43 +1580,56 @@ static const __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		hid_info(hdev, "Fixing up Asus T100 keyb report descriptor\n");
 		rdesc[74] &= ~HID_MAIN_ITEM_CONSTANT;
 	}
-	/* For the T100CHI/T90CHI keyboard dock */
-	if (drvdata->quirks & (QUIRK_T100CHI | QUIRK_T90CHI)) {
+	/* For the T100CHI/T90CHI keyboard dock and Zenbook Duo keyboards */
+	if (drvdata->quirks & (QUIRK_T100CHI | QUIRK_T90CHI | QUIRK_ZENBOOK_DUO_KEYBOARD)) {
 		int rsize_orig;
 		int offs;
 
 		if (drvdata->quirks & QUIRK_T100CHI) {
 			rsize_orig = 403;
 			offs = 388;
-		} else {
+		} else if (drvdata->quirks & QUIRK_T90CHI) {
 			rsize_orig = 306;
 			offs = 291;
+		} else if (hid_is_usb(hdev)) { /* QUIRK_ZENBOOK_DUO_KEYBOARD */
+			rsize_orig = 90;
+			offs = 66;
+		} else { /* QUIRK_ZENBOOK_DUO_KEYBOARD over Bluetooth */
+			rsize_orig = 257;
+			offs = 176;
 		}
 
 		/*
 		 * Change Usage (76h) to Usage Minimum (00h), Usage Maximum
-		 * (FFh) and clear the flags in the Input() byte.
-		 * Note the descriptor has a bogus 0 byte at the end so we
-		 * only need 1 extra byte.
+		 * (FFh) and clear the flags in the Input() byte, shifting
+		 * the rest of the descriptor by the 2 bytes that adds. Drop
+		 * the bogus 0 bytes some descriptors end with first, but
+		 * never the Input() item that follows the usage.
 		 */
 		if (*rsize == rsize_orig &&
 			rdesc[offs] == 0x09 && rdesc[offs + 1] == 0x76) {
+			unsigned int new_rsize = rsize_orig;
 			__u8 *new_rdesc;
 
-			new_rdesc = devm_kzalloc(&hdev->dev, rsize_orig + 1,
+			while (new_rsize > offs + 14 && rdesc[new_rsize - 1] == 0)
+				--new_rsize;
+
+			new_rdesc = devm_kzalloc(&hdev->dev, new_rsize + 2,
 						 GFP_KERNEL);
 			if (!new_rdesc)
 				return rdesc;
 
 			hid_info(hdev, "Fixing up %s keyb report descriptor\n",
-				drvdata->quirks & QUIRK_T100CHI ?
-				"T100CHI" : "T90CHI");
+				drvdata->quirks & QUIRK_T100CHI ? "T100CHI" :
+				drvdata->quirks & QUIRK_T90CHI ? "T90CHI" :
+				"Zenbook Duo");
 
-			memcpy(new_rdesc, rdesc, rsize_orig);
-			*rsize = rsize_orig + 1;
+			memcpy(new_rdesc, rdesc, new_rsize);
+			*rsize = new_rsize + 2;
 			rdesc = new_rdesc;
 
-			memmove(rdesc + offs + 4, rdesc + offs + 2, 12);
+			memmove(rdesc + offs + 4, rdesc + offs + 2,
+				new_rsize - (offs + 2));
 			rdesc[offs] = 0x19;
 			rdesc[offs + 1] = 0x00;
 			rdesc[offs + 2] = 0x29;
-- 
2.43.0

