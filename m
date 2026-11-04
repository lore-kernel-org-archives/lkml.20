Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810243;
	b=lLsOsSXE0+uagxUqx1jWnbCM3gvUQHJiY8Y5T6yrcm0opT+264sCKZBbG9RkHr15Ib4v
	 e20b8rIGGP6wdyPQxvjNpQi/IiQueVpZcBTNkB2dsBu6IU5CQt2VjKnhv031dQTH2pSdQ
	 cxTijrg/WoZBRLTFVNmvImEWKsWzlmjRQLwtI+E1ELN2ylKgAtgz1RxQn3u8CIZkEKtPj
	 0xA6mUcodfUiS1QSHp8HZ3wdFacqCoMvSLoe6it6fFjC1rU2eHyXSBEABOqNBzBk3ngEb
	 WMkYqLhMrFYuw+cMZCX4ve7YOhrB+/MbRrgOuQCphfZOr7fuXdJSpSRm0haIheesokQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810243;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=jTZNzpzNzcmOMEdwQ1fmr8kuEZifTTUttkFrF43c84Y=;
	b=zNyhy5MOBdR71eOLFOKSZbOC34KMtvcE0nPd2g/Xc9H+XIxdXNlVatE1HxSaovKnBIAJ
	 haFWwUpz3dRYD8TEjTubIuu5pv9uwGcXlGLwkL4DjS3KJRDZkrUjq+Cxn/YUYAnfPmWi/
	 xVxpFHt1Fl92/xLmJVDtLXcXg/aXMCSBNcyV9aJVrk/puUCokt89R/QvXMJO6wyCUVkiQ
	 4SBn9OT45v/mUgK0vgXaf54wlwlQu9s55qQlw2p6mzE3sAvy9oXVKkOIDCsHEH1lMziXt
	 qWFzRjp9N7+WIyLjfD/VxqFIHnrttQZi5te4h+BoDJGiZcynp3fo4L8Zi18MY/K6ilg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=nDy1f2Xd;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6924606A337;
	Wed,  4 Nov 2026 16:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6924606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=nDy1f2Xd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jTZNzpzNzcmOMEdwQ1fmr8kuEZifTTUttkFrF43c84Y=; b=nDy1f2XdtRrf2Ld+S7EQ+RFapz
	9fyjnWjhhpLOdgvGmD+WywEt/Xe+gXqDWAonTuVsU44zBmte3GT0K2ntLF7kp0p0Fq4lNA8GVaLCr
	9vcPXObJgr6Elxy8IoODmeuKyNQwHi2iX2uSO0is5NKdxkLq/aWUgTfMs8BiQy5vUeTOjt0QrhVrh
	QbHJbcbZkh3KmLAuG85xHPi99tY+O+pDK2gAxWajC+5MyVvaoxLTlHv+m2m7nb4NjCfYUYS0n2Nu0
	0Eoth3MERMkcpb1VEX5SvnAy8ViqV7dj9qbW7noU5nGHXPnb2RDAVnlaikb2GiwwJCLucK/mwUPKZ
	85/S0k+g==;
Received: from willy by casper.infradead.org with local (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdzE-0000000EUrG-0qnw;
	Wed, 04 Nov 2026 16:37:20 +0000
Date: Wed, 4 Nov 2026 16:37:20 +0000
From: Matthew Wilcox <willy@infradead.org>
To: joreag@ulshe.ai
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [SECURITY / STATIC AUDIT] 44 CRITICAL/HIGH Open Manifold(s) in
 `Documentation/.renames.txt` (linux-master 7.4rc)
Message-ID: <autfQA_BKenrDFQY@casper.infradead.org>
References: <fde979b5281d3b85cf7a544ba86baadd@ulshe.ai>
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
In-Reply-To: <fde979b5281d3b85cf7a544ba86baadd@ulshe.ai>

On Wed, Nov 04, 2026 at 04:25:09PM +0000, joreag@ulshe.ai wrote:
> Hello Maintainer(s) of `Documentation/.renames.txt`:
> 
> During an automated topological boundary audit of `linux-master (2)` using
> Logic Archaeologist Pro (v8.5),
> we identified 44 CRITICAL/HIGH Open Topological Manifold(s) in
> `Documentation/.renames.txt` that may warrant review.

If this is a joke, it's not very funny.

If it's not a joke, you're an idiot.

> ================================================================================
> MODULE / FILE : Documentation/.renames.txt
> MAINTAINER(S) : Jonathan Corbet <corbet@lwn.net>
> LIST / CC     : linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
> ================================================================================
> 
> [#1] [CRITICAL] Line 24 (Step 0) — [Mandalic Resonance: 0 Dissonance]
> Untrusted Command Execution (Shell Injection)

"Mandalic Resonance" is the kind of phrase LLM slop would come up with.
