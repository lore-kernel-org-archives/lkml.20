Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873D7390C88
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787890740; cv=none; b=UrBUuoyG/YRLRsfHbJau8nBzrMrkf0jbaxqkDyITdhNQ0l9WbokGvyxBNNVYvVMUd1rql8ed9SgLIh7C9Fp8J1IZeMoWskqlKj2wQ+ILEGZQZmvidLOzi5kAoiUO2nIY3q/BIpz71GgS/bBEHMMFrQjoRCWuO8s4sR4Azrewj3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787890740; c=relaxed/simple;
	bh=j86OQDFxzsnUmkLPHGpPchrsoAKvG3d9PSwJppDgo3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JXawx2ARRR6EjTOIul5Kpzi8e4kYpAH5ksyGrQU7lo/g1f96xtDox8iq381YqFsBUD1zXZrI6wSy+vPAIfoFHWoHG63zkiSKSUOScq4geop66DWJ+ihyAcf7Xsohu1J4BhuZUP/dzjBx2WkdvCoanM8x8tytWuu03B8XcXs3nyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NL23KvXr; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NL23KvXr"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66c744a00edso567522d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787890737; x=1788495537; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ERMTQqT5F5rXKk3SlayPMFRLzf69YOJVKWPJxXCY8k=;
        b=NL23KvXreSFFnyiilKeoFrhP9ffzu6URKEXtJG4a9gaaOyJ1Y8deIu1V1/kjZTYOgU
         bQcP0pJCjiHlWTdrWoOMIiAmKgGslTykoB4AmO+CvL4EG7UFKixQuuMwmZABRLg452Qn
         3AZx1HgudAsl11+QrgvW7QtlZlwZFxIQ/DHymP3ckWaBBmmrcUf2xCqxOeb13QMU9ci1
         LLCU6MkZQGOgU2u49Geo5hCnAQn7lx5DgR7BeN/Yq9wQzElNCJ+dX6Oil5m/jKBM0DkF
         7jW3fYDHL5R+HoYcfOS9df4+4gW1vJKefUttiZ8c6KwC2BXabHb2D74XOGl+Ij5xKMFg
         ifBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787890737; x=1788495537;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ERMTQqT5F5rXKk3SlayPMFRLzf69YOJVKWPJxXCY8k=;
        b=ppclqAz2uyYXuyPkCpjbG0gqEEswfr4oCX2HmgOqkxsmiT7bbIAMsqReunxWNqNXa8
         lN2mJqXaQpoQNfTtPuEzFy0ydqT7q3UL90FBmllitFIQOiqDhjF3rbII4KWyKMD2Mfb/
         tPbaLndApyXS1ueo7sriWebE4tjuj94uQeHBF6v6WGsTReTuJlmF2FfPDFrckUXZnCzr
         WQLfqobCxkE8c1AX4XxmjD8Rto7+HS7bdSyxq5LASP5VoCB/ydY9AGpOXlpmHXFB3+XR
         X/Kkyg9w4K7l1DiuHvxsPYjypOUHzWOq2LyHmZffrFHF5Y2x4HKldq/Cg2WzNMsEt9T2
         rdLQ==
X-Forwarded-Encrypted: i=1; AHgh+RoN0In2gxnCLYHYdkBvKlta2ChRqKCi/QgnsOSvQoPwGNoyhNNPX16DUN/1oFh3RYQx8sv78SKG9v6XN3c=@vger.kernel.org
X-Gm-Message-State: AFuF++lmgv/oQ2//T09AoYiuY8BX8ISMWUM6gl1rb9faZLGiMbvbczU3
	luagV0iaZ8dtFwWJz+V2CpTOvfzyKtPTRN95CAJliK7JDwz/5R3YlGSt
X-Gm-Gg: AR+sD11x8psAgFTBx7blrCUh36tV1SFTXAm5rjXhEYhMVO5GjpYAGYMWT9CQBWPGCPD
	rL9bawCpdQB24xcm7/d9CPgqM2BLXju3szJ+EB4h2GOUufWq58rB7StdkD80VHDxe9zGQdgXsQ2
	W6BSN+Vt+Ag/erhhw4KFNKPjnCKlVropn6xzdOA+7tBshbFozMTSMNTgFWb2n9t8GgeszTmNk5n
	AOZIxrx8QbWsRTKzPE9psNrk0VoxmjKPkvbURiJFLyFSWjQLnGv9X5UQ6R+Pxi8gf7LT1WfcpoI
	csSJ2WcMpJZDYqvTy2wiYPJuCe6Enb2y7HvORMoIdUHe78XMJ+DbjcicmlnkCbRWne+XD9TOVEp
	MiuJmK7gUVxN2PBCy5J/IcpHz/wtcaPdqJHQbjBXme7+i3Rf0LkW6na534xhEk1BWipyMMrfjiZ
	U/zzmI/mgZXaJcoudQkQAK47RANL8a3zw5UOvjy3o023w=
X-Received: by 2002:a05:690e:262c:b0:66d:1210:422a with SMTP id 956f58d0204a3-66e4c6d46b4mr786092d50.26.1787890737488;
        Thu, 27 Aug 2026 21:18:57 -0700 (PDT)
Received: from gmail.com ([2600:1700:5431:250::3e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ed163bcsm285033d50.16.2026.08.27.21.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 21:18:56 -0700 (PDT)
Date: Thu, 27 Aug 2026 21:18:54 -0700
From: Chang Yu <marcus.yu.56@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Chang Yu <marcus.yu.56@gmail.com>
Cc: Anshul Dalal <anshulusr@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: light: ltr390: Remove stale TODOs
Message-ID: <apEMLlURRBCmtBsZ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove stale TODOs from ltr390.c. All features have already been implemented by
Abhash Jha<abhashkumarjha123@gmail.com>'s patches.

Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
 drivers/iio/light/ltr390.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/iio/light/ltr390.c b/drivers/iio/light/ltr390.c
index bc031f2c3141..f1bb066248e6 100644
--- a/drivers/iio/light/ltr390.c
+++ b/drivers/iio/light/ltr390.c
@@ -10,12 +10,6 @@
  *
  * Datasheet:
  *   https://optoelectronics.liteon.com/upload/download/DS86-2015-0004/LTR-390UV_Final_%20DS_V1%201.pdf
- *
- * TODO:
- *   - Support for configurable gain and resolution
- *   - Sensor suspend/resume support
- *   - Add support for reading the ALS
- *   - Interrupt support
  */
 
 #include <linux/bitfield.h>
-- 
2.55.0

