Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EF24457D5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146727; cv=none; b=aWe7ELdoKq16BQUE/avSFUM0Y8kiUKWx1P0XGnIlx5mJup4tJH5UmhlbfKQTf3kFcF1oB7otipDj1Uc11BiCZPz/CScSCkkNxEg03a8A1SWJmyKFMd8eBw9iyKnDa/s9K8Yeg2SZ0VDZ6zmT1yWef8m+aX3yLqPEuqMqifzSggs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146727; c=relaxed/simple;
	bh=z5Kj4jIi/pBtjqnz+GdQ5hZ3/qqGbM1EQ2LLsesAaSY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qfLxeQ1q832A+X1UMi1CN9lcMdcXUgmhb91qIOpwKB5rB9Aru0vTfRsunbGUTFDTiJ1w3dbJjwwpOhkqrGoBxXaSRSWB3a99Xh0FQzUzK35I6sQ2zHHHFTUuFngkZl0et4nnH82WmBu7qTUzNMO1IfbPCyY0uuJxPsK0E/ce6C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AL3uUtX4; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AL3uUtX4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso7276005e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790146718; x=1790751518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZrjQ33poEdSxILO2JDtHpIllTCJBtOtLGzw0UbF9Hs=;
        b=AL3uUtX4MK0ZNCXEupHV6+kAuOMQSHDZibywLJ6mFaMLw8livfxKtfRkp6yDSfhri6
         I4Q8j39DYaUcx7417kk54zcL5xtnXai9FPUys4hg5X5HBaJgqviTScGiu0eQnh/ykmHn
         b6bH4CogmdBVf7ilMcflbKPgpLf1jIcTixmONubPWro8eId2SvNPg2v2GeKHM+EMJbog
         7rl8OE5A4bQQ50eHlsNnGBVFEZNh+UeZcTSAImcm+OPndgW990Z9vY6cYieFPrWKQxKB
         Z4sa/wTVm4WFL0S0QgbGFxfwCviEqfGPK5keRwiXzTcQCXrJhyG+uqqQVXPg7g6ZNbNH
         SPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790146718; x=1790751518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iZrjQ33poEdSxILO2JDtHpIllTCJBtOtLGzw0UbF9Hs=;
        b=kD9nu+Rvh3+gTflT0D8TBJN3Q7qlKx9PMcotYuhtlc0J4V6nOtwSaqU/Oyelu6ux3R
         GXgkgkCxexdOWiv9gtfGTbQAvUSyuhIF5CTpd1mNUhGHqB+GgCp7BNbCcHOUTI+Eg9Ib
         onWGocP9WqhrMDQq/0ce7xc6NOHUCmcQNLD4NfgoXmPjQkzLs40Z1se3E3UDc/BefOel
         LTxF+NfBNoWNGjy7Nr7Os/NE9GifIwihsxji21cUeRAUHehyKCLJZTAjMZDtR6HyoR6a
         +bg+oMkuKmBk/mvAWBniYE1jAApeQ2Baut9wLJR1T3pTheoZgtqA+4Xe4ALKnJYFLyR8
         K7DQ==
X-Forwarded-Encrypted: i=1; AKwUvByowju0+20XEBJcky7hg3F71VKSgo0FFDKB5q2tNi4xo9zj7olM4dQ1I7b8OlijJiy9fYzvHMiyS1g5YoQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lfAr3ah+QZ6JLOnWv81M/YkCd2fNPckY7x3+GpUs0vhuDHYCwP
	N0evbcB3SbWuEXLxkOR+zi7eVArdKhOJQtZc99wUvmEcp/OcozX85hyF12QW45j9
X-Gm-Gg: AYBFou3TkofYhlF2MSymH5hkxORGespHPE2o0tKRiKJ5VJtjt9zYPOh89NoLtVvWM46
	Uo5OkyA7VY5rU3Ch3hJHFOgDxF6FAEjyelyKmGCSR67wI/Nj2MGnvVKV0i+sP3cuGhHHSlPYVSJ
	ChVamFP04p2vgEYWwo6/J+2GSUV/ah3RAnhAd7bkXCDlHdHUTVf7tS0/I0mkM6SekJHt3bdoojW
	hahVfxBvjH64kQXgE7PdNjRg4Ivgk1QvsElPM/8smEVvPaksEgD6Z0vLBbHOV+UNphzYtDMf1rp
	rGCEyjTd46FHQiPvc7fDysM5+5vhdpRYCBVIfAAAitOtGKoAwdWE2ETJ28OKvE5udU//4VyPCan
	HgQfetRQGY7h3y+8ALfXByn0yYgxXKzuIx2fmVIzrSX80cIgMdnXBWco/qHLan0KEux1H3fF1gs
	AKfIEdhK3b1UPvCyWwKX7yIg+s8N4QprU1TrQkZf+lKy+nG96ynTJ+Z0i7pEb2M955NRcF44KYf
	zgAzuO2zolh+hXCYkhLm12/TkpNjHePcCTM2Y08HtMrBz2sWQEY/JjY3lf0x5htU9Y0cQXqvePg
	GjLeHx7bMqyt3/zZ1yH1hI+KRvvKHo7hPNeabw==
