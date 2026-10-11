Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD6036F909
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791699345; cv=pass; b=XHUtQP+QwOPLdjpdxzU25uY0WmZfi6LXpzaHpXAKZGYw+83dkzAK1k31BRyq6sO4HaMGpWOlPhD5g0ZmIiu23TsDk17Y9xDho7+ZO8qymclNgorNtWKjwBvmn4NZhXGl8DATLA9g5pYaeXKRytCdLgtz/k/jp8hWW42UE9CqSWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791699345; c=relaxed/simple;
	bh=XrM8GNdz09aTLpj/YWt5QoBx4XJXWOW0t3qeZquGh68=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hrbFsa0TgElpHmFSe+oT/hmBC3ouLv0dQ1i5C/VjeUUAYv8QUsP6XulgEOGek84Xoyuw++OnsNgDNIlh/46iLnsHprXx5whdGZAxX2v7yyPptKHILu46JYaoKTr3bLkRK9vBsUGf7AS1yrY3LR9MIr0h7TXILQnxDNO99skNHsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yx0cKMW1; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yx0cKMW1"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so558433241.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:15:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791699342; cv=none;
        d=google.com; s=arc-20260327;
        b=O7YI/IRwKARntO31TO9IFZEK3nfNJwKUIAi3JUGNjkFFCkBHIoirTibQN3xBwDum+R
         9oPky2VLwBDfRqtfdcGvR7EfI4T3b6CH9ZX/WPxUMARwyPXGfmwx//GrAZyQUZizgw5Y
         8gbUeX4/CsWWct/0zxlOJfMscyAhLIwy0Zezbz8HKmEOzElK8VICZTQms5hSwBiV1hzh
         dnuNLs4Tj52qsuYqev5VzwImZ9Oev2qLBagqNMjW2dVqRRiGSHrhJHy7D/HhpVb/aZRa
         qN4ZrAkebpKbAnRn5CL0nQAdNLbkN+PNSD0wP3oJeM89fCQo3SPa2OXAuVM38E/DBfsN
         SXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=X8L+iNlTtt3HRZDj3HQaVSJLaMG+O2tpW3fkmUX4Knk=;
        fh=6b1vbKb53ExhQzDM/ALsuv5CJxgrcIO/OuqKunzSk6s=;
        b=qerTCTIVRsz3ZFR8CXPxpNw6d8rbl6VrwDZjyioF2TmGwM0CfqgiOxBvj68G51l7p5
         nI2oxIJbJz262ltOhh4m3GgPraBGAyHL43p1QpcTjOhPiDoyMQWHOUon21l0//4IXWb2
         IGqNjVzX4G78409pjgCIt3tm7/G2ieV0tzsL1mlIuapXVoskmDo3Q9K7Gz+S3Vo2fnFQ
         Z3LtbAzZQU7O3JJaAkLObV91U+b8PyjWObIVto22IiIuyE+sKGlvS7e6yGfGtuV3j8J1
         mRgftYZ3iPoQrELw1U3AG5V3OaRPBFZ+eZ4UfU2/0qGvHUdMe3HtOxadk4rRWAW6yfN9
         DilA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791699342; x=1792304142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8L+iNlTtt3HRZDj3HQaVSJLaMG+O2tpW3fkmUX4Knk=;
        b=Yx0cKMW1CozpDzpNqqD4oNxR1ZlFcrO5YqTTAUPXSKRvR1E1y4mMsMd8q/e3VEX4Hk
         L5UrkkLdCZ8RiCl1DKRZFMSMGEK+WXU410Mn8gFYAUHAenU3HGl1x6/QYkfrPOV1Bbs3
         /fm2wkZXjsjIIk4ZVt5Tgwtl+9bhxluuaohvMpdEPzJK17MZE2CuDBjfV/Df+u0OI8wX
         OQmb3yJylmIEL5RttX1sXEmeXSphHuvxTjB26eFQmls4Eka5UNUqTESC+f4WYriMEqTr
         FuLachD0eu8iUeR5uDOyZfuIM5j/p9ss3dXgi+7ZCkTdFr2xrwCZzWOk2m+xrIbGL8aV
         SgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791699342; x=1792304142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X8L+iNlTtt3HRZDj3HQaVSJLaMG+O2tpW3fkmUX4Knk=;
        b=TM66ATPWRELTbLRENyoXa2W0syU7Aip8LV3kyrf607TKEzHwJR0WJsKggA9pxSnuNA
         RVfx2i1bkyoLtMy9fdIK2w+ZwlN+eP1WQpQo6oMJsffLTCqMN9mTJtvuQMwCbqq7MCGI
         EtW1E3AaUg/VFDKpUA0VgtzSajs1LTwlJCdQ5QWoC2FA0XxMC7W/PyQN3ZWpAatwUfQe
         M6JNnev/mpaI1epaWwpOkTrENwEpMFBsTH7/j7IheqxIPF9wuHEwreP1hEslA48UIQ87
         R98HgcGPbQ8/SXslENvyG9nHQtz3gDtIXq2L4BqqfLRdIIu06MP+YBvAr+77TR2mh3b6
         0sOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIePf3IqqURIEQdfIG4+CXRCsJ0FmgNux/McrNmIZlZQjaTi2/nzPJty8vigjdB9lsqPpRAFO1poDGrjs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJx2JOwLZvBuSvQHEApYcWSluaNs/jdgvWbDisSaBaPaFm/Zi+c
	seuVyda2Qu+fhZ1SBraSNk8ErnsxxbDM6YXDaB6D3i6J61SlyYps8dOYXs4gcsQtQf/13bXu/0S
	g2/WsJCCQM20WPhP6ovN0LLL35ipjnT4=
