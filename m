Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7594B3FDBF5
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629493; cv=none; b=LA9yWbsWJur69tKyRDEw4S9WyQ0ZprF6VPst1STrMK82chFxxHJdcH7TnEpsDyhWaA97hDYTglmMYLutq9BxtwkINFH5luIsaEpIMl/P94HnAgZPhsEq6lH2Dh1PJzkDnZjClLJEzZPjwz/5SVbO3FcJKOS/mkXwAIscrZ1Mkr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629493; c=relaxed/simple;
	bh=tNQJmCZgUYS47R5I0jToyFsSmjL5btpsCS3GXclEphQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kT6c0zXxtNDQQlEwXVvu3xv2Omh5LKYJRdJocyt2Tstxi7B5ngBAN31//ZbW40rh5yGCYY+h0+0eAkBWyxzigUIOmr+h6dDDdKruV6utUnk2hzevua3/2c9l2FVHDt0NKHXQUd+C0ErhAvAcaJi3GQo+xRAK+DZPQugYSdGHPKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTTw6YKK; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTTw6YKK"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2e6df2742cso87601666b.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791629487; x=1792234287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8/qCglHjBKXzAovzJz2hn5sGjkgblIvlrF6aEQJipk=;
        b=NTTw6YKKPCDQvOmCPrjOo8KB3sjeQTBxm/m4pRPWkzXYco/iC3AgjeHj7/nubt5K1j
         bWllu84R6MnwjL157TPe55AnUxhbAZ+ypwL4UZrxYlD2Tny93Gnqt7hCVNrU5EWzrEXm
         xRzBNw03lI7OuWWU22A7KujvG6OXhBMgtOd+uLhT80Q20JtjLUFaGyxWAQb2a8jSEmL2
         oSVGNIUIp6Gvim8jZxzn2LMpUk1JYrY5avqxGg0mjPYwg8NP+OjQvl3YMTHY35wu30vq
         FuxwCB/StgdbnfymDhg6uv3v1RrBLRR2j2Gz/IYhpSV2NrGZAH4f7kkXCPYljHXQcqAm
         z7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629487; x=1792234287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o8/qCglHjBKXzAovzJz2hn5sGjkgblIvlrF6aEQJipk=;
        b=pxERCtFdduPn50HVpH4rqj/vGvqkDdH+MHrnfSdkhd6YDH6kMf7s2h36PA75+l/83y
         9NkPJclD7uoebH7+EfHWkUTT5C19zmf1UERXmUjKpo+CjkE/jp1QqZlUHt2/yu4ZS/Ql
         7FAmNoc1jKWskie3WJ2AsUNzLww6X1h2pB3OHoVBBpIxDPJ8lkkkhTpiVhMvl1zKt0lC
         4akSw0UbXu+q98OqDrl+wPWlUyEMPMVt51QJqUccvrwBC2fZk/kxFkpXN/rH5B9RB8qx
         11FkJx+KxWCZAQFyGAlcx8PShMxESmAUyv+HZvNBWwKcyDJeRngEMhNiVJYRzUOIH3Bv
         IvKg==
X-Forwarded-Encrypted: i=1; AKwUvBwQnFQzIN7v+ZrfcVbrd0SgazwypvJA4NsqQWVpdlWsuSI+TOy8/Z0Euobl/8qQs/ksx9Eyi3bO7EXYUdc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgOjskBBJL0F1Ep5Pl3dA72KYkuhv7knkXOy3Hs9zy1h51x8By
	RbA3B+9mF8O2RJhsDynPoXKjhyczRLMT273L85qviC+GNLEPxEjdE0Tc
