Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793447810;
	b=BRhVT2xCS/Znl+4hOeOUyxZJx2zSeKEONZejqjkjINq1r0MTr4aF9u3iW+634K0q0D3D
	 fp30QSWFD1yZoXsHUZg6ITlaEsERp7qiTp2JLBmQRU7EvyTAej+w2XB9pBOA6GRJtw10Y
	 fnZz4v7A1wl7y5P7FJiF/NKG1Wu60da4nduM9ZmHHaXR445f3p7Hr42y3yJarUrE02L+N
	 /tYOsOn/RcNaIX8nY3lPZAwd2DKEzioG24/fybYgNQdIhTZXky0hotPRvMRbTjn5EqIU2
	 9cKzpcKi8DhUCNeAdKtgV5qkcdrIiDWa+Y7FGXWAwKEijsU3HUkLKMw66fw+FmdqF2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793447810;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=M6ZjypW1pRseyZA4ESc6m+xDqSito4oeWsbV09KQzoc=;
	b=RBBAx3WFeXKhF6hE7TZFVII2lotzUT31hs/szHDVvMqfNn9yC7JZrGON+oMUp+PcjYDo
	 Q4Ezzol9EQtOmqqXILmNKPT2SNESMHquhOKZc8eoBwa1VV+Yg0zB/aPKCTuAzmkE6sSSr
	 CAzWGgQ2eo6mamFWuJ4Ze8It7LoZv3Pwj4gPxogKGGiq0J4hxNLBvA40OnHxxBYPfi/qh
	 WAGPQ7XEHDOAO1v+cwHejZ40ofY6jKuxVJ5YlQcvL0IXbWSszg+c5DbuNtH9Cu6pipywA
	 mItixHvYlm//hRAAxR7/+38hvRQ6xpqksBvvsSOUS9i4RskgNcyuxJwil0X/PWckMSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kroah.com;
	spf=pass smtp.mailfrom=kroah.com;
	dkim=pass header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b=gGWCa9wS;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Zw6RjNPi;
	arc=none smtp.remote-ip=202.12.124.153
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1C0606A321
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D1C0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b=gGWCa9wS;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Zw6RjNPi
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CEDFE7A0108
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:56:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sat, 31 Oct 2026 07:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1793447807; x=1793534207; bh=M6ZjypW1pR
	seyZA4ESc6m+xDqSito4oeWsbV09KQzoc=; b=gGWCa9wSsV6QW9lo/YHF7rqkFD
	15frnT8Mp8IUn3AJ41O6j9h5thlYDE3MD3zxeqx/3ShtWM+So7hgAtLw9YBTy/Q8
	ws6MfQTDHstDJwIEyAUfZBXOboangq1qI8qMKOwLB1sMGAXMmSH/4/IQnnh7u7Aj
	SFQYRa5tS0CUG0um9Ev15nGwgPL1QbovrHtQFZQEsQiJsmk9mw18u2z24BkPbIz5
	24bxNPoVfDVp74+FbroFbf+9o9jz3IvJB/JLAIQNU2pjhpi16F5/5R4ixWqA/Dam
	U8/0dYWc/jW0dBFy1TMrBAs5kQWrGoW92Lrq3ivHlzx9lXa4kgoeAbn1YbKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793447807; x=1793534207; bh=M6ZjypW1pRseyZA4ESc6m+xDqSito4oeWsb
	V09KQzoc=; b=Zw6RjNPiLPFeseDz/ToKbZBGNkFapxHCDrQxiI8/ZdNPw+e4/mz
	Ak5T0SuPD6hl6Ej1O1x0Zu8scx8ibKyhz0IWNk/DpYPd3Bg9LhWI8bIO9rJinAks
	QpIo/aeMsMBnM2kslxm3wu76txk2PMG4INfAQVcH4mkCRni/Yji5sB9x+xqlLray
	FG0qiBbiMblXr98swPRvZDO4MztQxyPoeMxO4t1shTLLnn5gxY6NzlffzMUVboEe
	XjnccRKtNL5yxS10t6Q3JI3/RxmZDKyFWvrHPTf48C5NcLaWeHhRJ96SZaBXCWqg
	zQ0UW/2Taq50epy95aTAqDh56ZWL59TvpPg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793447807; d=kroah.com;
	mf=PGdyZWdAa3JvYWguY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Ii4tm6CETGn9dYjmGHhe5ZhUe+Bk6IA/1MKjGeOc7nrfQ1m
	eug66JPzL1ZM0L0d8xLbNIjIxBqbn/oS5Hs5LTkUkK2SsIxaQC/M28kT/TSxHkn8
	8yaJGx9K89mnOmYz39Faf6kzJP+R+CgMJY/CRMnhHrxOA77Poponi4TISEdsbAgF
	FeIfTtePJSu/CB2rqHgTmEgKnfnhtfX7WdFMpzFlA6zffl3/YHgm+s97THvorqpn
	wd1jTwN6zUH9h7TqUFfgmmOsrAEyYqN+ws5mcXjKTb2b7eVgIrmisncpcMqTXvSo
	CX9SmRxeE6/s9NLH1IxAmi842C5i34V6o2f6F8w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:SJ4lQaeLq/jiL8J/IkKZw7+ksv/s1ZlxXY+FEEVu5Cs=:n8MbU6l0HHsk9G0ypV9vr8gpo7LSvOyDGUes4OsOdI8=;
