Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D59038644F
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792204752; cv=pass; b=pPcVRyXrQuOCrUOJWJlw3GIV5kMivtiVCt9kSYrcQTa3ath8TwjpNWn2ERUPVQt7HApznab9XP5b5TvOe0zT4/cv4K4C1Q3j4jqd+FATKTPtOFwDIlid2oPgbBYe2v0byWMrpHXIRPHQnh+yaQkTalUtVHueBCImSQ6o4jiL620=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792204752; c=relaxed/simple;
	bh=XrM8GNdz09aTLpj/YWt5QoBx4XJXWOW0t3qeZquGh68=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uebEmA7HrtCcUglaxovrDsEZJCgIyQVeDTnt2sklrs6aIq75axg7empxIzMgY0mmF7xPU0QbMJpsVxd/fJs7SKFsFUn4V6cAAILgoGiWx6LVpb7Tie6UTaXD7AaottLlkskhdXOvUIOOrGe3MeJXhyWp9M8IprCYNei0mBs4eVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQtqa+Bx; arc=pass smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQtqa+Bx"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5e67a6b3633so137348e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:39:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792204750; cv=none;
        d=google.com; s=arc-20260327;
        b=rFiwPHYUUeq/eMtUdPo/lezl3C1AOE5Hxl476LZ0ALdHG5xkI572pcx4dSIO0KDUS4
         unwWjzG29A5Q2vU6OJxPZOOR2Xa6Dmjp1Yn5wDnCHUI68Np43asV/tMFa+lVbgfC5eF8
         Z7MZ3fy2wVKZFBRAKkp8eJH5/0UCkBjJTyLVHu2aaukAaPVM6mq+VMmJmg++8vXRcmwr
         MNxGE9HustH4aTLDF+QHDFSWb/yQptKHtujssz27lmlB/YwTtQu6CLVE67E3xUtJ/cXP
         EhyYC+29vBkFrlP4WfMpwU5D13i9dmB3+V05/E3BWpmr6bpQK+mtKTOtVO4eKpaLsmOe
         7Sfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:mime-version:dkim-signature;
        bh=X8L+iNlTtt3HRZDj3HQaVSJLaMG+O2tpW3fkmUX4Knk=;
        fh=xvX2nWUPDnDZZrO8VG1N1ixOwco4TjPL5Zlhu1razrg=;
        b=AlznUYOD2Uag0TXwd14BFM04FVcOUzgAcQsDb+qcjOzRWnpyO7keiHzIhvB4/inoBI
         ofagTsThMtw0XPS1Gi8NWjdlGDF3xfK/qFNLWHfedkok6gTmklTaEFC3RaXW/4MXMbb4
         m34eUZOj7pr8xItINeWB8bZGhxtWYgmJgbvrX5Ve0yzrD895vQAspmSuQXL9k5JY20TH
         C40K/Wri9MJkAMZBoxaOYgq91yNcwaQlIrixBOos0A2NHtUJ+EJ9jsIzIAwAtdf4CYNd
         zNLXRQXIMQMsUBYfV513F97EyJ6qwTfjiEl5RFvYJkWBmdhhPsCdJIz+KR0+2fTdRliH
         l7QQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792204750; x=1792809550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X8L+iNlTtt3HRZDj3HQaVSJLaMG+O2tpW3fkmUX4Knk=;
        b=SQtqa+Bxlw9myc2CwKJLX4sgLyctPV2TcZBBb8huGIlLrOu7vxDVtPvx9sJggJJS2T
         jdvDpz7U0CDeh0Bd8CqAKwDB9e+CeR+6kuiii7QiQRpuW+ugoLLx8jdFCIQBl8gUW4t2
         /YoD5lxDiMLcOtRCVt7OIVK9Fl5IQQaY3g31DDFZ70qs4jGsXBwf65ZXlHkYB31zmA8Z
         HJQVUekp0rYS+mGOphcFLuWZY4qKOc0pI0yUx+zKndiqKKn5l7yU471y8fYUX8dA08tH
         C97+OMZVZeTh2LNxjl8V5roPRgLsAUO8u71WSd7hDme0Yx8LdGbnhY0H1FRCjiqE7pAw
         1E8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792204750; x=1792809550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8L+iNlTtt3HRZDj3HQaVSJLaMG+O2tpW3fkmUX4Knk=;
        b=lKKB2oGxkXauFolRvOKdD4InL+q0sODUfEkfMRBAwxM/rY9r4vZpPPW7R/sby2QfG0
         tUv7eTTsZbDTUNOJ1NYGd2sMnkPLB1PJ++phtYjqNuMpqXreO6rrEllcYhdqDpLulxSE
         NMO9ooA/8ZkkOInqakh/gIblqLcEw/dtzaWkU6helN+j/+vcREtvbBuJDU26e77wpjU0
         bUOMxFiEvDQ8ADkgbALmKX7cJRBKhUyi7OmAYdf63WjX0UdVIVpD2f9gGbzSlp26BE0n
         EH8fP0OPRXG7goRKy5zC4C/R+zrKxvy7/sNB4MYLH/vS6kq1pfocP6Sd1VoT/1T79gJo
         krLA==
