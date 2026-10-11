Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EC32D781B
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 05:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791695959; cv=none; b=iV7GXvg1ZCogXQEI7XNb79gkgkZPhQ1VZ1ITKVWA2RfZxRwcjwbLCgUGuyA6q8ODOhQ2NHyQjQjftfiuZb9gnnwZCb3nHEK90vf19sqGTShIPuoPXV87V6sSWttvj3/atqOf7rlkLDKw+2CiWnWITDQ+urtRwA9dlPJnYcfgXyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791695959; c=relaxed/simple;
	bh=U8rEmVEm6NJOvBo5ns78eKUPkHx3I/RxebN283wiah8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YjvKyHLxagdGJZbhgvachXizA0MKIa1HANQEcVxScVwh0GHrQH+ytrOu6Gy//ctNnNwukJArcWcsG8EINGwdZxRbzKAoo5aPH4Kr1ojDGwO7CoWrBTWW8GIsmi654bWAV/RLvsBOmDddoXIaUZzacpiu5/A6bZrgwKCa7p1/gSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qWphle3U; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qWphle3U"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35943f55c06so392279eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791695958; x=1792300758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3HkQjCQhDTO0NbzrRMmz2iW5BJKPRHxdB9PJFrYJVg=;
        b=qWphle3UPHNeCaWHGQqxaCGFd8m8/6hPTYNeRw/FANlMuLjpM6ZpX0rv7E0RZnKQEl
         C/oHjv+qPuxPm9C2T6Lx2GSyIyT5ann8ZXLRH0+6QSxrRucFEB7S2Nyq+4bE2souckXD
         bTUnDaoWsXAAEu5cY7g7+bFgVKd8GsZAEIyCkR/FfgvEO7gJtM8QoIb7En6Esq5dIBON
         hTqC70ltETfkJdBG1JDQcEraFQxB7iciqQgktEopyHMnhjBAXiMHxFjjtxE7f6thavyX
         8uC3jY2MLldkOr1VNvfr7bjoHLG9SElhqMHK0hobySzb0COLyHGub6IhXAnIhB2lvUJs
         cGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791695958; x=1792300758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P3HkQjCQhDTO0NbzrRMmz2iW5BJKPRHxdB9PJFrYJVg=;
        b=2kgAA04tse0f21P2fHOCsNnfKcd78lPrfzCslBk75XBgCXO2URKQxoQlbiboTds62g
         RkDgjI/tXp3GJaeA0oCmAJIjQI3+EYvVQy44Dyvd53BWBqdd9uObQ5BnrHXdyQbRzYX/
         3Tpm+z9Ntyq5DPo76pFmV/a4t/LXfnCrfSqsHg4i48QF+aBNyoU6Q8SJmf2dY8om7mOp
         /ODpQTcaQLb/9Tve+Joc+KCsdgH2hbTpnyCotE9Bi4GIw9j8O77w1HJQCv2eLGrn8XGG
         0xYr57N38xX0i578waDqhp5a6EKtJqMipZ07gFTFGZZRMGt8duZjQACOGo079JDGBKCL
         1J4w==
X-Forwarded-Encrypted: i=1; AKwUvBx34ENkFyKI24voLcvsLIAcCkNPwAqZUYzqqCpuGtOeZ7H2yx0R2mzLUSd7r9zUBXnOz8BRhTQUMq0SROM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYAy7JaZi3lT/6N9S09YDK6feNJj4ArA0FjmmyY4U28zXpw2eZ
	co9QK3lwMLZa5LyN+OpCDI/uUGNgos9XrWRdnRMPi+da0+FIuD8BZdd4
X-Gm-Gg: AYBFou0GjBBLn+jrmhNn8xDiw5y+KOrSbdWBOLPgmMf+M6X6JB+F58b1BAqvg6t/+G+
	wU+URTvJgE1A5RF7xZWgDJEEUrrknhW7UwFexAB8mkznZibNyjmu5tqPneEzz/SBnEHEZJgS1LD
	vbPR++RsRJIMbaAJRgtjKu4In00aQ1iL1NfYYu/8cQxNSIXFQI236263TvtaDx1kYVyYpX4yyma
	JtfSEThe1fTzkm1SDYCtYOJvOsGhPoG20Wxuza/3sko034jIWGO6hroWpMfkE2jjNAnIqAZzPGp
	U0oOr7ksecrEtqLOx+9nNBwvl8y9E7Wql9cDSYOOwpk1awCyfPiWz+Ygq54yKC4eCvv7Q35W7eY
	Qa/y5SHBA1OOZ/mchCc5yF0Kre/mP6RgSmlq1gbFfQlszpyHkybci+Ph7zU8jvMnLM8C+cwj37j
	j1qogdS8qbi/fbeB9oh285EhbZY6qSQ6kiEDrX/JCv2hVxtsDm7uq3lvi8RrvIh29XK8/S1cMYC
	umXG/RgTtSAFQ4sqZ2QAkgsmVXVF0pkyIojulPe8ZOoR58O0PKJCSVAEwWbivCOdEuqtBGLGjFt
	Gsezf/GGhf5awpiE2lBdtdOv2JAGtpeo6HaeFJQ7prdWmN07UzPd+4NJzfN/+cIEXt13Dhd1QSM
	/iv9ewxfr+T9tOP7kEMxhtiVqAGSteKbg4pqZ7AQgjjjTCH4nxfoCwJnd7p0NIB+46g==
X-Received: by 2002:a05:7300:fb8a:b0:353:82a3:eb86 with SMTP id 5a478bee46e88-35382a3ef76mr11428098eec.0.1791695957378;
        Sat, 10 Oct 2026 22:19:17 -0700 (PDT)
Received: from FT6N242TWK ([223.181.119.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35978efac1asm4979129eec.19.2026.10.10.22.19.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 22:19:16 -0700 (PDT)
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
Subject: [PATCH 1/2] block: only use the cached zone report if BLK_ZONE_REP_CACHED is set
Date: Sun, 11 Oct 2026 10:49:05 +0530
Message-ID: <20261011051906.60397-2-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261011051906.60397-1-jain.sm@gmail.com>
References: <20261011051906.60397-1-jain.sm@gmail.com>
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

Call blkdev_report_zones_cached() only if BLK_ZONE_REP_CACHED is set,
and blkdev_report_zones() otherwise.

Tested with zoned null_blk devices in qemu: a program that compares
the reports of BLKREPORTZONE and BLKREPORTZONEV2 with flags 0 after
the sequence above finds the differences before this change and none
with it. The report with BLK_ZONE_REP_CACHED is unchanged.

Fixes: b30ffcdc0c15 ("block: introduce BLKREPORTZONESV2 ioctl")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

 block/blk-zoned.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 475aa16bc4..9555eae91a 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -400,6 +400,13 @@ int blkdev_report_zones_ioctl(struct block_device *bdev, unsigned int cmd,
 	case BLKREPORTZONEV2:
 		if (rep.flags & ~BLK_ZONE_REPV2_INPUT_FLAGS)
 			return -EINVAL;
+		if (!(rep.flags & BLK_ZONE_REP_CACHED)) {
+			ret = blkdev_report_zones(bdev, rep.sector,
+						  rep.nr_zones,
+						  blkdev_copy_zone_to_user,
+						  &args);
+			break;
+		}
 		ret = blkdev_report_zones_cached(bdev, rep.sector, rep.nr_zones,
 					 blkdev_copy_zone_to_user, &args);
 		break;
-- 
2.43.0

