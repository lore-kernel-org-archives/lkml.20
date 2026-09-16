Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B7C36B921
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525989; cv=none; b=t3viPM7hgy5oB3u/RRNfX3/lm0woTiKCmjAQKD3WuOiN/Ego77gZ9K7t9Vw3OFJBs4PE0h5+usWBn1Do9s44c8IfzSup+ZBgvDJ5wawKOQ9qv35UjUaDlPuHQbU+0c+RkhITYiZo91pr8Yevm1M/BEfgNUVjTfp1QtlcgQJzBdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525989; c=relaxed/simple;
	bh=2oFt3EtEpiGwe3rzGZCTRQ/Ww35L9D3e+wOYaMej4TU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CzH//4s12jLtPkPPtWXRFbIvFT7PNdu0vNAIBiAZrkPKJ44bxBP2/cWahaNfrWTWbBXV7OBWV9HvqQAyGqT9tSTNhAxvlw2hKqdzIiLHqhnZ31M5/87jlaWt1HFWGLNGxyoEeirR4PXzaWU3n+vU7pYnPGNYnx6YNrelUmqdAmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJ0veSpO; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJ0veSpO"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-868a9c48f9eso465654b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789525982; x=1790130782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dnk5a5Ab0LQ7fyOSCNiI3Ul5/VN1Ofd3pcPgjYb9f1c=;
        b=PJ0veSpO0XZBkNe9Pr8xrWcVQl7LpJZIvv3xeOkadGATh/QOdXrABr2Mjb6G4Ayd8Q
         dCAHQ4m+cW7P1LCVHzY5ksKwXy7yQw1Hf8PGZn54vK/Lrz5f40B99z3Is1nGq5ZszjC6
         rEmv4KR4gLE/XQvW/bxCelHNahg6oC2D1/8I8c09o17JKKSYr5X0AkS1CbaQsxfx4BT6
         FJC2q1thuEHf1hG0aSPeood472rnXYAsnCKO6B97uDI3QeQxpR06QXG20JzKmucc9Hoy
         a/yodpy/99hlA4Q02rQnAXQhSIEY92AbjyeDSFtyFuHGrfmKCxXYThCk/IzHRQCCukfI
         knJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789525982; x=1790130782;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dnk5a5Ab0LQ7fyOSCNiI3Ul5/VN1Ofd3pcPgjYb9f1c=;
        b=M/Ao131EW64z9w5/OkMxtp3k1S3w96Cjvy+S8ElIU0V8ASLnha9m6EYvHMzYaoohLy
         UG9sHwq2qKBQQ7otS2aocRWZ4lcGFnwlRtVHPRwW+7FOISTT34VKfVmGcg/8fZuSFRlI
         aFMQOW0yQwKbBtoR9/1zkbUu8zgW/WvRAxcaR8tiiePwWkD8tnklJRx4r4Knn/e+ahfN
         G1awlQ2Fp7EHxoOjQtbfJRdDg/XAAYRyCinZTwMLNHw9k24E5W558BbkY44hEPJwkCsv
         1Ot060yQjLY22upyHVOoZVIg+FykTlW24OM1CcNkkxCbKYwVoF01wm+ocK3KkD5P1bWQ
         TRNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoginctzdNK7H7RJa5+5u75VkrURKR58fQqL/S52IVTlkjuXklGrMefVWmS5vndRvUWGrslUdU5dReIzA=@vger.kernel.org
X-Gm-Message-State: AFuF++n82rF6YUBsZHv7MaX8247Q7zDldgEPTBZiOaGEpVwIhsz+Lr3v
	+ixLpho1nnxVdrOj3U9ftmJofrMeljC6dwoc9I0nzoDNyUdXBUl6lWBJ
