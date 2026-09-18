Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52344308F07
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719597; cv=none; b=ne6UIyoLTAnr3D9cAN6SVHwwmDcY9GbmIx/UJIWVihY68n2onl9z8jC1BaM9ZohgPZeB9XrDmRaNlq98yQOZa1v6Y0HjYRLO4spIUl4NEAmLY6ttrYZkFnGR0+cieVNR9Mg80rIRyDjNy5cF5+9aZX3f3zI0/LQFwFPkyvFFiyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719597; c=relaxed/simple;
	bh=rdD5DFf0CswBRPuluX8/U0n+XrJZbh8ApTW4obbySCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cTGCaExAZLv9a+8j9SwGS37kkXR4vnXJ00TNiZXMzuEgsKFqDSnZMHcDUbyVlgthe86bsbrRWDkSRftcZNz5oMbLUGdedZ/yRfFlljGX2VB0sdttmCfEqZoy1QBWJxUKm3+tLN8hlPDlkr80yOuwo2Bym4+EY7OxKamUmws4/8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pkQLqgMT; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkQLqgMT"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc50b9e8a45so223203a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789719595; x=1790324395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jVdvgZ3mBIXnAi5+B7rUQd/+WHdfPalGGkadsUCWlhs=;
        b=pkQLqgMTgtMMdaRM68lWFGcLo4fqAAmq/MNA2k8fcK12N3cPCZMN59/w/3hJWgptZr
         jP/gjh2iUou0RKJgGnoICEne4qcuKgI3cE7k/2L/hguT+5xsiJh3YR0Z5VSw2jfHRJni
         cfBJIbv4baTwrqYa1XxFV2nzwu8z42XOz2h68qXnlFcP5a+zs44xqEUfFiWqwUCOWemi
         WrFqk5Qg+3jgLgK3OPZKQQXGhfb0HnXuv5be0ufNBZg0sCcC1TV/sMZlgQJtL+te8k+O
         rIA1lcG2etjYCKAN+9brwdTh493ySUDAUP3dbhfSE3B2S2NXG8CnBfLkXyGJm+qPwBQW
         NCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719595; x=1790324395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jVdvgZ3mBIXnAi5+B7rUQd/+WHdfPalGGkadsUCWlhs=;
        b=c6sTplI3yROGjMYL3t4IDmTILoJv+76cZTiLlSke/ON8jGRumlmAcvlLxhUp63aaK0
         1xtvXo28OSdzeA7HXvlk9lVu597dslS1N+MXuWMh6o194MHT6wmScnjUTIDdjexIXLhn
         3OmxQVLUo3USbVo3p5j1O779MVvUOhHv7eWBzqb2RYMUFj9GkUFNVUOU7OAM7wKVvFSL
         6Xu9DogzdVj33Bn+beWtP/cBPgPPGMo/fFHLdXVB71m46MOrSL3T4yXPwTx5nizouo1x
         M4jJrmNSmVWF+/ofmD9sAvMJAgb89zgadeE4+X5XG5RTVZOMvh4IiURvsIBrZapuDsU1
         uWbw==
X-Forwarded-Encrypted: i=1; AKwUvByfAyi/ehfan83Ugmvx/cMddtU1+0fn2YrJ6JaJDnP5QdSTQMVTDL45w6SdmIpNKbgnJhm5QORt1USRPCc=@vger.kernel.org
X-Gm-Message-State: AFuF++lUFRQKXzEvjIfvJZV0ONc3qSW3YXFCCcf9sLduLYt1tcSlNWFT
	2nF3FEuQKJTJ+KSSXp1plSh164JRiKl5AxkOZ3SlOF4G2kbbUpU7veeG
X-Gm-Gg: AYBFou1qBuCiZ2wESzkDGnu6Ov07BAxPrfWMOlaQdcMNHJcm0XFU4bUbiFnnLGx+sE5
	qRE3k94WLtA34Q5hwJ91SWavJPrLnDHhU/BoBNAggvxUCaRHqcPea+xn6LhpRXvGb7rm887bZB1
	3XvJM7J1Q7d+QNSB6wE+9Qz5QUNstItIZ5AutgqpGybSjpkZI7G9TcgmGMlsXGU5n0tj5SNeUyY
	wojq+/IS8pppM2uL4AJ7Vbk+tapukrBipY9B+Sa57tx6/lBbq+S7ysDM6yT5DxJu3RAtp4r9/TI
	nXtlsyyryiykLQ/uHMAr2FTUdkNpWVh17nRl5gxny+PZcpJRf0X0fT0Qd8xCYTrt9WaS+TxBjT2
	ptzXuUGWZH4CjBUGzhi+1ZNqj1+i8+x84P+6X62+bLMD11LDslDlUFfhDXjHQfIJAbIFJ719eYV
	CtrfTdVTdJ/BoHf3HhPkTix3vKE+1XDDyZ8Mv4EVFWE7FAf7rtPiNiKQwnm7V50j8drT/p9/BYb
	Z2XTYOtnw==
