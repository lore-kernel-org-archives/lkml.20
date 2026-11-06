Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977500;
	b=tgEdYZE61axBlyCDCqcXNSI6ddfiJvr0kXvmx6HfeYK02EgOGNrWkIphbRBJOSBK8KuM
	 gVgKoqV0PXTg1Jg3imN2Rc6+aG5/XEe5HpTb/FF3UpbUFilso3mymLoU8h1veU0IwJ7/s
	 zLI2MkhUMXYCTEUsN1Rmwv4IeXEQy6UyO4++BAGkjxL4nuCRq4TkdXGXqTYH10GjbjzzW
	 taPzzzpc9iRNwFJVD6PZB2n4J5QuTFPhpnMSoCZ/XiDSuBl7SvpMhqKWSYahPhaWQo5qn
	 i8pqRwqbsv7ci6U3gSb7b/EQddHcm+DQima3AtEqAmbBCuPBYppGkPGEkGqksXeEmbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pLGPVVC1dvkEe1meLCbPvsKgkQ4CMYaqv2RlyAp9Axk=;
	b=Rt7RQKIkjPfK0wu2EjwMUQeWkZV7NWufSTFb1L2e0QjaWDcqVC5ls6vaAOWvBGm6cLZX
	 YUW08GiC3uQOQ2XiDqbUOEQaGfkBHbDBIAqL/Hz+xLNE8Q1lh3Xm1lJNfqPEnXXaDB+K6
	 P1AG9TZt03VY/3lmRf8BGjd7C2ZuRS9dgtBaT1e9v+gK2ncwFqGP0czDvyqSRCztv+3hU
	 asuOFuNwLNO2Bz8ijGmvELBUVezewnZaMw+Ld7K/hLiMhYChz17cn8EKpSVMLqEUBEge1
	 JcrvpOCsj9SSEsf6+IYLeh0d9rHJ77/OQhz7Uwkq1rq5P8xR4Ftv6RvFXjHx/+shabQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sqM3H9x4;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85829606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85829606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sqM3H9x4
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6fe4372c5f3so490614eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793977498; x=1794582298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pLGPVVC1dvkEe1meLCbPvsKgkQ4CMYaqv2RlyAp9Axk=;
        b=sqM3H9x4opQsS0wUdVh6/HUTWeKevAK0nr7RWm0o9vM3fyDUuXtQ3sTRbB2UjERVzf
         1oFhKwSHyBj3dexkGO/eNBDX3CqW07tAQUv4BjZREyTle+EcyOkaLVXOcaW3PNtumZIV
         9+v2z0djODoLlP+xVBfaX3SZvno3SRMzIg6bTqkG8XN5cXRUpd6T9sg9M/AYpvUS0jgd
         WchohnvK/fPHkd6rjDESlkcZlnA0Kh2Rj+kKyxbsWeAkNAJoxzgWkgWW6P4s11vidbrA
         O1gZ/UpJdxxKiSs7RTI000UoShFCmiz4HuTUm+YCY2vtV2dRfi8XFtRGfFLPi2w4nIAo
         zEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977498; x=1794582298;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLGPVVC1dvkEe1meLCbPvsKgkQ4CMYaqv2RlyAp9Axk=;
        b=njmYTv76dhVrscjkN8MzzRBZfErCAZGWOadSUccjQ86+Eok80cdQhnMvbtLIWvZz+n
         MCIUUqgw9EYs1fBfuhHeyqUZpC8TJVBpXvJbl16WXB65j2GTPVcqFfve15ouQQbxmfZ6
         sVZUfa104SbUPZrcTJFXwjViCkG5uRfaqisZLHYZj3BJ7UpPA/u3rEsZRfW3NjfgH3xJ
         I+Wh3DgH9TVLIsRIBlmnKWO/JB6o415fg1Z6ruh1mVM+ffa3XmsKqfh/hSr8iDEANTMl
         6FVjZXpewuav292CUNbeZZe/puQYTuxSdc0QloWJeclnfO14lv+9nPy7lN24VVtFqVnZ
         /nvw==
X-Forwarded-Encrypted: i=1; AKwUvBxtMXh1n1FW9nlHSBWgksPZ+RS/0c/qrs1PbcLstjK+txovgygZ7BSPaPE47L1tJrOKav7DwxD9J3sD0lI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0T0uRAx4Xb2u7ep/CYbg0gmzEcxQhiwJmaYk4E52yY2s2HT28
	6utp63MsxoPAjIQEH5tWXD0HYClbtJIura/09qz3T/8oDNzFpILONlou
X-Gm-Gg: AYBFou1Cts156tBEOd+udZs8CMOf4mWmZIPGFuFVzxX4+tBnnPfW6oH6djxAjiBizUK
	TA6kbUtG//UBlsLFolms13yk0wu1zMrnRONN+9u4FDO6+ZkAOjulwhWMqJMT4iqF8QLDXhVhUHt
	dH20ry3NoOPOFvx3qVJVYr6508C87stfAvKW7Zev/3k5fec82vHYElTR8412SaKiilb45AgNbda
	C0Wk/cPKMCO0I1JyNLmLhFQ1hF9qBlbpNpPomTm5QXJfWmLdRBBItpB6H4VP9lWRDv0L6z6OE35
	FsfypJ7xuUyoUFZrAEZifmUF5QZ3igUjTRkb9yLn0kLcaWXXXFQY3m5Mz2rCTTc+fSkLzb5ZfFB
	RnKJmVnM2UjByJGtmO8lZ6sZEWVLZ/MgvfzvX9ZVNV876C/x9HbwovwOl4voBqJkhMeCsfIDmaw
	6sE5PoWiUreYuXsLUIQ7dVl29IANHXLE5vXjYwv0uoO/5YjVnERk6/Hq7vFBLc6r2oVC1Vfew+x
	1OzsVfs+zN65Z4Y0zrLuonYqWrRrFnSeHDSyFBJ2G0Dh+RByuaVVXNKl0/MJ6MEcpvKPzXAdizK
	wEy53XVXSHiSSyt+v8r8JkQEc1EaZqF6ASim9Vz4wnyL/uwvjtcTf3fwBZY6A9tvwLZjACi4ew7
	9UlQ7Eq0lvN6B4vrR9vhbHOwYxSNq64vyN3d1KoIhhmR28touLJqv
