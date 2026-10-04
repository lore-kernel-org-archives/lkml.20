Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7473D421251
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 13:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791119066; cv=none; b=LhMrp7NJXQ5UwyfodjJ8yUndwzHeVTUIuIvBlznKpcW8XPzogx1wgIViOn7qLivM2ut7SEHG81vShI0i4cN+f88acoP+TF3+IyNgZ47N4amB6/1DQrCZFxKGYFK8Y0G+T/VFVtOD6mS9g6sC+WRe5mtZDS7kGkHLh9n0HwjcDNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791119066; c=relaxed/simple;
	bh=7anAYD/6TRMXLRUH246n3DaplZOuPGwjq6Ld4ohe3W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=blNxEb0i4tNyp4XMl8K6Kir25SQ51GxRrC1Y31ZxIPdNiwEFvYeBaAZ+s0I0gj9+oi7HN9p09aeJDfBU2/mEYbF9wHF/V3qG4LNB0pPawXogGD8dtB0NIuHs+XgCCzZdgpqUhUbeAY0HYPmcT5w3eIUs6OIXmkFuAffnLu4zK0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A0rzJtEI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=liMTBQ0v; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A0rzJtEI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="liMTBQ0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791119063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b81/l0OmO6iEtzu5AbsolvHlUCUYYBliPDEbzdU8/ic=;
	b=A0rzJtEI52cIs3rR7eovJU8Z2wWrJEOJ2zM9DD6a0FqYT2iAaohRc5eiRJQmluPJT/STXw
	L+YSRvrq5kuLDMHoaU1+JnmGbC0tQd4fZmJeVEqqU0HgBKhm3TP3k7xVb39xloDhGtKUBq
	PjbYqVUgzoshaNOXz56Hi0w9Yq3x+3w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-QTUumn3sNNyTuUKEQeihJQ-1; Sun, 04 Oct 2026 09:04:22 -0400
X-MC-Unique: QTUumn3sNNyTuUKEQeihJQ-1
X-Mimecast-MFC-AGG-ID: QTUumn3sNNyTuUKEQeihJQ_1791119061
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49e6862e924so10549915e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 06:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791119061; x=1791723861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b81/l0OmO6iEtzu5AbsolvHlUCUYYBliPDEbzdU8/ic=;
        b=liMTBQ0v7CWnUVgHKEWaz6IE596cHT8pE7Vl5fc2ijdDEnkcPc7pDusH5ZArjfs/Ne
         t9g56cVD2KmHnzYR3ND127/JPIdYit2tN0iqM/VvLiFdakuf0fYUDQhYS+IdvZon4cro
         oTGeabVtGHk8K6hRRZLc40sp9UHcIXww+AzADdGkQctLI3zmXjUGM4YRkXpUoG2Z9tEo
         f4Q04q3bpH56M9JKl9qH06Jm1vJpOUt2MyaUUlqBVBzKL9K56rPHWS6lx5L5Ti0L2nXm
         U0WqtyqECR8ZX39BaGTN69pwLvbIcTfIa8gmmG8FcB9YboTez9KIrTB4ZBKFSKRdNVjg
         9Mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791119061; x=1791723861;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b81/l0OmO6iEtzu5AbsolvHlUCUYYBliPDEbzdU8/ic=;
        b=Mi2Bw7fpF9cgMIRln7ib5WkF0HCfEalRss5MQBrSO7c59v3jDYvCpAp798biy9u1lQ
         BSWUU/VLfowiQGyqwFKElVZkHAv2jOn/idyO3ULYfqFcwlcGBFdjNseHoOmqPswobb7d
         9gV3zS1KvO8zHnIaKHlXf2ZCfXeXYAxzTl+mgWkE1jMQX5LQR06CjeDi5OY8Vbhe4+N2
         jxhMxHkW7pB5hCAt54FXcCl7Ryfsu/EQiH/9RZbcTwYF/pAq6Bodmg2ysmxZOiwryBGV
         S8BEsB2pPapJvYOD4QbLOK2xbdGLcgZ+SjmpznKvoNNmDGIAvKDjKLXL9w52znz0prYh
         yacA==
X-Forwarded-Encrypted: i=1; AKwUvBwx3qAUc+nDbL8K5i8XQSviFSHbGzHFGi8dIvMu9bv1YL2hmLzSuv6nTYyviCDHxvqHnZxxWheUBYRAisg=@vger.kernel.org
X-Gm-Message-State: AFuF++k/gMVNeJLJ3nkdQbbBnx5uuCocjY4IahoK+sL7b2teWHb+M2eG
	RDYPS0Opt3zQmTlqC83cyiG/4TZ1SgaTLHxZYJbdEuumf2smbH4s9KWcFQTNR44UoP3w2iekzPx
	7fn2/odTiRwxbzyYEmxtTa4KGsEK1AY2BgeUy0WI3iGEWRNfmw9sC3ALQKGdnyauQyA==
