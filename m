Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02340345CCE
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789340894; cv=pass; b=E7QG6BATKbrT8f/hlC4pfOFvk/HWeB9nv3kvtqbGpRJhQjoowf1xk0BYZWwJMe3YzM1MpwMjwba9l2Mj/pQZc/ECVW7tAnO0MKJP4ro0kFFVi7KeLRVMbkoHwrqMOcQR4YH1OXeEQ3yV7MhMkg+Ba1rs9KOnz4JazG2kLLialsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789340894; c=relaxed/simple;
	bh=DXes9xsnyMTyzixU1rmSeIaBDLxOPxqOwPIfYET+/jA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cE/1ZUrv1IThZsA1/gKOL4rW0S2SV7w7nfuf9XzHs/DEfenfpqGrsgvjKAiShkyroM6UfUFpTsJec0cHgnedRrBi5AkwFU7Smk89Gs4d9shvZ8tiglKU7N2RWlHrepiW0S8PDfHwRYrr/0q1qfRJ8IhRM9zgKpITf/NtBWSynrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hn5toEpe; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hn5toEpe"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76906adso21481871cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:08:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789340892; cv=none;
        d=google.com; s=arc-20260327;
        b=i5AKx2DXzEGd9xq2Xw6ougwn9d+lu/KtctLcgNMxNnWW4bSaJ+LwA8Im2/UO5h0nrH
         CsxF3eElxGtvxdLp23xrstsCn0VNZJeRpbKEZlNJpKhkbyNIzU8XJjhdTJ7DlTwx2Fht
         oDYxNSM+OKAxRBVUoVVeUWjLCy7l3TXLvuWxmIuF1CiVFL7pwfmNZDJgXiw2SPQe1BRJ
         mUljo1X0bvzJVTHO8Xz12Qw+JxqQaUr/FdEdpQnYJ2txbLK9WG8xtdsS+1WuqIiNDpVz
         jR5UKjq1vj76ovOy9zzkeYZvaxIkMKoBMmcnD9ldiAFk9EuW6Jv7XIHUwbHnGEE1scJU
         vbDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xRbG0DVQ5VHY3qqALlMkPrYtIobPfZTAAIFgs1QLm4A=;
        fh=91pJ/9rx2Pc1jIF9MML6gFUyhUYgD52An/2v18N//4U=;
        b=LT4DaUMMPhqCJPx8m5FsPE8rdccof6ti5Vt7VxvqxVSr5AbarjBo4WtMW8+vrNEOKH
         xWrBmZh4FO82ZrgJMbwCnPgrKdZdbq6O07L1x1yC6D+ZjokOVMW9qoRKey8EICQuY8Xn
         Of0vJ9On9TT0yaJA6VgmHpgn9+46XmmTDGxRJVVFAAPm4KsT5rEAU/TUDdYImMnJ8L9Z
         EaQA9c+J3547CU1PaYc+zF4wpLRBrs1rQnomkfHEtyJhOFdWyhOxgGfG0hCx8tJYB3H+
         +ADNfm9pEED56JxWfl9LNuMJy7vXZXwt1jZp1sPvhY+68XhEiA/LK+o0grDSjESNon9k
         KPxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789340892; x=1789945692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xRbG0DVQ5VHY3qqALlMkPrYtIobPfZTAAIFgs1QLm4A=;
        b=Hn5toEpeGOh2oMptvnwj1kHad8duX7cPO3qapr2BUXzDQHXVeQLTmh1ePl60IcNJmI
         HRGPeHzYYIvlM8PxAkyAUROlq88FqZcpdWu+6vs2xojdeAS7dPFArBOwzBRjolze6b7b
         qewT+Ixx4cwK1+4CbT7iWxRBkvIhGlyiJrT/dTck2Qu2ew55i4W6Q7ssYHXXY8JxOjMu
         uIyjzb6RSajpfqpGiWr5Sb8guOcK/bbbOPSMd7FytKru3HHUoXLrBDnPXXytQE40KAl4
         bRoohPtYfPFOKsuSuIBS5gBnI4kyvqBLyNSrOLGITdViYTtE9QLtiq5QK/B4VN4nmgbL
         MlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789340892; x=1789945692;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xRbG0DVQ5VHY3qqALlMkPrYtIobPfZTAAIFgs1QLm4A=;
        b=S/alVUfxjtexC63lCc3VwkRkYGy/M9ref9559CaNBskiLfbI6aahOMfk76HQ3PIgZc
         9uSQF5X9PP2fiefEFAIcJXKYa234Y1kPrzivdTMxFA6GRe5xZL7ZS0+wo8c7tOypdr5+
         OV929leUZxeUOQK2HNbhwAYvZtlbKweJhCWweWf+Dy/ICAD2O9quLa1oYY9gnEkUigww
         Fi+Fv6QazFNGOQw5C5ge6iBIWTO1AcX6jW2D2r3YxOha3Y6+AfvLecyyo7PDpMukcvTD
         ocKCi/DWn33j9z+llBqI2GelgHhmc8ZLgxfh4BFHMAgmQT/v0PETeAKbbtow8Fn46/zM
         u9Qg==
X-Forwarded-Encrypted: i=1; AKwUvBw/j6B63TKF+d1BsmbQTBDKJyEKAPksYhozYIGU9NKG0hfzr+6FU/WalukFITnhqHCvVOhV4KwIGw8loec=@vger.kernel.org
X-Gm-Message-State: AFuF++lXpGEvsTQxb+V9/dSv5I3yVMB0bjlujiV5Y/ms+VGAJpWKaY0l
	p65wJ4vupb5rik1t/SHDtR0ZDrJr1OoNaC8jsnl6qm6wjw/dZlmBWcpEWfsDocxzh9b2YuRIk0q
	xfPq92dhRqa6ObjilMpgybZUNECH79c1qm1EotQWGt7hOcpBifbfMWpFHLhY=
