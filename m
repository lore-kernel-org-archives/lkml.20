Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523031;
	b=Cgv0R61jFK8SeUN3qrDJHKCIiMToS/jKgEQZOb9xK4fJc4cL8d+Eiz0e1obE1ZFPriu+
	 BfsqVueIJLd5QqkPEykiuEIJ+aHI5JC8E+sguPWDJRPZKwW8kfnEyRUf2U1TQNs6/40vJ
	 ChNzwXag3uQdTqFJX14h9TJAWd1o1cODD0PtRLzYipi59NOn/5Cr3AITrEQpixXc6HGfD
	 uNUR4l71Sf/J3nCdKUFCJVENt9jT7nMO9jzRPTw3tRFgFuHJddht4aNFwGOEkgP2nipQp
	 BP3ScLDVTOI8w045jjsZEwtX4Yor5Vcbiz6wbhpfpTLwHZSu6WWF8t5zLlZh2l51lDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=nkTkVM1BqTIke4IbVhNaX7QuexqhYsgSxpWyCcqgwJo=;
	b=BkyW5hP6hQsvBGody5PFmWuIFW3nZMuycxLXm2z3//a/7dulPpHqcNFyhSdWM9zihB43
	 RsyvW7uZipL/zz0Rd7OHnlwiwgP9d4y4SziYCpem/DAQPLcnej1tHpYxBmiy/elUfecA1
	 99bCbXkOQFx3Hz+Lr2x1FQrgW9rkPkRpMzdIrg5qpHvUAPhTU7yl8+ncaxL1GNYlwwjv1
	 +PtUOmlFMga8nDYsbdElao0/tGViuR65iZBWBbu08HZwjmEXljK+w/P+a2ugnviHktkAp
	 WGaE0KxMeAzsA49l6FZzMpjbQUGQRgux2ILOYC/UD5WUNn+qF1fwH4CcZXe/UlquMZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXGlHYNJ;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919DB606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 919DB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXGlHYNJ
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so129730f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794523029; x=1795127829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nkTkVM1BqTIke4IbVhNaX7QuexqhYsgSxpWyCcqgwJo=;
        b=uXGlHYNJYru25bOLCeYSzGI8ekiwL8mZn/QYnAPIabvsptCImvbrJmxY0Vudztydg2
         SpGoOafev8yDyqkHSi7a6chag6VPAVqebtfKbDYxd2INMtGPRdZF6aGHQexES8ysxKgM
         3y3g8BwKra8GgTBUmS9ywb1tXdewd1msuZ2LT5BXfvUrloie5CFbmH8fEqskF3u4oIpJ
         IzNiay8u8nGJJcKFQqiwdpU+LVzpGLZss+kgt7hFeDjZOVyLsjhD+/IZzY2ApE8sClKd
         FdwYwAALvzWBgTjiv1SH4KKFkZhg5X1oIa8uONH9ctFI2Lw1YK4wVZQDA3BZujs45I18
         l8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523029; x=1795127829;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkTkVM1BqTIke4IbVhNaX7QuexqhYsgSxpWyCcqgwJo=;
        b=ZhPSiHpne66T40qCNaSYuM5bsUsSYr7S5qQF7UXAuH0U/otWn7SpflvJeEYDPZYguZ
         WGpCoVKg1v3Dl5++ONwP2Td2BDc2BbkfuOGIsDPRW9GWkbjEV4BX/wOF7d7Te3kc/ZYx
         HLqQRUg1hNOJSqlnxw1LITAb7Og4sR4SboFH9D2wTHnWj+oFt6VjlQ75huYh5LFkM6iH
         J4+ILuiHm9GJkFAucgmPlP2hlvdWGmo4wpkc+zavaRxw/sycSI2s17Zk6neGhRdgteVO
         TXN1VtSaejq0qY1Z1sI/GDWcBr6b6r0YP/z0I8/rXX2CQgvt7eGgac41VVtLCtEkm/0r
         E3QQ==
