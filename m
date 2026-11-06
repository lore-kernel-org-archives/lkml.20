Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988034;
	b=qj0vhDQuXSab+VTnB9SCjjLJ5+w2E0Xxai9+RmaAUXZeU0WjZ+6E4CkJAMK2x0vRZZue
	 efiQYOp+cX2awpl1tZm5g2JwnRqLFQkTD1AjM0NaEqeiNElcqPyAq2IULcCDYKv6HUX68
	 CrHUHXp0+wQeUiudzk9WmYLrxw1lASnfWqlXltwdol5hJ7sKbQNmb2mB1ClQmWzrBKb7q
	 qYKn23YJLarO1rZxhjyWSzWQ5gfkT7cmFICPzs9pFUPyUvi4uwBgc9e72Z0D3uo7INFEY
	 kdR/gYCDJ0hGRa40ZxwAqOM5ajE8m92f5ie61PeLLisgBKqcuhjscBXnozyIB8Z8fzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NWh3cyZ5yf7zg/LkQ3FygSjfNpeZJYxZtQPW750sMhI=;
	b=oakvlc4n3pGZyDDIG4nS/2J5gX/GirF3tfYMKGuetnfwafPA+hiMOEAJeOKPZjP+bLwY
	 6NI+Nt0lrLbNLsY8EyuJO7ffaCH0wPKAWNUPVXIB0RHspuNF8oJA25gprzHV8+uPJ0fPk
	 BoClLLf9LovpfRKzyjKtkSJT2p6d45SLkXZ01ALQFfVfOGwpzXBU+NPJbhLytjjcum7KV
	 dtHfXRAVXDbLuzvaXR8zChoBPjocD3T9ji+1G+dUVc+X5Y7UVnwc88Krd61rNn9NgdMmt
	 9S4p0/G5UfOpBk3FK+1JQaX4bf7rppu4huYDiCOOz17AvqQsCQ0cH1dHLlntK00y/OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cbJP84q/";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11729606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11729606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cbJP84q/
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso8095105e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793988032; x=1794592832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NWh3cyZ5yf7zg/LkQ3FygSjfNpeZJYxZtQPW750sMhI=;
        b=cbJP84q/pNYWXBEDIQ8ioR33tDQoZDaiQg1DGJfeSRZkuEeWOvCuiT4QpwcAezuii4
         NnFwUW1Cq+tSGGfl5zy0Iq6SDvpxgrOGhRbY/5XxGTEX75Cby8Ms3Nf8MGEnvC0Wkzbs
         RdO5i04pnw7yGUPycp7BfDbjXP77ff2yz7iqKD6DW8m36ZITRENWc1OEP/r9RlX+q3uH
         3y/SGnrZ6Mbk/yDj57+dHn3kFkToOZ0YEw7M3jNW28rI/t7xhcp/6P/al9tAY7+eQKrZ
         ZR7CzcthPjGTBibs5nMtnEo6E0O7diq93UrvdZcg+T8YVlIZnpfDvyGzBEOlcW6TtToS
         E/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988032; x=1794592832;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWh3cyZ5yf7zg/LkQ3FygSjfNpeZJYxZtQPW750sMhI=;
        b=rB06Tgg3UbP9TfmUsdkOJpU68yEHUHmKEY/lGDvlTQVJF/pLUsNbib+mW0GUgkzRsy
         glJgz7DwHn+1STLtoUCyy68tayTZX2zvhoKmQDpbUlc/QV5CXQRFxqUfTxgXg16iXx0t
         CeHHhn/B9h4+pMcNkd6GoGbSVHN5ok8k7sRezKGmSRITb/iYitH0N4m0gcd1cTq2ZaX0
         Mpfm7sUHuS51G7roJqfsTXFGSp0NoEMkEuSG82JWA5MAIrTCiiz/oBvkkz6rOJM0XlZt
         1OiMfneAaYLM+XymVxLbvjDMQ01czQaZj1+cV4U1PHTjkR52DwFn4ol7X8wrWBoUNjvX
         otEw==
X-Forwarded-Encrypted: i=1; AKwUvBxHe7FXW9P55TaTRGBf1vLt/vW/4yV1VAiTGdxLKdHNLqehEpsRzOVxRgw+2+f4TzkwXWCT5+v6UdT7/PI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2kQezYRcZuI/kS7OIOKbwUmanNGb5ayP0m7RepGc6vSVYxvMF
	EAIsE17WUNb4PkW+faGcoO+An9pIqfVsN0oxhSUYBD0orz4zMMsyUEb0
