Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792858545;
	b=KUq2F6IwRJbXIYKMO+TNlHSdXTfrntNU7xyvjP1reVNJKOuDvEEbkAXU8Ak4W9lsBtcS
	 O2TFljxkZGeMyUAe5ObEZoM+CCP5xegaqmOu8F+xphdT2X2lBU8WH8Cr+Nyjs5xhme0Ol
	 65Ng5gIc8xSoxdNtw/IiWqviQxteboG4MrCDS2GR0xn2+W1xtLz4P+56+IEL33BD07Ymy
	 Xefmy5KqKHTAUsoCdGw/A6thP3yetg1RkGwfdGNdl3WWMFkNUswC97ysMc+Inbis/gY9G
	 tYHo0+soQMbEXoEVKNyDrlUn7kQpRpoBHCuIPxIQlop2F9WmuDoGR98TZENXmxb9OHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792858545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sWPRyWlGaMNiQpJpvF0wXPtyt8f20HZGodlR95AlKmA=;
	b=mAW9PdngqzYM2oFJ/Sj16HZNny01cQjWwEMRsp5intocgEAWJNubd5r4atP2Qb1oCWxZ
	 IGmYrjCnwXHq8557raETONg9Qr/Tkt5hKasA+GiSugeYJth14RdjT85xsZTxkpaWquY5X
	 MsqeUZrnl1ermSFXzyM8+I4ilGoHDNZhDAkjX3IyuUkNCYUfEEcGbtVE7Bz7ZFHY5ZxNX
	 5UY5BW3g15CU86h8JdSZbwTiDmhpE5LAEY/EXGIUChWHgbUIaL7asY0pc5iBV1YPa9FZm
	 ID8hNR94G1Bkbbbi1+H/ZzVRJ57QwFN3IdyDGL55Q4oFOvF0pnswIAFvvGP71G/Kf0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D0BLdy5H;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E6A606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5E6A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D0BLdy5H
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a75f960be4so10321821fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792858543; x=1793463343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sWPRyWlGaMNiQpJpvF0wXPtyt8f20HZGodlR95AlKmA=;
        b=D0BLdy5HYV45c9qpPXBdOUZmb20eOXzBkqmnKBAfshAYG5diu6bzXGW2wOGtOHPasg
         K391NmMWxtLMR0Nj5375zWZlkUi/iau/lbUdl9OVQAK4UrQXLD1J9EOg0S1VnrYddamM
         S1ScwKaYBUgkGTQg4gwWzb26CrZfju/eA9+250EOFqWv69auZrCFU3GlXw+NVQIl7mCf
         aQIHWVKT3hrQvRKbPEi9FSdfLk8NnhVWaOsI/NhLvLd2Kg97GV3pKosR7BlBZLNxUNEd
         0Y2u19i1yNxC7zzBsW6u0DJzSRx4whP/2vRBLP4riAyZZjVowNf1y1bAI/BGon3HU6Xp
         pVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792858543; x=1793463343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sWPRyWlGaMNiQpJpvF0wXPtyt8f20HZGodlR95AlKmA=;
        b=Ug0/Uh46FV6z3Nsy8FPTuJcPoHWQyBs+NjmR3kB43W6ygTcEmboc+aa73iznd6eGkJ
         ZK0xtJvYpNDad98HcHN2lHlEFJ5LbUFQCFIGNoF4oGxM7YKYeKT1x9iubvTqrbml0ARr
         rARqjXtGnX3oKR0FrdZaV+c/qmXKi5iOzRCxFuS1DXgtoeFRiUD3JhmgR206Njq41Wex
         C+awjBd6FHnEC9UCc7GGx2VuqMwD0nDO7ak/Le/rrVFBJWYmIIE/jpXYpjclhAcA83zH
         oOlLZkQ5wmCbn5xNh1lVdPidsNFhTOLOVEWZ9bJsZY0d+9axgQW/ZLTtfHerrQwerjm9
         OnvA==
X-Forwarded-Encrypted: i=1; AKwUvBy0Eksl5lNYYG8h9cHATE7xghngy+aZF6TW3TRYfRmT8+MBpYq2qs+Dq/YIuC/0lJlLGKfDJbiJjj4Gta0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLpKAK8X+INWhsnU0rFKd5sTxGCqYUKqxbCFbnqDaifKTxvZ9W
	My3q2xT3CB54XI7r/iix/rT8hoocol5sqgvc3VqsmlXyt0Qa3dFjGcbA
