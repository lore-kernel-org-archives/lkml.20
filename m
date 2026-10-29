Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258007;
	b=0SWPE46bs5EFfyBDftbWjLsFsuvKMC60Res6O/MQ5+mRFTV5bbz/bERysy8B4AmUwQxK
	 yb19eVzcmmxTpWoZcfmBYvPAegptbZYU6oRxMoXDtGYoxUpmpjyXach4aeZsGL5cGq/8s
	 3kpf7QhvC7t4N5+Z/ug0BoIN+wizkPAeXaaJL6pz3b2O5vGEAv/iMCcMOKE4C1tkFqBVm
	 kNi2KWbKg8CFb+RrAZNCLnodwfF/QI5LZ/Ia5LBOwu7UvdLCwgckidkbqbpVS/NHVPpNc
	 Z+uzR5Myv9vX/R3+z+bMEdsyPdGrh2P+bNwdyRBkXYkcFq3lQyKTaovG7JfxyfkqWLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=b6s740g30n7ggR3Wpo1TIMx/u72gJJORBGCmEaKiM/s=;
	b=pr/cKPUe/STbalWRsGaOggNprWqD9Y5g6Mi5CNLaD0AnuPbVWMZ4s4oEqjk0UJQVJSah
	 msaC/uRPv/lsjiuWJSxfJmysbqAMVIanp6PwuRcTjzFTJQTd4Vt2QhmJfbXdwhKnDvQH9
	 6K6o7aEwgkT9tdYXlgGlXSRzZN2Hz4xzg6X25EUMexJfXKJWuHoNFEk5tV3qb+lm1Eyi6
	 xKyCsMOiE1kXcxVpqdH/ofGXn72NfvVqBOy2TCpGiNrcGqBbte265Y7UjfLhNd7RGS+tt
	 4UGsJkxlmVUvoXcy8vKpoYNXc6NcqADeXLtxLIeckVCfr/KrSsUWjFIBvuQQDt0dJNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=gRCizaSn;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F95606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82F95606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=gRCizaSn
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so928971a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793258007; x=1793862807; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b6s740g30n7ggR3Wpo1TIMx/u72gJJORBGCmEaKiM/s=;
        b=gRCizaSncgB5zEaCGIObx6D0QnyahEZaB4qEZ4qSwL1F5BJwP0oilqMqTg4ZAac10g
         zNQCsgUsWprtwCvH2aoWeIc6BbzJw1zCIRxPVyLmIrJkgrI8q9ZVoB7GdeH+w3K7TEek
         bD/RascKzjigUa62OVI+LB29LTMXVA8DA11ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793258007; x=1793862807;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6s740g30n7ggR3Wpo1TIMx/u72gJJORBGCmEaKiM/s=;
        b=fpSPUBVk5NbNevZuuiJEKQmY3mpgNKS9OyCij8W3+F63jm3d2ReWRXLTcZIkf75IaV
         W1L4Zu3HO0V3XCIdUq59pk/diTAXLIOhok54kopR5VTQFuMWJL4QC0zH6LUou6gB28/P
         ryiCztC5w/x+/TqfCYDUK7+dhyFk4J1JlItNFYnuUxlXSfqQTwzPCB9ib6TcwOg+AIUB
         wwPwUaQ+s3De+SuzI+3V+VAKHBBxwwRQusLQuwsF1Y1y0LREP37+FVg0GY9Mzk1uCUOl
         71paoDPPhRcN7XQ+7jywk/5kDSqv+YcvY78uHhNB6/kY9jGLa3Uw7B2Qfj3ChvUe0vaD
         SNsg==
X-Forwarded-Encrypted: i=1; AKwUvBwys1eSSTzCz4vAPMROSmyaBffxA/5zcBUjDIBI82/ZBF8rhFk/lBuA0EyWKVFE2Ydd18MeEEO+A6Yj+Lg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJnYNdpGybssctze+YoDwG+1je8MbLJ+PZmxLicxpx80/lfwKD
	V00ebVSYSib+DaRCpRjZuomgqVxUBf3gc+h69/j1S1Ig1YicL6r54LGWOKPMOij5QfY=
