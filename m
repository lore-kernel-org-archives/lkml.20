Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709807;
	b=sC6lT6httq18ZMIT0dktuACPdpp2+0ERwzp/4G+XdDGMy6gwToS5hfy+0fjd7KzR1tW8
	 O0mlT+Yzf8Om/WSl1awoic15eZ48czDS7DLNCbSEsrG2CDX8/salIbHwPCSl4T778xghh
	 ArUVAnszQpBhObOCuSulPqgR0XdSKzycggYC9aI8mVtYfPq1WyCujVQ2aypiV8geVJIZF
	 LrvAMABA6GXIzW7os0PHmpzb/O+Qg+Hq8tDdBhXOYGJzo/TfaSTKBaKr5dH6LHysNblmF
	 +vl01QXA7Eb5ck0zQD/gY2k60NBraTmeTLP1sl6OcC8PLk2SyP37zNpRDT6j79wwPEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EYwaFjTaiXHJpW1ztljpbxc/E5ty0DDSV7TAsaiQzBw=;
	b=pTVqW6pEqSW5VvrdDaNoZzvFh6wRGhx+ovzTIFoFCeb++OqAE33KRkRa1X8jva9kPpHV
	 EgcknqJgUIcRc08dIdh2yD6DyGuGayctHRR9EY2uUvoxL5ya3QuIhF/MeoK5mUgqIoEHi
	 QAZoPrGAzw9vgPT8toYOQ8aWeUeqxdzo7j3gAI+Sl5LI2uye2JPbXNopamQeTgc3yH2rK
	 v8TlNtY/Zokr1NYGm0oq2JeS6sKZ6vQowakB73fI9bdaITB8w2Ytml8sTJkXEVo+gKYOw
	 0luxlGKmZXATk7Q+58VM9LVo/bkOGwdHKIhnTTU7zve5tDQ/gcE7xuQPoRHMGFWYJ3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=F4+i2B9z;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50987606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50987606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=F4+i2B9z
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a599e9110eso21515835e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793709805; x=1794314605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYwaFjTaiXHJpW1ztljpbxc/E5ty0DDSV7TAsaiQzBw=;
        b=F4+i2B9zC41cAk+bQs/TTGcDT50Txv8OG4nHkbiFFAHwzPPoDm6/umZeQcT+z/4mDb
         OPGra87z/aept+BCk/jwISXNMk1+ZjQA/erNokrx5VQuJxvkpk1CRZsKHowzjyJCoJ/s
         78XBb5WDrLyeZROPzG4Au5k1qOrUzSxq6nJluutQHDIWAIoBT681VK++6fYm6fIAFxp+
         BQXgtcBl7+YYeaqxis7Np2FMg/DMHn1x5LXWx5VTIuYJuTDtdTCk11mUeq7Qnm+3AHEc
         QRUIHIfrNAJkhvoJrVnhcZyXBHxdr3xLjBqRirNSR3BwnrwufMXpz7FqTs6H8dISZyLI
         gC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793709805; x=1794314605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYwaFjTaiXHJpW1ztljpbxc/E5ty0DDSV7TAsaiQzBw=;
        b=eULuB9Htdf1l7A5w+pRNdPTl5yGkwxVgcUY6v6n+0LbMazBv6S3OWJvv6KWxefRFZ3
         aRMzLdqkjhGQFOFVLGV7bonOFi/HmPcn/iPMNwmgNSJLJphZA1V8ScKEnQsEo55AvOMv
         Gq4k4Pj0aapKVQyRWrQjbzpkHnHVjiXN4MIO+kPEbV65T7Rbni5FWw9EXK0UP1agW1m5
         ffFh+YkXQL/2hCn8/HEm7X9p9jma6OUYfSybhizb6U3ZbgYU+HJShfjK1plNRChR3xxS
         rLsbisKwKrUmlO9hekizrSTB8wmQaL1Oc6gmlt87bxP4okEJohOrQ62Y5A0LGbc2Lt4A
         nOEA==
X-Forwarded-Encrypted: i=1; AKwUvBzertMUew8gU+W53AlX0cF29Pc8llyoLAL5U8AzB1blRFi5vIcwE9E+ye6kY+MOIV9seJPjtuGl70PWNIU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kp6AM/fycRRM6f6khs01VK/sFPolwAr6gM98ipuWqjYbADXDM
	gslabBeDVcDOZTLikivWNweBeYe1n9+TSDhwXoBoEIiOx0g+trgz+nE5XlZHA3kXt4Q=
