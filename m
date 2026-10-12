Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546A0EEB3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791781264; cv=none; b=farxNvY+eStyI8XlcRiCnSoU7cNeNsIsohoYnpcNqYGflLrGoo0cwkoWXibslLD5UfzUww3JV4i0q9pvZPHa9+BEzaKX6xbvDc0ttgZV/CFcucB1gZYU3x0X5TfIW3F+dvAK0k0Hiy2HqLjjVxXd9UBAK9uF8W1QQ22FdwKUe3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791781264; c=relaxed/simple;
	bh=YSPqAppYIDiXgXhCpT7joAM6e8KmwPlOW/NJw44Sujg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BAaCuBeqmnmqI9wN9BDiJoo/hxgwpFf5uJDuKnpzjMYGmNs4EEntISiiMo+agOSmVtCO2gVtRhNbTvuZK4rbDMeFKUeJiYvHK37nJXCUG2h6O9bzVgu1tbMKR+vWMPJeF7VjlDPAkKMXtgYM4H2rgg/Mc823pLNMH891OtdiaWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1DScy+v; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1DScy+v"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so499956eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791781262; x=1792386062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sh12r1iPHZpHQ+j2VdLQ1JnDQGI9QrQoo85Y6cAkElk=;
        b=R1DScy+vk2oTJOu5T6UDU51IGBE/NrMiLGxqfpqxOIYx3ZSusrtpaNZByUUo+m7nHH
         9qYvxj5MGE8RgOOO+9qKpvCuhZ9Rg2K1NLQ0fo4i8YSeWpq/gFtXNtQz4BQqt5JIaIl6
         m/STNEUo64bsXYVCM13ICz8FSbm4CDyFUP0aGCX3UCT4dnKYRJKlwofVNwXv18zNc4S2
         Zz8IgYV+KJ09nFkXP34/UghRzsWe8ZNVtVcZfRbVjEEDty0YwAo5WWbbndhNNCT8MyqG
         sxuSz1T835+X6dhLJGvkBqCtWhBHlqkrt+6t0KURsAnZAm6vmo2Yc0/l9hj8j/u1Dlpb
         4pYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791781262; x=1792386062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sh12r1iPHZpHQ+j2VdLQ1JnDQGI9QrQoo85Y6cAkElk=;
        b=HfrzMbUfjIJ3cgSRSqfa5psAdZisKXgyyEmzJjt2SaEQs79TTxh/D9MseImVXjiOWK
         IpbVH4MjzdGtGI3WNuocK7/bxtWkIYNGRqXUZWu9zuUYalkfmj91VECqvgKdRTeLZj+u
         5wCMQezAy6tLx2FlVclaC3gT22HexnLp2rCTlBXp2ylROADjjPqKAKVq4PlnAlqizo0d
         KnLJ6QnfRVsq5i4f/Xkte/5m7zxORUbmgznsUfyg7k+n+J7eRHsbjKqCoVCqCsKmWx/o
         +oNG4FT+JBnYtgYsrKJxzSi91uOWMHLhwqqim/Zfk+vL0P4HyhfO2aAfDjTia3jUMs4N
         DZ+g==
X-Forwarded-Encrypted: i=1; AKwUvByun8i+aOZDzhOA08ex1fbqfgoaEt2rRWjKJUVHiUocFRzF4YHgh6He5MX3RJ+ApZh3tO3nyhcGvTvYihM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJToDwUJhERECB4QNjBPwOJhiZHsIIUD3qwA/tnr5J2DaAvSgQZ
	Km6Fs+TNZ6u8cZ4vOV3OtrD9Hf1e8lKXeIzxaSXexev5SVde+CkYteFu
