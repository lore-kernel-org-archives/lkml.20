Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FDB2DA768
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789797857; cv=none; b=nC7yC5BwAiHGT2rWo9biQfHtFfVoFv/zjQYBv4h6TUW7bioRF/Olu8juIqzG4sCCbYDimnaxMmMkvlvdSPgnxuNAXgNVnrZqPYfBOtapguDdbQgXv9JOLeiyQq0fvjVzVPWosz957t8hAoSGalrB+ww9+hOQtxjdT1tABNQKoiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789797857; c=relaxed/simple;
	bh=2abGaog2uqm3CvTy296rYjCgN0jQjGmwjbL3PyoEbNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eifVNcGyUUOvYZ1k+PtgNqJ7R0JA18V6BsNezAVSQX4SlysVbxG/8JlaoAtC7I1W0KZMykBrigkGJm18zZ66kiuBdSaX3uvPJJHSLYSgOEv/u34EEbkXyUR4ljkwCr9Tv7lbSXtJf+7CpGU4xuw5nNxRj5tMld5U0Qatk+LXt3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTFy+bsF; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTFy+bsF"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so8407655e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789797854; x=1790402654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7s4lYPPXaaFtdkMffgNQedRCzhSo5j6VQxz7Xg5Segg=;
        b=CTFy+bsFkFQFWgrUlXjKRAqQK7Z29bioSZduLEMLlTdeEnx2qDpHylcATWRh8kGTRG
         nl92ARU7XicyWJexcwU8gfIPWNzeqRNYoh0iS1wbjz02cKX0FGhhNIB/uK5DXm7q6uSz
         hiMHU3iI/I1/+r8vwHYaM7fij6JaAZVYPxjzh4tAXH1c2AKZk8nYpqzJ9HpNDgvMg1BB
         DsgU7/jtSl1vJAmS+CGGrDA8y3wefwr/sBDv0xH+/Fx2WRca+/KNb0ML28mr9yvieucO
         OA99DP+itGJC97hP5HOHfNDJFHCEh3QKHP0lhHhjS3s+lybcTmbNEz1d+vJsv6rv0haN
         b29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789797854; x=1790402654;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7s4lYPPXaaFtdkMffgNQedRCzhSo5j6VQxz7Xg5Segg=;
        b=hCWmFBpP00goGAyyQcVeDyEngmdbaGdyPdb9aIme3qzMHCNpqIcKFpSAUiG2XGD583
         eHE/kNCq8a3ZIM9ZT2O8Y326NRUN+Z5YNj3xDT9H8Cnuc2wdkISn/gKBVt/NzTvtt72S
         YWfmo5Jc9C2bUxFX3TjT3TuVuqwrLlJZ6ZP/RNPD5m1cDKuYTjcGW41jeRna0M+Pcb9S
         2EzR/Zg+dTzfz+7J3iL2ZdPJ80sec985UJbIAc7oyt7INZdbg0S7sBZHPFRKwCb5twHh
         7J0IoZ1hEIL2g2C+AUDFpvvFxPT4zV8CPI6dr1uMjTsosuX7SaTpv2uE92/SEfoCsC/D
         kzLA==
X-Forwarded-Encrypted: i=1; AKwUvByP0gwMsQN6b2WpsEOtHxKTpMyWjgQsYJFzfIMwKQyMz1o4C8IlBJwni7Zfkr21qvqWh6XRJ43+Pg9m6C0=@vger.kernel.org
X-Gm-Message-State: AFuF++n1s9Ptx51C96km87IKTSI1ahmbjDnITNEvqNR6adsdyAO6wXoQ
	Bu7p7eJOMihIPBnL14x6RyjXRgMsk+E1a3xIBp7G0UChaChtGhVdR/SW