X-Gm-Gg: AYBFou0PRit6ZQ3hyWdVFSUZO6TsSWEq7gp34kKqEc1875iDnNinJ+GDB/HXvTIR9t5
	eCVYxYLFYoXZcyXCbhLSndm47drjo+TMsasLLccu2Z4lQf/x9R2jsZNMOfpSMJ+uCcbkeBeHlim
	CX5Qdv2JIfnwMfFlAy+9kfNkiHbpiuqQBCBfFQsf2P7VBDhR0R5brJLnPQcBokJjf9y1N9EJc20
	QStHgCfAc+zCn2Ba7MoGfU4y3yvyA11UOwnlbg8rpjgm5iesLVGn1LmFCJl+9ETiLckkNfynD+G
	ZHkhmKZn6K6n6VLm7ZjSfQ3ms6iMgtOH6W/3LmiEVu4ec+khMSjaGVr6nJ7mHmZi1mDVN0Vtqj9
	jDYGTsw2RV+pCnXX+x2CIpjXjv1tVC+8o7SpADZJ88T3eA0/kWcm/2s8V8D3lQ3Y7cGw1+FvDTi
	wm4V+5JzeoyDFcBbEdaCwEq/R3n2fqHDoGhWVepyz3K17S3gokwXrsiIdVA33hnyI/n5UK1epTU
	erRXeglXuMLATGlLc5c7FeV+pXCJTaXa28UCXq7aFIRXuD5W2pMo2GAOn1i5iqtd3gJ7zvYkiFO
	UhsqzHPSCISzGduYxtiUxUUv6XhsCHgc0gvgUIyiHSYnm7oR++6zPf3r/0/DRewRXoWfYOMZ4P9
	m6PIe4VeQx+tLhdcApOF4jlmHX57DlmmYVXM6PC0f3LJPVKDqNOJFNHlccgRFm+KaUDGiYJ/d
X-Received: by 2002:a17:90b:4d09:b0:3ac:96a3:77d5 with SMTP id 98e67ed59e1d1-3ae58154d35mr3200231a91.36.1793258006841;
        Thu, 29 Oct 2026 00:13:26 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7fe1f3sm3194098a91.7.2026.10.29.00.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:13:25 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:13:21 +0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 09/16] printk: Allow to override options via the
 command line
Message-ID: <auLyEcr_gqE3CBBi@chrisdown.name>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-10-pmladek@suse.com>
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
In-Reply-To: <20260929120546.328616-10-pmladek@suse.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Petr Mladek writes:
>Consoles can be preferred either via the console= command line parameter
>or by some platform specific code, e.g. SPCR, device tree.

On v4 I recall you said you would probably do the change in a separate series. 
I think that is still the better plan: the rest of the series is a clean-up and 
it would be nice to keep it that way.

>-	 * Historically, the preferred options are stored only by the first
>-	 * caller who prefers the particular console.
>+	 * Allow to override options via the command line but always
>+	 * prefer the Braille variant.
> 	 */
>-	if (is_new_entry) {
>+	if (is_new_entry || brl_options ||
>+	    (user_specified && !is_braille_console_preferred(pc))) {

This also clears options when the later console= has none, which v4 did not do. 
That breaks at least the MIPS boards that pass the firmware baud rate from 
setup_arch():

    arch/mips/sgi-ip22/ip22-setup.c: add_preferred_console("ttyS", n, dbaud)
    arch/mips/sgi-ip32/ip32-setup.c: add_preferred_console("ttyS", n, dbaud)
    arch/mips/sni/setup.c:           add_preferred_console("ttyS"/"ttySC", port, baud)

With "console=ttyS0" and no options, the drivers there (ip22zilog, 8250, 
sccnxp) fall back to 9600, and anyone with the firmware set to another rate is 
gonna have a bad time.

It also makes a bare "console=uart" after an SPCR "uart" entry oops because 
univ8250_console_match() hands the now-NULL options to uart_parse_earlycon().

(A bare console=uart on its own already oopses in the base, so that part is an 
older 8250 problem, but this patch adds a fun new way to get there.)

If you want to keep it here, could it at least only override when the command 
line actually provides options?
