Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176916;
	b=zTw++UqYU8JF9CSje5Gossz1Zkq9KFJ6guZysG7/sXgu7A3N85mXFDHz0ird8BHVaWC5
	 4IpeOejZ87R497sAsq4n9BpBznO8mVLGNuGX6jDvnbs7rXZtQqhviTRZmpNhJSBSYes5a
	 tW6YfCVgkCmqqE5vokMGmhZUekuQlUnuVbKwcNx3t1tp7X24V5qgS3bm6HnETyoC1L4Cq
	 KLVf9Hr2ArWnDtaA9lrVz0fWblwMNkCeZpio7DnDfJzmJhX2jrmdhtRX1X07BwU/VB/tm
	 k+N5wv43yT+5SmF6BOPnjhHnOHbbObwdbov/52mOdKegqlDNywS9uzm8Hn4/WQtFA5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176916;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=K6tFBvCkQJp8XVt2XBWu1TRVDmaAWU78lMGM7+FkGQw=;
	b=QVx266kgwN/nOmolIItQJgVINGiq+7e5eYmMfgQB7HJnz6kCfjg22A8ZxeEHP0gSIgrX
	 06cYiCRLoOQukkCZvQg75xZqc05nCMdIAIrKiMj61kvrZxF/PRLHUiYzASyDX1bJ/OrwO
	 YGuqDIXhFEuiEcDeD2kcCS5APO9al5lfhpKhAsaCcKT/QJWsL1BXYAfXasF5fdu6Xh1am
	 XPkkmufJ0ScNDFXvS6D+asA4yRmQQIRpHRqU0Q0KK1xeZt3X80IMRSQyMiiBn1OtVMR1+
	 lGH4FV92nv5OsHhPy3v0v0Nbh4oQ6lw1jKccN3FqUCBGShpkZCYa/1r55GVL1/zidqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=N469slBW;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C67606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90C67606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=N469slBW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=K6tFBvCkQJp8XVt2XBWu1TRVDmaAWU78lMGM7+FkGQw=;
	b=N469slBWkFD6VdxsANRvy+woXKUN7Bs4MUR5y7MWbhz19HH1+GkhPDHgSRc9YJ
	wPp6DG/SM5txjEhLr3+K5csFvRkSrHyzXXx+gpOcC/D8pNDDjil8MybFfq5cjbab
	+ikVey3HHXtNbmtOyYCh02BlrRJ9TsyKtw/P0/TA20tuE=
Received: from [IPV6:2409:8900:1a83:1c7d:c982:2c1e:474c:2013] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD3ZS9CteFqK41dCg--.61557S2;
	Wed, 28 Oct 2026 16:41:39 +0800 (CST)
Message-ID: <9b52b1ef-6818-4e7d-b7ca-771876b24f38@163.com>
Date: Wed, 28 Oct 2026 16:41:38 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ntfs: fix a self-deadlock on writes to non-resident
 named streams
To: Hongling Zeng <zenghongling@kylinos.cn>, linkinjeon@kernel.org,
 hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, zhongling0719@126.com
References: <20261028080656.1027283-1-zenghongling@kylinos.cn>
 <20261028080656.1027283-2-zenghongling@kylinos.cn>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20261028080656.1027283-2-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgD3ZS9CteFqK41dCg--.61557S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWrWDXFW8tFykurW8GrWUtwb_yoW5tFyxp3
	sFgwsxKrWxZ3s2grn3tw1Fq3WYgw1vgr4UArySk3W7AF97tr1qqF45trWUWFWftrZ7AFsI
	qF4Du3ykCr1jvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4pBhUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gOQW2rhtUPYJQAA3i



在 2026/10/28 16:06, Hongling Zeng 写道:
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
> ---
>   fs/ntfs/inode.c | 30 +++++++++++++++++++++++++-----
>   1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index ac13e8776909..9275ebfebe3d 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -2554,8 +2554,12 @@ int ntfs_show_options(struct seq_file *sf, struct dentry *root)
>   	return 0;
>   }
>   
> -int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
> -				 const loff_t new_size)
> +/*
> + * The caller must hold @vi's mapping invalidate lock.
> + */
> +static int __ntfs_extend_initialized_size(struct inode *vi,
> +					  const loff_t offset,
> +					  const loff_t new_size)
>   {
>   	struct ntfs_inode *ni = NTFS_I(vi);
>   	struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
> @@ -2563,10 +2567,11 @@ int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
>   	unsigned long flags;
>   	int err = 0;
>   
> +	lockdep_assert_held_write(&vi->i_mapping->invalidate_lock);
> +
>   	if (!NInoNonResident(ni))
>   		return -EINVAL;
>   
> -	filemap_invalidate_lock(vi->i_mapping);
>   	read_lock_irqsave(&ni->size_lock, flags);
>   	old_init_size = ni->initialized_size;
>   	read_unlock_irqrestore(&ni->size_lock, flags);
> @@ -2600,6 +2605,16 @@ int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
>   	err = ntfs_attr_set_initialized_size(ni, new_size);
>   	mutex_unlock(&mrec_ni->mrec_lock);
>   out:
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
>   	filemap_invalidate_unlock(vi->i_mapping);
>   	return err;
>   }
> @@ -4085,8 +4100,13 @@ s64 ntfs_inode_attr_pwrite(struct inode *vi, s64 pos, s64 count, u8 *buf, bool s
>   	mutex_unlock(&mrec_ni->mrec_lock);
>   	/* Attribute writes bypass iomap's delayed-allocation preparation. */
>   	if (ntfs_inode_is_named_stream(ni)) {
> -		/* A failed write must not expose any newly initialized data. */
> -		ret = ntfs_extend_initialized_size(vi, pos + count, pos + count);
> +		/*
> +		 * A failed write must not expose any newly initialized
> +		 * data.  The stream ioctl caller holds the mapping
> +		 * invalidate lock.
> +		 */
> +		ret = __ntfs_extend_initialized_size(vi, pos + count,
> +				pos + count);
>   		modified |= ni->initialized_size != old_init_size;
>   		if (!ret)
>   			ret = ntfs_attr_fallocate(ni, pos, count, true);

Looks good to me.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>

