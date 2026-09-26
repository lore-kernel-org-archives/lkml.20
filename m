Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4236381EA3
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790451628; cv=none; b=Adi2uERZj4AGfNSmEisbBobfVfT9yhXzM1uIXMLX/MDXrpvKTspU1za+rKhT3c/+azxvYQWL81d7KJpO23tjGrXM9rFLqup/QpeSgN0mG2Op87nwaO79aj1uG0ijMCXnNNqEUk5Slx/nLgLdgF+wPLD5j5YooQJyVn9zO5LbbGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790451628; c=relaxed/simple;
	bh=LVYPylbZu3M6VrXkQZcoyGu2621tAs/rWNxgexduWm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pBNvFMXkU+p7bAsUU29psi8nbkq5MNApurowXbcQxwDVZx5YWg5wleiGoY3KtXC5Dtz3W3opV31RoONSmFJP3YEturND+eaGukZvZirxnpxGl8hJD/yEeBoJ1Jvs/htelR9Ek0OS0qwgaoSyIdOhj41xGUlYz6RPGvJtG6fqVck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pq1Vd1xr; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pq1Vd1xr"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c3b639adbcso1728262b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790451622; x=1791056422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YKtZQLrJoNL1FhGmGKsD48Cotqxaqos8u7jP6s8F5bk=;
        b=Pq1Vd1xrlDVKr9Yn1Up9HGTyGRvbsWvMRw9jhJlv8NQw/PaNDhs2NIuSSYi0G4h2bU
         vocK3hlTkLVsq/Xpk/Fgltk4MGjDTlzBz4DCduXIyfdIoZYho1liY0oENr53wSksf9Gl
         auh6aPisnXLVsuTNzv/wIpSVFhDaLBfQZYmsV98YbW3mKncFwmiPSxIUzJLlzmYaFkcd
         BpdvvdxBlT1PkSIbhyj42/L281Q7+9bTRW7+51dZPsw80IbSQqvYyrO0NTmXFzofPxn7
         dpeGcCLC7Gno+LcYIaqM6Ba21u2auck1wCGK6BC5Z+sAJOJNug5ZE8ezhiO8l5uiKDHM
         b+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790451622; x=1791056422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKtZQLrJoNL1FhGmGKsD48Cotqxaqos8u7jP6s8F5bk=;
        b=VuOqja54fkbi2DUb7jUbZWVR7wGiiGFqHDfXz2dF9e+0nig3qTx2Qc+kGy8eqvIxsP
         mnI7FQsCJmToCRRBPjqalt+SeY8sx0UtwXundzDWGKkr5+Of2820uaDfenqsC9422eax
         elXJAUeypfVBMjQAwERGGbSzxCTwvpiMj7JmADf6IpYbzGqqs7A9ufDu40c4xWW2Mt+x
         bY0Sg511/oDyc53qRO726BqQQL0wSSPVbs8Wnde6G7nDeqQ+lAyXlkBkTQo8w7O83Fi+
         y0BTZeeN36BaUkrxRt0LeEvIlmQ1ovIlgydi3dAizGXvzdLDTs+6VvCPhte90C9u3/N4
         tXfA==
X-Forwarded-Encrypted: i=1; AKwUvByTpKWY7QluaTEJ9l2q0ZhVSaGIgorB/XfSfZM49LdNcExTuMvBzdSG1TTDRdum3JceChyLUe+dPqn0FHE=@vger.kernel.org
X-Gm-Message-State: AFuF++l+rgQwzU/GzqYtbOnqOk+efWGQjygIoXslMZJVPQV3PJGNme6W
	tFfmUSe5x011G+2Zb1xW4sif0xGY5SLj8BA5NEHyclmPvvDlxFFz0WLo
