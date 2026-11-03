Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743484;
	b=2cY/t/rrnIIy4kfb/jJtMagzZ0Qu4rgo8GEDdfR6oRF45chZl+MlsRZMMGonSYd3CtHu
	 XIeDn7pazGuYiflAy5bjjemdj0YNj7qy3Rgzctt11t1dRQOCBZL/Ca3ubPvpGy5Qjivv+
	 Lb/nEmV1y1jjzExIyFxhUeqtKt/EnnVvoITqUFJX/nggBgSj8S2UtHYViU3O2fQRza2M4
	 9tg33wVwvCW5OK1VvUk1RBgmRU2lBEzvt1ZzvL3gJevM9OLKojzpY5jg+Rp5rl4HVh8BF
	 RmQb9r2dZS3GTvnIYTa8fQADfFtz5yrssYBYqwRUUZ/Rwe+rJsiTdziLTS0hoff12Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r4YfPovGw1xdQbc6iuyAAPONvKXoCo5XL7Z8YypY/D0=;
	b=MN17CTd7+99BzQDYLT3Gbq95QTBFiRCjUCQeuWuIf81QllAdV6SahB5ijbyJ0s4ot9AU
	 aIH+tyMzlv/g15SQN1yojpox0dZzK1p4L1CBN7EYV4XGz/D2WsPqCMmZ8D85/jnam5mBM
	 +6v0DklFMJUwT4/rEZwPRDsFtPKXwZUJod2nMBZYY2RaLyqJVbUw7tJjv2K5zusZFzc62
	 XBYIKG6/pl/1jMWPgvNEuR1Zrrw/mf5c4EyB1VjYw0AeuLthFMMCZZ9wXyju9pmyWVLlt
	 k3q1CqpGvVmyV2GfZi/pghaVAnnVJw4mqfPpn2pj5s3mXaogm6nStuhtQ11/mP4mUhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWhATtxK;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A90606D803
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5A90606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWhATtxK
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c40f29667e6so13381866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793743482; x=1794348282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r4YfPovGw1xdQbc6iuyAAPONvKXoCo5XL7Z8YypY/D0=;
        b=XWhATtxKCNB6qfxYvYk9g92VUmfGH7Dqpa80jgEgixmQvjGCZ4dK9LFCC9KDhPLVC6
         THOqQtkcWI0VQ9dsXeuBb1q9zmzLJq/sSykxXKfIjqfRkG9XFI/1AjReC0OxaR/FhGh3
         s6cj3AmYZNXQllvw4IDH9wPbsZquBmzEhk2lrEHHpSa1TOpWlkhV+4Jt0vBAKt+I3/zW
         o9Kk8IOgFfPUFBRvNKhOhwNPq1HJvxzMViagw/6wOT3CL2iUOAEUXsqlDZglcpOwLrCQ
         NVF8/wtZeFuhUyMH1tYNNKPAfMFFGvOJkeKyLRCegXJPzugIMSMuvX9eP8z6TZd76UJ1
         I3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743482; x=1794348282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r4YfPovGw1xdQbc6iuyAAPONvKXoCo5XL7Z8YypY/D0=;
        b=yB5jhMGjYH/cr27Xb7FYtF4CxwwKRpTGABlcLgUUjF+u5uRVEDVH6wnYYNlq6mfg+P
         Ln8ynSkwza23Cb7zg7+yBLw1hVKC2EuMh/GV7thCTL5LPn482JWBJFyukrabBw+POgxG
         Z47GC2G/P7pFBahtpOirxv+CCk036OLJtMzf/Mt3eDaHbyAQApQ2KDMcrSxB7tF027ep
         5Xw2CEfXJgCT//DqAtB3qZHVL5NvwML3+qS7OPdHKKqjj9/AkaakFA6L98Z9TLcxSVgQ
         rS6SJ5Yjk4PJd2XYNCN10phTDI76+6ITHM8/GhfBe8ATg/SPvhsz0xU2bQtLUcFl17Gb
         PO3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzscjodAoEHhoa3g7msCqP0GmX+cN+T0dyjN2LLeA7UBlnA8DAnNGDz64dQsPa/k+lkJyCs8LrVXmY7vqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Kc2W3sMwHzpd81AvR1GwAX3++KMf+qcCXNt/SheN3S5DFhAL8
	3oRhM4hyuEQCcnNiVENGTOR0NHMMtz8wGHR63m/gOBpGwvuetLMbJg6x
X-Gm-Gg: AYBFou3SbWOmlRk9Gc7oLkPU+XmcWen6XYWZ89rTJZhbAj2FhBeZr5NWnqyqdnP4wEC
	7yCF6Q3OpaNzv0/NFYyuBtKcJh4AoT/Px0c/BciugnCOJJ37SjqtoZUQdXepXkFSWRAu35ZrVHM
	/Rmjh1CAo8O9nmjQi2utkLqcORTmjXYKSu47gSeWdW7ywwr85MN1SxAizUP5MVISpR7wHjs6/sY
	SgEd20z01BCfVW/hEbqSIA2E8NekYvoPbQfVFEYjf0usKOFk7ZcEJRCDWxmDskIOJkaxrXP7Z8j
	DrKnJlMc8UR9yXWDU9hy9EMrNwBFjbML6TnXj418/HJQJom2e+W/RVCksyPgqQqC4QWrx5ZtSFK
	dr5jH9U7QOAuyEU1f00PqkwP8VfYraS8Ktf8thi4YoHSjhjvH52ksmTV9/gKStLLW/F9M1/RnvT
	usIUrz/DMyPoEDT68LsxBQXJ7+B2OU7QBn9lQQY6nTMUYCmVpRep4U56SXRBsLpbc2fwnZ6v8R7
	CFYO1y6WSx6KZ8T9rhiyRZTKI9UsJiBCgm+vw/Ze5AUoOl+NOtSWgWd0yb1r3zjZivuCLhG09WU
	4krwAFmochUvWOdp0rbA1mKRuZbKM7FZt6O6jos7LOnR8JcjApfBKYElOPL6N4pxXqKHlfsOaDV
	6HpuQ
