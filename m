Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826242;
	b=jXNX+aK21T1ksoxzJR82RTp4nRXJyiGOGbEeB4L5BIodRhWCupKAhvxCu5/uTKB/Ib/t
	 PzZXMcOtyH59NQyk8WU4DKwBfl+IsvMcQubcYFHDNvyAgq96YQKWmbhVC3jZb6vlS2ts8
	 gW2BGbrNvN2lWD9pTxIflpCAbo5Gl5jHbNCejd26sGTn8A99LWGykAFUsjRkTIoJmQUvr
	 DN3mzuqBe6XVmSLC3yu2XDMJY/iFppIDPkilUB4uEPJNLQsRSRVc7zViBXQRiUZrMZb9J
	 +E5TOsQ8wYpsijVAydWf7SvGSQxbnjaH30zlVpxRmbwAiVCzE88mzCNebfB8yu2nUCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826242;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=exY/9TFF57Z1r27okxm+GfJXhiK3dLzKWYnOlboPnlc=;
	b=b4GUyllATumSIEnoFqd+LnPNlMh4jMI6Tm9ZMVTNsKypRseZaYTl12Q+r9hVm8ZLuEIx
	 blx5U7DTSUp3kmenxFSO4pDVAifmJlaCa5euRWLJAINDi0cLc5Tg2w2QfxN7V7SmU9XKA
	 GbrecmEX0n3CmczUtBGtibj0NoVtZJ4e9j3nILO7gav1M1HG5loseXIh3OcktsC6nudiT
	 a4SpLwQiPY4EPOBS4Xy/4DzS0Uu/ABO9dlgYg8XuFhf3j5ov8rEjhxicE5OiERqSt1Tjl
	 IvXVFbz8T5Y2yStocnUoCmDPe9A8FsHHsFEWazZFB4n+/Kcrvu3YRIEz0V1DEWbYymQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=aPiVO8B7;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED921606A31C;
	Mon, 16 Nov 2026 10:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=aPiVO8B7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=exY/9TFF57Z1r27okxm+GfJXhiK3dLzKWYnOlboPnlc=;
	t=1794826241; x=1796035841; b=aPiVO8B7yZvDwN/Dgws0zr3eeiJBWbZ6hd9FobBBO4KK5Zs
	R+ZN6uYz+CyCy+CbSGLREz1B6Y6jPU3zUvLcm91RwkInPB2ZKV3PjPvwl+2HtxwETUUMuAoZOnmq2
	CdWyvigkq3EKXE56v8Xup37Zz9VLInKrNIq84NeVkZXfn37+hQoueaON4gPhYWFOPT14GXeoukz2i
	meI68LYbej1761xp2zmQf4PZFln7iwTzCus+zUsfxr1FAXDIDy/qXq+nIy5zMaaEXE+ozLjtAkQxp
	QMUMP+R+dnfw8RVh6l6AMfLGvG0GIxd56QgjtuFlfuNgr+gVpzeXcVBBwrVyZeFQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xSuIH-0000000GXqX-2O3j;
	Mon, 16 Nov 2026 11:50:37 +0100
Message-ID: <7a83c6576a0797cfc009066ef768e2828284c212.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 03/21] wifi: nl80211: add SMD BSS
 Transition sub-state STA flags
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 11:50:36 +0100
In-Reply-To: <aeb887e0-48c3-40d7-8e93-951231dd2ed0@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-3-62e39487f51a@oss.qualcomm.com>
	 <3fba8cce0b09251c7d88788b531ffbe12a79307c.camel@sipsolutions.net>
	 <aeb887e0-48c3-40d7-8e93-951231dd2ed0@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Mon, 2026-11-16 at 15:51 +0530, Pooventhiran G wrote:
>=20
> > I'm also not sure why you need to distinguish between the latter two at
> > all, hostapd is going to send the ST execution response and immediately
> > transition to DL drain (4c) or back to 4 anyway?
> >=20
>=20
> The 4b/4c differentiation is needed to resolve frame filtering (especiall=
y UL
> data) since the requirements differ between these two states. There will =
be
> some time here between the reception of ST Exec Request (set 4b, communic=
ate
> with the target AP MLD, and get the confirmation back) and sending the ST=
 Exec
> Response to the non-AP STA MLD.

Well, technically yes, but there shouldn't _be_ any UL data (from a
compliant non-AP MLD). If that's the only reason, do we really want to
make the implementation more complex for effectively non-compliant
stations?

I understand that you need to get the ST context at some time between
those points, or already have it attached to the ST execution request
frame, and then receiving and accepting UL data from a non-compliant
peer will ... break things for that peer after it transitions. Actually
it's broken anyway, regardless of the AP dropping the frames, since the
peer continued to transmit. A (buggy or malicious) peer can already
duplicate the frame on the DS by just sending it multiple times. In your
(planned) implementation, the AP can't even protect against it fully
because the ST context snapshot is at the RX time, while moving the
state takes a hostapd reaction, unless you say that the FW also has to
move the state when it takes the ST context snapshot. In the case you
just discussed with Allen, you could move the state before taking the
context.

So ... that's a fairly long-winded way of saying "is it really worth
it"? It doesn't seem to buy either side anything if the peer isn't
compliant, and has no effect if it is compliant?

johannes
