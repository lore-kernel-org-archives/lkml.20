Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB6B4D09FE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695735; cv=none; b=qiE2b1ExFkq5bT5PrID4lcH2IWjvoC0NoFMejBGZrHeEQVGHkonN0X9hrOHHua3nlhwDzIYr7UkvyGp4CIqDk6iKrRs492IUQWAbmVMLW6jdIGJJ3eLQKLvQ50/0zYI/1NzyXQceUqPtm286h9pJ7zR8puoTKO5K2cWvYTZa+z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695735; c=relaxed/simple;
	bh=5I+PG1LJwpZfrorxHQ6vHavEcbMCTKjy9jPyw9xe4Vc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=UwGHRSVu8hOHqdfC/JKJBvNcwPomHL0PKPIx8B10sAyIlbYwzn7QfbgvsAVen2xlwn4UoCWmz2V0nCWDUFL1hAXRrBPmR7VxqoMUs85+FeEEQRDuKGycbLiWx9gEnpHY6CS1geTdO442EOM8OUHgvMr8WOSVsH671x2WNvaMZN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4VnoWOc; arc=none smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4VnoWOc"
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8ab42612328so9366437b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695729; x=1791300529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hwlExALEuIqma+phYwZ53l5lEw6aiZrSHMRC6Erf8OA=;
        b=W4VnoWOcHwdnGGvzV85AVV6fisuTNHcLwQOmz0zjjM4q3vSQLALNqOCC+5rl/84ZJJ
         rdcL+qwFz7Fqd05uQMEbV+JeFk5V5FMIOIUQO7SUVFUi8qNwbLiswpG+ghM9VaeKoM0z
         4MxMzq41lsEinlTFoLVPKBiEY1MQW5liMBpzFX6KhJ+BeDThpDr9QBSkbqS4jC1GgC4x
         Xdz2qCOWwZC5soJfJ5wcrmx40WAJAJXSpplGYUXT031ixBlFssATn/1vZPzz7yMYJhge
         7gIxdytnpxALkHbOmyUQDl3FQxoWbgkd69oc7z3CKdYpU2oMhIYpJqjpzZFHRtf+pu9w
         R3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695729; x=1791300529;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hwlExALEuIqma+phYwZ53l5lEw6aiZrSHMRC6Erf8OA=;
        b=lhVKFlwRNfl9Z/fByQFOufspjAD2sUa3cP1wj6lFbAz9dr/jkpfFyUUWyEAsghrRZh
         rPZBsLG4OZ3GZ35c6dxvpulO2Vn+Dys2c2bmoP7FctzU3seaTyWRrGUgkjyTZa4jdlmy
         4Qn3ZXPid4Yskwusz371V3nYOTE1CCmm7Y8QCQAwxaMf0y02joG6jRVCiwr3fm+r7Omu
         NdcIJHNxge2GfxJqP+HAJsi/1GvheEzD+JR6jqrSLIBLK+TyX13rsSjGUViJPJ3fd+LY
         ZUpMa4MTLZ/F2JUH89/77Mn37T0zsVKl6aCGU/z7ksRCrN+B5+yr3ohhQ1ldGA5z5xoT
         QHHw==
X-Forwarded-Encrypted: i=1; AKwUvBzUFO+Il4uxSueVkV+cJgFdG8IsXl2CL0ocC2LlNqfgvy27v5HvAIDrxY8cIzfnprbKhfpkHwZRtBfNSuM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9Fx4qo7lXBoTpumhP5vzx3f20DzViBbtF55uTrePy5jsJ+GDJ
	/g/6UbbXviHgXU0RKVjDy8IesL5PBR9VbnCK9ZV+nkRVcMnq+02pbUUq
X-Gm-Gg: AYBFou18DlNwppiw3FQzGzmNKQqdbrCOG+OMDG36hSjWBQYadWS8txgWw/ZjFwRh/5y
	kQn/mRMXsfRdu7obQ612EMc+jbvEMWu/rQ7tNvLmb6nxZ/EVfxmMO1Hb0PQc7UcFQ3K9Ij4XzFO
	+IpMCLm+q0Hw+fSvjHTkB/EaD7q9KeeV9i5gHvEd0Uq05yWHz3Cojnhl58M+f6nDi/HUKpMbDE2
	EYKdi2WwpYe4dg9uA/F6wZwYZIVETo8kBEmcsTry8hKXZL+qVeNXG40hE+tLdCJMFirsVW5U1PA
	SF0ZIWzrs1Fi3nmN6vyilxSOlNOIpKSfhHftx47gxv4AjX4YRYoa+00nkSPuouUZ7rEg5iKG3sI
	95vaYu3zA5ft5gZCjlkwx0MO4iE6EwNJTBsRN4vbhWxkTTf01w3TupKGwNWLhqdHOeN9MpCuAY0
	Gg4jtXh+0gmYKAG4IhjtgX6gkOlBkzzlMVs4o37vDvHe3tjXM91lE3VzNVMNX/POwQ5qZ3xFNdi
	ecdotfJnIttvvyYLycWxFPEdscQ3vGRjTzy0nY3Q6qb3BTlI+1T
