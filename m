Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA8F38F934
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266302; cv=none; b=Jxv3k4fNIuMgd4tPew91GAUjZUTFkS/W+NG31PyZV+4nItI+duuf53DLOnP5NIwSTh6wQY5uFVg+T37eR6xp7gfg2QCIAuxUga0iPezvJyDq62sWAyiMQ4X+ZDN1pTOuh5Gp/mvA+jO8ZifK4GAQrNpnopeXTRtCHUAAwNJOMcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266302; c=relaxed/simple;
	bh=qbVwHURkAKyFHHtbizAsYH9lY5Vz/aHvJjaVpPDGR0E=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sIetrdMfpE3ex6DZ3EFi7ibv7tR3WDaMA2anZbA4zW46zrPr4ln9Bx9HuA078vcmYZgJPK9joAHlxPxLgm/OGyEh9y4sGGmZ5p353lvbcbofWfxuz6G6icDsMwFxljRq3a4gm8ovD435i3A9nBqXA69l1ANjCBdIhV3nyAeGf1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfIF4r9u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfIF4r9u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58F91F000E9;
	Tue,  1 Sep 2026 12:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788266300;
	bh=pG6pq+g9QZo4FaYnQsrkXq9VfyWEAlzBgyFTRaAjOio=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=EfIF4r9u16TKu9LDPL9yKKNv6SUK5MCDqbQ8QbRzKxbc5DryPLkSVgcp/LWToT7HU
	 +UB6g2lmXDOhI9Fhh94jsXlASYIC6cBxoy2oJk774Y+EHEsGCi7E6sVspW/MDSNfHu
	 UZJ3ub+Q3JRr9/Rv385tvgC9K13ip17/gsHp/gAtHYSGfJhbzdZ9m75tjfrFCtyQY5
	 Uxc3VY3oOLb95S6Gsa3yJHrFKGbU88Vqv9R5JX38kPoVCr5ZTlCTrF8dHWaKq5tykD
	 6MHi1nBdNhoSLln7Bvx2WZyzFaO+DlOt1A/0YC9q0ePfCVIic2XoLEGL7l447dFqfs
	 VqIf3dHGYPPig==
Message-ID: <f633cdb1-f00c-46e9-b159-bcb51fdc49d3@kernel.org>
Date: Tue, 1 Sep 2026 20:38:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, qiwenjie@xiaomi.com
Subject: Re: [PATCH] f2fs: wait for inode record work before clearing ino
 bitmaps
To: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org
References: <20260831133916.2110470-1-qiwenjie@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260831133916.2110470-1-qiwenjie@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/31/26 21:39, Wenjie Qi wrote:
> APPEND/UPDATE inode state recording was moved to the inode eviction
> workqueue. These entries were later converted to bitmap values stored in
> XArrays, but the workqueue drain was left behind in the list cleanup loop
> where it is now a no-op.
> 
> During unmount, inode eviction work can therefore remain queued when
> f2fs_release_ino_entry() destroys the bitmap XArrays. A delayed worker can
> repopulate them before the workqueue is finally destroyed, leaking newly
> allocated XArray nodes when the F2FS superblock is freed.
> 
> Wait for APPEND/UPDATE inode record work before destroying each bitmap
> XArray, restoring the required ordering.
> 
> Fixes: 9a9ee7408a1f ("f2fs: reduce memory footprint of ino management")
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
> ---
>  fs/f2fs/checkpoint.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 4b59f30ef45d..400eab730c14 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -902,6 +902,8 @@ void f2fs_release_ino_entry(struct f2fs_sb_info *sbi, bool all)
>  	for (i = APPEND_INO; i < MAX_INO_ENTRY; i++) {
>  		struct inode_management *im = &sbi->im[i];
>  
> +		f2fs_wait_for_inode_record(sbi, i);

We need to remove f2fs_wait_for_inode_record(sbi, i) from above loop for cleanup?


Thanks,

> +
>  		spin_lock(&im->ino_lock);
>  		xa_destroy(&im->ino_root);
>  		spin_unlock(&im->ino_lock);

