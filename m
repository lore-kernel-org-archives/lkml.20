Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714180;
	b=whwQmxC/dRqmbW+je/3J91D/08Si9s2E8G+yeDs4okZG4/WifIu4dtn9e8yj9+g0BYrq
	 7RbtF/fYdEYsRq6bTNItZxoepehr++0VC4hKjMhThb4ngRJdpdODIRZKxEeQ1u5La3oIm
	 dBpnmWdbDV3GngNzFJIqZNYdQIJGZMqegQBEv480QTNAHJSxvKhD99B6J8tC7pYwEn4Ai
	 /vRzaTSgHJICMlwFsGfZaSkKnB2lsulH/AiSc8SqCbrjCVt5rDIosy9kRCQDCRukarUmj
	 hHDckbJpFKRIk4X3Rxc1M6fLldJr3TxkdgTgjkSWApwdIIDIU8BGO9akQgFRIdl37Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1mF/Wb+MOtAslfyKD+az4LMnyLK9TBg4kE+T6uVGVAg=;
	b=o/YU2HiBos2rwCF7GKc4I/35nNWLOH7ge56Kpbj869jJCtpZvwsXm1bvj+5/ANItClhR
	 tH/AjbTxx5UELj6AzzAlMYRgpW5prMRtI9gYQLml9/gH/9PxPEqfiJR6YvrOtSrVrWCDP
	 gchFDXPxmrTiY1rslizA9A6aSd36ci/OhZu+w/LbB9H0LqXHQ28+ULP/Xpmc9cQYxm5/6
	 MHKZ5vVAqkDAMTu+KL6lC5YwgVL7YGc30VGHc2e49d1ZuTWGMfCpqdFNykCc7LqR6q5uE
	 rVKZhA7AH/Qr8GNToGbyXYXOSipez0S0vmhbyWedWHxSHDL2fB8jRlHUWlohLd0w9lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bUbXYKUB;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBD9606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDBD9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bUbXYKUB
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a599e9110eso21766815e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793714178; x=1794318978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1mF/Wb+MOtAslfyKD+az4LMnyLK9TBg4kE+T6uVGVAg=;
        b=bUbXYKUBx/NY1rY6hRhuBflURH7qvGs8KLWQ91r2bUdZqd4RKXgxRrxW5hYP3rQ7kp
         2gYY3Qcn0Q6c+z2DD1uzMnmUjwY6vJARKmm3Mv2tIgiToA3ehmZ0MLNEF1AE7mm33K+c
         Xfof6GjCA3oDqRxcottyWxjyWgsZXNmQETfOT+S5CJY0W/ehxCf5gufn/FpxPZR4KkAj
         KOtZsEl49uR3Jx6JJQqpGokCX+4baMJu6GUQ9OYBLOiXjyWpxbbxazqW6We7a7GQpKVe
         MhiOHKnIyX8e8m1bDsI1j0q7XeAYc7ac5ISWuvPk0H31Q7CpLcHzxA/KWelIjRP/fbC9
         sN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714178; x=1794318978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1mF/Wb+MOtAslfyKD+az4LMnyLK9TBg4kE+T6uVGVAg=;
        b=Slsi7QPm/sCidCsH5t8N8q9Ficm2U8aqSJUutYsOKfm4sbiufdTTSa/kGXk23tl82R
         nP2lHeFRQj1q8i765s0uffsr33Y9QT/V1HNvqQZcG0DzFq6k0yP67M/mZzKmd1U+1PDG
         XXf1CoJaQyeArjq+zelaCl7xoMf3INkDn4vxP0f12wiKsmr9X5wG2vBNrHBwZWgVaJdT
         NAFhBrlIRoQAJ8F0Sm5reY5ocWmq+MZ/5298MkHCmyP19iATN/Vb55MtDJzpBDAR3mjC
         yCJqmXQ1xTa1+48POlNutHqaY/1PSMdF99XW5HIzX+iLlu1np7rEBgJb0ojQOZnlJA9e
         PmRw==
