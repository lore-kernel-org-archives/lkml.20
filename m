Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A202F1E0DE8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792095083; cv=none; b=XwqNgjk6SIrdVPCePqvACY9W4Ju8yf5SWKOnun3kQt9cC3+XZEnW3HAJE/7oTdFJnuBuE1ku75CvIcrGIiQA33ia6YAgQyMViUC9/g99sSZvicGCf+AptrNoTBEtWoAzeRyi1TXu/57p/Vp9Hw9B4TZdtt9B4nAWQa6UIfXLzbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792095083; c=relaxed/simple;
	bh=0cjDtzQj5UMy2E3ASaXWDeSHqSFbUKEMwrFeDdV8n4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQUO9YpagQnTCGn/EUn/kbvCEBJL5BzhwZx5ttUY5YTCT7O8FOmTeuGVw4kuZFxGgz2BNQPwNKhLpRToc/03JR98lG8kvQvhXlr8zlwk+8DVhddDxa5ikUxGaMLZWTqOl8ZHQ0/r7egMgjQfWfg3zpgmF47oxAd2UJPnWwJUrBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=oCMvojcK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=j46FlG+B; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="oCMvojcK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="j46FlG+B"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C5A6C1400149
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:11:19 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 15 Oct 2026 16:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792095079;
	 x=1792181479; bh=+Woqi/4sLtEaj+YBC5Od6J3p766fldbWDZyQThGuKkM=; b=
	oCMvojcK0uibdtACioQezZRcHW9D/LiBH+z0t1WyWvvsU1367N12sR8bSW8S3RKO
	pbB4dLgNtaiTXOZf0Bs/lUk6yvd+gmNPYCwZ9hsUvs7XtrhnbO6iEJrhs+uhiF+q
	mSIzqOAdGc7grijGLsJ5kKaOG6HSUeS0GwnX7qk/T9PZlPpAzUHmqVNz9LQeYJgz
	5GpoOxI9Wh2k6mo9c7Buux72Txt53JdQLiOhWmLB0ZFTCH5D5p+5Q4qOjpdUx38f
	PPfbu1USFhZoxCcwW+s0v3QdZ5ZyNiVpq/dixLgi6pBr6/AqIpEpXEbBHaAP3NJy
	RBbsc+ktGihMMgkv7g2lsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792095079; x=
	1792181479; bh=+Woqi/4sLtEaj+YBC5Od6J3p766fldbWDZyQThGuKkM=; b=j
	46FlG+BjShtKbxoAZ97fRnMdmWFTOuJj5Zx99kI2dXNswgkzaWH0CYLvOxnTj5iv
	XacprMpTZyAfLZInjIJK1e0MRkq236zQhGVT86Q5XCP//YM7SgXLfTNS7JD5z8d2
	KqyNtQS/4G3CKGI7EZOwW+0cQM9YkMfuOnHJ0t0bklTHK3zjmPWttkMBQ4mwKk8i
	RqYBsEc38i4j9BxP5OlCDGTuwHwB1PCO8AODKf/FyVJeC8dXv+Ow8oP00pMXRvWe
	u4UlhDbPnkEMD6qoWg5fQMTizM7nROeb0CyEN9oUK2+GjdU0HoYwfQTynY/2AUyL
	91m7l1K77pgSZARXqZ+Dg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=bsbernd.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792095079; d=bsbernd.com;
	mf=PGJlcm5kQGJzYmVybmQuY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:Gs9FqNhlzOBWoZGIFnOS8CyNFN2H+VDThIZ6Ov7COMkQM1G
	mkaIH4T10dkI/mKM7CX3mTY7cCheciT+7mAQ8VjELkKlE8cmeFGhTzWeh8m5dvZp
	W6Gu35rbRgRF7P/Qud+FswWRagjo8F6EVDLRBqVsZgHFLAOrhML8fdPyJuPVWzrF
	bdg4E0JkiSy3JFW846VSpca8IhQ26FCSHYKYzjmRnQM7dbRJMoUJKr2DR9v3U93X
	d61z8lcocHf/sHpvTVTXnSyseYcjrX+WA3bqHvy9YgrVYT3vQc6qeGuOZQcdW891
	8zZrjlCjJNU6BRGUUbtoRaZmDvT0W9jHlB0WXjQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:jB1zdGbrK3ahprfwmZa87hOK2sUMFoHxATHjOGwq1Uc=:0cjDtzQj5UMy2E3ASaXWDeSHqSFbUKEMwrFeDdV8n4I=;
X-ME-Sender: <xms:ZzPRajJ-oyq8spNuF2NbGIhvZCm6_13qt7B9tm1HBzyrcq70_FjFMg>
    <xme:ZzPRaorRtkLRTfdsDqsc8xeW60f-xn5t33UpiNoXQxPxLrRSrEkRVVLq5uECQMO7P
    DgwmjsSHbjBuV8dwQL6fDifdL8CNMfhiMkVpdl8TwpsTdgxsKkSQg>