X-Received: by 2002:a17:90b:2f50:b0:39d:f08e:e6e7 with SMTP id 98e67ed59e1d1-39e54e3c71emr7234090a91.9.1789719595407;
        Fri, 18 Sep 2026 01:19:55 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce065314sm2947550c88.14.2026.09.18.01.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:19:55 -0700 (PDT)
From: Priyanka Mani <priyankamani2100@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Robert Mader <robert.mader@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	syzbot+bfeed181d1ce9ec87a8f@syzkaller.appspotmail.com,
	Priyanka Mani <priyankamani2100@gmail.com>
Subject: [PATCH] dma-buf/udmabuf: don't warn on oversized allocation requests
Date: Fri, 18 Sep 2026 08:19:17 +0000
Message-ID: <0a3814afb3419bb1106cf0ff1734a6b7a85f9335.1789707887.git.priyankamani2100@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

udmabuf_create() derives the number of pages to allocate directly from
the size supplied by userspace, bounded only by the size_limit_mb module
parameter. Since commit 44e9eb5a7621 ("dma-buf/udmabuf: Disable the size
limit by default") that parameter defaults to INT_MAX, which puts the
page count limit at roughly 5.5e11 pages, i.e. no limit in practice.

init_udmabuf() then asks kvmalloc_objs() for pgcnt * sizeof(struct page *)
bytes. __kvmalloc_node_noprof() refuses any request larger than INT_MAX
and splats WARN_ON_ONCE(!(flags & __GFP_NOWARN)) on its way out, while
kvmalloc_objs() defaults to a plain GFP_KERNEL.

A single UDMABUF_CREATE against /dev/udmabuf with a sufficiently large
size is therefore all it takes to trigger:

  ------------[ cut here ]------------
  WARNING: mm/slub.c:7022 at __kvmalloc_node_noprof+0x412/0x5a0
  Call Trace:
   udmabuf_create+0x11f/0x540
   udmabuf_ioctl+0xf1/0x190
   __x64_sys_ioctl+0x91/0xe0
   do_syscall_64+0xdd/0x4a0

The size is entirely userspace-controlled and allocation failure is
already handled by returning -ENOMEM to the caller, so this is not a
condition the kernel needs to complain about. Pass __GFP_NOWARN and let
the existing error path do its job.

Note that capping the limit instead would change the error reported to
userspace from -ENOMEM to -EINVAL and would reintroduce a fixed ceiling
that the above commit deliberately removed, so __GFP_NOWARN seems the
more faithful fix.

Reported-by: syzbot+bfeed181d1ce9ec87a8f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=bfeed181d1ce9ec87a8f
Fixes: 44e9eb5a7621 ("dma-buf/udmabuf: Disable the size limit by default")
Signed-off-by: Priyanka Mani <priyankamani2100@gmail.com>
---
 drivers/dma-buf/udmabuf.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index df6dd0046242..127369e502a3 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -190,11 +190,13 @@ static void unpin_all_folios(struct udmabuf *ubuf)
 
 static __always_inline int init_udmabuf(struct udmabuf *ubuf, pgoff_t pgcnt)
 {
-	ubuf->pages = kvmalloc_objs(*ubuf->pages, pgcnt);
+	ubuf->pages = kvmalloc_objs(*ubuf->pages, pgcnt,
+				    GFP_KERNEL | __GFP_NOWARN);
 	if (!ubuf->pages)
 		return -ENOMEM;
 
-	ubuf->pinned_folios = kvmalloc_objs(*ubuf->pinned_folios, pgcnt);
+	ubuf->pinned_folios = kvmalloc_objs(*ubuf->pinned_folios, pgcnt,
+					    GFP_KERNEL | __GFP_NOWARN);
 	if (!ubuf->pinned_folios)
 		return -ENOMEM;
 
-- 
2.43.0