X-Forwarded-Encrypted: i=1; AKwUvBwosHGjrM2LujuxsFxVtzplcqSVnFwcnY+O7tDf6loxYKYA5zDME5Td2OSwb4ry08BdWpSw6LQcBkcUqic=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XaMco5UmTsx9R8AM6INhC9cUi2hXLud0MLZtelyH/r3dHHPay
	ZFwCezq7UyHQNZgSgRm6x75A87WB1XtPtm06SH+raIyzgelUwxTJPLvAT6cZfvNKcoA=
X-Gm-Gg: AYBFou1FdhFXfbkij4eBTzU73MnWdHj8jHWz2nKeSbghl+RsdbSPRtKDF0QTeAqK05C
	Py7YSlNtTD8JlfSiAtUmvqsFaOizY3xtL7SCAnsuH83wpIfm5X1BLh7/ll6wlcnUs4pdOYq/jwV
	2ycrHoWfLbMuvPwFXrxMAA+9HDZf6Qj69At1xU1C+xn7prlXt2Z5AVdKVsOhIqbZ3BdMwQqtLpW
	MY+XXlyn8VSDWDqLdfR04j3LEd1g+Lrp1ugSirWt6oQhq5W1mg1Rb3ingia3Xe5yfpsDTNNIxEx
	7HG/HMwLG/FjzE0Kx/Hxh0hhzF56LTk5dXksrqfQq0qyq7WfvsQKXh2cMHKyQrYDIVz222EbWI7
	t1m4kC6qd/dDBQplVu1sxDPZe9dXhilKGgDGrCdHqWNrFdO4h4/D5IsnXip6/uhYb9zJ7vLXgu3
	v/20n7lo2/F1s3Jt02PFiirSOwhgqLHlhEr3vCoaOKg5ccxlT607Fxk/CW934xPi4u8u6aTc5Nc
	h1bzHUQf88TFNv2flmwtKwdn3jK5Gbas1FZizr6AK0Or83upvzPI6xFBxKg3UNyH/LZDx9336/X
	0kKfI6rxuVZ8mb/aUSpBDqo4Oh3PRvszKQ/uuZzYttQ=
X-Received: by 2002:a05:600c:1c06:b0:4a1:e015:6441 with SMTP id 5b1f17b1804b1-4ac12194311mr366054135e9.0.1793714178228;
        Tue, 03 Nov 2026 05:56:18 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1a16sm39629747c88.1.2026.11.03.05.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:56:16 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RESEND RFC PATCH v4 0/4] migrates ocfs2 DIO from buffer_head to iomap
Date: Tue,  3 Nov 2026 21:55:59 +0800
Message-ID: <20261103135605.22943-1-heming.zhao@suse.com>
X-Mailer: git-send-email 2.55.0
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

Previously, I sent a v4 patch set based on commit 4056b3c9d3c9 (v7.3),
which caused sashiko to fail to apply the patches. Therefore, I am
resending the patch set based on commit 6628e7d4c6b2 (v7.4-rc1).

---
This patch set migrates ocfs2 Direct I/O (DIO) from buffer_head mode
to iomap mode. And the code base is commit 6628e7d4c6b2, and also
merge Joseph's code and ideas from [1]:

v4 changelog:

Fix several issues found during a sashiko review[2].

To simplify iomap development, we currently adopt the simplest approach:
retaining the buffer_head style, where only one cluster is allocated
per iomap_begin() call.

When creating a filesystem using "mkfs -b 2K -C 8K" (where the cluster
size is greater than the page size), several xfstests cases crashed.
The root cause was an incorrect return value from iomap end_io.

Both the add and del of the orphan inode during write I/O are now placed
in ocfs2_file_write_iter().

