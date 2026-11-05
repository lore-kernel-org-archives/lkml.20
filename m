Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793847806;
	b=AgW4mN+8o02TZeL/jOLaenZaXzp9qjFrptEMsKLZyKAjuCw//E8VywEJsHAj6SdDXNe8
	 WreSU23YcTMUdgZzCHR9aU10Kl9gIivTuNfjOZeOMpeQVz6iZr0ArXIODTnQWz3l6Kh2k
	 kzqtiZyZxERvGSVG6mdxycEsv6PI+PV2Ua2AwIr4/kcYspNNZKL+OBJBrGaXtt0ktVd3y
	 GNSz5FrjFb7edh6LamVX833s4EdOFaVZ0JyUCXdbGUbbBwGXE6Va9TwSqBgWjcih79fnI
	 7K6EwLayN/TinEv8r0HU/gk/I0kt2CNDYrPjZ9vT3a42DR8u6alwx+B0CK2BJTGpqdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793847806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TmyrGImNoeERgzj0671/YFCWmU7Tn1bl23zRlCFzkls=;
	b=m5rm2awMXiJopCQWCXA/JKP5UR0ZBrA6AB26gGAOulZkyRkHknisDq0Mu5ZfDFfMuETc
	 LIow8zab1Auk0JdkKVYgDZYmWYSjFdObHq56WGA6GcQyVyyyTa4JpU0x/rGu17U1GpqAn
	 FfrWjYAnj8G0tk+5cHx8SK7IUMxqDfsKhjoOSZHMdw0x8KquCj+2eZ8T6xCIuu18rMttb
	 48WTHLGZ99EQ62P7UKS+KsNpuxfQQMg0zuAuJe0deIze7obZsDIyZNxXroz9XmRS9+Cuf
	 QmY2fVp4u8G7SetDyhErqonuhJvwD8taGH5T6ECKttEbM2LjxZZ5z5+5VAAvIFsw6nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.cmu.edu;
	spf=pass smtp.mailfrom=andrew.cmu.edu;
	dkim=pass header.d=cs.cmu.edu header.i=@cs.cmu.edu header.a=rsa-sha256 header.s=google-2021 header.b=HZ0rvCUd;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C53606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52C53606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.cmu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrew.cmu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.cmu.edu header.i=@cs.cmu.edu header.a=rsa-sha256 header.s=google-2021 header.b=HZ0rvCUd
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f30660e69so101705685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 19:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.cmu.edu; s=google-2021; t=1793847799; x=1794452599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TmyrGImNoeERgzj0671/YFCWmU7Tn1bl23zRlCFzkls=;
        b=HZ0rvCUdtiV8k6tqRF6TNPr6BxCfo26C8HCb+SArpySJ7XV0WATODALH96NFOW6e7o
         ZGApbRrZ/QSzYLJ8X4t1ECE/Eu4lMlNDeD5wgFvEw8IqauOWePNXyp9HbuUJ7TnRzq9w
         U3Fio9VNZSRrd/Z/2C9vHTz+SG5PyKTA8gsSf1cbn0lXq0B5Gfq+ofBHPqPkjgfeaBO5
         /DXZLDSD0LWbJgTztTbwX8R2jJ4XcYm23CuYO5ko5CpQToVLBWnMG6CIHfph0jtfZrkO
         8ugkjNiL0OzxmB6W5QvQOvvIzyubf5vGK0UgGFdBlaiG97CwLOofr5AdJpIJv6MOq/jP
         CpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793847799; x=1794452599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TmyrGImNoeERgzj0671/YFCWmU7Tn1bl23zRlCFzkls=;
        b=lR+ov+Y9sMEEziyGCEcpr5J/mdTurZzSGEhcsqB241u1zNYQ4lssDHdX0VO9sQ7HB1
         ubebDcUHfLl1AiQh3OgBFx9ZWZWIgeFc5EDNDCXSOpIipAHNdAfWiy/tkLqOaDVh3DZU
         rN+WMlf+f5NEZtB1hENnt4d74h7o6NCpDvoL+yJhslkF76wGoHv95hXnx/62RXNB8XaD
         J7Fqa7OSP1KfCZpeq5Q8AlqD8j1ICNUtmSaGFjum0KSpPXkkpFTxW4Gtqm4p17E8NjTh
         xj+CuxGg9JtkwYYUTNFDkH/Xd98U3/+E7mZV92qysPE/QuwWFahGJQ7nZxc+whK7MOBP
         qhtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyD9eTD5h1TSe4Crl4g6ozDi5RqKCCAUxnBD/hgqVE4Wd+ZfdOimY+U6CaptuFiWvys9RrW6rTRVfzmQc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nWB29tRVBrUiN4ArwVFbS1CBt4wz9bl8ZozQhs5yMlJ36v52c
	jfN6AZRxxglG3onauQjYN7Mgn9syLUgq6sZ1Gav7RvIGsHUIkGzKpPw+UWBfvga4Zw==
