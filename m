Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590091;
	b=u2nsg/55la0Q+9EtaIMPvohuYpIHvR4B+FfnHQnyHyHhzup9oF2DyyQ+frA7nhfpDYpc
	 tHx5PKXmpjmMhJFdBzqvLy9F+RyA1N9g5ApPHlgVtobCDTs68aGB/GeDnamLKnR7T/9UT
	 LLX9cciof3ZcFkY/d4Wgk12t1p17CRAApR3+jXS9J0xZLOr/uroMHliV8Ru9xbxxD8qtj
	 mODL5w/CoSGIZkk5aWFjKbz3MK93dNyJD6b08T55TvHPz/XX870uVNrM6VTXiOWadM8Vq
	 c0ZsEcuaMBh5GGkA8M0Ork+tyu7y45ZGM5ICPTe66JKUUfdSA7UA4MFHtxxNCtbtL+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590091;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=9bv850EBQTH85bFk68nVgqk9mnj/LRa+SIuQDt9yO3k=;
	b=Yf/QxndV8qHft58Hl8lD1qnoZcGS5ofxzCtXM4j2aF6N0aPLjlkgdT75g3631kociZuB
	 w0Q+stLaXvQamRQm0ZqxsqhWJXe5OTXDVcksPm0xIniuXFUIMcoVi39Eg/SANJZUZ605c
	 XtmrohlERZ2P67JCNc9vD93RI+JWdLZBqNu0mvB4uB4ko6vbOl7e4TxpjL7zD79J1pddX
	 GGbrHtCEHPZQSfc2WS1ejcR0vgKq1vnEqrxAnwbwkhQTV2Sfpnktutbe+QNdXfgU5Jd9/
	 enttsj0IrSIClK3jdR//582Q3wiR7WbhqLwGXdTYF95ENwdqsf4dDTM1zMOUph5gwMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jHSIENY1;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="Vo/gfEI9";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA97606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EA97606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jHSIENY1;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Vo/gfEI9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792590089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9bv850EBQTH85bFk68nVgqk9mnj/LRa+SIuQDt9yO3k=;
	b=jHSIENY17vCMHhgMfTE++PnZoiR7JCI8oKQRynTc11Graceni2Ut914YzqArzwzj6rEtFk
	KqPxUqzrEJGF9LHkinLOftqKQx6Ns6Hhpon3jkr2+xNYmR8QLWpxEtJU1Duk6geT9lXJ9i
	UqPXvwoAG4PZHJdDsHrpatYoK6mobh8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-miu1kMHSNHyVQzpFNQYarA-1; Wed, 21 Oct 2026 13:41:28 +0000
X-MC-Unique: miu1kMHSNHyVQzpFNQYarA-1
X-Mimecast-MFC-AGG-ID: miu1kMHSNHyVQzpFNQYarA_1792590088
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so164473285a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792590088; x=1793194888; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9bv850EBQTH85bFk68nVgqk9mnj/LRa+SIuQDt9yO3k=;
        b=Vo/gfEI9F7cOYKyEkehqA4dhNl61L1PyaKEWjqfDE9h+GyilCPgN0m1zGnyJr8l6YM
         r1BwIo9//XFFPmgh/EPGavymTGTf2PPrfVMpMfXyEl9FqTM20+V8jer1c5Iow1LooMws
         R+Kc8KACz+wEeIERwWWlcaVQKN/45NaX8kx282N/eCsp9NTh1vY2GyfP7eOD5dyjufYN
         UdbL1k9Hy4RQtHUUObvNjwKsELm+fSSbqhSq52mmYOGHta3DTMHqucm/i9R1ZqrKpjQ8
         nBGlFT9g+dkBQyX+agD9c/jM64Um3npiCOFTa6iNWLTzHmLHQmiegVhRGLToTrscKtkC
         q54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590088; x=1793194888;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9bv850EBQTH85bFk68nVgqk9mnj/LRa+SIuQDt9yO3k=;
        b=YCHxXXboZf3Q1+G5eO9zUb2SCwHSnP9z03/PipmolF3GnUSwcs2AZfjJQs8uURO07X
         AlNVt+TqGK7IDsbfCfxhhA/j9rYJJkHAfITvtdUOf2mUEb72R5enmUY9KHaRTqdt2lXc
         JBNnhKRdeCcMSZUK4UQga0xoKdG7PI6BuJE+JrjEUvvwIEq8OdjqpWYs2zBmh4OBpMNI
         L3DsX82wvHgoRUqQyfGfpRV39I/rt+b47yc3ZQ6PI+JbMHkVdlTGF1s6pOrnDffC9z0J
         wP5Hy2oqEMRDHc3c6QU9ZkRj0RobDTiMq5g0JIPklHIZXxlGJRNDHYt183J5h2icW2It
         T4qg==
