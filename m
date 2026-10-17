Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B592137DEBE
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792204771; cv=pass; b=LT9aszQRi+gyEi6rJgut2iu4twvB7iXixzFa+WogkTu1k1ogA/4skX2GKT82apOVCjvQaqJWNprDYGt1RQcLkHN4fB0JOQbrZnxuuGgHqCO/jXSpdnVXlS0o3dyeZJZ0e51sNvjcSZW0bSHfbAtcPwD6V2b+UvTyn4jKV64DPgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792204771; c=relaxed/simple;
	bh=KC3eu+jm7sIsJ7H5aJTfHeeBZbEsbgdbutde6b93XO0=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q4dbICqCQBGIWmfAyRTmz4tPmUDOSTdFt8WrRuiA7HrC47E9gy4xUuM02vbd/02o/5/4wVcYKMeQDlXzA2ugfblshbx8z87f4cJfVKpQ7jB6uVsm4FcMRZ4b+DwAzkaEM7xC36SZ5GIgU8rNiSn4DoGVj/2EwU5/kKyYToCpl4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfHTEMST; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfHTEMST"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so1531141241.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792204768; cv=none;
        d=google.com; s=arc-20260327;
        b=jSysM6PncWLUP6m84Ma3JT7JeabnIGoyilwCtyoqMRNXcKoVlULhlowi/+RFnu4vjD
         4BXkNsGKCwPxJH8uf2AnJsvONoq67wKrsk65LFXLGg9+SsVTF/3m9f2RY+tH6CrkNY8B
         IYrqVoKEzqHou1A4nsIQuDM9pw8ax/GbSsqA50vIjLJ1FnobvpBrYQRfeEprQBFnzkUw
         KuM+QI/b5pUaj28TwZNFXzqaVv3CZPOkB5gqn00WIIORpiXtWajHtki8yEMSogQk1VK0
         PkRZATHCxvsMizk+wZqKcn+7ZiB7DUc55vthwPpgkAxANFROFkquVuA6Yx89V4xKeCYo
         so/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:mime-version:dkim-signature;
        bh=sdlsKEFzOLphdwnKgWd3lyNUyk5CQKvc4F8OOL4Kue8=;
        fh=RalpZqqEDpXbb8o1lPr70RU2Gtly8Hr20/sid6AqLZ0=;
        b=FS9CaxDgpsyNNt8fYKz+wrGTeJjt+QleRzxXKwfXNxjLhXTNPAOw3GX9ieiDRIDpZc
         B+UkFV4XLprUNs7vJ+V3Z+4KlJc69NARcbGHl6v+QsmuOs3YTqe5T4i7jxpwpMIjOgWM
         5sC6lXkt1ToTog+Y86uVlbmVP1Vw10on9eMup+g0p+9LF7DHwCH8aMLWBpy0seOnZdvI
         ZAtMcDe7GCICNWN508AkMckOEN4rckM4lp36On9sRATG+1mhWAv3Qj3Ra4XL2HYe8z4c
         uJQNiGC7qdNuQmAOVYCUZFYGJ6YboVtGendI4Qp4g++sUsFAiuhtwHBVy60ibyv1d/FA
         1dqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792204768; x=1792809568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sdlsKEFzOLphdwnKgWd3lyNUyk5CQKvc4F8OOL4Kue8=;
        b=dfHTEMST/tgeW5FfVyWAvUnTAXcgMwmhamnasFCWAwILU2SmBJBXhHHSvGLE+GAPTN
         1dPEg++H2baZtAAJa/TamxmSSxu/sDcCdOhr7EP/nh7oBADIUg+eyD+HH9ROHZTIZmdP
         G4fZQ04IFC0bTbihWhyhAq0B8Alav2cFkYd4TrI92b1ZMU4SACvrEs37qlpYA3aEUO6F
         ETB+eWN/VDwRnFXoZDhiQwQVhiIiU0Z/E8r4hDa7x1Y7wECuB9/Wks0USR8BylBlDqqm
         Rbbem4O/0hQDA3anV9JRQBtK5w9SWGeaKdj3NOnfy0Udyntp2VPZwpwMNeTjcczIpzKO
         9uDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792204768; x=1792809568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdlsKEFzOLphdwnKgWd3lyNUyk5CQKvc4F8OOL4Kue8=;
        b=Sy46dvCZMzKpFwzzhvGuKJF/NaqA75if2A1XJSn2wLRAeXhAXfh1aVDGPbkqwAa84/
         eyy1H2f2zocBL1npUY9PAG3Rfr7N55ONgRcBGKkk0dEjfgX0CQivvSuPIKCYqlcsywzw
         WKmT5K0sbLqZvU/X+NCTsnu28VgluPofwGDAzyBMlxSjGNFTS762qa7PGmOUgsw4TdtT
         CkwselpgIJgPjfH6bminViHMmx4RQk+pYAsoiTvOs3JY1+yU9ph5f9L5LQrdhMmC7qHr
         jO3jQcICDsdTV9SgRELG9AaWhc8kt5d1n71LSKN3v9nrLF7GYRtVBErGktc87Wt4bXUB
         X4OA==
X-Forwarded-Encrypted: i=1; AKwUvBwQ0op+tKnnaQsGmfjOfCwoaBoYNaoucn/eaKFKPAWzDZh/M+MHhnIOOm8JJBXIhhmV2ken1A0YF4QBFfA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5snXwPpbPsqX5ZQ8UkjR1c/OMJfm6gKmSV8tSOCYFc+aslKUv
	k8PXjFC7YAtrmV9V2IpoYWVW7/VZGpvLiBgfkozRv+FPAoSq6pZIY9Ug4V6SqcOw8jiruFp7b9P
	5TEY8ULY0NcSJht7SG2S7OhvRvzourqz4vSpUcFA=
