Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D687A4756C8
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798593; cv=none; b=oRSLl0EmIUeHakFrQoTw9SzplAVex+6CbzT8PylTA8ODMbDild48I4neJXG7Lfr3wBCPxitH8tjaulvqoyJhI7+LWVINUyTw6Cw51AfIWLvIVS55l6M6bO72bMXL0WO7rBmhoEGGin8qlotQy/SJUZnEmADvAxp4xUr0bseld6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798593; c=relaxed/simple;
	bh=tquEmo3gl+DNuEdBkeQmX5Ac3hcWeJexs8oMeBPJW+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRcV6ieEbu0r1Gu7QD8S3DtPS9YD5QA9+vf0RORLgcGAjgWyMEsEsOoZpr1F9KUcZBCQ2xGoiChMkzEJIqQ6vImTuPHjD9UtsGWvedjiutX7R1yzB6KUcr42Dn+r3zs9Tv3/Ogdh9VImxxYmiAYqXiBWP7uvBAmby3rQ9xnD2nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aItBVgBm; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aItBVgBm"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so375915a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791798586; x=1792403386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W79TeYdawJl05fpvMEHv8uRrqzpyiJUu8pXbceDlpDs=;
        b=aItBVgBmot3iNVp3PQmps3gXIvCITWgCosNqCAIOnkLkfgtWXBde3mtFdGqtCqTR/Y
         lx+cO/85dG4D/k5Z33Mo3lKvEMfq1u66q1lU17w93YXEGOcGx0Pa/gHm4rdBz0HiYlZd
         DvhdmYQ70sKZO8jb2LmjVhjcfXfw8vp0VKqFUoZCExiifK3jTKRtRtz5yDBQlUeKpp/m
         xKcCb/NatnfQWmQu2hlSYGJ9KuuKF0/py4E5bQjcf20cTpyvy366ABpeuLh7FbUk74Os
         PXDNnSpi8PG8PJkbrSsmWXjC2fPcGMKcWS9gUy379oMZe556tLg0XqdHSOGtRce3LKma
         jFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798586; x=1792403386;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W79TeYdawJl05fpvMEHv8uRrqzpyiJUu8pXbceDlpDs=;
        b=ohoVv6UX8bLfgCOlez0/4avkXDjzW+VD1H2deI/21pCpqDXmJvQQdKhm4k4Td5K0gz
         abxlbOw8ws5aggTTFMgVLV7zIb2wHKeIfsioJV2MkmdLXsPFaNZZChidrfBmkFfk4znS
         4F+BVoH/DoZ3/bdV5PVRNfe5H6u54WeY949mKfTBlGURH5/v+442zO3RIYLZtEUciGOY
         guxgmx37NsS5ffxRkBOyX2QTYl/msgwqTpFsO5mRFOrkcgEJzEwPUrPndX2W0g7LHg7n
         aijMGACMgv8qSjDN/GXAoHnthXdGM4mFn5kEgySbzPjo6P+WSQm/lDNmz2afddY9zRnC
         3kUg==
X-Forwarded-Encrypted: i=1; AKwUvBzRJOFZpg1XFoALlrz9X2pt+L5vIG1bsVW3PPMRVD4aqd1iMD1Uoft3uzeGQF/G/q//3UEshdZHV9H5iPo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzmfnwXf0MNrai07EOwhZ44TPVhoafg+9Ymn6W7bpj4q0C2KYx
	BYRimgl7XC2B39Daamt781S6qmk4322mwUZiH2O19+pslZz844cwx9O7
