Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E15A4915AA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949760; cv=pass; b=FEEZEazNR9SvSJovBJx1+JIKI4v34CusoI2uz6p3zlz1AC8ssdXsFgBqk3vjTAPstXxAgazSHzZVXAjGMfakXTKNwvPEFoCP7Xuo+PnXuwqhw3jM9KWqj6z6gfnsQutxECw5pRS4vfMAW/EiGMLwhiwraKgRstP9HLDzmLcH4Nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949760; c=relaxed/simple;
	bh=J47IYNdod02F1g3+6k0lLJqlTKfvKgWjoiv7iAB14FM=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MVBc/cRCJljkjzYvlhn2X4LIiiDuzJCrfhmunA2c0I2lQ29t4KfyZK96eXtq1hiwRlpTs2fFm0eIXlQlZMARWdJBhO09rwjzksXlMfnuVXERJ0bH+G9jS5COGL5T+9BC7SEBEmwSTzSW/9DdwV2D5aNcQBn57xkAZNg+BAqG3dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YP4f0z/E; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YP4f0z/E"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b1a4faso851347e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788949757; cv=none;
        d=google.com; s=arc-20260327;
        b=OnLhWMCnwG5mjvyj0+EuuzfAB0oedl0X/yxU7TqieBBSPP2YVek5SoRDmiByBROSq+
         ynMZU1PfAMW1b8RptbGDks7vLdzPTghrCY39Nj89I1vG+asBvZJ5ZBFl70VEUT1vjM1W
         rNKR2juNm6NSuvKD5ibOrPdZLKQSqtcAxqEmlu4v/63lO5otshq6vL+bAaQSgzDPJ4jI
         5bMl+nOeZEmLXXD033KX1qd4ney9wtYkfhlFmQg/JNRjEXzx/tJ0u9DV0ls5TyF+EJJ3
         FKKyOe4j6KBe9LXZe3JGQpBeC6yBQK0wEyjHQ4jFrrwYGVgBsqm4/cKTw7sK08J8U9Rn
         CsmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=iQJPNUSAFJ7E51M7cx5Rfc6me1C9+bNgv9Pw72X8t8U=;
        fh=k9E1zTCzJxoNSijvRTW+ywciTMkc/UFMO6tgOzsyMhU=;
        b=qt+O7M31aoT8P3qxWTXVYO7gARTLVoiyxXYxQqOQ7SkdKQtLkslIcG69Ct+4S/1fpS
         5r4/Il+VeChyx9lbSyzqF1bztE4szfYqbYGu+XEXzqFdsTOt7aJ/AgKRG1pRdSiPGljm
         67pLqLMnBB5ijZZ/uCWnK7vATJ2RqUYi//mpy+cLI/HSufnOv6d0eb/FW3ZcNfujGAbs
         II7UR8bYVBVtv3YVA2ivCJnXa3z+jieKNSLggKjb0AfKBERUPiU78liQDzmIyEbj39bQ
         3WzCSY8cl6HWvlwkd+v0W0mN71M/lykcDO/wk8NmcECKUycFzTY9CDLO2qNpVx648RBj
         IOzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788949757; x=1789554557; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iQJPNUSAFJ7E51M7cx5Rfc6me1C9+bNgv9Pw72X8t8U=;
        b=YP4f0z/E6eLq4kQfmp972b7VY4bTV5GtF+OLZVNVzQslxADC0zMP60hWxK1B70riyx
         beAi0Jf99TPbCQf9VUKWWQTn5ZasNphK78s4jIj0PQEH1hOOcDi3PITQp9kGO6fUOmMA
         OHaPRnbp2FoDVbjunKB0qAY8LFXow6D0Th7keMmHlhFdigmDtHmmj9wv8SMzUXdl1khG
         6z3fUrxlU8Q658QOBlxXS/e32WbMSwozywL4ByZii7pu2k1yv5Bi+bNEvd6Xgdbo0sRL
         WLEUW2NZPeGV581EC8KHeQ/5Cb4IlBqK9ZZWNXAH7pXU9dSSXBYm8rg9uHOu3+0d+XSZ
         eG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788949757; x=1789554557;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iQJPNUSAFJ7E51M7cx5Rfc6me1C9+bNgv9Pw72X8t8U=;
        b=rBCxVpms9jgrL325sooINCTZ8uaT0kdqn2Fu5E/16s4q2TVCrWNqBVtCWNetpKHNva
         RQf7IT7LWjGtS1lxeMxc4iI2H5u3RdSFoRayFoiSfstdJtF0sL8kXZKWkYR7VKfaGG3B
         lZKEG1EXGK9bSbFj8uF/SHNI+4Bgiy9N9GFGwmfENf5RHYgWFLpTt6fQ6Ukdhg1wju0b
         Z+izXFX9Tt9xCjF/SaSrxTjdA6Sr0O6sz/LrcTRoc25ea4Nj38KY2L0YfX+qGZ489UH/
         M/PSwEcaTYmD5uUnSsZuCqQOgnNta3EtjUHWdSMa6cgbB1HVxDCSIV70Lo/1bg8QOxcH
         PUDg==