X-Gm-Gg: AYBFou1KZpsuIzoILNGSzEjkbFFFZ6Wk4ojyIR5Xot6eTfctpbDKxa/+yaC3HqSbHax
	moJt9MC7nxVKveS4E0KU9KW7B6wVXD1nqCK3nFvdbZfXrOkRNgyRCkBTwWs6Y9UK0djWvjghqpM
	DoVJFYSS34kS7oWEvLqlzQqWSLF8bVGotvKkvW0eiWM8Pn1eLE5Oa9Wqa2UMMqjxIB3rQhYywWC
	N6TZz2inQsJfq+QKzd8hDvLRhC8b4t80p8cIFlrNCijTqJDCSLvawapvE3p+2n+WktA1je8IwmC
	hMnFvAFK8+O8D2NW42v2pYzC78hA2/hYwoniuiZcjwv3zmv0bR2VWlbus+0ywo5gdYG00eYswQf
	M6tnt0VkKBJN8bVne1hNwxwcuuXK1BKaMLzp/xF6qC5z4emDQLjn2qDcyfV4vQ3gEEIUbA99UNq
	ykULzaNJGWaLNsJsizp0P7RynfeTzpopKPDzXjU5Zm6hwYYfy95iF3yhWqrZm9blodK6i+rEH/o
	mXYHlclsd55lBtDhBoo0EpfoVotLtKLM5+Yu5Ni/6AUIc8TCI52HQGbMAuu2SYgb/kux7BmBwcD
	QkxV7Y/lIABxbtdb2bpiztqRDvtGkwCiU+kuilb8tws=
X-Received: by 2002:a05:600c:a010:b0:4a1:7dcf:be1f with SMTP id 5b1f17b1804b1-4ac166ee4d6mr292750935e9.1.1793709804657;
        Tue, 03 Nov 2026 04:43:24 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8460acsm4365014a91.7.2026.11.03.04.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:43:23 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 0/4] migrates ocfs2 DIO from buffer_head to iomap
Date: Tue,  3 Nov 2026 20:43:04 +0800
Message-ID: <20261103124310.21143-1-heming.zhao@suse.com>
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

This patch set migrates ocfs2 Direct I/O (DIO) from buffer_head mode
to iomap mode. And the code base is commit 4056b3c9d3c92ea, and also
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
Failures: generic/003 generic/177 generic/211 generic/322 generic/329 generic/331 generic/370 generic/376 generic/420 generic/424 generic/448 generic/467 generic/477 generic/481 generic/510 generic/513 generic/537 generic/552 generic/563 generic/578 generic/607 generic/620 generic/630 generic/755 generic/777 generic/784
Failed 26 of 632 tests

OCFS2_MKFS_LOCAL_OPT="-b 2K -C 8K --fs-features=local --fs-feature-level=max-features"
Failures: generic/003 generic/075 generic/091 generic/094 generic/112 generic/177 generic/211 generic/225 generic/263 generic/322 generic/329 generic/331 generic/370 generic/376 generic/424 generic/448 generic/467 generic/477 generic/481 generic/510 generic/513 generic/537 generic/552 generic/563 generic/564 generic/578 generic/607 generic/620 generic/630 generic/755 generic/759 generic/760 generic/777 generic/784 ocfs2/001
Failed 35 of 632 tests

OCFS2_MKFS_CLUSTER_OPT="-b 2K -C 4K -N 2 --fs-feature-level=max-features --cluster-stack pcmk --cluster-name hacluster"
Failures: generic/001 generic/003 generic/091 generic/094 generic/211 generic/225 generic/263 generic/322 generic/329 generic/331 generic/370 generic/376 generic/424 generic/448 generic/467 generic/477 generic/510 generic/513 generic/537 generic/552 generic/563 generic/578 generic/607 generic/620 generic/630 generic/755 generic/760 generic/777 generic/784
Failed 29 of 632 tests

OCFS2_MKFS_CLUSTER_OPT="-b 4K -C 4K -N 2 --fs-feature-level=max-features --cluster-stack pcmk --cluster-name hacluster"
Failures: generic/003 generic/211 generic/322 generic/329 generic/331 generic/370 generic/376 generic/420 generic/424 generic/448 generic/467 generic/477 generic/510 generic/513 generic/537 generic/552 generic/563 generic/578 generic/607 generic/620 generic/630 generic/755 generic/777 generic/784
Failed 24 of 632 tests

OCFS2_MKFS_CLUSTER_OPT="-b 2K -C 8K -N 2 --fs-feature-level=max-features --cluster-stack pcmk --cluster-name hacluster"
Failures: generic/003 generic/075 generic/091 generic/094 generic/112 generic/211 generic/225 generic/263 generic/322 generic/329 generic/331 generic/370 generic/376 generic/424 generic/448 generic/467 generic/477 generic/510 generic/513 generic/537 generic/547 generic/552 generic/563 generic/564 generic/578 generic/607 generic/620 generic/630 generic/755 generic/759 generic/760 generic/777 generic/784
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
 fs/ocfs2/file.c           | 214 +++++++++++---
 fs/ocfs2/ocfs2.h          |  46 ++-
 fs/ocfs2/ocfs2_fs.h       |   3 +
 7 files changed, 616 insertions(+), 267 deletions(-)

-- 
2.55.0

