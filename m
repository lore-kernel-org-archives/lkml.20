Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD0B393DF5
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 08:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791015696; cv=none; b=HKtOqWTnRmUBj8yBAQYV26MGh5O95fmDtHis2BEg6L+3bzGZbSFdkEIwxAfo9d12njZctcyfBT6srxGgi0xGpaiXJbKba4dBDMz0y4+BJe7B7jmcdvoazOHwuZcTsW5ko504JwuAD6wwrX8EJcmE2VZmdmPc6toMd5ZWQ7k9sCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791015696; c=relaxed/simple;
	bh=X4VdeE1FyPz/sWJc7SqI1YPmnbk00Gc40R8V09goNYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nM0Fy78lNu1DOaw7/Y57yAzqSxI3aeGBB6xvw58DrvS7r54n4pJg9F+fQjyxM3LWd4muAw6nQJV5FEQFOhnBc6p/FoJ7jDwie89hHjLjRSBLw/NKLL2BBTv8bV/wDutpn+pXBaCI/zfwBKrXOhaVL4O1rAlx5Pn5dEK0yUfbY/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=GoN/KTE8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WWo7Dl4r; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="GoN/KTE8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WWo7Dl4r"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B27667A00DF
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 04:21:34 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 03 Oct 2026 04:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1791015694; x=1791102094; bh=PhzkZQPjeI
	yIxCAymk0H0E5hLIYzzY/pTw6FpZUP9Qs=; b=GoN/KTE8C3JDHRZXWRTxO50BIb
	RDchInGqM3/5UXysawZL9IT1RSVAmPUIDH7D1wkpYZmfH1FeY0Hnyx7Pet3y12ae
	8YpIvIGP9B2zEXT9AejV3JpXRi8T02fQQcvCWNoIfm8oXjJrJcyH06x32NOjo+Ap
	Ngc8xinqW3ZVn3d2C3Un8vm8MhdD3hG7CWq4OwlACB94/Yw1jnsN985pYy1gVKQH
	ZN2yk125A1ORVpavw79o+nZ2nBHG3Xtu7YCyZkwY39KaIFgHh3BnWvZfmWoeuhet
	+NEidOR07SLN5wEYWF1Zy5uXA6KKNvHd5sW2xaLnBDOGj/BzueKXnIy3C9SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791015694; x=1791102094; bh=PhzkZQPjeIyIxCAymk0H0E5hLIYzzY/pTw6
	FpZUP9Qs=; b=WWo7Dl4rxUIL2tgYBRd4YboAjdsn1y/V7cJLHCvVD9bOwDoyi4X
	CHBiNDP3VHlyhqEcoF10LkgWZwX1aSZUDA3bOdvaLcxvfN5JnaUPMTlO57JEp00B
	qN/K6z5YBZbdxcisX+EPi4Zi3jvgatqPvlBY3ejAx4tjpRDjG89vqHBIA42IjdkX
	BkSwXDidvALD4sNwsBvZuR4YQHXamsB4xE0upxDTq37SJJ4Aeo/0FUupYeo7/7LZ
	q0mGH0thg4DkmDotyNCbXBV7XLbxmii1oHkh8GD6yE7uvlbgxnsH9Obz7B8pJ9K/
	JSUAo2oPg/wwQar8PgswbS9FQOP3kX4T4jw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791015694; d=kroah.com;
	mf=PGdyZWdAa3JvYWguY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Vrzf0mz74M3iWKZxSzxwPW6U+lZ3vdYM4HEh1BGc7CmDKaW
	9+3/Ypz6OxqxYKiZbOcKZ9+xm/kNIix7p5GDjl0hlfTkWcoHyyBVbk2MYR+ysxBh
	7Yjq+Em+vgmaI9MC+5LSsckLaLCXVI13hcZ5p1g56e/gzAOoljusQ7kbu0LquQN2
	Mkl4WyiV1stidcgF668hxmqXyhIpxcaOqkHybh6fyb/KdH0tYlz+1TxR59u5bI/b
	3QYq3lLvd+JsPxSN3GGIq03eXM1JNvAL78aNncOmsU+kEpEQgVZrRtLf9vLX58gm
	fkKZaIPOoVrEuFOKsvxXko45NZ3D/+D9q9Z4pZw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:aC+fjBY7cgoPMKcmzsJC19H5CiACaOz20/zSf94BfFg=:X4VdeE1FyPz/sWJc7SqI1YPmnbk00Gc40R8V09goNYs=;
