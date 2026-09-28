Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F8D3016FB
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790572730; cv=none; b=ieMy2xjtpsudZJ8WgUCBkb32n5DhLgIBF/+PGnuhqzJ51fc/hMfGay8u8vijjmNA0vQzhrC2x32sufX0UgAeiYDl0Sr7d9MjWVBIfwL30jscJ7HlnpbG8iQG6/PjFsYuw2rUbHfukShRU417emxsmNw4vS4yPgFZmiMtFlN4gJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790572730; c=relaxed/simple;
	bh=0U+mL4Cz0OFJUraDh13qs6pe7BCHS1EnZDU5ZEcmVnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWfPf/naITqSPwQXs1crj5Ig50byCU/WfNYPEUeWJxZxKmzc/+Pdt6AOH3hUXkeN9cR2NJ2NL8Ys7g1XMPW2z2ZGCgJxULwG4Iwtux4i4zawBdBEZ3hAfF6YrCCE8kZQCK3jYXorzxzMdub3RHpWE3FLtjfQi7riT6nyMJREEEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZP/c6FkO; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZP/c6FkO"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2c89ebe1b7so6627166b.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790572727; x=1791177527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JrcsFhimSFFpvPxn7z9kfbGviN4GpU7NSPm5ovf6tpY=;
        b=ZP/c6FkOb/1qFp6U3C1Jp6HW3huoEPTDJNtOnT3f/oJyxwtEWCf0jYYo7XzIl5Dfyv
         zRlSFjZ2b+4TuDgW+0ejEiz369ta3NoEEPKxLjFDIs2dWx69Kt/R0xoUFXbrOTRoHeZF
         3l7vleyMp7HGDJ+RDz9E11yOoz2GVZyJ0LuZgOGx4+dDp4CwClQTQLP89yFQL96cha5X
         +AbxWK2J31vzVv6/+poDfQHXywQw+SknlLWbwzflSnzZGuoR792LakXSPwEG5xluSrgu
         hXlJy+X3i2HS3zDfxhRbPAFbEBrksjEq32h6StzsY+1RW8/DUlhqF/6qmUyBbHfDzI7N
         a88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790572727; x=1791177527;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JrcsFhimSFFpvPxn7z9kfbGviN4GpU7NSPm5ovf6tpY=;
        b=AjxtoYPRWoiXruxFN5lHaY/gohAUVM7YQDBg2ffK6dUgjgvAoVKHeAUnYn1aK93A4E
         74PwmbwG256jiR13IxsdtNXihASTR/ikk8k5wz2fMrEGo2hdwo0dhMY8ktDH+9ntox2V
         VlKNgIC1xLIeu476UVDWNJquVgf2ti0WEjopYDBCS9RZ7Z1aEF5w9xCUO41N9HXC6Swo
         nXZLVev5t2MVmmYcVBqAnsV1UoJSMpfTOcM8oFl09lc0hF95JzuCa1OnJjZxofyxlVD4
         REfim5vJx/c7mXD6HVEhr7Mcn3Vw3O7F2y5AcfxadSohHWRNVwITg4+f8VKgpI5/QJYl
         0ZCQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9/Oy6aHf+k8dvKQHqGkiWvHqKtq6hDKIJlbc1opS665KBxwty8tYXB/5aC6pTXh3Jf7WCN5XUsKwT+pc=@vger.kernel.org
X-Gm-Message-State: AFuF++k7fnmthEBAH94q1JRRvQTrRII3XJJCe4dc+Id8pULFzCRXtNab
	nvAq4/ErA7Dt962Ld9MFmC1nGSlsQ0oG1qrzy6f/qzgR1cdwcTBjJo5S0awZV8bRfv8=
X-Gm-Gg: AYBFou1BpGTuJ+RwLlEg5B/7dAgH7FLTgHi+2VkjlQjLBnRSDEA9Polp5C21rVEvjae
	QT7doHa3xSnv1gx/HIZMaW+qxDWi7I6DDqcl0epseIxQmHCJx5CsVwjEo6qKujx8Q1ZhPoMgQja
	kzysydZ3zKlrWMTKN0tHQnAEGRCAjjjm4IZhE1oV51IihJ6YVGBNy9GpckTT6BQF8o4skAeE+j4
	/1oyecEy08/sWiQf38MFZBfarYNDZ1U68MmznFAucRVMFEGRILYl5DeGgrF8l6JA6J55WGVbXEo
	j+dzGS9fH9otg7xN4JnwPZzi+r4WCi0xUefU6f802L8z0vpm//xpUHGbeIXLx0X9Xz7rk5bn75P
	idvhy9HYv/XA2zBiaWA14QHmUUVtZpcv09AyFp9n6Nwbt+AKoFvqQFa+JqLUm1P73dYnjKyjLnk
	LGB7Fq5OJXLIEoFDKxxJi0BKFaVE4PAkLOyEWl3IOOeZPQFAY7Cjd503hD4tyaqW4UhM14
