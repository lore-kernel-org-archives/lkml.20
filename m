Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743485;
	b=Hm1Ol4GjJtdiYDTEg2slajIZRDKQb6AXjIYSOD5eL0U/a9yz7tmTc3+DiiCwOKhe+RwH
	 sUy9OGDVKLVTh3cIz3k4JUY5Eg14ZlZUbkMaP016b00GvLu0ng7gUG4toapVzXB6TgK2l
	 ceQ+yHwSQmfIi1TXiWjwiYVbv6ZfgGFJEXq1+TXXCjdDtSqyw38r8mZJGubsyAkfUoGmx
	 bl4lg8HSnOnOPzNLWl2POi9wy2/TbCkpa1j/29VMNeCoisfrWxpd87nMlvORh1eImetM6
	 f2NPNk8DOMCFC/Ilnw+T1ktjKGoI2mQLEa+hXld+nnNVVvcEzvMABbLQRZ4THO/mX/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DRh2w4Pangw3Iq0EA5ngtLB+LaquWxF2M7Uv4GbVl4o=;
	b=Lxa4pHnnYby/xswbLRTzMRV+170p/uNdcV68/i2eym5cLO6K0d5YuPOxSOMC7M54nLy+
	 m3RxGs1B0CCAGVHKh0p8reHxG3uvj6CgPdZSYwxIbJACYjiym/EGPrUied/1OxlQUWv3d
	 WXexO95PyoIG9JvrARYX63Vaa0ijOgpNGh1wYteDIwkDEEljD+g4USAVpgxiRf5TJvMWj
	 /uJ9az/rXWGATa90ubuFmZOVgVk260syFJT/t8TnUOoay1pxZUkKFx0uZYw9lf2P6zoFv
	 nvDGljgCjsSSEevo3ptpY2TsrWqm6YTctXxwEHTo0KctdGlxY7vtIjseynr6JmI33SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ISXlJHIg;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C83606D81C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4C83606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ISXlJHIg
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4c9abc1824so11456066b.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793743483; x=1794348283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRh2w4Pangw3Iq0EA5ngtLB+LaquWxF2M7Uv4GbVl4o=;
        b=ISXlJHIgHrliSnHEU/+Yfvj+9tTg0KbxtJgxZ7rFAsUk3d4dya6cXMNZ7Ji9upnBG4
         5Fs1UV1m775CrxnbGaPccA8byJqdxanVu7AuVnz5CbfV46IKgCo3oZP1jjUhH37mKK2y
         +Hm5sgd1rpuOSjvnsi4491TdDPQZYeryKzjKn6TMibRFHj8KH+BkgkGRQUd6PUg/cSBd
         Ib50tofggcMHBmYTI5pCE/9CAWJXqyZBEPYAC/Moyv2me+Q/tflqyHRfvrHYMdlo71rn
         MXmprVcNvlOWBj0r6fxeuZtpZ/mxJRzvgA+2jjjdMU6DhMO4tqwOD0PbYWXX55u2uo9q
         iwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743483; x=1794348283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRh2w4Pangw3Iq0EA5ngtLB+LaquWxF2M7Uv4GbVl4o=;
        b=uxiiCAc9nsjNu9PZ8iOvuez9zfVhU9VStZZjHfF3WsUW0INgzrP9jKsfzAcZ32VUE6
         wZV3XZ2ndzhR2jWJrE4vJK9KBoXYPsEc52PL7+QLypcyGdbmW1Q8AOc3lB28BYByAJdR
         cnWe+PadxtLFgaqUxreRdhf1K51OnpXkVS1AlKf7zvMpp+r0raKBmIsCW65GacZ2CoT5
         QYJ7mAVsUtcrGYchJ8NWOiUv5xUj7l2dvL7mzjatycXpmLO6GtHEColDA2Qo+VKi5rm7
         vJ+ocTILlcb7Fp0KmSb5BYxyw+UN/taeQsx/FNDOfniiNkKzFkmwHMIT0j6fXDQmtDrQ
         bcOA==
X-Forwarded-Encrypted: i=1; AKwUvBwI+/gnPvTnC6IKxt099l0+4YVJOUYZAjmbnt9lyUvJzqCMdREozjF1zwdIv8FpvaUTeyDSGsUyNfxhibA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9F2kBF92bGwoqmz7zN/D7UJ32Y30B6WAqRibm9Cwfps4Snf7xQ
	Zfi4EFJ2JHsQd1uHjc6fd6g+6km0vn9KHvvsbSLjRPTewFGIpT3JcOjR
