Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE64F3E9C37
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727866; cv=none; b=bvYqZVLNQYBvjVBVpyo+P2SvRRiErXoAYdoN/o+YOR4C9akdGaOuDbUj/5I2E86Yszyw2fY4Of6R3otk+2SIbUA9u0ZoG0DrEwg47BunzeaSAbbG04UK/V4/XIBMubYTF/O4q6MwCgwhaGKMfLh3dvlmcCXcenvlC58FzqMGCII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727866; c=relaxed/simple;
	bh=mfGXosn2SGllGaqkZZDA/lIOONKAEN1vpju2HgeFDvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sCIwp81gYzFdUM/B57kTedKeGu47ub9UBdPXKt7Bcmc7rGvI6Rtg5KBdtivEe0Ac72IjB23n/0kuoMHjBbrbyeHekr/BwSLhvQ5ZMjcebGrSEzHfrX6es5lqFfv5aDLZncw4dWd4ihPVUBCq9useFtx2JgvL78wJuTZHMNESVRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFLPi0MN; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFLPi0MN"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed1368so7405515ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789727864; x=1790332664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIrTUDN4EXHP2dLvPbYJIcKjNzxSJgvvf+nmsm+pwl8=;
        b=cFLPi0MN+TiF+wME8Xx2BW12HJgLbEYGARp4ISA2yP9YSH3LcFvPxESv+OUp5Fk/pM
         S/MBvnd3IyzjkTuMG8JRUc+MLsObDV1B72bPsZRA2d2JDrthFns03EMxhc7b0c9cWY8t
         bzlodyTcT+HbGTQmwfX+NUj8h5Rx/0UgaLR3AamqhezQRAVjZkyY+wbJDS6n0IKvHsro
         qFMZ+79H5aWIFK8XnHwVIdNiY7c08TJNU9I+jTn58pyvhq7JA9iJC7orkwhtNNNVOnGF
         gNrC5U+fSPaStwRI/7/4bVmDNKIio8ChRR7QY2nfKIS6QE4Aq8wFbVnwniKR+ox+flSU
         Zakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789727864; x=1790332664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LIrTUDN4EXHP2dLvPbYJIcKjNzxSJgvvf+nmsm+pwl8=;
        b=FLUY2602vmziCgdOCF2H7nw51cWYHFaF95PcrLagw97Iq4xDjzhbKFQiP/tJ9K1N9Z
         ycRjEUxl0H+34H295yEXP1m1H5c8popz676tjytJFvYLFlsTjwnw5qj3kVSzhMuL69LX
         pRHXqBirZ6pLRG9OqmQyqTzp3aY9/wX5+MeF9wu4ufqUQ9oFwEWln/QqmQhuCeC/GX4a
         d9AXeApLEtHmSNGOdLMCfsMECRjMVHCQlkeTYqsXyj4593bZMJUJsJa6sB635De2C+TC
         fqXd20HEJC1O9E2xWEqVwXvrsk8ZF9/AuGGT299fbEOKNxJltYuR0IaqMtvNR642MVLE
         BK2Q==
X-Gm-Message-State: AFuF++m5kYISpSwUneWX1LwFV3X8P0GDiwgNu4b8i+nD3cp+7Mm6Kkwn
	l0tawxc2onOBwDe1/UZj3kIkojbgH+pr3WL9zTLuO+NN8qTVUTLjlTZD
X-Gm-Gg: AYBFou36sUao0ELWCCsU3zUEL6H/YllB9PIvbFWNi/Z+eBoJoEYretdYEb/s6uxCAlP
	YVeY3kpDUGh+plyaVhztgNg7wDQpHg4k0kjclZN8ACig7ZMXdkO5JOa1lva/TJsfM527bsmVV4i
	/eErVBtddfulwqSFDRUVQVh+T3UuMd+1KvF0DNjg6hBuMcd52B1RqbFC95iMkyvEXootEh7M1Jo
	A4CzumCdwyomYiWvToVEBeR5CCe2ATwQBI3CDxHwr1OuaoZ61RJ6798yII2CVlJTSRSaW1/owrg
	r7MEcll9f5YpsAb9AW4nzdqWPfZu0DIgsaL5bQFchHhH2P9KGXp6CEQwFldK1/35eYwdyESMfgw
	lgNULs1+MiZsMI/eKyANDvR2LqOstf3SjO/hEbM6hfl3SDdcf8QjbznV/3Cym+M163n/ubUQJfv
	Lgls1z+/XYSxUzSdTdNVF03UJTp0AlCCUtA3cIYhjoJ69qITiAzBk4ua8bs/m52+pWtJqIexLqS
	YlJ9gqOy9jd6P/fsYqEWhnMk/nVodKwnsvoqsCF+R8oa2CrfV012gN2cS9xLl85E04y7MJa0s+b
	CAhByUu/Mfk1m0ZQvZ0gYAUGLA5WmpKSrJ93+JUS2z1hlH0a2cs4uKxC2SSxVZ94
