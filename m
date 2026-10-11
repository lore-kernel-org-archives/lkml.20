Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077FD25D53B
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791734176; cv=pass; b=lz2wLXvobb7zNaVSYdcfPN8zhv4k2lje8/bwEtsPIMwhIZSc1lUPMS7WyGv7vkuCyZwo+3qGITOeq9BtomnhzOyjwkPTQSL+t59BCqez62W3LqIg2pzEHcvagJCCrbGJSv2YdnmwKtGOF8eiGsz5RkVskPU0GuUU+YiSa6DH+aI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791734176; c=relaxed/simple;
	bh=/JK+8oneyHjSUbJbc3j9nJhc1e8XAgMgQI7ekpEsvxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d34dQ5FOslHrvEQfSZvzBM1KzK6Fn7GSKlgtp/+WvceK6naiYa0gX37jk4aFRXU6mDVXipH4EBTE/6rSwEvXD6G74cTLUKJBXaY1HkswKPUI4/GzbhcWYHwX1WiCSgwn7rmY6Wp+ntOl+3kqxIlhPPrf/49iddqzCW2pfxoBdKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DTWt42B5; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DTWt42B5"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so1402a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791734173; cv=none;
        d=google.com; s=arc-20260327;
        b=FYeJkEhQg9P3R2K6GcyEpUUlAXBW7mx5fSjVg5wT0AhVpbQcbS7IHFSqujvcctn2iC
         FylavYbT2ebBi6hVOZMLSiiPbfeaXRtRgq37MNsMy2+fHd747r7orFS93M0hScc70v3U
         +FXXG8JWN9roz8fuLF8FQ7TEY2Jt2IL69iievvwFMI74IrbL0PODz+5na0+srZkwVGaB
         C5caTMBc0TGqdDpoMIGipNorMz67MfmjGmXA4miS192H3/Y+pAV7g+M7M44MsI8cWSD3
         C1Kery71V516PN1koO9jUQyTdrz61vnQ5G0zniihvLSIBilQEHxjrK/30530nfhxCIT1
         OUEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/JK+8oneyHjSUbJbc3j9nJhc1e8XAgMgQI7ekpEsvxg=;
        fh=UtQu7DY/WOuFlEDTQ0NWzFmPXNVUlQvxNWDMsSwW5Nc=;
        b=dxp81yHak34/IPXRIrhi6LLLWuNGchlJ+cHfGHeB7ETnbQwIZnxLAgZavGMLAN05Du
         NJThSoSPzkcuegLrqKYfV3vpcZiuZKrT8b+APuIh7sVlM5ZXb4EceukFAO/iDqObMFhE
         Ce5LwwF5INSUIzbTAARqYfm1F8nGNHSPjawabdGKQe4+RURpFheO7u8WdikhS307BYzt
         Ax8eb2tNOWicZOVOONmdv2KD//+SY9l6rSbXifl+f0mvBEmLt+7ni0hDd4KXa2hOEkyz
         qBcnEgG3UjpVKkidZ9PoXFJzW3yQ+NC3ub7S8BizXh0eFmR/jOiDc0tIM3uM6PQQvlPD
         E++Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791734173; x=1792338973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/JK+8oneyHjSUbJbc3j9nJhc1e8XAgMgQI7ekpEsvxg=;
        b=DTWt42B5LkI2szJVPHCoQxA+Ac9vBYc6SBWESIZtpg0A6M6a8RT8GcUSfOOWCsGs75
         1ElnUKHWQxBsMojffPmn4/7vrKZGkFGfRej6G80p5Dc8oDiPhOiPLFEzPTZleb0KB1wR
         w1MNTSyitfqoa4yQYzOclHcoYGiCdyObcXvh7WStRl6zZpJEHWljr5qkW8b7ZBtg7NQf
         qkGoifDy2ENyTHLGAu4PegXqs/yleRxehBp1GMlZDcZ8ifc6aLwbOp1mul7RMPKktwfY
         rWVBM6EijA2+WlVAK08KB7NM/7e5bhm5DSzg+AImqIB378URTIAZZ6a5zTmIRxI73JdF
         vf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791734173; x=1792338973;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/JK+8oneyHjSUbJbc3j9nJhc1e8XAgMgQI7ekpEsvxg=;
        b=Gp9PIsDjpnDw9CwMWsuAasw9/EZ3bGoj02JF/XBfXeGq0ecTXATTgh8zo+4F1P2ERI
         eys4T0GwCl5H4qCoS84byx2i5WLJUPFzLTd5sZE1ceUHaR9PVtfFTcAWRmN8V4sbR2uK
         nn3L3pUn/AfpkbHprZeBHI9BXA9RPMmg4tWfUV4Ivuxsc3BQJj3PgzE1BnRUlGYBgzwQ
         /uy4HDYE5NQXDOd/Q5uRhDGTKD67Wvm3Uoly/bVh3QJuD9i7xjBmxpU7TBCPLspGpYUV
         919A1kh0ou60pPbgJ7/IrH84YkFbMAshuTxgA5ID5qKcg9Y1GleH1MXp2d2Ycm2ZHs1l
         ZUMw==
