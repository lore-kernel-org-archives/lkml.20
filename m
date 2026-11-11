Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794374472;
	b=oK0RRDMzi3cksT6y3uFauL/buGIhm7ZQSAxjz8r7R2RFHBROBv3/w3vA1ycxtqb9hLKG
	 ywX393VwchVb66AABOLxA8MCjBI7kWTSoTIeAroefOKd00jq6iKlNgk7YV3axgmACuCGX
	 iIvAJQIHcFh/k4RojEc0OD7BonoKbwIxYHjjpD1I/rErrEb3DaXeHyzaiQJEMnifNERCk
	 o9DYc3tyvT+BxURL+gUPiIEDrEjR04lzAPsjseAaL3BfzrGNV531OWB2jzEurCVPtx7Ug
	 AC5iw5c9Ky5t0FGWQ2PZuZLa30l6cnJKLA/6P/718rbIp8bLmt7MPj8vVyGs5NrgFBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794374472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=RXOGahbdzWVuKRFOMy3n7+L/nT19itnfVGdhqWQoYgk=;
	b=I+LmwpCcI5vaarFZnLf2lIg3bVzNtQrZTM9VHEtyNXQnCdm3X22ZcKgSU1N8c7nsDKY4
	 L5P3i09qVfKb5Ddzi54xTNGfc/t5mYHepsu6aNdCIf7YB0GdhgF8Y2D8FM1Ca1xsGXmt6
	 61J/U/ctJ6Cnbece7aJ/eDd5KU5WF/k0mKrYuSKfFJRYst4JQqET3MwaD9lEnYxqCPdFG
	 eEkQwHbqfMLyTOsquW3j8cEOSMj8jrVXGyhEjP7b96m8Yi7zoUnRkbEnN8DIRLnfqfDp/
	 8YwoDhxKUmnS2IumkCs7i9cxF9LRp+orXu8YRIZS4F6c5VDB9mOmvneaWAczaK88a5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="i6wLn20/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A15606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3A15606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i6wLn20/
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b305e10ac7so29718867b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:21:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794374471; cv=none;
        d=google.com; s=arc-20260327;
        b=Y83B0+SLI9hJ+m9ErUCsO+mL/M2upL5HkV2YBMk+aWwX4bFhkZ6krxllWx3BUL+p9U
         hlok2TTlI3t3mXnt7Y8tulhGC5VUIl1yh9knnsiqW0JiIrcmvSEv5iVeivhVGBXA7WT0
         0bDBH77UBkktof9LfRHJZMiTtMnKoUCdeGX2NlhJIQuWecIcR4SY1QtHUQ6rdTqr+Unq
         oSBY1yPowc3HQeo2UaxZxolHYBbMtFqPKry+q4hwuGybHkJ0IMNTslKelpXQgb12KAzn
         XgIrwvvOl4ySUSnWLunJOhVnmkiX65Twk1tf9gvqTkUD5l9bl45qx8VT92MgWL9Yuz9G
         sPyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RXOGahbdzWVuKRFOMy3n7+L/nT19itnfVGdhqWQoYgk=;
        fh=2MQz6/fQdNMz8eMo0v3LSu6GUdzuuVCfomvhFwkB97A=;
        b=k0ytVT65FOUFQO9wkymqEC4u3+RysTSeA0Zj54Nge//r4bHYE2H8tbgLghhtS68s3k
         nJYNtfE0foftaCK4EMhxwaBwYsRCIApRz3VJJi9j21vNTTuqnNRmFqxbFMNL+T95+kwC
         4d5hwEhSBEvlwVNASkpq2hR6hfbwVhbiBxeRXV2+qEwjmXc580LOCgB6SPlIBueEF7bY
         ofcnkyulpiULOLgQZX3d+SV6qvLCsUWs1o0wQLZE6EtSETKd0IRENmnbJkXOA5627f98
         pNo2MVPKPG637TWslSIC102hYAVWx15tfDkGb+jEpGieVjawBzSve7D/yo+AaO9DvxGk
         Q3yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794374471; x=1794979271; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXOGahbdzWVuKRFOMy3n7+L/nT19itnfVGdhqWQoYgk=;
        b=i6wLn20/fNj0TrV0NmGYoVEi0GG2oiNpEOrok3FsbzDzCkYYrCAZfqOq5anYRkp7Ts
         rOM4wuPSrbfqKPpZ8IYBHVXs7E/YsOzv1gZ13/izfvLT8+hr+VvM8pHU2EW0tzUaUGQq
         GCPdIj0ZugdQiuZ1DL2Ar7nHgqwD5qUxysDs33FrDqIPuk8g8CKh4x8KRtUAeB4Q3TsU
         MSa33bQcPfknJJyRZJkitRHQuGjo5XBziU2jK5yNvrlOsSg1haD4jr3oxD74ual1J+Q+
         22eznEC403x8KAcfLwHkjHKeuL6b+GHFr9m/0ZLY3ddG9PRPhUT/aYWfiwVkhtHlp2NM
         /BaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794374471; x=1794979271;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RXOGahbdzWVuKRFOMy3n7+L/nT19itnfVGdhqWQoYgk=;
        b=KCZTt8f3UmrQ/eGG6Aj4M+kyM5mZPTQkPYNzLs7FbFkTJZLn1iF59GIdmb1JRMHS7F
         /mCWsH0jznyxFzHda8Igh1mS3+Iabo4MgZ8xRO2LZ8EJuV/RPrwojn0+uG1yAG5kzrRx
         50DnrJQNoHn72tO8YW/GMj0Wavm2iGRPReHpVqy+UbgYlwOCCGNUcHfEKt/81gpSN68C
         S4BIBW+c4EX/5vfv5WnKwA5gTb4iGqME4y4od1F/wIgQsVCO9wIVfwilIlIYVIdAiVzA
         8fOXU+DvTRA7mg6CqODAUYP6crb0UlQCL6IGNJJSnT92JnKC1QIQs0fD4l+i9WNz4Qsp
         eG0w==