X-ME-Sender: <xms:DbvAasrZDUoLiDUeU9B3IyPVmC-x7_IiMxNj0-tQgdWWS85WayQZtQ>
    <xme:DbvAaq1HO67ABePCnNA5TUKC5KQuOYoLL_pD5d0UaM0XKYVvVvOjzgVgKnZr9wUaR
    6oWnJCJTRcPN5QnJ_pf0oxUWXnP7z492-ElLlsu7rbwOI9djeo>
X-ME-Received: <xmr:DbvAasy0mRQ6b4wN-w4aZ14FyEecxp4yX2ANgzILuN4fAmTI3ApfKy5CU4B7sm3kNQE36XBefOn0FA66isSoHzN0dZ7L3jmpqa4OofARiqI>
X-ME-Proxy-Cause: dmFkZTEKCKyT+ofjzhPg091sZ1aXPLa5G/o0u1JvKFqxSNEHf1y+FxWGzLq+nGTLiLwj69
    loaiRCnfiiGHjST/7qSt0FxvSMnkt5NRxa0uIAOkGMwi1Q+uIOYcbPTjb2bqQNxHdAI8TB
    jmRq7X9jiurL/yUEzSf0zbp+UD8784xSeZxBALVknnKUP5HBHbE9ZO8CiD6DJnddxl9+KE
    KWdxCGiGprSzyAQAi8QNdxKVtLty4HKhG9y9QltTArQaeDtTVKmpaqYvfdPLJ68UukohXO
    sPSPd5BSav4+c1KoS71zzM1RW+VsbaQSXY25pqLkOlUJy7YZv0+OBsp5SrP4HOPkNqbWC7
    CD6djbDltwBMnUcHI9O359u5uJOO6qnuhtl+l0ayk7HekKUFUoUuOTQSY/CtzRlbdYUPgF
    0IRz3qAVVn8SaI1d6ZXka2nW66ZJkej2YVHL3tqam4zT2c7kOksJ706sr9VgttbwQ6vY1x
    VGQ1DVHuyzUpFS6GaQAC2FroFKvtUtB3F4hSxTA8GhWggTNg6H60H/+GFlqbkMUJj4JIY9
    hpZDEO7A5dMt9ZmolTtF+Wcm1LvJ9kTsYeu+poyge5Lwh1cONQjk8SzvMdUrXSYGkvVDaU
    qryoyaMIKvX8F9TSJsnPhIWJJOpxxgrcGCMxsMWSCJE3BqrRD8Oz/+DMXF9A
X-ME-Proxy: <xmx:DbvAaujIadQ1ssqZ1FHRP3F-Yz1qzx1y4hFgN-lASY6q0zPe4fdbhg>
    <xmx:DrvAano-udjOZBk_xaAiLOIEXuK1GECMieNYtXA90poCbMPhreB4pQ>
    <xmx:DrvAatgIXhAkQAnM7gW3ks6ow1DEI9bd7RbnZ3oPMiDtREGS6J_8-Q>
    <xmx:DrvAahPv5rqy3mMM5mwOcGGTTW6T1y1EUPIjW3hv0GLbktAUSExwIg>
    <xmx:DrvAaqSwra7wPIpHSQDred3FX73A1_r2RH8xmSUWZcECTh67O_JVZQDT>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 3 Oct 2026 04:21:33 -0400 (EDT)
Date: Sat, 3 Oct 2026 10:21:31 +0200
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cui GaoSheng <cuigaosheng1@huawei.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Ruslan Valiyev <linuxoid@gmail.com>
Subject: Re: linux-next: manual merge of the tty tree with the tty.current
 tree
Message-ID: <2026100311-drab-resize-c885@gregkh>
References: <ar_0KTUpkndGyONa@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar_0KTUpkndGyONa@sirena.co.uk>

On Fri, Oct 02, 2026 at 07:12:57PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the tty tree got a conflict in:
> 
>   drivers/tty/serial/serial_core.c
> 
> between commit:
> 
>   499485a67fbac ("serial: core: fix NULL pointer dereference in serial_core_unregister_port()")
> 
> from the tty.current tree and commit:
> 
>   b290393074a14 ("serial: core: fix NULL/dangling port_dev on failed re-register")
> 
> from the tty tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Ick, this is messy, sorry.  I'll fix it up next week when I get the
tty.current tree to Linus.

greg k-h
