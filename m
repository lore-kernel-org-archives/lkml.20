Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793735137;
	b=qy7DVTPyMtDIRlBZZxVWKJN+toT2Yp7AdKO8xq7e27uKjjaaxjIA5eh9rwAYUGbLZf43
	 vLsTWU5tfQGeFL8JbEkJ0hREiXBYWdK7ySop4/0UCbamRdYG7OiwORPfnaMFXOO+370DD
	 50cg+HgkMoA0udtTfUuEGf13AVoFWKa1o7hP5M8ynReKRy3qM9pTOvhbwa1IRMriYVXyX
	 qYAO1nF3gZVGUcB2xEwUdGRzJI3ar8W0gIvQo4FyNAU1wtBczr3QlPOLuqTrXz4KAepSn
	 W52W79H/vDJ/tLjmQ/Xu4QYKkxj0s70K4sB7jMizzNgKROHpHxCE3vmtx6zy1crP3ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Xrzu60BVjwa7oRsGi7Rx0IiJTLDYAKItXOr1GPbw5QU=;
	b=uO4k7fMoUHvdTbk8LKvxmyMDJrfExVbc5+PVJJXbxR+sS4iMdJS5gQ3OHuVU+HD2BE9x
	 W4kBvE5Rz8BdTw/cu268OnvdCcncuhHpXO21ZmsA3v/K4i14g6D8JDPuiETzRWRvja3zJ
	 8BHjUudeF47nmKPTXtIk8L5jCz8K35ksWZjEuNNEENs+/nOpFHHnLElKR6kh/lyGOcmjT
	 Eaq8fUpY6GX1EARm7Efjn5JjqwprcWX7uS6bY9y3dyyEvXrrzFP5+5cRz+QKiBictpLuW
	 4MxTCdD/uJZaNIx0uA8E45kJQz57MwXvgwpHEcFeQIvjr6xje2Tu44HiUrFYoxXXJqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B5De33se;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6205B606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6205B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B5De33se
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a208d93758so48770825e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:45:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793735136; cv=none;
        d=google.com; s=arc-20260327;
        b=Wg8MW5983DMkA2yMtQmdLbsnPNRfwjxOhn0tbFEfBTSHxpOYpU5wEspNkNP2ykHzJS
         /hiMMjNQsagnEJF2Kl/qT9Ij8U1hpa6fOhqJqEvdCSZc789K8y3e5oUzqPmjNTVY7B6v
         PSbojsLoIzO6CrB0rNTP4G2M34tcMebP4821d0l+Yjoy5teKpI+BKiVmztmPDw0HR+nB
         9IBDNF6KdnohHsLOb5itqajYpJQm2zkrQJZb2mbU0HbNZPAzEdTmSPiZVs4VR5UlRNXj
         BNSmlYozP9G5wLPZ1+QHouPA9LboEAnlbORx2dAPylZcf+HcDtNknjL9eOX1aNTjsWrm
         E3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xrzu60BVjwa7oRsGi7Rx0IiJTLDYAKItXOr1GPbw5QU=;
        fh=Xw32J/cxX7nHht2M/FJUkNY5eBM3RNvTuO3qe0lmErQ=;
        b=JK4IzaxaathrgvqFcpwCri0USo98luyz2qmO72dKBGWIdw+gEKI+XGIK15ADT18JK7
         gMCw4m0BAm6rtLNEefOpOnjKrXsZkTcYvRL5IJ5ZTtS3z4z+8nTsqCnBxQR3qYW4EhUG
         e55Oqsx9xvi2R2u+fg2afg2aY5x5rIt6u0i+a1DIxsZcDlZw/dbnCD0TXvitL1aS+1Fg
         gLVmERVAcaFe5iJOf35XeZETw3h/4ugIHlXHXnxCU0+M2Ut1wvimGQqIXsam/aT5dGho
         Pgp8uegrIvLmWMtEaDk/N61peNzWw6Q5JWhuTbVLK5PcVEVDBefJdapu9mQkYrl0vcHT
         nrdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793735136; x=1794339936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xrzu60BVjwa7oRsGi7Rx0IiJTLDYAKItXOr1GPbw5QU=;
        b=B5De33se9cB9w92ekpuOzMdJ+BGWGN55TA1HNt4ZhKViVOogqN3fUrgsqXkL+3Pv0+
         DISF6WH8CdWjmr/uZyO8yONrEa8kxC4IpcgymFralk0NlTxCufZVbiOWpZzr6StUni5S
         xgK7gqVFo163g01UB8FhADEo90y0vblqNevcAvcJw6ajGjU6msY4oqUtAVY1VCbzqoJP
         ixM9UG3grREIOd2qNVYfrA5klgB00os6VannnZ32JE4LIVnW+JXrI+bI0aEk32ZOSdhX
         pDmGoe2UPh6AAH/eWBDfN5jIIGxpolq3S62og6WM3DIQYQXOkk2n70UH4HQOZ+VT4KK2
         dOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735136; x=1794339936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xrzu60BVjwa7oRsGi7Rx0IiJTLDYAKItXOr1GPbw5QU=;
        b=gXgncJgHsSTQ6naAB1wghImPOY6Qa1GB1jZiy5c3UFn/NEFIW/NyPoh4RV/KXz58n6
         w1G1yjIazVvUu1WSqV1lru1dKIP51zCWyu9U3ln48Qp/xFuDTC/HvPtffnRnRvgLIquW
         n97I5PvnuVAxeD+/pR7wrt5wdTRlgN5qlFVUUzyDZn1xdiq+aTdI+sN8Z+bPSwRhn331
         TI6OmMGx9Jgy215ZGI3cGrhTsVcWf1QH61Qt3XqNLTsl/9PrVg+1wHxiz67g2Oucq0oq
         tblzLbTZGJZ/1ng+sW2KIbiCRhaldVTK7YX4lbM8evJi652MtI2iVpDSeYzRMSaMWm8j
         tlqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMkrOCoFPEKfT+/6Req4hEEL/1o7cT9/gdMsAxCGb0cBcqDE7iX6BkIw5Yt4jAI6yizzX2lq4EK23Z8Ak=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1qDMRsmZR9MxyRnHmHQDFaIbMzt/4WoZPUbiqX8G0VGOMaDvR
	Zq3DfknLep+oA80sZc5rSu/gDWTPPtdmx/nW1URedXx4nAppOC1kszYc43YesHz/CFY7ghqgn0m
	bsAxIKYXZye56GcpjPrH3Zp/mZZV0qV8=