X-ME-Received: <xmr:ZzPRarzwZrQTB5_CETTyPJD7zXSfJ_XtEvp_tm-Z7lRi0PGcBqXBsKFe0xl5V3XTMN4KSI69eapIwck1vChCxMsHd5O1WMxmuZfoUJ8zzKr72Lqytg>
X-ME-Proxy-Cause: dmFkZTFY/y/n7qZIwpGwXRoPkNj4D9jQBbSiP/C6rnrOfHjRdLuM43nA+l7oZ0oWDFdbsK
    LLZNMqg5uPaENG92g3mrcVCURG0rEYqWEJPupsgONpV1ZDUqnzDfSYHFTze6nSRzIgeGhH
    Nx6TAlXiTD/oOyGV9Bn/JLVIrDcCEw43C1Ywp58yrSdp4Cxfq5PAt2fOxN0t/IPx6yqNw7
    qT0vsaAH22UsregXDBafsyZ+QsrQtwRqhGSoHKALpGoN/QEZk155PvvCaw4bipU3ZNFN2/
    Y6mpi/ec6gOxjTiaAJRH1SUyp1KuwwV32AWpsp/DsZEdjoXHoFUztOsi3jaUZJA5gARXMy
    xDvDYzfUlljNBgPtAvhr5teOMgLobp0DnMH+2PYErBmeN61R7xOMJuGGElVHeuseDclr5Z
    +zwD2crxikINeJvkAxN7hSh9GvtpHyjDHkf0veV4nJAK3BTv26c2mCJF2zoQUxikGGyz0p
    tKDqOFjvsyjw8ehIQBy4ghp6jV+3/iUOxWsqFaGRnLuXnf07Xc1WWHRgqXaz2bEn57UYEY
    eknWYkOV4ab5NLZGOugAWdImtbYgNljDXxpSsoXpR/oGRvGsuRpdfdKQScJKXzoWfuPdT6
    A0Mt+CqJsjx6kSUANtSGXPhPfm1Q/hEQGhmEUAWV7fBFThdo2ePxRyGtIzyQ
X-ME-Proxy: <xmx:ZzPRasPBaUXdfbZGny7KZelJzw3WC7gbmiJJzG8vpviEsRpQ_h34TQ>
    <xmx:ZzPRag76GaJC7SfpAR6QykiIYj2tLFbQ5Nvehhulg6E41gvuzspO1Q>
    <xmx:ZzPRallNEfz_vMfCSKagQd9fztaWqpopPdmrFA2sNEH19OJRUDYgwA>
    <xmx:ZzPRapQ_q6OgMVC7P9yK3GdRVq_PVSUlh1-CfuT2L2yco2jg5h1j-Q>
    <xmx:ZzPRak6JOskYQCgcAH-potIarh3oCx6jpVlYcCmCkfZQc6z22UGp7jCy>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Oct 2026 16:11:18 -0400 (EDT)
Message-ID: <07756a64-0356-495d-a8b2-97e0423e472a@bsbernd.com>
Date: Thu, 15 Oct 2026 22:11:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fuse: rename fuse_direct_io() to fuse_do_direct_io()
To: Luis Henriques <luis@igalia.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20261015175856.13333-1-luis@igalia.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20261015175856.13333-1-luis@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/15/26 19:58, Luis Henriques wrote:
> FUSE has two functions with very similar name: fuse_direct_io() and
> fuse_direct_IO().  Which is very confusing.  Rename one of them to remove
> the ambiguity.
> 
> Signed-off-by: Luis Henriques <luis@igalia.com>

I think I had done it similar as part of a direct-io consolidate patch
set quite some time ago (2023/24?), but didn't update it :/
I think I had called it fuse_send_direct_io, but fuse_do_direct_io is
also good.


Reviewed-by: Bernd Schubert <bernd@bsbernd.com>

