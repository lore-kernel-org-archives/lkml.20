Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8683431352B
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791733231; cv=none; b=TiI/+yt1XN87an/rbdC2TYjPtj6+4IhFVgpTYLAq+fVjsiUq9kMqHMVKRpl8+WdztNLkDUzIWZYItUAmBbTi8/ACfXYK2w1hOoTxoJoVFNm5j7OJQx1dSXf0EbL0o5aedxj+t5M2rcJ1mKv36K+wjySlrwrVwm04Gx7rl9PT4To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791733231; c=relaxed/simple;
	bh=FvnOAc0ECI3UoFIBEbLsc7DLMSApYOC7l6nyjbF9DCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OyLxLFwFSwEO6hPiZV5LxK98FSzP0V0o45Zgn983TlXMfUOLRc7OU3rWWWbqWLbBpJGFvBarJqOqoSkRj4hmXoxbRvoFxHL//sm2Eeqcl7cxgRjYTlfdxPY6PQHMh4Gh7mdCx2YZuGBCSZhwfjbeWHPIUUbbBrJZQqjWBFPg1nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gB3T8u/5; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gB3T8u/5"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so1614665c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791733230; x=1792338030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugUpurM9syEyPmGNxP2JsNkE7LDLL4tVQ+x8AmncZvs=;
        b=gB3T8u/5Seni/0f8G79hgdItnC46homz51/kVvnTvdKINA7QPJkwSNQbOhMp6YZ033
         aGxFyc/5Abjg3KWRa2HiYZ1JHe0IinMlvOvjH9a/Yr6Uve82zVjUsfEcYxwbDnWEPyGJ
         5SswpB8OS54vVXvD2vJDuD6dEsdLpAykqVQKK8S/Ejnu4M4oYtlV6hae3caBPAyV3IaF
         gNMS0NuqGKSCzde07LkT1vo/iok9rCSdmoavCu5KjTqCosJWY5++lLD3uWvOKG8d+g39
         Zrvv8anDrsY1ZGRk5idzBo7AbO/v7X/uHwbMiNVzsoCGBxv3+J/+sGnxqOpUfY6pXLYI
         8FZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791733230; x=1792338030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ugUpurM9syEyPmGNxP2JsNkE7LDLL4tVQ+x8AmncZvs=;
        b=P5m6cV9T6+po6g/ETra6zpHkm5bl16Fn917DQHNhZAuUYfbnQJFHNwQqAS/6xXo24X
         2N6Hhj2J7FNwMSJUUPrMxXLVLZANHQMEFd+pTOEy8ORh4wQvFQEaRGqlqlxMxEdjRtYz
         0Mw/OZmZw72oR/7zsuFhe0dyyy1uywMmFe/pHmK846o0frbEZ+lQXX6ZIVR80wFhpR8C
         DdqLN9pAjFjkYekGUVUiZb5TtTpa1loH8Ml0RyO+xQprCaQw09TotSLq1ycFSL8rC3gn
         8rdZ2QthStBvwb/mthDk6KgJD4kMgTzp427pkmsjTVAYxNwgBuixsrMO8KPVjW6Ofdft
         H2XQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsXnIXm3ZYezgm7SHRNrdmZJUKXyQhIz9INh7QwXAap8LMcSemRsdbEffsUTLjwBhLurMruklpANwVFcg=@vger.kernel.org
X-Gm-Message-State: AFq9FYILm6cv4X8PVPs62AlEsepvwCfbPBUDq7JMlf8bPcf18yXSzzhm
	RKRGYz2w3aliJdn1IuQwb6MmpGkMDpweS4chF1kIzkCn0Wfyth5QTthJ
X-Gm-Gg: AYBFou2uOggyzM9ZrEUeluGj1DSbjBnTNslLcrLn+gO1ZSlRCZVfUEwfuhZPFfNON5X
	nGyDaMpORFk3QGBQnOUD5PMPa4D+XBALRtwwi/P+oTQ70vwxs5fP8rU/mjwYMhyUXo4CKt3e3lz
	pUS5g9P0Jv9HeUZwN2y0CE1VKgPUI1e+sbOt+0zq5N9Mp8C4ii3v/Xbj37xtz+sZxjJD04CEYib
	qHunZTbrvPXdZJTD1F4CQx3HDm5MiB5Kg5PbBI8XHUdMUMOh7htK5W06sndqEMA5Qkd2V9MNwUg
	O8OUnmkWvVcOuSXHyUFocdH06VDz9xjcnY16+DiO9WcRLr1CJ87UH1FiVArI8MF8yZLL+5gTTr/
	ReE3WtW/ZnAlqZcGW/CZ0zm7WzKMFvZzntic+ejcLhaHqT796Fr+8NsT0gCW1BBLJd3YEYXUJss
	PVpgxYqiOrxMySfQPWueI7kdkf3vpT5oJAzOZmwmtM0xIfYHmtOhqjdCejcu3iOJ8bW9spLpcSz
	uyqK8sjQTBNjnccglzYhQg8ve0+l/CfRlyaOiXGM6uKABQECD4QbIcvdSOtD7PhaTdU2sC1Fmot
	7M7cBCz2vlvBrKPLgy3mX9ijX4OHESiBS04dSGtqKqw05xBVzA2io+B/LWo6alymhSkAHDoSOEJ
	B9AK9vsUEQ4pG7UlAZDXW9WW3RClCpWM/Vm9H3ymvgU1uz7+IUXWHoDw=
X-Received: by 2002:a05:701b:260c:b0:144:f85a:a188 with SMTP id a92af1059eb24-16a56ab4575mr8700368c88.2.1791733229526;
        Sun, 11 Oct 2026 08:40:29 -0700 (PDT)
