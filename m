Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C972B23D2B1
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791699365; cv=pass; b=l2qJaqfd3Wu0fM86bwbowvTLpFFMPhESG5wCs9mybXJF7A7H/G1l9yJIxClehmv4yekJ1FbkG37T6AaZZbQd0z0gHcWl1Qdut1V2PLr2ncKslnFH/Sz5vwddDyAaYCv+euY123Ik0HKhsDjBtANP4LOJ2F09iN6SQMBRklqlATc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791699365; c=relaxed/simple;
	bh=KC3eu+jm7sIsJ7H5aJTfHeeBZbEsbgdbutde6b93XO0=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=InXiwSUjV4PkNE3M+c4QuGVCJ2FKUgCBCuRfWdUp6qkEMk+aNHyxQBTqZhI03iYnAUL0JbfLradWNPbejdgXhqoxCU5mdxB5sNIe9y3h4x91JwHHa9e/aytaFds24oxgZ0V05FEOBr4K4phJaOBUo9qsVvQEVA0dGtTJtd0zP/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwHHKkHW; arc=pass smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwHHKkHW"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5da7a39e584so299320e0c.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791699363; cv=none;
        d=google.com; s=arc-20260327;
        b=JAlFv1JXH6b3Nt+piAuRqxWOItvXCeAAE4DcnnrdBBdBihq6OQS2xQ+BYJnFzl/pO6
         r9WtWD4HHbx55wtsBeoAuIbo91GzX04AA1clEgzy4cjVmWheV+BnA/LIBDkbrdeKbW6/
         9SMDJkvsK9UIoEsC5r1eonhLMNFjC4lsfT/dt6gx83ILyad15T5iOLmsbl52NDGban/f
         2AhIUjQH7GDOHjSvJpx4XL5IuL5Cdb0PZFMnYsIwaNGzEijotKGKYiFNXkUiGKCiQ0le
         +nFFd5cuZ3SNEnDjjKday2ISobCUBGQ5hcUmpThgRtdcr3aVZHlZRvxH8oL/As2i6uhL
         /wgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:mime-version:dkim-signature;
        bh=sdlsKEFzOLphdwnKgWd3lyNUyk5CQKvc4F8OOL4Kue8=;
        fh=2GMBUIpHqtVtf7KhORS0z13vPWhpO4gG5Gz4RdLvdBk=;
        b=rd5IkUoVAMAIMpb0cH3QR2eW/CLApD7AUerbJSPQSp+0vdbTrm9XIBW+NYs/3137Hw
         Y7bC1MG2geIG6fohmxQYrZ+IryUjH+oZMSUlrbdJd38U9+1DiUVZVF/vjEXkGrM8+ps5
         MSkCPd+XUQUrrVK7Yc2j0LLk2mCk8oWMqm4SToAvwh+JdVl4WgTN9m1WrPS5ZkPiWlT/
         dSD5d9qMHmA1f0yi3hRFLtvtmHPQhqb47y0aArxZfsAOUOUS9x7s4/unAZmXwR6sUg6d
         /Ph6j999fXt46uVMkrkOLtugydZ4T2lAgayceFoSxruC3pW1eyEL8FPIG5eXKzk9vuG6
         vQXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791699363; x=1792304163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sdlsKEFzOLphdwnKgWd3lyNUyk5CQKvc4F8OOL4Kue8=;
        b=ZwHHKkHWzMIronTAcmX6YL6ZslM1VFJD1XSgMbBXZWSmZUwf60gE7xNoda9qf1Xxs5
         DAK0tHcJk0Y4uiZ2vv35GnZQ3E0My2oDO68vPzbJ27vA3J96ChnhBtfL3QgUAcQg7U0T
         84XkPFOPeKxPWzwwapR/JH48nVvB31U7JCykQkuqB9bkQTX14pFmc5c2T9A2vrHyPPzy
         1Mp4T3YKTdVcLQL2W5sT1n7PsZl2OZXHUXKMFlZjbWlC+WuV71SWyuGgU4NiI2pzpXr8
         aPU+TF4I3C8lWwYQ7Y+NDTqrxwjgBzsZBhiTHrOMCGMZcDheJmdHOCKmZ+ervBDE5xJM
         icCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791699363; x=1792304163;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdlsKEFzOLphdwnKgWd3lyNUyk5CQKvc4F8OOL4Kue8=;
        b=cy8cHnsrbrfxT0LhEtDvVWzOoPDYd3qCHWZlUGbw1LWNuJdpOC9yphr4S9fCkiwEgB
         4JzjiwT/0K4w10xZSG8sObTIHSQ1C/34CrXHq7pIgjxeVniz96yHiXC7Ir0NCzcFIYnY
         HC8hftEFWzm+T2X3ALukGoZOeCD1ziQT2E9oeMbP9ttXOELsVy8+2V3NHLG37OCzBIkO
         BrB+e5M5JqdDijtCupBK2Yash1szicp+kNDPBAT6DTKLmFCXmEXO8WVdWX4TqflYhiTu
         OiObQdHh/lUsuq7FukOSYwPF29U8C3Ke6g7ymPotHKLsN50JNiLwfB84pG7HHQ+MRmH4
         NuQg==