X-ME-Sender: <xms:ftflapRXa4HFCeWc1dL3wJpBSWbiltJCRYViZ4i41tKQ1gxePvoxOw>
    <xme:ftflajvAC9z4TB3Pnt1Fx1y3Jid_atZQZLpTb_XnpS8Fc7dosZu_yAlHl8ltPf-Fm
    jAEGGo0Q9gYcjVlyQJpgxDDQCtZDgrnZN70m9UhhGqdkSv_MHQ>
X-ME-Received: <xmr:ftflavLgxn445tUI8IcdpJMhCPpVm84u3-hhhs-fmQDak3tLPtw6N5KZZBoK>
X-ME-Proxy-Cause: dmFkZTGS7NWwMmfqmJml3TADb5gtccY3kQVUrjyXC32Dg/RZYTkhAG2dMSePEq/VXOcjHm
    laaf65mIIy1GtzXvrQKld61nnL4k/34bst4GR2DsSjF1WxGo0R/9YX7DrURX0AZrLC8omA
    gVvHpoLEbCYtzv6VowTIgQ6+9Xwvfd9ne2MuMnnxedCDlgvlC0+Cd1jtNDNulhNAY6rb/Z
    o7g7Biy69Ee8sZvrV1suiBAIpxGiBIRG7CBGdA/ceLj8FPFb0OiUDgxXvQvBzCBENIqMIp
    sHz/9g+igPBO9OzJVYrQR6K30KE9quFFoGi/6ctV21QUWd6sV5NbWK64CgeHWngNnHvPUH
    +Yss5yq1MryUxXT8oV8PtzvmA2ZDs33Uf9WVaKP39pOTXb8Auyah4LDzFUZ8bW3xVHSQ6l
    R6aONGM31jRjcwZvv5O9U/oDnxBWI9oht9aMPzrOG+X0OaJliWzBzFS/GXjzjZ5QQ21pWj
    oX+v41Zm5SXjR/vPqtVMGs1ggbpWYmshcyv7DpORKqTyNLEENx15SX8gp22yTqeyHVupVp
    3hkLjG63EvQ8A32RpMZAZRBOCoc933xaWwWRx2b7KWDx4pqvjOEgu6SitWH3VX98LiILaE
    GWa1IGfAaFaMls8oeDZ5xnOtcFTTNx5khrnOHZTlExvzG4N0+wHSjgomuHZw
X-ME-Proxy: <xmx:ftflavf8YJHCEs-Thx3EmnphXGOEV0EOw8xlX_QZ0FffO7Huv4umYw>
    <xmx:ftflapVBOyk4BZeg4h95oM09AT-yvTYsDMytrEyrhdE6k9RlcWK4zg>
    <xmx:ftflaliJx7-gCL1Tpxfg7Fh-rSlAYOMiVv-77SgrIaRPavaGvAI7WQ>
    <xmx:ftflargmXJ0zirAw_PNb9IKE2lC_s64ppb8YUPO44-IAAPLqn8Ld6Q>
    <xmx:f9flanSGhQXfiBDrWupbtyyZpckvkJj-oXbhHWvGrdQuVHCzErK52OR0>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Oct 2026 07:56:45 -0400 (EDT)
Date: Sat, 31 Oct 2026 12:27:14 +0100
From: Greg KH <greg@kroah.com>
To: Wentao Guan <guanwentao@uniontech.com>
Cc: sashal@kernel.org, kartikey406@gmail.com,
	harshit.m.mogalapalli@oracle.com, johannes@sipsolutions.net,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 6.6.y] wifi: cfg80211: release locks on error in
 cfg80211_wext_siwgenie()
Message-ID: <2026103107-pester-landmine-0d9c@gregkh>
References: <20261012154059.1233032-1-guanwentao@uniontech.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012154059.1233032-1-guanwentao@uniontech.com>

On Mon, Oct 12, 2026 at 11:40:59PM +0800, Wentao Guan wrote:
> This error path returns while both wiphy_lock() and wdev_lock() are still
> held, so one malformed IE request can permanently block later operations
> on this wiphy. Route the error through out to release both locks.
> 
> Reported-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> Closes: https://lore.kernel.org/all/93db0eae-f479-4343-a126-59987ae0dc22@oracle.com/
> Fixes: d01f1600e8b0 ("wifi: cfg80211: validate IEs in cfg80211_wext_siwgenie()")
> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
> ---
> changelog v2:
> add Reported-by.


<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
