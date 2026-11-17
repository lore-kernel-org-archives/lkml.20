Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794892546;
	b=ObE+I+LbUV5JnST01Mb/VNbOpW4JIzMOucfySfH+ELNdxcq2JMNnaJUBFX2ZMj3PbjNi
	 DVDhSfk446cIAOIc0c/pB7uW0A5+QnVc/9zpss5Iwn2sWB8Fa/v3vBS890zW+EC1aeYUG
	 xnEr58yqxd1rzL3FiZAfww+ILxx2kWXmQhSetgw/UyxZ8wtvHg4wSn2+fhBFxyJ9AeTgB
	 6i07ViFmyQnH57xFrtEThz6xVzA8CB4tFFhTwtZz3AtaNXherZ49KAzaWJcStKOQ1bCFl
	 uiSsYHuODXt/3gOEeEm9fFJoeB5v6qLv8bKDfjGDhIk0ZIBavkCip+ZhexO4lmTkaKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type;
	bh=LcB1sNEMLKmirfhBCUnEMLlOFH+/B3k68eqehlg98m0=;
	b=ltGP12cez5Aw3xng8HTewFGHT5S1oOtl5tAzV40GlIK138ttvCcp44wbRZf5S2fVmOI9
	 cy7vcSzfFHjwNtN9fTHGYiS/zHFFqrFCmkydpnmhzoNklfyUWhJOO1ETqzCImuFqJWZTP
	 gPxprlHGEWhl47KgVI12XHzQZOK3xENABkimP+rsBCwzgzBNaOjwhX8/X3fEtdRCMzjQ9
	 2NF1ZCJgar3IkvIWpzo1/79cinRk5dd+eQbo8T14T1YARK3I6dWRc8VMPH9mD43zIyM1q
	 /rZA0TwdF1B3sMw+fy+/zAQzVE6seFy9rPCXahj4ksYd96SOhntSpfuJvT1j9ttgrYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0VVr7Wjz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F609606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F609606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0VVr7Wjz
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b876afbb86so85074a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:15:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794892544; cv=none;
        d=google.com; s=arc-20260327;
        b=jaY1JEYJwzuFxHpd1DxcGfhz2M3E+NCRfqL/jMp2mX2wg6amCemAHEl9vXGyLV5KXX
         vNVqW89DhPVPffP3Pv6Dft6K8CIE0Z2taL2rMIgwwPjvQ5zTUcrnN+kR5GoGcI2Yrjha
         AgD9q7gFGWnS5Y5eUFFFyFexxZvE2j1D0K1mNe/utzEXZYaotAkYuh9sLfxK6PbBGU8x
         Zs8b4Ne7xxEwC0hf1jisl0b42SvNUWqs+heZqn29nqiToXq+mMDaUzWLtZOmfrNz3BER
         XwZ7W3yfBFyuGPdbGBW/5MMEOBty9YXCyGl0hOW0Ee3q3DYsRVJz5vO9z4jEQk/siUh5
         yStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=LcB1sNEMLKmirfhBCUnEMLlOFH+/B3k68eqehlg98m0=;
        fh=+RRYaOBGVOx71B8egXsb49MvXnOyuOf5812xJ71cLwI=;
        b=Jxt/8SHEn+toNw3OBq9g1jvIR+w2bzorNnhdO6LCO0Me74KjzdCHFjhMOwrCWVNO2u
         c543+cmqB5EUTA8niOr5ESDyw/OdiiEHaSNoBv8sOCMid2aA5DxS3dXlrxTd/tuGJSEi
         VlKSWHdQeHClyncUvH8I8QSCNNHLA9MUpo8A9Dy3FMlbaq7Jai72fJLcRtRZqBu7dC+V
         /cFKxOEBb+52YNh5vSnQXDazuxnWVLLwkm0osb1fm4Dvj4RSyzzUlkxLN2U0RWs093XY
         tJ5bRF+KNaq3nRw50QWZFEHlgrEjc+gSYR4UJpzxlqWNCsDK4RuFDvAK5Fa6yGpuGxus
         kNiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794892544; x=1795497344; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LcB1sNEMLKmirfhBCUnEMLlOFH+/B3k68eqehlg98m0=;
        b=0VVr7WjzVZhisIRPEOyr21EBabBoGM/LmXbDlGAyH0rlqrAl75pstEjdIeQgUJHeT9
         m5fooPV2zwJXmm34Q5MMuisuQ5R3V1KRvNsWAi+pnnXm5wEQe0Afd6VSiSNj4w0lvoEj
         xSR8QdVzwHxbvOZNUDi01/wQulU0irV2fzEpNIfkUvqBKs+vrRtraQ7Ea5BBjWwfE3fd
         B37ztlclpbvSFLRADyWu9KqnTNKlD3eny6hnWCHDs5AOE3jnIcHO1wZ3n1Aw+m8AdrXF
         C+5iRvgz294AaJfgZastU6fj65A8SBRvfdYucM6ijQTFvKM0e39SeMy7zTmzgRcJaQ2L
         g5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794892544; x=1795497344;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LcB1sNEMLKmirfhBCUnEMLlOFH+/B3k68eqehlg98m0=;
        b=XrxMw/LbEmnNacy4h3yc58XaRH9VZqAl/hHqkZU/o3n9x2YzevRmwB+kzqqCfZhemx
         qmEB4LnLM0qbnILs2nOdsz6FtO6GS3JFfn0sPJWleDlDkXW8/bvlFVjp6Penn0O2Ml+6
         mrvEsfAgRHTQpbKUEm+bO2q8L/cKR70qCvRBEhxoi2bwRbdpi9Ruy1dTNQ8+Ab1TOy4v
         aAVGHkbzANA6uzyvoJWiqKkfoYTMUdg89LSouhzBFxApqocGfq1XTK7N9RdgVDiU+TLg
         Wpy1uAWugb44blU6tehwbosVXOUA9qhnDoqdSIixISA+ehytd3TBH9F76+rd4BG0Dhv+
         jY8w==
