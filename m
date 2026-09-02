Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19637408035
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339668; cv=pass; b=YM4XxrvfoezkW+ezmZ3V74itcn3356/ULcDcDtPemYQRWiVlI1EfuwovxtxoQg5AEttJQIO8DQvslHx1U7kR+EqoSmY7PAx6UcQISJUMFImDrmjmbS6NDvUP/J1EFqgt1IhYFWB7aNctZh0hhDICRuPq2GFc4uSV5v+ZafWCUhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339668; c=relaxed/simple;
	bh=uHZkeES0Qh015wvVfxByAkk2zg9ICYWljnWgfM+l2Xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e+WOt0YaL0cYjfNXWXu2X8tAzrazYaCgfZDv0zp70z00R0BEaB3HA6Nb2rUCFDwCjCpvihY6E4W4X3XdAvhdPZrTl8yFwtLxl8pM+oCKwBGJemvielNvwOg4Mh8eql67u2vnDvdJTLaex9XwaIs9gDDsYac/dzQYEpIZdsGP5m0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=POqfr4j4; arc=pass smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="POqfr4j4"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e99ef0902so74435585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:01:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788339666; cv=none;
        d=google.com; s=arc-20260327;
        b=at52U15cN+B2d4igmhKGQYX2o31IC8IiLd8mSU9XreBRyVbKuAf9gxq8lkd9npt5cV
         4mrL3ncfSq006YAUhXBcmUF1bhcJhZE30jZ7b1NDP7p4qEIBZI3ySUKkeMyK8q628TUj
         BZ2jPkft10aZiHw/jstiEknTIWfgwIMhQlfgmKo9dJHWoLOgHuMEz5Cn4hkL+POBluK3
         b7uBQWqKcw0882bvW38iZdAToX4mzC+3GMhVZMYT7FjY7EVkmhcaA49e3iu6u05zINuT
         rh8VTItVL5oS8dq5WYiPkotVurhUuwTiLtDY9rv3joAh7izBm3TSWsZPEys929UgmBEk
         MdHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k7pmAWuhF+rEO5j4BwBFEugZqHuHAY2sA8oL4ax0CzQ=;
        fh=sXcmT/or7JNkq2Ty1qAeI/f/49tlKoEl0uN2l1iT0ks=;
        b=RLgSAT8WZF6C6ASnQ5Q2eesMrywbVjIIloBCaUlVAaNyemC4LnyNfw1fg45IEcVrwW
         78nPlC+GiwWNQHrMTO4UpUsEw+ph7Bw+VcSqxN7FIAIeqGTw676z0P6c/f/1xrqEvc9F
         z5vvJE++ML0JEIVHPxRbodTPPIouVNat0/AInvqz6VWngeREaef1fKg5nA6W8s3LEXd4
         VtI54Ss3yFNLg2NsU5aU4HRfzNvWSDX5KKp0/aVZP9D+w+yJNZeFCzC2dVR2eKAqHvYM
         dz32nLRDX3XE56Ac452YwfnTvk1vvEOgd3rz3N+mt2+rKyja94CMQs9Ra7lO0SMFroSx
         uuXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788339666; x=1788944466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k7pmAWuhF+rEO5j4BwBFEugZqHuHAY2sA8oL4ax0CzQ=;
        b=POqfr4j4rj48OepMiM1tBTla0SI/sdRaJTbRxeZCjHAdPnSSZ+CrHY+vljXiDesBCY
         5qydvuU9L3vTFTMUZ/6DbSbbGYvt52j6bW3FkqXxxwG699ctEsT4DV56pk9y4WtZmlZq
         oWdBObX6Ng9xcjC2H9Xq6kB5zFFsqLNbCUWNvdIY84xALCpX/tk0JeBpU8NQR33cPJ3Z
         PEUjGeH3Gl4zZt/u0A7MlYvgSEdhFD39s+CqDPlEgQeQA5+soLgdfT/i0Gv7c7tWQoRC
         ZMhM8G8cOv0q9S8DApAxDPG3s8n8CWIZ3Wg5BJ9Hwg/ycGz9PLld+wNWGSMSTTA+gZij
         DeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339666; x=1788944466;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7pmAWuhF+rEO5j4BwBFEugZqHuHAY2sA8oL4ax0CzQ=;
        b=LRDY7hRm5Q1pp4ga7j7LEZ7pj/d3Sy0NGr27+2wel2zUdym4KwwAC+1nflgQknts3v
         XIOciFgChbRTiuTL+WZH7umSVEc70XBAgiRVoIG5gk7JJQ1cuBJsuA6pFCmExryGMmk0
         TJoYW9BV9aSz1Cq2AD5mGxCB48Scptl42HS61tZe7bnlK4Ys/cGM0zxehTltYP3I96cA
         ZsD1OoBQiyaLtciPMe9Vcz//1rhAZaIklSWAbPJ8b+6jQ2SebYwZGUc5MQ3aU4TzHxl/
         qQx6R3mc4Y04n2oIfnfyq1rUe4e0EC8IylmdWetlwMXk4/Z+Iyn7ej5/b3dEQ3nLQLmJ
         Ns2w==