X-Gm-Gg: AYBFou1B8AHK7qOvEueyo2ZBT53NmtS5lcvDzRpHtbQ6DL3u2dFmB2IQDjMcg6klZWR
	pj9Bl4/NzEPCUXiE4psv4hHV7CzuXl5/pWOyIZlb+z46RRsL87qTkYvK+fvb/8aMuyLn+fI4Hwn
	QundfYhW6F5XGQRzXWVP6NsM6+znZypADxP7OqystNt/5UE4AwFdw9ZLdzncW3wIz4i0Si6shWK
	an9HBWEcbYannPw4HbbrBj1onQOpSvnVIYhVEmAbOEgI6NXe684aukhfsQahZZsL4iG3cEON5vz
	oQjQHtGkk2slA8CnAmDku0L/PHYxeH3c7ICKEsew/w+yLBG7WT2tTnh4m+/3rPOW36C++9xsxXl
	OlDT2VKgoOxYjBxhEO9LqlxTY4jA5bUvA76MB7lDPsVW5hw+FNI45/CkbGoDcx8SXV5UP+bprlK
	Nq/0fuCuhIb/TOxa8aOY7Fng11htbpTFb3Mm0XfAJDv7iCwkqUDgFLmg1jwqS7sXCLN7nO7hC8r
	g+E0P7AcV+1vtA7PeeyRoPZwOXH7MGeMrdTsDZ4YcE2teOz61tiB/vvg5jmsvB6lDP0I7JJ4Spf
	VFoLRxotjpnRTxMxdLdEubId8sMyLh2CpyuweEfTRkkkUKX5Kapt3rg3S+S3qrwPjQ==
X-Received: by 2002:a05:600d:82e1:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4b6e0cf4464mr63502005e9.34.1793988032173;
        Fri, 06 Nov 2026 10:00:32 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795038782sm2465185e9.3.2026.11.06.10.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:00:31 -0800 (PST)
Date: Fri, 6 Nov 2026 18:00:29 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Brian Masney <masneyb@kernel.org>, Carlo Caione <ccaione@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Brian Norris
 <computersforpeace@gmail.com>, Brian Norris <briannorris@chromium.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Boyd
 <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/2] clk: divider: Fix the divisor for rates above 4.29
 GHz
Message-ID: <20261106180029.05452269@pumpkin>
In-Reply-To: <179398031041.2573818.13317727784501684521.b4-reply@b4>
References: <20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com>
	<20261102-upstream-clk-divider-large-rates-v1-1-eb17035bfad2@baylibre.com>
	<179382912410.620422.14715602424648962218.b4-review@b4>
	<179398031041.2573818.13317727784501684521.b4-reply@b4>
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

On Fri, 06 Nov 2026 16:51:50 +0100
Jerome Brunet <jbrunet@baylibre.com> wrote:

> On 2026-11-04 16:52:04-05:00, Brian Masney wrote:
> > > DIV_ROUND_UP_ULL() takes a 32-bit divisor, so on 64-bit platforms a
> > > requested rate above 4.29 GHz is truncated. A divider fed by a 5.94 GHz
> > > PLL then computes a divisor of 7, not 1, for 5.94 GHz.
> > > 
> > > Use DIV64_U64_ROUND_UP(), which takes a 64-bit divisor.
> > > 
> > > Fixes: 9556f9dad8f5 ("clk: divider: handle integer overflow when dividing large clock rates")
> > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > Signed-off-by: Carlo Caione <ccaione@baylibre.com>  
> > 
> > Reviewed-by: Brian Masney <masneyb@kernel.org>
> > 
> > Since this is a core change to the framework, I'd also like to see what
> > Jerome thinks before we merge this.  
> 
> I've had not problem with the change initially but then the AI told me that
> it brings back the overflow problem fixed by 9556f9dad8f5.
> 
> At first I thought it was crazy because it would mean parent_rate + rate is
> more than 18 billion GHz ... BUT, a common way to ask for the maximum rate a
> clock supports is clk_round_rate(clk, ULONG_MAX). This could trigger the overflow
> and there are instance of this in the kernel right now.
> 
> A way to make the calculation without the overflow could be:
> parent_rate / rate + (parent_rate % rate ? 1 : 0)
> 

You just want:
	parent_rate ? (parent_rate - 1) / rate + 1 : 0
it is even likely here that you can assume parent_rate in non-zero.

David

