Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868626;
	b=OaQNo98dg5sqhJhNQCJhSreyUxlqNV/IseLrw/VHxQoXEwI0ee5+9NgzRti1ZHuaZy3U
	 GUjpWlXYH3SgB7RdLG9IAuHWa5X4xIZi0VjiwVJOOEopZIrtubEr+5Z+CuYvy+FRsfB+w
	 FoP4DgMeX1IGKQcU1UeWbqcBPBOj2rRt7vkmtFyNKb/AOAoQzmyNDPTjx/cqIc6VtAujR
	 5FhYSDoyxVamgvHLrZ58viEuap4v4n6t+QF1sHOjF3qHg46czd6lzXcSsXH4U8WBUS4oV
	 TG7MO6cnsysm4J7D/1gcN8nrSILjcu9hA6cfaT1pGPi/ahA6HwSWI7BYwDbmKsnQDFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868626;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=i09FKaWoTqtKsFXZIJxb/id6UZzTo17qjziWu87IOTI=;
	b=E32ysiQ6vid7jrFcq75q2jw6X0HGtzH7DVpy5U31jgbA4D6yq7e+wyqthXt7nindgFHI
	 Z3k9DZ6yqUn0Wt9n+Q4c/ZrNz3Pwh1HfwXDTxNBpyXqatGkgxGs4+OJ9G1BeOdysaNN9E
	 hAHK9nvxQT0/ce5PBohk8+C0/mBHE7wbiP7Auy/y6PD1W1j5MELFwp8Qv2OF/Pvy1cRNC
	 OX31C+HW0mYpB4RUarexcC05N8Eomlr1tJbM03K8oz1MgOEzwUkPwMVhDQlYA1XQT4Agm
	 ZQCopVbc5KxEQzdQE3FVmcv7OjTCR8BMBl3yiLJBqTKBaWm4tz1ahVp8cX7aPvleXjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=BSuAcfX0;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE138606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE138606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=BSuAcfX0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=i09F
	KaWoTqtKsFXZIJxb/id6UZzTo17qjziWu87IOTI=; b=BSuAcfX0CNLkKQs4idDV
	9bc6Kj4bL1r9/LHXlpPoDPeFZRhlnv2TmWBsLltrIY4fhrJw6xfyRPKNSk54SBT/
	FJnSasVB+LNWDxWJ8C+1M4Fa4NdaedAuWTQyCNKBmiVQGc2nvJgiG9RAdEHlDPBD
	ydR8t1n8vrVv7yLuYqcp+07XmspQO2ADP2suN5qxp6tfAh/Y3FtLygWuYij+Oy23
	0B+b7rGJndz8IxmkfUPVZPsuXy9qV7rFdwkV9Flc3mFbUWKS31d3bN/++InbHBqX
	7cYcp9TDygZCKByg2LDy3aFlEtJkWz4/+SXMuvZxIYGGLdSCILFATg35IEkYTIjQ
	jA==
Received: (qmail 1073366 invoked from network); 5 Nov 2026 09:50:22 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Nov 2026 09:50:22 +0100
X-UD-Smtp-Session: l3s3148p1@O3b4lYNfeq/AwtcC
Date: Thu, 5 Nov 2026 10:50:21 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
Message-ID: <auxDTdfMVS3yazCk@shikoro>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>


> +If the reviewer checks only a piece of the patch, leaving the rest unreviewed,
> +then more appropriate is Acked-by tag or adding a "# subpart-name" marker

"... is an Acked-by ..."?

> +after the Reviewed-by tag:
> +
> +	Reviewed-by: I Did Not Read Everything <foo@example.org> # bar, baz

How about being more specific?

 +	Reviewed-by: Driver X author <foo@example.org> # for Driver X

TBH, I think the above is even better than a generic "Acked-by" which is
basically "Yeah, I didn't look in detail but the general approach looks
fine". Which is not what the above says. The above says: "I didn't check
the general approach, but assuming it is okay, the changes to my driver
are correct". If I get a couple of those, then I know which parts have
been reviewed and which have not. A list of generic Acked-bys will not
provide that information. So, actually, I think even the Acked-by should
have the "# subpart name" once only a part of the patch has been looked
at. Ack/Rev is then describing the thoroughness of that look.

Do you get what I mean?

