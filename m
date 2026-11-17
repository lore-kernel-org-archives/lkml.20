Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927666;
	b=jwrzncqrMHCvfDDvQ48195j5gjaloVI9DYg22LO0xUchkW2b6Ap/LeyEm2Z8S4L2ZZUG
	 M6WE3tBtmgWUoXMGmlHCKVRG7eU4w2oM/WAxq4HhCKI6e8lY5I+r1WjbuT4LFdeiCgJVO
	 n2fs6oIgItIPUBZwH4fr5ybdQlQ57q/5zjSWqX6/Nw5Ji8DOoMp2/UM0GINAVO++/WTts
	 n7O3nAC4HQRmYuCd/w7C8fXtyzbSVpEk1j4ujOdahxeG2gZFKfSddlJ0H7gkoMcvWtowI
	 iu8KKS1YBjgGqyj+csdWajnnVSR0HnuyCluSrZbAxS21AmGOTZqgqrQZ0Sm2zA/UXGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xI3AfZOEgNPU8zapOEdxP2eG9d0gL1f+DDTmnD/NVrU=;
	b=g7KDTqWvL73Kz25EZKnMF9pMXgVGKFuKuMsdl/LpuulIaDGxHgDrYk09E+OYpe2lJGeu
	 nGp98gQL+Ums75oTRPR1gykq7I6IL2i1nqW1HiJsitWxKeh1QU1izH5TtjiF1JLBf+q2E
	 VDRSaXdhXu7H1o/pMnNZVNRX3wAT/uoS550m6KLefJc27t9zQc9pFFizJtlQBMLkfG4eI
	 FfJQQa+VzD59Kjef3QWgvphe08+m2+OAwGYa5vcuhFNLwYvnYk6AARNxgVDSGS/WzJUdB
	 syzkdA1UoyRDypNQW+gyXmO3sdmTQuhbGi04e7q2dz7eOJG0Zi5CSTQQkIABqEInt/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BlL9xGs5;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12727606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12727606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BlL9xGs5
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6aa77d4d968so714465a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794927663; x=1795532463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xI3AfZOEgNPU8zapOEdxP2eG9d0gL1f+DDTmnD/NVrU=;
        b=BlL9xGs5w9sMuaazlkzfQ+WrjDgLjOOIwpGFOVuTdUaYR93l/z8zOaTZ5gM9b2Lr/p
         KtH22SR6S8esC3Y5muW79jakdLTNXxD26tH8K3aRj24TSzO5UbBalBy4tDp6aGzWip1c
         +j3FL0+OXb2+mf4xNw5LiKZY1L+OF63nQHNzqazMOmq/pUUaxdyAVrPK5cs4x8SQ51uR
         4O4QChzej7uxnYxlJ23WUMBx/yfNcNj+R/M7YfTMuBQV+7kLgoyIUaI65WFq4xn3MAHB
         bBGlqO+0TqZcXxt5OpJnrnw7NDTC7qMXKY6OZdSAwHEX3VYm5Ha62qMYRd5Ky96tRJol
         C/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927663; x=1795532463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xI3AfZOEgNPU8zapOEdxP2eG9d0gL1f+DDTmnD/NVrU=;
        b=PDf+BGew6pzTnfQYLkPpw5WlWgtBz/Zx7r4ya31bRed846PidFRRlp3Yecirzu3Pp+
         jgOuKcesmhDjyxLycpLp4Jh3pGXbwdxhKs3/mL1pFEKxZla3z0LoGILIxs2bMUXtuWV1
         dDpRmSrRv2nFM7XxadBhqD5IEhi+A7U4TocjxnLbvcUFgM8ow0W53w2UFiGWdVkmHJeW
         VwgtdnKEfoDVfEpjqQF5NkYuovRVEz88brZJGScRY/9GUGfEXWORJPT0Druu0agAP5fx
         4NIevaof5iSzJtdBmCGLbtVdUi/o0/GSsRrCcJT0xLOwwH1MoTvDVV951wAgi6/dfeel
         JJPg==
X-Forwarded-Encrypted: i=1; AL+hErEhILXlFYAbQvaEqmzrUIMwrccDS6jGEDNfhq6m/C2Blfcx90GGvH751kOX6VD0xf+CS74U+XVteEQNF0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/r2AWBIqBYYiEvHfD1OAFmZHnK3ID+pVstGr929SXIHO0ySzsm
	m7bKchC9Y5USHcJ38x8r4Co0ARB60TmFMT9VTz5SjQ7ykRgbpnIKPtYt4yDU+wXC7gU=
X-Gm-Gg: AYBFou3YCegaxsa+BQzNBj/cj01M7G0H20KSj5qWMFHlYK3TAUDF7ZqXjTsppi+tAQ+
	eMKwphvMUamMAopgiinB4zoegPTEn5Hv6Db67K5wZ88xMwb9M94zUUUwgpMPFFmcPQjEVyUyTrb
	jQXNR98p5+DaVUvlA5CelsX48I0mD5VnOLDvBo97BdyPjOjhcSvfRFV+MP53aHKfrQIE/GmZYaq
	h3cl683TMO0eesi6wvYKhk/FTOMD6a8pGsWbz8dqKP3+8SNNMMc2UwKY4N5BeVdBSNiLbgDBLVh
	WuRoaBvfyq7kVIqVcBBpSyqty4L3wvVlwZy2zOLcAh2Jy4GlA0rlledur8sOZ2Vo1bAUthw/x5a
	Vu3p/t0dDBM72+OC2Jmqf7Hd9gpoyse6DoWnCe+i9+65sOyuqaUHSyp7eHb8u23Giiv41SOZDKS
	6yjfJJN8+UTMB+46qwQXZLjuQPiNbEgTfLRZggv/2y8PZoiu+vk3VSRjs4Cqi6+NbFfdrNFM1uu
	9PXNohjWfKNjsggzhLbLzuavmEX4wUoU9Np/rghhz3cFL/GlHBc1PXpv7/BaMYmDvmG86MYsToI
	Ts0PZKxKz00VcwAZ56CdQKIwfibAxnKXQFlEegXbxgs=
