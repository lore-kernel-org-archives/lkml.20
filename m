Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792816002;
	b=nVp2UFHLe2mTqVzuShx2EjFAPtI0vK7HTNp/UCBfuD2tgb7sNJN9LqgB4q4F6Br6U21k
	 wScTAuUHd5wWZUdarYISoNHOhsDgut0x7+f2hEsimUsgfmev2F00edGJHI5l8ubmX9Jek
	 6k5JpehpKde4+bUl+X0VyuAr5ClgK34iRkgAejVRKwMDwaw7D1xbTQS+he1CBetLayT0X
	 Jd2qUNr1aGXT8C7XA3nNzob7GztTqhGLjLxcD1n2l8oRLp1AfIfXnYBcEmyq/3SIvYR4E
	 2RUMGfrgqOSZSSBlDmP+MOWkysgUAhAgi0nG6dcYlUkeBeZb5i/1rOEFRgLXXyj/E1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792816002;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=zO4TeL2VLDwoRhmTApAwmrZ23lSZX//mRkM2rzOefnY=;
	b=Y/lRyYXLuibjAxMeYixpZSBKeRNGSz8uzCxwGv+JkjqNzxjFutvlvoI3SKDziVTSWvVI
	 0jAQzZ65ibawpt/HOI8qERMIYBe4q2gqZLiJ2Vtgx/DjXebcp/edCB9BD998OIV8cWs44
	 jXB84I/+mJb0kjbdWB3reK4iEK1ZY0/btZAhwioCfoshgCsxsJMAXv8m3nikbLwMvhoal
	 lpUC0VTAu97g8UYZX2oo1fdBVet8uXedDZj37zUhUYbaa5BwXMFaT0jMkT44IgLEBY1gr
	 IogAbdNxi+sC7rDWnINmX7+t/BFKHIvyF6NDqyzZByBNUirocQiOEoFLJbVXX+RXubw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PyUUPtvw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3957606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PyUUPtvw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E85F1F01828
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792816001;
	bh=zO4TeL2VLDwoRhmTApAwmrZ23lSZX//mRkM2rzOefnY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PyUUPtvw5bdENw6w18PmlNvwSmCeWycjVf8MggNts0ZTSUSCKzMSvw+bmRZdP4Fw5
	 qCu3EdzRFqEAMRr3xXMmC+HnISD+8/Hetk6iwgVO/OUfyXJJFMlcczh6Dk3yq2KxeQ
	 TWtDTuvOz58VsoV1Lu3FBqW3FaSI+AWbBkK+Bi97ns+PbeX4wLgL3jGymHYmCK4Ur0
	 eNusLZs8imc7QwrTwvHN1VV/4Grp4kPsjd3sC1WtEOcEsCrSO28L6MBBK/hRFN+GWV
	 6wNxapFgZmyikXKJuOL3IJhwcYw5UOCLgAfOqeNF/Qs3CwXaBYwGZakRpALSEGrvmB
	 KzPYTyAcgEPXA==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c40f29667e6so236058666b.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:26:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxYYrp9dhvKkgQjdVqyGGlxOPfkyOggMKokHzCsHeAlSWaVZppba25KdJXGG+4lGWSa99dXIWzZ/EnwYfg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJR8bLRO6unzwQw8q/AtWNnBFx35auF9HWFjraYv2BbmekEJ/3a
	vc8EbC3vbkoEf0fB0zn6lslmv4QxawyZBsmajbUklNJvWq8dW80fZfmRCbDsVWGLhyxtyS4MDDW
	b3+6JScaCI2dTvqeEluAJMpV8rHr9BYg=
X-Received: by 2002:a17:906:dc93:b0:c40:4848:f7fa with SMTP id
 a640c23a62f3a-c46bde2f540mr90915866b.44.1792816000198; Fri, 23 Oct 2026
 21:26:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022092514.2590010-1-huiwen.he@linux.dev> <20261022092514.2590010-3-huiwen.he@linux.dev>
In-Reply-To: <20261022092514.2590010-3-huiwen.he@linux.dev>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 24 Oct 2026 13:26:28 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9Ow2SeZ1EjR7UBF3rmMn4=HKZrKajNdFU5TAnLVf=THg@mail.gmail.com>
X-Gm-Features: AclHuK9uO2_C8bKZjFDaY05N9hxwllj8qT7cYV8El9xw-GBpwNxHYHkFNCN5de0
Message-ID: <CAKYAXd9Ow2SeZ1EjR7UBF3rmMn4=HKZrKajNdFU5TAnLVf=THg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] ksmbd: route WRITE requests to an unbound workqueue
To: Huiwen He <huiwen.he@linux.dev>
Cc: linux-cifs@vger.kernel.org, senozhatsky@chromium.org, tom@talpey.com, 
	chenxiaosong@chenxiaosong.com, tj@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -17,6 +18,23 @@