X-Received: by 2002:a05:600c:c176:b0:49f:c451:b4ab with SMTP id 5b1f17b1804b1-49fdf152561mr17989925e9.29.1790146718132;
        Tue, 22 Sep 2026 23:58:38 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-182-160.95.114.pool.telefonica.de. [95.114.182.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe23d4288sm22524325e9.12.2026.09.22.23.58.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 23:58:37 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Zhao Li <enderaoelyther@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Ma Wupeng <mawupeng1@huawei.com>,
	Jinmeng Zhou <zhoujinmeng@bytedance.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm/hugetlb: fix max-only subpool accounting on alloc_hugetlb_folio failure
Date: Wed, 23 Sep 2026 08:57:14 +0200
Message-Id: <20260923065714.20781-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260428113037.88766-2-enderaoelyther@gmail.com>
References: <20260427145247.84157-2-enderaoelyther@gmail.com> <20260428030712.66256-2-enderaoelyther@gmail.com> <20260428113037.88766-2-enderaoelyther@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Apr 28, 2026, Zhao Li wrote:
> Mounts with min_hpages != -1 are left unchanged for now.

In case it helps with that follow-up, here is a small reproducer for the
min_size case. It needs no hugetlb cgroup.

The pool has two huge pages and no overcommit, and the mount is
size=8M,min_size=4M. A test maps a 4-page file MAP_SHARED | MAP_NORESERVE,
touches the first N pages, then unmaps and removes the file. Five rounds
on one mount:

  N   faults ok / SIGBUS   statfs free / blocks   HugePages_Rsvd
  -                                               2 (after mount)
  2   2 / 0                4 / 4                  2
  2   2 / 0                4 / 4                  2
  4   2 / 2                2 / 4                  0
  2   2 / 0                2 / 4                  0
  2   2 / 0                2 / 4                  0

The two SIGBUS faults keep their used_hpages charge. Half of the quota
stays gone with no file on the mount. used_hpages then no longer drops
below min_hpages, so hugepage_subpool_put_pages() never restores
rsv_hpages, and the mount has lost its minimum reservation for good.

The out_subpool_put: path skips this case on purpose, as the commit
message says.

Same result on v7.3-rc4 (f0100363d8c3), on v7.3-rc4 with this patch, and
on next-20260922. That tree also has 6f8b22e85eac ("mm/hugetlb: fix subpool
minimum reservation rollback"), which fixes the hugetlb_reserve_pages()
error path. This is the fault path. Tested under QEMU x86_64, one CPU.

Thanks,
Karl

#include <fcntl.h>
#include <setjmp.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/statfs.h>
#include <unistd.h>

#define HPAGE (2UL << 20)

static sigjmp_buf env;

static void on_sigbus(int sig)
{
	siglongjmp(env, 1);
}

/* usage: t <hugetlbfs dir> <pages to touch, at most 4> */
int main(int argc, char **argv)
{
	int n = atoi(argv[2]), fd, i;
	volatile int ok = 0, bus = 0;
	struct statfs st;
	char path[256];
	char *p;

	signal(SIGBUS, on_sigbus);
	snprintf(path, sizeof(path), "%s/f", argv[1]);
	fd = open(path, O_CREAT | O_RDWR, 0600);
	if (fd < 0 || ftruncate(fd, 4 * HPAGE))
		return 1;
	p = mmap(NULL, 4 * HPAGE, PROT_READ | PROT_WRITE,
		 MAP_SHARED | MAP_NORESERVE, fd, 0);
	if (p == MAP_FAILED)
		return 1;
	for (i = 0; i < n; i++) {
		if (!sigsetjmp(env, 1)) {
			p[i * HPAGE] = 1;
			ok++;
		} else {
			bus++;
		}
	}
	munmap(p, 4 * HPAGE);
	close(fd);
	unlink(path);
	statfs(argv[1], &st);
	printf("ok=%d sigbus=%d free=%ld/%ld\n", ok, bus,
	       (long)st.f_bfree, (long)st.f_blocks);
	return 0;
}

  echo 0 > /proc/sys/vm/nr_overcommit_hugepages
  echo 2 > /proc/sys/vm/nr_hugepages
  mount -t hugetlbfs -o size=8M,min_size=4M none /mnt/h
  for n in 2 2 4 2 2; do ./t /mnt/h $n; grep HugePages_Rsvd /proc/meminfo; done
