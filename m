Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C61F4A2630
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786416; cv=none; b=L1vuJzlCpXNpzNfPisPCgBddZmDCvc3yWw9LIpRr+h5oBU5CLjOPHlH1Gq+cLtuXtypCVMZkwwM+ZamKWMx6jvvNzE2RR5yBxmHnNr39RZgJE4n8XBUhTE4K01yQ7WPdJ/AjHsYQSNy86DLbgKGUwI1ajrVdA8GLr+4eO+f/JuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786416; c=relaxed/simple;
	bh=eoELJwkDlwS9cl0WbC/oBljazj8jzeYPt267DDxKQMI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ai7GEUCaltAPqV/B+NuaRUEsKck3evfCk4N7+b08ZEQ6sjfrdjyBrwGOqcINhiTqGkwMu3ZsCAqZ1oHHHKwElN50BTcWtqcufkGeyov6DgNhv69juM0vx/Z91xr7+gP2kLwLTBN+huNt1PZIGz6xYbKYKejgkO1zbTV5rWOBANI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dN1OaUhM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dN1OaUhM"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48441a2ba14so3100784f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788786406; x=1789391206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ySxHLNrdZAbSwcz4SMQYBg7MBYiQBtCno7JKBz+dwo4=;
        b=dN1OaUhMVVuEw0c3URs5MBke2AXqLEWnlBw37xX2r1J5Vj4X4SiR4QP5oETKIYeR1y
         VORiQJTSScTbCy2k9R+IKlZuzhdTCl/W7CYCgCRLkqXs6kMzMskSrZQve7qYwkq877ZY
         dyFx01Ihs0FuR1p+SPINfUvrdpMm+r34/twUzRNLZ74X9hGpMmq19OEned9pvmCpHdez
         h+y1RU2OxT3y4dkR9OvypkeIEq685qXquuW6IcvkTISaMoZ26cNF8yG7+Xh0UuSREITh
         pa+YgjGItCzAOWGfj3TF0cuvIiTliUMZw6H1KFUXyn/eQx7ph60XBKA60iw9z+O8Dwjz
         aAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786406; x=1789391206;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ySxHLNrdZAbSwcz4SMQYBg7MBYiQBtCno7JKBz+dwo4=;
        b=PG6Q3ltnbq9bfzsoi/ySmDg/4z4xInfn9w19VfpKOmJFcpdf1hgzdb2rbZuAE8kscg
         ZayPc7jqcS4MMHm63pcazg7XSqKL2XlesAHC2ZWVwtTqcGx5DHmrLMIgv0L8zBZuSVHW
         AYMZCypfWZ5lmtY37AYu3jYBZXtFxZPWCbaUVsb1u4d9Qv9OZnDYMOoyS1GMB52QDZXF
         M5cwIHOurduDGk0iOamU7LaXFWulzCMRi9ExyMTFKHo6COuXIBzP/adNGr8/JDKz3rpY
         DVf5FpFoBoBoCjruNe830YWkMffiPB25YLJQV4SttQkq0z4Fd5imkx8Ho0L+h/XL/vpL
         MKLA==
X-Forwarded-Encrypted: i=1; AKwUvBymU/wokhhhQvHhhz13O+wWYhQk2TyIz4vMgK02EVMHsPCvxgtbk8Ha/ONOP0Rp9XvUfCNYUh50lK0FqGg=@vger.kernel.org
X-Gm-Message-State: AFuF++nWUpmpwNDVwrp43Cp6sjWFwpiB/E6c4lDRs5A+caOpuiOXSxpZ
	NT4nq6vj4LMt4huQIYmLERXOXID20ey/U0kd4bNolJSq5VPlG9nzDMKw
X-Gm-Gg: AYBFou3dthUK5ot1MGkjPLKNBlK6yiv4c6thZW7re5/KVs+eM9m2MREbOv8UTatzvdk
	KOBHI6ofH1IpiPcW/dBAgRpOvHXkG5rbx1bc7/wzdCzbKKETs2YlH6gIeeBTM/mxpFwtr1GbdMD
	lq/H+AnNjYTE7pzVM8Ppfl5+qf0At7cjskz/5cjxcKjuPXkjlYADoYmZa5CY94v9DlaCJVPptm9
	ySuwftrIvUHFYIbIsktcm9gjW9VJwS+68ZHPcgx0tAHnmvHToJs7QxGxWQBKuvLehivgioDR/D5
	R+Vi3PgWLbWcJ4+11dM+LINBbZ6B3xqfThKebyxg1+y4BVqRS3EziZjRmto5+WBv7Eni4X/6+w2
	6LzKqRzwy44yDbGfSg2lIvTrjf0z5aA2plDPv2zhYr6NsxWovv3MOFWTkaKtwscYzcFLyW6hqKx
	2s9bJzHghIpp0jlvDELhx5q+KRcyfsJ4/ZPsHGKuEmLgaK0OgNgFVEOeXmBvSrbSBnicXhTjmkW
	r8gLjvW6WXr+45pV1LEMuyCRA==
