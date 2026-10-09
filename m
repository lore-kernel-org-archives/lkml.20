Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7F74DAF8F
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552727; cv=none; b=UaIwK1FMc4gqJCAomZIiZSFtu5PtylgRHLwxS+IjiTUSv/63GhxXLdcsFtF0VZnO7ZlsfBHfaAqw5Fq0vHQ1cgxCd8HVQuJb1I215yibumey34x5NSr3cxeRPUi+L+a/yP3u6bgJPhzoO0ZM8WHA1NUf/LSN+zpRS77ksx9yM/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552727; c=relaxed/simple;
	bh=NFh0yxmK2GNkbGZm+6CdZSip4FpKU5TKLxjsI2sdwBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGfw6OH8VuTI0UB4mTjHtJj9gF5Y897iynbEp8igeHwjhR4RNr1yXMzFW65guK0Cw4QZa4c1fdUrdJkzPkcK4FcDjMvS5XwlNrKPUPx7eodKPXSysycDYE+IcFQo0lfsmt9I6FfP/5iUtov8eWs+/t9pAgU6GEbMhPbqpsQNwnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtCfMUgJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtCfMUgJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BEAE1F0089B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791552725;
	bh=/ewY03w2y78bL1MkLkxiNWv2++wXg6K7HMyz1TAMbSU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZtCfMUgJgbWCuu+D1joFfyH3ZpX4c8hXvQmKXinZZ66osSQ5DjUbAJxROo4YD2AWX
	 9MZEwdgBsNHw2jY2M2WfE0eFL0bJJ0R1r6DxxC4Uo4PQ1KrZTCWThbArYDl7+48qrP
	 0STY+6Aq6VeS2AGt9DNw+efMnybl8eGRJ5CTIeVUVhGhiYvxz51RUgA6/EP4hDHPyP
	 iv2ZIUXxbDqPmIAboFUxAc96q8FFvdw6lPT3qRtL/Ll5/lMpdochyIvHIkD/GFbAps
	 r0Bpln6AbR251yZ1+qyajouOB367UtPxoWUr85t3HC1dgYlDXhoHbeAm+t3o9oP4pV
	 0RHT9zi+wLX6Q==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2e8e738ae0so650767366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:32:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwlWlz+4d0A9CLD8JYbOT57A2njMVcQ/kwVR6AR3qaj89tVLocTvbXfEG0bHTLURaCWCLRqVNhPap0tkQA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9xp6/AXv8stgzkWy5pGh+6dxAAQBSnjBkMcPkOWgYrGGzFcsN
	DMaXKOBECZBP1GAGA2xawCuq5vaPjA9g65j7rL3H7j7pppeaKAYeF1SKq8OpT3LaCqvSurXMHvA
	ocrLew2PCLdT6NiCXFA8LSFQdp16fSpM=
X-Received: by 2002:a17:907:9801:b0:c29:4fcb:2886 with SMTP id
 a640c23a62f3a-c31a9fd831emr199212466b.39.1791552723764; Fri, 09 Oct 2026
 06:32:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009080252.2805877-1-bsdhenrymartin@gmail.com>
In-Reply-To: <20261009080252.2805877-1-bsdhenrymartin@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 9 Oct 2026 22:31:51 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8MyiCVhdN_PaQ=aSEO3yYYQ-Qb-2TnC68o0_pbchM0mw@mail.gmail.com>
X-Gm-Features: AclHuK9jCcVUMbiRbz7ci0w6ZwThNjnxf6Vt4C6LkeIEy1EP0_jT_RRzppcFAfU
Message-ID: <CAKYAXd8MyiCVhdN_PaQ=aSEO3yYYQ-Qb-2TnC68o0_pbchM0mw@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix use-after-free of server info on
 cifs_ses_add_channel error
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: Paulo Alcantara <pc@manguebit.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
	Bharath SM <bharathsm@microsoft.com>, Steve French <stfrench@microsoft.com>, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 5:03=E2=80=AFPM Henry Martin <bsdhenrymartin@gmail.c=
om> wrote:
>
> The error path of cifs_ses_add_channel() calls cifs_put_tcp_session()
> before cifs_chan_clear_need_reconnect().  The latter reaches
> cifs_ses_get_chan_index(), which dereferences server->terminate; if
> the put was the final reference, TCP_Server_Info is already freed and
> this is a use-after-free.  Same put-then-use pattern as the recently
> fixed sibling in commit 717e0a25036b6.
>
> Reorder: clear the reconnect bit and drop chan_count under chan_lock
> first, release the server reference last.
>
> This vulnerability was discovered by Tencent CodeBuddy Security.
>
> Cc: stable@vger.kernel.org
> Fixes: ee1d21794e55a ("cifs: handle when server stops supporting multicha=
nnel")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
>  fs/smb/client/sess.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/fs/smb/client/sess.c b/fs/smb/client/sess.c
> index e095f41b5882..650c0f855a29 100644
> --- a/fs/smb/client/sess.c
> +++ b/fs/smb/client/sess.c
> @@ -626,12 +626,16 @@ cifs_ses_add_channel(struct cifs_ses *ses,
>
>  out:
>         if (rc && chan->server) {
> -               cifs_put_tcp_session(chan->server, 0);
> -
>                 spin_lock(&ses->chan_lock);
>
> -               /* we rely on all bits beyond chan_count to be clear */
> +               /* Clear the reconnect bitmask BEFORE dropping the server
> +                * reference: cifs_ses_get_chan_index() dereferences
> +                * server->terminate, and cifs_put_tcp_session() may be t=
he
> +                * final put that frees chan->server (use-after-free).
> +                */
>                 cifs_chan_clear_need_reconnect(ses, chan->server);
> +
> +               /* we rely on all bits beyond chan_count to be clear */
>                 ses->chan_count--;
>                 /*
>                  * chan_count should never reach 0 as at least the primar=
y
> @@ -639,6 +643,8 @@ cifs_ses_add_channel(struct cifs_ses *ses,
>                  */
>                 WARN_ON(ses->chan_count < 1);
>                 spin_unlock(&ses->chan_lock);
> +
> +               cifs_put_tcp_session(chan->server, 0);
As soon as the lock is released, a new channel can be added in the
slot indicated by the decremented chan_count. Then the final put will
act on the new channel. Please save the server pointer under chan_lock
and use that for cifs_put_tcp_session().