>  static struct kmem_cache *work_cache;
>  static struct workqueue_struct *ksmbd_wq;
>
> +/* Load-time switch for the WRITE request routing policy. */
> +bool ksmbd_write_wq_enabled;
> +module_param_named(write_wq, ksmbd_write_wq_enabled, bool, 0444);
> +MODULE_PARM_DESC(write_wq,
> +                "Route eligible WRITEs to an unbound workqueue; load-time only");
> +
Since this improves performance, why isn't it enabled by default?
Also, I would like this setting to be on/off via ksmbd.conf.

> +enum ksmbd_wq_class {
> +       KSMBD_WQ_LOCAL,
> +       KSMBD_WQ_WRITE,
> +       KSMBD_WQ_BLOCK_WRITE,
> +};
> +
> +/*
> + * Classify a complete RFC1002-framed request for workqueue placement only.
> + * Check bounds before inspecting fields; leave protocol validation to the worker.
> + */
> +static enum ksmbd_wq_class ksmbd_smb2_wq_classify(void *buf)
> +{
> +       const struct smb2_hdr *hdr = smb_get_msg(buf);
> +       const struct smb2_write_req *req = (const void *)hdr;
> +       unsigned int len = get_rfc1002_len(buf);
> +
> +       if (len < sizeof(*hdr) || hdr->ProtocolId != SMB2_PROTO_NUMBER ||
> +           hdr->NextCommand ||
> +           (hdr->Flags & (SMB2_FLAGS_SERVER_TO_REDIR | SMB2_FLAGS_ASYNC_COMMAND |
> +                          SMB2_FLAGS_RELATED_OPERATIONS | SMB2_FLAGS_SIGNED)))
> +               return KSMBD_WQ_BLOCK_WRITE;
> +
> +       switch (get_unaligned_le16(&hdr->Command)) {
> +       case SMB2_WRITE_HE:
> +               if (len < sizeof(*req) || !req->Length ||
> +                   req->Channel != SMB2_CHANNEL_NONE || req->Flags)
> +                       return KSMBD_WQ_BLOCK_WRITE;
For 4 KiB single-channel WRITEs, throughput drops from 219.55 to
193.01 MiB/s. Should we add a size check here to keep small WRITEs on
the per-CPU queue?

> +               return KSMBD_WQ_WRITE;
> +       case SMB2_NEGOTIATE_HE:
> +       case SMB2_SESSION_SETUP_HE:
> +       case SMB2_LOGOFF_HE:
> +       case SMB2_TREE_CONNECT_HE:
> +       case SMB2_TREE_DISCONNECT_HE:
> +       case SMB2_CREATE_HE:
> +       case SMB2_CLOSE_HE:
> +       case SMB2_FLUSH_HE:
> +       case SMB2_CANCEL_HE:
> +       case SMB2_ECHO_HE:
> +       case SMB2_QUERY_INFO_HE:
> +       case SMB2_SET_INFO_HE:
> +               /* Keep these commands per-CPU without blocking the WRITE queue. */
> +               return KSMBD_WQ_LOCAL;
> +       default:
> +               /* READ and unclassified traffic also keep later WRITEs per-CPU. */
> +               return KSMBD_WQ_BLOCK_WRITE;
> +       }
> +}
> diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
> index b7ce67094626..54ecdd096bd2 100644
> --- a/fs/smb/server/smb2pdu.c
> +++ b/fs/smb/server/smb2pdu.c
> @@ -125,6 +125,12 @@ static int register_session_channel(struct ksmbd_session *sess,
>         if (xa_is_err(old)) {
>                 kfree_sensitive(chann);
>                 rc = xa_err(old);
> +               goto out;
> +       }
> +       if (ksmbd_write_wq_enabled && count) {
> +               /* Remember the extra channel even if binding later fails. */
> +               xa_for_each(&sess->ksmbd_chann_list, index, chann)
> +                       WRITE_ONCE(chann->conn->multichannel_seen, true);
This walks the entire channel list and sets multichannel_seen again
whenever an additional channel is registered. Since the flag is
sticky, all existing channels are already marked when count > 1. Could
we walk the list only when count == 1, marking both the existing and
newly added connections, and update only conn->multichannel_seen when
count > 1? This would avoid the repeated traversal and stores.
