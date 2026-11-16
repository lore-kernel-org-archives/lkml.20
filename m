Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826832;
	b=irC1Y8ckkKtjPRe3Uo29bM6J/oqYzvlH4lUGZQH8LH4uB7YNPeUQOKiDY/FIuDGPK+kb
	 Gc99H8O9J33ElnyCGUoEdyUlFDjXrXke7yqNWNCdyY2F820c+CuFBNnxZGe8Cf9uUKN/7
	 RlGRNEkolrvH1pMxgP7ekZnl6nAW08PLI4pxSbpy8S7hIhVmDanpTOR9WSDKKgM+RRq2D
	 s5/r4gvd2NfZLGQZ1+qWH1wn3i4vz2YDIeo51HPFVMLz42uflYUuzjLpmNIc+D3d+hT3X
	 o55gEAtBJXm1DLciEMb1qGr7eeGLNxjDxCV4qYwyp7XBT22xwLgxJZ0CdIPoFxjnOlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826832;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=OTF4aEzGDRWKVbtHjmWpnT83X7Uqnedr3VIkObBqkFU=;
	b=zPSOvtJDD7XaCHqL5akRhKWuCIsINAqw6jYPEXERZD/nAsaMChxEDdyjBjrWJ/qi4kH2
	 6NG31IFA3Tt20BsTcINHh6Qe1NY07Rc4OqPahmGIGGDxTAEhJDRc1Y52gPBLeyhYfgJS1
	 2i/lCe5Li3lCIjwZZ8i4QTADvcsyuSTB8o7kwlAnF8hZoNpqhMnIS6vXBWfSGxJYbpomy
	 rHDxngTIzsrvyB5MLT9+Mu8yvq318KJzxovhNTu21GnU4KIAPvrsN9Eeu43Z4+rMlDgtF
	 vnuXF87XP0kDEsF726MK2owytuGhpzFOVrSyKfmMtW4de8pA8RNgHmvlgq4+tloI5Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=rlASTcBM;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107FF606A32F;
	Mon, 16 Nov 2026 11:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=rlASTcBM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=OTF4aEzGDRWKVbtHjmWpnT83X7Uqnedr3VIkObBqkFU=;
	t=1794826831; x=1796036431; b=rlASTcBMr53R1Sv0ikZuWe8PmENz/3zMQa02LAitx2BecC6
	lcdpWesvPP/DqUX6Yd4tP3qXuKg0mbU+SNlGe7ti3id95Iho3bhyqyeVXQWzncmN8o+NrPeTPBXk8
	E4lBaFotb/EsHTJzg9jKpMAg4U+0fvNHfM1Wqwy4i7L+gonEBzJtZa3K3r5Fnd47O8FN3UQcXhDZK
	khn7GOcxdes0MNrSoNu657A+1V0i5ePH8DBwqGfsaw3m0H6gBYXqwMkGEGUfw/DqgTAvRcDop1NPv
	p+MT+bLsESPbJEXv/gDGjqypFRQYqN7bvZ1plaIz07s5tQmUFXSDnYQ3/aoF39iw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xSuRo-0000000GYQX-3C8Y;
	Mon, 16 Nov 2026 12:00:28 +0100
Message-ID: <cef0d4146270d9f01384129f72259f9eceb08a36.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 08/21] wifi: nl80211/cfg80211: pack SMD
 dynamic context along with frame
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 12:00:28 +0100
In-Reply-To: <338b21e4-b23e-4cc9-930a-8f043538f881@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-8-62e39487f51a@oss.qualcomm.com>
	 <db523e851beda07c6f52f3c094b5ea2bf718af03.camel@sipsolutions.net>
	 <338b21e4-b23e-4cc9-930a-8f043538f881@oss.qualcomm.com>
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

On Fri, 2026-11-13 at 23:47 +0530, Pooventhiran G wrote:
>=20
> We moved to computing the size instead of having a fixed value because we
> transfer an almost dense context in one phase but just a very sparse one =
in
> another and thought this would save space on the nlmsg skb.
>=20

It saves allocation, not actual space in the message or for the
userspace copy. I'm not sure it's worth doing.

The biggest problem with this is that it's basically not maintainable.
We already see this in many places, with fixes to these things, if we
have allocation and building the frame separately.

>  If we transfer
> data as D2.0 says, we will transfer about 330 bytes in Prep while only ab=
out
> 70 bytes in Exec. This assumes all 8 active data TIDs and without nlhdr
> overhead. Is it okay to define the max size (~400 bytes + nlhdr overhead)
> nevertheless to avoid this size computation?

If it's really that small just allocate NLMSG_GOODSIZE or whatever that
is, which is a bit under 4k so it just takes one page? Don't think it
matters here much, it's also short-lived (if not you have much bigger
problems).

> Ahh, I think I misreferred some examples (like cfg80211_net_detect_result=
s())
> to cancel the inner nests but are pointless to an skb that is going to be
> freed. I will remove them.

It's also pointless to cancel inner nests when cancelling an outer, but
I'm sure we have plenty of code like that because the mere existence of
that API seems to make people think it should always be balanced ;)

johannes
