Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524700;
	b=Cuqiv3xMd41pkg9POa19lr6FoL3hyMVr1txDeVGBhZM9eZLmzibNa+b45XyCsZ1SkHXO
	 jXsBbZgj4GqFdWxBI6BQyaxpGGTPZMgnvZUmwneWwkIzfMk6wGPI4KVbntpCyB/0k60k5
	 72oVP+DakwrCYwT6PSTJtufDypxQr/Ls9+egS4iBiVLBo1S2Q7Ds+mKl2HCbhT1CHiQIa
	 tMhPlfRLi+27regAyjOsmcMXO0L7Q2eEHqNRmbh6uGDALpt7vRNb4PeF/LfcmywSMQink
	 1q+xDht3agV0U2izp6zONWl7b7uUW9nEX9sX1CCxAejAfTdj6qA0grLY7r5Pfq1AA6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=p/4lk02epaMR+IsZKZ+HoxMKqUc6qVIda0VOtHn3aEc=;
	b=VxzfQ86TPzNfs3SaGYrBuPdrQDZguv4womy3+NMKCZxx+KNVzd8s+OoOghN6MNUQPbm4
	 U6y7Qg3d9d6q64oFt95KgI8GNmBTfP/ZRxqfzYnEx8eL46Wv358zRfUX9Um1bPjAdTDNk
	 oRtf5tgZmJtmt8emoumgJkwSwD3K4SmdxUbFrO2i9xCUfmz9N2m0TtPCjWej12pFMzwA4
	 66Z0CdJr27O5Nu3dFgHfAEjMnAIf8i/BHcrInLGR55ZSTqVY6EJ+WSk6PpJFDJpncJZyv
	 8QIgPgFd6LDqXB4S3IIHMe5W2Ooy8MYi/SVGniErJIeS6Y5mZ4nYu+fwk1uwEO8xmuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=X11oGv2h;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CEB606A338
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69CEB606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=X11oGv2h
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214af2076so2193145e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794524699; x=1795129499; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p/4lk02epaMR+IsZKZ+HoxMKqUc6qVIda0VOtHn3aEc=;
        b=X11oGv2hz8wSzhdTWRT+wIEc6rImT8HwmORCi8BYxaDq3oCUAZIi0PiqktrMHzo5ld
         pAW4gc5VE7QZZBQIqGoysZWYL9WLoPNaXT0As0X2lCk9X6eBBVZ3Hrul/1q1xCq1ZeOi
         fTOz6eqnmjisELeBqbzgriirgCWPOwReMFl8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524699; x=1795129499;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/4lk02epaMR+IsZKZ+HoxMKqUc6qVIda0VOtHn3aEc=;
        b=hJ3oaiP42GLxy4QCLpf/QYNxaFKz9nzv67IypTp2S9IKeg44zFQtmsxt6kO54iF1kG
         7b171O5D7j3TY65oL5Wixo3//n9NMsBFbLCUmnfLDmFeHC+3NAva5aSqJk1oP7rmLIlI
         uWJ1oX1erH4CsAOoOnp7IfyxHq/tIhtBMp/Md99sXcNqYy3tyMJVwhjxYbyqw+wllhMk
         zRieXhJJlomQ8WlIRunlWa08ORfWEvrHQMX5NQmYv48RTg1rOoJjNZF+ifO90yNYOk4u
         SMNTu/KzO8WEZ8vlCra5WhQVVPcUoZ9jSV9g9vdjoa/c0tUbLg7A+lanBH/2W7CwpWZM
         JUVg==
X-Forwarded-Encrypted: i=1; AL+hErHjyPHFBqOij89NieBOsPuEwpnHmF6uSLcGTfvjkOtGYBZvh8vxV+lQuBAOozwZl/54rd+W7aZtCDFh1bA=@vger.kernel.org
X-Gm-Message-State: APuU4Z833MSDdhyaVdWy0G58HBeEMnpxuLvBFZjormH1o4Boj1ZVhxWj
	LrPmVeWS86nlFMLK0D35gUjiWrodIvkIJBOpOhIiYX5dB3kGf0QitUDYtXjHP8VAX0E=
