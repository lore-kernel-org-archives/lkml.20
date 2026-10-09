Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AA63C98B7
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534192; cv=none; b=QoB5UN2hGwdSqP+bWtYgFvmMaWUjJ/jD08qURr0pCbpqxJFwmbWiObCXJbHY0qhuJJC85bsWKaR0mTXGrlyx36iJTiFvGOYXPtYyPlWxYkWerY6xE5mmSCb/zEAFONr+1Ko8iSaOc4wpfrBdYCa8G2JXkNHFEdCV/Z1JcgkGQEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534192; c=relaxed/simple;
	bh=mHjuxP8No/svkLEibCC62pe0HCMEBgSlND5KAB66MxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpC4qmAEqR/DelNYEjixsjeKV7qRo1/HvXLKcF41o/DAB+qRrLdKZrUlW3L7BxOgWPOHb73z5nUIXOL1fC/90IC/cRHDt8MCbdWhInlez/uv+5OwGmZsZvARhZ0tUqsKX+pTywC4KxKO4jgestrOc/SY8z8kzPYlXZ+D3BxJivM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=srcf.ucam.org; spf=pass smtp.mailfrom=cavan.codon.org.uk; arc=none smtp.client-ip=209.85.128.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=srcf.ucam.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cavan.codon.org.uk
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-8ac4806e210so37097097b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791534189; x=1792138989;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U8iFS6pM3tthaseRuGrSd+8pptlyySe0KSW3rDNx01Y=;
        b=TvAhSKZn1IkRjhdnRRnjhNcCy9Gn5weIXJ3xNf7QVcHKK+v16a8hQUATZfBhW3CSJ1
         4oMky/CzxiCw6MHTr2XpdgoWkNqfR6E3iZR+tBE97RYL9NRj21kRZiE1vpv6u1DVoaUs
         vbVvjLaZiyVsEfqR42lblY6RJEtBmFVVoN0l8zPJHD2dRmb9u8Z59qo7ZvaY3PFKFPGd
         /sC3mJXHtB8lzbVnYyJ6dDsodfH7PN5p47eFPukL7duy5nZEBa0qUW4WIjDmGs+GIIWY
         j5Qj6HTVZmLQPTDbVCTAIjEaj7z6E2BOfYKpJsnxol49/Tb+vtrY2RR8ae4P4gpaTkvD
         dwRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIY9dC0fImJ1S4wslUfkQl9E/DfD3X1DlMDmUECdWfMNOKyoO1mlw4rbAh6KuXKkIzj8V9jVtazluSqJw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFuLaxE0ByiEMDq8/GvixBv0JeKUDX+44idMDwqbZfonifXsuj
	cnqyPI5naWxRA/+VrvTZYPNeoQxZ/BFtN9GLEM1BB4xRFBrBWBTfG+0AfoswxpZr46bsIshSCAm
	LVVY4UqtlenBPwFNNMOhJYo7S/IgX8Qy5fm8Yhj0lwyacE46w4frQ
X-Gm-Gg: AYBFou0jY636sfhHCvtcetEhEnDASz7lEVtRSVeqs95punv7nqNuNCVU+/tppWJqbt8
	HxX1g97JzEbmwt3OgGiKzSofUVDKnol1n0MVGtMdJwkQZr4yKyVCDYRoy/ASFc7622M5wJ9OJ2K
	keiQp0RBZTSj2LYUlblbmUM1ugA5QjA+4ZZwWPVv8OLZRx9Aqc8isDTBAgMFeWciRcy2yZ8xDiF
	6gaAF1EyxLSfMHGiW4QhSsJS6BJ4sROwUoFLiEfdgN+X6VJKJa9duTuEM+mKbRQ92nt4hs+YEG6
	sYeoeUsv5rIx76yhgwuH+fNEwso+OnEB7OBGBVpBIhoeejFwnui071Xe8gV4tZEY/M1pLttV4w1
	ElJ8=
X-Received: by 2002:a05:690c:4142:b0:8ae:6740:99a with SMTP id 00721157ae682-8b07ed4e93amr3514097b3.30.1791534189243;
        Fri, 09 Oct 2026 01:23:09 -0700 (PDT)
Received: from cavan.codon.org.uk ([2607:f598:b99a:160:8a88:88ff:fe88:8788])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-8b07f329510sm59467b3.43.2026.10.09.01.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:23:09 -0700 (PDT)
X-Relaying-Domain: codon.org.uk
Received: by cavan.codon.org.uk (Postfix, from userid 1000)
	id 27EC31286282; Fri, 09 Oct 2026 01:23:08 -0700 (PDT)
Date: Fri, 9 Oct 2026 01:23:08 -0700
From: Matthew Garrett <mjg59@srcf.ucam.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Francisco =?iso-8859-1?Q?Beltr=E1n_Millal=E9n?= <fbeltranmillalen@gmail.com>,
	rafael@kernel.org, bhelgaas@google.com, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, lenb@kernel.org,
	linux-kernel@vger.kernel.org, Darrell Gum <d@rrell.co>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] ACPI: PCI: take native PME control on Apple machines
Message-ID: <asikbIuZUZsgmU52@srcf.ucam.org>
References: <20260924132859.24751-1-fbeltranmillalen@gmail.com>
 <20261008232912.GA940274@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261008232912.GA940274@bhelgaas>

On Thu, Oct 08, 2026 at 06:29:12PM -0500, Bjorn Helgaas wrote:
> [+cc Matthew (author of 7bc5a2bad0b8), Darrell, Andreas, Mika,
> Yehezkel, Lukas, linux-usb]
> 
> On Thu, Sep 24, 2026 at 10:28:59AM -0300, Francisco Beltrán Millalén wrote:
> > Since commit 7bc5a2bad0b8 ("ACPI: Support _OSI("Darwin") correctly")
> > negotiate_os_control() skips the _OSC handshake on Apple machines and
> > hardcodes the set of features the OS takes over, because those firmwares
> > return failure once _OSI("Darwin") has been acknowledged.  The hardcoded
> > set is ~OSC_PCI_EXPRESS_PME_CONTROL, i.e. everything except PME.  No
> > reason was given for leaving PME out.
> 
> It's clear there *was* a reason, but I don't know either.  Maybe
> Matthew will remember?

I /think/ this was the set of parameters that my machine would hand over 
via _OSC if we hadn't called _OSI("Darwin") - but it was over a decade 
ago so I can't promise that's the case. I think this probably needs to 
be tested on some older machines as well just to ensure there's no weird 
breakage as a result, but if PME is actually hooked up and there's no 
SMM managing it instead I think that's fine.