X-Gm-Gg: AYBFou24PtMnPVe/VyOL2hK4Bw/wjB8mwG/dajZ6NpVmd6GIv1NDUAJ0s0HJgygP4Nf
	tHxvV9Z2NgH0ZdGQ9F+NAkGbGVNXgTQqdnSkwkNu5JqWpxKb5Boq79t4afbfiMqwKZZmqE2yScZ
	BsFM3vfRp6PGj+pj7GbyMBGPYvrfe2PvZoir/twIN5hOZEpez0YP9UkjExPbp7FxYrMR+y++Tzr
	6AvqhHQ9a7rTMGtDIyOBbwMqMxYVHF4ZYHQo+uqJf3EcSxmg4vOz6V0EZXaYPbL5/uwdPd1IjGo
	HQ2UiUnQ/Me7FjV5xlJOLyzhuZM0Kcacnmuyh8o0buISFvJuvtzEf6s9Ofb2FD4HqUlJCl1IxKD
	AEoF5V9b6pBD/9ia5Bu5x9+bx/UtCAVrW0PZR4m2/CrBoZeQQt2NqPrhdbRKUW94a1bQn4POj/P
	mePiJUm54l/pRJyvMGSRZofF0JiRh1W+JALsFBAc1nKN8fE2A7Yj0cQJm+4LVHmtdAvsNgV/Mcj
	g2JslrK2vs=
X-Received: by 2002:a05:6a00:3698:b0:868:b157:3b41 with SMTP id d2e1a72fcca58-8723b3941fdmr1411351b3a.6.1789525981802;
        Tue, 15 Sep 2026 19:33:01 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8720123e374sm381370b3a.24.2026.09.15.19.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 19:33:00 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: tglx@kernel.org,
	thomas.weissschuh@linutronix.de
Cc: luto@kernel.org,
	vincenzo.frascino@arm.com,
	david.laight.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v5 0/4] vdso: Keep the CLOCK_AUX base at full precision
Date: Wed, 16 Sep 2026 10:32:48 +0800
Message-ID: <20260916023252.418473-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patch 3/4 is the fix.  vdso_time_update_aux() rounds the CLOCK_AUX base
down to whole nanoseconds, so the vDSO reports 0 or 1 ns below
ktime_get_aux() for the same clock.  1/4 and 2/4 prepare the division
helper it uses.  4/4 is independent of the fix and can be dropped without
affecting the rest.

Changes since v4:

 - Every patch carries a single From: now.  format.from was set to a
   different address than user.email, so format-patch emitted a header
   From plus an in-body From, and send-email then added a second in-body
   one.  That setting is gone; git am records zhanxusheng@xiaomi.com for
   all four patches.

 - 1/4: rewrite the changelog, which referred to a loop it had not
   introduced.  Also put __iter_div_u64_rem()'s signature on one line, so
   that the two helpers in the file do not end up in different styles.

 - 2/4: put the __iter_div64_u64_rem() signature on one line, 90
   characters.  Rewrite the changelog and correct a size claim that did
   not survive re-measurement: the 16 bytes come from folding the two
   open-coded loops into one inlined helper, and the u32 return type makes
   no difference to vsyscall.o on x86-64.

 - 4/4: rewrite the subject and changelog using the wording the code uses
   for this.  "clock id dispatch" and "dispatch mask" were mine, not the
   kernel's.

 - 3/4 is unchanged.

 - The tag block follows the maintainer-tip.rst order now, which puts the
   author's Signed-off-by ahead of Reviewed-by.

Testing on x86-64: checkpatch --strict, gcc W=1 and make LLVM=1 are all
clean.  Built and booted with kernel/configs/x86_debug.config plus
panic_on_warn=1; no warning fired and the log holds no lockdep or
debug-object complaint.  A guest with an aux clock enabled saw no vDSO
reading ahead of a later ktime_get_aux() in 100000 samples at each of
offset 0, +5.123456789 and a negative offs_aux.

The generated code in vsyscall.o, vdso64 and vdso32 is byte-identical to
v4, so the reflowed lines changed nothing.

v4: https://lore.kernel.org/all/20260902033801.2912699-1-zhanxusheng@xiaomi.com

Zhan Xusheng (4):
  vdso/math64: Use OPTIMIZER_HIDE_VAR() in __iter_div_u64_rem()
  vdso/math64: Add and use __iter_div64_u64_rem()
  vdso/vsyscall: Keep the CLOCK_AUX base scaled
  vdso/gettimeofday: Assert that the clockid fits into the u32 bitmask

 include/vdso/math64.h   | 31 ++++++++++++++++++++++++++-----
 kernel/time/vsyscall.c  | 26 ++++++++++----------------
 lib/vdso/gettimeofday.c |  2 ++
 3 files changed, 38 insertions(+), 21 deletions(-)


base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
-- 
2.43.0

