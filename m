Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182318;
	b=hrlHBkLVLNZR43+JGU3nDO+9725o4ubb856vVp7IgTkw/S6E+9nZ9SrVaB9KobLDuM7m
	 L60j836hZHqiF8TWOS2F3yXH/9eUGhuz+GHF3MpjeqwzjDBuMFCMLMRGQPJK3pGPru/Ca
	 ngDFllFNcaS79i4d+NamYWugKSuVJDFYLPv1hFlgxbELcPFFwgdHSv124KeaQM/YK/doM
	 WUWCnndl2++qH7Nr2WJM5VMaXiqt8j+XiJQmo+5fuKjwz4lrrH4YXmFZA8i5+uO0B35Dm
	 whMaUl076t0vPmx8UwruRYJwuvX5Du+oBiwL9HAaDQbn1P5v1jfEX1vK1TidO6KFtUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182318;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=ytnCVi3Jk0rW7W3Rt+4AjzK/43TpbzELgEa+w76Rwgs=;
	b=2vjCev9i7hR/2nK6Woihojjuq9Fd22h9NXI2xXb9G7/Wu1R6Tdmg45Evnl+OHbG4lR6F
	 uoQzC26DR0L2I06uv17R2cswwHwpWgCGrTyTj1xLoWkygkAGTsQZOUNBQ75AQ4A/CI2R8
	 kZo8wBYVGrwfOZHMQDJh7zsEd+X8VxSl0n+vI/G+Dc12Fl11X/2zaCwyTtxyXnwwFbrmW
	 hmNxF3drZyRAG8Ry4b59xlX6iI4RCs2nDxOqAycoK6wh3YOj+bxdAAzSe7sv2ZAJ9kJTK
	 RErYhGMOub0Uj0LelS09FhpHP1kQHtDAwyL7Zrt/6Xyz0fGwIrgdhEonQAWdLh0cRQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kroah.com;
	spf=pass smtp.mailfrom=kroah.com;
	dkim=pass header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b="pGz+rgU/";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=EqhtPFBv;
	arc=none smtp.remote-ip=202.12.124.140
