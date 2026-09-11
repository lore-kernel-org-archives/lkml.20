Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EFD49B202
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142204; cv=none; b=Cti7LRN/wxYdyjMqvWyG8JHoCbanb2UitQMNPxHlsuOjqoCaFC8ouKv1TFBCKv/cFUF72yJ+pomJ4mH60nEpCea1kANSjrhhj9OdGJSsLTZpnDCf+NM6zbhOpXt41sSEEn0a3BXcHEE0EVOVG5YU6zNqyyNWOgj1ham64xUpqzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142204; c=relaxed/simple;
	bh=mjbvHbioGHY7urkc7ALAd6QAqb6mSR2JpyegfZB+S/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alnOHlkZiAMC+tAF4XkQKWEVuE+GEN/+ZJ3rVH0Ut806ZpgKpNEgXz2L66CNL8YoqwTu+B60JOFMi1CMCsIr4Fr0fp4BaK57CHQ+ceSyG3NhGU/BnpqZWhBbLiWxa8IRLhqkrxnlBXGCL3gqfCT86xepQvMQf6gVM7Ym+CwnNCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/9PFcH+; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/9PFcH+"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a0a87595so853470a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789142201; x=1789747001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i93HR/ZVRY5iecDHt3F7Fd0n7rJ1kE9Xq94CpGBbTOY=;
        b=J/9PFcH+8RwW0AkuX99NZ6ZFXSkbTfBOveZZPXyIjM9Ul5GctCK0d1KzloNnICvb6q
         YCAepxnGbOSSHPl/RsCdR3pXUhDAqNeXhJ6CrhnoAiu0su26wL60oK82gdy6EAGf0Zi/
         Qs+8kRdZH1TcCqpSeTbFmrb5K8mNRmnxsKtYllWLL8tQnudAErNVcxkeX0Dvv8L3/H3W
         MumWVAAWhSxkzP+N6ngNp7k9hr49pwgTQgMMO6uVEWdnpXQ6kbFSlgf7zhRFcpOqOiJz
         KGGZSMGGzxITvHnWu5ZFSvjSfa/8nhFD2wgUKDTfKvsh2nm4VwJBvWdlC1T2OpBWBRzS
         ZDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789142201; x=1789747001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i93HR/ZVRY5iecDHt3F7Fd0n7rJ1kE9Xq94CpGBbTOY=;
        b=s0j1O6id/djXK6g98anJB9pQFBZnuRmy3BOov5OHxxvT4+983VX+ACnvlPPKofua47
         q1jpX+JzXVt+D1uy8SVLy5fLPA/lfw+rPIDUcnifCuqoonW017SA/DeoP8YzDKCqqtB9
         wBTo2jJoTDjCgLqNIrXzb7cv8Xn2AGp5GRuJUlTYxjXW5vIKnClFlf9bskoT65a6ZXEC
         M1195y9xHEswMLWndSAUAklhBX4xq6Rd32w2DXu5tKHgd1cp65Ndt6Whd7GEzvki6z4T
         m0KNK4UReZJkN1t5/vIHtGuJzRokYfl9Vuw/f+D7Gmbs9bsbDM18juLouxcr1cTuLrNk
         OYUA==
X-Forwarded-Encrypted: i=1; AKwUvBxleLPNMO1a8JI86vjmWQ7md5d9VP6ERTvn1m5AMSCjH3zppS7TXXvM3SGNe3M/mCtdLPJAcKuzCxVpIP8=@vger.kernel.org
X-Gm-Message-State: AFuF++ne1CQOB3qsLdznbh7enAg2sjBVpglHtrkf6fXBzU6d4qFdwBUN
	JBP/cCn9aaCSkmHewxCwI0PUm0ShgTJcn2NR8jfJhAD3MwwKEy3fFdwW