X-Forwarded-Encrypted: i=1; AKwUvBza4QRnLahdWSDESbGSVKQl6lZCsuVDo8x14SHgZDMcXrYA2PEv3JVH7C7BwSjnf/KeRxmuic8mC2RLadg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQYvcdc8eNFRfQt6dq3rMdSt7qWnTSvFAzNxEsnrENslJfXk3g
	cqoXM6JNAAp7F0AzOS5SzRPU5YNsh2+s0cYYK2zMvlYjIvDtcVkURH1CgcDjAjTsBEIJC9L63Gx
	occ9kvQT1h+iUKKxCdMhJUJp5254r/9kFxOzZHK4=
X-Gm-Gg: AYBFou0lLENW1WzKl5wVOlVp0DkD8E6NETuY+b9T8tHN8ic/U+eL+VfHmKWJtw7Adpy
	Ey+Wj66h/vwD8ZgmKmz0ODUO4ZJ0KLNQBv53nlXQHcnEGHRcU4fV7c64P0KNWcZoOSPT/auUQV3
	5oTxmJIr5Q6RbjmWk6ORY+0YVgeJOjYAB1yw4JJPqI0DMqe6bTEWYyVhfvbiZKnWf/qqhGG2RbH
	HCE1ekptYaQYeCqicIGfrm1V6PO4CRtEXSRv9/VQ4zV6oU3Mq32mbrL75RzD2+xh84e0FSo3pMg
	AXKOT5hwocZ3jXVB905ufKHdEkOYP0vGF9UZVFy1NKOBj6R31Q1eBzQ=
X-Received: by 2002:a05:6102:358d:b0:7cc:32da:56e with SMTP id
 ada2fe7eead31-7cc369a49bemr321993137.19.1792204750392; Fri, 16 Oct 2026
 19:39:10 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 16 Oct 2026 19:39:08 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 16 Oct 2026 19:39:00 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Fri, 16 Oct 2026 19:38:19 -0700
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Fri, 16 Oct 2026 19:37:42 -0700
From: =?UTF-8?B?6LW15paH5by6?= <berringtoni36@gmail.com>
In-Reply-To: <CAF2O-sPfK96Bvqtu-reg+y--nuV35tM57Med9irz_a3RK1xhsw@mail.gmail.com>
References: <CAF2O-sPfK96Bvqtu-reg+y--nuV35tM57Med9irz_a3RK1xhsw@mail.gmail.com>
Date: Fri, 16 Oct 2026 19:39:08 -0700
X-Gm-Features: AclHuK_IN0yhhB4sCeARlYxYXPd7McL71ZiCetTEMjL3AdHkwlcwOj_W8gMlVrY
Message-ID: <CAF2O-sO3OJH1sNnm0TkDXkEwWPKM21+s0_iNgU-VAmF+kMWtLw@mail.gmail.com>
Subject: [PATCH v2 1/2] iio: accel: adxl345: propagate errors when reading
 event configuration
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lothar Rubusch <l.rubusch@gmail.com>, Joshua Crofts <joshua.crofts1@gmail.com>, linux@analog.com, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
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
