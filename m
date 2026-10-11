Received: from mta0.migadu.com (out-123.mta0.migadu.com [91.218.175.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F230C4266AE
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791709297; cv=none; b=iKC3NCjrgkVF4C3ATW4zo7rdYSoetAK4IA+M2ZKCNKtm5uQ8rOuBKi2t/84kRrfhta04G69WmRXGleNsHy9PnfLJ8hQl0vcYQEyMNvZ+lOoX41u3hWuzdB4OHg5CwW/9YWbACSnEOJKVWsqDmIj+PGua1FSA00enxyFhcHLZXmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791709297; c=relaxed/simple;
	bh=goVloQSnv5+TqoFEiIJkREZivV2ZsUvx7oYy4h0c0os=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=k2EwDPV/remsY6/LoQTM4WfHc73DuqqbbaXZZkC0HopL89oPEu7dVEfWEITAUJIsCcLdCQplbMHmKloW/9uBjMt0aaqHOtlfymthFh5miLCIuyr6jMWIMVtJ0y6MX6hiyVfzYKvP+MhvUsWfhW88fZ7ssA2hXCAVrMUwfFDDHVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HSNv6hsM; arc=none smtp.client-ip=91.218.175.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HSNv6hsM"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=goVloQSnv5+TqoFEiIJkREZivV2ZsUvx7oYy4h0c0os=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791709293; v=1; x=1792314093;
 b=HSNv6hsMDM7UbC7Jha1QPXh3IR0KYpY44Xw4ryCnojGDbbSvCZltoekxQx5j0ubdsm5cthew
 s/86vI5F75B0yfAOhkjUpRN6W0GEmIO6xdA1LTu2QJZsvSqjLDS4xikD82M8pYwaLx673BLVsRu
 icCNrf3HGT6gEazYzmBySxT0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 07ca449ca67d000d;
	Sun, 11 Oct 2026 09:01:33 +0000
X-Mizu-Trace-ID: 07ca449ca67d000d
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 11 Oct 2026 09:01:33 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Zqiang" <qiang.zhang@linux.dev>
Message-ID: <92f5338ea2715d7a863002f1244151c6ff9efe5f@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] blk-mq: Fix missed srcu_barrier() calls before
 cleanup_srcu_struct()
To: axboe@kernel.dk, tom.leiming@gmail.com
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260820095716.21528-1-qiang.zhang@linux.dev>
References: <20260820095716.21528-1-qiang.zhang@linux.dev>

Friendly ping :)=20

Thanks
Zqiang


>=20
> In blk_mq_alloc_tag_set(), if blk_mq_alloc_set_map_and_rqs() fails
> after some hardware queues have already been allocated, its unwind
> path frees the partially allocated maps and tags through invoke the
> blk_mq_free_map_and_rqs()->blk_mq_free_tags(), which issues call_srcu()
> against set->tags_srcu. control then returns to blk_mq_alloc_tag_set()
> and falls through to the out_cleanup_tags_srcu label, which calls
> cleanup_srcu_struct() directly.
>=20
>=20Calling cleanup_srcu_struct() while call_srcu() callbacks are still
> outstanding is illegal, it triggers a WARN and tears down the
> srcu_struct while the pending blk_mq_free_tags_callback() still
> references it, leading to a use-after-free.
>=20
>=20The normal teardown path in blk_mq_free_tag_set() already guards
> against this by calling srcu_barrier() before cleanup_srcu_struct(),
> but the error path in blk_mq_alloc_tag_set() was missing the same
> barrier. this commit therefore also add srcu_barrier(&set->tags_srcu)
> call so that all outstanding SRCU callbacks complete before the
> srcu_struct is destroyed.
>=20
>=20Fixes: ad0d05dbddc1 ("blk-mq: Defer freeing of tags page_list to SRCU=
 callback")
> Signed-off-by: Zqiang <qiang.zhang@linux.dev>
> ---
>  block/blk-mq.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
>=20diff --git a/block/blk-mq.c b/block/blk-mq.c
> index 2c850330a32b..59cd629b37d5 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -4924,6 +4924,7 @@ int blk_mq_alloc_tag_set(struct blk_mq_tag_set *s=
et)
>  }
>  kfree(set->tags);
>  set->tags =3D NULL;
> + srcu_barrier(&set->tags_srcu);
>  out_cleanup_tags_srcu:
>  cleanup_srcu_struct(&set->tags_srcu);
>  out_cleanup_srcu:
> --=20
>=202.17.1
>
