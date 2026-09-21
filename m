Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E423A33E36A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790031915; cv=none; b=JlCR1RInmUgZuJT39pMQrOd7L2xaZnnu/uUViFDQ4K8X9ZSQ49kAyLqMK/Ucx+0cYnj9dznAoWfImMCuLEB/zP6cWbX4roIB7Kn0VmEZqaFm4L1SNHZsXdXjjB7NAjLXG1xQQ0zOYCZ7F99s/b/n0E84ZI1RTICQ7P9NZPkLAsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790031915; c=relaxed/simple;
	bh=ZaBUImpH/fASiXlF8j7Zflb5qdO7FUd9QhgoFBlFg0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KseQxpMdkUQS3EGLITtOJV0cPg4ZhJ3vnFqHeD6VFRilXW5UyINJEI+RrkRCAD2TGkIuREdZFtCLFUIS7mZcky/UBl1hZDPxVLtTCXyFvbjy7eIyMrNGEji0fU0Okwe0ZoJQhyurJHlL2y/Uz4zAKEuwaU76lhH9dT6rqrDkwvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ng9xWTGl; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ng9xWTGl"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E425C4E4075B;
	Mon, 21 Sep 2026 23:05:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 970FF5FFB2;
	Mon, 21 Sep 2026 23:05:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69CAF10328621;
	Tue, 22 Sep 2026 01:04:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790031903; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=PtwHNzjPC9syVsM38bsjniJ7znP2GlKXTVxfU/r5K48=;
	b=Ng9xWTGlwsysgxUVsq8QyuT6+Knmct6Y0Xk1YlRlS4ZezAfv7D5ssvBNr4vEEk+kELOF8G
	OWqXaXnMTmY8gPuRTQeTgbofXH01wxDj8LNCO+kuoRMR6cYDIj6Y5ygWSHXEMcLQ/Imlmt
	MLI28NdkbMmwg5kpROzWEE9QaY50ULjU2EYOCs4A2t9uejpOMGVskWgi8IuwV3Pjj08rbX
	f0tdmypvRBgFQ54f7o83jJ4OKxtrnUe5dgCXhUNWTah2ORWUMWHTUhAY7KTTzwtL9tFlzS
	Bf3hnPvLBmc/OeEAHzhqf3FqUySxnuCuBs6JIbFVv+v+bnuGGwAl+xDt5uaFYA==
Date: Tue, 22 Sep 2026 01:04:57 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, adrian.hunter@intel.com, git@amd.com
Subject: Re: [PATCH v2] i3c: master: amd: Report direct CCC read length in
 payload.actual_len
Message-ID: <179003189124.296788.5581346293619108120.b4-ty@b4>
References: <20260908111207.3274407-1-shubhamsanjay.patil@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908111207.3274407-1-shubhamsanjay.patil@amd.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 08 Sep 2026 16:42:07 +0530, Shubham Patil wrote:
> The I3C core expects master drivers to leave payload.len unchanged and
> report the number of bytes received on GET CCCs via payload.actual_len.
> The AMD driver was overwriting payload.len after direct read CCCs.
> 
> Set payload.actual_len from the directed command's rx_actual in
> xi3c_master_send_direct_ccc_cmd() instead of modifying payload.len.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: amd: Report direct CCC read length in payload.actual_len
      https://git.kernel.org/i3c/c/bf9ec06c90dc

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
