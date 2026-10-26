Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992329;
	b=sQ9YAprMEs6yPcN9ceyaLIt0kh1goPwuPMLnXSZkh+wLmyfce1vN0wk6N5+A//G95ndT
	 Ono0wxVBE16ALV7Tfl08YSFTYXCldOCN2Ul2nn/ovCVTL/YUmGxhbVnpx/1QSr2Zg8VyM
	 vx+uruPoem51MN5eGdT1pWbeSSnd1ITfh0El2Yrb1tONWbFuxhV/fKog9/TNlZ8gCH7Qa
	 HBpO5MBVLiVZsTBfIRD808g6D6mp/SzgMBOUilVTYzLdnzIIBuCrLHrHJJNgup4i32ceR
	 Mu0qq3ih/1cIU5Y1hDQ/pGSVi4BpM2oTWYlv332OQd9BgNRamR3VsgKAuYDaCA/ksCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=bKIzzGBwaCJ4jtOixxQxSSbSQWvSLniGHV6RCXhihVs=;
	b=NyMJnXnuNfY50+3VYTb72F4df5uCwRi/wuRpy4mO4ugnjA31spmmyuvJUMtPlyIx1tIp
	 k6kOwXmxBmBXAThDsbqkHnpWFWYGr/Uj7xBk/uoY8G5j14+ri0yS3SkHKDC+w5FtlWTUC
	 BtHlK9CUv3NaSvMgYxe7w5qDEV229+/qW6bWN+PY6ArZVjn4WPGBR+tBuD2ZXG0vCEuj8
	 wvQvHx1MqX2quOEqA7HTDzid8rtiVzmSq29TexcjzeYyEaA0yPiIYXuw829/xXZcVUHiS
	 ha0hiPUniHFs6GYJi2u7WBEuHuaNgQPcpRpilRc1Nlh51yam2iyhPN25be8HbKh9bMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=c4FSjvoE;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F162606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F162606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=c4FSjvoE
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfbf48b92so201494f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792992327; x=1793597127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKIzzGBwaCJ4jtOixxQxSSbSQWvSLniGHV6RCXhihVs=;
        b=c4FSjvoE/TYKKBVW+WnYaw4Vkq+IqSfNHAtd1+kWv3OzKLhSZlxQJqmYY8ARdHuOQK
         nPTAMfhIFZVK2FIoFU2dzwmtLW7RaC0VXt0EVgN5CgHYRd5wyOJYf2IWe4l2V5iSNj75
         YT9ZAVgpqbEzv5AhK8u6wJ9aNG87cRlK64ork4Dq67146Vpl1/jtNZ2GZ9m40ioFQbCd
         iHP7vMgSt1ALySjuKojGC6itJlNlk7ToJe3ki/ZpdpLcxSjxSvEf7oOf/XsKyM0VhnQl
         LkNtTK/VyBqLUjWeAdZZZ/J2uUtf8xqIycRP1tfrjmG0MMG3vNNhpD39FPYYeg1jdO/a
         M/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992327; x=1793597127;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKIzzGBwaCJ4jtOixxQxSSbSQWvSLniGHV6RCXhihVs=;
        b=tBwEem81WVNmpyxxd/NeqwKuF9ZUGASaKWtCAz8JdKCO5uynvE/hqnZ4Us7iyxTTaA
         p98UyDIqjRtoRZ0+IbLsNPYGOZXa+8VCOyt28TM8V1Bp7dX/2gqkdFtK7O7xrQKy0N1F
         voFIx8nxVMRr+22CZbJ7hwkXgx+UyQhfNsBSQQITfz2Yxq12vKr91qeqyWmoT8eCsRoC
         /yqwm4v5TsRMyJ3hpE6pA8zdyjGjkVR8FAxOMdpAWXpsL7WNAWXrJOij0XL1I7bhlcLX
         VZU4E6wDxH02royr/8062G0JxrN8iW27oDn1BlycAYqs1YSkKOOaIgGFspWu/O4al60h
         Q/vg==
X-Forwarded-Encrypted: i=1; AKwUvBwqtjOmIdU6E0m/op6i+pAYZtfip5z3DnSSRxkoBGFV+iEPSpF/EYz6zX03yrHmN/VAgJCrOlnnY8W7V3c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHMgx0Ckxu+IHatmkEROO5QMoAsgBN8w4Kz9CkLlikd4x+ItSE
	6skVLRUOupRlwU84njRdvOBLMqK30IoaA3LfB+vllEGMHoRqIDDzg5bIidk0AxK7hsk=
