Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335C42D7DF1
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789932001; cv=pass; b=MojxpOfQ3dRVmSXMD8cXCYdZvcX3d+aYe6ClEdrJhnzvoW1jtQbt9VCqOWJdmOtZCDQn3oamzMaHHfOUAUxfY4ymiXM6cf0vfSIc4NYT1e6HGhiE9id9tx2mHrx8i/lAG4GMMQ78xsZq6eteXYUXjp3mrRghhfnP5d7/SDi5d5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789932001; c=relaxed/simple;
	bh=6SpgTwcIIQqjPbDa4mTNcZ8/Jqu2VPFbm+vZpZ7fjkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CohAfK6QISXi4Zw1N9MWD7tpHFflTbvAVDgk9QqkEZpDnA+bALc9dfgIvFFLDK/YziHppGN5DC2a0BQPJmulWYfzwTs3hmE61hm5yQNxVUd2IQxuQ7GwHqx52UxdmiZLQuRT0my/wos1+eiQdtXLwFae3Uu3FTIGhXRjbyuGHmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UHzfCDNk; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UHzfCDNk"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso2003797a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:20:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789931999; cv=none;
        d=google.com; s=arc-20260327;
        b=Lpf25Pf3FnlGO23xED8N8GEessGyjY+4lDFVYHi2aRwIfuGJfsBy783F2AqTHszKB7
         Ywvmwn43pC6kM2oXcnlTjr2+UuRbW2NCgxVSSgGmvvCwPVVTMuvf09/voTS2i79PCu+2
         +9KY2eIOwqeqnkia9E9Bizzvk8k2U32OiKpWFgjSoLch/t+yBOqSgn51peox7sb8I0fA
         zf+IDxBYGzGBRzN/OOU3QuRIc5PxtxW66PKMepT62cnhXnECj5wR80INO4AQ9B3UJLQf
         xbwa3Fr0WiUrypkV5CJy5lZUotEJTNGSgeTWLsGTepRMciLWOV2VTqLkOhSGf161DYTg
         Ybmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gWhRaROW89yV5OS3p3Oh/TR8um8lkux/C2SiVG/FN0U=;
        fh=sOUP7xobxlT5CWjlmahMIspLfT1oPuBUUu7L/VHG/WQ=;
        b=g7Hm78fwuHDGKNvDE7tirVP9Rkynsq6xrCjlrrIsZzhPCGO4b9QXdO3pjUaTzAv7wf
         EhTU06uv1R8tnU8Dfn4TIz5eMVvqyoFyGe/0FBOxFVCH5mM89WHslLvgyEtreY0Uftd5
         QgMsoIXTyizECE92d8HL4jqh10iyjXtBQThvuezdNTbzIuKbSQay/86pfycfjiWNKIae
         MTZOG54/TxV5VXN/KVS0cDIq0fXnT9hHln4CteioIo1ISALve97XmXuQCN/Q353hqAH7
         nF9jdORNH8lfwh5LtSZJvhXJOBHMLF7U8LmhWRusuBUsa4ADo8UzfVVthO2EHTdZngAI
         aPJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789931999; x=1790536799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gWhRaROW89yV5OS3p3Oh/TR8um8lkux/C2SiVG/FN0U=;
        b=UHzfCDNkUeg8JygLeU7bjSLvlWmWi6ZIEklM0UBEnKAR8ZTh9HxcLwp+heWsyVG4lR
         71FnwslAXVzqZeZPJS8LqjIfXT1uc045WKQXbiRas3lThtJrdYQwyHmu0qwlt8R0uOX9
         h/G3000ZuDcFlLp9YIDUeUAK0Y7+RqpIBBXbIS7SuM7aVl5PJGo8lfAm4s77wFGcvbMq
         md14K+E6sVbL+V/uP2/IbVCt1JQlJmqOmhXqcAhsvLlkkOtyhIM2h8X9bRGeBuW+COya
         9Xttr6ClXOCHU+e1xXigAlFDnImG2j55q5cA0bIMbtwxJdZLScZ8nDW4wV3XWbL0T1KR
         dEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789931999; x=1790536799;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWhRaROW89yV5OS3p3Oh/TR8um8lkux/C2SiVG/FN0U=;
        b=zoZhbeRTvYrohmg4k/dn7fDvRdOXwuVkBNxKzgAbxIv0Je8Y1G3tS6RqlPcZuJmeJ9
         0zU0XuoHOwTVSApKrFouLx1jOmDgNN2rpwMfeYtp7d5clgsk6ifmtmWcNLGhaiwiN8//
         Fr1miV8mD/ru7iYVz2B5NzlDx9FEEgFMPbuXKAVEekA0Prb1azlgp3aNSJ9irbzM2yZJ
         QEyp+jhviFftdNUdWidka0v6aUeO67QDrt01ZdO55SOcoWY9nbb/wwRKGCpuOYNk5OjA
         i/UHb8LentXfJ7wvhHCKvNUqkykAp5RsM3zGLf5b41SMQfK/mDFkbiKGmQVHwOifdlJp
         kXDQ==
