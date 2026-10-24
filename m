Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792822171;
	b=ya8bFEOp2YgBaEz6hdI5RD6iEY+7fQfJ92S7hIdiCqaP/2EdKDQY79me45q9IdQOjcTH
	 kPa2UvyqX0zAyMIcGYhV43VlbBeoUvjMB9jcVt/ejNNw+i6JUppoDKOid7QWC5oIQNJnn
	 JqQbQEH92Od+AadYEygKPykg/zpBzFjoXhgSx3c4P9ZGf8TIMjs4lAIq6FhJuSMrwF3pp
	 qSQohOiORFs5KxykH+KS/1VpLzsNoLqbTyrD7cAkvirW5tZMgH1mnFsmyUnrVLFt/K3BB
	 u1ot4Iv8cP+zGWVOWHHAZoNYhj4j6NGy7NlsjPqlkCvcH2FcbvAKRhV/nzvNSlTdiOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792822171;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4sAOQ2/8GJ74cU0InQXZiuSKN+kyx1d7ticl4Lmxpl4=;
	b=YyZ5CV6XkFjKaq86S6VtWsoNGmMBh95iajHfi3PrGbngqlG6doSLHanvKM75HRkYTiqO
	 nKBrGCA+wafw0F+dTofo4bO1v1MnbO+KD9/oTnTUxgY0tM5sjNyrzuEmMAfpb8h5zTNfq
	 Wjd7OOatpK1j+d5NhQkSN+mxtypc+h9OHTNc4KnjkCgpz+DIrQ2nGtS8q+4yibeLCYAkx
	 J2EdMFMR+v6W7dY3xF7MsYVJWMJX1YdnC+sxNHgMa/4CjeQ+1tE9DGKhTdIJHYR2kPYOB
	 GsA8IJlX+6+a+0NogTlsO6gCWYXPfq26ILADGRK7IY6CgfJ2pZWvywta7HJP8dkuVHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=b6qm6O77;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F99606A31A;
	Sat, 24 Oct 2026 06:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=b6qm6O77
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02F41F01825;
	Sat, 24 Oct 2026 06:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792822170;
	bh=4sAOQ2/8GJ74cU0InQXZiuSKN+kyx1d7ticl4Lmxpl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b6qm6O770Vndjx7EOBKekVZdKZ3Fho/hU2rerm618hu6bNcyDTTdFFfb00VVEuz0u
	 1hUoOsnJB7u1DIpjO3Gtai3IQ7kg8l7kGXIzQvHHCMB8tdZCs2iGRRQOpjoKIJyv2b
	 zkWMtKzrlE95j8BlRplEodEgSr7yNM23KfrgfNEU=
Date: Sat, 24 Oct 2026 08:09:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Elliot Alderson <hackerowskiy@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+ffc483dc87891d3c107b@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] usb: gadget: printer: clear current RX request on unbind
Message-ID: <2026102419-dried-poison-521a@gregkh>
References: <CAG2k5NBDNqksjd+FUHXAcC-pHwadLzwobr45pTXuATqQ7shyPQ@mail.gmail.com>
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
In-Reply-To: <CAG2k5NBDNqksjd+FUHXAcC-pHwadLzwobr45pTXuATqQ7shyPQ@mail.gmail.com>

On Sat, Oct 24, 2026 at 03:51:46PM +1000, Elliot Alderson wrote:
> printer_func_unbind() frees current_rx_req but leaves the pointer in
> printer_dev. A later unbind can then pass the stale pointer to
> printer_req_free() again. Clear the saved request and its associated read
> state before freeing it.
> 
> Fixes: b185f01a9ab7 ("usb: gadget: printer: factor out f_printer")
> Reported-by: syzbot+ffc483dc87891d3c107b@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=ffc483dc87891d3c107b
> Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
> ---
>  drivers/usb/gadget/function/f_printer.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_printer.c
> b/drivers/usb/gadget/function/f_printer.c
> index 1857d786110..11471bd065c 100644
> --- a/drivers/usb/gadget/function/f_printer.c
> +++ b/drivers/usb/gadget/function/f_printer.c
> @@ -1462,8 +1462,11 @@ static void printer_func_unbind(struct
> usb_configuration *c,
>          printer_req_free(dev->in_ep, req);
>      }
> 
> -    if (dev->current_rx_req != NULL)
> -        printer_req_free(dev->out_ep, dev->current_rx_req);
> +    req = dev->current_rx_req;
> +    dev->current_rx_req = NULL;
> +    dev->current_rx_bytes = 0;
> +    dev->current_rx_buf = NULL;
> +    printer_req_free(dev->out_ep, req);
> 
>      while (!list_empty(&dev->rx_reqs)) {
>          req = container_of(dev->rx_reqs.next,
> -- 
> 2.55.0

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