X-Gm-Gg: AYBFou078ZGfwxBI71mAYmhl4+0W1JvYiic60zmy7Fkm0LYkn+w1wuC2+b4nt+CZ5dc
	Hx0jEQxqUKhZmEDTo02KwaeQpoR22pVSSE1niJJxU8IuQwNMwf0c2vbn/dsofPY9p9aCrt/AIn8
	fwWIY1kDxCyX3WI1Snudwq8iJKnaKjpo7CCGjL/jp69UvAGQPK+kzJ82qr2+5XmZAtnaqa//Boy
	xSEv2DMtGM6QbPpLXczmb1AJG08vMdEKbnGyrjdSHgN9Z5qLasrqsof3dI1tcgmIJJzSeISWuiG
	nKwVfostwFvjxd0WjHdlJQmS6KfSo32IA4U/IYtN5o7bPttS4FUH8u/Sc/Sk5SKTe1bJw0SuC8w
	HougRiQ4z5TN7KtqUW+8J//tJ+1ffGH3eIk6cm2oyvR4vf9l/7nWzIygsxClwggFJL3OQNMHAp+
	fruePr7B8+7+dqa14ui6h0+a1lnh8Ix05CRa8Gr2HdWdG2TuqFh/Vzp9qhrfPGwTLDEXIbtLCGX
	C1wN2w6cf+PWnjMMx5+VNpHbEX7vykGEY4HOwzvgHvMwTicxzasRmoC38CDtCl0a5illGYW4Bts
	XWLIrnFBTysMPz/Ci9oqUpxgd14I5nb4sDWjGi4orpT1hZwMS9ngx2gct2+pPVoQjKr8BbReIHv
	V7SPnWetWljgFU5PGDbqZMaQLlctLn6z9mylo/utyhAemRohiUrhG9qM=
X-Received: by 2002:a05:7300:e9d6:10b0:354:1db3:674e with SMTP id 5a478bee46e88-3541db367f0mr12293844eec.6.1791781262172;
        Sun, 11 Oct 2026 22:01:02 -0700 (PDT)
Received: from FT6N242TWK ([223.181.119.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm31804877eec.18.2026.10.11.22.00.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 Oct 2026 22:01:01 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] iio: magnetometer: fix the register restore on resume in mmc35240 and mmc5633
Date: Mon, 12 Oct 2026 10:30:53 +0530
Message-ID: <20261012050055.48850-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The resume callbacks of mmc35240 and mmc5633 call
regcache_sync_region() before they take the regmap out of cache-only
mode. Since v7.3-rc1 regmap refuses a sync in cache-only mode with a
WARN and -EINVAL (86fc3483a4d6 and afc8e3ee8307), so both drivers now
warn on every resume and no longer restore their control registers.

The kernel-doc added by 86fc3483a4d6 says that the caller has to
disable cache-only mode before the sync, so the two patches change the
order in the drivers.

The Fixes tags name the commit that added each resume callback
(553a776b7908 for mmc35240, 6e5f6bf2e3f0 for mmc5633), as suggested by
Bui Duc Phuc in review of v1: the wrong order predates the regcache
change (86fc3483a4d6 / afc8e3ee8307), which only turned it into a WARN
and a failed restore.

I have no hardware for either chip. The patches were tested in qemu
with the drivers bound to an i2c-stub device and a suspend/resume
cycle through /sys/power/pm_test; the details are in the changelogs.
A scan of drivers/ and sound/ for other resume paths which sync before
leaving cache-only mode in the same function found only these two.

Based on mainline (a5ebb76233b7, v7.3-rc6+); the patches also apply
to next-20261009.

Changes since v1:
 - repoint the Fixes tags to the commits that added the resume
   callbacks (553a776b7908, 6e5f6bf2e3f0), per Bui Duc Phuc's review;
   the code change is unchanged.
 - note in each changelog that the ordering predates the regcache
   change that exposed it.

Shashank Mohan Jain (2):
  iio: magnetometer: mmc35240: leave cache-only mode before the cache
    sync
  iio: magnetometer: mmc5633: leave cache-only mode before the cache
    sync

 drivers/iio/magnetometer/mmc35240.c | 3 +--
 drivers/iio/magnetometer/mmc5633.c  | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)


base-commit: a5ebb76233b79db01e82e061173cb73c6d2b5c6b
-- 
2.43.0

