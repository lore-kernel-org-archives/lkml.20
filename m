Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793296284;
	b=VNTSXe9SKbMmy6lV+4A2dtgvNasHMDVVyR1TPosTtO+mmqHTcJlDLWDxYfnrKPgn/97d
	 E5ES9UBVzlJYuF8+T05+wvrKNO70awJT21VZ6QdDM1yqJr5qUqsn12rh62jsLrHgwN+fb
	 jk0U9W6NF/dsH8C5zj5ezwuqnaWuK4HNVkL33EkKptNjVmF4G66NV2+14FsFy33r84HJK
	 lzaYDOHv6sQMNpsJNuTJPL70uFWDMFJTNZ/LxcroCIcjR8lkkn8N0aiqRey8pbJOz+hnL
	 zhxbBoGPP/hfQ4bn4iwqj+4jCNoxymE0dgTh2JeDY7f4Ugt60bDIFbdUuXh12JaSgAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793296284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4yz5ABXPNYwfCJWPGT7FU0b1CFUvEbyvO334M8WGBcc=;
	b=Yv9iuvCx9M0kiozv7tZbmoai2xTHvxnkaByqKywpp/C6Wce0qJNObPwv0M7YHbib2lKU
	 89oJI1F4fjc72uBEUQHg4MdadMcXNQAeYDVUHyq0yol6t2ou1DyWAcJD50zseC3pH5Y+C
	 8ZFB1+Re6vlcr8GfZn1RSK1xXgZ0CYs9AUVbjxHVVu+a4fcR6iUIeRs3mORavMAhAaS40
	 XSXWr99pjHrCeK7b21vNdIuTkbjCy10NLIirku/SykcRJQQV2XHU5EJF6eTOdLIFVGUAJ
	 mBVB45Jg1rnql7MEdHFy+KHTT+Q2j4Es0GOMED5ESHh9tSJumcF1yKQwdJI7vYM5SUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dsUMIjZr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838B3606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 838B3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dsUMIjZr
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so23390375e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793296282; cv=none;
        d=google.com; s=arc-20260327;
        b=pYwlC7yzvgkyTjS9WZPe3IjZwsFQ++ok8tZ3mwLvAvAiVhH+BxV0ylB8aNhVS7vGca
         2Fnf47SzcA76rhpDk4Rutyi7oqh865AgTmrpKqMyJNoZP3Z9d0KzdH7vordcqRlTb4eH
         2vuluX7YSR1DCOYPdzMF5Lusf+ssH/hhW0cciKplDtfmbZhT6P4d39sffgKpabNQV9ux
         Bqc9zeb3lrZ6jxzbpSerykMfOUHh7m33UaD9GY2k8mDV6O4U2CwrMxj4pvZN5kR9yAYM
         0sSc/MBRztxXYZbVZWhVAoA8Jj4l5RyR7M7ohU4jB6jzEnmrjTnCMesn7gNU2ntpthPR
         3FBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4yz5ABXPNYwfCJWPGT7FU0b1CFUvEbyvO334M8WGBcc=;
        fh=ErvYS+LD4pLYvGMVpfASwEFBPNMvrP0fkE1Xv5LSxos=;
        b=aQd4lU+QZ/2OUB2wDhv0uohaZnHH1GaBEpyWeTMn9Chn1E68Bppmd1E3gqYGmWys9v
         NQnDGyREVE7qa2Ih4IFrsw2toc7hBsdgIleEbMsDMo1lJltGejHinIaS7h6VEtGcRpro
         BqquUYaDxQylZyoCrkqgHLEAVPqo+yyrLnzOiUwAVchChWojhMwqCOO8ZhxWjkA0d03I
         WFDrHpZZSbx0CeKgMCTvv0a7wB62QtnFqqcVzcsU92JJUh76q60nzlk2h/M7MIa9qsQp
         tin3WFuY02WbOeG1U71f0+aCG8caAVV04FlSwRcWMGvHlSW07Eumhs8GugprRjO6Kkim
         3V2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793296282; x=1793901082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4yz5ABXPNYwfCJWPGT7FU0b1CFUvEbyvO334M8WGBcc=;
        b=dsUMIjZrl7C+D72ks+mMd6uVvuKH6tmCREMXGG111TaB7HyXv6AQbiQNUFzIwXinn2
         DGAjeSUGTzceE2KWNIs7Xk2nGxv+fXrGAurSgVGDmYbLbguOJyh8mqVh5Fx3qQ8qxbiv
         4e0tqMrrQFcmAcys65CZKuOSnnwH8V2nAAQ3p27d+dHoFzbSSN2e3M/u7FYQJRqQACK/
         TSxHvs4CtD81JhMWF2+xQJ4oYZ9z1zgx41kQSCh3DYyhhlrCEPtaBEs3dBHrPl2HF/mQ
         kpw4/IbPYVK4bydt0cFFlc81eBiRmR49ngFCQAJHw2gakaZm7YpZ+L6AQCDKKRF0+s6S
         TVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793296282; x=1793901082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yz5ABXPNYwfCJWPGT7FU0b1CFUvEbyvO334M8WGBcc=;
        b=hIGgcClQJ+JI0T5YkEWMiYBJBkMFoJJxjtw7naH7E42VrGs4i25dbJOXotrP7wFPlT
         4rJqoKqe8SituUi01pIpe5rEIrq/apOqvi/o+g4O9qlIBOe1303bKzlisZ59op91oEKO
         oyR4o1aTPpwCXWlEAzcOX48NSrMafR1RB10IZZ7GfuXT33sN3PMTHwIljpfMZvYfX7c2
         52lqVhCaBcaODMACFYCv5cJj02DSB9daVxM/k3FA8DJFbZstfTyvVd8t4Zbc0R9+EyQa
         nk3UAKPvf2SKKhlHGDQwhw1S7xJ3cWsCzGnLJLriefpMyjGwKvjt6UhngYLEK5CahUAQ
         VaUg==
