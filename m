Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC564C10F2
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214145; cv=none; b=EALeK2pyFEr0A0SqO84VX060fqx/kHIXydc6+EY45q2FvkYtBOyQlWjlb+oHzfeQMfPwoRhSOFMD4pGi1l5qb1DmjU61Z9lLLni6FbY8A2FEnE46VmijVVNmeZdFvLyrT3Qrg3B+rfti8Mnh4aNuV9h2n56bGKvTQ4HG1o1rHgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214145; c=relaxed/simple;
	bh=kXuHXeDWt1EqIQaBTiupiYjz7DvChsgSn2tgrUKotRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=csmlTZ9F9EtYS0o/iKftjTxP8um2KVK9FiDqobAH0klGe1HL+koFUaTTfdP9uyyJq+2wiJfbwFOiFporp3EEIO6TvpljS60cNUMPRY/nfi65clEtwHqtMwy/sEZ5CW9XrAbt/VU15ZGQ5as1Ao1+a98ZpKmxX0GPeNz0BKI1oYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCGEvQ7E; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCGEvQ7E"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e4a4e92234so16430855ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791214144; x=1791818944; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XlX6EAWXxvgk9C24SGy6DSB5gv6jzR9mIfykYwRHX30=;
        b=TCGEvQ7E/7twlJDrcXtSAXn2Migfw64qa0+rQgEN81TeIkULqIZl6Jx4drVlWbHmZK
         Xf8buenI8RolWAYrmYIA1ldhwSiDbAHulzYxC075mCAlA5ef5SYFPJTxs42raIWd01DH
         o43Bmci570id0hmwKaeZZh6z6XZj4SA1WnQL5rNbzmlywj3tLY1L7qyrq0ZTqnAx05wF
         gf70LHUKX+8dW91mptGuV7l2ZHxKHxKohT15FlMO/wJoOEEOakhIvqTbzB2M4E/SYp5U
         vpDYejkkw5uCf8aCMJGVfF0Xr5PpD2aminpeECaHdTJXck+oUwsDApbdDhn+tZFGKzcE
         CEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791214144; x=1791818944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XlX6EAWXxvgk9C24SGy6DSB5gv6jzR9mIfykYwRHX30=;
        b=p7hOqivcnLcD7YoBnP0kRteBIu8wlSBBeC5sx9t7p/YBrGI63PDxFFJHe+5BAge7MH
         Q463rnLisOFos1732+Zord+zHj7w42Cw7w4qYS/eXD/QDB6SNz1jdMqpv33QAHe2Rwu5
         CEnAqH1jgBEEu/c+6qtRL8/kTlVyLpb7H7ROxv5rvXk3GJOMCyaPFmWt/nzRCZXuIiwH
         wAg9inzPsWSW/ad7/IaWZPKgUpGjIdNGj9IH4XrNMYiU+jFkNm/Ffi61aAt3TAWVjGEA
         7yyJVC1oOMIpXY1KIqX52aGbZG/1X7Oyrt4RamAUuN8P/dQLFATOshZC20vkyRsBHGF4
         TsIA==
X-Forwarded-Encrypted: i=1; AKwUvBy/qxQlxVcxPZ2fbqt2BNogsN7JGinq7OgqNSQ+bbBS/6PdrfmoCLz3/yeueVaZlCZG7O4WE0O5EH3YqNI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIuNtPuqLYkxSPohKaH44G0hBp1MV0ZU1ALmfZKah9jLlQHER4
	6N+dDJPhKS7NU6B0OYuXnGfKA4xMNDbDSLnsCydMJXJbSuVEE0Fbs6R2