X-Gm-Gg: AYBFou04iJ3CcYJzg2spQc4ncrkVeR6NSVixpW5YFzFLphXLrOmEZfMbLH6wMyRWjAa
	ciEzPlHxASCyQFwIlkZ0AqtSQV43WvVEX83GJZ049UEuwCw72fKUZLz/+oPw6qIy6HFbDY/HpEZ
	Yl6rIeAjMyHS1SSw/8M3CWwFNk0YmN9Wn7YGIKmZYnAvvxZ9R8FMGtsZbES2ae0AXWhNTZTmf4u
	JHqW75RuvF0m/Vha1N9zQHkrfTjb+fABx84s/kMzvBYysF0N0FG4WFYas67SFojw9tjivNAFyNk
	pSC0qSJWjygXWCtrkIT/X/qQyEUdKdeqzv9bX9oYnyk/ZoIBw6dCJIfXToYBOYVOKGwSYOAGpa1
	lFEry2+VLAvBCMfVRw9dgFRwcLWDlrh7idsDjNYdNJR4LGfTkwVyRNOt1PRhrJ3btl3GhtgsUJ8
	E9om6WDj8AankZ6SmglDXDuKpfrxIBUTtuJ/FpZdLk7c6DkXXg5dyjMbguwTTyP6AnKo3IuC5IB
	sxg5vhksyJKftvtuyJD9xv83/dP9DTiD7LDH1Ypp+6gIRMSQHLkQAYYIGio5g==
X-Received: by 2002:a05:6000:2905:b0:48d:f14a:9186 with SMTP id ffacd0b85a97d-48e3eb97829mr12422096f8f.6.1792992326871;
        Sun, 25 Oct 2026 22:25:26 -0700 (PDT)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba32f70sm6668139a91.1.2026.10.25.22.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 22:25:25 -0700 (PDT)
Message-ID: <dd546510-34c9-4b08-8b34-defcbe7a1c22@suse.com>
Date: Mon, 26 Oct 2026 13:25:21 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 0/4] migrates ocfs2 DIO from buffer_head to iomap
To: joseph.qi@linux.alibaba.com, mark@fasheh.com, jlbec@evilplan.org,
 hch@lst.de
Cc: ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261018143319.22329-1-heming.zhao@suse.com>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <20261018143319.22329-1-heming.zhao@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello list,

When using the format command "mkfs.ocfs2 -b 2K -C 8K --fs-features=local \
--fs-feature-level=max-features /dev/<disk>" to run xfstests,
I encountered some new hang issues. These issues are from the iomap
write path. I will withdraw the v3 patch, and after fixing all the
issues, I will send v4.

Thanks,
Heming