X-Gm-Gg: AYBFou2tc7i+YU8X3qIN0LOE/c/YZyAIV9gRTDUPUhLoJ0mwSAA08Xx92n6xtyLzvXY
	tC36XbjUpEDd//QO89g9+Vh4gd+z2qVmjV2+NfUsRX18sOtuMavPqafqUexpCuI3lrKxShhtABx
	ETzYLslcBjyg6aTExk3aYR5DWjBrwan0o5Eta8cREs3M4WSuwj3YdzvFSmKeSAYC2NEvqqE++Wy
	uVAXv7YkCaHqdjA4LQayxH9SMOaaDiDHcxkdnYc4CVlcFTaEfSqY8cdLdODMpaDxnG54DsL2F2k
	DLV1ewXD4uR2pKLpMzVVsAGusbhbx9BFW7yDk0hgQswlcCL3ijndD0P2tYH13ikzHw==
X-Received: by 2002:a67:f34d:0:b0:7cc:ace:24ad with SMTP id
 ada2fe7eead31-7cc17c72bd9mr1070408137.0.1792204768576; Fri, 16 Oct 2026
 19:39:28 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 16 Oct 2026 21:39:27 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 16 Oct 2026 19:39:19 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Fri, 16 Oct 2026 19:38:21 -0700
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Fri, 16 Oct 2026 19:37:43 -0700
From: =?UTF-8?B?6LW15paH5by6?= <berringtoni36@gmail.com>
In-Reply-To: <CAF2O-sPfK96Bvqtu-reg+y--nuV35tM57Med9irz_a3RK1xhsw@mail.gmail.com>
References: <CAF2O-sPfK96Bvqtu-reg+y--nuV35tM57Med9irz_a3RK1xhsw@mail.gmail.com>
Date: Fri, 16 Oct 2026 21:39:27 -0500
X-Gm-Features: AclHuK_3LJU8o98OAG69Xz_TNEuPj-B3u8dMNV-r9cFLjr8fkIzbRSp1qOk1GNo
Message-ID: <CAF2O-sNM8HjOOH+sNc+QMTgDpLUKTar_3hXzHPoW+Bi-ve6CyQ@mail.gmail.com>
Subject: [PATCH v2 2/2] iio: accel: adxl345: propagate errors when disabling
 activity events
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lothar Rubusch <l.rubusch@gmail.com>, Joshua Crofts <joshua.crofts1@gmail.com>, linux@analog.com, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When disabling an activity or inactivity event in
adxl345_set_act_inact_en(), adxl345_is_act_inact_ac() is called to
verify that the currently configured AC/DC coupling matches the event
being disabled.

adxl345_is_act_inact_ac() returns 1 on a coupling match, 0 on a
coupling mismatch, or a negative errno if regmap_read() fails. Checking
<=3D 0 and unconditionally returning 0 swallows negative regmap errors
and reports a successful write to userspace while leaving the event
enabled in registers.

Store the helper return value in ret and return ret when ret <=3D 0 so
mismatched coupling still returns 0 while negative regmap errors are
propagated.

Fixes: 31f7679bb69a ("iio: accel: adxl345: add coupling detection for
activity/inactivity")
Assisted-by: LLM
Signed-off-by: =E8=B5=B5=E6=96=87=E5=BC=BA <berringtoni36@gmail.com>
---
Validation on macOS ARM64 with Apple clang 17:
- Compiled the seven event-write/disable driver functions verbatim with
  the driver header, using a host regmap stub for deterministic read
  failures and register state checks.
- The original code failed all 12 disable regmap-error cases (returning 0
  instead of -EIO, -ETIMEDOUT and -EREMOTEIO); the patch passed all 29
  cases across DC/AC activity and inactivity disable error propagation,
  coupling-mismatch ignore, normal disable, normal enable, enable read
  failure and unsupported direction.
- Verified that failed disable reads exit after the first regmap_read()
  without issuing register writes or altering enabled register bits.
- Used -Wall -Wextra -Werror, AddressSanitizer and UndefinedBehaviorSanitiz=
er.
- Also compiled adxl345_core.o, adxl345_spi.o and adxl345_i2c.o as 64-bit
  x86_64 ELF relocatable objects with clang --target=3Dx86_64-unknown-linux=
-gnu
  against unpacked Debian Linux 6.1 headers plus upstream IIO/regmap header=
s.
- git diff --check and checkpatch.pl --no-tree --no-signoff --strict
  passed with 0 errors, 0 warnings and 0 checks.

This is a host function-chain regression and cross-target object compile,
not an in-kernel Kbuild/KUnit execution or hardware sensor test.

AI assistance: Antigravity identified the error-swallowing check in
adxl345_set_act_inact_en(), drafted this fix, the fault-injection test
and changelog.

The request was to prepare a driver/BSP/kernel contribution related to
an ADXL345 SPI/IIO vibration-monitoring project with reproduction and check=
s.

 drivers/iio/accel/adxl345_core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/accel/adxl345_core.c b/drivers/iio/accel/adxl345_c=
ore.c
index 5983fc7..8ec1bbc 100644
--- a/drivers/iio/accel/adxl345_core.c
+++ b/drivers/iio/accel/adxl345_core.c
@@ -692,8 +692,9 @@ static int adxl345_set_act_inact_en(struct
adxl345_state *st,
 		 * current call attempts to turn off a DC-coupled activity, this
 		 * inconsistency should be detected here.
 		 */
-		if (adxl345_is_act_inact_ac(st, type) <=3D 0)
-			return 0;
+		ret =3D adxl345_is_act_inact_ac(st, type);
+		if (ret <=3D 0)
+			return ret;
 	}

 	/* Start modifying configuration registers */
--=20
2.50.1 (Apple Git-155)
