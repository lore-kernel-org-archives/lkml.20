Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793248118;
	b=eox5xtM/Bpfhoo0CJz0GnYv/YlJ/dENGTH7JBbvlQ4dT1f3NMavHb7pcVXD6OmMZcOWO
	 YOWlumPb6Llvl9G4Tpwg9ngEk6nqqQTqa/YmacfOYiMA4Hw405MYN1oV8S8uzYIEoUwzq
	 snZa48qH9wnbG7Sjgpy4naRJ0gdGl75QlWu6pf4MngkVQNiRYpGtvSg1gI1Lu1cYkZuci
	 JKa/8wgnyuAVf1omWFTxQ+I2MmmRV88CBU3MV/8qms4Hd1rHOQ+VmC/pnLuPItry8e5pb
	 pejIyMCU6dyT+0j9oXAZ01fDWR9R7FFWlcD97gIka7nYko6J+r1zjraM+bq/rA/ZKUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793248118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=peGi2q4w0fAOeVYcPBrPo4Q6fHm+zWURoNSSlNJpq2c=;
	b=noWuwImAHklP121UXUOhVOF40askqJzGKWLx8BgAweF9elKiVH7HZxmTSwnJT84O4MGo
	 t4Ym2bPBSFtyEqL3fhKsr6uAUhWWGZbmV4p2xhvH18Eac/Efb1/tjeKUKzdteLlIjpTnh
	 EK2+QwuWFWgR8YApV922KdncodbgPmNZuqtPayjAKCRaPS16rTVR5Ol1nC2p3eD/9fEcm
	 HCZRAdLikOq0EwT994Og8djXzeNdJOFDTu8W/HqJhrewmARx+S6dmovSMGDkl/XQyrNd0
	 Y/N0ZpE87rTO9E/tlawbWkG4qkNqAiwLba8PtD07k5NKxl5PR0dFSkSH9Kph1hh+jdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2e0xdgX;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75F9606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A75F9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2e0xdgX
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so387083eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793248117; x=1793852917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=peGi2q4w0fAOeVYcPBrPo4Q6fHm+zWURoNSSlNJpq2c=;
        b=o2e0xdgXbofMpbATAj8fADypbAXwY6/eD/USgc8TGnkDeeTa14EGT+AmKE3f0k0mcJ
         f3cEUfox0NcKR4k6gh9M67NUs8AunLz+552Mebhmv9wz8m2sqX0OvRXyuZhOuT9KberJ
         ER9hfIGLwRdjaOkyaRb8u3mdDjyu6xEwrrllRijnAU7NAJwfQFafTPFR/3yc3mu2+oRI
         Cz69b3/dkzO5Gu0sHk1ALnzz8G3opS3EALVrvAoHDjcUOJlwTBJN5+BG7qyFgqbYgMme
         VzfHC/aDOtdPoiHcZehGXcFFfr5dh4HjYTdojM8Ns5KUO9y1ckmlCR7Nj/Y25O6bZjMA
         VjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793248117; x=1793852917;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=peGi2q4w0fAOeVYcPBrPo4Q6fHm+zWURoNSSlNJpq2c=;
        b=zMGxgYtCucvuobIMbLny5ILkLON71ZJxCUHy7bnkpzAWfQ+rjVOeWEEvfERbQ7pkg0
         6pBznzQ6U4m/Zw1b/oNqmUee7GLGeZxAAWXyRsjUbL4TLuTHzF9aZkrvakH8tRyUTNcB
         XZ5X7psm9a2mM1HHmjwPNnAZWN12LThJZZ7GUcY4SKXSUWavjbmwNy8+FFVxKKEQL52J
         +zmlHuS2hZttopfY8NZHFPRsskC+0rT1KJDGV3wTG73bzTUMHQ0cmTkG2c+9XK9lBWZT
         WEQCduS7JYRyrmFMX18dnudTXecpGUotzM1uwqU3ihdrU9KdS1msTJremj6x0U/RvAUy
         3qjg==
X-Forwarded-Encrypted: i=1; AKwUvBy+sa08otKu0jzYSevvEyK0BPa5op3SiHTqTkQMpf6GTB27DPnqhYweLiF95hTwg1wp3PJ3o3nVPpyMQNs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ9tzP3sdZzXMnRa872jIR4q5plMbYZgc9wjPey47nZ3MpsN+h
	rFA0f7J0RiYU4ufH/MR9OhiXbBCs8IOVTS7n9hw1506eYyLdBsuc57wE