X-Gm-Gg: AYBFou3lDZhezYaGrj2/PfqegVHXT9FOdtH3VkAFDY5izpdy85aXlqWE8TgEmQBTYUm
	pAvHlvJImvTIUmliqMPcBuQ/avETJE5999gOlyVhtkn56ZEN5qN6Qomxi9RE9Imh1Y5VK6rZSmZ
	Pcouo7wD9KspTeJjK20DmY2KerbwKPfOMShwfDrPtp/wD6VWmcZpQnsbOgQ1LTHIOWkGgfLyQO8
	myoI5y23mk5tp/qcgBOozM+R24HnUPJkohw5u3CL+bgrKn6cDUyzpupeF1BNkoelC0Bzk05UyAM
	i1suz9ZsbXWlvX8Siq5aJVyVGUiv/EaPimJ+AlwhffJwPLHbaRLhAbvTrxMqv+dMedqPw3hTTF9
	iv+1h1ShA8Hu4N+wLEt3fVJWj7KD8d+Bdt1Phz57b6POVKBadAbPljKZZ4sp5WLwPHc8=
X-Received: by 2002:a05:622a:1904:b0:530:b2e4:d5a1 with SMTP id
 d75a77b69052e-5310d08ebd9mr1666031cf.60.1789340891034; Sun, 13 Sep 2026
 16:08:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789302084.git.zihanx@nebusec.ai> <a4f108b00c7d3c0997bfcee84a9e7e481c07ad5b.1789302084.git.zihanx@nebusec.ai>
 <willemdebruijn.kernel.57ad3a4d0955@gmail.com>
In-Reply-To: <willemdebruijn.kernel.57ad3a4d0955@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 13 Sep 2026 16:08:00 -0700
X-Gm-Features: AcwNN1XPieBwHmTcaQqSQYQyOFNrmOUAYYi4uLA-4au3SSGhTImp2iLuqjRICx4
Message-ID: <CANn89i+QqU5sw=WPrcki8W=-HoyNLpHGj2C568VHDU1CyZgodQ@mail.gmail.com>
Subject: Re: [PATCH net 1/1] net: gso: limit recursive IP-in-IP segmentation
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Zihan Xi <zihanx@nebusec.ai>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	dsahern@kernel.org, idosch@nvidia.com, willemb@google.com, kuniyu@google.com, 
	kees@kernel.org, richardbgobert@gmail.com, jiayuan.chen@linux.dev, 
	stable@vger.kernel.org, Vega <vega@nebusec.ai>, Luxing Yin <root@tr0jan.top>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 3:46=E2=80=AFPM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> Zihan Xi wrote:
> > IPIP GSO/TSO support makes IP-in-IP GSO dispatch re-enter
> > inet_gso_segment() or ipv6_gso_segment() for every nested IP header. Th=
e
> > only state that tracks this nesting is encap_level, which records heade=
r
> > bytes and has no recursion bound. A sufficiently deep chain can consume=
 the
> > kernel stack before a transport GSO callback is reached.
> >
> > The unbounded callback nesting was introduced when inet_gso_segment() w=
as
> > made stackable by "ipv4: gso: make inet_gso_segment() stackable". GRE G=
SO
> > support predated that change, and IP-in-IP GSO/TSO support later made t=
he
> > affected path reachable.
> >
> > Track the number of IP GSO callbacks in skb_gso_cb and reject the 15th
> > callback entry. Thus 14 callback entries are allowed to complete;
> > GSO_RECURSION_LIMIT is the rejection threshold, not the number of
> > successful callbacks. Initialize the counter for each top-level GSO
> > operation and check it in both IPv4 and IPv6 handlers so mixed IP-in-IP
> > nesting is bounded.
> >
> > Fixes: 3347c9602955 ("ipv4: gso: make inet_gso_segment() stackable")
> > Cc: stable@vger.kernel.org
> > Reported-by: Vega <vega@nebusec.ai>
> > Assisted-by: LLM
> > Co-developed-by: Luxing Yin <root@tr0jan.top>
> > Signed-off-by: Luxing Yin <root@tr0jan.top>
> > Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
> > ---
> >  include/net/gso.h      | 9 +++++++++
> >  net/core/gso.c         | 1 +
> >  net/ipv4/af_inet.c     | 3 +++
> >  net/ipv6/ip6_offload.c | 3 +++
> >  4 files changed, 16 insertions(+)
> >
> > diff --git a/include/net/gso.h b/include/net/gso.h
> > index 29975440cad5..2665acbb9205 100644
> > --- a/include/net/gso.h
> > +++ b/include/net/gso.h
> > @@ -19,10 +19,19 @@ struct skb_gso_cb {
> >       int     encap_level;
> >       __wsum  csum;
> >       __u16   csum_start;
> > +     /* Number of GSO callbacks this packet already went through. */
> > +     u8      recursion_counter;
> >  };
> >  #define SKB_GSO_CB_OFFSET    32
> >  #define SKB_GSO_CB(skb) ((struct skb_gso_cb *)((skb)->cb + SKB_GSO_CB_=
OFFSET))
> >
> > +#define GSO_RECURSION_LIMIT  15      /* First callback depth to reject=
. */
> > +static inline int gso_recursion_inc_test(struct sk_buff *skb)
>
> What is 15 based on? Is that where in your test stack overflow occurs?
>
> A realistic practical limit would likely already be smaller.

An alternative would be to limit total header sizes (nhoff) to 256 bytes or=
 so.