X-Gm-Gg: AYBFou2Iex6XHb1gUYDrkcAuiwe/kf6bNjiZNMqjw/OjadHjDPyvM5aHsrid2VzOANu
	D4mayWY8UXBpOsNaF+UqJWjAQ6sxhIrcEHlUqsMcmZoUOMnTKZhJGt1L0BuEWcz3DLZbhQYXr9E
	p84VBii1dG2eOgSwphmAPY6Bhx3BXfcCzQBbtjJcPv7/QcL3voUPUBDu03h0xVWkvjeubFAI07V
	puNuppW5YyHzsktcOTSp5S+S+006X55EAusiTAZkanT0vC1ZBRGFuJ1OLcoBGuA5DNcyhBvIHBb
	L9sQN+p/tEg7MBXWyHfgiWOm52fVMerC6pvwXNouINeecwslBc38WWmJsYI+VxHdQc0acNHT8cK
	U/S+F6Z0mnKjNBFUMsKYxLqKJp8BXA8cRRGcaG3QP6rETAyL3W32oQH2iRAmPJxHY3Fc7rrAz1e
	lfDbX29w+7skZQgqRBzskHNJeyo/LkJmsZGYpSLCWijP48PxR38qtwjLOK+N2eS7UmP8dOnIrKP
	S76fKAwWIXpQQgG0KtrdwwwORHgkmyT/9flX5JTR1fMSzjeaFMo9FTmmb6d6wUMpatax+JTk7BB
	dg/khglwB5NJxQm1L+WnG6VEyO93d3iwOapm4Lv9koAmuo77DA==
X-Received: by 2002:a05:620a:46a5:b0:93f:2e08:6420 with SMTP id af79cd13be357-94421741ccemr3073423785a.38.1793847799333;
        Wed, 04 Nov 2026 19:03:19 -0800 (PST)
Received: from cs.cmu.edu (tempest.elijah.cs.cmu.edu. [128.2.210.10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d468fbe9sm362171485a.3.2026.11.04.19.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 19:03:18 -0800 (PST)
Date: Wed, 4 Nov 2026 22:03:04 -0500
From: Jan Harkes <jaharkes@cs.cmu.edu>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] coda: honor the append state of each write
Message-ID: <20261105030304.ukyfkyh7xf66yf7w@cs.cmu.edu>
Mail-Followup-To: Hungyu Lin <dennylin0707@gmail.com>,
	viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261104191355.89544-1-dennylin0707@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104191355.89544-1-dennylin0707@gmail.com>

On Wed, Nov 04, 2026 at 02:14:23PM -0500, Hungyu Lin wrote:
> coda_open() adds O_APPEND to the container file's f_flags after it has
> been opened, without updating its cached f_iocb_flags. An O_APPEND write

Why do we now have cached copies of f_flags around? That sounds like a
recipe for getting things out of sync.

Anyway, your patch subtly changes the container file we write from
cfi->cfi_container to host_file and I am not convinced that is a safe
change.

Yes, host_file is set to cfi->cfi_container but then we call
venus_access_intent, which is an upcall to userspace which involves a
context switch and may update the state of the container file.

I am going to have to look at this a bit more carefully because we do
use that cached host_file pointer to get i_size right after the write,
so maybe it is safe and as far as I know our userspace cache manager
only updates in place and never actually swaps the container file.

I haven't looked at this in a while, but I think f_pos synchronization
was assumed to run through the Coda inode, so the append used the
coda_inode->i_size to decide where the write would land, but I can also
see that with the locks being where they are and the access_intent upcalls
that may not be a valid assumption anymore.

You are correct that we cannot rely on the containers open time flags
because that container file was opened by the userspace cache manager
and is passed as an open fd to the kernel.  This handle is then shared
by all users of the Coda inode, so some Coda file handles could be
O_RDONLY, others may be O_RDWR, and some O_APPEND.

So I think the core of your patch is probably right, but it may need
some more careful thought, maybe the use of host_file is ok, maybe the
i_size needs to be copied from cfi->cfi_container instead of host_file.

Jan


> can therefore overwrite existing data instead of appending. For example,
> writing "Z" to a file containing "abc" produces "Zbc" rather than "abcZ".
> 
> Pass RWF_APPEND or RWF_NOAPPEND to vfs_iter_write() according to the
> incoming IOCB_APPEND state. This also honors changes made with F_SETFL
> and per-write append overrides instead of relying on the container's
> open-time flags.
> 
> Fixes: 164f4064ca81 ("keep iocb_flags() result cached in struct file")
> Cc: stable@vger.kernel.org # 6.9+
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  fs/coda/file.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/coda/file.c b/fs/coda/file.c
> index 6ca8bfcb58f2..ae03f0b30d84 100644
> --- a/fs/coda/file.c
> +++ b/fs/coda/file.c
> @@ -71,6 +71,7 @@ coda_file_write_iter(struct kiocb *iocb, struct iov_iter *to)
>  	struct file *host_file = cfi->cfi_container;
>  	loff_t ki_pos = iocb->ki_pos;
>  	size_t count = iov_iter_count(to);
> +	rwf_t flags = (iocb->ki_flags & IOCB_APPEND) ? RWF_APPEND : RWF_NOAPPEND;
>  	ssize_t ret;
>  
>  	ret = venus_access_intent(coda_inode->i_sb, coda_i2f(coda_inode),
> @@ -80,7 +81,7 @@ coda_file_write_iter(struct kiocb *iocb, struct iov_iter *to)
>  		goto finish_write;
>  
>  	inode_lock(coda_inode);
> -	ret = vfs_iter_write(cfi->cfi_container, to, &iocb->ki_pos, 0);
> +	ret = vfs_iter_write(host_file, to, &iocb->ki_pos, flags);
>  	coda_inode->i_size = file_inode(host_file)->i_size;
>  	coda_inode->i_blocks = (coda_inode->i_size + 511) >> 9;
>  	inode_set_mtime_to_ts(coda_inode, inode_set_ctime_current(coda_inode));
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.43.0
> 