X-Gm-Gg: AYBFou2QGMaS20oauAx+pN7GoG92rlIXvWBP5AiClTgt+7o4SrK8HwbV/Waecq6nNRj
	rFRkn/mVIJrKkdbYsS3b8qQ3qymQEprxv64XkSvOCL7O3x3VQ4hTvUffzZufkIANmVIVCZuQJB1
	pf+ToxBuHpHjUlOpCHwomN+X4DMt8ctkkb0qGMGnB9CBfcMDfUjo1LFfwzRn6LYTapEJCZ5l31j
	rA0MGKC5RA9gZI76CPV0cpYBu7Aaxvp2mPviGdgX8uG+A9Ju5baQ/2caPk+kCy3ywpLaeth9IpN
	Y1oAVzluH/zV8ZHpHswq2v1oB+U3U0W+Pa3t9YCfuF+4FtdEKhlnF2E3Mbi8vqAbfGH/4ROz5fD
	PSwFKDmHLAxqAV4ncqE5OwVBUVV636LjkD2xQ+0VKFHwuIFDjS1OsJklQkn9PKD5BD109Uc3x3f
	L4VG/vfmT2Unlm4HZ/v2ZMTDR9dRQWHNRqxe3UzHplGv33YdR34AG2Zv4RwRwn9DFtedNZz/vAm
	xkLcrG9fj7cWa3OI79KxaK131+EYHkDWhz75fGzLS4+WJNASmjkqwZ5HihyWEjDSTTNKJA06hn1
	4g6Gn3UOTcx1r1qVV0k=
X-Received: by 2002:a05:6808:f03:b0:4d6:9222:99f9 with SMTP id 5614622812f47-4d72ea5f257mr10775845b6e.57.1790451622482;
        Sat, 26 Sep 2026 12:40:22 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-49335011458sm5955595fac.4.2026.09.26.12.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 12:40:21 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 26 Sep 2026 13:40:14 -0600
Subject: [PATCH v6 3/3] kallsyms: Unroll 24-bit sequence reconstruction in
 get_symbol_seq()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-ksyms-tune-v6-3-236620c65e98@gmail.com>
References: <20260926-ksyms-tune-v6-0-236620c65e98@gmail.com>
In-Reply-To: <20260926-ksyms-tune-v6-0-236620c65e98@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>, 
 David Laight <david.laight.linux@gmail.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Jiri Olsa <olsajiri@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 bpf@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790451613; l=1647;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=LVYPylbZu3M6VrXkQZcoyGu2621tAs/rWNxgexduWm0=;
 b=dNUj7m5vUOsr5ayzqUGXa8mCtan7WqpvOb8CSFdlf7x9KECVTvRON81QIFDLKFz2EcF6imX17
 u3cQQFthy5FAaXBk1SogPOhRT8cnneAmJILB8JSWnHkrLe97OdyfQm5
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

kallsyms_seqs_of_names[] stores 3-byte big-endian sequence indices that
map alphabetical symbol positions to address-ordered symbol records.
Currently, get_symbol_seq() reconstructs each 24-bit integer using a
3-iteration for-loop that shifts and bitwise-ORs each byte sequentially.
During binary search in kallsyms_lookup_names() and duplicate boundary
scans, this loop introduces branch and loop overhead on the hot lookup
path.

Mark get_symbol_seq() as static inline and unroll the 3-byte extraction
into direct byte shifts: (p[0] << 16) | (p[1] << 8) | p[2]. This
eliminates loop induction variable maintenance and allows the compiler
to generate direct loads and constant shifts.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
Changes in v3:
- Added as a standalone micro-optimization patch (addresses David
  Laight review).
---
 kernel/kallsyms.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 91ced7aa797e..52e41879c24b 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -185,14 +185,11 @@ unsigned long kallsyms_sym_address(int idx)
 	return (unsigned long)offset_to_ptr(kallsyms_offsets + idx);
 }
 
-static unsigned int get_symbol_seq(int index)
+static inline unsigned int get_symbol_seq(int index)
 {
-	unsigned int i, seq = 0;
+	const u8 *p = &kallsyms_seqs_of_names[3 * index];
 
-	for (i = 0; i < 3; i++)
-		seq = (seq << 8) | kallsyms_seqs_of_names[3 * index + i];
-
-	return seq;
+	return (p[0] << 16) | (p[1] << 8) | p[2];
 }
 
 static int kallsyms_lookup_names(const char *name,

-- 
2.55.0