X-Gm-Gg: AYBFou1edwG+WazekQw0DIqnncLVt3T1SP4Ux2U5pzru/hD678XbrFVWZja+gYJ9Uux
	mbeuxqh6NPxjy68/33wa57Qm79Ssm3BzHWN4KN9DwDLJS7zaP6lmeyoGWwNeVlMUI8f39pTq/Rp
	eqwo630aTzQZg+Y0WSw4kpD03F0YHgSfViFBRqpQMXvv2auVIPRdK2hAOwuoGsA+wutXZ7qMAj0
	TZ+2jigcGC/lOhIN8GB3fPjslP202lgOH9ghQIEPvIwsKN+SzaG1i7vx2SSCj3YwyKMeGAx7bNI
	sCbJ2FCbSzu7G4MxAjKrKO0resLyGrh9Vpz8sIEUB6VqgcrCDurNzi9qbXNdrl82KehtmeShJv3
	SoMM3oBHBE7veZZuB80bVPQVqOF/HTM4hvT0IiZiKhcATE5c6f5vtPhh+kBNhW3jVYfS0B4OJH/
	5T50g7J1c25imkU3kvL0qCmvIaGwZKizLybgd/ff1/N8UiSA4NScU4
X-Received: by 2002:a05:600c:a41:b0:4a1:ac66:6ac6 with SMTP id
 5b1f17b1804b1-4ac18c73d85mr309539565e9.26.1793735135531; Tue, 03 Nov 2026
 11:45:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-swap-fixes-v2-0-204be064be5b@tencent.com> <20261104-swap-fixes-v2-4-204be064be5b@tencent.com>
In-Reply-To: <20261104-swap-fixes-v2-4-204be064be5b@tencent.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 3 Nov 2026 12:45:23 -0700
X-Gm-Features: AclHuK-8sWcwe4Xln3PaMip3e8lQ125iTg227I53p4aJzPC4DtppR-OvwmegPAY
Message-ID: <CAKEwX=O3DfyPNpujz1Uwnkaqd1yPYyv-PbwR6SZF6ABXz1X5Og@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] mm/swap: keep the swap-in pressure window open
 across a batch
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Usama Arif <usamaarif642@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chuanhua Han <hanchuanhua@oppo.com>, 
	Mani Tofigh <mt4022@columbia.edu>, NeilBrown <neil@brown.name>, Christoph Hellwig <hch@lst.de>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 9:18=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Johannes Weiner <hannes@cmpxchg.org>
>
> For asynchronous block devices, swap reads are batched and submitted late=
r
> since commit dda8fb68b590 ("mm/swap: also use struct swap_iocb for block
> I/O"), but the caller submits the batch after the pressure window in
> swap_read_folio() has closed.  Batching is cheap, the submission is the
> part that can block, and that is no longer counted as pressure since then=
.
>
> Keep the pressure window open across the batch instead: swap_read_folio()
> opens it on the first folio, and swap_read_submit() closes it after the
> submission, also when the batch ends up with no folio queued.  Each batch
> is then billed for its own read.
>
> A single workingset refault marks its whole batch as stalled, which is
> fine here: the batch is submitted as a whole, so its submission holds
> up that refault too.  Before the batching, a blocking submission was bill=
ed
> only to the folio that issued it, even when it also delayed the refaults
> queued behind it in the same task, so this might be more accurate rather
> than less.  Synchronous reads are already one folio per batch after the
> previous patch, which keeps their attribution tight.
>
> The same hole has been there for a swap file on a file system that submit=
s
> through swap_fs_prepare_rw(), since commit 5169b844b7dd ("mm: submit
> multipage reads for SWP_FS_OPS swap-space"), which started batching its
> reads and deferring the submission to the caller, so this covers it there
> as well.
>
> Fixes: dda8fb68b590 ("mm/swap: also use struct swap_iocb for block I/O")
> Fixes: 5169b844b7dd ("mm: submit multipage reads for SWP_FS_OPS swap-spac=
e")
> Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
> Link: https://lore.kernel.org/linux-mm/auOz00OGB_8dgniC@cmpxchg.org/
> [kasong@tencent.com: added commit message and slight tweaks]
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  include/linux/swap_ops.h | 10 ++++++
>  mm/page_io.c             | 79 ++++++++++++++++++++++++++++++------------=
------
>  2 files changed, 60 insertions(+), 29 deletions(-)

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
