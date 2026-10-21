Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792547582;
	b=SVggVOAzBB1AJhkaD9f7nVEKvny6aqqNWWLaSD6a9oUSusuGRjBOSoPs/njBBHEfbhTf
	 owYjBlHurDp6RYLDjU3yOymHDliSljmdNbGg2Lxe1wJ/LDR7pSYBiD8jnRZVhrrETL+N8
	 +pkI/FyD5OWHWsJY8oLz3mCdJ0+K4gKNVn8E+CUN8H50aE4pzEj+VaEZFiav5Z106pmZ2
	 RsbJNsYYoEVyZX42KzMIIr7//00sGs2MVbDgeOxsYWIzDlA9M6YIw8wxM+JytLc7c+BKL
	 VwlcYC1SQ0GyJ36uhg3B8CKt+WLsuJ4Q6TsvuBfyBsCzmR9Cp8LnWX3w9cz7eajxe1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792547582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lUdkRlQgwnmHOFGiCmmSMlV7jPJXmxW++5RTSRjhOKQ=;
	b=vHR2UDTovJnfy0LfZO5Qtz+BAp9PVJpHILqPZ1IQSadRE9ezUIeV9fH07J9QZLa/JX8d
	 EetwY3rZ0yqqhwOWY4t42zJt1AJtzA0Vbwe/17IujlLTYdjz/Qup5Cyp1D1eTr9YLJi4l
	 UMs9szIzkLwK/EQax/CHbcr5EjJNPVtIknnGwldQS/O7GnUtzuF6q5XnsgosGzgbts344
	 TJpBu69xL9biBN2B/Hz7V6RR/YtcfV9B0bJr/skamZI25eRgzcvGgLABvI1rnFsm92YtH
	 vWyxflDYEgbIDLdb23obOpSYN4fCX5pHDwu+jOdeiSOPGnJmb6PKWTm85TT3LvJOqWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P+2emDlt;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5D7606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB5D7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P+2emDlt
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e98798cbddso898915ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792547581; x=1793152381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lUdkRlQgwnmHOFGiCmmSMlV7jPJXmxW++5RTSRjhOKQ=;
        b=P+2emDlthvi2c/4N+rmBLwakNCtZGgRsA0gYhZQJ04ldMP2zgWdkHWihF/RJjVNCiq
         mdPsg9Rownefg7OTNn/MiWcsuvdcArFi5z0kX3ROYWzsl2g/1j6Vw4fDel4XvxOX9qEN
         4nzMPD11nbLscb8N+hwDGcHb9An8WuuCNMFSmASwGMhm8NgAURl6fjRcegNZxSG5Eqcz
         L87Ok8mnSuE1nJtNvo0xUXaYH8xDO6Ki/U6Qll6ygIsX3Vwe+tF6kof5sTdLOfPyXbtQ
         RP19sxTe65tBMb1F+nSaSOKIJ3zuaq4c31EWKOmBikY/8Ql1RVPanJDmCpTdxfviTHl/
         Mkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792547581; x=1793152381;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUdkRlQgwnmHOFGiCmmSMlV7jPJXmxW++5RTSRjhOKQ=;
        b=k6pTBnNyNcAPe86B2DJodtfJp1cWttgHfV9+tST+PEqyuV90/ypLaGCu0sTdlRXrpH
         +d/914deHxriqIcrZR6b0M77GKsGcFYjsknp/rW3L4NJ/AxBS3srNv00ll9egeXEu79m
         fVUc020IaM6CiO5SO6uqZFhI48Cs79/IjqEH/nzehTXtZ+A6sJtSbYYV7xRKa1ENLgTl
         kfJHm4OmG/cFGjusSiXhHeenxdQmFatk0tmxerNY9xMxRW8eGRgclYNeR9fFQpZu65eQ
         7Z++JU0qiuEqslfXe6AxDwmNY7HCU6DR+gdq/2N82pyjhpU/W0qTo5eEsWydxTTlRcRV
         fnQw==
X-Forwarded-Encrypted: i=1; AKwUvByAx0berQnXwQE9KaYeiPivfeuq2TNEbbqGn+UYuL+KgdmhwJl+Pi6nlU2O1j2xNflLJEkze9UUAJJURFE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdsBWYtG7FbqHA7AcN2ltlpLR/XglH++X4TdSAOIU1htKxG176
	QTRMh8cB9ijFRgesveBwR/OSg7go0ZPjMcfH8GnB3Y0dcJWzo8Ge/idw
