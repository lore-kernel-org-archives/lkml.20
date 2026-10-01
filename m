Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B4B3C3443
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838995; cv=none; b=i0DNUCEPymgJe7KZY/1hLwloSGlqe3LdlxOkhBmflbfyxESIC7ZHZ5WFUJYWgQJuct0nXOU7WAiHHGDKEw6ZfH6PyZDLmg9igm9qXQWdDa8IlnJA19SILv36VWwZXD1XuCY2uC1otqGFRF3AZMnPVvA50OgUkaDY2kMghn4Yk9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838995; c=relaxed/simple;
	bh=Pc4G3dOZrc4gtia9HfeDdf03/kdnNOxdtkGl342iPbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HTLkICIH4XKRAvkAcrn6X6atk2xRqn3us1Dsa1ND9MvkgRnFBsgIEbq2EwPa9CyUoqWs+RyqbzNnz5SeGazxCBWjoiLk6H0LAS37akawuOCi0ipIU5kZHodaepplzRlYiRjWykRPn6Ye+T3NN1HCNbv9QYs0oDnhpkgFd/zT8dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NUDHIJCx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUDHIJCx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB0401F0089A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790838985;
	bh=Pc4G3dOZrc4gtia9HfeDdf03/kdnNOxdtkGl342iPbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NUDHIJCxBOLRU3ANfcGDlJ7FYpLEopSaYdlQzmmSeOhG3o4qykTC4LVOdqs02t4tG
	 6ptStaq3AW/+iqnLMNrjMr6W0rDz4I+U0kCbScCPLCTueaAeqc54UavWI78KB9QsHK
	 1abHrv/hcudBW2XvKeRVkETgDd1c1QErOSVV1XozK+8F2jqcflkPcEE785d/KEsJCO
	 qw2TAmfltS+uoInrcUeYKshEWEAvgBGyQqKi2xwKfdZq/3v6MSuJLXYjYKavipu8Lu
	 2O2WK+nvsIA8MTFIsAE9Y9y9mAl9qwX+veLxCs4tW/U0WHEpRWhkx0UD9xjUdyBm5w
	 P7rFj9fSdCXCQ==
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc88a9b9so4145691fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:16:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzT/jSzWXYkHO/moIvRswWGC/XtP40phxJngVdHdruD5VG5yI/mLFPE9f73LUpz7jlGSpqWm0KTXTtB0Vg=@vger.kernel.org
X-Gm-Message-State: AFuF++lIyNDo0uq0ZG3ULBXpLpGDaEQf690gmoWeJMeI/+wOqy5tPdlw
	0UjgX9Jjlic5JHzvW3Wj/vtztXQVRBarad8Uae14c4mL/eUy0yTVSByrzCEAeeUJAt2aFg5bviV
	GtOfgr4S33RsEM9nQzKLAzGRMO0Uf5Wg=
X-Received: by 2002:a05:6871:2b25:b0:48f:e0f6:c036 with SMTP id
 586e51a60fabf-49dddb7bad1mr4057749fac.52.1790838984306; Thu, 01 Oct 2026
 00:16:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928181557.85796-1-omar@blockcast.net> <CAL4WiirokTFzOqFNr0eOWucpqkJoGR_4s19cBAEN3O7E7ydm5Q@mail.gmail.com>
In-Reply-To: <CAL4WiirokTFzOqFNr0eOWucpqkJoGR_4s19cBAEN3O7E7ydm5Q@mail.gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 1 Oct 2026 09:16:12 +0200
X-Gmail-Original-Message-ID: <CAL4Wiio2oJr_z-2AMHnu200eYjrjBcLUKvsqvx04O+J4_z1tfQ@mail.gmail.com>
X-Gm-Features: AclHuK-gU8aHmcLRBscoSTSuBISnGa9yJikzoAiWbEj471LriSP7CUyzVaVF7xU
Message-ID: <CAL4Wiio2oJr_z-2AMHnu200eYjrjBcLUKvsqvx04O+J4_z1tfQ@mail.gmail.com>
Subject: Re: [PATCH net] amt: pull the AMT header behind the transport header
 in amt_parse_type()
To: Omar Ramadan <omar@blockcast.net>
Cc: Taehee Yoo <ap420073@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 9:15=E2=80=AFAM Eric Dumazet <edumazet@kernel.org> w=
rote:
>
> On Mon, Sep 28, 2026 at 8:16=E2=80=AFPM Omar Ramadan <omar@blockcast.net>=
 wrote:
> >
> > A gateway's encap socket passes ICMP errors to amt_err_lookup(), which
> > calls amt_parse_type() on the quoted datagram to see which AMT message
> > failed. On that path skb->data points at the quoted IP header and the
> > transport header at the quoted UDP header, and icmp_socket_deliver()
> > only guarantees the quoted IP header plus 8 bytes, that is, up to the
> > end of the UDP header.
> >
> > amt_parse_type() pulls sizeof(struct udphdr) + sizeof(struct amt_header=
)
> > bytes from skb->data, which on this path stays inside the quoted IP
> > header, and then reads the AMT header behind udp_hdr(skb). An ICMP erro=
r
> > that quotes only the IP and UDP headers of a Request, the minimum RFC 7=
92
> > asks for, therefore makes it read past the pulled data, and past the en=
d
> > of the packet when nothing follows.
> >
> > Pull up to the transport header plus the UDP and AMT headers, as
> > vxlan_err_lookup() does. amt_rcv() is called with the transport header
> > at skb->data, so the pull on the receive path does not change.
> >
> > Fixes: cbc21dc1cfe9 ("amt: add data plane of amt interface")
> > Signed-off-by: Omar Ramadan <omar@blockcast.net>
> > ---
>
> Reviewed-by: Eric Dumazet <edumazet@@google.com>

This was meant to be:

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

>
> Please read https://lore.kernel.org/netdev/20260928181557.85796-1-omar@bl=
ockcast.net/