X-Forwarded-Encrypted: i=1; AHgh+RpmLwj6iDzKydr8lbL2c4ZZjaLWggwCggItoxg/p7jTTLDnG/F1N2J1RO7c9tYabp8y5TEu1UJ652upJ9E=@vger.kernel.org
X-Gm-Message-State: AFuF++lp34WLIHb4AFLuKnQkRTwILDv5nfT6yZnA6U+RvAa9vaCOkbHb
	LKFF+VnIXY1BNWK+Zq8uZkmqJqh1ZCQ2nXTN6UFRI1UXJsPiRjx7I2ruNvm+OeQ13Np6Z33wZiO
	HMMozX+TKVOA+5WoRD+QuCbBDGzz9V/NCUaVM0B5v
X-Gm-Gg: AR+sD10UjpQTtpM69MyFkAAPS0ZhmhQRInt5ILwFCUS3zMrwQgQt3d4aam3y4jKX9Fq
	ddrNUrr23omoksHwzlGXq5gLehaXw3vX0/7n3zFvPWtz7AeDic3Tsj+aDJvFMOCdcQQ5IIkCmyj
	zxx6yejgVbYkH7ZzzPIWuWyCZMxZ7uLqSuDlp4RSTgtYrOiXLpO7419e3DPwxnxoxCCCWX2XoQv
	sv8RLhka8G1p40x4PsK7HvQj6+iAVyF6pGpLIL2wkzi0dUKChiNWCGL2lRJzKgrMm3aIdsvHp93
	wVMTBI/JF0iSih8x25z129docsGZs9+Vvs0k784Shkkk3MBJS4BDLi34Ojb6KsH0KuZQSMcTgMz
	CNhgp3LNyfcjuETCtbSomR0MMNSyfbWLeDWnr7luSne4eYzcVGip0ADK0Ag==
X-Received: by 2002:a05:620a:29c9:b0:936:883d:89c6 with SMTP id
 af79cd13be357-93960f53c0emr385584285a.28.1788339660414; Wed, 02 Sep 2026
 02:01:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-seg6-l2cow-v1-1-e823ce216454@gmail.com>
In-Reply-To: <20260902-seg6-l2cow-v1-1-e823ce216454@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 2 Sep 2026 11:00:48 +0200
X-Gm-Features: AcwNN1U-GKSWJrM4lQsUKKOSfPFZUxKc5tSDWT0xE280LLCX3qc_9KifJy9YK7I
Message-ID: <CANn89iKUqjbrRkr68+S9nKAu49C3K01e3XSNwkY1NCgmuPMPag@mail.gmail.com>
Subject: Re: [PATCH net-next] seg6: reallocate the skb head on L2
 encapsulation only when needed
To: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Cc: Andrea Mayer <andrea.mayer@uniroma2.it>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 10:34=E2=80=AFAM Yuya Kusakabe <yuya.kusakabe@gmail.=
com> wrote:
>
> The L2 encapsulation modes of the seg6 lwtunnel reallocate the skb head
> on every packet, where the IPv6 encapsulation modes reallocate only when
> they have to. This site only has to fit skb->mac_len before its
> skb_push(); the outer header that follows is already covered by
> __seg6_do_srh_encap()'s own skb_cow_head(). On a forwarding path neither
> reallocation is necessary: ixgbe leaves 206 bytes of headroom, against
>
>   14 (skb->mac_len) + 40 (ipv6hdr) + 24 (SRH with one segment)
>   + 16 (LL_RESERVED_SPACE, via dst_dev_overhead()) =3D 94
>
> for the whole encapsulation.
>
> The cost is amplified by CONFIG_INIT_ON_ALLOC_DEFAULT_ON, which many
> distributions enable: every new head is zeroed in full, and that memset
> alone accounts for 16% of the datapath profile.
>
> Use skb_cow_head() instead, matching the IPv6 encapsulation modes.
>
> Throughput at 0.5% packet loss, 64-byte frames forwarded through one
> 2.30 GHz core (Xeon E5-2650 v3, ixgbe 82599ES), offered by TRex and
> binary-searched over 10 runs of 10 s:
>
>   Before: 660.7 kpps
>   After:  991.3 kpps
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
> ---
>  net/ipv6/seg6_iptunnel.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/net/ipv6/seg6_iptunnel.c b/net/ipv6/seg6_iptunnel.c
> index 61c6a27bf202..a6556efd8e0b 100644
> --- a/net/ipv6/seg6_iptunnel.c
> +++ b/net/ipv6/seg6_iptunnel.c
> @@ -446,8 +446,9 @@ static int seg6_do_srh(struct sk_buff *skb, struct ds=
t_entry *cache_dst)
>                 if (!skb_mac_header_was_set(skb))
>                         return -EINVAL;
>
> -               if (pskb_expand_head(skb, skb->mac_len, 0, GFP_ATOMIC) < =
0)
> -                       return -ENOMEM;
> +               err =3D skb_cow_head(skb, skb->mac_len);
> +               if (unlikely(err))
> +                       return err;
>
>                 skb_mac_header_rebuild(skb);
>                 skb_push(skb, skb->mac_len);
>

This is a nice improvement for forwarded traffic, but locally
generated TCP traffic
is still hitting two expensive reallocations (second one in
__seg6_do_srh_encap())

Can we combine needed headrooms so that only a single re-alloc occurs?

 headroom =3D skb->mac_len + sizeof(struct ipv6hdr) +
  ipv6_optlen(tinfo->srh) +
 dst_dev_overhead(cache_dst, skb);

err =3D skb_cow_head(skb, headroom);
if (unlikely(err))
        return err;
