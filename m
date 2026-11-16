Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857914;
	b=hiQMTUnSFRLHcDr4VJM3obKaFKn0eyTuW0oZxNGeMIZhOXXpmDcWzv4puvi5adO3KMb8
	 o1qz4JYrhsYQzk7hMq03OuOIxXf6GcU8zDw4EPm3lMNIHI4wjuieEA4D6BBAcOKZ6YCxz
	 2CVus93jE8EEA562nwjd+ryUqN0p1nUMEIgLhHrIuYFiH6+mSGDeazfdzKnIKqi/bENwF
	 ReLocOUU54S9FTrjpMx2ibLBou8fZuxay61GQP1v2tYuVLany+GNkhVOI/g+HNhAY6hFQ
	 KG5sOTD3ufh4G+kfTQjbkI/OJeV+ojBoFzBy4qHjtulye/sQ62g8cyW6gmdKXSzPpnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857914;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=SvmVBkfcLI3/NwUM0YPugPft7WxMmY8lvGLPLXTa0ww=;
	b=Xb2vgmnPphJH6p/TvW0Ns6AeD54bOjOxBx9mSUuP0VaWWb3w0npYfSB291XOOroNRsSQ
	 63oxBxeUMxJx4kKlrqvzdDZIN8NT40pxwsCa5lU2HWY/IWUOP6g3tAEFhO7wLWk0OA5kC
	 YQ5iTJ05esaTe12aJ/Vjdlm7qr/T+2AjpNOzOq+g4hajayuvXdD2PTp9o8uoP2y+eE8xm
	 BcHtAqWt8mIRs2eSKA/M+trm0Vt8QdMiY29eBnpoy48YPlePYflxS9ya2jgAybnTxB9Pg
	 qhQPBIB6bXn3Bppus1XFYnA7opNa/VLsb9pTbaJAkx+cQTDZSsiOIASoLZzWCTjKdew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=nkPHL907;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCC3606A322;
	Mon, 16 Nov 2026 19:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=nkPHL907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=SvmVBkfcLI3/NwUM0YPugPft7WxMmY8lvGLPLXTa0ww=;
	t=1794857913; x=1796067513; b=nkPHL907YwwdDBT9aMbxtKYg9WENElZ63sH54iExrHPeN1G
	sWVpnqIRDIiXD0ymFUwtPhEOWzqGZnjQfouLb0iSVlJNH1xlsVhqiJGVIddOJas3dcmugtlhHTdiO
	09Rzm+HfzJ+EnDs6F5ytq12aARRMD7lrMSd4q4mtP97j3H9kPn3AHxWLQwku2N4ZnpyqiscGE4wZd
	rdEtCWAS2vYHPqBY9G5gQyTEME/enkSQK/Xl39X/YBIxKAwQStCMkygeHyavgCn1yfZwRHtU9i1qZ
	LHjoWwuziDLHhnZQnFriOn7lqY9s9Aw2YBBxQQ2WWPaKB4L8AbU1GFwB69gaC7nw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xT2X7-0000000GxGm-47ZS;
	Mon, 16 Nov 2026 20:38:30 +0100
Message-ID: <ab8a37b85e4eac72a3176c0d43ed59017ee0187e.camel@sipsolutions.net>
Subject: Re: [PATCH wireless v2] wifi: mac80211: check for a NULL link in
 the MLD station RX loop
From: Johannes Berg <johannes@sipsolutions.net>
To: joasantonio108@gmail.com, Benjamin Berg <benjamin.berg@intel.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 20:38:29 +0100
In-Reply-To: <20261116-mac80211-rx-null-link-v2-1-ea512ae98139@gmail.com>
References: <20261116-mac80211-rx-null-link-v2-1-ea512ae98139@gmail.com>
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

On Mon, 2026-11-16 at 19:37 +0000, Joas Antonio dos Santos via B4 Relay
wrote:
> From: Joas Antonio dos Santos <joasantonio108@gmail.com>
>=20
> Since commit 6d531b9af16e ("wifi: mac80211: rework RX packet handling"),
> __ieee80211_rx_handle_packet() looks up the link of each MLD station
> that matches addr2 and passes it straight to ieee80211_rx_valid_freq(),
> which dereferences link->sdata and link->conf whenever status->freq is
> set.  The non-MLD loop and the interface loop below it check the link,
> this one does not.
>=20
> The link can be NULL there.  ieee80211_vif_update_links() clears
> sdata->link[link_id] for a removed link first, and only later, after
> ieee80211_tear_down_links() (including its synchronize_rcu()) and
> drv_change_vif_links(), calls ieee80211_sta_remove_link(), which takes
> the link station out of the hash.  RX runs under RCU only, so a data
> frame from that link's address arriving in this window finds the link
> station but a NULL link, and the kernel oopses in softirq context.  A
> link is removed this way for example when an associated AP announces
> removal of one of its links (ieee80211_ml_reconf_work()), and the
> frames only need a matching transmitter address, before any crypto.
>=20
> Before the rework, ieee80211_rx_data_set_link() returned false for a
> NULL link and the frame was skipped.  Skip it again.
>=20
> Fixes: 6d531b9af16e ("wifi: mac80211: rework RX packet handling")
> Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
> ---
> Found by LLM-assisted code review of the RX rework and confirmed by
> reading the link removal path by hand.  I have not reproduced the oops
> at runtime.
>=20
> v1 got no replies but is marked "Changes Requested" in patchwork, so I
> am not sure what is expected.  Please let me know if something else is
> wanted here.
>=20

I've said this pretty generally before - don't send me raw LLM output,
read it and make it make sense.

johannes
