Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287544C9E09
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792334012; cv=none; b=g0M28UjyADZeiRL/ymwHipKTS6BeHTXUdYbM+3d+ss7QNgVxGPT41GuwvJmJMwS0eeGJWQlFd0O3VpTcZN9x6CER7g/RIGfhsrT5Rf+3saWfU/Y0m/33tzbTK552uXcW92FqO7JRMHuAqbFJBAeGhhqHbk3Yka6OiCo+6ccbkR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792334012; c=relaxed/simple;
	bh=pT6sEIRD6LR5R1NwVJrS6ZAbGGNWcZkIDW2r57o/sY4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TQZ7PdC8a02/6YuZVmoz4g23/q9st3WSMqo+9tE5W/zGKcCaZp9CQgugtk/CdryqTUZInv9cnZrD/nDT2zAz9oUMHc65zv/CxTrHjjIMR8e610VGIUQJ4nKrC0cvsL79vJVYVMYwf+xgJqytkNcNjb9R73wtJiqzV7Ltoh1OBCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T4QPLkv2; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T4QPLkv2"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afbd35952so157191f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792334009; x=1792938809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdtC+tieZRObN9lLe/Zl3wgJC4OiD9fS0qYy+5+cDvY=;
        b=T4QPLkv2qWe6ri6bdlTZp7tXKSrwltEk2wZGfb0Y7MA4jtTrOSdyF1LkbFQx9vrBO6
         2luC3NRaYYpRqGl58T0iyZY308t65c1so22t6o3PIR4hjaXAsEi2i8Hp+s+6KhrnvwdM
         rcFVfunQZx0VuPAfEeNpAp98oYO4PLAWZX9k6MZJsuLwW3ZHRdOpuqOauWMX1hku5BoD
         xp/lRNLN3TGpbmcZKY/kcIAA8ZaOaUqFv7yGzAxv/LEUKifv4kRqS46hTfLRJVyj5tF0
         fcA4hGb49HlznYizJ55Vu/dJpBRs30HpYLEQuztlg2XLIIMVNGxTZt7Hmssz7nWEfr8t
         8vKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792334009; x=1792938809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdtC+tieZRObN9lLe/Zl3wgJC4OiD9fS0qYy+5+cDvY=;
        b=RNjACUFe2/5CMeQhCup3xMPf8r9n2gvQKAW3SjPpu2wcFLOXJCTLqmBVYOq4nRCw4L
         Za3JbNEEo8IY5GVxYsMvMcmHO/atzMMGuLmNMmrYVV/4VIPCLskxfLeJkv8iHnBZyeXm
         uyZVF1q/9uMEVbzG9iqlFoHwtza0WP3wQ0b+4obr671V31WGl+PGIyBr9eRH7rZ3P6aj
         mNsqlVG8wV1wYt+DP72GGg056/t/cR1QFV0IP20bdi0Iesa5OiooqlhRK7PKgxt2uUKO
         Peq8OxItPWLHmi3V71GPLhq12OjkzLwMN1jOkJ+ZVQOmO4/4LEYI7urn4rsLvgfVg2at
         2dag==
X-Forwarded-Encrypted: i=1; AKwUvBy9a/Fm0W7/Q2ve7zpRr3ga1+0XakMhZKNCJvIlP8daTv4lAAcgfo1y70Tv8uHQNa+TqRUpQ4UcLBifvKQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIK53UvX0Zxc9iv0HiW2iwPsgvCeUNyWl5akEz+ozX7RjWgwRzl
	4IIA1mJnxHK65IOTrRsWLdqYAX3Z91c2+ywuqOkpliTcw/SnYTJkO0Y4wkbOhfRbAZCeFFmJOJ0
	lGA0jRE4n0A==
