Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF451EFFA1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815166; cv=pass; b=N8zSYv8EhSuhcnnssW9dzi4iBzo9Rza1Y40roJnq1tr8NZrXxIXaBEvdNmuMVSOodCPYe1S01wouBwydbtmjyMYpgrxOLFUEBNlpQpO1GD5qlPT6SdKILEoUjFLyz6nfAnwR9vwUwrzNrjUerUxTVSUowf88uwyphPf5wOH39qA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815166; c=relaxed/simple;
	bh=VUasteM/1eK2m7/PtquDXotFQqnoyDt+RcdvdR9rizo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=csWtuAlUMwrqfd+Fnec6/N+ujwWSvFBplAbgTfaPGUO1U+hdRm7Uot91MMFT0bN8caNjukRnZ5RPSfYnb5iSeJjkuPjZbQdACn3CGj/5qcfCzSmbjhehr2qgSY8v6BJCNrFoTGNIf2E5TM04I92bwgJ4HqIWsMHAVuzjpyNOYPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IdrGu9YE; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IdrGu9YE"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-836c8bde2dcso25906267b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787815164; cv=none;
        d=google.com; s=arc-20260327;
        b=L0M9heIx/XosydYVuvg577bmO4NyF2PCTc4dJmVWUQwstAS1yzYGCj5XVg8lZpPhQx
         MgJkPrVp1VHDfSeIrma2x4W+rwrr0K176ThJGMxm2uf4RgspkUutuwSA1nmAuTuAS8bS
         gkR333mnBXwfx+Qz8K+5TcpZUVG2vBjfUgt6c3bWUNiiKGjUkSkxLbexZQctZ15MuzKE
         VjQ9aINLIk63T1ip0JFJbccpThlscPP3YhAysT2XsgXC25iQuXpNrDM+2vt+Xg4sHTah
         IEqi773rxxcBfYbwjU20OfCYlMOgirIpG3MRkLBu/1dddrQAAvVufFy/D8zdVREbPbdr
         i6Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IhU91M+LW4kUF2uW8BgolP2/H8Gx1gryC+2FQXRk+lc=;
        fh=lE6IDXQrtqy55eDhsglzWhdzsViDuT8B/8rTqwcmp/Q=;
        b=ClCN553Met6g8yTG7UojtR5q8UGA7J0yEmCNldmqfxNqrOpbhlu3U7Xggx17EhK2hW
         2cPo6FS+CiqdqrsKBbnfpAEGSqPE2U+N8iaia0U4Gkqe+rurgOeUow3OkCohQ88IZHsM
         EaOuCA+x8UgMT+2eh/01Dq7rwuoJ3eQgh4Y0OnPE3P1XYRmsXfVt5Qbeojg0OeonJYac
         k4ifcFlOrutCDenMO8JazTtCVdxymUYEo8p/aYQxHdmT/H86y55IdzgYCbRNPKsCQPkt
         66yd5PL6AvtvZf0Jkj1WSrxVbc4TDoqsG1UYsLJDvr/ugQ6FYlAtJdk/90B538EeO0vV
         0/Sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787815164; x=1788419964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IhU91M+LW4kUF2uW8BgolP2/H8Gx1gryC+2FQXRk+lc=;
        b=IdrGu9YE36MYY13oNBTdA56uURH0gEieApaMfaDMl+fvmNCmlVeCh9GWa2CTogs8RJ
         esCPrzwaQW416UAThRvc6XULVbSUrv366i/cxNVkM3NvGqH5BAU+nvHBrq1eETxWCOeC
         rJhp3i4RhSDJqxFMgwvhgj7r5mzcrNxaAwacwdtnWIzw7BFY5rV49IrxETKcyN9y3wRI
         OlmQPOWlBOxn9lWWfa6TxhxBSgnGTZRakYQU3A64HR6R16Nhlgsj30orA8DyQtvhmwLS
         qGjP+/l3HPC/3Ogl44ji3R4WM9orauF4GJ8yFNJlHbApMwYPhIs7LrPo7D1oF4blT7mq
         ibDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815164; x=1788419964;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhU91M+LW4kUF2uW8BgolP2/H8Gx1gryC+2FQXRk+lc=;
        b=ZHwhIqfZnegUutgAY5GKO8H1Ou7GNWEdNUe52KyCQZnYPVvEZIE8xBCfAYgZ0yamFh
         1RTGC9x3Sz4Y8KcJYnTSWD7S3DiRJ1jffZhZZUTlW1v4MSX9qnGZ3rnPKK0IUGrvyqXF
         xjSHLZ1ej8/LmHfhedRoIXqp5ORP8Jv7ranjKBRh+svRJAlbIiB0OzksexX0dxxoxIq5
         gTJ6Z5J9kqZwMRq+JFSwL2p6EMx/a7Tv4kM9b4GTLhj0QyA6DRakVweTDPc/gsM+ODXQ
         TlkPRfcJI7QiJtwueLdcGrt4Lr4VCOG+BIVBG1QRSem4w1VZxenOFbUtLaIo0TScVMxW
         /2gQ==
X-Forwarded-Encrypted: i=1; AHgh+RpU7/2ZDAJLnzwMhWXMhiNUuj3RoiJjCcsbZ1UHxZHMGaK230bipsS2Rwr6CBWQC7ivWVDRUWcbEejh1g8=@vger.kernel.org
X-Gm-Message-State: AFuF++mrKWuN2YVNd3B7+OKXrwSbwY+xaTGn0BTsVG/lFQnPtKHSmUOl
	1xPWUnwumRrO2xu63LNdeoLPUY6xxRRfHwxNDnlmnzUa+8tU9giehmRxNtw2mCcfpzoJPW/4DyG
	M+Au6CivwjNB3P+nE3f6ddB+d0TggrXFEQEizS/mJ
