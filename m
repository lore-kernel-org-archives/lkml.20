Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BE350E580
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777360; cv=none; b=rwVYdEN27x5pEr6pEB1gTZ7WtvEsOrhv7/I1nvh94UdU4mNLqjzp198XJQVyp8u1pfC/dSzOHt1YOTMC1xRxHUG3k9ifBqGXMCiBLpF2s8fsMMnQQFjnrfKrRGyrLP7jmtxlEUM5DR0pPsNj+GAxMqt9iM3jgmD1scMH6b5o9Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777360; c=relaxed/simple;
	bh=M/g6FVmoluV0YgJhBvvxHD6eJs5pCZwq49bi2wzAou4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y0v3x+T3R2rmfXsTCknim5bnSanWW4qF95eBgzJHXgesb44KGH5aSG5smirmUGMEAWILHrLdafS8ryEWxR7gzIx5lRCHeEvHFhVZITelDBlb/5U2ZYXUN9mASuwqIQ4YDJquoMH4e5Hi1j8F/YHkRCr9wv34kAXrPf4CBTiIeOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etEMq0SQ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etEMq0SQ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d822dso40109295e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790777341; x=1791382141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8pJuSm/1HrjdOBptJ26UHxOB3/Tz6mdZxePy3K7M22Y=;
        b=etEMq0SQG2LSMV8M8PyW3yciTz/dIET5k523QQLI/CmsiUQMxtG+8S7hXdDyiERLYL
         ULRCqxdr1WoFPIxkruEYD4TYjmI5Y/MoQUljUay7zYtkqISLXJ9TwPgRecHWSRnbvx4i
         M8opc8XyjW2CyIckEU4BcQp9TOJswTazPF2MarGdLaMa9ncdJxT6yg5Lt3tNmxF1mn1F
         +b5BIieWbUj1R6Lna/mH+ynj/mTUgJ4E4OLQEMj7kW8zEbmLH8xzUALsqiEe+XU1awMh
         Ns1hx+kwL57+y33MqgiDWIhsTTCMUEoG654I/unBqyXXNyf9Rx6R/2A1adqBCZA8CH6k
         IN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777341; x=1791382141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8pJuSm/1HrjdOBptJ26UHxOB3/Tz6mdZxePy3K7M22Y=;
        b=Cq45/kHpP4kzXXejz6zAMy1fv8tkgsTT3tqlNX1y/gAEioXYdAWoLg2QqEe/XOyfNd
         wazb8YnNIJYgHeypjwCgnbUcZba8wxJD1sELUIR1M1OZty4u8p1oqGqsr6XinjNdYpxp
         o8y3fhH9Wx0YRbhnryQHV9WlHuUcVYdsEiN4RsPbGLeRmywVqzBu5uPjMCHezg5Dm6gP
         xJveZhAmFA1BsLE+7fMHsBNvYTnj90WYVjxV79+TeDkO0alQfVCSm8vcGefElWiMDXgr
         0VsgVM2Df/Dzij2MLqd4E2faiGdeGs/srQrq3zZEbonwvdnbKAm+i9L74aNWbjmqmzFh
         TRKg==
X-Forwarded-Encrypted: i=1; AKwUvByw2tltBFCzXdifCdwFrcaqsNPbz1ewMNSvp1pI/V6x7eAV4LxOPPjFv80ctEBX6K33k9szHUmzyIVXfOs=@vger.kernel.org
X-Gm-Message-State: AFuF++mk65vCJHbJo81zrphDj3NK5H3FXgnE3dtr2rQum8lMV9LnqKe7
	wttjetJTK5NXNN5JJs56BDQ7nDGkA7di4PZSKdLTWvBxVCkMYE91rL+0
