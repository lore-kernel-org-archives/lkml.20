Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840079;
	b=G1J+wyW/XOIE2QLW5YqNR28kIHQ6YZdkbIpLW2Kcy3wS8AwUCnbHBYvc8ut57VunHgdX
	 xBc0ALjs5N44LdzwYfzo3TehdVNR9XEzWdE5/G90UGnCOMNUMHlvxJ3nrT9XPH71eamzX
	 82Qt2lhZJ9mZYze1kdr552kHlrktxds8uXb5RSErLr1LWxMdMjaIBryUwmz/RFRht8H6t
	 gG9roJnz/bF0KQ0mJBDp8n8v+h7awpMh1e3GBjIDeXy4p14AGwQshv6nR8Wd4IyJdg33R
	 67hA/YI+26H7GMKmyTZgduSw8A0rh6B0PBY8P0NfKJMlj3j+w6VdGuufJIJyM5bWEXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840079;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=rQ+p97tJCO0QpCOaOSbeRKfH3OuUlnjbT3rJGvag/9I=;
	b=VuV4g95UbxmzpvwwlMg9mFSkKCNWa8LkP9f3etUl3SM8pps6Ryns4TAJLLw2TQEvl8rQ
	 vqTmJO1hxe4d6TEwL1S8Hyg7h6lw2+r2mSufhk3BAa8RYpnXRNZUN4gUTUn2VoNGlbeA1
	 a+97VRnorIkHnnKzKOxxe7QCgKK02pe8nRbiRb+U3TAP557+q3PBYZ1lY6fIEIT0lHIuz
	 BLeGcY5DlQbjUVC/ue6Wt4NuwAaxuxgyS+kftHymMCulLamHzF9o+DSAkLIGtWGKwbDVR
	 ab03lf1HEulC0cWBvZBGPvGt6RdUgUisUBvze3bKORl/R7utUKzkEmCTU++WDHg4LIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F32606A336
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1F32606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso591016a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:54:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793840078; x=1794444878;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rQ+p97tJCO0QpCOaOSbeRKfH3OuUlnjbT3rJGvag/9I=;
        b=wXZD1lkvxOjWTpRHAIvTS1r9tMcfIYXm1IC9zT11WmrUgG3uz0TCLR+UbVvGz/Xp14
         rm/U73zbqgWzmQ4NNzmG6V3w8YA5p2LYQLiMbPbXxAdtu2kqrFLegtMohp8oFVrcCTwF
         DhQ0Gu3JGOS3pQ7K5fZThI88/4+ue/vV9wBM5hebMW8ofq30rPGfXe5TWTbtT3ZR9Lxn
         n2KLozqQWJJ5uxePkTTNCooftdc361mE9MmZ/BldnzFSH5E8cCYPdDHilEPk+vxR9KqR
         AXQ+RluZdCI6asNZ8aIHudMR809pA0NZmU4mBc+3h8vM3BelX7bF+R+6d5xvL2X0EKm3
         6AVA==
X-Forwarded-Encrypted: i=1; AKwUvByElzAtnf8JhyCloSHoEZ17Piet/96XV5nJH4jp1TOVTkgS+zzjJo0/C1RVHvhtAQipzXvHF8Xav3ZsKtg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QFdbdpKBZ04VOWAyBEZLij8kEic3yyk41UZObqOxDBGEwvDqi
	Hk8S6U5gfnpBwvdqZvzDc9WNWxyGXGvewrdUEeWbuGn4up/gioPknnNDj1RAW6zF
X-Gm-Gg: AYBFou2D/hKqX1PdEKglt27YtZbrG4A98lLJEnFhzLhLBVjZBe1HacimBQpxOxK3SWC
	8tVtfmKUBLY3X+G0GzRNQjYJwWYG4/1hFxRF4/sRrIxnvrWroeWyJ7fPEUn0o+S7+7stI/dNtGf
	XAKu3N0QrwqbMAv4toVLF0M/bXT/niGy+Mq3/8YMHguYvysIO753rXmYBIadOwXd9xR+EiU1MsC
	FaCXlmXndL2OMLUHBiSUDQ+3DyZNGQFdk7ktvAdMxgrFxjoRlquTWVMYD4+AbvoNQpssFW1Y4WJ
	pHNc3KLiu4bydt00RTq8mE6Do0Du0ko1nIYYQG4izb11PtNno/y3Yz2S6agq0hzZ7odFoijWyxv
	HIHbQ/5F3mSqTfwU98yiI64S52MMOZT1LF58goQ70CGqjtU+x+lAdZti+JNlgED4C87S4vUHZvb
	WLhif4q3w1uCb1fjO+BLqaO8caGLrgi7PBqZRgklwB/+0Zi+fCt2pjqNA+02tR0lPOIov/tRZFr
	OLCTVglRJ8Vz2dSK6iRQSOLZaSd3Id14CYu4xKIi7uyNz1n5nTsBq/6lWN/k/lS0ydeAfQbt1qx
	zg7zvI/qYWcpD7L1Hgc6p2IdSc7paBIey1dLGFyWGLPbhPfWPGINOaOfZ1uGNx4ggFmYs8KofrX
	g2RBPKP3wOMyaxnXnMlNHnZo5GyozEu3ze+MIkV5qGWc=
X-Received: by 2002:a17:90b:44:b0:3a4:acde:1e3b with SMTP id 98e67ed59e1d1-3ae896f8546mr15518178a91.13.1793840078178;
        Wed, 04 Nov 2026 16:54:38 -0800 (PST)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com. [74.125.82.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3160634sm1107301a91.6.2026.11.04.16.54.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:54:37 -0800 (PST)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36cad25b8b0so2002310eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:54:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzv8ag5+nHBUKoDy8gquFB6LHmQpdeWCRS09P0OdPZ+YHVKL9ofe6z3DFLH4k4OfVOGgi3mWcr1x9rncaE=@vger.kernel.org
X-Received: by 2002:a05:7301:6194:10b0:369:f937:9a7a with SMTP id
 5a478bee46e88-36a42437876mr26853707eec.34.1793840077202; Wed, 04 Nov 2026
 16:54:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
 <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev> <20261104-geiger-handler-f6688647819c@spud>
In-Reply-To: <20261104-geiger-handler-f6688647819c@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 19:54:25 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5pBrypa1PKaKRPxb9uvaJBor+FzUXY0+gxLHOUy7W-Ow@mail.gmail.com>
X-Gm-Features: AclHuK-Z6NSKmUV0ZPuPw18jk94Az1xuvLsjfOJ7Ac2Y0GWV6yFDmJA_PUWlBBE
Message-ID: <CAPY4CJ5pBrypa1PKaKRPxb9uvaJBor+FzUXY0+gxLHOUy7W-Ow@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller driver
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Can you just use pinctrl_generic_pins_function_dt_node_to_map here and
> dynamically create the groups at runtime (and also make use of the
> generic get_groups_* implementations)?

Yes, I'll switch to them in v2. One consequence first: the helper reads
"pins" as pin numbers, so the binding's pins would change from names
like "UART_TX" to numbers, as in microchip,mpfs-pinctrl-mssio. The
function names stay as they are. Is that change fine with you?