X-Gm-Gg: AR+sD12koPpmFRFL3aq3uZsBJ9rPhhB4KzyqXod610DXMiNCtri570afU+OklMyw3X5
	GHDKQuLMuz0YLbjR/Jd88HRyYLMD2XU3u8jTAxjDL49puBieSvZJKfskm1b61eUmhCt7HIUZjJj
	nsuH5FO74jQJKagdfIpOFFOjiPW4bVedXsWwlKNZeX0R1O9nDPYM6VjEPM2wWV5HWParmt90CKH
	SvmPUkGzKTtWXjESGXG4aFbiCefhUV6hVX6wrh0i4+9sh6yMwhaPVAwKqPaZqhJZ3Q2kr2YZGzN
	FrK0v5XNHvJOYB5yAuqgVfzxRh5IO59hW7blYW2h8Cg4XLRNzDjgDo1lzSSv0zFUp6NRJEyqbvW
	RvBS0gvOK0Ugsx50+7KaPeQup2LJGXFnN6czG65BgTYZAzzVum9ncpvbTeQ2s
X-Received: by 2002:a05:690c:e288:20b0:855:f387:98c0 with SMTP id
 00721157ae682-85740497376mr45849787b3.29.1787815155156; Thu, 27 Aug 2026
 00:19:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823142620.126424-1-shlomojune6@gmail.com> <CANn89i+5o16tSTk9MpLE24nCAn+SkMeZvHv0W=MqxnXGZDBBiQ@mail.gmail.com>
In-Reply-To: <CANn89i+5o16tSTk9MpLE24nCAn+SkMeZvHv0W=MqxnXGZDBBiQ@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 27 Aug 2026 09:19:03 +0200
X-Gm-Features: AcwNN1Uv5avHkko0YacIDMfyYRxac66XxxBIaWUGZOqnwIzkejhBZ_2TAAKhfiE
Message-ID: <CANn89iKck9W0KB8Sp7OFDQ+OTFJnBpy=jsmQbZ+VYhrm8yOUgw@mail.gmail.com>
Subject: Re: [PATCH net] net: skbuff: reject invalid pull bounds
To: Shihuang Liu <shlomojune6@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 4:51=E2=80=AFPM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Sun, Aug 23, 2026 at 4:26=E2=80=AFPM Shihuang Liu <shlomojune6@gmail.c=
om> wrote:
> >
> > skb_maybe_pull_tail() subtracts skb_headlen(skb) from the unsigned max
> > argument and passes the result to __pskb_pull_tail() as a signed int.  =
The
> > function does not ensure that max is at least skb_headlen(skb).
> >
> > This can happen while parsing IPv6 extension headers when an skb alread=
y
> > has a linear area larger than MAX_IPV6_HDR_LEN.  Once the parser needs =
data
> > beyond the linear area, max - skb_headlen(skb) wraps and is converted t=
o a
> > negative delta.  __pskb_pull_tail() then passes that negative length to
> > skb_copy_bits(), where it can become a very large copy length.
> >
> > Reject this inconsistent bound before doing the subtraction.  In this c=
ase
> > pulling up to max cannot satisfy len because the initial check establis=
hed
> > that skb_headlen(skb) is smaller than len.
> >
> > Fixes: 1431fb31ecba ("xen-netback: fix fragment detection in checksum s=
etup")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
>
> > Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
> > ---
> >  net/core/skbuff.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> > index c82a147..33022f7 100644
> > --- a/net/core/skbuff.c
> > +++ b/net/core/skbuff.c
> > @@ -5838,6 +5838,9 @@ static int skb_maybe_pull_tail(struct sk_buff *sk=
b, unsigned int len,
> >         if (max > skb->len)
> >                 max =3D skb->len;
> >
> > +       if (max < skb_headlen(skb))
> > +               return -EPROTO;
> > +
>
> pw-bot: rejected
>
> Please ask your LLM not to slow down the fast path, and find a better
> fix in skb_checksum_setup_ipv6().
>
> Note how skb_checksum_setup_ip() is fine.
>
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index d4382b68d56e0b3b247868b4d29ab383cfcf7440..f77d7480594ca6a1dcce2fea7=
37e421d5ea2d38d
> 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -5974,7 +5974,8 @@ static int skb_checksum_setup_ipv6(struct
> sk_buff *skb, bool recalculate)
>                         err =3D skb_maybe_pull_tail(skb,
>                                                   off +
>                                                   sizeof(struct ipv6_opt_=
hdr),
> -                                                 MAX_IPV6_HDR_LEN);
> +                                                 off +
> +                                                 sizeof(struct ipv6_opt_=
hdr));
>                         if (err < 0)
>                                 goto out;
>
> @@ -5989,7 +5990,8 @@ static int skb_checksum_setup_ipv6(struct
> sk_buff *skb, bool recalculate)
>                         err =3D skb_maybe_pull_tail(skb,
>                                                   off +
>                                                   sizeof(struct ip_auth_h=
dr),
> -                                                 MAX_IPV6_HDR_LEN);
> +                                                 off +
> +                                                 sizeof(struct ip_auth_h=
dr));
>                         if (err < 0)
>                                 goto out;
>
> @@ -6004,7 +6006,8 @@ static int skb_checksum_setup_ipv6(struct
> sk_buff *skb, bool recalculate)
>                         err =3D skb_maybe_pull_tail(skb,
>                                                   off +
>                                                   sizeof(struct frag_hdr)=
,
> -                                                 MAX_IPV6_HDR_LEN);
> +                                                 off +
> +                                                 sizeof(struct frag_hdr)=
);
>                         if (err < 0)
>                                 goto out;


Following up on this, are you planning to send a V2?

Thanks.
