Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58C737269C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791261747; cv=none; b=tgqiWsJsOldACJqjghyeywHhiRi04I5PWX0XJE0h6MkqVWlSAMBm8J2qQ3D8VFCrhbskZbhe3bdWg47am3w3DgBikM2SZ0jvPcIcWVQYJY5Zq23/4s4JTjuycP31WGZUD+9XHgFDQnse4t0VdAxcwhGHgfb8aTZFJwu32Gk2e6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791261747; c=relaxed/simple;
	bh=ey/VmHOoiegcuBBgsbjOLxRd4S3RnSr5XSYjzesA/NI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o04zoUMujzva/volv9ZViSGNBTWkwg/pmTXWYizdqxD3J92NQcFKiVCEH7lVXyi6ZudDurEc1BtNynlk6RQYdaou46zvnGimgHxGm6zr2aS3LpD3EtktMFBHyTzIjjmKoW860z9hiOMOWWil91QhuZYduTDOpb1VFyMuH4e9d6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZzbMs4O; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZzbMs4O"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e4985211ecso5299315ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791261744; x=1791866544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lmyvkwbpQWj8sse21Js4aaAmmgEtva0kuk1RTa4+PCU=;
        b=nZzbMs4ORszd+5E+h17gBtFbsQo59xXw76k2XOkK4879I/vz0MaeMJumrFkkNSgyvs
         HsxzoZRNBBuN8EWeAKdcObXyH4wGrdrQJTM0+KSLdEeVXIXd83cEmIQTK/dCKyjrX+Na
         Ih6VnP+vIek06ZvroHgj1eWu6BqtoWXcyMQ0DEcuu0zCUh4cgxaoxpIV/6HNhxlVv2C/
         O4Fj0FLlrE8+QrUWgvWz6YxViAGfo+58+IaHpVJ1vjiM38aveR4Eu5Z9DTxyCS49iXFz
         ouWsVeXxya/Xdj7NQnq6a9GkX9PQCEA+0dOiswAVwwvJTJM2PzuGgkqtrohghqRhiOBn
         omng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791261744; x=1791866544;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmyvkwbpQWj8sse21Js4aaAmmgEtva0kuk1RTa4+PCU=;
        b=J1Kus/iwgmdycKinL8HJb8gpznHS1vn1Cbs980t2cLUfL9FMy0NAxGiyN7I1rKzkyZ
         FoFsKehacuvShmBORiw2USeHpLfz0iGtqKYfRTl9fmGtyTa70b97Zc8RgD4Za8mQnGvw
         dkJuARgfxiXCWborTlt+17EvVIPx+TbTU1ArGzCJr5onle1rLNrN5dLUbCY4J5Nqt7r6
         r+FeY1jsJrEKbm2L+AO2+prmeWnFLewyCtBcgJrYHShBPOAXIOSlZB1y456zT81Eaot3
         5PO90vb7/RQLbfiPXe8E6pptDLQf5g2SxuV642oSutI5QFM07Qb7IfjqDHN4i7IHInDI
         Trrw==
X-Forwarded-Encrypted: i=1; AKwUvBxpNEFqVu5LbRxirR5t4uqKz407YlKdF6gpXi4S8o2eyh+kJyR+ia/8JGOnZm723E7mXoEMnVCYwVIyeVw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCSonaZtvzRVJbAbZwSGPcTWqAAVK69p0Thh5xFnAI4qL2LFM0
	O8aCDc7ReuN//GOZmH/YTDVbCpLopG4M3yYDHyzTtDIHgFFD0MUs1vfSvI4WbwIB
X-Gm-Gg: AYBFou3agF6/Fw8KvfpszMdRQvQ2Zc8yijwVZXuY6XNHy518z7PgLlAOem6aGoU1Ddj
	cQ8uZZkn0o8YCmlMOBKFpEtAPXpwh9XOa+zrE/X6dwkNQT6VqrRBYd6upiFhRpc3ZMo1GpRa2is
	3Y3cda1gWpNXwrkNdsuSVULtf0I1A0HEmXf1EMxrmcc3b1/m9uiAA0is0HRebtjm41iASgV5hjI
	7eIMoYFz5nTBaMrp+8W0+GN6loHgNnCcDwRJI/w3AgUgAWlkj+Ylwgps3fUdBsP+PuZAb3x5FB8
	aThXwhMSVSwaeWbilwAHhDtxllXvuTIPpAFhNZFW2O6EauXZsjhlRwHH9hh+LQFaHCvLwIPDMZ4
	34nn7lemr1AmQWx0f/Mkz0lNx/px9yvO1eeUSIrVwGfcVAdjaS8W+Mzc28A7hhv18Wfpb+N1rc3
	3IyKNqHTapxhdd5hAmPc0KgQqCjGks+rdxUbeXEBwtQFS05Qn23rUhtv0meVFW
