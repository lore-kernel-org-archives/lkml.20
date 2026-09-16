Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0B749A3CA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789584450; cv=none; b=bfN6bbJ2dqKqBZyCpu8DmYj2oZe2e6d7JFQajtLPLcExZrYmFD/wtixtwJSCsTviLnIiLBe0JMpha/KRSal8QLOpLm3x4vj/FhdfEEsdTKNXhHwYt4exSFP8b828L5OcSao2hiBb3ReNB85q2rAqw2dtMLhbwbWXzWadw8Lf9b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789584450; c=relaxed/simple;
	bh=1jT0wxmlJgM7h/FwhWUm0yaXm9KSVxkqh7ltpP0Td0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ogrSatW186NAG7v7EV6H4KN7irJ5ylTe3gchbG3Yxale6inynfYHPo9qNp8dsBrOKPutEbs8ysUwBmw4Kd5jlnlID3+2KnWpPeBPLCdobTjKWHi7/bpUxV6q8gVFm/Fp+wee4sQHPFMF3AyM2r+Tr5mQRZTe+ZDFd7xGd31GAtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+y/9hXp; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+y/9hXp"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f05ffcso347015ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789584424; x=1790189224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=id2J5iDXrFVnIxVAGr7DM5v73OGdSGZqAF4hKdj2nAA=;
        b=X+y/9hXp5EiyecafDHX8xc2uRbn2IjfykvrnvDTFY01mh/bkMSrI4W8uQaqmV63dN/
         b1+BNCOXCFq4W18k+ddawcSJ8RVwlvpuAiE6qKFRI92BYVf4fJ7FiVVJlgIDOnWisjIn
         108IS4R+FFq2gY+75Tqi5PsHOXHcTa29anQdRp+7hmF+C197BMh7Y7GyVegvzATpEz9B
         zFpv3AzruhYKDt4uwGaZU8liI0V4N+dR0vIeDml9W5pAu3FqH285ovG4fKYdD7DL1sRX
         Fhyei9xWJbmIedyqcupn3KQ46aM9M5q/cOjhtuPv/ttF/9YcP5sUFfyCWy0x7JeKOUvV
         Ob9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789584424; x=1790189224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=id2J5iDXrFVnIxVAGr7DM5v73OGdSGZqAF4hKdj2nAA=;
        b=f1alQF4sWqt+QiHk0C0JnJ6LB407cah5zpgkHyDdin/9b9fHqDe1KutyLQVcYbaiIK
         8eIv1/2qyj8mXk55pNYF9ARmBtr3R4gW7x2nmKZt6bwWXeVmhZ0vdnHTaYQEjsco5hXP
         vEAHWbYwcJzykU3Fdykfvw74DOR29kKO4pj61zfrzai4P/PUh/4biTgQTMNtmABivIkS
         DFLktBfW/SgZUHYdw5/ByaylbW+7vbwmdYsdF+bKeWMVQ7FfuF2LTJOoET1Ubj6bSmon
         1ZXQvvCn4I1HPPh1PeUZUy0Nxl20LKMkl0N3oHYe0SuA/h/gn1uwa4t9kPEFEhblucBQ
         TtZA==
X-Forwarded-Encrypted: i=1; AKwUvBwp/baX6LotqxcTsqqBRJZI9K9V3L5saK4yKGnxNO7Nj+WWT1qErmevkxog32C8jEeY3n4c6a99ndWsMjc=@vger.kernel.org
X-Gm-Message-State: AFuF++lq+l7sNVT2XgMjs2RxBIPC/+ZVg22uztZvM2ED90oeJwpVqaSU
	i/zds+7uzmfK1DOv/BTM/xaxexHJgJ9hDLiVOSWeitw9KORJC7ss+W2n
X-Gm-Gg: AYBFou3vELssKHwjff0LhmgjmQeR1ZVN4nw2Cnqd7U6bYmNXJFgy0vtoBch/1Zi4ptb
	d0TTBzqaWUA962osLP18vxK6momRrZThJZ83Ktk/N2eXYzD2BgZ+WZMS5n7EZKDBH9NO5l9BErF
	gl8Ihindf6mP1oC6dgK9eU49E8aUSygbO59t2DiDApOC0tomKlt+k8hyP2HeDxIC3i8m3XKXxU0
	yS2EO2D8327xKXmF+VnrwjcD5rx7qZXF98Cf1axvUgT26waO3RUxY7qbqYacIsBEw2hIuFHQLWZ
	nyTW7uAu94r7F5WQc3bhHEjDIq3xhhVDsPTjWNs6xLQvKDP65FsUdRa4WgnTgUVVLgFHzklh8PE
	aY4mWkUXCsTvIdstDh8VntGRdVJixwEYoTlgXqeym7sOzDEjX1Tg7jARqEKeoOrUuSS9w/8qfJB
	/KAOezDqu62qzQaMlaFAEJZtcE46jB8VTsKCdfgsarUKF2sCN6Rxq/l0ctvt6bgd7ctP+gAapXj
	lL5J+OWSsjsxdhKDW6bM34y2RsOyN3jgl3+QHoIe0yE0KGwgRSml6DJdQ7gtVG6IMJAu4hnC+nv
	1EBtUnGvH8M70S+AqELJ37LLTQ==
