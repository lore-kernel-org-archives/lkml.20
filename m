Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793248096;
	b=kqS2XMNv868iUMZIvXMK/ITuEFqzhQuIbWUvCiodu1c5OVewnWDe/fCnqXDz5n2sTCbt
	 ZZ1dFGaMYqQpuDAc8ddvaHY9dflagC72/GSTLgepfPvSZ5L22R312MIrJwG/h1fLqPhr4
	 YszWfB2mOoyRKKaDDtok23EtrYJq+rBxFeDidhbmdzUWDP4jJIHA4e2BKXXBDxgIntkTT
	 N5ljGYXPmZ1aFxUuEV5xzjDtGNdfthsUxshrBOzDTy9LZeQYL/ILETYN+5HuL19mhcbge
	 ivrMYG5sEw+o5CYrXe28FZiP1eP+EQ9h22BdnZdOwLXVFBzL2cIjG1+35ABUUxrOepw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793248096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CSHf8I62FhzeLncTYbcQDe6xLWKGa/E6H6jtHXh4bkk=;
	b=0DYsWvxuz7t8lCKiS8xoGoWBMjuQUZSJUEyp3JE0N/nIUxAOZHrQrsTd+ARxn/mAikDJ
	 oM4bdAo0TRz+Fausbjiwd+ch5axrPVLvdEpTBirjZll1yWptxVO0dZG2JlqpshIASQaVJ
	 hqckCt4n8HigI8kK91AzD6Ukev3X1XntYXKEnKR4krZV2FcmMyt/53gDu6KmQIHrpCuDz
	 lUsUTSky7pFKlONePtTXdv2dr5cze+5NZK6udrWLAXkJy74mi+LFbYNDycTSbkFSRlw4j
	 SrU+TDo8IaSdJukGlq850nCr+UyO6Yrrckb2r+16q7POr4oX06SmHgPfZePMzKGwQvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zwYgkpzx;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5D4606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C5D4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zwYgkpzx
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-156cbe59524so1982942c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793248095; x=1793852895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CSHf8I62FhzeLncTYbcQDe6xLWKGa/E6H6jtHXh4bkk=;
        b=zwYgkpzxTsC5Kk2+OWJpbf8FhZQj3lq+cEqtZH3GV1uqYDaCNGISxVylEDgZfflGYC
         p2YmEO7+t9zn55dXjEYlQbzuefzhD0Ux4k6Rbkj+JI1pgl2pdWTIJk/yt03KswlAhCd/
         MdtsA9jBnGPxgQHhjCbvEWF8nyBmeXPNdfLHxcuNwG8ldMDTF1+CwvxQn83p50li6vs0
         WXB7S1yjojswws7fIVaR0OZvMuRX2kx8+zYLdigK0yPMRL1jNnNwv8MdKls9xO+N3Pxc
         GAmDt4FKPoZI00WdREVotopX8MfPlYTV149DqIQo1XsdnogK9losd7UdruTE53GF569o
         DYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793248095; x=1793852895;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSHf8I62FhzeLncTYbcQDe6xLWKGa/E6H6jtHXh4bkk=;
        b=QW/II73jRecNMFti/z3l4QHlyRGXykl8abeYk/fek/aZSIUWavtplb/Ev6QD9wK0b1
         JA1bYqf/FKE29oTpRZ1ADqQrF1Cz4cztZiTi2cURPK/0/NnQtVZEUvjge4RA3uUyeFEe
         NVRGGv11HHgZ3arkmjL4m5NZxNoD81mBfvWSCLzfPSeFQhfTtEvOliuQQiQr+nzgM7P1
         P8dMfrXboovTXkuHqBn4IyfgC9g4shMX5WDvp39h9JydUWjE6mD9of4DJxiZ72vHgmmk
         60/LBvX5IAlPzBnudhF0FBOp3TA1ZSsE+u3MxRWLjBkl6XVIRcb4Bo3GR9SA8hTBAjib
         OTIg==