X-Forwarded-Encrypted: i=1; AKwUvBzmcKJlM8gfeT4PmqNEBLHqAlgTjN6w0UYBa8fZczJlU+y7LJNvHLFLAGGsGzIRRLg+ueSu0HCXE0EjECw=@vger.kernel.org
X-Gm-Message-State: AFuF++lb9MteoEMLhds6IGQjzSDcOHQLqCtDcyqQZ0TK3T48ZkGJHUq2
	JLTUTxddhj00AH7tSbZusXgAvHQbR+6Zba/2Q48sWgjmX3+Z3X6sDehK3tSZP12zVg9ropmu/wC
	MCZIb/dJO/Pq94UhayVJee7eeVyDu+ulGaZiO
X-Gm-Gg: AYBFou0DrOTIK47S1+NauVR9BnyV2Q3KxcAy1delFRfziYa2epA2ze8NhiNpnnBwvVq
	L/2V8tzLffhOltprSeCwI2QdSFEQ7/kuG+QtDo6mJ4g1nnfrHSusMeGy6Vgudj49ObZR75q1egF
	6+qv8Xs9olLexfKHygVlFENOZ7odr7Zky86koRHu9iiE7nbb8h3gGSvkvyXb2Qla5lVL6Cma+Y7
	8/8SKV4U0zNa9fPzu6K2vIMhUFS5MVvFfaK/euEhczq2XHa4wEGCZfhC2ka0GAi/5+eKpyVStBE
	+r2eDjd8j41+/YdtPHG2meDLRgDEe9I7O3jnz30dTHqg0xVOG/qz4saFClQv+mzqV6gNFwn6xcW
	mAdzH6M0VPw0i9ZvfS51nnohdRBiuR3HXyRVuIQUC4z5dpVtHM08=
X-Received: by 2002:a05:6512:12d1:b0:5b5:e5ff:24e with SMTP id
 2adb3069b0e04-5b74d50c8femr4903174e87.4.1788949756789; Wed, 09 Sep 2026
 03:29:16 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 05:29:14 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 05:29:14 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CABKbRoKwKz+01bBMU_tq55aUQd5ao613v5n=M4zRjcc+j6=HkA@mail.gmail.com>
References: <20260907185001.1567957-1-miguelgarciaroman8@gmail.com>
 <2026090833-mutt-whiny-242e@gregkh> <CABKbRoKwKz+01bBMU_tq55aUQd5ao613v5n=M4zRjcc+j6=HkA@mail.gmail.com>