On 10/18/26 22:33, Heming Zhao wrote:
> This patch set migrates ocfs2 Direct I/O (DIO) from buffer_head mode
> to iomap mode. And the code base is commit 58717b2a1365d.
> 
> Changelog:
> v3:
> patch 1/4
>   revise the commit log
>   for ocfs2_map_blocks():
>   - removed S_ISLNK() handling, as S_ISLNK inodes are already handled by the existing code path:
>     ocfs2_read_folio => block_read_full_folio() => get_block (ocfs2_get_block)
>   - replace "return -EIO" with "return err" at the end of this func
> 
> patch 2/4
>   revise the commit log based on hch's comments.
>   in ocfs2_iomap_begin(), replace the "/* todo */" comment under the IOMAP_WRITE case with "return -EOPNOTSUPP".
>   revise comments in ocfs2_iomap_dio_end_io()
>   remove the unused "bail" label in ocfs2_dio_end_io_r_pr()
> 
> patch 3/4
>   revise the commit log based on hch's comments.
>   remove the unused var max_blocks in ocfs2_iomap_dio_end_io_write().
>   followed Joseph's comment, directly set map.lblk in ocfs2_iomap_dio_end_io_write().
>   in ocfs2_dio_wr_map_blocks():
>   - replace BUG_ON(p_blkno == 0) with "ret = -EIO, mlog_errno() and goto unlock".
>     (the legacy code was copied from ocfs2_dio_wr_get_block())
>   - adjust arithmetic for map->len by substracting the offset and using min_t() to cap the length within limits.
>   - adjust error handling style for the return value of ocfs2_write_end_nolock().
>   introduce a new function, ocfs2_dio_zero_eof().
> 
> patch 4/4
>   Set f_mode with FMODE_CAN_ODIRECT only for non-inline files, per Joseph's comments.
> 
> v2:
> - Merge Joseph's code and ideas from [1]:
>    - Add FMODE_CAN_ODIRECT to f_mode in ocfs2_file_open()
>    - Change iomap_ops and iomap_dio_ops API declarations from ocfs2.h to
>      aops.h
>    - Switch from iomap_dio_rw to __iomap_dio_rw + iomap_dio_complete
>    - Change "struct iomap_dio_ops" from read/write style to PR/EX locking
>      style. With this approach, we completely eliminate the need to define
>      any iocb->ki_flags bits.
> - Remove alignment code from ocfs2_should_use_dio(), because iomap internally
>    already handles this.
> - Add patch 4 to remove unused functions and the CONFIG_LEGACY_DIRECT_IO
>    Kconfig option.
> - Add "Co-developed-by: Joseph Qi <joseph.qi@linux.alibaba.com>"
> 
> [1]:
> https://gitee.com/anolis/storage-cloud-kernel/commit/ea3fe75e2060118ba093e90b1cd34fa382914b29
> 
> 
> v1:
> https://lore.kernel.org/ocfs2-devel/20260724052559.15409-1-heming.zhao@suse.com/
> v2:
> https://lore.kernel.org/ocfs2-devel/20260727061802.18485-1-heming.zhao@suse.com/
> 
> --------------
> # test report
> 
> This patch set has been tested on 7.3.0-rc7 kernel with the following test
> cases.
> 
> ## ltp
> 
> runltp -f dio -d /mnt/ocfs2/
> 
> The test results: passed
> 
> ## xfstests
> 
> format cmd: mkfs.ocfs2 -M local --fs-feature-level=max-features /dev/vde
> 
> ./check -g quick -T -b -s ocfs2 -e generic/081 \
> -e generic/266 -e generic/272 -e generic/281 \
> -e generic/338 -e generic/347 -e generic/361 \
> -e generic/628 -e generic/629 -e generic/648 -e generic/650
> 
> The test results are the same before and after the patch set.
> 
> Failures: generic/003 generic/091 generic/094 generic/177 generic/211
> generic/225 generic/263 generic/322 generic/329 generic/331 generic/370
> generic/376 generic/424 generic/448 generic/467 generic/477 generic/481
> generic/510 generic/513 generic/537 generic/552 generic/563 generic/578
> generic/607 generic/620 generic/630 generic/755 generic/760 generic/777
> generic/784
> Failed 30 of 631 tests
> 
> (following is 7.2.0 kernel test result)
> Failures: generic/003 generic/322 generic/329 generic/331 generic/370
> generic/376 generic/420 generic/424 generic/448 generic/449 generic/467
> generic/477 generic/510 generic/513 generic/537 generic/552 generic/563
> generic/578 generic/607 generic/620 generic/630 generic/755 generic/777
> generic/784
> Failed 24 of 632 tests
> 
> ## fio on single node
> 
> (this is v2 test result, v3 test result is similar)
> 
> fio --direct=1 --iodepth=32 --rw=write --ioengine=libaio --bs=128k --size=1g \
> --numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
> - before patch : write: IOPS=18.8k, BW=4708MiB/s (4937MB/s)(4096MiB/870msec)
> - applied patch: write: IOPS=39.6k, BW=4953MiB/s (5193MB/s)(4096MiB/827msec)
> - overwrite (don't remove write.1g, run above fio command) speed seems same.
> 
> fio --direct=1 --iodepth=32 --rw=read --ioengine=libaio --bs=128k --size=1g \
> --numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
> - before patch : read: IOPS=52.4k, BW=6554MiB/s (6872MB/s)(4096MiB/625msec)
> - applied patch: read: IOPS=52.2k, BW=6522MiB/s (6839MB/s)(4096MiB/628msec)
> 
> fio --direct=1 --iodepth=32 --rw=randwrite --ioengine=libaio --bs=4k --size=1g \
> --numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
> - before patch
>    - creating write: IOPS=20.9k, BW=81.7MiB/s (85.6MB/s)(4096MiB/50159msec)
>    - overwriting write.1g: write: IOPS=281k, BW=1097MiB/s (1151MB/s)(4096MiB/3733msec)
> - applied patch
>    - creating write: IOPS=21.0k, BW=82.0MiB/s (86.0MB/s)(4096MiB/49938msec)
>    - overwriting write.1g: write: IOPS=329k, BW=1286MiB/s (1348MB/s)(4096MiB/3185msec)
> 
> fio --direct=1 --iodepth=32 --rw=randread --ioengine=libaio --bs=4k --size=1g \
> --numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
> - before patch : read: IOPS=372k, BW=1452MiB/s (1522MB/s)(4096MiB/2821msec)
> - applied patch: read: IOPS=369k, BW=1441MiB/s (1511MB/s)(4096MiB/2842msec)
> 
> 
> ## fio on two nodes
> 
> ### write in different folder
> 
> node1 /root/fio/diff/ocfs2-w.sh:
>> fio --direct=1 --iodepth=32 --rw=write --ioengine=libaio --bs=128k --size=2g \
>> --numjobs=2 --runtime=100 --group_reporting --filename=/mnt/ocfs2/node1/write.2g --name=tst
> 
> node2 /root/fio/diff/ocfs2-w.sh:
>> fio --direct=1 --iodepth=32 --rw=write --ioengine=libaio --bs=128k --size=2g \
>> --numjobs=2 --runtime=100 --group_reporting --filename=/mnt/ocfs2/node2/write.2g --name=tst
> 
> 
> node1 /root/fio/diff/ocfs2-randw.sh:
>> fio --direct=1 --iodepth=32 --rw=randwrite --ioengine=libaio --bs=4k --size=2g \
>> --numjobs=2 --runtime=100 --group_reporting --filename=/mnt/ocfs2/node1/write.2g --name=tst
> 
> node2 /root/fio/diff/ocfs2-randw.sh:
>> fio --direct=1 --iodepth=32 --rw=randwrite --ioengine=libaio --bs=4k --size=2g \
>> --numjobs=2 --runtime=100 --group_reporting --filename=/mnt/ocfs2/node2/write.2g --name=tst
> 
> run on both node,
> pdsh -w ssh:tw2510-[1-2] /root/fio/diff/ocfs2-w.sh
> - before patch : write: IOPS=19.3k, BW=2417MiB/s (2534MB/s)(4096MiB/1695msec)
> - applied patch: write: IOPS=20.8k, BW=2599MiB/s (2725MB/s)(4096MiB/1576msec)
> pdsh -w ssh:tw2510-[1-2] /root/fio/diff/ocfs2-randw.sh
> - before patch : write: IOPS=3742, BW=14.6MiB/s (15.3MB/s)(1462MiB/100007msec)
> - applied patch: write: IOPS=3765, BW=14.7MiB/s (15.4MB/s)(1471MiB/100010msec)
> 
> 
> ### write in same file
> 
> node1 & node2: (/root/fio/share/ocfs2-w.sh)
> fio --direct=1 --iodepth=32 --rw=write --ioengine=libaio --bs=128k --size=2g \
> --numjobs=2 --runtime=100 --group_reporting --filename=/mnt/ocfs2/share/write.2g --name=tst
> 
> node1 & node2: (/root/fio/share/ocfs2-randw.sh)
> fio --direct=1 --iodepth=32 --rw=randwrite --ioengine=libaio --bs=4k --size=2g \
> --numjobs=2 --runtime=100 --group_reporting --filename=/mnt/ocfs2/share/write.2g --name=tst
> 
> run on both node
> pdsh -w ssh:tw2510-[1-2] /root/fio/share/ocfs2-w.sh
> - before patch : write: IOPS=2052, BW=257MiB/s (269MB/s)(4096MiB/15967msec)
> - applied patch: write: IOPS=2558, BW=320MiB/s (335MB/s)(4096MiB/12808msec)
> pdsh -w ssh:tw2510-[1-2] /root/fio/share/ocfs2-randw.sh
> - before patch : write: IOPS=3588, BW=14.0MiB/s (14.7MB/s)(1402MiB/100001msec)
> - applied patch: write: IOPS=3590, BW=14.0MiB/s (14.7MB/s)(1403MiB/100001msec)
> 
> Heming Zhao (4):
>    ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
>    ocfs2: switch DIO read path from buffer_head to iomap
>    ocfs2: switch dio write path from buffer_head to iomap
>    ocfs2: remove legacy blockdev direct-IO path APIs
> 
>   fs/ocfs2/Kconfig          |   2 +-
>   fs/ocfs2/aops.c           | 689 ++++++++++++++++++++++++--------------
>   fs/ocfs2/aops.h           |  38 +--
>   fs/ocfs2/buffer_head_io.c |  19 +-
>   fs/ocfs2/file.c           | 168 ++++++++--
>   fs/ocfs2/ocfs2.h          |  45 ++-
>   fs/ocfs2/ocfs2_fs.h       |   3 +
>   7 files changed, 634 insertions(+), 330 deletions(-)
> 