Additionally, I attempted to implement .submit_io/.end_io in "struct
iomap_dio_ops" to free dwc inside end_io. However, because ->bi_end_io
runs in an interrupt context and ocfs2_iomap_dio_end_io_write() contains
sleepable functions, this approach required scheduling a workqueue directly
from the ->bi_end_io callback and calling ocfs2_iomap_dio_end_io_write()
within the workqueue thread context. Furthermore, since iomap_dio_ops.end_io
still cannot access any private data, it cannot accurately wait for the
work to finish. Testing with xfstests triggered hangs and crashes.


[1]:
https://gitee.com/anolis/storage-cloud-kernel/commit/ea3fe75e2060118ba093e90b1cd34fa382914b29

[2]:
https://sashiko.dev/#/patchset/20261018143319.22329-1-heming.zhao%40suse.com

v1 patch set:
https://lore.kernel.org/ocfs2-devel/20260724052559.15409-1-heming.zhao@suse.com/
v2 patch set:
https://lore.kernel.org/ocfs2-devel/20260727061802.18485-1-heming.zhao@suse.com/
v3 patch set:
https://lore.kernel.org/ocfs2-devel/20261018143319.22329-1-heming.zhao@suse.com/

--------------
# test report

This patch set has been tested on 7.3.0-rc7 kernel with the following test
cases.

## ltp

runltp -f dio -d /mnt/ocfs2/

1 fail: diotest4    9  TCONF  :  diotest4.c:346: Direct I/O on /dev/null is not supported

This fail can be ignored.

The test results: passed

## xfstests

./check -g quick -T -b -s ocfs2 -e generic/081 \
-e generic/266 -e generic/272 -e generic/281 \
-e generic/338 -e generic/347 -e generic/361 \
-e generic/628 -e generic/629 -e generic/648 -e generic/650 

The test results are the same before and after the patch set.

```
OCFS2_MKFS_LOCAL_OPT="-b 2K -C 4K --fs-features=local --fs-feature-level=max-features"
Failures: generic/003 generic/091 generic/094 generic/177 generic/211
generic/225 generic/263 generic/322 generic/329 generic/331 generic/370
generic/376 generic/424 generic/448 generic/467 generic/477 generic/481
generic/510 generic/513 generic/537 generic/552 generic/563 generic/578
generic/607 generic/620 generic/630 generic/755 generic/760 generic/777
generic/784
Failed 30 of 632 tests

OCFS2_MKFS_LOCAL_OPT="-b 4K -C 4K --fs-features=local --fs-feature-level=max-features"
Failures: generic/003 generic/177 generic/211 generic/322 generic/329
generic/331 generic/370 generic/376 generic/420 generic/424 generic/448
generic/467 generic/477 generic/481 generic/510 generic/513 generic/537
generic/552 generic/563 generic/578 generic/607 generic/620 generic/630
generic/755 generic/777 generic/784
Failed 26 of 632 tests

OCFS2_MKFS_LOCAL_OPT="-b 2K -C 8K --fs-features=local --fs-feature-level=max-features"
Failures: generic/003 generic/075 generic/091 generic/094 generic/112
generic/177 generic/211 generic/225 generic/263 generic/322 generic/329
generic/331 generic/370 generic/376 generic/424 generic/448 generic/467
generic/477 generic/481 generic/510 generic/513 generic/537 generic/552
generic/563 generic/564 generic/578 generic/607 generic/620 generic/630
generic/755 generic/759 generic/760 generic/777 generic/784 ocfs2/001
Failed 35 of 632 tests

OCFS2_MKFS_CLUSTER_OPT="-b 2K -C 4K -N 2 --fs-feature-level=max-features --cluster-stack pcmk --cluster-name hacluster"
Failures: generic/001 generic/003 generic/091 generic/094 generic/211
generic/225 generic/263 generic/322 generic/329 generic/331 generic/370
generic/376 generic/424 generic/448 generic/467 generic/477 generic/510
generic/513 generic/537 generic/552 generic/563 generic/578 generic/607
generic/620 generic/630 generic/755 generic/760 generic/777 generic/784
Failed 29 of 632 tests

OCFS2_MKFS_CLUSTER_OPT="-b 4K -C 4K -N 2 --fs-feature-level=max-features --cluster-stack pcmk --cluster-name hacluster"
Failures: generic/003 generic/211 generic/322 generic/329 generic/331
generic/370 generic/376 generic/420 generic/424 generic/448 generic/467
generic/477 generic/510 generic/513 generic/537 generic/552 generic/563
generic/578 generic/607 generic/620 generic/630 generic/755 generic/777
generic/784
Failed 24 of 632 tests

OCFS2_MKFS_CLUSTER_OPT="-b 2K -C 8K -N 2 --fs-feature-level=max-features --cluster-stack pcmk --cluster-name hacluster"
Failures: generic/003 generic/075 generic/091 generic/094 generic/112
generic/211 generic/225 generic/263 generic/322 generic/329 generic/331
generic/370 generic/376 generic/424 generic/448 generic/467 generic/477
generic/510 generic/513 generic/537 generic/547 generic/552 generic/563
generic/564 generic/578 generic/607 generic/620 generic/630 generic/755
generic/759 generic/760 generic/777 generic/784
Failed 33 of 632 tests
```