Received: from FT6N242TWK ([223.181.119.248])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a32eb7ebsm26252154c88.12.2026.10.11.08.40.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 Oct 2026 08:40:29 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Hannes Reinecke <hare@suse.de>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] block: only use the cached zone report if BLK_ZONE_REP_CACHED is set
Date: Sun, 11 Oct 2026 21:10:17 +0530
Message-ID: <20261011154018.48913-2-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261011154018.48913-1-jain.sm@gmail.com>
References: <20261011154018.48913-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BLKREPORTZONEV2 takes the flags field of struct blk_zone_report as an
input. With BLK_ZONE_REP_CACHED the report is built from the zone
information cached by the block layer. Without it, BLKREPORTZONEV2 is
documented to behave like BLKREPORTZONE and to get the report from the
device: this is what the changelog of the commit that added the ioctl
and the comments in include/uapi/linux/blkzoned.h say.

blkdev_report_zones_ioctl() only uses the flag to validate the input
and calls blkdev_report_zones_cached() for every BLKREPORTZONEV2
request. A caller that passes flags == 0 gets the cached report, in
which implicitly open, explicitly open and closed zones all have the
condition BLK_ZONE_COND_ACTIVE, and an explicitly opened empty zone is
reported as empty.

Example with a zoned null_blk device (10 MiB, 4 MiB zones) after
BLKOPENZONE on zone 0, and a write of 8 sectors to zone 1 followed by
BLKCLOSEZONE:

  BLKREPORTZONE:             zone 0 cond 0x3 (EXP_OPEN)
                             zone 1 cond 0x4 (CLOSED)
  BLKREPORTZONEV2, flags 0:  zone 0 cond 0x1 (EMPTY)
                             zone 1 cond 0xff (ACTIVE)

The uapi header marks BLKREPORTZONE as deprecated in favour of
BLKREPORTZONEV2. A program that follows this and does not ask for
cached information can no longer tell open zones from closed ones, and
is handed BLK_ZONE_COND_ACTIVE, which is only defined for the cached
report.

Use the cached report only when BLK_ZONE_REP_CACHED is set and the
device has a cached report; otherwise, and whenever the flag is not
set, get the report from the device with blkdev_report_zones(). Guard
the cached path with blkdev_has_cached_report_zones() so the redundant
call is avoided when there is no cached report: in that case
blkdev_report_zones_cached() already falls back to a device report, so
the observable behaviour is unchanged. blkdev_has_cached_report_zones()
is defined lower in the file, so move it, with its comment, above
blkdev_report_zones_ioctl().

Tested with zoned null_blk devices in qemu: a program that compares
the reports of BLKREPORTZONE and BLKREPORTZONEV2 with flags 0 after
the sequence above finds the differences before this change and none
with it. The report with BLK_ZONE_REP_CACHED is unchanged.

Fixes: b30ffcdc0c15 ("block: introduce BLKREPORTZONESV2 ioctl")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Prepared with Claude Code (Anthropic), model Claude Opus 4.8
(claude-opus-4-8).

 block/blk-zoned.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 475aa16bc..c9b66b8a7 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -361,6 +361,19 @@ static int blkdev_copy_zone_to_user(struct blk_zone *zone, unsigned int idx,
 	return 0;
 }
 
+/*
+ * For devices that natively support zone append operations, we do not use zone
+ * write plugging for zone append writes, which makes the zone condition
+ * tracking invalid once zone append was used.  In that case fall back to a
+ * regular report zones to get correct information.
+ */
+static inline bool blkdev_has_cached_report_zones(struct block_device *bdev)
+{
+	return disk_need_zone_resources(bdev->bd_disk) &&
+		(bdev_emulates_zone_append(bdev) ||
+		 !test_bit(GD_ZONE_APPEND_USED, &bdev->bd_disk->state));
+}
+
 /*
  * Mask of valid input flags for BLKREPORTZONEV2 ioctl.
  */
@@ -400,8 +413,15 @@ int blkdev_report_zones_ioctl(struct block_device *bdev, unsigned int cmd,
 	case BLKREPORTZONEV2:
 		if (rep.flags & ~BLK_ZONE_REPV2_INPUT_FLAGS)
 			return -EINVAL;
-		ret = blkdev_report_zones_cached(bdev, rep.sector, rep.nr_zones,
-					 blkdev_copy_zone_to_user, &args);
+		if ((rep.flags & BLK_ZONE_REP_CACHED) &&
+		    blkdev_has_cached_report_zones(bdev))
+			ret = blkdev_report_zones_cached(bdev, rep.sector,
+					rep.nr_zones,
+					blkdev_copy_zone_to_user, &args);
+		else
+			ret = blkdev_report_zones(bdev, rep.sector,
+					rep.nr_zones,
+					blkdev_copy_zone_to_user, &args);
 		break;
 	default:
 		return -EINVAL;
@@ -905,19 +925,6 @@ static int blkdev_report_zone_fallback(struct block_device *bdev,
 	return 0;
 }
 
-/*
- * For devices that natively support zone append operations, we do not use zone
- * write plugging for zone append writes, which makes the zone condition
- * tracking invalid once zone append was used.  In that case fall back to a
- * regular report zones to get correct information.
- */
-static inline bool blkdev_has_cached_report_zones(struct block_device *bdev)
-{
-	return disk_need_zone_resources(bdev->bd_disk) &&
-		(bdev_emulates_zone_append(bdev) ||
-		 !test_bit(GD_ZONE_APPEND_USED, &bdev->bd_disk->state));
-}
-
 /**
  * blkdev_get_zone_info - Get a single zone information from cached data
  * @bdev:   Target block device
-- 
2.43.0

