Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734846;
	b=itmIz46bGmV3gzCI/93Lk6IdQk1hxFiHrtygJ46kTtwhyLc8IgOAPuQUW9vFUxhvVAHf
	 BnIerXBtvCCSprzLUXK49ySUb4N5pSgksw0PxnvEKUmacY4E8NoyqE5W94VaWkkqwBRjx
	 jYAuyFC6PY6WAbLOaDHtEZo2zCkgsJTeoU2AUmkcPqVJxSxQkLjINfmyuFaoPbuiujEPn
	 kRaHxt4CRDUFlc9UreaRiTL9i6dsdWhYq1InsjtUf+MH+j6ZrPOiujJduYs5MPHBKoVLF
	 nCVzJIsIYo46Lf39Mo4H1gtmhs5OkUrVdt42KzhDC42q0eby/+hJ33ex9s6rF1PLrig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oJsaIKd5l9uiGNbvOYkLF4O3e4NVImhPcBxcGBYx/v8=;
	b=WT7C7zp3u0xA5dpVcy4Ad509bMncXq+q3DBc0LwGPemhrMcqRqCHDJe3dYw1vRaE8g6j
	 EUG7NNYRGwqgGvHmtRe8rvEx0a7BT3DnKEsf7n10g1l5+0PATF/U05VoO1uTwHFm98h32
	 aPeLRWX1bfhc9Kk6tdEsGWhN6rmgFQ3K+ybSVaqHdjQ+JTbczXzjiVbE5e9W3laEZgH+c
	 7nDme/zUHeGboTQYaYrDX0FE6kBB8iENQct0ukpOZAYQKzsCTnW6uAKzudhsRa4M4bf/M
	 krLR/Ev0NXMIdJXyf5EtC9CNDps3ppHCjlM3nkpaxzf9kZjqCfH7AkFufgYsdKx881Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CtGtY7HM;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FAE606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63FAE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CtGtY7HM
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c45111bebso2030530f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793734845; x=1794339645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oJsaIKd5l9uiGNbvOYkLF4O3e4NVImhPcBxcGBYx/v8=;
        b=CtGtY7HMB85OcIX6cM1tjdouqTgIJWhtLfIsXRGlMyYR8X18SGRyRMisJFHLD43T9G
         6GmymBSOBTwX3u7krnXsAB3ZVQeBRMP/FptbhrQzC6u0bVqM99NrgGrxGxMosCE9TV/d
         XvgIFpNY8mmt0tOjaY8Dnb2ew0+4B267Gf7+5DG/MXZyJTxs6wfLvZpRRYsdYyyDRJzh
         NsldqfZ5p4N5VDKzI1hnTVdJUBbvThAp24CZp1/ujnrcJ5dpHvAC+jlLSbWqm7SPPfap
         aOiYMbxmiMN7DQJSyPKM6aTA/xsE+RebuBp1IMqMiy3ypzPjDga76F2uO31Xlt6y5e+5
         HB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734845; x=1794339645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oJsaIKd5l9uiGNbvOYkLF4O3e4NVImhPcBxcGBYx/v8=;
        b=GSexa1uDhhdSHZse3datdFbbwE2eQRMbFAXQUwIM3+4ZdQYcSBlaH0vjKsiTPJT5lp
         2tmoYATABlRTvKBZ6fsQ524GlSiIlK190reeBzTpIlmna1QHgTbW1hgXnOIPz7fVA+9X
         LjB3FU6iBaG6hcY1NM57jMVr1i+VCE7VPsWZIKxDKWkXe/cUpSlsYK0Z6ZgkA5/3F8zB
         waBD1BpgAWGO0ajjg0brzUp58PvgoJ9Ov7Gh78CWfNt4WALIRryacXsSWqUtKytrkgzc
         v9BpWAwJF+BC+HiFdC3ri1kYGP71pSn+KjnzKuXc9CQIqXy57wlPxMcy963oeqemritO
         mogA==
X-Forwarded-Encrypted: i=1; AKwUvByTMxihre4vtX0yV06utII+AVOgDiptKRWK4v9d21SyhbN/sooso96xaw/rvaBdE96XvQjirMlYN52MxEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8a1/GyeOFjwbmJLuuJbTzb73XMaAcbJsnBk1oh2nyB0z4Jkh7i
	ika21Dp4+XJSVd1U+lyQbxP3IWABIcijX3JH4qolMksW4Xrr/V+kwu/g
X-Gm-Gg: AYBFou0FyMEIsVddQNNl2XbC87oLxVfkpcvuP0MRs1gbPws+rYoFmQHZ99ZTYN7qFNg
	u8P+duyCpANw3eQFT9+/UAtH6BdKWpjriPtlS5oGz3ApjQKKPmfW2vNA23srlrLfNRxzComtH+H
	qDHp+TZisr0VTD6aRJK9+R98O25srBVKHXs0j9Br8Z2gCqw0aOR05T2OhdR5dQJV+3a2dPqoAim
	F79aluUAohPOmGvOAzGgbqktzjf05qMFE1x2+l6FN5ZYGNfLGQ9sFtCdO6fYzlKGgn53ZSL+kzJ
	xBZ91GxL3r4I0MsMoR+zMalGHe22YPhs2EPrYVgFcYIl4tCnynmF1/URvL07Bh2gHqvoDVdhaWN
	JMv4Tir3C5/6yYClpOH6Ph7X6JrD3Nlj0v488LJvI5CHHBs54nwlSN1vAHW4qGy3HyjSoW1Q+/v
	Bh4OFrRiUY0v2pbQBQ57VoFAB5JTpBvdXN/H8/DUco8Enbl8HZKoqmUyAs9ZFbaHgVoItKej3Th
	9BSvj3blrPh4x3ng3RZAgdlo4ZfDLQim7+XYGG3zSYegW3YXnyyTJWYFZQva8Tw7w8GuU0FjdGR
	qVL8DKKV4ZdSvWzfPLDVj6seZ1AK6wC0d0490W8Wr/+yIDTC0CQVjxNB/Da30Rcin/ETDCR0rnV
	P78fqu3FtNkGRme2hTzJ3yPzMcSbP0C9WCCbiw6dZBq0IrioetalHk20ruG9vliHiJlluxDWf0c
	rzlU31+x4UcQvXhC65YMh5mbTxMjBAuiGi