X-Forwarded-Encrypted: i=1; AKwUvBwv78jhjIzt6KkcgGuHECCjB2dNM69vQvnl1u/dMnBeB6327OEtNHrGZ/KXAxnOqhDyRT+rd/NGxj1MiNo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy1pnC2NCBDjQe83Tk6AqrnaUEHvDv8U9mhLa36f259FNX62Pn
	uDO9OvcweqBVFl4e0TXOhuROziaySvuuGjgshLEwaM01zkGF7ZSoI4pqI9rsNMAycYp6BlD9sri
	a4ZyJMSLSuTJ1XSKHV9b1ySuCEFeIom8=
X-Gm-Gg: AYBFou089BIkjDfiTSBxOGOwpSho1lp/uWHLRoJXU4A3DbJc/VkvKKtsMsTX+oCPEwc
	ceKp2PdcO3KeUn4M/sztb3utlECbAbvTdqmnBK8OcZCdZAwNIP/C74HBOK0i2BUoo5wsdI5FO7H
	N4TKUCMlNxnxGSPo6TUfahWCbky3lqRdiXjMRp7pQpjTbUX3x+S9ttmrGHuzckTc3vnUIyuA0NL
	w5GzCxepq4VD/JmCZ7avWyzWJkSWupylYA6wk7/d5+IpP401C+c5hk+0PLk/SwKbPHAaG2vrIKG
	FnIQqYLdklffFGbpBVnBHq7kh8sV/dp7sJygTIzVy2R/OFqK52IQmTIf7qK5otisYy6adZIxFpp
	MbMDnlnkpYgVjx+yB7gxczOXhvLbrgexxJgd0odYJPh9lYN4zQuhqPdElCLvGh+Yvgl+nru+8if
	0KNTk9ABCxW7zYjwK+
X-Received: by 2002:a05:600c:46cd:b0:4a1:ddaa:571e with SMTP id
 5b1f17b1804b1-4a96695ec9cmr127938455e9.15.1793296281562; Thu, 29 Oct 2026
 10:51:21 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAASqGyZ-9hqZGWNJShxnrSiXDO==51SVsQW_x_mk993y1pNO8A@mail.gmail.com>
 <willemdebruijn.kernel.26e1d6a9b487@gmail.com>
