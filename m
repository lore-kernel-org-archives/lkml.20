Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870911;
	b=fp7RJlcDFCLTlU2Aa3doxDptYXuYYedc5o+Twt4iiUgh1kdr5cweH3R4qPLKRwLoucRh
	 S8biW5XsfFFbMepSQAen8BahQpCJqkPk9A1FM3PP+DNT7zxXEh3Ms2pTr3IqfppV5VgSc
	 zglkTBU3lO0Xuy/Oh4wYyV666xecYqx2Y7sRunLbBlkDocBjPYCSOx4yVIbks3LKYvLD4
	 Xfg9LXz0H9GJwxOHV6lBIPD+Bs8JCp6ilTSkhZUJ8IMz08Ej9uETUPD5mBPjAkT7jY7cu
	 k1CcEI9wzAOknNUnYUTdGJDYBqTWdlTV4olw1PVERj0+/lFZlt5Tj4lnofG+zwHWxWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870911;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=efrXWF7wn+Yhj8J3Aq0tfHDHFwNyrjWQVCM9PXFIXwo=;
	b=XD5PEk7LQfDqKIEFKKMmJxMy/UKDlOldNBmYlPKkkcxc9XPBXH71bTaOxycUmxwQYlML
	 G7BprC4Ga3YwKbLO+LOHz9vjSokrSZ1VAtQ5Vo2QQp3pxS5ptwl7IcCF8/a+UpseFEfkD
	 my4FmSiJpFEsGpmzPZqDsgOZpwP741n2aCpy4R2dpYoxAPFCgRoL8IwifEeQU5HDY0A5T
	 yuyEAYdZG2tx3Ev/aLUtsUo+JqEdF01WgEjoUPiGML+dWObdel4mGxxKbziRSzkO2Po57
	 uYWPo8kY6sagyxHcqaZ7yQhBveqRJSPgYDZWAdxJHQ2D6JCV3H2DOE4vWsXLMNQG60A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=RJemcz+W;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2B3606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B2B3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=RJemcz+W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=efrX
	WF7wn+Yhj8J3Aq0tfHDHFwNyrjWQVCM9PXFIXwo=; b=RJemcz+WXW08s80sHHaG
	948hrZREnRQmmlr16e8I+wy+DF2O3faJ8F0RPLOsDMLlYKxUVppmeK3UX5Ei1mHD
	x7wxUBZNAeMr923ALvY3g+r2aoEEHvyCHL34DO2qoTW7AngkCtWAmVEeQgSAdcIL
	Ky/pjerdaFxr36FqPTrYykSoiPTDUjQIlpEVLQa3knjGZ2jlAqynEuew9AmeZ5y0
	W46LVJeseQ4YmGWKqfOpd8Wl4h8Ggmn5YkCqSL+HFUfUP5OvQwC58ayigEgS/nh8
	Es8G0vlWzAMGXGrpI16eqnhtdCyJfjFHMDxc/abYg9Eg2pPFP5v4zmPiTGQ99ynQ
	rg==
Received: (qmail 1088796 invoked from network); 5 Nov 2026 10:28:26 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Nov 2026 10:28:26 +0100
X-UD-Smtp-Session: l3s3148p1@Dr0fHoRfxurAwtcC
Date: Thu, 5 Nov 2026 11:28:25 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
Message-ID: <auxMOdmFYDYGjqa9@shikoro>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
 <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
 <e1c7e287-ccc9-4705-bd72-e801ba203668@oss.qualcomm.com>
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
In-Reply-To: <e1c7e287-ccc9-4705-bd72-e801ba203668@oss.qualcomm.com>


> > Yes, if you want to spoil that, you'd need to introduce
> > 
> > 	Partly-reviewed-by: ...
> > 
> > or something.
> 
> Ack is for that, no need for a new tag, quoting:
> 
> "Acked-by.... user may not have carried out a technical review of the
> patch, yet they may be satisfied ..."

It seems you are mainly aiming about the "Ack/Rev"-distinction problem.
I don't care so much about this. I care more about the "# subpart"
problem. A list of 10 Acks without subpart is to me as useless as 10
Revs without subpart. The subparts give me the idea which parts of the
patch have been looked at in some way, at least.

> "Reviewed-by:, instead, indicates that *the patch* has been reviewed and
> found acceptable according to the Reviewer's Statement:"

So, for the SPI patch: if someone spent time and reviewed the complex
core changes, but only 2 out of dozens of drivers, this would be an Ack
according to you. I would, however, understand that this person doesn't
want to repeat the boring driver review a number of times. I'd happily
accept an:

	Reviewed-by: <hero@reviwers.org> # for the core parts

But still, the driver parts need review. We got a similar patch for I2C
and 4 drivers out of those needed some cosmetic improvements. I reviewed
that. But I did not review the changes in the dmaengine core which lead
to the driver-fixes patch.