X-Forwarded-Encrypted: i=1; AKwUvBzRyueDux2IgrMoHoNQpaPtCUAvIfdIeYW95316hVbltdtB5j98JIfYp556cfHZnS44Kat3CrnfZ72zoo0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmuIqRQmMccQjCvLEKyVdYHcOL3BBhc5nXZYuz9TdiHRv3LPJi
	q18GTPOga7YEyiDcr8I0YaWe/8h+rxVXwJ9JJpcD9ocIx41EyC8SaF9F0Q2i3TlJqEhgW+8PanH
	cP9Hxhz5ejUlE0x4qVAOW/3MGhQ7UyOamk7oclx8fjlJvo5Ss00f7N/TkNIeyZzFysA==
X-Gm-Gg: AYBFou1aEAxXofs9xa50SPqHNX7x8qcWTmUApmtCJ85Q5MY2r6r97g+K0Wvk3NE/8Ee
	vgBEzBRz0cttefnsuSsIoIDiOez+cXABUHLu1FI2Y4X+oyHR5fCwJAElLCYrG6xK5KR2hxlAOUK
	X44NUYPpBW0rdqlxHqiWq/Zszk1OATWOE6Y3WuBjnLokH8idK4yTdqA8/LlPG+Pma4PpvZsxoYj
	tn7GQt4fKm7HtrfiK3AgvcgfqgDqErJ1Ou/VRx5VPMNeML7rrsHPk+2wUkjEWzD9MSpJJSqCVhp
	hC04hoL2EuYb1dhXk1GxOiZuIGtIwgipoSShIu2VuFcjZJdZv+1aBFGhvATui24M+VxfkcM1LGc
	q6KDHfBItpeJdF3xhhpBShUsJi6lR0JPgo2YGxWzaOlWZXXaM/a6AgliGgi6DF8GAKRY=
X-Received: by 2002:a05:620a:2b91:b0:939:f978:c1aa with SMTP id af79cd13be357-93f57ecf03fmr403504285a.11.1792590087872;
        Wed, 21 Oct 2026 06:41:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:939:f978:c1aa with SMTP id af79cd13be357-93f57ecf03fmr403501185a.11.1792590087408;
        Wed, 21 Oct 2026 06:41:27 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56d9a495sm259379385a.13.2026.10.21.06.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:41:26 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:41:24 -0400
From: Brian Masney <bmasney@redhat.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Alberto Ruiz <aruiz@redhat.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: Re: [PATCH v8 0/8] clk: add support for v1 / v2 clock rate
 negotiation and kunit tests
Message-ID: <atjBBPgt72Pug6IY@redhat.com>
References: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
 <87wlrcsmv9.fsf@bootlin.com>
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
In-Reply-To: <87wlrcsmv9.fsf@bootlin.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Tue, Oct 20, 2026 at 12:11:06PM +0200, Miquel Raynal wrote:
> To be fairly honest, the discussion at LPC about how to handle this case
> (and the transition) did not exist because time was flying but I do not
> generally like the approaches were we introduce "the good" alternative
> without enabling it by default. It just makes the transitions endless
> and more painful for people who already suffer from a problem. I am
> fine keeping the old behaviour available, but I would be in favour of
> making the legacy way available with an explicity flag, rather than the
> opposite. We may break users, yes, but otherwise we will have to support
> the two calculations forever and nobody will ever notice the new
> alternative.

Honestly making the new behavior the default would also be my preference
as well. I think it'd be good to get additional opinions about this.

> That being said, it works! So:
> 
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks!

Brian

