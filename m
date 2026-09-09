Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012AB48F82F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986826; cv=none; b=RpTjW3r9WI/30wUzlFw40oo7x6YIT2nx9Z1iru0dB4EwbyTheQByTka9X4yGbmZg6l+gCpj2kF1b5lx295LKKSQseqO/XhQjuci9gs9Cv2h576UBUIrApsyJRdzTVamd1yYVBBOGMi6DtR1lzf67fFsFNNU5diAMjcCev9RLaqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986826; c=relaxed/simple;
	bh=qvRiWt5c2pR02hAjYA1D3/lp/tkyWi1Ndcm6jnLH1Dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPAAviQ85ROtXHsHVnrCnltd4tMBY2fKeL6wF3K7GHDD1vHjsQ7clKnbmRtyuk2vKB9H+QgaZTzg4Gl1XzsYlOZGj98WL9bNDsL16RCOnR+GRaB2wSe0BiOtk8ewf77+MKjHdn+gPBN+JgHUcqXDEyZ+UYBNBfcRJHVLc4619oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6EhK2YE; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6EhK2YE"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2dd020a2e44so10384015ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986812; x=1789591612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+pVpYIqXSgR+sbP5ifOxjba32i7axh0MwsGHd9mcNYo=;
        b=m6EhK2YEEfaq9Q5Ha/DlD6EbQjISrY4jo7VXgtsmIuFPlSzYcoaOoaP3g8HIcrxqer
         si75WIcr1DxUfRLwowC9WVVjWX80v9IMfLiqxDbZBtKTlF1eJm/hh9WPzVQ1JTaWpNQf
         /qHT84h7lvi2dtJSJCIwfO+tLE6LdxbJBZge5NVWAmEPERSUAsPnozGoWfvrTODYsl7F
         12NxT8aJkSoeHEehtgEgwmN0rEdop3FuGi06ED7YqVNKLmlmGzoT4A7ViWBtTLy/MKHu
         mnKDySYvbexdl1C1slj4LBGF1sdcLMkeR9vqQOmWodUYopojrM28qNTZNEMIUoGvgcbC
         qf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986812; x=1789591612;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+pVpYIqXSgR+sbP5ifOxjba32i7axh0MwsGHd9mcNYo=;
        b=iq3yTV/WOu5jhGNn3SKFQtX+UyyGzgXvLXWwOogxmTOTWmsEzuHtEOytOyGdh7rMep
         UHU9Xv/+iDgEBrf9fECc57f5Pbec/WEKGzSXDufLadki3FSgsgu4HEuk44cnAV3wqX8l
         VMplAOXO3kEUdIi9u/Q1aSv20clF5K2UAeki1mEhVjTAzJDNHZUzfXjaN68amR6jY+bZ
         pFradj9zO3kZ9VxyfjONGsScvqY2VrVhAREDO2yg7LpIovy8vU1jgJbXJzwwfx6x18KP
         TNp7t/Ir2QbKCVqYmKefkaP9FWv4xDoa05Im/K+nJCczSYqR8GQYQ5vXT08aZ8AHNeKU
         ULfA==
X-Forwarded-Encrypted: i=1; AKwUvByNW5N23MTcPAn6XSmvJxWHxyczuJ92Qk2K2GPADRIRo6UN/Rxd2i0pTeqkDxLYcsNVZhxZayMDV99lDHA=@vger.kernel.org
X-Gm-Message-State: AFuF++mESO8V9Twlxi3ewbsoopdgGY56dQTlo5F4c0fgysMlfuYIrUZf
	zmgPqOX34iJRnCQavbN1wuikLX4njlvNx0dYr45GO/+63ptbLuagVbagGLkMoQ==
X-Gm-Gg: AYBFou0yfb+HPYeISh3YecFNRhFu1hRqOIxc84HGoThCJsPgim746xaHV4B6D+S+cRL
	anHydatRgaRJCJqDH4loPlVUqlWBbsejK8Z1IQSX7v8qRGLRVahzFm0JwbqZT+cwpotVDjdKPRM
	RFOWc/7hFASM0mq2/BTzTXfiG2W3EAD6VMHGUxdgZlZTUxHKAWu3CjZ/h8E5g7taplVaBCrdUR1
	HPsU46zzHBlSYItj3rYosYCD7OTXhLA23GZLexMC5fxUcfed+rv5xeXUkUa8/pT8dW1tgug9rah
	HKMPNpo+3YO0bWk3GPNrstNUxheZfHs3Lfwt1J+Bdr4lJ7S5jT26peMH4ApMSKnuGj/Fe84VwIk
	24yPP8iolXPWUr2gejqcNX7qtY1V5bxtpQeUEsxBPprg1V7XQRfMWxLB0FnIfadiVsjfG03CxK2
	J2l6ZPGmti3g02Z1ecZSg+LSDrBvWIDT3IuPBxeMq0onGJM28iNrvDLX4/Vl4JXMZKF5Ak4A1yR
	pqZODalv7f9
X-Received: by 2002:a17:90b:2b4e:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-39b2622b9ecmr55550499a91.20.1788986812401;
        Wed, 09 Sep 2026 13:46:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d775c02b4sm1227247a91.14.2026.09.09.13.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:46:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 13:46:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/2] watchdog: fix repeated words in comments
Message-ID: <9e0336c0-26cb-4ff0-a1a1-b838896130c7@roeck-us.net>
References: <20260904113744.19872-1-hemanth.selam@gmail.com>
 <20260904113744.19872-3-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904113744.19872-3-hemanth.selam@gmail.com>

On Fri, Sep 04, 2026 at 05:07:41PM +0530, Hemanth Selam wrote:
> Drop words accidentally written twice, reported by checkpatch.pl as a
> possible repeated word.  Only touches comments, no code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Applied.

Thanks,
Guenter