X-Received: by 2002:a17:902:d4c2:b0:2d9:3be4:7e31 with SMTP id d9443c01a7336-2dd8dd0b188mr78874235ad.5.1789584423704;
        Wed, 16 Sep 2026 11:47:03 -0700 (PDT)
Received: from DESKTOP-TJS95SS.tail460ce2.ts.net (36-232-230-153.dynamic-ip.hinet.net. [36.232.230.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d9007csm16143405ad.5.2026.09.16.11.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:47:03 -0700 (PDT)
From: Yuan-Hao Hsu <aa9736195201@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Pankaj Raghav <p.raghav@samsung.com>,
	Chao Yu <chao@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/readahead: use large folios in page_cache_ra_unbounded()
Date: Thu, 17 Sep 2026 02:46:58 +0800
Message-ID: <20260916184658.647-1-aa9736195201@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915172615.c183c61c774f529ca57f1fb5@linux-foundation.org>
References: <20260915135909.1007-1-aa9736195201@gmail.com> <20260915172615.c183c61c774f529ca57f1fb5@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 15 Sep 2026 17:26:15 -0700, Andrew Morton wrote:
> Thanks, and welcome to Linux (I think?).

Thanks.  Yes, this is my first patch.

> Are any other filesystems affected by this change?

Every mapping with mapping_max_folio_order() above the minimum: ext4
(except the encrypt feature and data=journal), xfs, btrfs (except
HIGHMEM), erofs, nfs, afs, cifs, zonefs, f2fs immutable files, and the
block device page cache.  overlayfs follows the filesystem below it.

tmpfs sets the flag but cannot get here: force_page_cache_ra() returns
without read_folio/readahead a_ops, generic_fadvise() ignores hints on
a noop bdi, and madvise(MADV_WILLNEED) takes shmem_swapin_range().
fuse, gfs2, ubifs, ntfs3, ceph and 9p do not enable large folios.
Nothing changes with CONFIG_TRANSPARENT_HUGEPAGE=n.

v2 is tested on ext4, f2fs, xfs, btrfs, erofs, a block device, NFS and
cifs over loopback, and zonefs on a zoned null_blk; read() and mmap()
match the O_DIRECT sha256 of the file on each.  I could not set up
afs, but its ->readahead is netfs_readahead(), as used by cifs.

> This all sounds great, but I worry that the resulting increased
> consumption of larger-order pages will cause all sorts of unexpected
> mayhem to all sorts of unexpected things.

You are right, and v1 does exactly that.  __GFP_NORETRY on a costly
order still means an async compaction, a round of direct reclaim, a
second compaction and two kswapd wakeups before giving up, and v1
could pay that up to nine times per read().

Memory fragmented so that no block above order 3 remained, with the
remaining pages pinned so compaction could not help, 1024 x 1 MiB
pread() after POSIX_FADV_RANDOM from a RAM disk:

                              before       v1       v2
  sys ms                         219    1,462      239
  compact_stall                    0    2,437        0
  pgsteal_kswapd (pages)           0  234,494        0
  pswpout (pages)                  0   23,759        0
  folios left in the cache   262,144   36,508  260,869

v1 also made a plain sequential read() 3.6x slower there, through the
page_cache_ra_order() fallback into page_cache_ra_unbounded().

v2 allocates above the minimum order without __GFP_RECLAIM: it takes
a large folio when the free lists have one and never reclaims,
compacts or wakes kswapd to make one.  On the first failure the rest
of the request uses the minimum order, as page_cache_ra_order() does.
Keeping the reclaim flags but limiting it to one attempt per request
was not enough (543 ms, 67,183 pages reclaimed by kswapd): the gfp
mask is what matters, not the number of attempts.

> So for several reasons it's
>
> - allocate a large folio
> - check it
> - oops, can't use it, free it and retry with a smaller one

v2 scans the xarray first and sizes the folio to the absent run, so
filemap_add_folio() fails with -EEXIST only when another reader got
in between, and then the loop rescans instead of trying smaller
orders.  Four processes reading the same cold file after
POSIX_FADV_RANDOM, 64 KiB at a time, counted with a kretprobe:

  before  7,754 -EEXIST (one order-0 page each)
  v1     59,783
  v2     15,828

What is left is the race itself; the unpatched kernel sees the same
race at page granularity.  A memcg charge over the limit now fails
without reclaim and the request continues at the minimum order, the
path it takes today.

The setup and the numbers are in the v2 changelog.

Thanks,
Yuan-Hao Hsu