X-Forwarded-Encrypted: i=1; AL+hErEkK3f8bbiNItNaRnT7aG/RMeIYxvRrq7ITKBdsjdNIjL3jnTp9YDt3BpKNs4HhqhII9Xf4aWANOhFSsw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+M/u6zDmdfjuVdaPHJd+2jIReKsk4/ctpQxaNKTCXeq+11d8J
	iu8FxGpWI1U9P5RK+VMJNZehxl1YpCYL27H2G8IDJnmOTjTfY+51PA95
X-Gm-Gg: AYBFou0tzi1VFaHvnrkZjRpmfaMvuOw8N0JPzT+H5+zMs6cBKp1jA7cW2lk2kSWHES0
	SRaboCv432aB1pc0r8g9vLMNLjxqj68v3XTeRmRMapLX1pxusIcLIrwL00hsCulITBi50lTMeOx
	2VHEzbyfqYpqSCZRIfOhTdwTdL6UaUgLYKHs34v0HbrApVKdJnvch69xF1GDq/03N5dxWY2ZCWo
	ZlVDtrgwocQIMgy7QPOyGywD92HRYqERDZHu6kJouGTrwpUBwCiUQdifRbX4ivRpoaU6/FuM+kF
	VSI+6G5/FYMoIEY7wxXcKp6QL/06OcxGGJ5yZlMaqDAyZnsKaWk9D5mOOH9TUTqRLTPsR2xFh6I
	Cegds4DtzrkLemOY8v0kTo1+DdF1w7XuxAvlMzN7q10fN/ZZ+SY2Y/8Q3WOpAs3RzFlq22KSPWJ
	zn+9g8YV2rbyz7+hZUTLHJl+1ZrXSzGWs2n+jLET3QAvISFxlDxTEc13I0rZ81JB+bcQ3BuBPNe
	whwfv69ZgjAm9A90JifHmpUqviDfkEmpQX6RIWleYFbIWcEascq0T+aIT8vBoB7QYbWj1FyTpWa
	GutMDN7b0shRUJENXcj01Ku39dJJEU+bIYoc4VEgrS1R8POlLsm4RbdZiIVDsGQuZnedYrD/hCt
	fM0rhlWrcuiY=
X-Received: by 2002:a05:6000:25e3:b0:492:b1c5:6db5 with SMTP id ffacd0b85a97d-49c73bf096bmr1548196f8f.32.1794523028610;
        Thu, 12 Nov 2026 14:37:08 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60ca70a7sm1494474f8f.51.2026.11.12.14.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:37:08 -0800 (PST)
Date: Thu, 12 Nov 2026 22:37:07 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Martin Belanger via B4 Relay
 <devnull+martin.nvme.dev.gmail.com@kernel.org>
Cc: martin.nvme.dev@gmail.com, Keith Busch <kbusch@kernel.org>, Jens Axboe
 <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg
 <sagi@grimberg.me>, Hannes Reinecke <hare@kernel.org>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, Martin
 Belanger <martin.belanger@dell.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] nvme-tcp: use an aligned buffer for the TLS
 record type
Message-ID: <20261112223707.3bf1e1a6@pumpkin>
In-Reply-To: <20261111-nvme-tcp-live-ctrlrec-v2-1-6295202b84de@gmail.com>
References: <20261111-nvme-tcp-live-ctrlrec-v2-0-6295202b84de@gmail.com>
	<20261111-nvme-tcp-live-ctrlrec-v2-1-6295202b84de@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 15:42:39 -0500
Martin Belanger via B4 Relay <devnull+martin.nvme.dev.gmail.com@kernel.org> wrote:

