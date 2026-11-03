Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714371;
	b=WErNoTmjPvN6rSLPeuSm0elZEGdZ8xdVVti+uSeetwoHgi6/ZwpP9nPlt0+5kG4W707x
	 QVG5ECbYwJObl7Fh7xO/KgjEWUYZa0ZYhEWMRf13mYCxpBlUwspkbtSig7vLRNcYp7mQq
	 bx9DNGDUwjtZfaE/zP7+RmBk5h9b6q9oLaaJhVf/TddHWcXuym/Hynw/68h9YOlEXFqJK
	 hVEx7Y3DGEZ/+ZSdGjoEdTM0tD5z4Gv2Y5gAMLFzKaduteSrrrC3HPvSk7SplApOP+C59
	 5gG3Ar+kFqpf9i2stYFfDMU3THmamsWx7vfeCvFj23mm6rQ4Q7B6rC2FowU+Gq2sg/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=74I3nnSN0fQYCG/L/O68krWPpqCBywczA6Ty/j7yNc4=;
	b=5EoK94IIzmsweO1TwmjAlQKeDBinyRWMQGhnI+u4UM6g3qYbaa9Xr9sTKMT/COS44Y7Z
	 nLHTVkmCYosnAA0r8yBwvcsk5QsFF0rGMJ6G2KHbj/NlSxlg8MAVKvoOYxlSpAIBdYM+9
	 bijztYU4tGo8v0u2dqEttz1kXvoZGtTujnSSbWHKELA0LPwUJom20PjvV14pFXkR9QgVg
	 aTvOh69TM/VOkXDty7hUag2ikPVztt6TPpnU2TPC91L1HOdTlKG6DTKOwR/1Su0xdx9EQ
	 pqynLq1Ywlo7BKVWKYQoEjzc5mm2qaLIrOt9RcjF+DVgAI97WAGVUT8EgT5AfghUSxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EdPDISy+;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD668606D808
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD668606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EdPDISy+
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a59ffacb51so6220495e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793714369; x=1794319169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=74I3nnSN0fQYCG/L/O68krWPpqCBywczA6Ty/j7yNc4=;
        b=EdPDISy+MWl+Ucl0jvfBFY82lEhRx+VWiK5v854cqJ+4p8kABQSpLHJJZDUm8vFcTo
         9zv83la3L5HziwETBGrjF4ocyi7HkjA/STGJZvnSQ659HbwbrgwdFS3Xci3IdOqgFaiL
         lU/5A9MrZkRC+8567ZqbBj2CaSVFZqLcXZnL7pQzenqPhrYfEHvxqI2aqtU46F2uiupr
         8IG7+et/TFCMaD6XHc9L+2z+2xkwYGPG5hR64IBs3SMPT70FKfjCccptPxjUnmm/MA6n
         MwsfbenyPQNG2p4EFeqjunxiTzaflCP4fgplpfZ6ti4BP7C3I1YOvNuUCMcNq7w3obSr
         Vj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714369; x=1794319169;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74I3nnSN0fQYCG/L/O68krWPpqCBywczA6Ty/j7yNc4=;
        b=U9fs6SPEj4giOzeaTolKUEnmriuw1VT6sXXHKXqVKYQRxYRAXyFOlafPvx4HpNOPb2
         ZRHW49DHLouFGno04ffLowslQgDwFX6yc0QZQACbqB4aI0Mn6k3mEm5zAgP5MRHatrom
         kR6bjv6UCXlIBHeQUqUIgbXaMl9TytvextJzC2vbW8kNQwdGgTygW4QILJu36PSG857i
         cLRempnKcUu4j8zomg0u5fkHl9UvwYCQrlfXxK7ZtcB8XgsKycHcxXJLjuLYppvV9TkC
         Yt2U5eiGXZsXEHcPvCy7XUzFDzEQfGQNf51c6ox5re/lIsmAHTfR0LxBZG/3Uh3Tn8/d
         MhWw==