X-Gm-Gg: AYBFou0iI7j836BMaPmIIFrTLZxFnq6e8WcrHTjvu2uu+ia+fqAKkdx+o5vPaBBqM2J
	F0KL/T/Tkdg8BID8p1kujdIn4o30+EI3fBK/m87j1oCCs+2jBdW+AK9tm3B/CKNW78G5JwqNlsb
	SC/fwETaKFlZ6etLBZnbcKaSXMlD2mlbgCa3MRdWC+1SnyAm1SST0nPpD9Iy9Uu4zz9ZfSIdPwZ
	CT8WRoPbh7b4XqXRM3cwmRxt0sCcfQhyoXlBJxSkHMkl6CCW1sSC/4RknulBvHfGHMNEd/vUnfy
	X4NUIqNgigsmVUqPwwAqxnVXWGRa1FYrzSHWCRqHPX+NsJORvKYobLNPx5MEKYQGqzJRVuKr
X-Received: by 2002:a05:600d:3:b0:4a0:25db:4591 with SMTP id 5b1f17b1804b1-4a1680f7aefmr63834665e9.23.1791119060779;
        Sun, 04 Oct 2026 06:04:20 -0700 (PDT)
X-Received: by 2002:a05:600d:3:b0:4a0:25db:4591 with SMTP id 5b1f17b1804b1-4a1680f7aefmr63834285e9.23.1791119060264;
        Sun, 04 Oct 2026 06:04:20 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73fb:d100:601d:d7d4:d03f:527b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276f92d9sm240649945e9.4.2026.10.04.06.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 06:04:19 -0700 (PDT)
Date: Sun, 4 Oct 2026 09:04:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: sungbyeongchan <tjdqudcks0424@naver.com>
Cc: German Maglione <gmaglione@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev, fuse-devel@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] virtiofs: validate fixed-output response length
Message-ID: <20261004085805-mutt-send-email-mst@kernel.org>
References: <20261004123405.586168-1-tjdqudcks0424@naver.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004123405.586168-1-tjdqudcks0424@naver.com>

On Sun, Oct 04, 2026 at 09:34:05PM +0900, sungbyeongchan wrote:
> A short successful virtiofs response can leave the fixed-output
> portion of the request argument buffer unwritten. The completion path
> nevertheless copies the full declared output to the request destination,
> allowing stale allocator contents to reach callers such as
> fuse_statfs().
> 
> Require successful fixed-output responses to contain their complete
> declared output. Continue to permit a shorter final argument only for
> out_argvar requests, and do not copy output arguments from error
> replies.
> 
> A header-only FUSE_STATFS success returned stale fields in nine of
> nine calls across three boots. The patched kernel rejected the short
> response in three boots and preserved complete replies and existing
> error controls.
> 
> Fixes: a62a8ef9d97d ("virtio-fs: add virtiofs filesystem")
> Signed-off-by: sungbyeongchan <tjdqudcks0424@naver.com>
> ---
>  fs/fuse/virtio_fs.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
> index f15e516ebcb5c..288848f23e7ec 100644
> --- a/fs/fuse/virtio_fs.c
> +++ b/fs/fuse/virtio_fs.c
> @@ -730,6 +730,10 @@ static void copy_args_from_argbuf(struct fuse_args *args, struct fuse_req *req)
>  	unsigned int num_out;
>  	unsigned int i;
>  
> +	/* Error replies contain only the output header. */
> +	if (req->out.h.error)
> +		goto out;
> +
>  	remaining = req->out.h.len - sizeof(req->out.h);
>  	num_in = args->in_numargs - args->in_pages;
>  	num_out = args->out_numargs - args->out_pages;
> @@ -755,6 +759,7 @@ static void copy_args_from_argbuf(struct fuse_args *args, struct fuse_req *req)
>  	if (args->out_argvar)
>  		args->out_args[args->out_numargs - 1].size = remaining;
>  
> +out:
>  	kfree(req->argbuf);
>  	req->argbuf = NULL;
>  }
> @@ -762,7 +767,9 @@ static void copy_args_from_argbuf(struct fuse_args *args, struct fuse_req *req)
>  /* Verify that the server properly follows the FUSE protocol */
>  static bool virtio_fs_verify_response(struct fuse_req *req, unsigned int len)
>  {
> +	struct fuse_args *args = req->args;
>  	struct fuse_out_header *oh = &req->out.h;
> +	unsigned int expected;
>  
>  	if (len < sizeof(*oh)) {
>  		pr_warn("virtio-fs: response too short (%u)\n", len);
> @@ -777,6 +784,25 @@ static bool virtio_fs_verify_response(struct fuse_req *req, unsigned int len)
>  			oh->unique, req->in.h.unique);
>  		return false;
>  	}
> +
> +	if (oh->error) {
> +		if (len != sizeof(*oh)) {
> +			pr_warn("virtio-fs: error response too long (%u)\n", len);
> +			return false;
> +		}
> +		return true;
> +	}


What if oh->error > 0?  Won't we still have the uninitialized problem
then if callers treat it as success? E.g. the ioctl path seems to do
this... Maybe reject that? Or oh->error <= -512 for that matter, as
fuse_send_ioctl does?


> +
> +	expected = sizeof(*oh) +
> +		   fuse_len_args(args->out_numargs, args->out_args);
> +	if (len > expected ||
> +	    (len < expected &&
> +	     (!args->out_argvar ||
> +	      expected - len > args->out_args[args->out_numargs - 1].size))) {
> +		pr_warn("virtio-fs: invalid response length (%u, expected %u)\n",
> +			len, expected);
> +		return false;
> +	}
>  	return true;
>  }
>  
> -- 
> 2.43.0
> 