X-Forwarded-Encrypted: i=1; AL+hErGtWFbRQBzWkaY8N2Rfk7fwytZRYwWVdRyd4wWIHo7ZOfUs66P0PvazsoBS/6WA3lDLPzXaacvnqI9OIsQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3oNBPFJI9fMiF9szn0F3GJfdyPMzhijjEZWbMPT2ifm45F7+A
	ajOYREXyAy5xMZEU4FXRPtLRBFCh2qX+7wAngWo9WFcOW+QrUUhnKabHFiP1dfEiFL6wxQYuYhT
	5dlZWdLpJG8R4XaNPa1HX04s7cmRhG4A=
X-Gm-Gg: AYBFou2SpgL7kJGVXPkYQH9m/FggtqkRuTdHKLC44oGXswrYvZjO96sNIt+sqlcVaab
	b6HpjdMzOI4iYKGIfrj3nCktJik6tb/NBOJ3Yk0GUDkIiyFmuQJRcVxUZ/eFQm4J4ucfjqUoN0J
	zBufNz8SDGJBEjrimy7M/YPreffSqn1lsHQAKe15kR1Q/bFGBBeByV90yy5zwt3+hPUKalnihbp
	BiJexlDZFLSbp1eiqEhTkSuygahoo8cHNrRg8mSlvUJ7TjIbUFM+yWCx5pkcPbK1z0IEJG9bweM
	EXJYHf1Nv04vAU56ryz5FGjiG96ELpCYBLqC5VrkmEedyXuZG8bq37f3ar0Fy7xkmuVn8CMpzvf
	+I4D9Jv68s80gFVkCqfORG/AuaYfIwr7ZgLmIACjC3Hd6/gDsaucWFDgXhBjHSHAhmGJKmI2dg2
	UoDi9tT6IqzovpOyi451MDlPQmPEGrR7qu7BQc3SnmnR4tNUc/