X-Forwarded-Encrypted: i=1; AKwUvBywPo/iFdy45KzSUTvhMYMHgbVNJllNL0A+crFVZmxIygy8TQHA+PlM0Fy7qDBNBnm4W4fBDE5rn2pTPiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kVhLnzTWzTmHOazYaRiPA65infhhAShM8KquPF5Am0JO+OfE6
	+s7SREX3/cP3xLlFc8f0wXuQrAnZdyRJEkcRhFyW4JEe+r4Mw0b4YpH1qPnwlsWcyBs=
X-Gm-Gg: AYBFou3E09aDgxh5eryMacQxFWqbKd+A8yCMV5dzKDHpjdfoqyi0WrEuZs2sPEklOdy
	S3ogw7/UDtD5xtJCx4/MxyakOHoIgdE75osrfrFdhdLyDxL/BsRfyAsWBJZAwwx5BqlMqaVFhxF
	3eWaDFAhn5a0KDc3PJbwRPWoxUtqWn4uDImjVvcKrbYOk6iALFh1qJMH5T3eqarev3VrytO3CIO
	4oh+vrbJpYpDqat/ytGcskgOFXc143Cv4F6eMSIANu4tXo8Qv6brYc7hPYImvHff/vpE4QRsdfM
	zauhx9356lkl2Z8RADUiWRvjkAWmmogX2qcEWHVsF+dC9hsuLiV2BoPQHNz1MFFlcDWgJK9XRRI
	UGWPRG/hIFKVPBvP/CyCoT5MuLSQ3KlCh0KVJwFcjtPW/88oMgVjhnYZ1iObXHwMDXsJJukjJuf
	vxKTYv8xexCVdlNMb7qR4Z3Lnd/K7Y1qPWNM5dcfrAdH4PlGDldBY8r+69ar3LlXkSjD6+JMTov
	8+9vntxcmDYNNf9tWa4pUZeQxru1ETfg+oO+4KLKaEp4UndWVcXfA/w+Tl2P0iZZafrvq8lgC7a
	FCWOul2GB+lUFGZeNXHXm8doHWa9bVrVBA==
X-Received: by 2002:a7b:ce0d:0:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4ac177538c5mr231277385e9.1.1793714368907;
        Tue, 03 Nov 2026 05:59:28 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9348208c88.4.2026.11.03.05.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:27 -0800 (PST)
Message-ID: <2702c09a-3679-4d69-8072-e678f3764945@suse.com>
Date: Tue, 3 Nov 2026 21:59:21 +0800
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
Subject: Re: [RFC PATCH v4 0/4] migrates ocfs2 DIO from buffer_head to iomap
To: joseph.qi@linux.alibaba.com, mark@fasheh.com, jlbec@evilplan.org,
 hch@lst.de
Cc: ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261103124310.21143-1-heming.zhao@suse.com>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <20261103124310.21143-1-heming.zhao@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi List,

Please ignore this patch set, as it failed to apply on sashiko.