X-Received: by 2002:a05:6820:c30b:b0:716:caab:533f with SMTP id 006d021491bc7-716e790efc2mr1183046eaf.23.1793977498432;
        Fri, 06 Nov 2026 07:04:58 -0800 (PST)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97887024sm2384074fac.5.2026.11.06.07.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:04:57 -0800 (PST)
Date: Fri, 6 Nov 2026 09:04:48 -0600
From: Ming Lei <tom.leiming@gmail.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ublk: optimize ublk_queue_cmd_list() for length-1 lists
Message-ID: <au3skE6GvVt6SNx3@fedora-laptop>
References: <20261105021351.2295547-1-csander@purestorage.com>
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
In-Reply-To: <20261105021351.2295547-1-csander@purestorage.com>

On Wed, Nov 04, 2026 at 07:13:49PM -0700, Caleb Sander Mateos wrote:
> For a request list of length 1, ublk_cmd_list_tw_cb() is more expensive
> than ublk_cmd_tw_cb(). It loads rq_next, which is in a separate cache
> line from the other struct request fields accessed in the dispatch path.
> And it dereferences mq_hctx->driver_data to get the struct ublk_queue *,
> whereas ublk_cmd_tw_cb() gets it from struct ublk_uring_cmd_pdu
> alongside the request pointer. On the submission, ublk_queue_cmd_list()
> can cheaply check whether the request list just assembled has length 1.
> So pass ublk_cmd_tw_cb as the io_uring task work callback if the list
> has a single request and ublk_cmd_list_tw_cb if it contains multiple.
> 
> Collapse the req/req_list union in ublk_uring_cmd_pdu into a single
> field so ublk_queue_cmd_list() can store the head request to it in
> either case.
> 
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
> ---
>  drivers/block/ublk_drv.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
> index 3d322fa1bc83..c397e354a7d6 100644
> --- a/drivers/block/ublk_drv.c
> +++ b/drivers/block/ublk_drv.c
> @@ -117,21 +117,18 @@ struct ublk_batch_fetch_cmd {
>  	unsigned short buf_group;
>  };
>  
>  struct ublk_uring_cmd_pdu {
>  	/*
> -	 * Store requests in same batch temporarily for queuing them to
> -	 * daemon context.
> +	 * For ublk_cmd_list_tw_cb(), a list of batched requests queued to
> +	 * daemon context. For ublk_cmd_tw_cb(), a single request.
>  	 *
>  	 * It should have been stored to request payload, but we do want
>  	 * to avoid extra pre-allocation, and uring_cmd payload is always
>  	 * free for us
>  	 */
> -	union {
> -		struct request *req;
> -		struct request *req_list;
> -	};
> +	struct request *req;
>  
>  	/*
>  	 * The following two are valid in this cmd whole lifetime, and
>  	 * setup in ublk uring_cmd handler
>  	 */
> @@ -2104,11 +2101,11 @@ static void ublk_queue_cmd(struct ublk_queue *ubq, struct request *rq)
>  
>  static void ublk_cmd_list_tw_cb(struct io_tw_req tw_req, io_tw_token_t tw)
>  {
>  	struct io_uring_cmd *cmd = io_uring_cmd_from_tw(tw_req);
>  	struct ublk_uring_cmd_pdu *pdu = ublk_get_uring_cmd_pdu(cmd);
> -	struct request *rq = pdu->req_list;
> +	struct request *rq = pdu->req;
>  	struct request *next;
>  
>  	do {
>  		next = rq->rq_next;
>  		rq->rq_next = NULL;
> @@ -2119,14 +2116,16 @@ static void ublk_cmd_list_tw_cb(struct io_tw_req tw_req, io_tw_token_t tw)
>  
>  static void ublk_queue_cmd_list(struct ublk_io *io, struct rq_list *l)
>  {
>  	struct io_uring_cmd *cmd = io->cmd;
>  	struct ublk_uring_cmd_pdu *pdu = ublk_get_uring_cmd_pdu(cmd);
> +	io_req_tw_func_t tw_cb;
>  
> -	pdu->req_list = rq_list_peek(l);
> +	tw_cb = l->head == l->tail ? ublk_cmd_tw_cb : ublk_cmd_list_tw_cb;
> +	pdu->req = rq_list_peek(l);

Both callers guarantee the list is non-empty, so this is fine. It
would be a bit nicer as a rq_list_is_singular() helper in blk-mq.h
rather than open-coding rq_list internals in the driver, but not a
blocker, anyway:

Reviewed-by: Ming Lei <tom.leiming@gmail.com>


Thanks,
Ming
