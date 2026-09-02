Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9C84334B9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343736; cv=pass; b=bvcWiwVUsmDAx1y1KCqeRZwWFSQ+jPah42jX9KMIV2QXryGQgl5v/ToVt3G6ICgB+gYYoQfOf0Om4TMn17wQb5SDXHTzt/AjQHcF8XUVSNnmvWOinUMcSTnik46cfXFjdajuvaJ55KynYqiSF7ys//DJeYfXVFAox81vvKxA4jM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343736; c=relaxed/simple;
	bh=e22SUgGgIJ3poJkGI8HTllTE/j2hDqd/FF+MOcjqrxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PMZHwuqSW7w7MIukbt0BYwuqu71x1cZNFyixFw/2CvQvNkVAioBd4+VnthfRxCHQPndiMQT9OU5zNGDxtilFuIhYh0+vDjWBXsvzzf9fCe+TAijaVF9HE8JEu/6iu8NahocWRxZ/FBu2YdZD/daHR/2UHyvyzh5ZHFSzkTZwErg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bg+aSY0D; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nMnUnst2; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bg+aSY0D";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nMnUnst2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788343733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e22SUgGgIJ3poJkGI8HTllTE/j2hDqd/FF+MOcjqrxQ=;
	b=Bg+aSY0D9BMvdpgwgOg9YNFXyy4a28UcLhaQWFCJc++oim+QpS8/JepLC9frarQvKRskoM
	KCa3HLN+6ePplPU3RtPLG8c0nU10ivsxeZfm088T7c9S2NwZw0ZHr3YSyBI/BUS+M0jGnE
	rsyPpstPmdX0FtxDIATw8my6MsA+Yoc=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-kwr0d9N_O4aHYpvisNr3rA-1; Wed, 02 Sept 2026 06:08:48 -0400
X-MC-Unique: kwr0d9N_O4aHYpvisNr3rA-1
X-Mimecast-MFC-AGG-ID: kwr0d9N_O4aHYpvisNr3rA_1788343727
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5b5f157bab5so462266e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788343727; cv=none;
        d=google.com; s=arc-20260327;
        b=iT/o23bqXmboqPdX/q3lZNat40/Tq+DUe1tNxFGYhaJwc6+vOeFLI96iVseiLbu3qJ
         Vil2goiy/HakCbtrsGhgKYflIvnVMaBrNLgD3QxNsINaCM/306uh1W3GfxC/8YESA5EJ
         HXWlxArVoPmA1ntJdmpeWTX3F1HQLybn0HKBV9S+WYU6Wjv8jDaU8+YaHb3/1CiT1wxv
         j5cM/Bp8KgXKEkRUpbXiLNQDnG+WNVKGQWKmo7B9ULI5fPmB8wKgmll0xS4AlMAR3gBi
         TqTovuyFpCo3Uov6ZBq01wwd8s8XCsu1Gudyj/Beze98lFTsmeG7/WNMS7GUM8Ijrpuh
         YJaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e22SUgGgIJ3poJkGI8HTllTE/j2hDqd/FF+MOcjqrxQ=;
        fh=0zLirD+QBhy3NKuNY8uJDzZHXfQgDHlGRE6yq4koiXg=;
        b=VFhBg7AEb8Eia01YK65z+2z+TanRg8dlkafj9kGDmXihKzhFlKE71XsX2K2V36XTzX
         G07nV2fytIcQ+FL/huZ79BjYM0KGwmCsEiPqWg1P2TBgFV/V8OMjx8V1RN/RPcB2UFwK
         MjiJndH5Z2VDuXxT2hp1S06CqFf8FFVAJ04uNW0GoTavDFWN9LGswj1PGNndq0LEdDV/
         oM0sslirmfo97Uttyi7d9DgaspKDO5IRi1HL2bpLLM08bS4uXIDEWTf9rGE4na2OYoSD
         jxg/a5/rcNO5BmE7ymAlBe6Oc9F57nvZEKTlarAFF9kiaaCfjOnw/zKlw8t7ahz1r5kX
         DGWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788343727; x=1788948527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e22SUgGgIJ3poJkGI8HTllTE/j2hDqd/FF+MOcjqrxQ=;
        b=nMnUnst2Yx0Msk7zIwj8FUlVvIvyw9uUohHRoadFQgmiUybQVvU7oCdIqVzEYZXI/M
         R9PlX28mc7pvtT/9xfKJzMhgP0PTJpjgWFFOywPEKu8Wb8D1RLWLQMuylGXcXThU9cLa
         3zMR9vPguuUufi079763jqFqQvHkCgS0lt0zKRclnvLZwruKDfQJ0Z+4SYN9kf1rH3vJ
         fHPqbyRlbodTVHZ1FEX5+98uxyF7o6UIKWqghYBjO+vL+AbAYkwLX4grefGEwnJmWfwT
         ufVM2IAtguMhAV95KRuQPNcoyC8LAhXss087Rf4EYTqhnLqxjE8+J+9dLI9Lei5Mzg1a
         hO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343727; x=1788948527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e22SUgGgIJ3poJkGI8HTllTE/j2hDqd/FF+MOcjqrxQ=;
        b=fPpvGkQvbh4TMrUSNqScsphni/0Q7VkS6jeArj/SGQHDYr6c8OtP1gFrAE23r1YepF
         MQ+uI8MdoB2bFfrCcfxJNUUO+exX06EbDxb+NCWFG0ONV5RZ9X685JgnQYcpqbDVREU8
         C5gfN5PD1Iyx2HsVTq76Pwn7pJH7Anar/NCTWg/rJJ1Kp8Z8n+RHMPZvoHEnopgUHbHO
         kQ9BZLyAa2YvV2y6tx/3pRmkGXw5tzQ1RwRA6U9I3TMyGsNJFsMJSRvPrdKUpCGKMqpH
         mUDan+KPTHqbAELiYs1pG4zyZ308+Sloany4KMFmv5hrJFX1SAHjWcG/BuQmuiTWkCRm
         xorw==