X-Forwarded-Encrypted: i=1; AKwUvBw/e6x6n7pBmQdGcB8wEFKsAhme0zzbj7PJpd6s0x1DauuEsvJyw4dW+CdbbXrgG4FB3vQ65dyXjwR8j90=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiPDiygd4KYVkiDdj3B5KkeBc8UEl/5fgkL8m8ELMIW/SSKvyy
	DsS+qMQTIzQYafhoNZOgKwFM6+TeTT8mZ8OLe21rixCeI64y1mTmh3Vj
X-Gm-Gg: AYBFou1sitUnMf/9g5OVGoXN+PiPCZdHKyD1exgsMAoPjgdu0L+elogAbklKCeXOnkJ
	LEkdTEgTtZcKIEeBO4OtUkkEOy/W0gdH6ePudwzwGCnMTo+H8iXHcp5saR7d/42KJIbkBbC+dKK
	oalJWJYMk9acoetDO7u1NR7Hhmt2bwZL0PPrHYuA0ZpQkHn6Y5zdmrgoqZ0kIemA/FRvBIotFe/
	6JPkts9p4NiQ4PloXEelhT2CvJqDuNk6kNeoaoiB/JHTJtxh0FcEOrgywQpDZCosaY/SJDjzAu5
	bijlNxezgtz+pfGHQDPT+1Pwek9gzmMzggcEc6j8+OSdwfDwPaccOOp1A0RUktGLwQEFvamciZm
	rxsdCFFOz/xmdj7NIgqS6q3B6Mo0886LMyISLHEV7McPj/lF3q9Uz0slB99+y11TFQgKM67zlvO
	HSuy0oIr3EqaEbh/LDo00KG6JBkH7l0bZ3+b4IVsQH0iojbzgW/2BT/LM82w5opIUppM3znnOa4
	sqsxxvTuQEmbozutRgt2Dq6vRBhrEqe7QD6SJ4ogLR71Ul9LRhqvfSDG/qZnKQ3fFgglsICAR4i
	4oUAbxT7QsLA0i7VWgo=
X-Received: by 2002:a05:7022:f502:b0:16a:8ffd:4977 with SMTP id a92af1059eb24-1a6ce113cf7mr5846676c88.17.1793248094861;
        Wed, 28 Oct 2026 21:28:14 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e0098basm10515062c88.12.2026.10.28.21.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 21:28:13 -0700 (PDT)
Date: Thu, 29 Oct 2026 13:28:10 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH 1/2] ntfs: keep the file size on a failed
 initialized-size extension
Message-ID: <auLLWhcN3xKsSdB6@hyunchul-PC02>
References: <20261028080656.1027283-1-zenghongling@kylinos.cn>
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
In-Reply-To: <20261028080656.1027283-1-zenghongling@kylinos.cn>

On Wed, Oct 28, 2026 at 04:06:55PM +0800, Hongling Zeng wrote:
> ntfs_extend_initialized_size() only extends the initialized size and
> never changes the data size, but on a failure it calls
> truncate_setsize() with the old initialized size, which shrinks the
> VFS size down to it and drops the page cache beyond that point.
> 
> None of the callers rolls the shrunk size back.  A buffered write
> into a hole has nothing to roll back - the data size never changed -
> so the file keeps the shrunk size even though the data size on disk
> is intact.  The mmap and named stream callers return without any
> rollback either.
> 
> The sizes did not change, so nothing needs the shrink.  Remove it.
> 
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/inode.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index 206db4e99ef1..ac13e8776909 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -2599,8 +2599,6 @@ int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
>  	mutex_lock(&mrec_ni->mrec_lock);
>  	err = ntfs_attr_set_initialized_size(ni, new_size);
>  	mutex_unlock(&mrec_ni->mrec_lock);
> -	if (err)
> -		truncate_setsize(vi, old_init_size);
>  out:
>  	filemap_invalidate_unlock(vi->i_mapping);
>  	return err;
> -- 
> 2.25.1
> 

-- 
Thanks,
Hyunchul
