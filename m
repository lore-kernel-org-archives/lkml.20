Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34E236998A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970606; cv=none; b=N8kVGhe1boyX5fHVlOmlpWEZSb3S0Rk7D2Pt+W/oqE+lliYR764GCRLkyQH4/jCYGt55gW52U2npr8ZedydwNrvoFcKOqVWhJ02gqgAtY1fX5F1HmUNoP1ytIyPfIhCPOvWuA0DQ6r9vH5oCU4RHAtrtLQx2DFXarzsWLP87Hzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970606; c=relaxed/simple;
	bh=sYVV2RIVok6q2OTIAPPvve5voNT8NYsEhk+5bFbQIAw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=k2hMSbYlix3+RoxhhCwfAdCu1C0VHc4s7mkebiV+6NxjjyImlICQk9uFrXdIBBsywwBi12WLKvOh4u/essg4bloVa5KptuwJiJsHErH95hcoQlCkynYp4mzcR5LZGGCyrRUgnrT1opuH8Ybh5VgtL1EYBzdNB0rv47w9AuvHMxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c734afb8deso12705341b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970603; x=1791575403;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VssoRLpYmZyHhaoCYbz3+JTPlPe4pJ6k7QrheMZgnf0=;
        b=q89uzBqkiNvLdRaeAEZVUBPS40HAnuJ3/94fpZWMHxjB4MdeG/mN1tB0CA40dfIky0
         fnd3mEh82VgPMdq+8vYVQNiEYhifX7uMiS9gs3H3ALa0NcwB1JVX9E1x8qRFqAjvC6q0
         fzaQymjLAaBuoNsH5lWwczoOX0jC/cgeA3K9UoI+SgZqCVKdmBOd0xzz9jf7GzG5bITo
         OaD0Qo3FuuZZ28Yq9mAi/kbTjqis3r1zsdj/SzL5+Ox/mWwUp0u9lPsoN6mpbGqoiGDb
         T9MdhbdhVJnhSjer/YVYSoWaRm5hRfp5bWI4n8djeLiPgIoTtMtsiqDIuBZaxk/+AYCg
         G9kQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJBPBqdqF8RR9unogufafl7fjw/cx5WKXGDe5sfp2Pu4SySWSz5RJ7A1dZibIyk2nss64mDHjywneFFaY=@vger.kernel.org
X-Gm-Message-State: AFuF++laI3HQCCgCZd4zDo/Krh9wdmCJ/nsdqECUrNAj7rGD5Q4zein/
	lJgoBHzvwuG1/g/6RUx9UpbKfDjtgSjMzTBJgztrjRp/IW/8KoMf98j4HJsjuX5yVRudm01rJFB
	ctKxuyle3hVEzz8FL8gdRwe0nyhu69Ux7UL0o+K/JBM8xu1cwE9YWwVY8q8U=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:178c:b0:4c3:7695:1177 with SMTP id
 5614622812f47-4f677447238mr504421b6e.6.1790970603737; Fri, 02 Oct 2026
 12:50:03 -0700 (PDT)
Date: Fri, 02 Oct 2026 12:50:03 -0700
In-Reply-To: <20261002194955.10010-1-adarshdas950@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac00aeb.34119e79.2f92f3.0001.GAE@google.com>
Subject: Re: [syzbot] kernel BUG in btrfs_subpage_assert
From: syzbot <syzbot+d490d04560554e6259b9@syzkaller.appspotmail.com>
To: adarshdas950@gmail.com
Cc: adarshdas950@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

This crash does not have a reproducer. I cannot test it.

>
> diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
> index 558b4a3f9633..98ea6a9a67f3 100644
> --- a/fs/btrfs/inode.c
> +++ b/fs/btrfs/inode.c
> @@ -10813,10 +10813,17 @@ static bool btrfs_data_dirty_folio(struct address_space *mapping,
>  	const u64 range_end = min_t(u64, folio_next_pos(folio),
>  				    round_up(i_size_read(&inode->vfs_inode),
>  					     fs_info->sectorsize));
> +	int ret;
>  
> -	if (range_end > page_start)
> +	if (range_end > page_start) {
> +		if (btrfs_is_subpage(fs_info, folio)) {
> +			ret = set_folio_extent_mapped(folio);
> +			if (ret < 0)
> +				return false;
> +		}
>  		btrfs_folio_set_fixup_dirty(fs_info, folio, page_start,
>  					    range_end - page_start);
> +	}
>  	return filemap_dirty_folio(mapping, folio);
>  }
