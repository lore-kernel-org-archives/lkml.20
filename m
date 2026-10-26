Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793031047;
	b=29LneYPEboE+V4EpEj/VvJGT0TlH7wvEZdLC61yGGOF+PRGe0qSVOucd6Ndcy/ZW+h0A
	 nY8GlGlpjKVP+W0ysuoFlSoAgt2LpIOcS/8Xbt/ZMUWnui74R8uh1zFLdUD54ny5iF81p
	 zb8D6BiADl2AAlWOi3L+sAqSxX3D825TccFE/qbLFPaYmczz6iF+3rJ2geXYukafPTlBS
	 a2f6D8Ds71Ummt5YrosADqisAvOWkPcjPTd7vtTJPaQae+5VT7zo3ivcyfMuzrCCEhnn+
	 tmqtRXX3RslW0pCwBJsaJWtI4EMfWwLFu+rNXrGCJf+xno0OZqsyIt56FovJPjV4bxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793031047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kUQvqIgLZiVjTe7e+6FWcgsNotvs+E5CfPr0Pi2+vxo=;
	b=LqxXbVau/H22lQJKzqwp7FEqDYCuH4tuPWNfVicU2eqC1bfUPXZqP50WgsuiAj6Tw8Mc
	 VmUaa1FK4opbix5LODCdxH1WxoUdSdjsEHmrdxoYr9ghNZVa1S3zGvuSJ03PpbrVrO4O2
	 orEXYllEpE4bQU0Cc9jmNh1vnvWReKZbFK7rGDHTMLtcvULrJXFHAoBAalu2V1udD+ecf
	 geLL3ODamRG8jnBxR79gvA/rWfQpBQNE8CDQzO0fdPWA6wMoVhBh9G35eMxZl5XI2SchO
	 eZtfAtWPAK//3nudblIilO4mPw+yNDv0dUiZJv2+yV5nmoWBRE0VyAfsJXOlf7jonpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IEmZyfZt;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E9F606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99E9F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IEmZyfZt
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so21370535e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793031040; x=1793635840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kUQvqIgLZiVjTe7e+6FWcgsNotvs+E5CfPr0Pi2+vxo=;
        b=IEmZyfZtk2wrFDPKvcvv+Vt8pXHLaDImfYai/0x1kk8e/veezoO4DOxvjM3ITQ+tRd
         eYKp6X9FgdLdT8xrc0Cl8Motvf0bAU76LOg44CKQWuvj/Kq/Q8Pu5w+GsZm2QHDwyNYy
         nuN5shLp0zV0+lgXjr1xzubrFI0Qz+EzUZ5ZGXAgWshC7/FXGJ8xqbsld0KItWW2hQ2Z
         E9uTZcWMghl7Qw8tdJAy0QQ4gMFhyXwV+adONHMclP7BVUp23yIQ/nAKSz9UxMaXdSrr
         nXorCyuXyKTkSuCZadfv8eolFSslnBGeLuLZ5T/+pyYzmCbTUGqy4Smru7oWw6KRMKeg
         8DBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793031040; x=1793635840;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUQvqIgLZiVjTe7e+6FWcgsNotvs+E5CfPr0Pi2+vxo=;
        b=JwBINWlMZcEeNmOcErRWB6mM4o7X6Uvndpa162kYcc6Nz+kpHK143tKndiHWivZnS5
         tCNLW64k+mH2vQLXs7ozcVdVq4uW89OZyymv4KGhNVSf7STAD30kyGumxzuSbRqXE1aY
         2L76x48phvYsWpnmHdw/QCt/dBcEoYV0sKicT90GcVviXuvvoCDed9l1Jivv0BYlhsa9
         2zzTVFnFQv3mOUYejFh3Iv0eo5EUtWLjWxDmkyIYAms5yV2ivZBzFJg/6rWPC1tAG6nn
         3jB+JiM3YmdjLW+HhvtxHywKQyFkzqJBHVxSAWQ4aeChdPUti9TlwvBVEEE45AaDJe7Q
         P2KA==