In-Reply-To: <willemdebruijn.kernel.26e1d6a9b487@gmail.com>
From: Ahmad AG <ahmadag1001@gmail.com>
Date: Thu, 29 Oct 2026 20:51:09 +0300
X-Gm-Features: AclHuK_BDFig-sbWsCR5OlIR4qFenHDi679NHRbcj2yJJ_-aS7hAWsW_5ci89gg
Message-ID: <CAASqGyYuJCObsoPsifvbksJqjtyx4sPZKNzCb4eo8HG_CjW+=A@mail.gmail.com>
Subject: Re: [PATCH net] net/packet: charge fanout groups to the memory cgroup
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks. I will scan all allocations in net/packet/ and send a v2
covering them in one patch, using a mail setup that keeps the patch
intact.

On Thu, Oct 29, 2026 at 7:10=E2=80=AFPM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> Ahmad AG wrote:
> > fanout_add() allocates a new group with room for max_num_members
> > socket pointers. Since commit 9c661b0b8544 ("net/packet: make
> > packet_fanout.arr size configurable up to 64K") that is up to 64K
> > pointers, 512 KB per group, from a single PACKET_FANOUT setsockopt().
> > The allocation uses GFP_KERNEL, so it is not charged to the caller's
> > memory cgroup.
> >
> > Each packet socket can create its own group, so a process with
> > CAP_NET_RAW in its own user and network namespace holds about 512 KB
> > of kernel memory per open socket that its memory cgroup never sees.
> > In a cgroup with memory.max set to 16M, 256 sockets each creating a
> > group with max_num_members =3D 65536 took 264 MB of system memory while
> > memory.current grew by 380 KB.
> >
> > Allocate the group with GFP_KERNEL_ACCOUNT, as other allocations a
>
> This is not the only such allocation in packet sockets that does not
> account. If addressing that, probably scan all such allocations and
> update them in one go.
>
> > user can make on demand in the networking stack already do. With the
> > change the same test in the 16M cgroup is stopped by the cgroup's OOM
> > killer, and with memory.max at 512M the 256 groups charge 262656 KB
> > for 264640 KB of system memory used.
> >
> > The missing charge was found by code inspection of net/packet/ with
> > the help of an LLM and then triggered with a small test program that
> > creates the sockets and groups and reads memory.current; the numbers
> > above are from that run. Tested in a QEMU/KVM guest on this tree
> > (x86_64_defconfig plus kvm_guest.config, KASAN, MEMCG, PACKET),
> > running the test as uid 1000 in a cgroup v2 memory cgroup.
> > tools/testing/selftests/net/psock_fanout passes before and after.
> >
> > Fixes: 9c661b0b8544 ("net/packet: make packet_fanout.arr size
> > configurable up to 64K")
>
> Your email client corrupted the patch.
>
> > Cc: stable@vger.kernel.org
> > Assisted-by: Claude Code
> > Signed-off-by: Ahmad AG <ahmadag1001@gmail.com>
> > ---
> >  net/packet/af_packet.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
> > index 823e0911c91..406397acc5c 100644
> > --- a/net/packet/af_packet.c
> > +++ b/net/packet/af_packet.c
> > @@ -1778,7 +1778,8 @@ static int fanout_add(struct sock *sk, struct
> > fanout_args *args)
> >   /* legacy PACKET_FANOUT_MAX */
> >   args->max_num_members =3D 256;
> >   err =3D -ENOMEM;
> > - match =3D kvzalloc_flex(*match, arr, args->max_num_members);
> > + match =3D kvzalloc_flex(*match, arr, args->max_num_members,
> > +      GFP_KERNEL_ACCOUNT);
> >   if (!match)
> >   goto out;
> >   write_pnet(&match->net, sock_net(sk));
> >
> > base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
> > --
> > 2.43.0
>
>