X-Gm-Gg: AYBFou0q2/o6JyXZQH/XRGnn7rm5dbXxpYPSbOrIgSXtI9Xx9zCrLU74NX0BElIvEuz
	QcJDDQ11KUqo3NNG0xqWQIrjKUPkEaDv5KLMoSDU7XgaoKVv37O8NajF6HqKRvuuY+lBP0VOC+d
	gCWp+ba3Z+w/hR8+dvE8hBQX6AurKbdJrq1O5xpY9JBMOrmWC8ZDUr8fjG076F8k22GKvgx8Ezo
	weiuVucCIHt8a7bWtbgGf4SKBFlwEqoW71vPtj26mrSTS2NzakCgK9nmniku4YQchCqv7BciDn5
	VD9C2wMgZ9NhhUPt7EPyLCxQkga2BdOeq+a4ihGTO9mKVu5Yo1d5qCWmL9RpIbDkvs42CE/oA40
	MbhFoh+ydBlkzFZjtnjwjmZFjLdmcicQvxXf4Dis5sYrJ/EVMu0MdnaOUhH1pAzeiV//3Jcupdl
	39V47lMMpmX0YSpjEXzpqz82vzNNTA3qpkXsBxdxUkjv8azP948wvRosIhtNCtLeUQSPZM7S2y7
	82F/FYFETsj+OnwlHYNyvtaf2rLaVIq/aMCUoj6aJE8/4XdvM1PaCrAZKjmyzHhh7YdO9YySHZc
	U5xWWV5WXEEq5PuyPlVFZ4sC5zRE7B6DAMfUCaalnEmu2JTOMye+26W1OM3jDKuUzSTjrJsYWVD
	UqBz/vaZsTvDX3xlc2dFzIdCGhwO/0qLTguX3BHJ3Pj3bTmVVGt78eTRYYaoULLgGFqD6/BYuky
	ldYWBLgSMfCUL6eQGzWg9HXB9g7BrEEd8aOSznth3Xi5aKKB42Uk1OgX+XFg==
X-Received: by 2002:a05:600c:4e13:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4bb55a47fabmr14344115e9.12.1794524698997;
        Thu, 12 Nov 2026 15:04:58 -0800 (PST)
Received: from [172.18.0.2] ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm15846805e9.10.2026.11.12.15.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:04:58 -0800 (PST)
Date: Thu, 12 Nov 2026 15:04:53 -0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Marcos Paulo de Souza <mpdesouza@suse.com>, Naveen Kumar Chaudhary <naveen.osdev@gmail.com>, printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 14/17] printk: Update Braille options when preferred more times
In-Reply-To: <20261111154816.71103-15-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com> <20261111154816.71103-15-pmladek@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261112150453.a18f9d1d0a874e96@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Petr,

Petr Mladek writes:
>Make the behavior consistent and always update pc->brl_options when
>@brl_options are passed and they were not defined yet.

This changes what users get for something like "console=ttyS0
console=brl,ttyS0". Before, ttyS0 stayed a normal console with CON_CONSDEV
and the Braille request was dropped. Now ttyS0 becomes the Braille console
and, with 15/17, tty0 gets enabled as the default console instead. That
fits with Braille always winning in 13/17, but could you say so here like
you did there?

With only this patch applied, that command line also leaves the guest
without a console until 15/17. preferred_dev_console still points at the
ttyS0 entry after it turns into Braille, so tty0 is not enabled as the
default console. ttyS0 itself is only enabled as the Braille console.
That leaves only earlyser0 registered and "Warning: unable to open an
initial console". Going by the code, the base already ends up there for
the reverse order (console=brl,ttyS0 console=ttyS0), and both of these
seem to be fixed in 15/17. So maybe squashing the two is the simplest way
to keep bisect clean.

>+	/*
>+	 * Allow to override normal console with the Braille variant,
>+	 * for example when ttyS0 is preferred via SPCR brl,ttyS0
>+	 * via the command line.
>+	 */
>+	if (brl_options)
>+		braille_update_options(pc, brl_options);

When an existing entry turns into Braille here, it keeps pc->options from
whoever added it first, and braille_register_console() only falls back to
"57600o8" when those are NULL. So the serial options given with the Braille
request are dropped and the result depends on the order. The cflag of
braille_co ends up as:

     console=ttyS1,115200 console=brl,ttyS1,57600  -> B115200
     console=brl,ttyS1,57600 console=ttyS1,115200  -> B57600

Should the options from the Braille request win when the entry switches
over here? Or would you rather leave that for the separate series about
overriding options?

Also, SPCR never adds a "ttyS" entry, it uses "uart", "pl011" and friends.
For "uart", univ8250_console_match() succeeds when
try_enable_braille_console() tries it, so that one ends up as a normal
console anyway. Maybe use a second console= on the command line as the
example. There's also an "and" missing before "brl,ttyS0".

A few changelog typos while you're there: "stored only it is a new entry"
-> "only when it is", "preferred_console[]" -> "preferred_consoles[]" and
".brl->options" -> ".brl_options".

Once those are fixed, please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>

Chris