X-Gm-Gg: AYBFou2sXcdbFrSL1oX0JDndioAUpdH44MZgBiE3mB9Juy1TWPC5Yybvy3fwddvdV6j
	lnLI+Evnm355kIDwwFCU1ra+5ycJQF1yd+u/PHJczLUl4xscneGbqtVCozOnPgcsMgH53XJeC/B
	TEY/DDHz0eoC+ES17manYjjSPxK5CzaBMF1YUzlkRfKvm1gQdVf/Wi8hK/xZpeHQTnlASHsNfpl
	DR/SckZtPQ86mZRSefwO7SqKH1KFgAXmdwLizO8JXL3XSA8QfNaN/veG6v3h8KODl/hUzxOC+EO
	Wns2kGjezzlO5FP7bRjQOW0boXHYyrckf4fdphVz2QX16xqIFLN0vK9FUdLnNszWdlPLIbXgOIe
	Qu0/oNzNnK9KeBdqiqepx1X8fiZh2VeFkxr/ym53SfpPdsg8POzcyurPzVVy8OBVXZgAIsuhXEO
	uX/xIOoVl7eYMHoYLxfTj/wzcQAIuO8p5SVq5CbT3YRPQrLNQjRCpi7Lp/8tLf812VcfIWTk6WS
	i5UpNDv9UCdWk3RlIo9c0eVixo8CCu4Cwa+V0GHR2xv
X-Received: by 2002:a05:600c:4e41:b0:4a0:1723:2d90 with SMTP id 5b1f17b1804b1-4a01ad7d018mr22575335e9.4.1790777341205;
        Wed, 30 Sep 2026 07:09:01 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01e63e10csm2352115e9.2.2026.09.30.07.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:08:59 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Bojan Smojver <bojan@rexursive.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PM: hibernate: Wait for in-flight reads before freeing the read-ahead ring
Date: Wed, 30 Sep 2026 16:08:49 +0200
Message-ID: <20260930140850.4864-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

load_compressed_image() reads the image ahead into a ring of pages with
asynchronous bios, and waits for them only when fewer than CMP_PAGES
pages are buffered. From the second loop pass on, reads into the rest of
the ring are thus in flight while buffered data is parsed and
decompressed.

The exits taken on an invalid compressed length, a failed decompression,
an invalid uncompressed length or a snapshot_write_next() error jump to
out_finish without waiting for those reads. The function then frees the
ring pages and returns, releasing the hib_bio_batch on its stack, while
the outstanding bios still write into the freed pages and hib_end_io()
still updates and wakes the stale batch.

A corrupted image is what fails these checks, as the CRC32 is only
compared once the whole image has been loaded. With such an image, the
resume fails with "Failed to load image, recovering." and the boot
continues on top of the resulting memory corruption.

Wait for the batch at out_finish, as save_compressed_image() and
load_image() already do before releasing their buffers. hib_wait_io()
returns at once when no reads are outstanding, so exits without
read-ahead in flight are unaffected.

This was found by code inspection. It has only been build-tested; no
reproducer was run.

Fixes: 081a9d043c98 ("PM / Hibernate: Improve performance of LZO/plain hibernation, checksum image")
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 kernel/power/swap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/power/swap.c b/kernel/power/swap.c
index c78f1593600bb..49b3da89b49d4 100644
--- a/kernel/power/swap.c
+++ b/kernel/power/swap.c
@@ -1198,6 +1198,7 @@ static int load_compressed_image(struct swap_map_handle *handle,
 {
 	unsigned int m;
 	int ret = 0;
+	int err2;
 	int eof = 0;
 	struct hib_bio_batch hb;
 	ktime_t start;
@@ -1478,6 +1479,10 @@ static int load_compressed_image(struct swap_map_handle *handle,
 	}
 
 out_finish:
+	/* Error exits may leave reads in flight into page[]. */
+	err2 = hib_wait_io(&hb);
+	if (!ret)
+		ret = err2;
 	if (crc->run_threads) {
 		wait_event(crc->done, atomic_read_acquire(&crc->stop));
 		atomic_set(&crc->stop, 0);
-- 
2.53.0

