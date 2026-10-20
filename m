Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460290;
	b=zcm8u1mcXVeZK1M5vdDGTqkLKXuIg3gaaB5J4EOW3bGUAMeaRWCmZiRuI2CfZlirwUZ0
	 ZCE7kg/98n6MplTt7c8IBpGZwOhEJVzIbKuffCMxcXxwZJka20ZVZq0igI31ydPoC1qyd
	 gEXz7pINs6yXsTM5r4y84IDdXOqzvEHoCTWssddCjH/HSjNpOJw/q2U56bmq8Z7XCFMfS
	 Y3JTznPkM3WozkbhW/c5hRTW7Q0fB3+jLF/rfeDe/ZMDSH987/mK83L19rzb8adcpgG/T
	 rOD+uUMyT1bA4jYDU0q7z02uAeDnlghJsOqLo6oJ2Ks59qHJuSR3IiMlGhPTpBTdP7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8Vg2HGC9f0RLK6KKMp0Lu8393a2H674YghRuAU4vlpU=;
	b=mBIaNhonov2CTDJS7am0RcOcG6a1w7TeN7AoTlza51wv/jP+wmAYC57iW2rRPO4Uqcei
	 +ypm4sweHRmdc9dUzLj2STwzfHIHHRRN0/3NnPgpYZTt8BUTUzfJ+Ra7sj4QH2/XWlDcf
	 SWaXvbp6eCSRfpc48w7xA0FMInglERsej9nQgOpOOQNnFuZYxbsgtHScXl/CB8HsGh5Ma
	 IQHLEAd5Zn2BEXqNb0qQDtDXqOyWA8OH/J0Ydr9yi3txEquAMJWWzDSzTcOA7Xz0B9l/N
	 QwlNYzmS4QoGKnqO+Yvet3W+AhhjlGASWW2Gjz5LLmCeDHKF7J1s8tD/coFWpMf/4iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P8ClSeiq;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B990E606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B990E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P8ClSeiq
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15354aa70e8so3037716c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460289; x=1793065089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Vg2HGC9f0RLK6KKMp0Lu8393a2H674YghRuAU4vlpU=;
        b=P8ClSeiq8iS2sLn5peXIWUrqLR8crS2ZbRIPFQ5r3UJoEOAy3kjbeUGU26ax0TW2vq
         M/VWc0S7TLRXwewbaBB0KXRODfGmMO4tM4luke2JHR2duix4LJ77dgPVxn/Fqq+WGYu4
         i2YLNUi/tFcRHmZtyqtwLpHEcMqeOyGD6igSrZ1Tki41ViKJ2IpD6nKi30soM30Co+vc
         3tZ48V/eBWE//1mWWvEH20OsbxLQ93KVy5A3pfmEWQaqv2RcbICpMieGwdqcsaIShX+2
         X39+mSi7/W0HTIMuO9ZGpGWzpFboaZzULMxmZp1zJAf0Fc6flUVOcpBqZHePvRvLvaFS
         +Gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460289; x=1793065089;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Vg2HGC9f0RLK6KKMp0Lu8393a2H674YghRuAU4vlpU=;
        b=WcIdJufYyDKKG70hFlrQ2JVwsYr+iL/gTJvsrGFbdzJXdNPDKnwz7Wsnqnd3lvkgSr
         SaaTx7cc0D77rzrzHf+IDySU/nxlWbABs1w0q+6Z7gTM0a18MKZhYrcr1lK1B2j6KiaF
         gIkjQlwo/xbkfyzgfT2dCzBkD5xAh1maIASAbgSppUOlRQZ8iSbO5DxHoNSnBN4aM31e
         IqCsL0NDKMLNdWe8IyN+bzzwY531fE5z0uIlpg2Bh6oJST6vDdUNh5B5WvB4O+vCqlJm
         VOTTpRnOUJ6PYEcp0olIXV4eZkD7buxw47uAoQtrfBJCjeo0D/g0+XD6kXCPxG+m9YM/
         XvTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpr3DFfoNszOZmjRFlhirV85q7w3hNcSWCY3oz8mbIMQU7Qv9WD2NFYAUDVhbJ01czqEP7KzHM2/01/xg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9A0Z1BB4caVk6izq41CkZlmZ/Qu2CjyI23it729b1Fnq5GLXE
	qb0QVgYlqxOy4tsEpZP2zj84bj40/218Qzf9Bim1JR+lQdSmqAxTzByi
X-Gm-Gg: AYBFou1YtsAXrAgrEKUBoStN8GyAtUk/NMZdTP7KZAtOsT1xP3TMTI3F0YuDnDno39C
	z30l3rEhEBpmGk5W5BCHeQQW/bRbQWvyPVlvKnDNezOHhk678f67HxTydM3y4oSQUQYIRK40pEZ
	/dyEIDDfhat7/nUP1dTI+3aDK4+owOpy7JTNF4vUOqqSS4KIYtjy3i+UFxzkVGcc6qLKu31ciDE
	x4zGiDnQcxdk5kXztpIKHUEs8ALjLePijdJXKlvYPx9ABpDZsDkjxQOqSwsOBgh8L//kXwFou56
	DUhgowzAI2EqegY+klaLPOg8Gg7R4xtDs7v41G3Op5LdEFfE1rySY2OS4+Ii5IavcHRSNEdGn5x
	6Td0frfS5CXmyfG5k73ED0ODAvXvwg3Z4kAwoVoyBqlTmT1l7omQDXNhlJr1wPHQQ3Wx9U5GCGf
	amhV+rbPD65z7ZpD3GJlhPapH4BoSJhepRUzF/8DEb2m5xYYxw/dDrr42EtdUb5E0FDCgaJl78B
	UYfXOcPmuma
X-Received: by 2002:a05:701b:418a:20b0:187:eb7f:bb4 with SMTP id a92af1059eb24-187eb7f0d0amr9277157c88.46.1792460288841;
        Mon, 19 Oct 2026 18:38:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37629861c88.0.2026.10.19.18.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:38:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:38:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>,
	Robert Marko <robert.marko@sartura.hr>,
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, manuel.lauss@gmail.com
Subject: Re: [PATCH 1/5] watchdog: gpio: Allow devices described by software
 nodes
Message-ID: <74cb726a-b36c-437f-988f-c4f3bfa0a7b4@roeck-us.net>
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
 <20261016221617.2223004-2-f.fainelli@gmail.com>
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
In-Reply-To: <20261016221617.2223004-2-f.fainelli@gmail.com>

On Fri, Oct 16, 2026 at 03:16:13PM -0700, Florian Fainelli wrote:
> The driver reads its configuration through device properties and obtains
> its GPIO with the descriptor API. Neither operation requires ACPI or OF,
> so allow the driver to be selected on platforms using software nodes.
> 
> Add a platform module alias so a non-OF platform device can also load the
> driver when it is built as a module.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied.

Thanks,
Guenter