X-Received: by 2002:a17:907:97c4:b0:c40:dead:7466 with SMTP id a640c23a62f3a-c4ca7a40202mr1202821466b.20.1793743481738;
        Tue, 03 Nov 2026 14:04:41 -0800 (PST)
Received: from localhost.localdomain (host-188-122-3-146.finemedia.com.pl. [188.122.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e424c34sm4574266b.13.2026.11.03.14.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:04:41 -0800 (PST)
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
Subject: [PATCH v7 1/2] dm zoned: back off when reclaim cannot make progress
Date: Tue,  3 Nov 2026 23:04:37 +0100
Message-ID: <20261103220438.510609-2-illofspeed@gmail.com>
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

When a reclaim pass cannot make progress, dmz_reclaim_work() still ends
with dmz_schedule_reclaim(). If the target is idle, dmz_should_reclaim()
keeps returning true, the work is queued again with no delay and the
worker spins on the same failing pass. This patch handles two such
cases:

  - dmz_do_reclaim() fails with -ENOSPC because no free zone is
    available to copy the data into, for example on a target without
    cache zones that has no free sequential zone left. The next patch
    also makes this the expected result when an idle target with cache
    zones has random zones but no free sequential zone.
  - dmz_do_reclaim() finds no zone it can lock for reclaim and returns
    -EBUSY. Since commit 90a9b8693f1b ("dm zoned: reclaim random zones
    when idle"), dmz_should_reclaim() returns true on an idle target
    whenever the total number of random (and cache) zones is non-zero,
    whether or not any of them holds data. Each pass then also runs
    dmz_check_dev(), which checks every device for media events (a TEST
    UNIT READY on SCSI disks).

The -EBUSY loop lasts as long as the target stays idle; it ends when a
pass finishes while the target is busy and has enough free zones. On
three 27 TB host-managed SATA drives used as md RAID5 members (7.2.10
with the module built out of tree, all random zones free, target idle
for 300 seconds, kprobes attached, two other drives on the controller
being zero-filled), each member's SCSI device counted about 108,000
requests per second with the stock module and the system used about
915 s of CPU time, against about 46 s with this series. libata completes
TEST UNIT READY in software, so these counters do not measure commands
sent to the drives; the cost is CPU time.

When a pass fails with -ENOSPC or -EBUSY, retrying at once is unlikely
to make progress: re-arm the idle poll instead, so that reclaim is
retried after DMZ_IDLE_PERIOD unless a zone allocation or a "reclaim"
message queues it earlier. On a busy target, zone allocations can
restart reclaim immediately when free space is low enough to require
reclaim. Re-arming also keeps the poll running after a complete idle
drain. The poll can still stop after a pass that ends while reclaim is
not needed; that is unchanged.

Skip the device check for these two results: they normally mean that
there is no zone to copy into or no zone to reclaim, not that a device
failed, and the I/O paths check the devices themselves. Use
queue_delayed_work() so that work an allocation has already queued is
not postponed.

A pass that fails with an I/O error, for example on an unreadable block
of a device that stays online, is still retried at once while the
target is idle; this patch does not change that.

Tested on 7.4-rc1 with this patch and the next one, on three emulated
host-managed drives (scsi_debug, 1 GiB, 32 MiB zones) each under
dm-zoned as md RAID5 members, all random zones free and the target idle
for 300 seconds. With the stock module each member's SCSI device counted
about 70.2 million requests and the reclaim workers used 726 s of CPU.
With this series: 75 requests per member, 30 passes per worker (one per
DMZ_IDLE_PERIOD) and 0.08 s of CPU. Data written during the tests read
back with matching checksums, and no kernel warnings were logged.

Fixes: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
Fixes: 90a9b8693f1b ("dm zoned: reclaim random zones when idle")
Cc: stable@vger.kernel.org
Signed-off-by: Kyrylo Biryuk <illofspeed@gmail.com>
---
 drivers/md/dm-zoned-reclaim.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index c041413c729..077a8a50197 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -537,6 +537,16 @@ static void dmz_reclaim_work(struct work_struct *work)
 		dmz_nr_rnd_zones(zmd, zrc->dev_idx));
 
 	ret = dmz_do_reclaim(zrc);
+	if (ret == -ENOSPC || ret == -EBUSY) {
+		/*
+		 * No zone to copy into (-ENOSPC) or no zone to reclaim
+		 * (-EBUSY): retrying at once cannot make progress and would
+		 * spin. Poll again after the idle period instead, without
+		 * postponing work that an allocation has already queued.
+		 */
+		queue_delayed_work(zrc->wq, &zrc->work, DMZ_IDLE_PERIOD);
+		return;
+	}
 	if (ret && ret != -EINTR) {
 		if (!dmz_check_dev(zmd))
 			return;
-- 
2.43.0