X-Gm-Gg: AYBFou1blCUJKRAOmc8Bjd9RC/SdtjNVlK4aldxBpjLRCk05sIINXSe3X14eBrUnqBR
	Uh8TXsuoAXIVBnb3hdG4/JWHiCpKmrEQZNXtdcH6JjJScBHpRdqrjaDUAmWHikZV6YkOk3pL6se
	xmLxv9un8TUuPTvpg0JZZzNFIo5Iyox8rxYUOD1TJicvSVGC3/2az3/AfjwIumTIMB3Bp/fLsGM
	VR6dxvJgO387Cf0vxa4YBfNtZxHIJFqW5ycGsIZKp1ZFCATsPuNMYqaaOEYynNPeafp2/GJGk7P
	YQh94yT+xz3Pce6dbO3sAkXogH6idaUewsiqiyQYaZXCgZ3STrH2jyoGRT7TcROcXGOP6Ln993F
	doW+O1NFC6TFzJc/GVuwYyFUfxw/RVcvCrOU9WOxo6Vv58i/Wu2cHIYCACN8uW5nzsk3pP0Aflx
	M//Ja0f5FZMieJE+8blXTTiH3hB5GWzmO3TIt1BqnWvZ1jvnbhEIZ6SnRdm+RC1y5enHY/3zfte
	YhgQAMHO2nW5aY9inZWZVXFfEeEbkAjphxLoE+1QTz6t5sgGIc8/83ZT5ARmedsPCc+vZp/Mw09
	COtI0UilcgVA7OejQz4hX/sRuSwbfdMdjn1aTP/2fs7/Fmwz+YBLt2nVyp/liGMEeqZ9YjjSozn
	EHovO
X-Received: by 2002:a17:907:d26:b0:c2d:c800:d797 with SMTP id a640c23a62f3a-c4ca79478f8mr1169105066b.6.1793743482951;
        Tue, 03 Nov 2026 14:04:42 -0800 (PST)
Received: from localhost.localdomain (host-188-122-3-146.finemedia.com.pl. [188.122.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e424c34sm4574266b.13.2026.11.03.14.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:04:42 -0800 (PST)
From: Kyrylo Biryuk <illofspeed@gmail.com>
To: dm-devel@lists.linux.dev
Cc: mpatocka@redhat.com,
	snitzer@kernel.org,
	agk@redhat.com,
	bmarzins@redhat.com,
	dlemoal@kernel.org,
	hare@kernel.org,
	hare@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/2] dm zoned: do not reclaim a random zone into another random zone
Date: Tue,  3 Nov 2026 23:04:38 +0100
Message-ID: <20261103220438.510609-3-illofspeed@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103220438.510609-1-illofspeed@gmail.com>
References: <20261103220438.510609-1-illofspeed@gmail.com>
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
drive kept reading and writing while the free zone counters
in "dmsetup status" did not change.

Only switch to a random destination zone when the zone being reclaimed
is a cache zone: moving it to the zoned device still frees cache space.

This depends on "dm zoned: back off when reclaim cannot make progress":
without it, dmz_reclaim_work() would retry the resulting -ENOSPC at
once, and run dmz_check_dev(), for as long as the target stays idle.

Tested on 7.4-rc1 together with the previous patch, on a two-device
target (a 512 MiB RAM-backed regular cache device plus a 1 GiB
scsi_debug host-managed drive) filled until no sequential zone was
free, then idle for 60 seconds: the stock module made 877
random-to-random copies; with this series it made none, and each pass
failed with -ENOSPC once per DMZ_IDLE_PERIOD without a device check.

Fixes: c5c788595292 ("dm zoned: start reclaim with sequential zones")
Cc: stable@vger.kernel.org
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Signed-off-by: Kyrylo Biryuk <illofspeed@gmail.com>
---
 drivers/md/dm-zoned-reclaim.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 077a8a50197..152cb878811 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -288,7 +288,13 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 again:
 	szone = dmz_alloc_zone(zmd, zrc->dev_idx,
 			       alloc_flags | DMZ_ALLOC_RECLAIM);
-	if (!szone && alloc_flags == DMZ_ALLOC_SEQ && dmz_nr_cache_zones(zmd)) {
+	/*
+	 * If no free sequential zone is available, a cache zone can still be
+	 * moved into a free random zone of the zoned device, which frees cache
+	 * space. Do not do this for a random zone: moving it into another
+	 * random zone frees nothing and, on an idle target, repeats forever.
+	 */
+	if (!szone && alloc_flags == DMZ_ALLOC_SEQ && dmz_is_cache(dzone)) {
 		alloc_flags = DMZ_ALLOC_RND;
 		goto again;
 	}
-- 
2.43.0

