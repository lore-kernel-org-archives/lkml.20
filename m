Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677844;
	b=UhkpfFUan1Wm7POiFaQ0uMMffYIS6jIGIWluiZ3XEr3X9KyZusTauFKcBicbnlujfu1t
	 vA+JqkwDHTrpz2rSoWSOgUT5x6ssg3SUY1e6UsQVr/i0TS1YzSxfPLA9Aqo1tm6q2VY16
	 96kY5G+wnBNNMP5PjkPTItCUUj3RJTwdTBzpRUEab8888fCvvegIVv+F7LykMpDUXZfQZ
	 UzBCUN1ZeE1hfkA9yk27MBKPeeCy3kijwZXqLeBDFYcv1tbMntDiJ5jELF0B6Z3an/eyw
	 2sVI8mJx5+SUP3AUjgCg87wMfmRLff8HcDDwggch4g3xLW4wO5FxQ1WW43o5sNx91nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ycKvX8Drm1ZvoMRZEoe3zfF22B1tSstY8gdfVXXNT2o=;
	b=xg+3PelYbZDxeg1tEde7UhSSf6aN9Ez9jO5i+Y0FsOEggOA5/XhLOAAsOhFclIB5OQX0
	 MYD5auHc+brUNYP8Th7ATeHSbieBl9wkWHiFJJmihPP7kVmEkv/qGFI2/smPCemQ/jU1c
	 I8Lu58GDXiInTZf87hgGSoYvMDKGvLaCrDi5sAnRAkupJV5xXyjYZMrVmdNnMrccEizRS
	 uuI2JHK9+epi4XpsFcyZvHuglC1kgkObWqP3WXP0du4EMUzYsTl33EWUSoWqXSbES2N1l
	 WCZYBB621Tr3Qfrgd7ESejCTCChTLx29UU1vE8JN8+uZtsAPBxI6NE2sAAERK9QBQhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q95dGijh;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84657606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84657606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q95dGijh
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535a54bed9so2735903eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792677844; x=1793282644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycKvX8Drm1ZvoMRZEoe3zfF22B1tSstY8gdfVXXNT2o=;
        b=q95dGijhUGm9T1dwFklOpJTx/iF0HiZFgjud+cS4Sg5sFeT9+W8vWya5hwChqSXB75
         z/WQRL9/6FST/rhq442VSSKNP4p+OetPB2VySobRXniMJHPeC5sG+5Q5+VW2F/foSfpC
         UosSq6a+hv0qxeuGz9eXy5LyWThJdsOolklkXIjApMXk6xDFPnD3LOrY+iaPMRl1LNEF
         /QBQXOKE6o/+6utD6/7AjAjzDdzK60vnGLjQ0LB52D/TWKUThJeqhex/Dec51e8INJJ/
         9OqMY1Zj8MmqqyuCSIEBBxZ1FE/ygnVPlTOKQ/UQ/S26xzkroyURc0ieJjIVaONN3bDP
         oDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677844; x=1793282644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycKvX8Drm1ZvoMRZEoe3zfF22B1tSstY8gdfVXXNT2o=;
        b=zVRWQpliyLF2UF15SmfOZaZmdmp6Z3SIVjxrBxYZDPYmVEDyUESPeu1teywqmV3nqo
         MFrR9H8tXo3Imx6FmbefFwrJABd96CrcnNP8W3anXwuPqv7U6NZxgnwk3atl/zgASxY/
         PDWuMQ6uBoFmSjRcUtZRDUs0IPKMq6Tm+a7/Ii+lNuKwfEvIzIovEOT+uwMStCV+4Nbs
         W1agRGw/N08TRd9a8e28yWg2TKenoNLC1Hy1erg3sSjj9bBOcmTA3/mCe3u3PoxjH3As
         EgPhIvxMyD8FW3Ivz3/zB1tTGxKc39h5fYQnHU/mkMMuNUHfHdv08WFr3Qio2BaSlgkC
         wR6w==
X-Forwarded-Encrypted: i=1; AKwUvBx4jCYENz8+fGD5AqzUKbWscLTGr8++CxcRtpjuf5ShCDvr95xB821xsc2q9nYa8BdXkxjHq1pn9IXxub8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUFOhxIq5+sWIQpEzCzFkIlFeGmvsdzUgqufhheI7EmT3LQmBr
	SIOcROx6xMMVpgvi76dEqvYMv3Z3RiyVrsYXg8WmEzyfiSiaC4fda6nV3VTopKen