Thanks,
- Heming
On 11/3/26 20:43, Heming Zhao wrote:
> This patch set migrates ocfs2 Direct I/O (DIO) from buffer_head mode
> to iomap mode. And the code base is commit 4056b3c9d3c92ea, and also
> merge Joseph's code and ideas from [1]:
> 
> v4 changelog:
> 
> Fix several issues found during a sashiko review[2].
> 
> To simplify iomap development, we currently adopt the simplest approach:
> retaining the buffer_head style, where only one cluster is allocated
> per iomap_begin() call.
> 
> When creating a filesystem using "mkfs -b 2K -C 8K" (where the cluster
> size is greater than the page size), several xfstests cases crashed.
> The root cause was an incorrect return value from iomap end_io.
> 
> Both the add and del of the orphan inode during write I/O are now placed
> in ocfs2_file_write_iter().
> 
> Additionally, I attempted to implement .submit_io/.end_io in "struct
> iomap_dio_ops" to free dwc inside end_io. However, because ->bi_end_io
> runs in an interrupt context and ocfs2_iomap_dio_end_io_write() contains
> sleepable functions, this approach required scheduling a workqueue directly
> from the ->bi_end_io callback and calling ocfs2_iomap_dio_end_io_write()
> within the workqueue thread context. Furthermore, since iomap_dio_ops.end_io
> still cannot access any private data, it cannot accurately wait for the
> work to finish. Testing with xfstests triggered hangs and crashes.
> 
> 
> [1]:
> https://gitee.com/anolis/storage-cloud-kernel/commit/ea3fe75e2060118ba093e90b1cd34fa382914b29
> 
> [2]:
> https://sashiko.dev/#/patchset/20261018143319.22329-1-heming.zhao%40suse.com
> 
> v1 patch set:
> https://lore.kernel.org/ocfs2-devel/20260724052559.15409-1-heming.zhao@suse.com/
> v2 patch set:
> https://lore.kernel.org/ocfs2-devel/20260727061802.18485-1-heming.zhao@suse.com/
> v3 patch set:
> https://lore.kernel.org/ocfs2-devel/20261018143319.22329-1-heming.zhao@suse.com/
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
> 1 fail: diotest4    9  TCONF  :  diotest4.c:346: Direct I/O on /dev/null is not supported
> 
> This fail can be ignored.
> 
> The test results: passed
> 
> ## xfstests
> 
> ./check -g quick -T -b -s ocfs2 -e generic/081 \
> -e generic/266 -e generic/272 -e generic/281 \
> -e generic/338 -e generic/347 -e generic/361 \
> -e generic/628 -e generic/629 -e generic/648 -e generic/650
> 
> The test results are the same before and after the patch set.
> 
> ```
> OCFS2_MKFS_LOCAL_OPT="-b 2K -C 4K --fs-features=local --fs-feature-level=max-features"
> Failures: generic/003 generic/091 generic/094 generic/177 generic/211
> generic/225 generic/263 generic/322 generic/329 generic/331 generic/370
> generic/376 generic/424 generic/448 generic/467 generic/477 generic/481
> generic/510 generic/513 generic/537 generic/552 generic/563 generic/578
> generic/607 generic/620 generic/630 generic/755 generic/760 generic/777
> generic/784
> Failed 30 of 632 tests
> 
> OCFS2_MKFS_LOCAL_OPT="-b 4K -C 4K --fs-features=local --fs-feature-level=max-features"
> Failures: generic/003 generic/177 generic/211 generic/322 generic/329 generic/331 generic/370 generic/376 generic/420 generic/424 generic/448 generic/467 generic/477 generic/481 generic/510 generic/513 generic/537 generic/552 generic/563 generic/578 generic/607 generic/620 generic/630 generic/755 generic/777 generic/784
> Failed 26 of 632 tests
> 
> OCFS2_MKFS_LOCAL_OPT="-b 2K -C 8K --fs-features=local --fs-feature-level=max-features"
> Failures: generic/003 generic/075 generic/091 generic/094 generic/112 generic/177 generic/211 generic/225 generic/263 generic/322 generic/329 generic/331 generic/370 generic/376 generic/424 generic/448 generic/467 generic/477 generic/481 generic/510 generic/513 generic/537 generic/552 generic/563 generic/564 generic/578 generic/607 generic/620 generic/630 generic/755 generic/759 generic/760 generic/777 generic/784 ocfs2/001
> Failed 35 of 632 tests
> 
> OCFS2_MKFS_CLUSTER_OPT="-b 2K -C 4K -N 2 --fs-feature-level=max-features --cluster-stack pcmk --cluster-name hacluster"
> Failures: generic/001 generic/003 generic/091 generic/094 generic/211 generic/225 generic/263 generic/322 generic/329 generic/331 generic/370 generic/376 generic/424 generic/448 generic/467 generic/477 generic/510 generic/513 generic/537 generic/552 generic/563 generic/578 generic/607 generic/620 generic/630 generic/755 generic/760 generic/777 generic/784
> Failed 29 of 632 tests
> 
> OCFS2_MKFS_CLUSTER_OPT="-b 4K -C 4K -N 2 --fs-feature-level=max-features --cluster-stack pcmk --cluster-name hacluster"
> Failures: generic/003 generic/211 generic/322 generic/329 generic/331 generic/370 generic/376 generic/420 generic/424 generic/448 generic/467 generic/477 generic/510 generic/513 generic/537 generic/552 generic/563 generic/578 generic/607 generic/620 generic/630 generic/755 generic/777 generic/784
> Failed 24 of 632 tests
> 
> OCFS2_MKFS_CLUSTER_OPT="-b 2K -C 8K -N 2 --fs-feature-level=max-features --cluster-stack pcmk --cluster-name hacluster"
> Failures: generic/003 generic/075 generic/091 generic/094 generic/112 generic/211 generic/225 generic/263 generic/322 generic/329 generic/331 generic/370 generic/376 generic/424 generic/448 generic/467 generic/477 generic/510 generic/513 generic/537 generic/547 generic/552 generic/563 generic/564 generic/578 generic/607 generic/620 generic/630 generic/755 generic/759 generic/760 generic/777 generic/784
> Failed 33 of 632 tests
> ```
> 
> ## fio on single node
> 
> fio --direct=1 --iodepth=32 --rw=write --ioengine=libaio --bs=128k --size=1g \
> --numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
> - before patch write: IOPS=31.5k, BW=3935MiB/s (4126MB/s)(4096MiB/1041msec)
> - before path overwrite (don't remove write.1g, run above fio command):
>        write: IOPS=39.5k, BW=4935MiB/s (5175MB/s)(4096MiB/830msec)
> - applied patch write: IOPS=37.4k, BW=4676MiB/s (4903MB/s)(4096MiB/876msec)
> - applied patch overwrite (don't remove write.1g, run above fio command):
>        write: IOPS=39.4k, BW=4929MiB/s (5168MB/s)(4096MiB/831msec)
> 
> fio --direct=1 --iodepth=32 --rw=read --ioengine=libaio --bs=128k --size=1g \
> --numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
> - before patch : IOPS=47.7k, BW=5962MiB/s (6252MB/s)(4096MiB/687msec)
> - applied patch: IOPS=48.2k, BW=6024MiB/s (6316MB/s)(4096MiB/680msec)
> 
> fio --direct=1 --iodepth=32 --rw=randwrite --ioengine=libaio --bs=4k --size=1g \
> --numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
> - before patch
>    - creating write      : IOPS=3282, BW=12.8MiB/s (13.4MB/s)(1283MiB/100026msec)
>    - overwriting write.1g: IOPS=41.8k, BW=163MiB/s (171MB/s)(4096MiB/25115msec)
> - applied patch
>    - creating write      : IOPS=3230, BW=12.6MiB/s (13.2MB/s)(1262MiB/100031msec)
>    - overwriting write.1g: IOPS=40.5k, BW=158MiB/s (166MB/s)(4096MiB/25908msec)
> 
> fio --direct=1 --iodepth=32 --rw=randread --ioengine=libaio --bs=4k --size=1g \
> --numjobs=4 --runtime=100 --group_reporting --filename=/mnt/ocfs2/write.1g --name=tst
> - before patch  read: IOPS=361k, BW=1409MiB/s (1477MB/s)(4096MiB/2907msec)
> - applied patch read: IOPS=362k, BW=1416MiB/s (1485MB/s)(4096MiB/2893msec)
> 
> ---------------------
> 
> Heming Zhao (4):
>    ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
>    ocfs2: switch DIO read path from buffer_head to iomap
>    ocfs2: switch dio write path from buffer_head to iomap
>    ocfs2: remove legacy blockdev direct-IO path APIs
> 
>   fs/ocfs2/Kconfig          |   2 +-
>   fs/ocfs2/aops.c           | 568 +++++++++++++++++++++++++-------------
>   fs/ocfs2/aops.h           |  38 +--
>   fs/ocfs2/buffer_head_io.c |  12 -
>   fs/ocfs2/file.c           | 214 +++++++++++---
>   fs/ocfs2/ocfs2.h          |  46 ++-
>   fs/ocfs2/ocfs2_fs.h       |   3 +
>   7 files changed, 616 insertions(+), 267 deletions(-)
> 