X-Gm-Gg: AYBFou1AsYWaQ6rrs4KWlXm8ueaHLrAAttoO9x51PSHYnPHEjuGwHkFBcruNodGGP8C
	zmmxUA9iNvlY9P16id6/vWgwcBZKRf9kOQk2yfco8QuBO3FfTY1Ee/0UN+5fUG/NgEdokSuBnNJ
	iwICJ/dYlH2NVOWsZSUkMLgpkdEZG+VVgXooQq9lWwKlD/pUyqRTt0saqniNpk6C4PscGxB+d6w
	Md9xpOoGMqYawUPSOmy4oW203+Kz23y5i3p8pjEmVs55Mf06iXWb52PRLXFyAj/r6Ou/xqTpPf5
	IOTHI2HySpcwbAtB+UfqbQbvTIlowk7AFoxMvtEDoYLFQR2aInjodLP5bLpiJG6wAu+8+/ziqR3
	wPPQ47iZN6h15XcCC+F8EZAFMxSdIFpNKIxPbSPdvw6N80MJY/gJGKr6H0TiSwqP9DestqS5HJq
	aduNSpKJvWrXcsB1F3kHoLwahJUTmxxL7B5CMxFe2LZz3y4Ms0GIR3uP9SZ/Ak
X-Received: by 2002:a17:90a:d2c7:b0:3ab:1b19:78f0 with SMTP id 98e67ed59e1d1-3ab3a8e1d1bmr7225596a91.41.1791798585771;
        Mon, 12 Oct 2026 02:49:45 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9639bsm15214275a91.4.2026.10.12.02.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:49:45 -0700 (PDT)
Date: Mon, 12 Oct 2026 18:49:42 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH v4] ntfs: roll back the ACL xattr commit when the WSL
 mode update fails
Message-ID: <asytNg4xTuvkSxa-@hyunchul-PC02>
References: <20261012073452.90099-1-zenghongling@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012073452.90099-1-zenghongling@kylinos.cn>

Hi Hongling,