X-Received: by 2002:a05:690c:e3c3:b0:868:505e:b96d with SMTP id 00721157ae682-8a64c3432b4mr71353467b3.2.1790695728518;
        Tue, 29 Sep 2026 08:28:48 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm60998327b3.24.2026.09.29.08.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:28:47 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:28:47 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Shiming Cheng <shiming.cheng@mediatek.com>, 
 davem@davemloft.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, 
 willemb@google.com, 
 daniel.zahka@gmail.com, 
 alice@isovalent.com, 
 sd@queasysnail.net, 
 eilaimemedsnaimel@gmail.com, 
 imv4bel@gmail.com, 
 nbd@nbd.name, 
 dsahern@kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org, 
 steffen.klassert@secunet.com, 
 lena.wang@mediatek.com, 
 shiming.cheng@mediatek.com
Message-ID: <willemdebruijn.kernel.20906a8caa141@gmail.com>
In-Reply-To: <20260929100256.23192-1-shiming.cheng@mediatek.com>
References: <20260929100256.23192-1-shiming.cheng@mediatek.com>
Subject: Re: [PATCH] net: gro: mark frag_list GRO packets as SKB_GSO_DODGY
 when a list element exceeds gso_size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Shiming Cheng wrote:
> When RX LRO (or similar offload) is enabled, the TCP/IPv4 GRO path may
> aggregate traffic using frag_list. The resulting skb is later segmented=

> via the frag_list segmentation path (skb_segment_list()).
> =

> However, some drivers can hand GRO/LRO-aggregated frames to the stack
> where individual frag_list elements are already larger than skb_shinfo(=
p)
> ->gso_size (i.e., an element itself contains multiple MSS worth of
> payload) and may be non-linear (nr_frags > 0). This shape is not
> naturally produced by the software GRO aggregation logic for devices
> without LRO, and can lead to unexpected behavior in the frag_list
> segmentation path.

Did you observe this with a specific driver?

We don't want to have to support every crazy driver scheme. The right
approach may be to fix the driver.

To understand the geometry: the driver passes a GSO skb with frag_list,
where frag_list members may be any size, not just gso_size? I.e., these
do not conform to SKB_GSO_FRAGLIST rules?

I don't recall immediately what the acceptable behavior for regular
GSO skbs with frag_list is. But for starters such a driver should not
advertiserr SKB_GSO_FRAGLIST.

> =

> Detect this condition during frag_list aggregation and mark the
> aggregated packet as SKB_GSO_DODGY when a list element=E2=80=99s length=
 exceeds
> gso_size. This forces a more conservative segmentation/linearization
> behavior downstream and avoids relying on assumptions that do not hold
> for LRO-produced aggregates.
> =

> No change for normal software GRO aggregation: the new check only
> triggers when skb_shinfo(p)->gso_size is set and a frag_list element
> length exceeds that size.
> =

> Fixes: 3a1296a38d0c ("net: Support GRO/GSO fraglist chaining.")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Shiming Cheng <shiming.cheng@mediatek.com>
> ---
>  net/core/gro.c | 3 +++
>  1 file changed, 3 insertions(+)
> =

> diff --git a/net/core/gro.c b/net/core/gro.c
> index 29b4d02bf519..e70ecf19b0a7 100644
> --- a/net/core/gro.c
> +++ b/net/core/gro.c
> @@ -259,6 +259,9 @@ int skb_gro_receive_list(struct sk_buff *p, struct =
sk_buff *skb)
>  	skb_shinfo(p)->flags |=3D skb_shinfo(skb)->flags & SKBFL_SHARED_FRAG;=

>  =

>  	NAPI_GRO_CB(skb)->same_flow =3D 1;
> +	/* frag_list element larger than gso_size (already coalesced before l=
ist-append) */
> +	if (skb_shinfo(p)->gso_size && skb->len > skb_shinfo(p)->gso_size)
> +		skb_shinfo(p)->gso_type |=3D SKB_GSO_DODGY;
>  =

>  	return 0;
>  }
> -- =

> 2.45.2
> =