X-Gm-Gg: AYBFou1NoYZmejvY2JkojhDI5jCHixbXVFVTDUlhnDKsY/1guOIdXbND6gPDWr/y8tT
	dD9z8xDn0XRqnBnXZdF+AL38YrXXB2yMhxUIBzfs/FOQ7zq+8BmdFS7XtSbmG55sfS0vki9d7Vc
	wb9fFMicak7j5MsGKCLr5ZX2/4XCYIqCjpnuhM338YRXvsJ/RzXh0s1StkqRQe3IY+zvxL66HFK
	v9PeQlT4c+T6c12D/0vjOpLswK++WpVA2e8r6NLsMxXAs2gyKjPoz2fKkgmZCx+mvkz7ZE4dlua
	pHMHD1h2us0Q5RwVTwVQ+2ko3l8ITyRtjSJ/NWpKYZEyB8ZWUKGoIZUQYl8Xmnu+QC8LQC8G2Ge
	5DSYGG3VGS3ZwCaUdkKnAIpp3IARKZrjTn59a+9KaxWnGmanTDUaftLosMSe3xoN5piI7g2x107
	Ftuo7pUj35PTUqGmx27B2cFoe3BYOxz4GiRLyb7jafp6OH/nr2tma14j2IOS34u1jB
X-Received: by 2002:a05:6a20:d508:b0:3cc:ebeb:3efe with SMTP id adf61e73a8af0-3daed59e465mr8842930637.9.1789142201223;
        Fri, 11 Sep 2026 08:56:41 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4b::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c65b1a63sm1435313a12.31.2026.09.11.08.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:56:40 -0700 (PDT)
Date: Fri, 11 Sep 2026 08:56:23 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, kernel-team@meta.com
Subject: Re: [PATCH net-next 1/2] net: add sockopt_expand_out()
Message-ID: <aqQkImqiHPorszOY@devvm7509.cco0.facebook.com>
References: <20260910-getsockopt_phase6-v1-0-e681e102d5b8@debian.org>
 <20260910-getsockopt_phase6-v1-1-e681e102d5b8@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910-getsockopt_phase6-v1-1-e681e102d5b8@debian.org>

On 09/10, Breno Leitao wrote:
> Add sockopt_expand_out() to grow opt->iter_out mid-air.
> 
> It is a no-op unless the proper size outruns optlen (i.e, some
> not-well-behaved userspace program calling it).
> 
> In this case, only a user buffer can be longer than optlen says, so
> a kernel-backed optval keeps the bounded iterator and the callback gets
> -EINVAL if it asks to grow.
> 
> This whole quirk is added to:
> 
>   1) Avoid breaking userspace
>   2) Making the quirk explict
>      * Instead of protocol doing implict assumping like this.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  include/linux/net.h | 25 +++++++++++++++++++++++++
>  net/socket.c        |  4 ++--
>  2 files changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/net.h b/include/linux/net.h
> index 470100ae710773..de0ed362b37794 100644
> --- a/include/linux/net.h
> +++ b/include/linux/net.h
> @@ -70,6 +70,31 @@ static inline int sockopt_init_user(sockopt_t *opt, char __user *optval,
>  	return 0;
>  }
>  
> +/*
> + * Grow optval to @size, for the options whose reply is sized by a count the
> + * caller left in optval rather than by optlen. Those write past optlen today
> + * and userspace relies on it.
> + *
> + * Call it before writing through opt->iter_out: it re-anchors the iterator at
> + * the head of optval. Only a user buffer can be longer than the optlen the
> + * caller declared, so a kernel-backed optval is refused with -EINVAL.
> + */
> +static inline int sockopt_expand_out(sockopt_t *opt, size_t size)
> +{

[..]

> +	if (size <= iov_iter_count(&opt->iter_out))
> +		return 0;
> +
> +	if (WARN_ON_ONCE(!iter_is_ubuf(&opt->iter_out)))
> +		return -EINVAL;

nit: if you end up re-spinning for some reason, maybe swap these two?
I always get confused by the count vs len of iov (iov_iter_count vs
iter_iov_len). Because I think count for ubuf is len because of the
aliasing? (and then, if !iter_is_ubuf check is first, at least iov_iter_count
will 100% be ubuf specific)

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