On Mon, Oct 12, 2026 at 03:34:52PM +0800, Hongling Zeng wrote:
> ntfs_set_acl_ex() commits the ACL xattr before it rewrites the WSL
> mode EA, and removes it again when the rewrite fails.  That only
> undoes a set that created the xattr: when the update replaced or
> removed an existing one, the old ACL is discarded along with the
> failed update.  The undo result is discarded and the EA paths record
> no error state, so when it fails too, the new, typically more
> permissive, ACL is left on disk while i_mode, the mode EA and the
> cached ACL keep the old values.  Once the stale xattr is loaded again
> after a remount, a chmod 0640 -> 0777 that reported failure leaves
> the file accessible to the relaxed ACL while stat() still reports
> 0640.
> 
> Save the previous xattr before committing the update, and restore it
> when the mode EA rewrite fails.  A removed xattr is restored by
> creating it again: the removal dropped the entry, and XATTR_REPLACE
> fails with -ENODATA on a missing entry.  Remove the new xattr only
> when there was no previous one, and skip the undo when the commit
> changed nothing, e.g. removing an xattr that never existed.  Fail
> the update when the previous xattr cannot be read back.  A failed
> rollback is still recorded: NVolSetErrors(), which the next
> persistence point persists as VOLUME_IS_DIRTY, and a log message the
> errors= policy acts on.  The flag cannot be written to disk here
> directly: the target inode's mrec_lock is held and the $Volume
> mrec_lock cannot be nested under it.
> 
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
> Changes in v3:
> - Save the previous ACL xattr before committing the new one and roll
>   back to it when the update replaced an existing one, instead of
>   removing the new one (suggested by Hyunchul Lee)
> - Fail the update when the previous xattr cannot be read back, and
>   restore a zero-length previous xattr without XATTR_REPLACE
> Changes in v4:
> - Undo a removal too: restore the previous xattr by creating it
>   again, since the removal dropped the entry
> - Skip the undo when the commit changed nothing, e.g. removing an
>   xattr that never existed
> ---
>  fs/ntfs/ea.c | 90 +++++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 86 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
> index 1104fd72cd2a..0577a2adc365 100644
> --- a/fs/ntfs/ea.c
> +++ b/fs/ntfs/ea.c
> @@ -1038,8 +1038,10 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
>  {
>  	const char *name;
>  	size_t size, name_len;
> -	void *value;
> -	int err;
> +	void *value, *old_value = NULL;
> +	int err, old_len = -ENODATA;
> +	bool old_exists = false;
> +	bool acl_committed = false;
>  	int flags;
>  	umode_t mode;
>  
> @@ -1083,7 +1085,40 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
>  	}
>  
>  	mutex_lock(&NTFS_I(inode)->mrec_lock);
> +	if (!init_acl) {
> +		/*
> +		 * Save the previous xattr so the update can be
> +		 * rolled back to it when the mode EA rewrite fails.
> +		 * A new inode cannot have one yet, and one that
> +		 * cannot be read back fails the update.
> +		 */

Could you shorten this comment? I think that the explanations are already
clear from the code.

> +		old_len = ntfs_get_ea(inode, name, name_len, NULL, 0);
> +		if (old_len >= 0) {
> +			old_exists = true;

Could you remove the old_exists? we can use old_len >= 0.

> +			/* kmalloc(0) returns the non-NULL ZERO_SIZE_PTR. */
> +			old_value = kmalloc(old_len, GFP_NOFS);
> +			if (!old_value) {
> +				err = -ENOMEM;
> +				goto out_unlock;
> +			}
> +			err = ntfs_get_ea(inode, name, name_len,
> +					  old_value, old_len);
> +			if (err != old_len) {
> +				kfree(old_value);
> +				old_value = NULL;
> +				if (err >= 0)
> +					err = -EIO;
> +				goto out_unlock;
> +			}
> +		} else if (old_len != -ENODATA) {
> +			err = old_len;
> +			goto out_unlock;
> +		}
> +	}
>  	err = ntfs_set_ea(inode, name, name_len, value, size, flags, NULL);
> +	if (!err)
> +		acl_committed = true;
> +out_unlock:
>  	mutex_unlock(&NTFS_I(inode)->mrec_lock);
>  	if (err == -ENODATA && !size)
>  		err = 0; /* Removing non existed xattr. */
> @@ -1095,8 +1130,54 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
>  		mutex_lock(&NTFS_I(inode)->mrec_lock);
>  		err = ntfs_ea_set_wsl_inode(inode, 0, &ea_size, NTFS_EA_MODE);
>  		if (err) {
> -			ntfs_set_ea(inode, name, name_len, NULL, 0,
> -				    XATTR_REPLACE, NULL);
> +			if (acl_committed) {
> +				int undo_err;
> +
> +				if (old_exists) {
> +					/*
> +					 * Restore the previous xattr.
> +					 * A removal dropped the entry, and
> +					 * XATTR_REPLACE fails with
> +					 * -ENODATA on a missing entry, so
> +					 * create it.  A zero-length xattr
> +					 * cannot be restored with
> +					 * XATTR_REPLACE, which would
> +					 * remove it again.
> +					 */

And I think this comment can be reduced.

> +					int undo_flags = acl && old_len ?
> +						XATTR_REPLACE : 0;
> +
> +					undo_err = ntfs_set_ea(inode, name,
> +							name_len, old_value,
> +							old_len, undo_flags,
> +							NULL);
> +				} else {
> +					/*
> +					 * No xattr existed before the
> +					 * update, so remove the newly
> +					 * committed one.
> +					 */

This branch is self-explanatory from `!old_exists`. 

> +					undo_err = ntfs_set_ea(inode, name,
> +							name_len, NULL, 0,
> +							XATTR_REPLACE, NULL);
> +				}
> +				if (undo_err) {
> +					/*
> +					 * The xattr change is committed
> +					 * already, so a failed rollback
> +					 * leaves it on disk while i_mode,
> +					 * the mode EA and the cached ACL
> +					 * keep the old values.  Record the
> +					 * error: the next persistence point
> +					 * persists it as VOLUME_IS_DIRTY.
> +					 * Run chkdsk.
> +					 */

Same here.

> +					NVolSetErrors(NTFS_I(inode)->vol);
> +					ntfs_error(inode->i_sb,
> +						   "Failed to undo the ACL xattr: %d",
> +						   undo_err);
> +				}
> +			}
>  			mutex_unlock(&NTFS_I(inode)->mrec_lock);
>  			inode->i_mode = old_mode;
>  			goto out;
> @@ -1109,6 +1190,7 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
>  	}
>  
>  out:
> +	kfree(old_value);
>  	kfree(value);
>  
>  	return err;
> -- 
> 2.25.1
> 

-- 
Thanks,
Hyunchul