X-Gm-Gg: AYBFou3rLX9RHo7CqYuiYp/RNAQOFiUR7xNetArSYJgJyILQhjE07jDfnWgQExhSHCx
	1XxESOTF6Gc2AZpLXefHpwgy7v9mdNZPo18jHtcOYa0vIlwfDpMByVsGOokMMBVhX5H4HSTTA4U
	9A9v6TdPyfqSFh0BKUz1q4d0zU20HveYgjXjIf87q8uMdGsqVa+51sS/OGYWQseBNuFJvn60C/w
	KRuKKi4QfyXRlYKn/yRDhsnjDtpWpb0K7OkEoClwaHMjxwyAi/B/y5oDQMp+fHA0Jlrnr921K6c
	52SIeqU/Q63WySQCZQvTN5ZfYf9PfrSRS8CVypkC4NDn70nj7j3qrw==
X-Received: by 2002:a05:6102:14aa:b0:7a1:84bd:7f50 with SMTP id
 ada2fe7eead31-7cb39713ccbmr2025006137.1.1791699341706; Sat, 10 Oct 2026
 23:15:41 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 11 Oct 2026 02:15:41 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 11 Oct 2026 02:15:02 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Sun, 11 Oct 2026 02:07:29 -0400
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Sat, 10 Oct 2026 23:06:45 -0700
From: =?UTF-8?B?6LW15paH5by6?= <berringtoni36@gmail.com>
Date: Sun, 11 Oct 2026 02:15:41 -0400
X-Gm-Features: AclHuK8AMx45cLdSTsGLQ9rt89HLUljIGqTqKX2kSBVQqAMXvnHaMVhCGjVg3xg
Message-ID: <CAF2O-sO1YuVQWLoNT4mRN2+mzFOG-WdQ5Nt80s1k+7PP8QUtFQ@mail.gmail.com>
Subject: [PATCH 1/2] iio: accel: adxl345: propagate errors when reading event configuration
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lothar Rubusch <l.rubusch@gmail.com>, linux@analog.com, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

adxl345_is_act_inact_en() returns either a boolean state or a negative
regmap error. Applying !! in adxl345_read_mag_config() converts every
negative error to 1, so a failed register read is reported to userspace
as an enabled activity or inactivity event.

Return the helper result directly. Its successful paths already return
0 or 1, and the IIO event attribute read path propagates negative errors.
This also covers the adaptive magnitude events using the same helper.

Fixes: 66a1af6d8a63 ("iio: accel: adxl345: add activity event feature")
Assisted-by: LLM
Signed-off-by: =E8=B5=B5=E6=96=87=E5=BC=BA <berringtoni36@gmail.com>
---
Validation on macOS ARM64 with Apple clang 17:
- Compiled the three relevant driver functions verbatim with the driver
  header, using a host regmap stub for deterministic read failures.
- The original code failed 36 error cases; the patch passed all 53 cases.
- Covered activity/inactivity and DC/AC coupling, each of three regmap
  reads failing with -EIO, -ETIMEDOUT and -EREMOTEIO, enabled/disabled
  states, mismatched coupling and an unsupported direction.
- Checked read order, early exit and unchanged register state.
- Used -Wall -Wextra -Werror, AddressSanitizer and UndefinedBehaviorSanitiz=
er.
- git diff --check and checkpatch.pl --no-tree --no-signoff --strict
  on the code diff passed with no errors, warnings or checks.
- The full patch draft also passed checkpatch with no errors, warnings
  or checks after fetching the introducing commit for Fixes validation.

Also compiled adxl345_core.o, adxl345_spi.o and adxl345_i2c.o as
x86_64 ELF relocatable objects using clang and unpacked Debian Linux 6.1
headers supplemented by upstream IIO/regmap headers. This checks syntax
and types; it is not a full Kbuild/modpost build.

No in-kernel KUnit execution or hardware sensor test was performed.
The checkout is sparse; --no-tree disables checkpatch's tree layout
check. Initial draft checks used --no-signoff before human review.
The final signed email also passed checkpatch without --no-signoff.

AI assistance: Codex reviewed the event-read path, identified the errno
conversion, drafted this two-line fix, the reproducer and changelog.
The request was to prepare a driver/BSP/kernel contribution related to an
ADXL345 SPI/IIO vibration-monitoring project, with reproduction and checks.

 drivers/iio/accel/adxl345_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/accel/adxl345_core.c b/drivers/iio/accel/adxl345_c=
ore.c
index 6c9080d..5983fc7 100644
--- a/drivers/iio/accel/adxl345_core.c
+++ b/drivers/iio/accel/adxl345_core.c
@@ -1176,9 +1176,9 @@ static int adxl345_read_mag_config(struct
adxl345_state *st,
 {
 	switch (dir) {
 	case IIO_EV_DIR_RISING:
-		return !!adxl345_is_act_inact_en(st, type_act);
+		return adxl345_is_act_inact_en(st, type_act);
 	case IIO_EV_DIR_FALLING:
-		return !!adxl345_is_act_inact_en(st, type_inact);
+		return adxl345_is_act_inact_en(st, type_inact);
 	default:
 		return -EINVAL;
 	}

base-commit: 9ee8306121495d2a25aa5d1bfd519f2748786b83
--=20
2.50.1 (Apple Git-155)
