Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833858;
	b=qiAN5cyR/O3U9vr84Ldmsq50yBa0BUOL1TtxDHjk5Vq23vNli+YmfXNYNVpIDpBAonWN
	 QnRSxCA8ArxBvHbburPvSFoVkOcWgkLIi56XRTMSP1iL1j0/F4A4luWX3HuwmWdQE5qqP
	 5ydhj/Tt87gRkqQWIk76I3J4d2Clw5EICkzyEGX3NlmfUG1TnlG8lJsGHahyf/h9aW/ne
	 nFkqNFcb5O4N3GmfvWNdszVqTylcWRTUgOMxg1M4nZiRDzDG88IFHR+t9MPZ+b/oUAkIz
	 nO4+JCNPDpnH9fY3k/6737e4KY6GC+0Fk2sQ2wR+0mFtq5njYnIWcIldBLsNgmlOxhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=L2ngttll2ZfRB1yOGTWYBs11RUTV7CaPsssPY7ZPsJ0=;
	b=Q2S+KFuNxPe9SC+lMARpj81tucMgc+QKGvv0ULhynWBeUxyDq1DR0cWMH91PK87AF/mb
	 mERFjTE5a5sI3kcO8e3Uw/hR97oFEhoXqoLyL3q5YI5WcCyzRStH0K3Ye4AEb+vRteW3F
	 BH4bWpr+agUnZZxfM8VTOJbbTqgvZNCpzob2ZJR94Ak3uBlaUYFPbpuq6E6e+hS6Le+Ah
	 w8oU3MOQfzyDjC+L7ZCE5vV/m23f+PWCajImTGpinmdBF9bVWk990jV622oHbv57Phese
	 oM4EPbRSM+/6Go3EbaJUi/jeSTnmyv2V1oVSxepR7RP9m/GmrXSYi21Hna4H9YZ/Xlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VPeUnHJl;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D31606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D31606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VPeUnHJl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso9823885e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833856; x=1794438656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L2ngttll2ZfRB1yOGTWYBs11RUTV7CaPsssPY7ZPsJ0=;
        b=VPeUnHJlodJgGXyskeDaB33g6nEXrva2NNxzBrVb74wXzoWpbrsh0hEGsT/kwrqejQ
         6eHU/VuQiSGjbyOWeTqPwzONyTJ0PKY2osaawEYceMnGwIXR70+pCXzfPabUFyjSs+2r
         taK6DmEZBKjtMrerLreARwg8HcsX59JZmGTTM6R5EePr4ox2rY7biFcbtx7LMjroKt4+
         UDjPoPT1ISvSajE++5bQKm8/nkehBoLNUx/CCCpPxbQUs/TXC9w3gWgI34LAS1VG0W2T
         gtvdv/L6Puy8FinqAZkRFGCBW1axWjoHSt8WVhQfBTQ9AJwYhaccoXeMiKj2mhVBmnhe
         9HUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833856; x=1794438656;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2ngttll2ZfRB1yOGTWYBs11RUTV7CaPsssPY7ZPsJ0=;
        b=JcqPt92sNyl86QQDkwkY5dN3tPV/LWUynUx1NB305PQD8/VGr7wViMO3P7Mup+539l
         SkhQF2qJCQmV/I7s07Fgeb0/xFk6XhIHj4W5DvH+pfCJShCaeSteCwvT75Dd1DzCOnVV
         Db5bq3T4bWB7vmmic/ChoCn32MGsasJ9OilWKAY9sr5LaLiDl3ANIDJjNbraC4BZpafc
         mPj9BIGkCYfWTzIYsSQ47atyzqDowU7Ula+zPNuBHmK9kOULJPzNOm89nZDWUd0kN3iH
         aBOl43MihOR5KJ4fZQqQ0fczi6CqxhAXZwEr+9wYxhfB5oTm+/L0y577ncRQ5FsJVym3
         ySEg==
X-Forwarded-Encrypted: i=1; AKwUvBzpDOCpWuVzxHhpDdP8hDX/n6YbWTkd2YLdzdnwVR55d0fOWg7gYKB0Gqg2DcwavVF9MsnejiKGNVi/L6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w3N9Ryq1c89U9zWCmCnSRCVR7oQYR8XEW2yLUCYtQ2ThLTUkO
	pgWE7SNlNiBhpoSlGTu6L4mKYNFQm14wPewJROD5nDKeCQzGC0lgyDMK