## fio on single node

fio --direct=1 --iodepth=32 --rw=write --ioengine=libaio --bs=128k --size=1g \
--numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
- before patch write: IOPS=31.5k, BW=3935MiB/s (4126MB/s)(4096MiB/1041msec)
- before path overwrite (don't remove write.1g, run above fio command):
      write: IOPS=39.5k, BW=4935MiB/s (5175MB/s)(4096MiB/830msec)
- applied patch write: IOPS=37.4k, BW=4676MiB/s (4903MB/s)(4096MiB/876msec)
- applied patch overwrite (don't remove write.1g, run above fio command):
      write: IOPS=39.4k, BW=4929MiB/s (5168MB/s)(4096MiB/831msec)

fio --direct=1 --iodepth=32 --rw=read --ioengine=libaio --bs=128k --size=1g \
--numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
- before patch : IOPS=47.7k, BW=5962MiB/s (6252MB/s)(4096MiB/687msec)
- applied patch: IOPS=48.2k, BW=6024MiB/s (6316MB/s)(4096MiB/680msec)

fio --direct=1 --iodepth=32 --rw=randwrite --ioengine=libaio --bs=4k --size=1g \
--numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
- before patch
  - creating write      : IOPS=3282, BW=12.8MiB/s (13.4MB/s)(1283MiB/100026msec)
  - overwriting write.1g: IOPS=41.8k, BW=163MiB/s (171MB/s)(4096MiB/25115msec)
- applied patch
  - creating write      : IOPS=3230, BW=12.6MiB/s (13.2MB/s)(1262MiB/100031msec)
  - overwriting write.1g: IOPS=40.5k, BW=158MiB/s (166MB/s)(4096MiB/25908msec)

fio --direct=1 --iodepth=32 --rw=randread --ioengine=libaio --bs=4k --size=1g \
--numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
- before patch  read: IOPS=361k, BW=1409MiB/s (1477MB/s)(4096MiB/2907msec)
- applied patch read: IOPS=362k, BW=1416MiB/s (1485MB/s)(4096MiB/2893msec)

---------------------

Heming Zhao (4):
  ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
  ocfs2: switch DIO read path from buffer_head to iomap
  ocfs2: switch dio write path from buffer_head to iomap
  ocfs2: remove legacy blockdev direct-IO path APIs

 fs/ocfs2/Kconfig          |   2 +-
 fs/ocfs2/aops.c           | 568 +++++++++++++++++++++++++-------------
 fs/ocfs2/aops.h           |  38 +--
 fs/ocfs2/buffer_head_io.c |  12 -
 fs/ocfs2/file.c           | 213 ++++++++++++--
 fs/ocfs2/ocfs2.h          |  46 ++-
 fs/ocfs2/ocfs2_fs.h       |   3 +
 7 files changed, 616 insertions(+), 266 deletions(-)

-- 
2.55.0

