Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.79
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794522053;
	b=0IFF6ftL60eA5POuwkVpEETLUbeqv5LoNuqcXIBoWQL5Ai9a6YDJKgnPSNNptk36p9Sz
	 p6eWO91ctK5Ai/Im8mOyMIg/CXZcKbKydoLttPwmBM5zMomKXwwDTGFX+cuXqc5SiXARR
	 QvBbOQejy+Rl7B+9WBuwyVM77ZEu0fFw8IRMCCrY167AaHwQOqQh6lVw52SjJOWqAD9oB
	 9UD3wfr7y5+VTTNreyECubpwi8c8g1ZBlhMJX+FGKG6bEBQnv8ZszZ5uWoNrKpsLOCdRf
	 dV4s8x4JhRqY2IFvmYU7KjabATV+8GVZB8cb4ceOMMA2Kzg06wFpQNjvgfFJmUFARTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522053;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=mpprA3S6uBrKI3A+k9JU2N0Xl8rjjtK+Cdj2X3TXyhE=;
	b=IYdHl6yAQCsSA8kXIvcfvPnSRoysypi+RvHg8/aW8FmXSrQcoQSxej8kva04fxtnpPTg
	 nE+pf629Kr19R2tRKnK03kCBfX57Z9P36pbOTsckue5PmK79unoOa+AR32D8jpWdBZ8nn
	 PuQhQADqa8PXLBU/bjxjI9jID3cyi6bD7BQf+3LtAYtEyCdsD4mMA0QNZ7CC17DycFw3S
	 MnvD9jtR2hqdbFNyPY/lxDWy51Ac8KeqwM+2dJrK4Slz+pyJv3OKwceLd9FhsDZwmCZm8
	 wOZ/B+09B//WfQNOju0+8+eDe9ijqbsrRLQp3lX6ZGENZn9eX+aZrPI/73HZyF0h5gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=QeO99b8b;
	arc=none smtp.remote-ip=95.215.58.79
Received: from mta1.migadu.com (out-79.mta1.migadu.com [95.215.58.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42579606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42579606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=QeO99b8b
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mpprA3S6uBrKI3A+k9JU2N0Xl8rjjtK+Cdj2X3TXyhE=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794522050; v=1; x=1795126850;
 b=QeO99b8bWnpn9F/8Ggk1UN9xt2m9As0J47VNdgcbao4xp16Eyts6kC9M1yMv04KM1IrVOeEB
 eCYEX9jzTzB2fi78WnPjavX2DL+llX+FTgC4sAnUFCMhZP4NE+NVkDrqR0GTJKwN1m1cMLwnN92
 zWGY9UauX0w2IgdGhaQ8rz7E3kOLHgwBU64ymTZBhEws6+LnW6vflt3UghMOrdj5XTV2ifsMbK5
 q2Gzr5r4FRiItMgi7RWB3BSt3YbKFAyXHiAO/vX5r7SKdVb4SqV1g5ISaP25Yax2/hHkEAEB8hS
 cFkocfTdidxrOT7r3lt4mhthQt4zpQwDJpXXJARzs5egA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 20d835dec25aa392;
	Thu, 12 Nov 2026 22:20:31 +0000
X-Mizu-Trace-ID: 20d835dec25aa392
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 22:20:29 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <4d30540910d8af03de850769e326906550b15574@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v5 2/3] leds: aw2013: Add AW2027 support
To: "David Heidelberg" <david@ixit.cz>, "Lee Jones" <lee@kernel.org>, "Pavel
 Machek" <pavel@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Nikita Travkin" <nikitos.tr@gmail.com>, "Alexey Min"
 <alexeymin@minlexx.ru>, "Griffin Kroah-Hartman" <griffin@kroah.com>
Cc: "Nikita Travkin" <nikita@trvn.ru>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <11724004-3e85-4f7f-a683-5ff511863bc6@ixit.cz>
References: <20261112-aw2013-aw20xx-rename-v5-0-b2c5e323a90a@postmarketos.org>
 <20261112-aw2013-aw20xx-rename-v5-2-b2c5e323a90a@postmarketos.org>
 <11724004-3e85-4f7f-a683-5ff511863bc6@ixit.cz>

November 12, 2026 at 10:10 PM, "David Heidelberg" <david@ixit.cz mailto:d=
avid@ixit.cz?to=3D%22David%20Heidelberg%22%20%3Cdavid%40ixit.cz%3E > wrot=
e:

> instead of comment (which should be formatted such as /* */), I assume =
you could use #define here?

I could, but then for completeness I would want to spell out all the aw20=
13 current levels, which might be too noisy. Or calculate it, which would=
 be hard to read. I think comment is the best for now.