X-Gm-Gg: AYBFou3dXzobw2fQbdWrqr1lN2eDv4jeKbhUymGQJbERgOt/DkrW/oEAJHCNWVA36TL
	jjQg+DRPIwzLld9iKwrF2Oy3y9w+/N6JuE+sqP3pB83bK94vE7CcDqclC+Rt7sAq21rOV6UDurb
	kMDAzwJC40bOMzrgIsFbtDfCiZ1htO1hvj9Rz3GcBG1vLV8OTWjkwEKoNZYMwsDxikkm9AzCk+t
	CuNpytIqRJS+D6VOnAk67MApXWLk5lE599sa0Gz8wVPKjEC2psz1VL1g5Kgxop+UGpt4qWIcqV2
	aJsBjLLre/gQPfo5rxsQVVKuMZZbz015uaKOdgWyVquqb0xMdFNW7n9HWAofjuq5p9nn9z33EB4
	SxnKH4g7pS2T8WtC1PTvP+8ZyYO0YM2pjMy0FhSr9BgBg9tMq6xB2DUQ8XiZXJQBmCCyX5KNMYD
	fkcv86lPlBVWqu7ha+nFlrc6WpzyesfUEHODP8TyMjyky6jNFpMVBIicqsv6kzAl80a+vAcmo9r
	uIhPIOaju9w8ovDLIwwsqucQUpuy6JXUdUQN4EHYq2jj+T+u2pV3hZjcf2a5Lkp6orkq0O7n134
	GnN8ESXlKBv5N0K3usZa2vSoHHVudSG+lIMylY3bobd0kB/xkF1Z510qHivZ7kIP
X-Received: by 2002:a05:600c:524c:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4ac17470f97mr396694935e9.10.1793833856460;
        Wed, 04 Nov 2026 15:10:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8748sm6355951f8f.16.2026.11.04.15.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 15:10:56 -0800 (PST)
Date: Wed, 4 Nov 2026 23:10:55 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Brian Masney <masneyb@kernel.org>
Cc: Carlo Caione <ccaione@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Brian Norris <computersforpeace@gmail.com>,
 Brian Norris <briannorris@chromium.org>, Sebastian Reichel
 <sebastian.reichel@collabora.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/2] clk: divider: Fix the divisor for rates above 4.29
 GHz
Message-ID: <20261104231055.5b566adb@pumpkin>
In-Reply-To: <179382912410.620422.14715602424648962218.b4-review@b4>
References: <20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com>
	<20261102-upstream-clk-divider-large-rates-v1-1-eb17035bfad2@baylibre.com>
	<179382912410.620422.14715602424648962218.b4-review@b4>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 04 Nov 2026 16:52:04 -0500
Brian Masney <masneyb@kernel.org> wrote:

> > DIV_ROUND_UP_ULL() takes a 32-bit divisor, so on 64-bit platforms a
> > requested rate above 4.29 GHz is truncated. A divider fed by a 5.94 GHz
> > PLL then computes a divisor of 7, not 1, for 5.94 GHz.
> > 
> > Use DIV64_U64_ROUND_UP(), which takes a 64-bit divisor.
> > 
> > Fixes: 9556f9dad8f5 ("clk: divider: handle integer overflow when dividing large clock rates")
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Carlo Caione <ccaione@baylibre.com>  
> 
> Reviewed-by: Brian Masney <masneyb@kernel.org>
> 
> Since this is a core change to the framework, I'd also like to see what
> Jerome thinks before we merge this.

I've wondered about whether using 'unsigned long' for clock frequencies
was ever right.
Clearly the type should be the same size for 32 bit and 64 bit, and I'm
pretty sure the choice of long predates 64bit (I guess someone was worried
'int' might only be 16 bits?).

But if frequencies can be over 4GHz (which no one would have imagined a few
years back) they can be that high on 32 bit systems as well as 64bit ones.
So there is a big 'bag of worms' being opened.

Changing the type to 64 bits is hard to check (unless you manage to build
a kernel with the value embedded in a structure using accessor functions)
and will be a lot of bloat for most uses on 32 bit.
Alternatively you enforce a different api for clocks that might exceed 4GHz.

David

> 
> Brian
> 