X-Gm-Gg: AYBFou11ay3INOESeIoSOTpYMQ4vRTAz3bBDNP6y5LITpoEccW/0dJzC75lojP7rkCh
	wT07kMHNzlN4Tl5moxv74M8ZeWeC4jXOweGb+rfmgfvh/bj1z5KaBjht9mFQ+YBHa9HpuZMoNjW
	03W7YohCzwKteOgJZgCbFAGev3ECcTon88HGgEHhNqwa1sBxH6TVv/zRa5LFqD87Ppt7N3g71Gq
	wkbVbP76iMJVMCtAW/xNohxPAxM+pKYstW/Dw5z18HjT0up+tQW/pnj3PhVzfrXhaODC60C550x
	oz0UxLdg0jNcxBjH3at/EH/ZMnqcDkA8qtB7cg3uvhyS33jVKG4Zmic/J5s0YMeaiSWZRBfcWeM
	V5VlBnvGnXodHDHwoXR5dIL9x3KRzS1ApIKki8tKI7SOUR1sJppwgu1z8I0uKM/CP1Ug0vc8Wl7
	xSW5ARdvtW7LWr/XlYidG2htsUq77iHYJO5cqbMJFVBW0GkthzX3kFfHaev+tZvCj/sLG7n3LrI
	+6bhW2ZknnTV/pmXdj4x9PdWeCxCV7+pAMZR4lSOdVEfXcnX+9A4nYhjkaAFBiUM3e+iE3dZxcI
	6BvrixxnXoxW9DAXqNVO
X-Received: by 2002:a17:90b:2752:b0:3a4:b0b9:6b3e with SMTP id 98e67ed59e1d1-3a7873d9565mr6440021a91.36.1791214142784;
        Mon, 05 Oct 2026 08:29:02 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([119.14.238.184])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a851630206sm29127a91.0.2026.10.05.08.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:29:02 -0700 (PDT)
From: Wayne Ho <wayneho219@gmail.com>
Date: Mon, 05 Oct 2026 23:27:46 +0800
Subject: [PATCH v2 1/2] Documentation: ABI: leds: Drop stale gpio trigger
 reference for inverted
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-docs-leds-abi-trigger-attrs-v2-1-c5f8970b1b42@gmail.com>
References: <20261005-docs-leds-abi-trigger-attrs-v2-0-c5f8970b1b42@gmail.com>
In-Reply-To: <20261005-docs-leds-abi-trigger-attrs-v2-0-c5f8970b1b42@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791214138; l=1320;
 i=wayneho219@gmail.com; s=20261001; h=from:subject:message-id;
 bh=kXuHXeDWt1EqIQaBTiupiYjz7DvChsgSn2tgrUKotRk=;
 b=EHqb+cnox+l/QvnE/UAX27xBYKy7KN/8FyUtNhM+neZM9iAqgCp26VNDo3F6xRBp4BuXEdAHJ
 2idqfCa+mZECT7EupENrC32IWGo88lOVPYt3EFJdFb/0iMDJPopjFCN
X-Developer-Key: i=wayneho219@gmail.com; a=ed25519;
 pk=j25LRSikYRlv0PpovZSgSrCQwsy7WDzIYum/mydUa3A=

The description of the inverted attribute says it is specific to the
gpio and backlight triggers, but commit 4a11dbf04f31 ("leds: triggers:
gpio: Rewrite to use trigger-sources") removed it from the gpio trigger,
which now only provides desired_brightness. Only the backlight trigger
creates the inverted attribute today.

Drop the reference to the gpio trigger.

Fixes: 4a11dbf04f31 ("leds: triggers: gpio: Rewrite to use trigger-sources")
Signed-off-by: Wayne Ho <wayneho219@gmail.com>
---
 Documentation/ABI/testing/sysfs-class-led | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index d4c918cc..c72cb1e0 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -84,6 +84,5 @@ KernelVersion:	2.6.38
 Contact:	Richard Purdie <rpurdie@rpsys.net>
 Description:
 		Invert the LED on/off state. This parameter is specific to
-		gpio and backlight triggers. In case of the backlight trigger,
-		it is useful when driving a LED which is intended to indicate
-		a device in a standby like state.
+		the backlight trigger. It is useful when driving a LED which
+		is intended to indicate a device in a standby like state.

-- 
Git-155)

