Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766BB550DCE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088579; cv=pass; b=PtzeoGcZZrQ6XaPELX2tH5Rz+j52hRO1hlz97+V+1Z9iXo12/xyAm9gZnSHly2+fvfqVF7UV5S/zgfCME1zQ/tt3hzZwRc0xaoVGSWekf7o+zbr3APCXZS0KhtRLtw38M1icm1YYVONl4USdQbW5Y9SlKleRBGG8NzmtHsV/Dmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088579; c=relaxed/simple;
	bh=lnM6cflH5qTNJpyQohcX240ZcGNVfa0xrvRKgwtXMwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gmAUIS28WHzzLCdmBcQzujHsV+QgsxSBDuqRvGFToAhDZVlHe4ruyCnL4LxnHHf1FE+iTOrnxt7/eZL0PDMAX/dE2T6kumO0edLIBbdKrxXp/ZgzXj3uTMoS3Ej8qe12HiSD1cLIkNd7OvDdyz2y9YUW5vyeNlVgr0h1kFN05Vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Oux6iLug; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Oux6iLug"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-895353e9051so551517b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:49:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790088577; cv=none;
        d=google.com; s=arc-20260327;
        b=Eyi0Kv8pWc2MoR8b1DOJv14O9ucmnnIXT+UurMRXus8S5JzS5F4lY5u5OgxWvuAhux
         E/SplkKWCc9QaOwGiOuxBMKBkuZqHjAnEnecXLikp2HzFHkH5bcYXLoG3TORyX5QcGHq
         J60ftXmwX+sAchWNZyS56lMTkXI40SEndYhBgTQrtI9Zf67rkUizqjwcIyKDLP7cC7mh
         AzxhgvF3MekFPDIU5fJTHQqC2u2ZM2qbmAlspOJBXt+Yg170QTsDJDv20PxTl54yLGYs
         FLjMWCJ6fX1dmq4WaZX6wcZf7JMbTcdajU5AkKRiKRe3mjxKbhMqHDDPGEIVW+XXNg62
         e3MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G8MvaWMCazWtxCnTR9jUdmR6JJDJY0FfT6motlrbuSc=;
        fh=1+DXbVKhNVDiI1CuevmDYGZ/osqasyLxf1uDsU4IrKg=;
        b=emNr4KfZu84+wnmniGZ/8j7lVPb9rfKeCOfjtZQxygA/qiO30rCwJvjOI21t4ULAlc
         zrNfGnLUz6uLlwH4BnE5YPFX6w7ULTAgEwLSqPuV2xWmzHXhHQImEIj7TcTTBXExyrGj
         Jrhd1TI9Gq4VKZoi6vdvrSCOZmjun2OC7cB4qKfkWmU0nHb6aJVGNLfF2+k3hNyrUkfU
         1l01Zzm4zRsYkFROSDQoX1YO8Bv/irFdYEAzjJMrUubYIdgjkmlixy1qNeBB4TmCF5Wz
         PzY5lYapm+vd1ukLKXeKPix9yaJXI/51uQK07x7RrSIPvAdwHFUHPAjDU1xEL1LzNq7L
         VKEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790088577; x=1790693377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G8MvaWMCazWtxCnTR9jUdmR6JJDJY0FfT6motlrbuSc=;
        b=Oux6iLug6883rYdSsMzynwe4+J9HaxKHksNDRVAt6l+LXDy85spqVl+PNdoAEAtELh
         FD5KMhgWVo5aZZp/FzqidAXhMeSpZNDJjby5FPcz7WutkNuzxjkooHEqPu7BptTn+sgL
         dM2BSC7ahL7JewW1Wq/UYNXWHDqlzNN+0WN2wA9F1WNZ0Ro0uxQgL7cBQjd6qtu4k+Co
         21dUNaSNNc6imGxUpKglzimw+istHj3GJ/eAutAwIUiAWrsQvQ589OBIifMUYGme7KOH
         iaycY3633pGKEC1vvxE/JnawpwQ8T2LPod8ILuHXT1e5tf93XBidVvcgjg2wFUvGV3uo
         gfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790088577; x=1790693377;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8MvaWMCazWtxCnTR9jUdmR6JJDJY0FfT6motlrbuSc=;
        b=iSpJFVdL9MD7j9/bLc7zha7z1GjgXcCkRFgDAAjINOhfOi0TFFgmuY+8OPmJOZlsaq
         hXgXCIR/q+qZGyo6Ir+BTKy0lt5FeO1wCf52xrxbrAI42GBV1Ft8d+y5F/kBd1K4OqRQ
         wLaN8LdSYCyHcllqXyPMN6SE87iLcBDkXR3pTsgx2E2b54zMpkJyIapgYYccPkEWlI07
         gmH9vz1HBkCdaJTFerOKG2RgvUXMJEBt88VvqsE5H60B/wzqDNuyJAz1GqR903StcWBB
         qfaS76YEhzzWeQldt9ihJZQGQxknADGsgidYDSmADTV9gA8rIE1pvgGKBUsxZBqcOz5X
         0cqw==