X-Received: by 2002:a17:906:130b:b0:c32:8cbb:fac with SMTP id a640c23a62f3a-c509630ec16mr1209113366b.3.1794927663112;
        Tue, 17 Nov 2026 07:01:03 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b2b5sm35904028c88.1.2026.11.17.07.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:01:01 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v7 0/3] migrate ocfs2 DIO from buffer_head to iomap
Date: Tue, 17 Nov 2026 23:00:49 +0800
Message-ID: <20261117150053.18417-1-heming.zhao@suse.com>
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
to iomap mode. And the code base is commit aebb72744764 (v7.4-rc3),
and also merge Joseph's code and ideas from [1]:

V7 changelog:

Address sashiko's review comments. Main changes:

1. Adopt the latest iomap API and remove the iomap_ops structure.
2. Add a retry mechanism in ocfs2_dio_wr_map_blocks() to fix a data loss
   bug. Multiple concurrent writes are serialized by i_rwsem at submission
   time but completed asynchronously by ocfs2_dio_end_io(). When the
   unwritten extent conversion fails and finishes first, other threads'
   submissions would lose data but still return success.
3. Fix DIO alignment issues.
4. Fix several edge-case handling problems in the DIO write path.

[1]:
https://gitee.com/anolis/storage-cloud-kernel/commit/ea3fe75e2060118ba093e90b1cd34fa382914b29

[2]:
https://sashiko.dev/#/patchset/20261103135605.22943-1-heming.zhao%40suse.com

v1 patch set:
https://lore.kernel.org/ocfs2-devel/20260724052559.15409-1-heming.zhao@suse.com/
v2 patch set:
https://lore.kernel.org/ocfs2-devel/20260727061802.18485-1-heming.zhao@suse.com/
v3 patch set:
https://lore.kernel.org/ocfs2-devel/20261018143319.22329-1-heming.zhao@suse.com/
v3 sashiko review:
https://sashiko.dev/#/patchset/20261018143319.22329-1-heming.zhao%40suse.com
v4 patch set:
https://lore.kernel.org/ocfs2-devel/20261103135605.22943-1-heming.zhao@suse.com/
v4 sashiko review:
https://sashiko.dev/#/patchset/20261103135605.22943-1-heming.zhao%40suse.com
v5 patch set:
https://lore.kernel.org/ocfs2-devel/20261105071930.16399-1-heming.zhao@suse.com/
v5 sashiko review:
https://sashiko.dev/#/patchset/20261105071930.16399-1-heming.zhao%40suse.com
v6 patch set:
https://lore.kernel.org/ocfs2-devel/20261115154013.9379-1-heming.zhao@suse.com/
v6 sashiko review:
https://sashiko.dev/#/patchset/20261115154013.9379-1-heming.zhao%40suse.com

--------------
# test report

This patch set has been tested on 7.4-rc3 kernel with the following test cases.

The current code still needs some polishing. I hope sashiko can continue to
find issues in v7, so I've only done a few basic tests so far.


## ltp

runltp -f dio -d /mnt/ocfs2/

results: passed

## xfstests

./check -g quick -T -b -s ocfs2 -e generic/081 \
-e generic/266 -e generic/272 -e generic/281 \
-e generic/338 -e generic/347 -e generic/361 \
-e generic/628 -e generic/629 -e generic/648 -e generic/650 

OCFS2_MKFS_LOCAL_OPT="-b 2K -C 8K --fs-features=local --fs-feature-level=max-features"
Failures: generic/003 generic/056 generic/075 generic/091 generic/094 generic/112
generic/177 generic/211 generic/225 generic/263 generic/319 generic/321 generic/322
generic/329 generic/331 generic/370 generic/376 generic/424 generic/448 generic/467
generic/477 generic/481 generic/498 generic/510 generic/512 generic/513 generic/534
generic/537 generic/552 generic/557 generic/563 generic/564 generic/578 generic/588
generic/607 generic/620 generic/630 generic/755 generic/759 generic/760 generic/771
generic/777 generic/779 generic/784 ocfs2/001
Failed 45 of 632 tests


-----------------------
Heming Zhao (3):
  ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
  ocfs2: switch DIO read path from buffer_head to iomap
  ocfs2: switch dio write path from buffer_head to iomap

 fs/ocfs2/Kconfig |    2 +-
 fs/ocfs2/aops.c  | 1628 ++++++++++++++++++++++++++++++++++++----------
 fs/ocfs2/aops.h  |   42 +-
 fs/ocfs2/file.c  |  243 ++++++-
 fs/ocfs2/inode.h |    6 +
 fs/ocfs2/mmap.c  |    2 +-
 fs/ocfs2/ocfs2.h |   25 +-
 fs/ocfs2/super.c |    1 +
 8 files changed, 1532 insertions(+), 417 deletions(-)

-- 
2.55.0

