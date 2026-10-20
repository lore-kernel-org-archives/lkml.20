Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792525632;
	b=lWrbcuMZuKiWEK8AhqnprAl5jeZEF9hy104L5t6mj6v9Ld89tIDxEQlOekFJT/qzWIwB
	 RVTY4ZG+E+2juiqWy3Ocvq7FVcQ5VZw8lrqjLmb6xUp9LYPTO/z1o4RMEJHf+ATiizUeG
	 +dMzAtkyheBV+GKttSpWKYaPZrH8p26VVSDNTG3ZHbTk+OKe05nDwTUiaf4dmr1rYGxaq
	 JvYTK/RcK9frf3m6aEzEsppSRCJeJme1zCM6Pruiwt+sgxCG35IWZMIwKcPDRc2fYOzCd
	 zaV4mUsxYWhswj19in8HNDauFuceEYofnmPxcQgrZeoB9KdeNsibv2XQ1hLe1yIPTCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792525632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=y+sSUnHde30RD2/J7ts5O/Z4HnAlTV31DI3NhnWgYf8=;
	b=TXa7yfrKmZzYiZLvoiHZkCy1y1qsysvVUTalDVUUKwGIL0dggr46KPBM/HytOUTop3N+
	 tAFWi+6u393vnTjR0JbJeFEYjXrYbAEdsboNDZOPvsCXk2nI2Ly8BH7GcHdbN5ATIUwio
	 IotwTUi5lYdO5+nTbqlOI9+y3+Be3IUmTY48jHtxR0pHCIQoudfqGKaVvWX5Z3VRSMZzm
	 tXwz8qa6epv/5I7xADH5e2TPdReVv8qFOQCZP4Wqo68GGBa/zYhAknIeLAimD57G5gEJ6
	 2hpQez2d9MV1E+B77ROYqfRXn2zhnJAKgWEqPk3MsAnMu9GOwcoDN4vIowrjHuGfQHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="rZG+/Kr7";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEC9606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AEC9606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rZG+/Kr7
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1e2957d7eso26476085e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792525630; x=1793130430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+sSUnHde30RD2/J7ts5O/Z4HnAlTV31DI3NhnWgYf8=;
        b=rZG+/Kr7OgHG5o0r4x60PwIDYM9dRqh0JLPQ4hlqE96/1PFDX5lfGwdwxOHNHhrvKW
         kf/QTLGiZK5tOZxxYZXAUVbTAqabvK1CXnj/opPIIFJQPmD9rx/JNfW9sbAA2g/3u6e3
         ZX8DT8+yuKIROGhF6hQxLzYNbimbHtQg/6N4T7EeJyndyUJkWl7yiUez1L2B3JOuOHZl
         x/IbYF9NGnWjiT3rya8Ki6o7ZmkTiEX/7Rhh5VWlSnNsjnApPiw1+L2KfexlkMXlapyI
         h70tIlbLBEKmCkxcLFtD4wVlK7jdFt+SkWC7BtYXebpVuClQDpQCjTVKbZJ5X7NdAQaT
         Ltyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792525630; x=1793130430;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y+sSUnHde30RD2/J7ts5O/Z4HnAlTV31DI3NhnWgYf8=;
        b=mfhf9T8Sa7MEJwiq5lm4JCWvEmm2AxQVQqwtwxHGlAHkWnptz9/KbgDJ2kWBpnU1P/
         +LZrb8jmn2EY33ex9N9/toOg5AK+iZAr8Ph3R6hPzdCvETet3Ta60U5VP8t68zLTgJZB
         XKUsQhwCaZODa6c55STO66b+VkPF8yTAxqyyg+KcLlbUSeNMZ5nrpDfwyz8DM4rLnY1b
         VXGOIG31XEtHvFArtNfFnZxRBO1+kCZ/rwgphNa3emujcB920uv4/b+MbiAQuokJbDoF
         k2cMh32FJRR09IIAB2KjPT4xuTmANLvcy2xqweanz7eKLh3/mjzqf+5bHN7J2s8F9c/V
         Xqig==
X-Forwarded-Encrypted: i=1; AKwUvBzWdIsetQsw5UnoMT7QK5VM+Hsyr1NKjpgtsU9/Z7N/G+CZmd3givljZ53SJwvH0PotG9a21jdkDxFkrJ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYISiSP21hDkDP0b3g9JCkRN2oD1nJuZZ4LrQtnj/X4YAGzAoTWZ
	kFEywoHyR5AuYLnQ2VfhDcrJX4WWQ/n0r/jxYBVuqN8kHuJNB9G7unZx
X-Gm-Gg: AYBFou1+LylY7w2VkYQVAkaicY7nU1dFEcbdRe8VA8BmuqOV/m1k6yGZtNhO2gp+vTo
	RLsLpDxIXJpbPgWhAEaiRryTNEnDKFrLIpTGwotNL1/bzxekLRKiAvzx8sUhucgVSD+nnRaSI1n
	Tpo7WW4PcJEEGyqAyIv6vSXENQPaMAbQUuePxPtQ+0XXGDccxjqebsU3ogG3B0GP1TO47BF8p+o
	w65C5tDpcU00Xky6Mi+MeIHzHaN54zQVoaxm+sxUyxF09RvqNZKJYXiNczb+4gAw5bdd3ZN60AT
	OkVsPuIBF414KK+BiSJI07Jpqy7Ysmq/tUvdntnJElzhP/A6X1b60Y6XoEojOFjyw5K3/03Tuu2
	e2Vrbc2CjdzZMAFXlM8qj+8VUT6QF2kB+ByjShH/OK/5AIB62U/3BX41uhrs5JgeybY/TClAH0T
	W0/svtLuyosgSUjiHIGdrR9wkMdb+x3YJHlT8U7PIysGJ++mPttvH/ckC0kbUatzU2P5m84Xc3y
	TCvXNvKjnk=
X-Received: by 2002:a05:600c:4e03:b0:4a1:d292:9d9d with SMTP id 5b1f17b1804b1-4a1d7644192mr276958415e9.35.1792525629690;
        Tue, 20 Oct 2026 12:47:09 -0700 (PDT)
Received: from ADRIAN-PC.lan ([171.22.87.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828caesm450994f8f.29.2026.10.20.12.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:47:07 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: David Sterba <dsterba@suse.com>,
	Filipe Manana <fdmanana@suse.com>
Cc: Chris Mason <mason@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: [PATCH] btrfs: add __printf and __cold attributes to do_abort_log_replay()
Date: Tue, 20 Oct 2026 21:46:59 +0200
Message-Id: <20261020194659.246816-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

do_abort_log_replay() formats its variadic arguments via struct va_format
and %pV, and is only called in error paths when aborting log replay via
the btrfs_abort_log_replay() macro.

Because %pV hides the format string from the compiler, GCC does not warn
about the missing format attribute under -Wsuggest-attribute=format, and
callers do not get compile-time format string validation.

Add the __printf(5, 6) and __cold attributes to do_abort_log_replay(),
matching __btrfs_handle_fs_error() and __btrfs_panic().

Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
---
 fs/btrfs/tree-log.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/btrfs/tree-log.c b/fs/btrfs/tree-log.c
index a00094604e..5ecc585061 100644
--- a/fs/btrfs/tree-log.c
+++ b/fs/btrfs/tree-log.c
@@ -158,6 +158,7 @@ struct walk_control {
 	struct btrfs_path *subvol_path;
 };
 
+__printf(5, 6) __cold
 static void do_abort_log_replay(struct walk_control *wc, const char *function,
 				unsigned int line, int error, const char *fmt, ...)
 {
-- 
2.39.5