> From: Martin Belanger <martin.belanger@dell.com>
> 
> The buffers that receive the TLS record type are char arrays.
> put_cmsg() and tls_get_record_type() access them as struct cmsghdr,
> which needs a stricter alignment than a char array has.
> 
> Use a union with struct cmsghdr, sized with CMSG_SPACE(), as
> svc_tcp_recv_cmsg() and xs_tls_read_record() in sunrpc do.
> 
> Fixes: 2837966ab2a8 ("nvme-tcp: control message handling for recvmsg()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Martin Belanger <martin.belanger@dell.com>
> ---
>  drivers/nvme/host/tcp.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 7ecc6c007f8d..749d77b4e172 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -77,6 +77,12 @@ MODULE_PARM_DESC(tls_handshake_timeout,
>  /* TLS records read while waiting for the ICResp, the ICResp included */
>  #define NVME_TCP_ICRESP_MAX_RECORDS 8
>  
> +/* control message buffer for the TLS record type */
> +union nvme_tcp_tls_cmsg {
> +	struct cmsghdr	cmsg;
> +	u8		buf[CMSG_SPACE(sizeof(u8))];
> +};
> +
>  static int nvme_tcp_cpu_queues[NR_CPUS];
>  static DEFINE_SPINLOCK(nvme_tcp_cpu_queues_lock);
>  
> @@ -1653,11 +1659,11 @@ static int nvme_tcp_skip_tls_record(struct nvme_tcp_queue *queue,
>  			.iov_base = buf,
>  			.iov_len = sizeof(buf),
>  		};
> -		char cbuf[CMSG_LEN(sizeof(char))] = {};
> +		union nvme_tcp_tls_cmsg u = {};

Is that right?
You are changing something that was CMSG_LEN(1) to one of CMSG_SPACE(1).

I've a feeling it would be right if it was a struct, not a union.

Did you test it?
Or even compile it and compare the two object files.

David

>  		/* kTLS fails a control record read without a cmsg buffer */
>  		struct msghdr drain = {
> -			.msg_control = cbuf,
> -			.msg_controllen = sizeof(cbuf),
> +			.msg_control = &u,
> +			.msg_controllen = sizeof(u),
>  		};
>  
>  		ret = kernel_recvmsg(queue->sock, &drain, &iov, 1, sizeof(buf),
> @@ -1682,7 +1688,7 @@ static int nvme_tcp_skip_tls_record(struct nvme_tcp_queue *queue,
>  static int nvme_tcp_recv_icresp(struct nvme_tcp_queue *queue,
>  				struct nvme_tcp_icresp_pdu *icresp)
>  {
> -	char cbuf[CMSG_LEN(sizeof(char))];
> +	union nvme_tcp_tls_cmsg u;
>  	struct msghdr msg;
>  	struct kvec iov;
>  	u8 ctype;
> @@ -1690,12 +1696,12 @@ static int nvme_tcp_recv_icresp(struct nvme_tcp_queue *queue,
>  
>  	for (i = 0; i < NVME_TCP_ICRESP_MAX_RECORDS; i++) {
>  		memset(&msg, 0, sizeof(msg));
> -		memset(cbuf, 0, sizeof(cbuf));
> +		memset(&u, 0, sizeof(u));
>  		iov.iov_base = icresp;
>  		iov.iov_len = sizeof(*icresp);
>  		if (nvme_tcp_queue_tls(queue)) {
> -			msg.msg_control = cbuf;
> -			msg.msg_controllen = sizeof(cbuf);
> +			msg.msg_control = &u;
> +			msg.msg_controllen = sizeof(u);
>  		}
>  		msg.msg_flags = MSG_WAITALL;
>  		ret = kernel_recvmsg(queue->sock, &msg, &iov, 1,
> @@ -1703,8 +1709,7 @@ static int nvme_tcp_recv_icresp(struct nvme_tcp_queue *queue,
>  		if (ret <= 0 || !nvme_tcp_queue_tls(queue))
>  			return ret;
>  
> -		ctype = tls_get_record_type(queue->sock->sk,
> -					    (struct cmsghdr *)cbuf);
> +		ctype = tls_get_record_type(queue->sock->sk, &u.cmsg);
>  		if (ctype == TLS_RECORD_TYPE_DATA)
>  			return ret;
>  
> 