X-Received: by 2002:a17:903:2f91:b0:2dd:b20b:76a8 with SMTP id d9443c01a7336-2ddb20b7ce2mr46256225ad.14.1789727863731;
        Fri, 18 Sep 2026 03:37:43 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb760dd35sm5749815ad.80.2026.09.18.03.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:37:42 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz
Cc: linux-kernel@vger.kernel.org,
	hch@infradead.org,
	djwong@kernel.org,
	david@fromorbit.com,
	amir73il@gmail.com,
	ansgar.loesser@kom.tu-darmstadt.de,
	Matthias Goergens <matthias.goergens@gmail.com>
Subject: [PATCH v4 0/2] vfs: add FILE_DEDUPE_RANGE_REPORT_PROGRESS flag to FIDEDUPERANGE
Date: Fri, 18 Sep 2026 18:37:36 +0800
Message-ID: <cover.1789653814.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aoQcvGw4UmkMKmUz@infradead.org>
References: <aoQcvGw4UmkMKmUz@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Christoph, fair enough, and sorry for the delay. v4 follows with the
changelog rewritten to start from the callers: dedupe tools advance
their file offsets by bytes_deduped, the kernel can shorten a request to
a block boundary but reports the requested length, and rmlint on an
ordinary invocation therefore reports a pair as fully deduplicated with
the last 1696 bytes of it not shared.

Checking the v4 text against the code turned up two changes of
substance.

The DIFFERS advance hint from v3 is gone. The comparison covers the
whole shortened range and stops at the first mismatch anywhere in it,
so on DIFFERS the kernel has no mismatch offset to report; a one-block
hint would tell a caller to skip a block that may match. v4
reports 0 on DIFFERS and leaves subdividing to the caller, which is
what rmlint already does. Darrick, on your sketch specifically: that is
why I dropped it; if you still want a hint there, I would rather it be
the compared length than one block.

Patch 1 is new: dax_dedupe_file_range_compare() returns the positive
iomap_iter() count instead of the comparison error, and XFS passes that
up as the remap result. Today the ioctl masks it by reporting the
requested length; with the flag it would surface as a successful
one-byte dedupe, so it needs fixing first.

Also corrected from v3: its text described the flags field as a union
with the old reserved2 name, but the diff was a plain rename. v4 has the
union; both spellings compile and the struct size is unchanged. And the
changelog now attributes the shortening to generic_remap_checks(), which
runs before the comparison; v3 named generic_remap_check_len(), which
runs after it.

Two things I looked at and left alone, so that they are on record:
ocfs2 returns 0 after copying inline data for a whole-file request, so
under the flag that case reports SAME with 0 (FICLONERANGE already gets
-EINVAL there today); and kernels before 4.5 ignored the reserved
field in the btrfs ioctl, so only 4.5 and later reject the flag.

The fstests test for the flag (generic/806 v2 on the fstests list) was
written for the v3 semantics and needs a v3 of its own; that and the
ioctl_fideduperange(2) man-page update follow once this settles.

Changes since v3
(https://lore.kernel.org/linux-fsdevel/20260817115609.3586664-2-matthias.goergens@gmail.com/):
- Changelog rewritten to start from the callers and the measured rmlint
  case (Christoph).
- DIFFERS no longer carries an advance hint; bytes_deduped is 0 there.
- New patch 1 fixing the DAX comparator's return value.
- The flags field is an anonymous union with reserved2, as the v3 text
  already claimed; v3's diff was a plain rename.
- Shortening attributed to generic_remap_checks(); v3 named
  generic_remap_check_len(), which runs after the comparison.

Matthias Goergens (2):
  dax: return the comparison error from dax_dedupe_file_range_compare()
  vfs: add FILE_DEDUPE_RANGE_REPORT_PROGRESS flag to FIDEDUPERANGE

 fs/dax.c                | 2 +-
 fs/remap_range.c        | 4 +++-
 include/uapi/linux/fs.h | 8 +++++++-
 3 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.55.0