X-Gm-Gg: AYBFou0GDil9CdlstfRQpNWzWWsRlxwmPIEk7aDt3eMGMYNn3/g3qWyx+Z6mTBw0Ql4
	5hL41vFYa7qx3r5W6aU8fYZnnxOTWa3xTEzj3WSDpncOYmG3HY7IeYB7aV+syQNRzz+hvGKDmpB
	XSVrxKO1yc2UrHSxxuj2Rt8Pd4SK1y7BquxE4FBzHwSeOQYGtZyn/5oqcKz4QHi3ksGydpsHw+z
	pswcVy8ASDskUdaI6LBI2gVRn8OoRo3lcm+en1ee94AHrKMVnvj/LB5svk5mcl4z3Sjwoayhppv
	yetyPCjatevCuWTcbKmIDKe93sCwmIHg4EDxHz5Pkt7ma2Fxo79C4UYcJxE26whytRWn55rVlfE
	hRYhPy7BNTAbstTi5+ebyDekxKg8oSYhBY7sxACjZ+Szkmmx9+g07uxwJNu7mjnOIL7Zvg9uAYx
	Q7nWiA1ylVUQoEoSZhx7qQH9FQTRVGAA7jd20vx90JvUPWWJaOul8FBzhd6n6oQJkiBIK0+ooC9
	jnCYdmPQsLy
X-Received: by 2002:a05:600c:e558:10b0:4a1:d899:b633 with SMTP id 5b1f17b1804b1-4a1d899b92emr53019725e9.1.1792334009250;
        Sun, 18 Oct 2026 07:33:29 -0700 (PDT)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947928b4sm16339501a91.11.2026.10.18.07.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:33:28 -0700 (PDT)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 0/4] migrates ocfs2 DIO from buffer_head to iomap
Date: Sun, 18 Oct 2026 22:33:12 +0800
Message-ID: <20261018143319.22329-1-heming.zhao@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set migrates ocfs2 Direct I/O (DIO) from buffer_head mode
to iomap mode. And the code base is commit 58717b2a1365d.

Changelog:
v3:
patch 1/4
 revise the commit log
 for ocfs2_map_blocks():
 - removed S_ISLNK() handling, as S_ISLNK inodes are already handled by the existing code path:
   ocfs2_read_folio => block_read_full_folio() => get_block (ocfs2_get_block)
 - replace "return -EIO" with "return err" at the end of this func

patch 2/4
 revise the commit log based on hch's comments.
 in ocfs2_iomap_begin(), replace the "/* todo */" comment under the IOMAP_WRITE case with "return -EOPNOTSUPP".
 revise comments in ocfs2_iomap_dio_end_io()
 remove the unused "bail" label in ocfs2_dio_end_io_r_pr()

patch 3/4
 revise the commit log based on hch's comments.
 remove the unused var max_blocks in ocfs2_iomap_dio_end_io_write().
 followed Joseph's comment, directly set map.lblk in ocfs2_iomap_dio_end_io_write().
 in ocfs2_dio_wr_map_blocks():
 - replace BUG_ON(p_blkno == 0) with "ret = -EIO, mlog_errno() and goto unlock".
   (the legacy code was copied from ocfs2_dio_wr_get_block())
 - adjust arithmetic for map->len by substracting the offset and using min_t() to cap the length within limits. 
 - adjust error handling style for the return value of ocfs2_write_end_nolock().
 introduce a new function, ocfs2_dio_zero_eof().

patch 4/4
 Set f_mode with FMODE_CAN_ODIRECT only for non-inline files, per Joseph's comments.

v2:
- Merge Joseph's code and ideas from [1]:
  - Add FMODE_CAN_ODIRECT to f_mode in ocfs2_file_open()
  - Change iomap_ops and iomap_dio_ops API declarations from ocfs2.h to
    aops.h
  - Switch from iomap_dio_rw to __iomap_dio_rw + iomap_dio_complete
  - Change "struct iomap_dio_ops" from read/write style to PR/EX locking
    style. With this approach, we completely eliminate the need to define
    any iocb->ki_flags bits.
- Remove alignment code from ocfs2_should_use_dio(), because iomap internally
  already handles this.