X-Forwarded-Encrypted: i=1; AKwUvBwK1jc4Iwfz7PG9Y7v3uyvWBkndsEKSeJVLSkgp1ET9yUfkK73T1/0m8zrCfF6BKTjklujPsbl3wlXhvh8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdKxCTKnGWKX6bSzA2Zh/DjKqp/Tkcog9/VuwplO6W3I9MOLMF
	khNJGUqV5cxVFZUHwfPW3UenaZYt2OW7j952GHHDAAw6uPINfp7payfNzN5im9QlPDuL9PvQwFo
	xngHkeeYnfsEW9iFxWIWqu79tnKTpLfo=
X-Gm-Gg: AYBFou16z9YRf1FZphRtX5zQkUwEuryIXqPSDufmuUABhpcbM3MdOlbUQIoTgm4Z9TH
	U2Tn89UoMA6y16aKIw/ZESfSWb6lv9nQFQOEqgdoB56WVVZuw1HW+ViPSSXiCqR6EsRnyJjGoYS
	txlG2b7//TiD28AfEqrlLHQkD3sklUXcLW+sm422gQHCVPJKkJ+35XitsLmTnLOwtV4cJ3PwhNG
	Y1PxLrDajTBLQjXJxTS/HQTEEsvQTBuiUhMMb8h5PXiAG1Mzy0bIc2oH67JLcJop56Bw3xA/4wu
	WZbSKsUyeTfrivZn6ZIQu5yCbUXStxauXbM7jOzVzzwt/muitBnrNQ==
X-Received: by 2002:a05:6102:508c:b0:7c0:18e9:ba46 with SMTP id
 ada2fe7eead31-7cb372dc755mr1811107137.15.1791699362772; Sat, 10 Oct 2026
 23:16:02 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 10 Oct 2026 23:16:01 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 11 Oct 2026 02:15:53 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Sat, 10 Oct 2026 23:15:03 -0700
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Sun, 11 Oct 2026 02:07:30 -0400
From: =?UTF-8?B?6LW15paH5by6?= <berringtoni36@gmail.com>
In-Reply-To: <CAF2O-sO1YuVQWLoNT4mRN2+mzFOG-WdQ5Nt80s1k+7PP8QUtFQ@mail.gmail.com>
References: <CAF2O-sO1YuVQWLoNT4mRN2+mzFOG-WdQ5Nt80s1k+7PP8QUtFQ@mail.gmail.com>
Date: Sat, 10 Oct 2026 23:16:01 -0700
X-Gm-Features: AclHuK_DsW304sqSeQ8iznGSxkMUxK49dZwUz8k-8Bh5_Iz-Vw4uiU5beDk6WEc
Message-ID: <CAF2O-sPXRLQ8AkYuZOtNjnWWLK5Zzw3fu1155S+qjN213kJ_qQ@mail.gmail.com>
Subject: [PATCH 2/2] iio: accel: adxl345: propagate errors when disabling
 activity events
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lothar Rubusch <l.rubusch@gmail.com>, linux@analog.com, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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