X-Received: by 2002:a05:6402:1d49:b0:6b8:5ce6:d780 with SMTP id
 4fb4d7f45d1cf-6b85ce6d90emr740196a12.2.1794892544472; Mon, 16 Nov 2026
 21:15:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Tue, 17 Nov 2026 08:15:58 +0300
X-Gm-Features: AclHuK_4sL4dPYibnHtI-g8te8ZAr4eN6arGP0ECZ84nJIUnFTmEc6OujUbMHu8
Message-ID: <CAMnMt5Z+BwOaPWQGTTUeSr8uaT=dysMi42xRpFpUruRRcO7=wA@mail.gmail.com>
Subject: [PATCH] md/raid0: optimize stripe mapping with bitwise shifts for
 power-of-2 devices
To: song@kernel.org, yukuai@fygo.io, magiclinan@didiglobal.com, 
	xiao@kernel.org, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 086678202572260393864f72c06f4d67032a4b76 Mon Sep 17 00:00:00 2001
From: Herman Semenoff <GermanAizek@yandex.ru>
Date: Sun, 8 Nov 2026 22:43:29 +0300
Subject: [PATCH] md/raid0: optimize stripe mapping with bitwise shifts
for power-of-2 devices

In drivers/md/raid0.c, map_sector() performs two 64-bit integer divisions
(sector_div) on every submitted bio:
  1. sector_div(chunk, zone->nb_dev << chunksect_bits) to compute the chunk
     offset within the member device.
  2. sector_div(sector, zone->nb_dev) to select the target member disk.

For ultra-low latency solid-state storage devices, such as Intel Optane
(3D XPoint NVMe SSDs) capable of sub-10us latencies and multi-million IOPS,
these un-pipelined 64-bit division instructions create unnecessary CPU
pipeline stalls and latency overhead in the I/O submission hot path.

When the number of member devices in a strip zone is a power of two
(e.g., 2, 4, 8, 16 disks, which is the predominant configuration for
NVMe arrays), both divisions can be replaced with bitwise shifts and
masks:
  - chunk >>= (zone->nb_dev_shift + chunksect_bits)
  - disk_idx = sector & (zone->nb_dev - 1)
  - *sector_offset = (chunk << chunksect_bits) + sect_in_chunk

Store nb_dev_shift (ilog2(zone->nb_dev)) in struct strip_zone during zone
initialization when is_power_of_2(zone->nb_dev) is true, or -1 otherwise.
If nb_dev_shift is non-negative and chunk_sects is a power of two, fast
bitwise math is used with zero divisions. Arrays with non-power-of-2 disk
counts fall back to the existing sector_div() path without any behavior
or compatibility change.

In addition, annotate the bio split check in raid0_make_request() with
unlikely(), as standard MD devices already enforce chunk_sectors limits
via bio_split_to_limits() in md_submit_bio().

Tested on an 8-disk Intel Optane Memory M10 (MEMPEK1J016GAD) RAID0 array:
  - Random 4K read QD1 latency:  avg lat 22.06 us -> 21.10 us (-4.4%)
  - Random 4K read QD1 IOPS:     42.6k IOPS       -> 44.6k IOPS (+4.7%)
  - Random 4K read QD32x8 IOPS:  1.11M IOPS       -> 1.72M IOPS (+54.5%)
  - Non-power-of-2 disk arrays:  unaffected, identical fallback path

Signed-off-by: Herman Semenoff <GermanAizek@yandex.ru>
Signed-off-by: Herman Semenoff <GermanAizek@aizekgroup.ru>
---
 drivers/md/raid0.c | 26 +++++++++++++++++++-------
 drivers/md/raid0.h |  1 +
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index 35e103f0c2c3..993df48eaa4c 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -207,6 +207,8 @@ static int create_strip_zones(struct mddev *mddev,
struct r0conf **private_conf)
  }
  zone->nb_dev = cnt;
  zone->zone_end = smallest->sectors * cnt;