- Add patch 4 to remove unused functions and the CONFIG_LEGACY_DIRECT_IO
  Kconfig option.
- Add "Co-developed-by: Joseph Qi <joseph.qi@linux.alibaba.com>"

[1]:
https://gitee.com/anolis/storage-cloud-kernel/commit/ea3fe75e2060118ba093e90b1cd34fa382914b29


v1:
https://lore.kernel.org/ocfs2-devel/20260724052559.15409-1-heming.zhao@suse.com/
v2:
https://lore.kernel.org/ocfs2-devel/20260727061802.18485-1-heming.zhao@suse.com/

--------------
# test report

This patch set has been tested on 7.3.0-rc7 kernel with the following test
cases.

## ltp

runltp -f dio -d /mnt/ocfs2/

The test results: passed

## xfstests

format cmd: mkfs.ocfs2 -M local --fs-feature-level=max-features /dev/vde

./check -g quick -T -b -s ocfs2 -e generic/081 \
-e generic/266 -e generic/272 -e generic/281 \
-e generic/338 -e generic/347 -e generic/361 \
-e generic/628 -e generic/629 -e generic/648 -e generic/650 

The test results are the same before and after the patch set.

Failures: generic/003 generic/091 generic/094 generic/177 generic/211
generic/225 generic/263 generic/322 generic/329 generic/331 generic/370
generic/376 generic/424 generic/448 generic/467 generic/477 generic/481
generic/510 generic/513 generic/537 generic/552 generic/563 generic/578
generic/607 generic/620 generic/630 generic/755 generic/760 generic/777
generic/784
Failed 30 of 631 tests

(following is 7.2.0 kernel test result)
Failures: generic/003 generic/322 generic/329 generic/331 generic/370
generic/376 generic/420 generic/424 generic/448 generic/449 generic/467
generic/477 generic/510 generic/513 generic/537 generic/552 generic/563
generic/578 generic/607 generic/620 generic/630 generic/755 generic/777
generic/784
Failed 24 of 632 tests

## fio on single node

(this is v2 test result, v3 test result is similar)