X-Received: by 2002:a17:907:d08:b0:c25:2ded:ad36 with SMTP id a640c23a62f3a-c2ac2053cb1mr1106011066b.0.1790572727431;
        Sun, 27 Sep 2026 22:18:47 -0700 (PDT)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm34936535ad.30.2026.09.27.22.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 22:18:46 -0700 (PDT)
Date: Mon, 28 Sep 2026 13:18:42 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>, yaojiale02@163.com
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, ocfs2-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ocfs2: validate extent list in filecheck repair
Message-ID: <arn2x2Y688K9Js4N@p15>
References: <20260926131848.3379842-1-yaojiale02@163.com>
 <744a70bd-5455-421f-a37d-1c0a63f54b60@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <744a70bd-5455-421f-a37d-1c0a63f54b60@linux.alibaba.com>

On Mon, Sep 28, 2026 at 09:33:12AM +0800, Joseph Qi wrote:
> 
> 
> On 9/26/26 9:18 PM, Jiale Yao wrote:
> > ocfs2_filecheck_validate_inode_block() does not validate the embedded
> > extent list, while ocfs2_filecheck_repair_inode_block() only clamps
> > l_next_free_rec to l_count.  The normal inode read path requires l_count
> > to be non-zero, limits it to the number of extent records that fit in the
> > inode, and requires l_next_free_rec not to exceed l_count.
> > 
> > Without the same checks, filecheck can report SUCCESS while leaving an
> > invalid extent list on disk.  A later read through the normal inode
> > validation path rejects the inode and makes the filesystem read-only.
> > 
> > Add a shared helper for the filecheck paths to check these invariants.
> > The filecheck validator now rejects all three cases.  The repair path
> > still clamps l_next_free_rec, but refuses to repair zero or oversized
> > l_count values.
> > 
> > Fixes: d56a8f32e4c6 ("ocfs2: check/fix inode block for online file check")
> 
> I'd like make this as a new ability rather than a bug fix.
> 
> > Signed-off-by: Jiale Yao <yaojiale02@163.com>
> > ---
> >  fs/ocfs2/inode.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> > 
> > diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
> > index 180107a11046..57168ed02915 100644
> > --- a/fs/ocfs2/inode.c
> > +++ b/fs/ocfs2/inode.c
> > @@ -249,6 +249,41 @@ static int ocfs2_dinode_has_extents(struct ocfs2_dinode *di)
> >  	return 1;
> >  }
> >  
> > +enum ocfs2_extent_list_status {
> > +	OCFS2_EXTENT_LIST_OK,
> > +	OCFS2_EXTENT_LIST_ZERO_COUNT,
> > +	OCFS2_EXTENT_LIST_OVERSIZED,
> > +	OCFS2_EXTENT_LIST_BAD_NEXT_FREE,
> > +};
> > +
> > +static enum ocfs2_extent_list_status
> > +ocfs2_check_extent_list(struct super_block *sb, struct ocfs2_dinode *di)
> > +{
> > +	struct ocfs2_extent_list *el = &di->id2.i_list;
> > +	u16 count;
> > +	u16 next_free;
> > +
> > +	if (!ocfs2_dinode_has_extents(di))
> > +		return OCFS2_EXTENT_LIST_OK;
> > +
> > +	count = le16_to_cpu(el->l_count);
> > +	next_free = le16_to_cpu(el->l_next_free_rec);
> > +	if (count == 0)
> > +		return OCFS2_EXTENT_LIST_ZERO_COUNT;
> > +	/*
> > +	 * The exact capacity depends on i_xattr_inline_size, another
> > +	 * unvalidated on-disk field. Inline xattrs only shrink the
> > +	 * list, so the no-xattr maximum is a safe upper bound that a
> > +	 * valid l_count never exceeds.
> > +	 */
> > +	if (count > ocfs2_extent_recs_per_inode(sb))
> > +		return OCFS2_EXTENT_LIST_OVERSIZED;
> > +	if (next_free > count)
> > +		return OCFS2_EXTENT_LIST_BAD_NEXT_FREE;
> > +
> > +	return OCFS2_EXTENT_LIST_OK;
> > +}
> 
> This seems a duplicated check in ocfs2_validate_inode_block().
> So I sugguest just extract the helper from it instead of duplicating
> a new one.
> 
> BTW, seems we don't have to introduce enum ocfs2_extent_list_status,
> to make the checks simple.
> 
> Thanks,
> Joseph