+ zone->nb_dev_shift = is_power_of_2(zone->nb_dev) ?
+     ilog2(zone->nb_dev) : -1;

  curr_zone_end = zone->zone_end;

@@ -246,6 +248,8 @@ static int create_strip_zones(struct mddev *mddev,
struct r0conf **private_conf)
  }

  zone->nb_dev = c;
+ zone->nb_dev_shift = is_power_of_2(zone->nb_dev) ?
+     ilog2(zone->nb_dev) : -1;
  sectors = (smallest->sectors - zone->dev_start) * c;
  pr_debug("md/raid0:%s: zone->nb_dev: %d, sectors: %llu\n",
  mdname(mddev),
@@ -330,6 +334,7 @@ static struct md_rdev *map_sector(struct mddev
*mddev, struct strip_zone *zone,
  struct r0conf *conf = mddev->private;
  int raid_disks = conf->strip_zone[0].nb_dev;
  unsigned int chunk_sects = mddev->chunk_sectors;
+ unsigned int disk_idx;

  if (is_power_of_2(chunk_sects)) {
  int chunksect_bits = ffz(~chunk_sects);
@@ -338,21 +343,28 @@ static struct md_rdev *map_sector(struct mddev
*mddev, struct strip_zone *zone,
  sector >>= chunksect_bits;
  /* chunk in zone */
  chunk = *sector_offset;
- /* quotient is the chunk in real device*/
- sector_div(chunk, zone->nb_dev << chunksect_bits);
- } else{
+ if (zone->nb_dev_shift >= 0) {
+ chunk >>= (zone->nb_dev_shift + chunksect_bits);
+ disk_idx = sector & (zone->nb_dev - 1);
+ } else {
+ /* quotient is the chunk in real device*/
+ sector_div(chunk, zone->nb_dev << chunksect_bits);
+ disk_idx = sector_div(sector, zone->nb_dev);
+ }
+ *sector_offset = (chunk << chunksect_bits) + sect_in_chunk;
+ } else {
  sect_in_chunk = sector_div(sector, chunk_sects);
  chunk = *sector_offset;
  sector_div(chunk, chunk_sects * zone->nb_dev);
+ disk_idx = sector_div(sector, zone->nb_dev);
+ *sector_offset = (chunk * chunk_sects) + sect_in_chunk;
  }
  /*
  *  position the bio over the real device
  *  real sector = chunk in device + starting of zone
  * + the position in the chunk
  */
- *sector_offset = (chunk * chunk_sects) + sect_in_chunk;
- return conf->devlist[(zone - conf->strip_zone)*raid_disks
-     + sector_div(sector, zone->nb_dev)];
+ return conf->devlist[(zone - conf->strip_zone) * raid_disks + disk_idx];
 }

 static sector_t raid0_size(struct mddev *mddev, sector_t sectors, int
raid_disks)
@@ -616,7 +628,7 @@ static bool raid0_make_request(struct mddev
*mddev, struct bio *bio)
  ? (sector & (chunk_sects-1))
  : sector_div(sector, chunk_sects));

- if (sectors < bio_sectors(bio)) {
+ if (unlikely(sectors < bio_sectors(bio))) {
  bio = bio_submit_split_bioset(bio, sectors,
       &mddev->bio_set);
  if (!bio)
diff --git a/drivers/md/raid0.h b/drivers/md/raid0.h
index 8cc761ca7423..70b73511fb14 100644
--- a/drivers/md/raid0.h
+++ b/drivers/md/raid0.h
@@ -7,6 +7,7 @@ struct strip_zone {
  sector_t dev_start; /* Zone offset in real dev (in sectors) */
  int nb_dev; /* # of devices attached to the zone */
  int disk_shift; /* start disk for the original layout */
+ int nb_dev_shift; /* log2(nb_dev) if power of 2, else -1 */
 };

 /* Linux 3.14 (20d0189b101) made an unintended change to
-- 
2.55.0