X-Received: by 2002:a05:600c:19c8:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4ac1913ef8fmr336456765e9.27.1793734844772;
        Tue, 03 Nov 2026 11:40:44 -0800 (PST)
Received: from 5xvn.l.time4vps.cloud (5xvn.l.time4vps.cloud. [2a02:7b40:b0df:86e7::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm153637215e9.14.2026.11.03.11.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:40:44 -0800 (PST)
From: Mohammad Pishdar <mohamadpishdar@gmail.com>
To: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com
Cc: dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammad Pishdar <mohamadpishdar@gmail.com>,
	syzbot+9519233e6d144970bbc2@syzkaller.appspotmail.com
Subject: [PATCH] dm thin: reject metadata and data devices that resolve to the same device
Date: Tue,  3 Nov 2026 21:39:56 +0200
Message-Id: <20261103193956.63354-1-mohamadpishdar@gmail.com>
X-Mailer: git-send-email 2.34.1
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

pool_ctr() checks that the metadata and data devices differ by comparing
the two argument strings. Two different strings can name the same block
device, for example "/dev/ram1" and "1:1". The check is then bypassed.

With the "read_only" feature the metadata device is opened with
BLK_OPEN_READ only, while the data device is requested with
BLK_OPEN_READ | BLK_OPEN_WRITE. dm_get_device() finds the already
present entry by dev_t, sees that the mode differs and calls
upgrade_mode(). That opens a new table device, points dd->dm_dev at it
and releases the old one. pool_ctr() however still holds the old
struct dm_dev in metadata_dev. When pool_ctr() later fails,
dm_put_device(ti, metadata_dev) does not find the stale pointer in the
table's device list and reads d->name from the freed table_device to
print an error:

  BUG: KASAN: slab-use-after-free in string_nocheck lib/vsprintf.c:650
  Read of size 1
  dm_put_device+... drivers/md/dm-table.c:467
  pool_ctr+... drivers/md/dm-thin.c:3431
  Freed by:  close_table_device <- dm_put_table_device <- upgrade_mode
             <- dm_get_device <- pool_ctr
  Allocated by: open_table_device <- dm_get_table_device

Resolve both paths with dm_devt_from_path() and reject the table if they
refer to the same device. If either path cannot be resolved, keep the
existing behaviour and let dm_get_device() report the error.

This only fixes pool_ctr(). Any target that calls dm_get_device() twice
for the same device with different modes while keeping the first result
can hit the same stale pointer through upgrade_mode(); that would need a
change in the dm core and is not attempted here.

Testing: on v7.4-rc1 built with KASAN, in QEMU (software emulation), the
syzbot C reproducer triggers the slab-use-after-free before this patch.
After the patch the table load is rejected with -EINVAL ("Error setting
metadata or data device") and there is no KASAN report. A regular
thin-pool with two different devices still loads, and both a
"/dev/ramN" + "major:minor" spelling of the same device and two identical
strings are rejected with -EINVAL. The kernel config was generated from
x86_64_defconfig plus KASAN and dm-thin, not taken from syzbot.

Fixes: 86f1152b117a ("dm: allow active and inactive tables to share dm_devs")
Reported-by: syzbot+9519233e6d144970bbc2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9519233e6d144970bbc2

Tooling: the root cause analysis, this patch and the test scripts were
drafted with an AI assistant (Claude), based on the syzbot report and the
reproducer. The tests described above were run by the submitter.

Signed-off-by: Mohammad Pishdar <mohamadpishdar@gmail.com>
---
 drivers/md/dm-thin.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index 358ed77ff..6285bbc8c 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -3292,6 +3292,7 @@ static int pool_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	dm_block_t low_water_blocks;
 	struct dm_dev *metadata_dev;
 	blk_mode_t metadata_mode;
+	dev_t metadata_devt, data_devt;
 
 	/*
 	 * FIXME Remove validation from scope of lock.
@@ -3307,8 +3308,17 @@ static int pool_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	as.argc = argc;
 	as.argv = argv;
 
-	/* make sure metadata and data are different devices */
-	if (!strcmp(argv[0], argv[1])) {
+	/*
+	 * Make sure metadata and data are different devices. Comparing the
+	 * strings is not enough: "/dev/foo" and "major:minor" can name the
+	 * same device, which would make dm_get_device() upgrade the open
+	 * mode of the already acquired metadata device and free the
+	 * struct dm_dev we are still holding.
+	 */
+	if (!strcmp(argv[0], argv[1]) ||
+	    (!dm_devt_from_path(argv[0], &metadata_devt) &&
+	     !dm_devt_from_path(argv[1], &data_devt) &&
+	     metadata_devt == data_devt)) {
 		ti->error = "Error setting metadata or data device";
 		r = -EINVAL;
 		goto out_unlock;
-- 
2.34.1