X-Forwarded-Encrypted: i=1; AKwUvByIp2if46hZs0V7w58oNBgKi9FG6am2jjsUCamWMKv0lJVZclkf39zaUGgVheQIHyHdSdZlL1i5gusLKOo=@vger.kernel.org
X-Gm-Message-State: AFuF++kyGKiXkfo6xG0Y5Hs1ayG1BixwpW7ZtwF+AUlbzpzyNUA2oZpJ
	0vhlAdWQa5DWqyZnZC0nDrHgoAwu/Z3ulB8qL27erl0LBB2S9R+xYXMxi84gGB48Cc6zdclwsgA
	YiJhL7DE12IrGbU+6iSWKGzQZS+oZnOd9uBelPsDm
X-Gm-Gg: AYBFou136CxLO5TXEwSFtKRHaq+KgqKD73UzzYnPwyrFSBLJT0MocLmoAf7ynUD5dkV
	hhlsnowZ+x3IdW9vnZbZaJYl4JRHGUj5w8tjEOoIDI6TQBykRrk52MFIuojLOhbpmDV023SX1IY
	WmeejKNfkDXGiZtJ9QYM2DegG6otJxASWGd7gmTc0iQbz+ECAgsRthgd14tUeuuvxJS55CulHl2
	ZKvJhd8sx3KA89RaY+bt9Yh/NWRDajiAgF1GnF01n5W+WgISb95aU3hK6kPLExAygoXOdbV8cKH
	R+rj7MYwvJc8rIST/6LXtp5ON6Vk9vqrV0mAokO8VEIGJfzdxP70CNlW+zRgLiaZpXI35fdN16q
	X0yHMEkMrAsWaW4cYCWwgPbzyHMZw98G5soZ8bzW5/B9cxeRUl6dzottF8IGcSJiSzLD+uXCm5z
	cMWl46Gqw1xUeyDIyntZ/WKWI287j43GWAOnw=
X-Received: by 2002:a17:90b:4a01:b0:3a0:4abe:fcbd with SMTP id
 98e67ed59e1d1-3a04abf0758mr914250a91.19.1789931998859; Sun, 20 Sep 2026
 12:19:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919215238.3471141-1-benquike@gmail.com>
In-Reply-To: <20260919215238.3471141-1-benquike@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sun, 20 Sep 2026 12:19:46 -0700
X-Gm-Features: AcwNN1XNFaIA_FuRm5dvT0DJBzJTY_mCtk-5E27wg2ToTpoFvLwk3Ok8gbD_32g
Message-ID: <CAAVpQUDwLnRfv1PkkexsC04D8wLSeARekuUDSTOenyRctWG8MA@mail.gmail.com>
Subject: Re: [PATCH] fou: reject FOU_ENCAP_DIRECT with protocol 0 to prevent
 sk_buff leak
To: Hui Peng <benquike@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, willemb@google.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 2:52=E2=80=AFPM Hui Peng <benquike@gmail.com> wrote=
:
>
> In fou_udp_recv(), returning -fou->protocol to udp_queue_rcv_one_skb()
> triggers IP protocol resubmission when fou->protocol > 0, whereas returni=
ng
> 0 tells the UDP tunnel layer that the skb was consumed without freeing it=
.
> When a FOU_ENCAP_DIRECT socket is configured with FOU_ATTR_IPPROTO =3D=3D=
 0,
> every received packet returns 0 from fou_udp_recv() and leaks the sk_buff=
.
>
> Reject FOU_ENCAP_DIRECT configurations with protocol 0 in parse_nl_config=
()
> and drop packets if !fou->protocol in fou_udp_recv().
>
> Fixes: 08d323234d10 ("net: fou: rename the source for linking")
> Assisted-by: LLM

Looks hallucinated ?

commit 7a9bc9e3f42391e4c187e099263cf7a1c4b69ff5
Author: Kuniyuki Iwashima <kuniyu@google.com>
Date:   Thu Jan 15 17:24:48 2026

    fou: Don't allow 0 for FOU_ATTR_IPPROTO.


> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---
> diff --git a/net/ipv4/fou_core.c b/net/ipv4/fou_core.c
> index 5e867f1b5c1d..3fc087c808bc 100644
> --- a/net/ipv4/fou_core.c
> +++ b/net/ipv4/fou_core.c
> @@ -77,6 +77,9 @@ static int fou_udp_recv(struct sock *sk, struct sk_buff=
 *skb)
>         if (!fou)
>                 return 1;
>
> +       if (unlikely(!fou->protocol))
> +               goto drop;
> +
>         if (fou_recv_pull(skb, fou, sizeof(struct udphdr)))
>                 goto drop;
>
> @@ -696,6 +699,9 @@ static int parse_nl_config(struct genl_info *info,
>         if (info->attrs[FOU_ATTR_TYPE])
>                 cfg->type =3D nla_get_u8(info->attrs[FOU_ATTR_TYPE]);
>
> +       if (cfg->type =3D=3D FOU_ENCAP_DIRECT && !cfg->protocol)
> +               return -EINVAL;
> +
>         if (info->attrs[FOU_ATTR_REMCSUM_NOPARTIAL])
>                 cfg->flags |=3D FOU_F_REMCSUM_NOPARTIAL;
>