X-Gm-Gg: AYBFou2fu5tRtbg1vBWtcTQoh9HF13ISFAjC9Kmo5kVEPMNzeNuR+W9JnM/HLdFwrmL
	vW7E1VUbCxS6+NIQMHD/DBMQX7BMUkujdUoYOatevkNo/EWTZmVOAu0di6i0YFw/wwwBt8t+SUQ
	IWYul/Yli5pDtZCaKow3/qE1b3LtgpvOEjP22VoY4ig6ZmFGAJB/BlbwolXobg8cAEzpaltF+Z3
	uZhXgbz/sHbB3TBXWxFkiRNKB5F1VKOTI5idcP4wUS6APnojTBipIm86PHEPcEBpeogfU4t3WSq
	7geSThuwe/IKD5e9tkSTTY9GzLi01lDGzUSqPTkEUUBC9JIZky4TZJ5XoUL8UUffOyIXx6Gp0Yc
	Z2llWbu7bv51LJVRElpxalpDnn6krPzmgBIDC/8DQlrLzQOwWy/lCzlh5siUgsiMhzH9i5oQfZ5
	3I1Zjo/FoR4WK9xg81+r6m6wocoEJfcu+NCreRyyF9VUoyXIfHoxku6eELlc+FcKplLa6SZd5Dl
	VK6lGrmKNfsvmZpAYgzGvc6oZXNsyq9n4F0QKAY1KV1NZ48eqMymes/jk088mWPk/IzzfzQNzGT
	zPybFXIfnYbxl9rGhLc=
X-Received: by 2002:a05:693c:864c:20b0:36a:1819:4d0c with SMTP id 5a478bee46e88-36a2046c99amr7095157eec.41.1793248116464;
        Wed, 28 Oct 2026 21:28:36 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237be80csm27699405eec.2.2026.10.28.21.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 21:28:35 -0700 (PDT)
Date: Thu, 29 Oct 2026 13:28:33 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH 2/2] ntfs: fix a self-deadlock on writes to non-resident
 named streams
Message-ID: <auLLcf9BK7-rIGPz@hyunchul-PC02>
References: <20261028080656.1027283-1-zenghongling@kylinos.cn>
 <20261028080656.1027283-2-zenghongling@kylinos.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261028080656.1027283-2-zenghongling@kylinos.cn>

On Wed, Oct 28, 2026 at 04:06:56PM +0800, Hongling Zeng wrote:
> The stream write ioctl holds the stream mapping's invalidate lock
> across ntfs_inode_attr_pwrite(), which calls
> ntfs_extend_initialized_size() for named streams, and that function
> takes the same lock again, before the check that could skip the
> extension.  A write to a non-resident named stream through
> NTFS_IOC_STREAM_WRITE deadlocks on itself.
> 
> The ioctl is the only caller that reaches the named stream branch of
> ntfs_inode_attr_pwrite(), and it always holds the lock there, so
> split off __ntfs_extend_initialized_size(), which expects the caller
> to hold the invalidate lock, and call it from that branch.  The write
> and mmap paths keep taking the lock themselves.
> 
> Fixes: 3f11c48d4f94 ("ntfs: add pathname access for named streams")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
> ---
>  fs/ntfs/inode.c | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index ac13e8776909..9275ebfebe3d 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -2554,8 +2554,12 @@ int ntfs_show_options(struct seq_file *sf, struct dentry *root)
>  	return 0;
>  }
>  
> -int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
> -				 const loff_t new_size)
> +/*
> + * The caller must hold @vi's mapping invalidate lock.
> + */
> +static int __ntfs_extend_initialized_size(struct inode *vi,
> +					  const loff_t offset,
> +					  const loff_t new_size)
>  {
>  	struct ntfs_inode *ni = NTFS_I(vi);
>  	struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
> @@ -2563,10 +2567,11 @@ int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
>  	unsigned long flags;
>  	int err = 0;
>  
> +	lockdep_assert_held_write(&vi->i_mapping->invalidate_lock);
> +
>  	if (!NInoNonResident(ni))
>  		return -EINVAL;
>  
> -	filemap_invalidate_lock(vi->i_mapping);
>  	read_lock_irqsave(&ni->size_lock, flags);
>  	old_init_size = ni->initialized_size;
>  	read_unlock_irqrestore(&ni->size_lock, flags);
> @@ -2600,6 +2605,16 @@ int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
>  	err = ntfs_attr_set_initialized_size(ni, new_size);
>  	mutex_unlock(&mrec_ni->mrec_lock);
>  out:
> +	return err;
> +}
> +
> +int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
> +				 const loff_t new_size)
> +{
> +	int err;
> +
> +	filemap_invalidate_lock(vi->i_mapping);
> +	err = __ntfs_extend_initialized_size(vi, offset, new_size);
>  	filemap_invalidate_unlock(vi->i_mapping);
>  	return err;
>  }
> @@ -4085,8 +4100,13 @@ s64 ntfs_inode_attr_pwrite(struct inode *vi, s64 pos, s64 count, u8 *buf, bool s
>  	mutex_unlock(&mrec_ni->mrec_lock);
>  	/* Attribute writes bypass iomap's delayed-allocation preparation. */
>  	if (ntfs_inode_is_named_stream(ni)) {
> -		/* A failed write must not expose any newly initialized data. */
> -		ret = ntfs_extend_initialized_size(vi, pos + count, pos + count);
> +		/*
> +		 * A failed write must not expose any newly initialized
> +		 * data.  The stream ioctl caller holds the mapping
> +		 * invalidate lock.
> +		 */
> +		ret = __ntfs_extend_initialized_size(vi, pos + count,
> +				pos + count);
>  		modified |= ni->initialized_size != old_init_size;
>  		if (!ret)
>  			ret = ntfs_attr_fallocate(ni, pos, count, true);
> -- 
> 2.25.1
> 

-- 
Thanks,
Hyunchul