X-Gm-Gg: AYBFou0/3HsBEkhhDRcrAm5mpIoYrJ5WPJ047jpXrMCmFaQA+gLtOnXGpXKJWObLj9A
	MKMvYK/qxF0/1aCl8PEKG++9Rxsg2H8C+lh6al7znOpskVBdZzwx33ZtcpIymjKUgU/iQaFLLUg
	h7zY1KobtQ5GMUAdUhWo2VjQUspobPOO1ZigscUbDik4b7SXwSQfVdlxwdfmAcuRAegyZPKMXY8
	R7DmvmL68aB6EaPdCHOVa0nnRx9+go7ZC5WbnpXzCXe3I+xJRJb4FVAKfZR0th3/l/aRO0KGaM2
	CmTddtzjJuCbyBt36uQll7ajHr3LJt9IrUENjASgyTgP9I9JrU4U6yxGPlEHMxQg2i+QVPo39+n
	GOr7H/7FuyqVFUgLrkACJpiKEuxAmHS2XcmL9IuKcIUSekpjqvQvA6l2B4oHoKbkf4kUL+1Z9To
	hp/WEngdlWYxf8Lbrf6Rwrajt6RaH2fgmoDEVpTofyCPo9p96Md0VrtWeig2NTABQl6bc4frm0h
	6lBK18whA5pW+yqxJPYzPFkEj0r5uVoNgfGqZrfs41llOTEvkb2DkPyfR8ABhtQ5CQ=
X-Received: by 2002:a17:903:1ce:b0:2e6:913:57ed with SMTP id d9443c01a7336-2ea43d3a661mr4864595ad.14.1792547580903;
        Tue, 20 Oct 2026 18:53:00 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b307c38sm4827445ad.6.2026.10.20.18.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:53:00 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:52:57 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH v4] ntfs: handle a failed size rollback in the write
 error path
Message-ID: <atga-YNByHiwk-y0@hyunchul-PC02>
References: <20261020070641.793832-1-zenghongling@kylinos.cn>
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
In-Reply-To: <20261020070641.793832-1-zenghongling@kylinos.cn>

> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index d810ca5904bd..ad032cccfb15 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -934,23 +934,46 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  				&ntfs_iomap_folio_ops, NULL);
>  out:
>  	if (ret < 0 && ret != -EIOCBQUEUED) {
> -		if (ni->initialized_size != old_init_size) {
> -			struct ntfs_inode *mrec_ni =
> -				ntfs_base_inode(ni);
> +		int init_err = 0;
> +		int data_err = 0;
>  
> +		if (ni->data_size != old_data_size) {
> +			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
> +
> +			truncate_setsize(vi, old_data_size);
> +			/*
> +			 * ntfs_attr_truncate() would reject a compressed
> +			 * attribute.
> +			 */
>  			mutex_lock(&mrec_ni->mrec_lock);
> -			ntfs_attr_set_initialized_size(ni, old_init_size);
> +			data_err = __ntfs_attr_truncate_vfs(ni, old_data_size,
> +					old_data_size);
>  			mutex_unlock(&mrec_ni->mrec_lock);
> +			/* Like ntfs_setattr_size(): stay on the durable size. */
> +			if (data_err)
> +				i_size_write(vi, ni->data_size);
>  		}
> -		if (ni->data_size != old_data_size) {
> -			struct ntfs_inode *mrec_ni =
> -				ntfs_base_inode(ni);
> +		/*
> +		 * The shrink above may leave the initialized size above
> +		 * the old one; ntfs_attr_set_initialized_size() rejects
> +		 * a resident attribute.
> +		 */
> +		if (ni->initialized_size != old_init_size &&
> +		    NInoNonResident(ni)) {
> +			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
>  
> -			truncate_setsize(vi, old_data_size);
>  			mutex_lock(&mrec_ni->mrec_lock);
> -			ntfs_attr_truncate(ni, old_data_size);
> +			init_err = ntfs_attr_set_initialized_size(ni,
> +					old_init_size);

The shrink above can clamp initialzied_size to old_data_size. If
ntfs_attr_set_initialized_size() fails, the initialized_size remains
instead of being restored to old_init_size. For a compressed file,
this can expose stale data.

Could you restore the initialized_size first and perform the shink only
if that rollback succeeds?

-- 
Thanks,
Hyunchul