X-Received: by 2002:a17:90b:5825:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3a8726c1865mr151075a91.2.1791261743929;
        Mon, 05 Oct 2026 21:42:23 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cea0f1sm2734791a91.15.2026.10.05.21.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 21:42:22 -0700 (PDT)
Date: Tue, 6 Oct 2026 13:42:20 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH v2] ntfs: record an error when the ACL xattr undo fails
Message-ID: <asR8LDWW5S3Ex0Gi@hyunchul-PC02>
References: <20261004022622.631203-1-zenghongling@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004022622.631203-1-zenghongling@kylinos.cn>

Hi Hongling,

On Sun, Oct 04, 2026 at 10:26:22AM +0800, Hongling Zeng wrote:
> ntfs_set_acl_ex() commits the new ACL xattr before it rewrites the WSL
> mode EA, and removes it again when that rewrite fails.  The removal is
> best-effort: its result is discarded and the EA paths record no error
> state, so when the removal fails too, the new, typically more
> permissive, ACL is left on disk while i_mode, the mode EA and the
> cached ACL keep the old values.  Once the stale xattr is loaded again -
> after a remount, or when the cached ACL is discarded - a chmod 0640 ->
> 0777 that reported failure leaves the file accessible to the relaxed
> ACL while stat() still reports 0640.
> 
> Check the removal and record the failure: NVolSetErrors(), which the
> next persistence point persists as VOLUME_IS_DIRTY, and a log message
> the errors= policy acts on.  The flag cannot be written to disk here
> directly: the target inode's mrec_lock is held and the $Volume
> mrec_lock cannot be nested under it.
> 
> Fixes: fc053f05ca28 ("ntfs: add reparse and ea operations")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>  Change in v2:
>  -undo only a committed set: undoing a removal returned -ENODATA for an
>   already-removed xattr and was recorded as a volume error, or re-added
>   an empty xattr once the removal had dropped the last EA
> ---
>  fs/ntfs/ea.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
> index b4fcfbe2da4c..b3e079e2dc03 100644
> --- a/fs/ntfs/ea.c
> +++ b/fs/ntfs/ea.c
> @@ -1084,8 +1084,34 @@ static noinline int ntfs_set_acl_ex(struct mnt_idmap *idmap,
>  		mutex_lock(&NTFS_I(inode)->mrec_lock);
>  		err = ntfs_ea_set_wsl_inode(inode, 0, &ea_size, NTFS_EA_MODE);
>  		if (err) {
> -			ntfs_set_ea(inode, name, name_len, NULL, 0,
> -				    XATTR_REPLACE, NULL);
> +			/*
> +			 * Only a set needs undoing: a removal leaves no
> +			 * new ACL behind, and repeating it would either
> +			 * return -ENODATA again or, once it dropped the
> +			 * last EA, re-create an empty xattr.
> +			 */
> +			if (acl) {
> +				int undo_err = ntfs_set_ea(inode, name, name_len,
> +						NULL, 0, XATTR_REPLACE, NULL);

Could we restore the previous ACL xattr instead of unconditionally
remove it?

> +
> +				if (undo_err) {
> +					/*
> +					 * The ACL xattr is committed
> +					 * already, so a failed removal
> +					 * leaves the new, typically more
> +					 * permissive, ACL on disk while
> +					 * i_mode, the mode EA and the
> +					 * cached ACL keep the old values.
> +					 * Record the error: the next
> +					 * persistence point persists it as
> +					 * VOLUME_IS_DIRTY.  Run chkdsk.
> +					 */
> +					NVolSetErrors(NTFS_I(inode)->vol);
> +					ntfs_error(inode->i_sb,
> +						   "Failed to undo the ACL xattr: %d",
> +						   undo_err);
> +				}
> +			}
>  			mutex_unlock(&NTFS_I(inode)->mrec_lock);
>  			inode->i_mode = old_mode;
>  			goto out;
> -- 
> 2.25.1
> 

-- 
Thanks,
Hyunchul