X-Forwarded-Encrypted: i=1; AKwUvBz/UsTojh33t5aqMGuoSM/QZbq48TyLnmkzTCBDG6ESkknYR7+hhH9TOEvgnRac8U+42FdSqHsf0gKbuCU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJI0G0fbQE3da816zlRqSp2utqdDIR8FLJk7PyGOS0oHkHut2wc
	c0lJU+BteGjJ/fZJeXn5AtFABk55NxAtQrjhZ8O0yY0PxVNXc2rCZaIAS3hQAkEiClo=
X-Gm-Gg: AYBFou2BWM57uKuk0RsZK7vp+dzt+KYzmw0xKwB37a/Eww8TT2z8VrSOHMW+iXGbpMW
	ybHZnooFZQZNYzI3Ip/rnLZXPNW25Wy99XZMxxRrKPrbyF1v+YU2ru5vLgiCIUUsvKK3gXUH+Za
	2AaUPXg2kkjBaqMIYqXbzO0uGFmcAALmrs6cO6ABhauUNVvOP7rHRAOdiygedMAYvhVBNUSoTQZ
	rGUHAlpjchn3UVq4l3pvvgHbytbjW90lS57H2bfRcZ8gUW/lo/mBY1+t+4ZJKZtaEs2WZGmZXjS
	D9+pPYJ5AlJF0rTaWeGlFLtwBiqMVrnE+8sauHvOH/S1NvfIztElSSNfNH5MW3a95CyCvgZQMbF
	bQBFWTLpXosTYOvrSoblM0Jx5eFQ/9JtKTAO3ti3fwpEP3E9G2yxQh0na5Z/WjyK46Bn54ahZxp
	N8WA9/v4ZgZwwLunVe4BMiT7/BOM2AD6t6OBaL2bjUyB1+H2st6N0wrX8hQl4AzhZDTqLO2+WrC
	7umRG/GtZAYOGikBNCo2yYHwAc2VggkEedx9SVxn/XYOxTcSmIZooFOFw==
X-Received: by 2002:a05:600d:82e5:b0:4a1:cd83:b23e with SMTP id 5b1f17b1804b1-4a35aae3e29mr175561725e9.0.1793031039857;
        Mon, 26 Oct 2026 09:10:39 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm17465846f8f.17.2026.10.26.09.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:10:38 -0700 (PDT)
Date: Mon, 26 Oct 2026 17:10:34 +0100
From: Petr Mladek <pmladek@suse.com>
To: Chris Hoy Poy <choypoy@linuxfoundation.org>
Cc: helpdesk@kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: Create printk@lists.linux.dev
Message-ID: <at97ep5tfyQAsb7H@pathway.suse.cz>
References: <asjrq9g8EoUGepcH@pathway.suse.cz>
 <as3UxRboBZYY3oCH@ashevche-desk.local>
 <as3VC2TmhcRXg0Xj@ashevche-desk.local>
 <atYw6G8V1gP-ksTM@pathway.suse.cz>
 <CAKkv+gw1MiOQQ1jywejHuX6u+SMLMGBr=dbzTZTpaBDmQU-Jdw@mail.gmail.com>
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
In-Reply-To: <CAKkv+gw1MiOQQ1jywejHuX6u+SMLMGBr=dbzTZTpaBDmQU-Jdw@mail.gmail.com>

On Fri 2026-10-23 14:45:36, Chris Hoy Poy wrote:
> Hi all,
> 
> Apologies for the delays on this mailing list - it was dependant on
> the migration to the new listserv infrastructure. As announced earlier
> this week, that migration is complete and new lists are being
> provisioned.
> 
> The printk@lists.linux.dev mailing list is now operational:

Great. Thanks a lot for the list.

> address: printk@lists.linux.dev
> archives: https://lore.kernel.org/printk/
> 
> with the owners as specified:
> 
> Owners     : pmladek@suse.com, john.ogness@linutronix.de,
> andy@kernel.org, rostedt@goodmis.org

JFYI, it seems that everyone has to explicitly subscribe, including
the owners. I have already done this by sending e-mail to:

	printk+subscribe@lists.linux.dev

Also I have sent a patch for updating MAINTAINERS file, see
https://lore.kernel.org/all/20261026160128.12581-1-pmladek@suse.com/

I am going to investigate how to get Sashiko AI reviews sent to
the mailing list.

Best Regards,
Petr