X-Forwarded-Encrypted: i=1; AL+hErEzB3QJEu7gsLLHruWn7K1NmVORTyaagxv1nTXqj03zxRB0kdxeH8uUKnbgsWV6EINmFsQsf9O4gXsCsvI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q87+rjsozoKiJHpQrUFo7Y+2wZEmYlHpa9mUX4/4ysdX9vK+q
	x05HNzQcUbT74SOQ2MZxECG2/chAPHExTR4xSbEsc7J+Wp/+dFGaDcudtEF9R8/GMzYQujZ6nmG
	2Jpupt83k0HLkVS/wq/yXcXtU4DaENJnM3w9nSsNP
X-Gm-Gg: AYBFou0McZVSSOLbMgZSiSChMjK5WDwoVXKEiDdPAECZJkyoeZ0quxoYq5Fk9+Ztjgv
	zlexmDYjXGC7ocLkBNREwbUTyQehCmywz5qXOG34OIwkRR3+VtkEp57nPRhjh9ufN5OfimulTEs
	jktVrFM3SKqYk2f0nDmnzsHJ6GZY/VuiuU5DTqXcQVqe4P84clSTtW3M6UROZzQJHjFapldaax+
	OYK/mggN3dKd61JicGVgwXgyjpKWbC3UwS9KSZenLvuK0VIHjHdR7/+ExGxkOczZzgU3DI879pC
	5EKSUqptlsmmgn4xhOxE8FXfBXndbnV9hXDfdMhS2TGiG2Xld0+oEUvf4FWw0MpBJW04ANHrBfE
	o5Xl+40jFl3RKx97fDPrzSUwJT48iZO8bGxywJoU4wMWRR4G55FsDmHqg0lM6Gnf2mdAYsA==
X-Received: by 2002:a05:690c:30a:b0:8b3:8e07:5748 with SMTP id
 00721157ae682-8b3a8030b96mr14175687b3.15.1794374470120; Tue, 10 Nov 2026
 21:21:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <as487H8-0Gc77mXI@ashevche-desk.local> <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local> <atXnS1ZKGVfHDNEK@ashevche-desk.local>
 <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com>
 <202610210957562f3f6511@mail.local> <ati4B33tnKsCD4c_@ashevche-desk.local>
 <CAHreonEbHrPCCro+2u5LC2reVk2fzprC4sTLi00nyh8U1=VdXA@mail.gmail.com>
 <at8xuIWvvqLoicTg@ashevche-desk.local> <CAHreonEjSXs7ecOrCtqXh3gXdkGeqK=8mgjTUHLk3q0aOuP4pA@mail.gmail.com>
 <avI_2ddihPu_sxCe@ashevche-desk.local>
In-Reply-To: <avI_2ddihPu_sxCe@ashevche-desk.local>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Tue, 10 Nov 2026 21:20:57 -0800
X-Gm-Features: AclHuK9gdG5vOoLD06a3GoihO_fXbfpPw8TAe91NaL38BBX0ECeG9MjkEFhezWM
Message-ID: <CAHreonE0S1HS4mHb9J=z1TAyY2Au1GFC+E6fjiYa7jDdsqdBrg@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i3c@lists.infradead.org, 
	Frank Li <Frank.Li@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Adrian Hunter <adrian.hunter@intel.com>, 
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>, Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > An in-kernel driver would need new sysfs ABI for this, and that ABI
> > would have to grow as the spec evolves: v1.1 alone added multi-stage
> > activation, flashless boot and the indirect FIFO interface. With a
> > target-scoped transfer interface, none of that needs kernel changes.
> > fw_upload and lib/pldmfw fit well where a kernel driver already owns
> > the device; here the only consumer is the BMC's management stack.
>
> Yes, and I see no issues with that. Opening the whole i3cdev just for the same
> reason sounds like an overkill. Especially if we do *not* expect any more users.

OCP recovery isn't the only user. In her thread, Meagan described a
separate one [1]: accelerator cards that plug into different server
SKUs, where the I3C hubs and devices on the bus can differ per SKU, so
the hub setup has to be discovered and programmed from userspace at
runtime instead of being fixed in devicetree. She posted her own i3cdev
series and can speak to the details better than I can.

Also, with the explicit binding planned for v6, i3cdev would not open
the whole bus. It would only bind device classes listed in its ID
table, starting with the OCP recovery DCR, and any other class would
have to be added there deliberately, with its own justification.

> If there are success stories, those examples might help to justify your
> approach. It makes sense to mention that in the cover letter with the
> summary on their designs (and split).

Will do. I'll summarize in the v6 cover letter.

[1] https://lore.kernel.org/linux-i3c/20260924-86692413bdae0e78a12c1425@linux.microsoft.com/

Thanks,
Sam