Received: from flow-b5-smtp.messagingengine.com (flow-b5-smtp.messagingengine.com [202.12.124.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7669A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7669A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b=pGz+rgU/;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=EqhtPFBv
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailflow.stl.internal (Postfix) with ESMTP id CD7B81301268
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:11:57 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 28 Oct 2026 06:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793182316;
	 x=1793189516; bh=ytnCVi3Jk0rW7W3Rt+4AjzK/43TpbzELgEa+w76Rwgs=; b=
	pGz+rgU/dVmthZ5P/xYkbRH0ZSkrP1h6aQavf9LzuE6JKCuspDDywZqtAspNC4LD
	OfFptjuYuGriNBuF9lfTjsv+rueHqgo1oIYiqSr5m57qvv7HWPk+CoJLsFuzcHhe
	QUE6DJtH40JkScmmq05CtHJY8PgJF3HEGNZExNCVkyIesxsks4wzoBFvEd92uS/6
	UKqtEb3rJ74883MFiBbtdzlXzA56C2kSFaF8+6+9c2VzTh/t03v1xc68laG2hlX5
	Gw7bC1V9vtFRGFYHPdUOIxbMq+PeNl5jMy8g/q8pgRyVjJWV/1X/ANhoV7L+9poI
	sSX7UaK5N9lBQisDaAEvbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793182316; x=
	1793189516; bh=ytnCVi3Jk0rW7W3Rt+4AjzK/43TpbzELgEa+w76Rwgs=; b=E
	qhtPFBv3cWlJ2zPQa0/zLUgMxCFW+imy7g3ufBI2/xG3wUu1KPPPc4zvS1JJInPT
	CGM+PzfLlawNofwXNREoEA16AEkkiPtMSJBCitNPZIznD6BGb0/CueldRpGuOzSw
	IZrdO6dpcK077gtvh9hj7l7D6RsWGmZR3HUDMVwVhLV77pqKKse4+UwszRKyoOM4
	iFOBClvfv7LS7aZaJBOan6rwbLfy0l6MU1W+mKlgfErUL4VG5d9OFQgziqFIvoU9
	UTkSGgzQiHD2DWTjm+ZXBYyMmht4G5Z17WBTI8WDQtCZcEZaCTdT0Aw441cEM1hP
	eeQxMrwuzed1sDXE0KBfg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793182316; d=kroah.com;
	mf=PGdyZWdAa3JvYWguY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:OOlWpUJJP8wnY1GDZuSkj2/1IFMw00kuUAc+zfbUryf9A9+
	fdiQ57+Fs+KjmUDVBDt0pasyVaqR/KZ+9PDcpzOnZTlINga/Nzq6wHe/EBmHo0pM
	tScIg+wJY07mZWavFWzfbpK4W/MO2CsZSfWf0GjGWtmR8woO3G6I1XxXgglauPBD
	lKOPxufljxJXkOuPmw4iT9xMQrvP2Kpuxm57rKmHpRo2UX6PBXyxZcH8SFDnbH+I
	w5C7jTOrJ5CkC/XM3bcGarsu+hONNc7BBPbz7tr3R4/nCtmzDMnsMeuUih3oIgJY
	7OzbdNJpWAX8dUxNalAwl0bYajlsw7ZKHHiP89w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:w4TIrB+e+4dayG+1vedwCXSZSkK54LoXoSqygi/3DJc=:rPdal10A3JppGocsYz0JeLlFk1wZCrwkviQZXVS41EM=;
X-ME-Sender: <xms:bMrhav6liYoks39ROjjk8yH-bk0ATgSfJhcW4dTV4SpjRiyTF8p5DQ>
    <xme:bMrhapzUNvREp3q0SIdFPEpG5dE2aRbgxjBdwcDo5M8SFapeLveb8DsqHyiSE-7Fi
    3qkHPGbwE-MYK9Jn5m1d-nGP5YIqouFckBMaL4598SfPYsBL8w>
X-ME-Received: <xmr:bMrhakC_WN71ZmVl5MX_m4xteYsQATjOgeZ3D8AFLnUVY-R5aJDIJtgbQuhOinAyESiFsrzjx7nK_7rRi2joh1aDDrfdieXTmcyUbTwZ>
X-ME-Proxy-Cause: dmFkZTEq55CNyuEIhviDBIcWvVn95x325b0vNTVgsicdOc5ZjinWmq31fC6MYuyXpimj30
    4xQHAAZtzydaenKxcCjUzjHYcyXBnZnlhRj5a5beRQ8/X9/T4evIYN8lfUdPdD0Un3uZjv
    mPs5FFKhwhKpjCuoo6Nv3/FRrs3S6nXGjzDgKs2E8R7+m456e9kRa+PxmJUQHVZ54XGtk1
    lXbEdeBbGocjQw0uS8g6CMt67d7ZQbx89k9IOdom3+pRTb1yOZzS3QfCzQZ30WV+TewsyU
    wy92IHpsPEm9+rnCpe1AcfzhD+8x3yhtTIJQmMhvvRwFS+X6EfxIpR8sjqw9MshyYESABm
    7+YvDlDXhlya/f4BO5AD76FOmtxphe3D4C4nN6AdtA+65lzS6DVa0K5znzPDOCKi3C6y1I
    ACDC0cCPynSkWdmfXgf++ahgEB9uJ0paR6G86Yo9N/AepIYCZjy6WMcwDHfCjC9sbY5sLd
    F7QS0lptZhFEbP+BL7MRMPDzvVQ4KS9MjbuR1V4xpUdWYx5i9r57fJIZSz1jGu+P4NlEDG
    g8CrsuxSjgz+In2+IASE1Xnpncr6THg6G2J5O65i3/MqIEX12S+h88FOk5m83a1F95MYBG
    W//iQ2M6/OG8yvcESaAPnbyNcm1g7nEi5n0lVZ8jtjmhp43wEPaYyhb87bYw
X-ME-Proxy: <xmx:bMrhaiO-P0OyLF2gGoVi1CF5EMcGJOm8YgSyCjuoL0zvBuOEUF_ByA>
    <xmx:bMrhaiTAgyWfvOnsyfApBElsQvw8HZcWRSHxI_krEe0JaJeswaLxSw>
    <xmx:bMrhartuE3-_o_FVAsJqJfYsvPmpY5IO8x6xfXAWWKnfsp4Amek9MQ>
    <xmx:bMrhaoVn4xdmN31a32h8cdY_j1wSqHEaya5-9DUicuyw5i0g5lLA-A>
    <xmx:bMrhaqve7hm7yTcyH8pdEegUsIoxu51eiLoxTkE1uRT3TlpXX86kIK8K>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Oct 2026 06:11:55 -0400 (EDT)
Date: Wed, 28 Oct 2026 11:11:48 +0100
From: Greg KH <greg@kroah.com>
To: =?utf-8?B?5r2Y54Wc5p2t?= <panyuhang@hdu.edu.cn>
Cc: zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: Re: NULL FIFO state reached by context creation
Message-ID: <2026102834-challenge-crepe-e049@gregkh>
References: <ADkAKgBpLDRR4K*jS0ys0aq1.1.1793180120308.Hmail.242270054@hdu.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ADkAKgBpLDRR4K*jS0ys0aq1.1.1793180120308.Hmail.242270054@hdu.edu.cn>

On Wed, Oct 28, 2026 at 05:35:20PM +0800, 潘煜杭 wrote:
> 
> 
> 
> Hello,
> 
> GPT-6-Luna assisted with the initial analysis and drafting the proposed fix.
> I am responsible for this report.

Again, please turn this into a real patch that can be applied.

thanks,

greg k-h
