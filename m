Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335967;
	b=v0zI+HVyF+Md1TT7bq1Z5HdgsiqEw41uOxqVb/xqunbQSpQZJvlN5J9bZGu0SJoBXTMo
	 W7gkuI2JDUy35C/VMV7ZtSXgq8g2efrR8Z9QPuozQ53GGyGi9Tq+incaF18KCiDeZWW+H
	 BG/D4uGiKt1eS42TI3ie2Kk+WRSbNSU/YGs3OkjR5z7lHE4tHgwVhd3iZsitGZogsYBvO
	 dJdaeBK4D9oayqYBHk6KPSWDpofujsgIIGyFWmoQ1mDkmJ+g4bcF5qjRjV/+pZ15Ih0Vl
	 8CmbqPoPF4+Ct2bJW1+QZZFSx1kJA2V2m1WCLihxlLggmLcLqeVPI14hZ1EFX9c4mhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335967;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=647AawH17dD8ZgyosaWekR0DoPBBVQDgeOqFGwPqGcg=;
	b=A2FX1JrG76ixDrImubfgu4j8P3jtNdfAlyyfhW7D86Mwvur1q2IZUHXj4iPwPtLW2gg1
	 mQR+NrzU8hgWcy95c6cp2DjM+v7m8cxjIJ65hc8JbyWS5xxlW1Usvsy4qGyt3c4OU3Nfy
	 CwTri/dRj7TkvQWFjhAH+HrovbKwLRQgizsJShJG0Hc3Q9EAb1tH2cYsJ7pTnsJxWS0jK
	 Rc6e09c7IWGsFW//cOLyJpTMKYT4npY+mMykoMQpx7qqh1Jmf5i6OQqSqcLEyvbFrpUQ0
	 tyCuxki65P+GhA8uY8rCE1tsCPT5o6xJaCqDR4DnmQsiu7DwyP8GAO687VM6Knx572g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=EyDDsxtH;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FEF606A32A;
	Tue, 10 Nov 2026 18:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=EyDDsxtH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=647AawH17dD8ZgyosaWekR0DoPBBVQDgeOqFGwPqGcg=;
	t=1794335966; x=1795545566; b=EyDDsxtHh5m/+rCoFnXYJOGrb9wPrx29DdplyK7pbOSEhpX
	zruoh76qYphVyfQxYKMXCYUjm33yYEQkB6NI15eCGO4vhex2xAh1bgx7mprWWdUqEponlJ/ht2Ykf
	UrXU9kGe7BIys97WLqwDNx7T6zULAFEceohrdxlF6wOCuhjuhL3+48/kyRRm6eoA+nIHsbzR/1ZRD
	OLudFJgNORcSEYic7OIbZXWW/ocknB7ccw8SpiwQWCGeVfYOdQKcLopvX6EonHmBQ1V7wVZlys0x6
	gti5qvfRBQNQ+xQlQWNRx78ptrZkX5Ty7lHVtQvoFrC4rSn8jiP9t/ra/1AT0v1Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xQqkd-000000029sV-2ZGi;
	Tue, 10 Nov 2026 19:39:23 +0100
Message-ID: <39ec29d79ce96b04fdbb2830b679add118bdf19d.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 04/21] wifi: cfg80211: define layouts
 for SMD BSS Transition context
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 19:39:22 +0100
In-Reply-To: <20261106-smd-v4-4-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-4-62e39487f51a@oss.qualcomm.com>
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

On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
> IEEE P802.11bn/D2.0
>=20

It probably didn't change here, but there's D2.1 :)

> +#define IEEE80211_SMD_CTX_MAX_PN_LEN 16

Huh?

> +/**
> + * struct ieee80211_smd_ctx_ba - BlockAck parameters for DL and UL
> + *
> + * @amsdu_supported: Peer's capability to support A-MSDU within A-MPDU.
> + * @ba_policy: BlockAck policy (0 =3D delayed BlockAck, 1 =3D immediate =
BlockAck)
> + * @buffer_size: Reorder buffer size from ADDBA Request (10-bit, max 102=
3)

It's probably literally in this spec this way, but I see absolutely no
reason to split it up like that (with ext_buffer_size) in what's
effectively an internal API?!

> +/**
> + * struct ieee80211_smd_ctx - IEEE 802.11bn SMD Roaming Context (refer
> + *	IEEE P802.11bn/D2.0, Aug 2026, subclause 37.16.9)
> + *
> + * @dl_sn_valid: if downlink (DL) SN Transfer is requested or not
> + * @ul_sn_valid: if uplink (UL) SN Transfer is requested or not

Hmm. It might make more sense to invert that like in the frames?

> + * @pn_valid: if PN is transferred or not

This being false is not a thing (any more)?

> + * @ba_params_valid: if BlockAck parameters are transferred or not
> + * @mgmt_tid_valid: if management information is transferred or not.
> + *	@{d,u}l.mgmt_sn and @ul.mgmt_pn are still bounded by @{d,u}l_sn_valid
> + *	and @pn_valid fields.
> + * @pn_len: Length of PN in bytes; varies by cipher type
> + *	(e.g. CCMP (6), GCMP-256 (16))

??

johannes