Hi Joseph,

The code logic is identical for ocfs2_validate_inode_block() and
ocfs2_filecheck_validate_inode_block(), except for their error handling style.
It seems possible to merge them into ocfs2_validate_inode_block() by adding
a bool check parameter to distinguish between the two behaviors, and then remove
ocfs2_filecheck_validate_inode_block().

The new code logic: replace ocfs2_error() with mlog(), and then "goto bail".
At the bail label, handle the two cases separately using "if (check)".

i.e.:
//adding a new parameter "check"
int ocfs2_validate_inode_block(struct super_block *sb,
			       struct buffer_head *bh, bool check)


code change from:
```
	int rc;

	... ...

	if (!OCFS2_IS_VALID_DINODE(di))
                rc = ocfs2_error(sb, "Invalid dinode #%llu: signature = %.*s\n",
		     (unsigned long long)bh->b_blocknr, 7,
                     di->i_signature);
                goto bail;
        }
```

to
```
	int rc = 0;

	... ...

	if (!OCFS2_IS_VALID_DINODE(di))
                mlog(sb, "Invalid dinode #%llu: signature = %.*s\n",
		     (unsigned long long)bh->b_blocknr, 7,
                     di->i_signature);
                goto bail;
        }

	... ...

	return rc;

bail:
	if (check) {
		rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
	} else {
		rc = ocfs2_error(sb, "invalid dinode\n");
	}

	return rc;
}
```

Thanks,
Heming

> 
> > +
> >  /*
> >   * here's how inodes get read from disk:
> >   * iget5_locked -> find_actor -> OCFS2_FIND_ACTOR
> > @@ -1835,6 +1870,33 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
> >  		goto bail;
> >  	}
> >  
> > +	switch (ocfs2_check_extent_list(sb, di)) {
> > +	case OCFS2_EXTENT_LIST_OK:
> > +		break;
> > +	case OCFS2_EXTENT_LIST_ZERO_COUNT:
> > +		mlog(ML_ERROR,
> > +		     "Filecheck: invalid dinode #%llu: extent list l_count is zero\n",
> > +		     (unsigned long long)bh->b_blocknr);
> > +		rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
> > +		goto bail;
> > +	case OCFS2_EXTENT_LIST_OVERSIZED:
> > +		mlog(ML_ERROR,
> > +		     "Filecheck: invalid dinode #%llu: extent list l_count %u exceeds max %u\n",
> > +		     (unsigned long long)bh->b_blocknr,
> > +		     le16_to_cpu(di->id2.i_list.l_count),
> > +		     ocfs2_extent_recs_per_inode(sb));
> > +		rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
> > +		goto bail;
> > +	case OCFS2_EXTENT_LIST_BAD_NEXT_FREE:
> > +		mlog(ML_ERROR,
> > +		     "Filecheck: invalid dinode #%llu: extent list l_next_free_rec %u exceeds l_count %u\n",
> > +		     (unsigned long long)bh->b_blocknr,
> > +		     le16_to_cpu(di->id2.i_list.l_next_free_rec),
> > +		     le16_to_cpu(di->id2.i_list.l_count));
> > +		rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
> > +		goto bail;
> > +	}
> > +
> >  	if (ocfs2_dinode_has_size_without_clusters(sb, di)) {
> >  		if (S_ISDIR(le16_to_cpu(di->i_mode)))
> >  			mlog(ML_ERROR,
> > @@ -1893,6 +1955,15 @@ static int ocfs2_filecheck_repair_inode_block(struct super_block *sb,
> >  		return -OCFS2_FILECHECK_ERR_VALIDFLAG;
> >  	}
> >  
> > +	switch (ocfs2_check_extent_list(sb, di)) {
> > +	case OCFS2_EXTENT_LIST_OK:
> > +	case OCFS2_EXTENT_LIST_BAD_NEXT_FREE:
> > +		break;
> > +	case OCFS2_EXTENT_LIST_ZERO_COUNT:
> > +	case OCFS2_EXTENT_LIST_OVERSIZED:
> > +		return -OCFS2_FILECHECK_ERR_INVALIDINO;
> > +	}
> > +
> >  	if (le64_to_cpu(di->i_blkno) != bh->b_blocknr) {
> >  		di->i_blkno = cpu_to_le64(bh->b_blocknr);
> >  		changed = 1;
> 