X-Received: by 2002:a05:6000:260f:b0:485:8be8:b2ba with SMTP id ffacd0b85a97d-4858be8b4bcmr22749936f8f.49.1788786406401;
        Mon, 07 Sep 2026 06:06:46 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c81c3sm28717743f8f.26.2026.09.07.06.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:06:46 -0700 (PDT)
Date: Mon, 7 Sep 2026 14:06:44 +0100
From: David Laight <david.laight.linux@gmail.com>
To: David Howells <dhowells@redhat.com>
Cc: netdev@vger.kernel.org, Marc Dionne <marc.dionne@auristor.com>, Jakub
 Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v9 01/14] afs: Fix lack of loop around sendmsg() to
 rxrpc
Message-ID: <20260907140644.18dba619@pumpkin>
In-Reply-To: <20260907113743.1453210-2-dhowells@redhat.com>
References: <20260907113743.1453210-1-dhowells@redhat.com>
	<20260907113743.1453210-2-dhowells@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  7 Sep 2026 12:37:28 +0100
David Howells <dhowells@redhat.com> wrote:

> Fix the afs callers of sendmsg() to send data through an rxrpc socket to
> call again if a short send occurs.
> 
> Note that this is also a prerequisite for changing the way rxrpc_send_data()
> works to return a short send rather than an error if some data was buffered.
> 
> Fixes: 08e0e7c82eea ("[AF_RXRPC]: Make the in-kernel AFS filesystem use AF_RXRPC.")
> Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260824091645.415423-1-dhowells%40redhat.com
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Marc Dionne <marc.dionne@auristor.com>
> cc: Eric Dumazet <edumazet@google.com>
> cc: "David S. Miller" <davem@davemloft.net>
> cc: Jakub Kicinski <kuba@kernel.org>
> cc: Paolo Abeni <pabeni@redhat.com>
> cc: Simon Horman <horms@kernel.org>
> cc: linux-afs@lists.infradead.org
> cc: stable@vger.kernel.org
> ---
>  fs/afs/rxrpc.c | 38 ++++++++++++++++++++++++--------------
>  1 file changed, 24 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
> index d82916657a3d..a80b043d36be 100644
> --- a/fs/afs/rxrpc.c
> +++ b/fs/afs/rxrpc.c
> @@ -412,26 +412,32 @@ void afs_make_call(struct afs_call *call, gfp_t gfp)
>  	msg.msg_controllen	= 0;
>  	msg.msg_flags		= MSG_WAITALL | (call->write_iter ? MSG_MORE : 0);
>  
> -	ret = rxrpc_kernel_send_data(call->net->socket, rxcall,
> -				     &msg, call->request_size,
> -				     afs_notify_end_request_tx);
> -	if (ret < 0)
> -		goto error_do_abort;
> +	do {
> +		ret = rxrpc_kernel_send_data(call->net->socket, rxcall, &msg,
> +					     msg_data_left(&msg),
> +					     afs_notify_end_request_tx);
> +		if (ret < 0)
> +			goto error_do_abort;
> +	} while (msg_data_left(&msg) > 0);

Is there any reason you didn't change rxrpc_kernel_send_data() instead?

David

>  
>  	if (call->write_iter) {
>  		msg.msg_iter = *call->write_iter;
>  		msg.msg_flags &= ~MSG_MORE;
>  		trace_afs_send_data(call, &msg);
>  
> -		ret = rxrpc_kernel_send_data(call->net->socket,
> -					     call->rxcall, &msg,
> -					     iov_iter_count(&msg.msg_iter),
> -					     afs_notify_end_request_tx);
> +		do {
> +			ret = rxrpc_kernel_send_data(call->net->socket,
> +						     call->rxcall, &msg,
> +						     msg_data_left(&msg),
> +						     afs_notify_end_request_tx);
> +			if (ret < 0) {
> +				trace_afs_sent_data(call, &msg, ret);
> +				goto error_do_abort;
> +			}
> +		} while (msg_data_left(&msg) > 0);
>  		*call->write_iter = msg.msg_iter;
>  
> -		trace_afs_sent_data(call, &msg, ret);
> -		if (ret < 0)
> -			goto error_do_abort;
> +		trace_afs_sent_data(call, &msg, 0);
>  	}
>  
>  	/* Note that at this point, we may have received the reply or an abort
> @@ -912,8 +918,12 @@ void afs_send_simple_reply(struct afs_call *call, const void *buf, size_t len)
>  	msg.msg_controllen	= 0;
>  	msg.msg_flags		= 0;
>  
> -	n = rxrpc_kernel_send_data(net->socket, call->rxcall, &msg, len,
> -				   afs_notify_end_reply_tx);
> +	do {
> +		n = rxrpc_kernel_send_data(net->socket, call->rxcall,
> +					   &msg, msg_data_left(&msg),
> +					   afs_notify_end_reply_tx);
> +	} while (n >= 0 && msg_data_left(&msg) > 0);
> +
>  	if (n >= 0) {
>  		/* Success */
>  		_leave(" [replied]");
> 
> 