X-Forwarded-Encrypted: i=1; AKwUvBwuXeBu80dxNB/Ob4AaarGDA5B2dVa3qeV45154h8IgfKMC4JUFYoy5REHSrGkb+cQtYQRNhQ6gWci76oI=@vger.kernel.org
X-Gm-Message-State: AFuF++nHkmbchSmHBTjtqv9PCC70ge2cd72CIxDEtFS3HJLy5nTkFyFC
	3eSKnJd9idQKkpgk0XEvFMXYn6mfqKHAMMcpuzRMznroVkPYLrT4IV391IBlJf/e4xLAhg0UdH4
	KZNd8qZd+QVLbVJ7oHAALMeKW0grLcnpOBNaOQ3mwyEmUBy8t76ame7gct2D3DBiJ+Yhdy9cBpg
	CIEjUm/zxRRc5no4dKMN8LipJkxDUC8Y5BmGySI9ej
X-Gm-Gg: AYBFou20xcJEpGR2aLGa1LVPSaFLvSFlH+F11BuaFGhtbpA2O+FqU8W5wOoJt6QueY1
	/q4XPq7Co0vty8b5BSGKYXjG7PKa+lmmgfpwA//NsUxERWjyh+wjYclZY3AiemOHjjM9yuZLVjc
	a2q9+MTPXGjDJfUoDuMr+J/2Yf8oRV9Gnu++cV7yfNr1r8QfpNNExbHCkX
X-Received: by 2002:a05:6512:1252:b0:5ae:b0f0:c217 with SMTP id 2adb3069b0e04-5b60834b9bdmr1404117e87.9.1788343727390;
        Wed, 02 Sep 2026 03:08:47 -0700 (PDT)
X-Received: by 2002:a05:6512:1252:b0:5ae:b0f0:c217 with SMTP id
 2adb3069b0e04-5b60834b9bdmr1404086e87.9.1788343726954; Wed, 02 Sep 2026
 03:08:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901115021.50057-1-ihuguet@riseup.net> <3d8ef804-efc1-46c7-bbb4-f1a6c26fed8b@kernel.org>
In-Reply-To: <3d8ef804-efc1-46c7-bbb4-f1a6c26fed8b@kernel.org>
From: =?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>
Date: Wed, 2 Sep 2026 12:08:34 +0200
X-Gm-Features: AcwNN1WWjJG56_BD-BZvMi7yD139IVOfUkEJ5Q53fMWfoLWzhUAroA5GHqaqbfc
Message-ID: <CACT4oueX-g20hKft6Z1Aj3rNK2Fi7MYHZz=LdBd3RKWu+YK-0A@mail.gmail.com>
Subject: Re: [PATCH net] net/ipv6: don't route packets with unknown source address
To: Matthieu Baerts <matttbe@kernel.org>
Cc: =?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@riseup.net>, 
	David Ahern <dsahern@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neal Cardwell <ncardwell@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Phil Sutter <phil@nwl.cc>, Daniel Borkmann <daniel@iogearbox.net>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, Alexei Starovoitov <ast@kernel.org>, Junseo Lim <zirajs7@gmail.com>, 
	Leon Hwang <leon.hwang@linux.dev>, Xuanqiang Luo <luoxuanqiang@kylinos.cn>, 
	Willem de Bruijn <willemb@google.com>, Kees Cook <kees@kernel.org>, Qi Tang <tpluszz77@gmail.com>, 
	Jeff Layton <jlayton@kernel.org>, Joe Damato <joe@dama.to>, Breno Leitao <leitao@debian.org>, 
	Li RongQing <lirongqing@baidu.com>, "open list:VRF" <netdev@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:NETFILTER" <netfilter-devel@vger.kernel.org>, 
	"open list:NETFILTER" <coreteam@netfilter.org>, 
	"open list:BPF [MISC] :Keyword:(?:b|_)bpf(?:b|_)" <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 7:41=E2=80=AFPM Matthieu Baerts <matttbe@kernel.org>=
 wrote:
> Thank you for looking at this, but I think your patch is causing
> multiple KASAN warnings, e.g.
>
> https://netdev-ctrl.bots.linux.dev/logs/vmksft/net-extra-dbg/results/8045=
84/24-connect-deny-ipv6/stderr
>
> And a few more, see:
>
> https://netdev.bots.linux.dev/branch_deltas/net-next-2026-09-01--15-01.ht=
ml

As far as I can see all the warnings are in the tcp_v6_send_response
function. I guess that sk may be a request socket there, so it's not
valid to treat it as a inet_sk in all cases. I will send a v2 with the
fix.

Thanks!


--=20
=C3=8D=C3=B1igo Huguet