From: =?UTF-8?B?TWlndWVsIEdhcmPDrWEgUm9tw6Fu?= <miguelgarciaroman8@gmail.com>
Date: Wed, 9 Sep 2026 05:29:14 -0500
X-Gm-Features: AcwNN1WKeRmXgfYzAnTcVTFj9yJFgL4osgNRmRmTnA_qDim8uPWYHEmSJpkSOfI
Message-ID: <CABKbRoJ1ON4KjuRVtCYmyLRrE6UO5XZaka-re3ByvkZVt_00eQ@mail.gmail.com>
Subject: [PATCH 6.18.y] Input: aiptek - validate raw macro indices before
 updating state
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org, dmitry.torokhov@gmail.com, 
	pengpeng@iscas.ac.cn, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Pengpeng Hou <pengpeng@iscas.ac.cn>

commit 95dffe32a66cbed07fbfa7afed39d56d5014e04f upstream.

aiptek_irq() derives macro key indices directly from tablet reports and
then uses them to index macroKeyEvents[]. Report types 4 and 5 also save
the derived value in aiptek->lastMacro and later use that state to
release the previous key.

Validate the raw macro index once before it enters that state machine, so
lastMacro only ever stores an in-range macro key. Keep direct bounds
checks for report type 6, which reads the macro number from the packet
body and uses it immediately.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
Link: https://patch.msgid.link/20260329001711.88076-1-pengpeng@iscas.ac.cn
[dtor: fix macro fallback in report 5s to use -1]
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Miguel Garcia <miguelgarciaroman8@gmail.com>
---
 drivers/input/tablet/aiptek.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/input/tablet/aiptek.c b/drivers/input/tablet/aiptek.c
index 2b3fbb0455d5c..9e78105bace77 100644
--- a/drivers/input/tablet/aiptek.c
+++ b/drivers/input/tablet/aiptek.c
@@ -658,6 +658,8 @@ static void aiptek_irq(struct urb *urb)
 		pck = (data[1] & aiptek->curSetting.stylusButtonUpper) != 0 ? 1 : 0;

 		macro = dv && p && tip && !(data[3] & 1) ? (data[3] >> 1) : -1;
+		if (macro >= ARRAY_SIZE(macroKeyEvents))
+			macro = -1;
 		z = get_unaligned_le16(data + 4);

 		if (dv) {
@@ -699,7 +701,9 @@ static void aiptek_irq(struct urb *urb)
 		left = (data[1]& aiptek->curSetting.mouseButtonLeft) != 0 ? 1 : 0;
 		right = (data[1] & aiptek->curSetting.mouseButtonRight) != 0 ? 1 : 0;
 		middle = (data[1] & aiptek->curSetting.mouseButtonMiddle) != 0 ? 1 : 0;
-		macro = dv && p && left && !(data[3] & 1) ? (data[3] >> 1) : 0;
+		macro = dv && p && left && !(data[3] & 1) ? (data[3] >> 1) : -1;
+		if (macro >= ARRAY_SIZE(macroKeyEvents))
+			macro = -1;

 		if (dv) {
 		        /* If the selected tool changed, reset the old
@@ -737,11 +741,11 @@ static void aiptek_irq(struct urb *urb)
 	 */
 	else if (data[0] == 6) {
 		macro = get_unaligned_le16(data + 1);
-		if (macro > 0) {
+		if (macro > 0 && macro - 1 < ARRAY_SIZE(macroKeyEvents)) {
 			input_report_key(inputdev, macroKeyEvents[macro - 1],
 					 0);
 		}
-		if (macro < 25) {
+		if (macro + 1 < ARRAY_SIZE(macroKeyEvents)) {
 			input_report_key(inputdev, macroKeyEvents[macro + 1],
 					 0);
 		}
@@ -760,7 +764,8 @@ static void aiptek_irq(struct urb *urb)
 				aiptek->curSetting.toolMode;
 		}

-		input_report_key(inputdev, macroKeyEvents[macro], 1);
+		if (macro < ARRAY_SIZE(macroKeyEvents))
+			input_report_key(inputdev, macroKeyEvents[macro], 1);
 		input_report_abs(inputdev, ABS_MISC,
 				 1 | AIPTEK_REPORT_TOOL_UNKNOWN);
 		input_sync(inputdev);
-- 
2.43.0
