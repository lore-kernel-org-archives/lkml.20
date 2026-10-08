Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EB837DAA9
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791445753; cv=none; b=QV3V9xDWSz3zSkbnFVbpnUnd3LPuVR8IU8p5XHz57X+/unkqoLLsG6FIwA1eRczI9N0ig5LiPL1m2kjQHs2StXsHgT6A+U2UEW+E3ckeHNikRkmxfOmQ5uzUMKUun0nb7otdfjvLm+R3VfRJIQuhmPOGwNDLEtYl4PNpYF8BHXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791445753; c=relaxed/simple;
	bh=D7I4ryDYuH2K61FRATP1kZWTCu8iA6QgH1OfVhoadc8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=MDFTrxDPbcSeH1+xElFdMRAJPOhW22hbch88FROL/cuYxNcY1FroywrQe3r2K8MqsXJwsmGt20D84ulcIXIVIPPgK3nWazfF3CWPmjdzh/t0FnqXjaRb6m2pktxkkRMp++1OLvxl29lVs+cGoO7ft3L9Hp0OAp3nmysl9J8HPmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=HSgpvZBk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oSsw8hOu; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="HSgpvZBk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oSsw8hOu"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 0C2761D00106
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 03:49:10 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 08 Oct 2026 03:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1791445749;
	 x=1791532149; bh=j8urfC9sQNDaR/sS9ku7IsysnC9H4KjwsmbzDxs1ONc=; b=
	HSgpvZBkOkq8C4c3jiNFUlP2+UKVaLIwEZLAgptOAxnyeJhQVLXmqO+P0Dl3V6/Z
	ITw+pl2iIpr43ok1pykA4JfdXVKnShD6or2oNZ7Inu6DxVCQDd/PyiN/KLBXcNED
	F+IKWQ5y6BjWhsjOOxe5yYrJomOQZkE8DnbCioHexjSkieCnoU8iVUgPZQFEjdGu
	1YywfCElGksFW4iap8OcB65pX7nuxReTyiLEo/1kmJ8Qa+lZ0UDqsigDlFjdzRmL
	UHsTtqtZCGUvFc4ISMFPJCxJisiAwDYn7qTkgSzOYibyNZ0eAakmp0sqbdkgpFc5
	DXyef45ktq1fZ6CrbcX2Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791445749; x=
	1791532149; bh=j8urfC9sQNDaR/sS9ku7IsysnC9H4KjwsmbzDxs1ONc=; b=o
	Ssw8hOuSebuvVBQSzoGZAVk1QzbJGnlp+stEStWPvXQXL4xfn2gjDqEuqqOlqGKc
	Ks2oce0zR17QK9Gk++egOB9tSK5NHsDZ7sC0kSyQBdcbWD7pR07+MClaQjMdSI3y
	wc4eo3/LaMS5TRntj3Osap7nCfmKSieT0ol5l3SPtDoUUbzc/59CfS6nzQ8ChwS5
	7VaDHoynzOHiK8/rtp2DBc+B5QHmufqLHjIUEX94uZ3db4Mym+LOPyWnNdyVdAzw
	vhG4VRZHAOPNThrP9i5HPZfV4oa7qNyniex8u1BA9zWxzNm02HrdpOCuQZlNDUMZ
	DJ6/va+H07LVJbD2Spiag==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791445749; d=kroah.com;
	mf=PGdyaWZmaW5Aa3JvYWguY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:YsPXoqTTljdtNZyKvNAbeBNraaWhmJ1ZS5nYO0yjcLI5r2K
	AKy1NMpxoly5la7nrRg4H1xLzRQrzVTRJ7j/rkrR0Q9EmAvlIR5IfNRc9KI12+BI
	xJmqnRN7rgv6IQL7fSvAjpk0bAiZtW7LzpwC/UAar0TCR1FqSC33tfIdzRjY3DA2
	UCN7Bsqr3atYigGgNdnBHMpWHQ5llViGYgX899FTS6dGsVq/rCI8gN3Er/klPHEk
	fx1kBNB6TsTdOedx+u6E649oDptNOCPZsEnwFWkRylbMeMdJ5Tdoy32Jd1iowLgR
	+RWV0IytZmQGQzwMEBqgU3MUjp1XZehr/W/144Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:F2ROxuKvY/WAYJD+mbhFypnb/mmgPwk1ilsw2eb4V0k=:D7I4ryDYuH2K61FRATP1kZWTCu8iA6QgH1OfVhoadc8=;