X-Gm-Gg: AYBFou2YK26nCdoiZF+h0g8DuamwSnl9F6pYXjzusVzfWlthf4jea20yH91/9mDzSSW
	FO7xLrYagU0AaoLeHbVP8Z3LA9VmHiLgJnbns/O1Lu4ewlZwEXorK6J1oHo+Ltbj5ifE2bqEGUM
	GELZMxP0Vmu2Cedywa9nzApdOBunNex7XSCcOK3Eo9+uI/d2qPQVEltSVGdhH/qS5oGgaJy6Kdp
	2aRPjqGdoGGuWq0LrA9rL8WL78VEuC3/48phr0jBZUJo4GSA3TVF5ZeO3b1Jl7D2jgn2msT3Jk7
	vdSSCJX9ahVgIdrO9eKu+36/zoHsTekpQ9A6aWn3lLqYP+myEq1ZQBCxkIoHTPsf67cCDzSgYbo
	I19mn587/QHOngrY/bceS/ZqTlbgFmjI/11neo1ir7ysTxLgofmbsPdUDVlrfswjwe6yy2AI5K2
	zK3bMSKGqQIr1prqT3I+r+GfemY7JdXxvg3n+/D8KefPIac48TMeOrmkawUsYPD/iHFlgzLBe2B
	HZu+dXWZrrBraUNM9piGm+i2Wjrszu7DQOrPiCnqZcUwgi6v5Go3o3Thu4A3bcxAdh8Jm7QzF7Z
	N2ptgBZ+fqN6PuDPMce3eBKzoZl/QbHI4OTPLsF2DpSmmIpzUVwiRsUhDoLN
X-Received: by 2002:a05:651c:211c:b0:3a6:553d:cb1c with SMTP id 38308e7fff4ca-3ac6fceb510mr5573981fa.12.1792858542702;
        Sat, 24 Oct 2026 09:15:42 -0700 (PDT)
Received: from x870steellegend.lan (95-25-165-240.broadband.corbina.ru. [95.25.165.240])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70a493b6sm5645121fa.37.2026.10.24.09.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 09:15:42 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Mike Snitzer <snitzer@kernel.org>,
	Alasdair Kergon <agk@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>
Cc: Benjamin Marzinski <bmarzins@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+8e6fc64255334ccf3ab3@syzkaller.appspotmail.com,
	stable@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH] dm snap: fix use-after-free when origin and COW devices match
Date: Sat, 24 Oct 2026 19:14:59 +0300
Message-ID: <20261024161459.5539-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.47.3
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

When snapshot_ctr() parses target arguments where both origin and COW
paths resolve to the same underlying block device, a slab-use-after-free
occurs.

The origin device is acquired first with origin_mode (e.g. BLK_OPEN_READ
or BLK_OPEN_WRITE). When opening the COW device with dm_table_get_mode()
(typically BLK_OPEN_READ | BLK_OPEN_WRITE), dm_get_device() sees that
the device is already in the table list and calls upgrade_mode() because
the requested mode is broader than the existing one.

upgrade_mode() opens a new table_device, points dd->dm_dev to it, and
calls dm_put_table_device() on the previous one. Since the refcount drops
to zero, the old table_device is freed. However, s->origin still holds a
pointer to that freed table_device. The subsequent check:

    if (s->cow->bdev && s->cow->bdev == s->origin->bdev)

dereferences s->origin->bdev, tripping a KASAN slab-use-after-free read.
Furthermore, under the bad_store error path, dm_put_device(ti, s->origin)
fails to find s->origin in ti->table->devices because dd->dm_dev was
replaced, leaking the device reference count.

Fix this by resolving cow_path to a dev_t via dm_devt_from_path() and
verifying that it does not match s->origin->bdev->bd_dev before calling
dm_get_device() for the COW device.

Fixes: 26110d5afe81 ("dm-snap: simplify the origin_dev == cow_dev check in snapshot_ctr")
Reported-by: syzbot+8e6fc64255334ccf3ab3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8e6fc64255334ccf3ab3
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 drivers/md/dm-snap.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index 7c3725e4ac54..4a7c04c780d1 100644
--- a/drivers/md/dm-snap.c
+++ b/drivers/md/dm-snap.c
@@ -1232,6 +1232,7 @@ static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	int i;
 	int r = -EINVAL;
 	char *origin_path, *cow_path;
+	dev_t cow_dev;
 	unsigned int args_used, num_flush_bios = 1;
 	blk_mode_t origin_mode = BLK_OPEN_READ;
 
@@ -1274,15 +1275,21 @@ static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	argv++;
 	argc--;
 
-	r = dm_get_device(ti, cow_path, dm_table_get_mode(ti->table), &s->cow);
+	r = dm_devt_from_path(cow_path, &cow_dev);
 	if (r) {
 		ti->error = "Cannot get COW device";
 		goto bad_cow;
 	}
-	if (s->cow->bdev && s->cow->bdev == s->origin->bdev) {
+	if (cow_dev == s->origin->bdev->bd_dev) {
 		ti->error = "COW device cannot be the same as origin device";
 		r = -EINVAL;
-		goto bad_store;
+		goto bad_cow;
+	}
+
+	r = dm_get_device(ti, cow_path, dm_table_get_mode(ti->table), &s->cow);
+	if (r) {
+		ti->error = "Cannot get COW device";
+		goto bad_cow;
 	}
 
 	r = dm_exception_store_create(ti, argc, argv, s, &args_used, &s->store);
-- 
2.47.3