X-Gm-Gg: AYBFou1gMKTNUBp2ml3dyEJsrdKruwV9tjqOiwOYiOcM1tCs27QXy55unxgJCIkHX6G
	+1Z0vfE4PMNeEwa7Cbp67aFtVQXHKorEAwozKfrZZvYkHE1EPMcs/v8+LUHjsNkx5U5IogqcSOk
	1f9olOKf1oBpGfmUf2rcdkrntir5SQRGPGPIgtb4c9SfB5JUvWJZjpG4P3zd7N6hiHt5twvUPmQ
	1KRg+w57HfndTgzdR6Zvtha7YyDuOIZDQdPbYDWiTzlXkgBpm9Yb+F5dX4mreRpCTIIPXn5qPi0
	qiPqVJmM2nU+2qBtp4r2k6cK7jn4ntOShKBayP5AGU6x3QomYHZHnCRE59kpXhOB/yBT6ckBZg1
	5zJPfc2M/RJU0pNbE9YlnbJmN/OcQZ40RjDcI3195eXpgEA0AHlMh8hGsIRsHADoAJ6jb8Yq4nE
	RfAgOCioOApd8vND5EUIRz3ySVMYDAtNa4u4Ym/A6Z0KDztLWfmceaJ3OLh4PvHgc8PeT29dvhj
	6S6NTwuk07c32zTkyXI/I69VFd4JNgs37rqHMw3qPySu9mDa9ckhC1lNyYFHUHDuWvCoN9UJXPi
	T3AQyKjgBxIq9wicfRnO8HNxwUupfr/JXCqr62PJC69T8carz5ANjdutJoS+Fm3UwP3jdJ2NEgM
	M8i+RTpf4NjA=
X-Received: by 2002:a05:693c:8399:10b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-3674a40738emr7987837eec.5.1792677843191;
        Thu, 22 Oct 2026 07:04:03 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm24668097eec.24.2026.10.22.07.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:04:02 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rodrigo Alencar <rodrigo.alencar@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2] iio: core: fix signed integer overflow in iio_str_to_fixpoint()
Date: Thu, 22 Oct 2026 19:33:51 +0530
Message-ID: <20261022140353.24213-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__iio_str_to_fixpoint() accumulates the integer part of the parsed number
into an int. Feeding it a string with more digits than an int can hold
overflows that variable, which is undefined behaviour.

The parser is reachable from userspace via the writable IIO channel
attributes, for example the "sampling_frequency" or "in_voltage_scale"
ones, and via the exported iio_str_to_fixpoint() helper used by a
number of IIO drivers. A user writing a long enough string therefore
triggers a signed integer overflow.

Use check_mul_overflow() and check_add_overflow() to accumulate the
integer part and return -ERANGE when it does not fit into an int. The
sign is applied while accumulating, so INT_MIN can still be parsed.

Fixes: 6807d7211327 ("iio: Factor out fixed point number parsing into its own function")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Changes in v2:
- Use check_mul_overflow()/check_add_overflow() instead of open-coded
  s64 accumulation and limits (Andy)
- Apply the sign while accumulating so INT_MIN needs no special case
- Drop the unrelated parenthesis change and the explicit casts (Andy)
- Add Fixes tag (Andy)
- Fix the truncated subject line
- No KUnit tests for the current parser, as it is replaced by the
  E notation series (Rodrigo)

The fractional part is left as is: with the fract_mult values used in
tree (at most 10^8) it cannot exceed 999999999.

Tested with a userspace harness built with -fsanitize=undefined on
inputs including "2147483647", "2147483648", "-2147483648",
"-2147483649", "99999999999999999999", "-0.5" and "12.345\n".
All inputs that fit into an int parse exactly as before. Compile-tested
in tree with W=1. Applies to both togreg and fixes-togreg.

v1: https://lore.kernel.org/all/20261021225306.623361-1-kapoorarnav43@gmail.com/

 drivers/iio/industrialio-core.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index d73f2541375f..f3bf17c13cea 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -25,6 +25,7 @@
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/overflow.h>
 #include <linux/poll.h>
 #include <linux/property.h>
 #include <linux/sched.h>
@@ -1027,7 +1028,12 @@ static int __iio_str_to_fixpoint(const char *str, int fract_mult,
 	while (*str) {
 		if ('0' <= *str && *str <= '9') {
 			if (integer_part) {
-				i = i * 10 + *str - '0';
+				int digit = *str - '0';
+
+				/* Accumulate with the sign applied so INT_MIN fits */
+				if (check_mul_overflow(i, 10, &i) ||
+				    check_add_overflow(i, negative ? -digit : digit, &i))
+					return -ERANGE;
 			} else {
 				f += fract_mult * (*str - '0');
 				fract_mult /= 10;
@@ -1052,12 +1058,8 @@ static int __iio_str_to_fixpoint(const char *str, int fract_mult,
 		str++;
 	}
 
-	if (negative) {
-		if (i)
-			i = -i;
-		else
-			f = -f;
-	}
+	if (negative && !i)
+		f = -f;
 
 	*integer = i;
 	*fract = f;

base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.53.0