X-Gm-Gg: AYBFou1Ran8+R98QP8f8zQRAAiW7V6T/f5v5f9r+Chm6tVr+sNZuE/d6YZTZz5MrQ+h
	Yf+sYjAkTUq6/ngavcjPR7hIF9yCS28CinS2/Exox47K/pYfCKSUvR96tQL4db+/scLnRufN8Ai
	F28AtS5wYOGMG4/mxSsUPIN0iv34hVkF1toLiGQsmSdTePgjtok9WW7SK0y8B9st4gMTJIgJ2Wn
	zYOPjRswhTCcZj/AeJjubIMOGTFQhg7ki+6ic5Icc1+cOeu/BWkrEHEAFK2h04fH2FvLN7Q8jIN
	VU3Td69Z/IKInoOIK2p1HnVsKsUHweJb9Xo7aVisFNFYiJk3Rg0f2M0qPt4kqpkR2Py5NwWhqRO
	0Ns9evYY9scTntCCcExaBMzvkszxrlL8iyU8B9QZ7gW/0D7CDOme/UlJHk6PSKbvEDnSDpa0aUT
	LGUyI1K/H6t4ld5GU6VvQTBPpezuF0Ap3l/gY5O+bqoSTlfzLP8LT8+8yuwmZQiD3AbxPBeDlXf
	q2HWoeSqKeCU8yhUTgaKkUZ91exATint0AfJ2E9XCKVkR6SPHW5fwbiHjCwa66nHDl6+hv1zzKT
	b2Sxjq1/lXgnRg==
X-Received: by 2002:a17:907:9694:b0:c20:9447:bd5e with SMTP id a640c23a62f3a-c31a9fa1d3amr497659666b.9.1791629487376;
        Sat, 10 Oct 2026 03:51:27 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9766743sm229984566b.4.2026.10.10.03.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:51:26 -0700 (PDT)
From: illofspeed <volvo.mail@gmail.com>
To: dm-devel@lists.linux.dev
Cc: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com,
	hare@suse.de,
	dlemoal@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dm zoned: do not reclaim a random zone into another random zone
Date: Sat, 10 Oct 2026 12:51:21 +0200
Message-ID: <20261010105122.398-3-volvo.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010105122.398-1-volvo.mail@gmail.com>
References: <20261010105122.398-1-volvo.mail@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dmz_reclaim_rnd_data() falls back to a random destination zone when no
free sequential zone is available and the target has cache zones. When
the target is idle and the cache zone list is empty,
dmz_get_rnd_zone_for_reclaim() selects random zones of the zoned device
as well, so a random zone is then copied into another random zone. That
frees nothing: the next pass picks the next random zone and copies it
again, for as long as the target stays idle.

Seen on a two-device target (256 GiB regular cache device plus a 27 TB
host-managed drive) used as an md RAID5 member: after a full rebuild
every chunk was mapped and no sequential zone was free, and the idle
drive read and wrote about 72 MB/s each without pause for hours while
the free zone counters in "dmsetup status" did not change. Reproduced on
emulated host-managed drives (tcmu-runner ZBC handler): 340 MB/s of
copying on an idle target, 0 MB/s with this patch.

Only allow the random-zone fallback when the zone being reclaimed is a
cache zone: moving it to the zoned device still frees cache space.

Fixes: c5c788595292 ("dm zoned: start reclaim with sequential zones")
Assisted-by: LLM
Signed-off-by: illofspeed <volvo.mail@gmail.com>
---
 drivers/md/dm-zoned-reclaim.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 315f0da99f3..2bcc163d209 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -288,7 +288,14 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 again:
 	szone = dmz_alloc_zone(zmd, zrc->dev_idx,
 			       alloc_flags | DMZ_ALLOC_RECLAIM);
-	if (!szone && alloc_flags == DMZ_ALLOC_SEQ && dmz_nr_cache_zones(zmd)) {
+	/*
+	 * Without a free sequential zone, moving a cache zone into a random
+	 * zone of the zoned device still frees cache space. Moving a random
+	 * zone into another random zone gains nothing, and when the target
+	 * is idle it repeats forever. Only fall back for cache zones.
+	 */
+	if (!szone && alloc_flags == DMZ_ALLOC_SEQ && dmz_nr_cache_zones(zmd) &&
+	    dmz_is_cache(dzone)) {
 		alloc_flags = DMZ_ALLOC_RND;
 		goto again;
 	}
-- 
2.43.0

