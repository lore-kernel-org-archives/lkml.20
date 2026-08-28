Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B568D3DDB13
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919711; cv=none; b=OfalbLi15QduGY4L/SNnMEH6WxFbJL72YTF4FkedHHeTyYL5RRSCF5plkVBtPcNk6KGd6H72rWHJVOYamoY1KhNwWigivnXxFbkmnn8ITHsLWBc43c3AFCo6bNwZJacyQPnkiTMD5o2+53meXVRJ4d6XB+vXxky4jyQiUlDXCk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919711; c=relaxed/simple;
	bh=VsQc9XLs1tH/NsY6PWr9165FLo8UuFqRnsQCjx9In7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWkecl22tmM8LNso7XbaqwEiQNwLZ32buN6tM7JQ0to7kFaX7nW8ScgUPd5PVX9x7a5R2LTF2Cun7ZTtHi06qLMXVmEaELiKfoi/jZk5bskQXhnFGoiPXQvoz7EpSzEre1gH4vf9HrVP/ODKVoVD6edNaBOiCM5IFwz0ISZW0no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbZBWk3P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbZBWk3P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A041F000E9;
	Fri, 28 Aug 2026 12:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787919699;
	bh=Y3vJp7PhuD879yhozp5evHoD9lD6tH7M2Cmig6c6LuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bbZBWk3P1Gz+1py8/kJlrIhmtOzC4FBX8Nr2/67Nq5WXEhDCA5vuQADeItDKuE1zP
	 L0m/4e9wK+oP2O7Ry9L4TG+jPUkhzdpvKo8I42Rm7a2UNLKk8e2UfN9br+1qhk8msh
	 FSB4fJE8kOjcE9b+HQrnkUKgvO0jPSfdKwWag+gvd7nrtsSPRAlTdTTszxdz0LRJuM
	 ztN8GgBopnByQoGXFcYnpty9t2QF7UVMg4wEKro8d+b8lz/Ir/JDm2Im+v8+V+/nEh
	 72z0WGBWVYyrKSwp1wqiSAEW3HBBNgrdx1VlMl6zr6wGId5Vs2+2CW28iTsl9nxGN9
	 rK/X2Rc30+Z3Q==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wzvaS-00000003cEs-2qKK;
	Fri, 28 Aug 2026 14:21:36 +0200
Date: Fri, 28 Aug 2026 14:21:36 +0200
From: Johan Hovold <johan@kernel.org>
To: Yang Zi <2959243019@qq.com>
Cc: elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] greybus: operation: Fix NULL pointer dereference in
 gb_operation_message_alloc()
Message-ID: <apF9UD-3HNG3z8d-@hovoldconsulting.com>
References: <tencent_1CB189506DEFA4B38099D654FE6C2A2F2E07@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_1CB189506DEFA4B38099D654FE6C2A2F2E07@qq.com>

On Fri, Aug 28, 2026 at 06:00:04PM +0800, Yang Zi wrote:
> gb_connection_recv() accepts a received message whose advertised size is
> smaller than struct gb_operation_msg_hdr.  In particular, a header with a
> size of zero passes the incomplete-message check and reaches
> gb_operation_create_incoming().

Thanks for the fix.

Please shorten the commit summary (Subject) to something less verbose,
like:

	greybus: operation: fix NULL-deref on short request

> This issue was found using a locally modified syzkaller.  The
> analysis and fix were assisted by GPT-5.6.

This can go at the end of the commit message.

> The subtraction used to derive the request payload size then underflows.
> When gb_operation_message_alloc() adds the header size, the result wraps
> to zero, bypassing the maximum-buffer-size check.  kzalloc(0) returns
> ZERO_SIZE_PTR and gb_operation_message_init() subsequently dereferences
> it.
> 
> Reject advertised sizes smaller than the message header.  Also check the
> payload size before adding the header size, so that the size calculation
> cannot wrap and bypass the buffer-size limit.

This is arguably two changes; a fix for the NULL-deref due to the
missing header sanity check and a hardening against any further bugs
like it.

But I guess they can go in together in one patch like you do here.

> Fixes: 87d208feb74f ("greybus: embed message buffer into message structure")

This is not the commit that introduced the issue. This should be:

Fixes: d90c25b0a279 ("greybus: let operation layer examine incoming data")

as that's the commit that started acting on the header size field
without first rejecting invalid headers (even if there was a WARN_ON()
at that time).

> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Yang Zi <2959243019@qq.com>
> ---
> v2:
> - Add the syzkaller provenance and Assisted-by trailer.
> - Regenerate the patch for git-send-email.
> - Verify the received patch with git am and checkpatch.
> 
>  drivers/greybus/operation.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
> index 7e12ffb2dd60..c3d51176c373 100644
> --- a/drivers/greybus/operation.c
> +++ b/drivers/greybus/operation.c
> @@ -364,14 +364,21 @@ gb_operation_message_alloc(struct gb_host_device *hd, u8 type,
>  {
>  	struct gb_message *message;
>  	struct gb_operation_msg_hdr *header;
> -	size_t message_size = payload_size + sizeof(*header);
> +	size_t message_size;
>  
> -	if (message_size > hd->buffer_size_max) {
> +	/*
> +	 * Reject a payload size that would make the total message size
> +	 * overflow, before it wraps around and bypasses the maximum
> +	 * buffer size check.
> +	 */

I think you can drop the comment.

> +	if (payload_size > hd->buffer_size_max - sizeof(*header)) {
>  		dev_warn(&hd->dev, "requested message size too big (%zu > %zu)\n",

And this should now say "payload size".

> -			 message_size, hd->buffer_size_max);
> +			 payload_size, hd->buffer_size_max - sizeof(*header));
>  		return NULL;
>  	}
>  
> +	message_size = payload_size + sizeof(*header);
> +
>  	/* Allocate the message structure and buffer. */
>  	message = kmem_cache_zalloc(gb_message_cache, gfp_flags);
>  	if (!message)
> @@ -1047,6 +1054,11 @@ void gb_connection_recv(struct gb_connection *connection,
>  	/* Use memcpy as data may be unaligned */
>  	memcpy(&header, data, sizeof(header));
>  	msg_size = le16_to_cpu(header.size);
> +	if (msg_size < sizeof(header)) {
> +		dev_err_ratelimited(dev, "%s: short message received (%zu < %zu)\n",
> +				    connection->name, msg_size, sizeof(header));
> +		return;
> +	}
>  	if (size < msg_size) {
>  		dev_err_ratelimited(dev,
>  				    "%s: incomplete message 0x%04x of type 0x%02x received (%zu < %zu)\n",

Johan