fio --direct=1 --iodepth=32 --rw=write --ioengine=libaio --bs=128k --size=1g \
--numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
- before patch : write: IOPS=18.8k, BW=4708MiB/s (4937MB/s)(4096MiB/870msec)
- applied patch: write: IOPS=39.6k, BW=4953MiB/s (5193MB/s)(4096MiB/827msec)
- overwrite (don't remove write.1g, run above fio command) speed seems same. 

fio --direct=1 --iodepth=32 --rw=read --ioengine=libaio --bs=128k --size=1g \
--numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
- before patch : read: IOPS=52.4k, BW=6554MiB/s (6872MB/s)(4096MiB/625msec)
- applied patch: read: IOPS=52.2k, BW=6522MiB/s (6839MB/s)(4096MiB/628msec)

fio --direct=1 --iodepth=32 --rw=randwrite --ioengine=libaio --bs=4k --size=1g \
--numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
- before patch
  - creating write: IOPS=20.9k, BW=81.7MiB/s (85.6MB/s)(4096MiB/50159msec)
  - overwriting write.1g: write: IOPS=281k, BW=1097MiB/s (1151MB/s)(4096MiB/3733msec)
- applied patch
  - creating write: IOPS=21.0k, BW=82.0MiB/s (86.0MB/s)(4096MiB/49938msec)
  - overwriting write.1g: write: IOPS=329k, BW=1286MiB/s (1348MB/s)(4096MiB/3185msec) 

fio --direct=1 --iodepth=32 --rw=randread --ioengine=libaio --bs=4k --size=1g \
--numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
- before patch : read: IOPS=372k, BW=1452MiB/s (1522MB/s)(4096MiB/2821msec)
- applied patch: read: IOPS=369k, BW=1441MiB/s (1511MB/s)(4096MiB/2842msec)


## fio on two nodes

### write in different folder

node1 /root/fio/diff/ocfs2-w.sh:
> fio --direct=1 --iodepth=32 --rw=write --ioengine=libaio --bs=128k --size=2g \
> --numjobs=2 --runtime=100 --group_reporting --filename=/mnt/ocfs2/node1/write.2g --name=tst

node2 /root/fio/diff/ocfs2-w.sh:
> fio --direct=1 --iodepth=32 --rw=write --ioengine=libaio --bs=128k --size=2g \
> --numjobs=2 --runtime=100 --group_reporting --filename=/mnt/ocfs2/node2/write.2g --name=tst


node1 /root/fio/diff/ocfs2-randw.sh:
> fio --direct=1 --iodepth=32 --rw=randwrite --ioengine=libaio --bs=4k --size=2g \
> --numjobs=2 --runtime=100 --group_reporting --filename=/mnt/ocfs2/node1/write.2g --name=tst

node2 /root/fio/diff/ocfs2-randw.sh:
> fio --direct=1 --iodepth=32 --rw=randwrite --ioengine=libaio --bs=4k --size=2g \
> --numjobs=2 --runtime=100 --group_reporting --filename=/mnt/ocfs2/node2/write.2g --name=tst

run on both node, 
pdsh -w ssh:tw2510-[1-2] /root/fio/diff/ocfs2-w.sh
- before patch : write: IOPS=19.3k, BW=2417MiB/s (2534MB/s)(4096MiB/1695msec)
- applied patch: write: IOPS=20.8k, BW=2599MiB/s (2725MB/s)(4096MiB/1576msec)
pdsh -w ssh:tw2510-[1-2] /root/fio/diff/ocfs2-randw.sh
- before patch : write: IOPS=3742, BW=14.6MiB/s (15.3MB/s)(1462MiB/100007msec)
- applied patch: write: IOPS=3765, BW=14.7MiB/s (15.4MB/s)(1471MiB/100010msec)


### write in same file

node1 & node2: (/root/fio/share/ocfs2-w.sh)
fio --direct=1 --iodepth=32 --rw=write --ioengine=libaio --bs=128k --size=2g \
--numjobs=2 --runtime=100 --group_reporting --filename=/mnt/ocfs2/share/write.2g --name=tst

node1 & node2: (/root/fio/share/ocfs2-randw.sh)
fio --direct=1 --iodepth=32 --rw=randwrite --ioengine=libaio --bs=4k --size=2g \
--numjobs=2 --runtime=100 --group_reporting --filename=/mnt/ocfs2/share/write.2g --name=tst

run on both node
pdsh -w ssh:tw2510-[1-2] /root/fio/share/ocfs2-w.sh
- before patch : write: IOPS=2052, BW=257MiB/s (269MB/s)(4096MiB/15967msec)
- applied patch: write: IOPS=2558, BW=320MiB/s (335MB/s)(4096MiB/12808msec)
pdsh -w ssh:tw2510-[1-2] /root/fio/share/ocfs2-randw.sh
- before patch : write: IOPS=3588, BW=14.0MiB/s (14.7MB/s)(1402MiB/100001msec)
- applied patch: write: IOPS=3590, BW=14.0MiB/s (14.7MB/s)(1403MiB/100001msec)

Heming Zhao (4):
  ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
  ocfs2: switch DIO read path from buffer_head to iomap
  ocfs2: switch dio write path from buffer_head to iomap
  ocfs2: remove legacy blockdev direct-IO path APIs

 fs/ocfs2/Kconfig          |   2 +-
 fs/ocfs2/aops.c           | 689 ++++++++++++++++++++++++--------------
 fs/ocfs2/aops.h           |  38 +--
 fs/ocfs2/buffer_head_io.c |  19 +-
 fs/ocfs2/file.c           | 168 ++++++++--
 fs/ocfs2/ocfs2.h          |  45 ++-
 fs/ocfs2/ocfs2_fs.h       |   3 +
 7 files changed, 634 insertions(+), 330 deletions(-)

-- 
2.55.0