X-ME-Sender: <xms:9UrHarWkIzsR2Mu3zb2lOhzy4OSn9BPL7U_Ay5jWvmqGoMVDxHmZMA>
    <xme:9UrHas4u8eTfpv6jooxXyRyYBqZbQoM_hi4HA5AsX3cBZLrOVvaIFd7pGeqVwTM28
    hI27CeaTHuNiiBFCNDUYCvAD7dI09oS4AKR96_S3x1qIanl21yg>
X-ME-Received: <xmr:9UrHaurQG1tJ7YFW5c7zk6-Ll1IITCEnJBgCE_izDUgQNEQTiZ5bWwVSH2NwR3N6xrXI6AVyPxNz-k6RGhAkX4A>
X-ME-Proxy-Cause: dmFkZTGDO3x6YjsbvfokPk7PrUKzGpn1Wo47Rxv4gq4sPG6QY4oEnXTykKj9SpOuF4OLPA
    cGMjp4nuZeGGjmaZDf5aUX4kJ3e140sEuj5rCkNU/QqPp23FK8R0DlCn/IPi9CZnxJT8RE
    XdrJNx2dlZCvryzfMAWx2CpaUyyMYKoZLAsGFqh7BlPvEm8xkSAkAkQfsijoCrFsc3xyAj
    KnoVVUny7p2mGoyLkyezg817hDdcyayvYvlX3PqhKxV2aaW8Zzv4kdVdMDTs1dG0syqbGh
    j63JyKvBjdTuYmsLcXZS6HtHdo13WTiqxVusZ9m1sS7+cUOuiF+JqZ3qqIUd5gILrU4FfI
    LEqPyf6/LF9tcwHuDY+zz30XZKZRk14Dk8AJLiusl9raSrIQFa9n56tIBUyX3SXghbGujH
    qNo6u6LAduhXIhrz11aHqgxK2qjjqJHyBBSn6CvxaSJfFK9xopwLpO0lVb9hvjrI3K51DF
    8hOL6WGLqQItxtvZ96p8BimcCTwMcY8Nk2K7i0HDTgReIstA9ktdhFm6PqO0rMDs7EMnnY
    umnsho7fgXbRBp4eMTey1Ln2hbEiUn1h97z17D6FOoDfv0sTAlZTmnVu+SsGwC5upwrtRp
    9HRtCRzhoWooVE1uClRYKW9JqiaettWzFc5k3mgDv5rbRVs/eJ+y7BArWDQQ
X-ME-Proxy: <xmx:9UrHanlOctuYFYmFk06mKxTOnw6r_ThrYsw352mV560oRGgb3_1V1g>
    <xmx:9UrHaiOWwHX3CI7lWTjy6fxkWiwXHxl0EcyBI6nmjSJhBWB9o9Wryw>
    <xmx:9UrHajNj9epgv_xU0W1suUyZm6INpeHiUm3zPQZpsVPbSioRKFYG5g>
    <xmx:9UrHarjq4hnUeGGTrnvlBHcN821Yrppp3__25DWXQkIqBoiK2nwtrQ>
    <xmx:9UrHahNx1cDyv4Y8ywD3rEAD1M76WzS19G1cHPHUer-itWLDQtGS7xB->
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Oct 2026 03:49:07 -0400 (EDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] leds: is31fl32xx: Fix NULL pointer dereference when
 binding via I2C ID table
From: Griffin Kroah-Hartman <griffin@kroah.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261005194923.161411-1-rosenp@gmail.com>
References: <20261005194923.161411-1-rosenp@gmail.com>
Date: Thu, 08 Oct 2026 09:49:03 +0200
Message-Id: <179144574308.8475.10124322936037033713.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791445747; l=223;
 i=griffin@kroah.com; s=20260910; h=from:subject:message-id;
 bh=D7I4ryDYuH2K61FRATP1kZWTCu8iA6QgH1OfVhoadc8=;
 b=wLGz21L6NshJtBzgRXt+Ystu3i37gbGIin2M9z+J6Udq/O3/C6w2iLtsdAiSAPjeL/v2VJshB
 ZBAJzTFunKQDotnm6SGexgU5aNj1UWS1BOq3e7IxGiz/8BggnQ63WlM
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=HlyUkuZAN9I5qlPbOHN5N9xxdQ5sT6AbPgC4TsLCxzA=

On Mon, 05 Oct 2026 12:49:23 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> leds: is31fl32xx: Fix NULL pointer dereference when binding via I2C ID table

Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>

-- 
 