X-Forwarded-Encrypted: i=1; AKwUvBxhutMl8/lXI7qIMg1D7+UKaHA/W14tAikQ6XzhIL3+pPg0IuQ1Rguv4YqTUY4gxPX1z3D88f5JwrKl58w=@vger.kernel.org
X-Gm-Message-State: AFuF++lY1UUSP6gSO6/FfhKpOTxeHb/MJkeHWALNVBrYc0WNqqJrfKaI
	G+yb+igOCPIDJ7SPGOkz2RenaYnznyolAlO7vhd+b24yYFjX9ILMFnQTgSCJqJE/7ycWEmHWF0m
	6g/bBN3gH9bmW2azsX9PWfAFHwUnh+qeSyolanPRx
X-Gm-Gg: AYBFou294eZ9W1QGlLOXgiMrO/OgDoOv2B07p9sM1ww9kacO/3pGX/RzKTfT2R0J2V2
	OmoEbId4xpiO1muM5+XG+fLZWFH2ppaPz/H52OYMUIwHpBf8b+bAiy5HvT1z1rsUtFCwEdjcZrV
	AT272u0yocEJWO+qhIQRW0r62jKh3ae04kJjvbxRJ2ofSI9AWAzliCjaxPqnksZFHUDVHl/oM+L
	yTB4TEROUtUcJ9kghinYRejBpIFE76+pKouMefFBi8vZH5rpkJzPyrWl2HL2P1Qihrw/DmVs64x
	R+LEizHYFs+Ww2BqkhRqU7W1c7z8h08djtv7UBz8uLkQfldPIuaIsUiTOhgimb8xL2vtQcESjTa
	nXcrxoMnebLRbx3n/Et2Zqj9VGj222S67vYLK5KCWS7XoNZ5fv+KKFg9HUYvgTpx3EGCMadCJeA
	pq7nqg
X-Received: by 2002:a05:690c:9990:b0:89b:689d:3a70 with SMTP id
 00721157ae682-89b689d3c55mr42712967b3.39.1790088576671; Tue, 22 Sep 2026
 07:49:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-seg6-maclen-headroom-v3-1-7b2f982ef79d@gmail.com> <arJlHYp_IfNJG7jg@luna.proxmox.com>
In-Reply-To: <arJlHYp_IfNJG7jg@luna.proxmox.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 22 Sep 2026 16:49:25 +0200
X-Gm-Features: AcwNN1WnmuGvT820ZPeH5DHeqTMnmj18VJ3_JXIm3EFgvsnQBAL37Y3cuAy-_x4
Message-ID: <CANn89i+cnnb2mM90JZ24qWUgs-Y9gcsgFSYdaVrNjWHjn+b-TQ@mail.gmail.com>
Subject: Re: [PATCH net v3] net: ipv6: keep room for the mac header in dst_dev_overhead()
To: Gabriel Goller <g.goller@proxmox.com>
Cc: Yuya Kusakabe <yuya.kusakabe@gmail.com>, Andrea Mayer <andrea.mayer@uniroma2.it>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Justin Iurman <justin.iurman@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 1:24=E2=80=AFPM Gabriel Goller <g.goller@proxmox.co=
m> wrote:
>
> On 22.09.2026 05:49, Yuya Kusakabe wrote:
> > The seg6, ioam6 and rpl lwtunnels size their skb_cow_head() request as
> > the length they are about to push plus dst_dev_overhead(), then push th=
e
> > new headers and rebuild the mac header below them with
> > skb_mac_header_rebuild().  That rebuild needs skb->mac_len of headroom,
> > but dst_dev_overhead() leaves LL_RESERVED_SPACE() of the egress device,
> > 16 bytes for plain Ethernet.
> >
> > Where the mac header is longer than that, as it is on ingress through a
> > VLAN device with reorder_hdr off, the rebuild runs out of room:
> > skb_set_mac_header(skb, -skb->mac_len) computes a negative offset,
> > stores it unchecked in the u16 skb->mac_header, and the memmove that
> > follows writes skb->mac_len bytes about 64 KB past skb->head.
> > Forwarding plain ping6 traffic through such a device reproduces it on
> > all five seg6 encapsulation modes and on the rpl and ioam6 inline paths=
;
> > skb->mac_header comes back as 65534 on a 704-byte head.
> >
> > Return the larger of the two.  The helper already returns skb->mac_len
> > when it has no dst, so this only makes the other branch agree, and it
> > covers every caller rather than each call site in turn.
> >
> > Fixes: 40475b63761a ("net: ipv6: seg6_iptunnel: mitigate 2-realloc issu=
e")
> > Fixes: dce525185bc9 ("net: ipv6: ioam6_iptunnel: mitigate 2-realloc iss=
ue")
> > Fixes: 985ec6f5e623 ("net: ipv6: rpl_iptunnel: mitigate 2-realloc issue=
")
> > Suggested-by: Andrea Mayer <andrea.mayer@uniroma2.it>
> > Assisted-by: LLM
> > Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
