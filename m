Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371A83AEF53
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477653; cv=none; b=oHw1s3I5fSApi31aVVCvUxhlcARPTSkoviIBro5I2MexiQtX3VDFh6YsczwYvSOMoUpiiReYirjY/yd8RoiFb6SQAEiGuIjMULH3c2iUZ4tQ2HzlosX5bbkGouDsowvH1aYg9+Vg/8NZ1id6AJoRO6816YSm6GKNHrYoKrOY324=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477653; c=relaxed/simple;
	bh=Pa8rCN/ylvIhfOP3MUtjtxQn4ZgMu6lbTjYns755EKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J+Xs87urU9TRDzqtYZ65YlseNz82UiONacuas2DuauYBBSKmqtVZkDQcHuTLyiybsoFYu2ZGvVxc/jZjExrW0tB2jcBjE3xp6DXG03bMN0l/VpLT/97bRZ9bkoGJrrWwyI++biXrvszkZTTsOlTN/M/p5/RO2BeUk1nxadI9JmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWYQ6hmz; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWYQ6hmz"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6c1983dfaffso4468624eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477651; x=1792082451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+zsCIkE01nFQonqFuKVR3/gHQNrFrhYBKFETrHyf3kw=;
        b=SWYQ6hmzecxf/aO6XuQD75GiZGij6IkBml5qhTAo1qfiV6PaI6r18KzYOubFTgAoJ/
         f8rNazZPfvgejxr3LcW2ETIXcJCX5mLR3U7kbzjze11qeHf879pnombKssYJfuTLMS+q
         cFBhmiu42PMVuVRdLzGWq8llZWivta0K/uDtbjAL+TJHZaDcdjRaVQ/aAXseqeEgOA3k
         uhX8gJ4yITpNI4dH+ounx1UKTg9MoOI11sGS94lbPFPvqLpFHlWhfW7YtQxyd5GjdMRi
         jLPaFuCzEH42Lxad4dJFKk/trqBTnF4ZGCkd4BaJbbOeTkyWQlklZVjPReeA2pdGz4CJ
         VVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477651; x=1792082451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+zsCIkE01nFQonqFuKVR3/gHQNrFrhYBKFETrHyf3kw=;
        b=rDdW/sOETGTwZA3V/8aOA3pVWzvZskj/98UzI6HCGcJ1ycLf5sd/z0kbzvYLjo+eZk
         7FJ9WAB0+8mylRH9AJ6jSydI9NGD10vv7IRPP+5I06GL5Rn3mVz7p0SkX5WqnhGbzUPR
         d3KkbiEcbKNwgiBz2JckZ1aVRlAFYIIs7NB4V9T4Nxf8Ol5RLs5vRWd3r05oXcGlp2Zw
         9wwV1k/E07B8QbtbCYJFNR8soVtKIS7+gPhLBcLTK6t5qfoP1Ynl2wj+l7vEQ0fRZBFS
         AcHDbQPox1ustWIFufmrTGHxI9qLVyoUbLCy9GNjAZKy16nHC0/Aal+4pB2u28Tkvfak
         62bw==
X-Forwarded-Encrypted: i=1; AKwUvBz2OklcTO/9CO5FO9tBClpTvWiwNFCqKK4Ugna1pDvc7evi68coNOHSwLmPVZE+MxeUUo7dr4p32dv3M7c=@vger.kernel.org
X-Gm-Message-State: AFuF++m4zRCV7rqqSAb7i1NtDE9gH0gpZc+7RHzioqeSSZHVqFh1lbV1
	NKPTE0dL2D45e3LoXkx9ZlpaA4QKUsQN9HqtXhzlIjhui+XgYoEVxuze
X-Gm-Gg: AYBFou17jmOW0RbtsgZwZN+wCu1HWDms/iK2ECoJ+bt/fLqOHzcHM7MDqKyjeFsBJCB
	pqM9S3pe9NRUKABq7HOU9TZgWPttB2h3hS9l+JGMwu+vyTEq+TcYvbQ6VJZcNSaLB+ArYDF3GLu
	enazwJ05bhYl4HVEjwyBVIxl5BqXDok+anDzta+BZRklO+tGHNjJS1BND+ilZgp4Drrf7ciQPMx
	oeDLKMoPRbQxEPW0nXU/sYykM1xs7pYU5fgJ5wYf38oPu2DkOoR/MxUhpBrKDw9D5SmbelCSteZ
	dmjzwJW5sOisB57d3rQ/wwu3UFBsOO0d6Q8ZS/cbZI7Dc48G7lo0D1rxkbSwa8jGGktFSfmIh3m
	rNZPooImV9+f8xpFqNn1cH01FKGDZJNSEuDBr0KS1dDjkpRMkE0MIcXBoMF+4YfQj2qPm49iHnw
	izemWyET8fqO/UGH9VbmfmNtEHxJQdX4LjYp0nO57hFTWoAQr4aCzxuzdkxayo8D1gNwRMKHCoA
	agf3gtJ24jE
X-Received: by 2002:a05:6820:4dec:b0:6d8:b1c9:6c9b with SMTP id 006d021491bc7-6e7a65db9e7mr4805418eaf.21.1791477650971;
        Thu, 08 Oct 2026 09:40:50 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ee7a7d8f63sm45928eaf.9.2026.10.08.09.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:40:48 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] fixdep: fix out-of-bounds read on a comment ending with a backslash
Date: Thu,  8 Oct 2026 11:40:29 -0500
Message-Id: <20261008164035.3668885-3-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008164035.3668885-1-lzsx618@gmail.com>
References: <20261008164035.3668885-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When skipping a comment, parse_dep_file() treats a backslash as escaping
the next character and skips it unconditionally. If the backslash is the
last character of the file, this steps over the terminating NUL and the
loop keeps reading beyond the end of the buffer:

  $ printf 'foo.o: foo.c\n# x\\' > foo.d
  $ touch foo.c
  $ scripts/basic/fixdep foo.d foo.o cc
  AddressSanitizer: heap-buffer-overflow ... in parse_dep_file

Only skip the character after the backslash if it is not the terminating
NUL.

Found by fuzzing fixdep with ASan/UBSan.

Fixes: bc6df812a152 ("fixdep: parse Makefile more correctly to handle comments etc.")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005104050.1786222-4-lzsx618@gmail.com

 scripts/basic/fixdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 54063d9804..9b57fe5554 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -280,7 +280,7 @@ static void parse_dep_file(char *p, const char *target)
 				 * escaped newlines continue the comment across
 				 * multiple lines.
 				 */
-				if (*p == '\\')
+				if (*p == '\\' && *(p + 1) != '\0')
 					p++;
 				p++;
 			}
-- 
2.34.1