X-Forwarded-Encrypted: i=1; AKwUvBwXCnmTvNxYCJoPwsIE1TmnZFIeqkUIWqYjBBZz49Lk33KxHsd4gmM9SYQnbrsSb5C38+0o2ae3kOzziAM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEysSwcnKVvqC7sz/OndGR5RPJGAjd9G+JePEfviYyXxfs9+f2
	m4YfefokvpxMAIRPwUWGM+c7aIwCpSW34iCi1/lDnFyO1jUwHAtWgQ9TImN5Ps49EpsFxKwbTwT
	Imt+j3wqagkvWImEqkdgZr1uWuvZOqBqlf0APRhzg
X-Gm-Gg: AYBFou1fws7DPh0GECBRQUkO75wW32bK24J8IiXirGnG8PCcIJaBiWc8zGH3HqH2Cia
	Kmi3cq0+0KlDptA3ivcqm95Mw7DnQmfd5jAVL34Cr1T5CMcul75nmvzhazMo+q2Fu1zjrO388z+
	iDE3brxft2LU/ZaFKRIxzqQrKHtm3986hhhcjVf5UG/agEP1hhZ95w3PdBlMANiH1Mvqma4ugVf
	5+LKhQFdiVXQ0B8SRU2A/3Q7G8sSZbZjkVSfI/xT9R+8EOxEGmqTNSmX6KFgUjDZEpByo87g+60
	dJVniJn9Qkh7DreMWkhGkQRTGhsd7JIBJ6cpJbFpKxb1GjZ5dOSdkPUTqrgd+MqY
X-Received: by 2002:a05:6402:548f:b0:6aa:b72b:d762 with SMTP id
 4fb4d7f45d1cf-6b198823fcfmr54337a12.1.1791734172609; Sun, 11 Oct 2026
 08:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010083935.3274178-1-almasrymina@google.com> <20261010083935.3274178-7-almasrymina@google.com>
In-Reply-To: <20261010083935.3274178-7-almasrymina@google.com>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 11 Oct 2026 08:56:01 -0700
X-Gm-Features: AclHuK9SxZyeBfW-6W6d1kton3R7TtfUwblUvnT30CCIbrIv1iqXLpJDIRaE5ao
Message-ID: <CAHS8izP58-H+bGw+4RJazukywpeDX5jMKaH9coMwcXh-mFa7AQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 6/6] net: kunit: test netmem, page_pool, and
 skb frag refcounting
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org
Cc: Ayush Sawal <ayush.sawal@chelsio.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Simon Horman <horms@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, John Fastabend <john.fastabend@gmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Eric Biggers <ebiggers@kernel.org>, Kees Cook <kees@kernel.org>, 
	Michael Grzeschik <mgr@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Petr Machata <petrm@nvidia.com>, Arend van Spriel <arend.vanspriel@broadcom.com>, 
	Jakub Raczynski <j.raczynski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 1:39=E2=80=AFAM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> Verify that non-pp (page._refcount / binding->ref) and page_pool
> (pp_ref_count) references stay balanced without cross-counter leaks or
> underflows across regular pages, page_pool pages, non-pp net_iovs, and
> page_pool net_iovs with both pp_recycle=3D0 and pp_recycle=3D1.
>
> Cover get/put_net_iov(), get/put_netmem(), napi_pp_get/put_page(),
> skb_netmem_ref/unref(), skb_frag_ref/unref(), pskb_copy(),
> skb_zerocopy(), skb_shift(), skb_split(), skb_release_data() (clones,
> unclone ordering, pskb_extract(), and skb_morph()), and skb_segment().
>
> Signed-off-by: Mina Almasry <almasrymina@google.com>

This patch introduced warnings in patchwork:

Documentation/.renames.txt: warning: ignored by one of the .gitignore files
Documentation/.renames.txt: warning: ignored by one of the .gitignore files
ERROR: modpost: net/core/net_test.ko: symbol 'skb_shift' undefined!
make[3]: *** [../scripts/Makefile.modpost:147: Module.symvers] Error 1
make[2]: *** [/srv/nipa-poller/net-next/wt-1/Makefile:2179: modpost] Error =
2
make[1]: *** [/srv/nipa-poller/net-next/wt-1/Makefile:248: __sub-make] Erro=
r 2
make: *** [Makefile:248: __sub-make] Error 2
New errors added
--- /tmp/tmp.UjTzqx5Cgh 2026-10-10 05:13:14.877336904 -0400
+++ /tmp/tmp.2YswE6nv11 2026-10-10 05:13:32.781257136 -0400
@@ -1,0 +2,5 @@
+ERROR: modpost: net/core/net_test.ko: symbol 'skb_shift' undefined!
+make[3]: *** [../scripts/Makefile.modpost:147: Module.symvers] Error 1
+make[2]: *** [/srv/nipa-poller/net-next/wt-1/Makefile:2179: modpost] Error=
 2
+make[1]: *** [/srv/nipa-poller/net-next/wt-1/Makefile:248: __sub-make] Err=
or 2
+make: *** [Makefile:248: __sub-make] Error 2
Per-file breakdown

We're not instructed to pw-bot: cr our patches on patchwork errors for
non-sashiko failures, but it seems the maintainers will want this
fixed anyway, so i'll pw-bot: cr myself and let me know if you don't
want that.

pw-bot: cr

--=20
Thanks,
Mina