> ---
>  fs/fuse/cuse.c   |  6 +++---
>  fs/fuse/dax.c    |  2 +-
>  fs/fuse/file.c   | 14 +++++++-------
>  fs/fuse/fuse_i.h |  8 ++++----
>  4 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/fs/fuse/cuse.c b/fs/fuse/cuse.c
> index 4079cf8e5974..01f61fc8e354 100644
> --- a/fs/fuse/cuse.c
> +++ b/fs/fuse/cuse.c
> @@ -98,7 +98,7 @@ static ssize_t cuse_read_iter(struct kiocb *kiocb, struct iov_iter *to)
>  	struct fuse_io_priv io = FUSE_IO_PRIV_SYNC(kiocb);
>  	loff_t pos = 0;
>  
> -	return fuse_direct_io(&io, to, &pos, FUSE_DIO_CUSE);
> +	return fuse_do_direct_io(&io, to, &pos, FUSE_DIO_CUSE);
>  }
>  
>  static ssize_t cuse_write_iter(struct kiocb *kiocb, struct iov_iter *from)
> @@ -109,8 +109,8 @@ static ssize_t cuse_write_iter(struct kiocb *kiocb, struct iov_iter *from)
>  	 * No locking or generic_write_checks(), the server is
>  	 * responsible for locking and sanity checks.
>  	 */
> -	return fuse_direct_io(&io, from, &pos,
> -			      FUSE_DIO_WRITE | FUSE_DIO_CUSE);
> +	return fuse_do_direct_io(&io, from, &pos,
> +				   FUSE_DIO_WRITE | FUSE_DIO_CUSE);
>  }
>  
>  static int cuse_open(struct inode *inode, struct file *file)
> diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
> index 85cdf0199bc0..86e308960b24 100644
> --- a/fs/fuse/dax.c
> +++ b/fs/fuse/dax.c
> @@ -709,7 +709,7 @@ static ssize_t fuse_dax_direct_write(struct kiocb *iocb, struct iov_iter *from)
>  	struct fuse_io_priv io = FUSE_IO_PRIV_SYNC(iocb);
>  	ssize_t ret;
>  
> -	ret = fuse_direct_io(&io, from, &iocb->ki_pos, FUSE_DIO_WRITE);
> +	ret = fuse_do_direct_io(&io, from, &iocb->ki_pos, FUSE_DIO_WRITE);
>  
>  	fuse_write_update_attr(inode, iocb->ki_pos, ret);
>  	return ret;
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 9a36d0329e22..801a2a269906 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -1653,8 +1653,8 @@ static int fuse_get_user_pages(struct fuse_args_pages *ap, struct iov_iter *ii,
>  	return ret < 0 ? ret : 0;
>  }
>  
> -ssize_t fuse_direct_io(struct fuse_io_priv *io, struct iov_iter *iter,
> -		       loff_t *ppos, int flags)
> +ssize_t fuse_do_direct_io(struct fuse_io_priv *io, struct iov_iter *iter,
> +			    loff_t *ppos, int flags)
>  {
>  	int write = flags & FUSE_DIO_WRITE;
>  	int cuse = flags & FUSE_DIO_CUSE;
> @@ -1755,7 +1755,7 @@ ssize_t fuse_direct_io(struct fuse_io_priv *io, struct iov_iter *iter,
>  
>  	return res > 0 ? res : err;
>  }
> -EXPORT_SYMBOL_GPL(fuse_direct_io);
> +EXPORT_SYMBOL_GPL(fuse_do_direct_io);
>  
>  static ssize_t __fuse_direct_read(struct fuse_io_priv *io,
>  				  struct iov_iter *iter,
> @@ -1764,7 +1764,7 @@ static ssize_t __fuse_direct_read(struct fuse_io_priv *io,
>  	ssize_t res;
>  	struct inode *inode = file_inode(io->iocb->ki_filp);
>  
> -	res = fuse_direct_io(io, iter, ppos, 0);
> +	res = fuse_do_direct_io(io, iter, ppos, 0);
>  
>  	fuse_invalidate_atime(inode);
>  
> @@ -1806,8 +1806,8 @@ static ssize_t fuse_direct_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		} else {
>  			struct fuse_io_priv io = FUSE_IO_PRIV_SYNC(iocb);
>  
> -			res = fuse_direct_io(&io, from, &iocb->ki_pos,
> -					     FUSE_DIO_WRITE);
> +			res = fuse_do_direct_io(&io, from, &iocb->ki_pos,
> +						  FUSE_DIO_WRITE);
>  			fuse_write_update_attr(inode, iocb->ki_pos, res);
>  		}
>  		if (res > 0 && mapping->nrpages) {
> @@ -2787,7 +2787,7 @@ fuse_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
>  	}
>  
>  	if (iov_iter_rw(iter) == WRITE) {
> -		ret = fuse_direct_io(io, iter, &pos, FUSE_DIO_WRITE);
> +		ret = fuse_do_direct_io(io, iter, &pos, FUSE_DIO_WRITE);
>  		fuse_invalidate_attr_mask(inode, FUSE_STATX_MODSIZE);
>  	} else {
>  		ret = __fuse_direct_read(io, iter, &pos);
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index c8d4c5f3af7e..f892f60d3d22 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -1167,17 +1167,17 @@ int fuse_do_open(struct fuse_mount *fm, u64 nodeid, struct file *file,
>  		 bool isdir);
>  
>  /*
> - * fuse_direct_io() flags
> + * fuse_do_direct_io() flags
>   */
>  
>  /** If set, it is WRITE; otherwise - READ */
>  #define FUSE_DIO_WRITE (1 << 0)
>  
> -/** CUSE pass fuse_direct_io() a file which f_mapping->host is not from FUSE */
> +/** CUSE pass fuse_do_direct_io() a file which f_mapping->host is not from FUSE */
>  #define FUSE_DIO_CUSE  (1 << 1)
>  
> -ssize_t fuse_direct_io(struct fuse_io_priv *io, struct iov_iter *iter,
> -		       loff_t *ppos, int flags);
> +ssize_t fuse_do_direct_io(struct fuse_io_priv *io, struct iov_iter *iter,
> +			    loff_t *ppos, int flags);
>  long fuse_do_ioctl(struct file *file, unsigned int cmd, unsigned long arg,
>  		   unsigned int flags);
>  long fuse_ioctl_common(struct file *file, unsigned int cmd,
> 