X-Gm-Gg: AYBFou2WU8qwn3toLNPHbmUwYIK5yIw9nwxJSNMb5mH2oCpeikp5A3reCDiTSzTEwNe
	E/BZhszfwe7nfYCizB3z08UMPKkgMoWx8Jsyiug7s/SX+OMnt+crtkqTMLOw+jT9cXRTtE0R+ak
	1JezyV3tsf4a6w0mmu7zRBsJv1n75z+vy/BrWj1P0JueR6enGBbH4uwiVN6uNpigfTTBULt2DhX
	MzoFJjAwEbo/WvrhJ6w6OygDoeb+vr6eTGame6XWlU3tvBRZYWx56PbrZEQrPEdkCvfB/K45iQI
	pfXxSEVOIOEV839DF8U5LGzsZZn5tfscjj0qRUF3YNuob3UxiG11cOzNXL0x2RWfWquZCnM0DDw
	+9gN0ZLHeEG08wejSB2YKbp9ZefFrUPtRnet6jmD2ihKvvsGl7yQvE+5C0NNlUifcIF7wixufD4
	yAtXc954OruvvOENa+N6BbZOTdym2LV2rOboRvfNkrjHe42ZII0IJQpGXvnZqYtFScrkQRrYHu3
	rdvsKaJRpTXt1hIRgRcKYKj40SsAjUpb8S14JkmRcjAXRwN+/Cy
X-Received: by 2002:a05:600c:8709:b0:49d:870:7a69 with SMTP id 5b1f17b1804b1-49fc573514bmr117200795e9.12.1789797854220;
        Fri, 18 Sep 2026 23:04:14 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm81576745e9.1.2026.09.18.23.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 23:04:13 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2] platform/x86: hp-bioscfg: fix OOB read in hp_get_integer_from_buffer() on unaligned input
Date: Sat, 19 Sep 2026 11:04:04 +0500
Message-ID: <20260919060404.85742-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hp_get_integer_from_buffer() aligns the read pointer before dereferencing
it:

  int *ptr = PTR_ALIGN((int *)*buffer, sizeof(int));

When *buffer is not 4-byte aligned, PTR_ALIGN() advances ptr forward by
1-3 bytes to reach the next aligned address. The bounds check that
follows does not account for that advance:

  if (*buffer_size < sizeof(int))
          return -EINVAL;

This only confirms 4 bytes remain from the original *buffer, not from
the aligned ptr. If *buffer is unaligned and *buffer_size is between 4
and (pad + 3) bytes, *(ptr++) reads up to 3 bytes past the end of the
buffer.

*buffer_size is also under-decremented on every call, aligned or not:

  *buffer_size -= sizeof(int);

*buffer is advanced to the aligned, post-read position, but
*buffer_size only accounts for the 4 bytes of the integer itself, not
the alignment padding skipped to reach it. Each unaligned read leaves
*buffer_size overstating the true remaining space by the pad amount,
an error that compounds across repeated calls against the same buffer
(hp_get_common_data_from_buffer() calls this in a sequence), making
later bounds checks against *buffer_size progressively less reliable.

Compute the padding explicitly, check for it, and account for it when
advancing *buffer_size, so the pointer and the remaining-length count
stay consistent with each other.

Also switch ptr from "int *" to "u32 *", matching the type of the
output parameter it's really standing in for, and size everything off
sizeof(*ptr)/sizeof(*integer) instead of the bare "int" type name.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v2:
  - Use sizeof(*ptr)/sizeof(*integer) instead of bare sizeof(int), and
    change ptr from "int *" to "u32 *" to match *integer's type, per
    Ilpo Järvinen's review.

Link: https://lore.kernel.org/r/20260824225610.18471-2-meatuni001@gmail.com [v1]
---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 309634c..f59957e 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -38,15 +38,19 @@ struct kobj_attribute common_display_langcode =
 
 int hp_get_integer_from_buffer(u8 **buffer, u32 *buffer_size, u32 *integer)
 {
-	int *ptr = PTR_ALIGN((int *)*buffer, sizeof(int));
+	u32 *ptr = PTR_ALIGN((u32 *)*buffer, sizeof(*ptr));
+	u32 pad = (u8 *)ptr - *buffer;
 
-	/* Ensure there is enough space remaining to read the integer */
-	if (*buffer_size < sizeof(int))
+	/*
+	 * Ensure there is enough space remaining to read the integer,
+	 * including any padding PTR_ALIGN() introduced to reach it.
+	 */
+	if (*buffer_size < pad + sizeof(*ptr))
 		return -EINVAL;
 
 	*integer = *(ptr++);
 	*buffer = (u8 *)ptr;
-	*buffer_size -= sizeof(int);
+	*buffer_size -= pad + sizeof(*integer);
 
 	return 0;
 }
-- 
2.43.0

