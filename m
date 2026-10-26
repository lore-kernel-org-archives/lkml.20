Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793043192;
	b=aUM6u0LlFB2ad7NkPiRfxN6qhcn5PWrP+KeHLRmRTvIhXaoLIwiXBr5tWBp0WFmHLGn2
	 LmKdNIQJUf8VOE9u85Jp2cLWJqDL6jkrV3tpFYgtV7fU6vO7hvzyn/Mw5tbVkBKzZvJEL
	 WOhxFKfa2BQ5R7dI6PKSlkCB+xjpvN2ptvOLNJT3tqW5J2Fx9wp1cHNkxiJiiv9yYtIUW
	 pUxcHo1QH/D/2kOSuYbgufgMaSv+H7aRPXg2BQZ6+Uu+WlXjLWtXzvaUqq4eGiv4WSR5j
	 x9gEIA+RCGk8Y5qpe6+zFm0Vkd/OqsbXUcVwM0NFQomzU8J7qWWK/P1F2mdI9D1m3Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793043192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=04JLIlecZFZkeu2diGMCwDrGIV8T9H33DS8yBLkYP4w=;
	b=hERb7vvcpOE8WKfLhCZ5jlxq5FyGsY0UCv/2z1z90Ozz+FlPJMDNM5rKFVd9WaobdxfU
	 WTEIeUJwghAEkP/4vd5BLplBPtZGt5LdUBZeFhxrP8CXklEM++iNdv0m25hlcDGu0qijJ
	 7jyOR8TerJ1m9idjxqfOZUOEvS1DydrB9zxPmkmhHc8NM5PehaVU0YAd4JZd4rnzQYyG9
	 4cPuo2zAORvo0Zbh+ayWV+psc/r7lLxQmRFKCvOfIvg9446P+gP6+bxwfD3tTpWaykDRZ
	 XAO9q7sPMyntQ11JZPvnZt0muQyBYmdgeNnMui1FIcgbH7CfjzVFtyBmq1uA5U1PTTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CV+nkpCa;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E48606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50E48606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CV+nkpCa
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-18cdcfc05ffso4099927c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793043191; x=1793647991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=04JLIlecZFZkeu2diGMCwDrGIV8T9H33DS8yBLkYP4w=;
        b=CV+nkpCaoa3VPlrnwXwJHelWuW5pwnNvRh1HbGC6Ozklfuph7C9LBWlM5HiS+ZtKyh
         vZHRJin5qeQdLQs46Vh/Y7y8XmyfFt1wIuGMLmycNpuRTRjHHRwUjKhKlItG7E1HruNN
         9EpECQHxqgiQqJXQ3Ef793CnUMUwP4vZd9VbpU/YfWweXdsH0gPK2nY2mqiGnjLz2Ltd
         ioV3iTLw/G1Xt3jwniteZ1Qx+TIfR9Au3qMZZfLF2dhLEuzC/txsO3BAjFyFDbnUAwhe
         BsNTLa6v+dbS9vIH/gYVgKfPOoEolRRVEQ5KR+EmjN4UcMpwUYUfpxbGAm+NxE5oTrlS
         0dgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793043191; x=1793647991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=04JLIlecZFZkeu2diGMCwDrGIV8T9H33DS8yBLkYP4w=;
        b=Gr5C6b07oA4575SBVTRCG/Xbjl4ulUUQ46CjUqRyrRX5A//xn0MW/e3pKQwFRTRav5
         bpY1pJwhS9Ya3Idx1Myt2PRsc6OZ5IN+RgCbR+CZ3V1FyWR+PCziH3kN1Qfr3pW4Zgnc
         7hUqzqfUvLD0e0iWdgIKrn4ZTjrzM3rIjMF3neLCjPVKo0rXuO4uro4TEKJhLge+kgXx
         ixhVEQnAmDyf45Kfcv+voDpOPpmh0qs7XQ4SEMLnee1U6k2A0h4sM36gyQH2EMmexUIr
         KwJPGgSUqtQCjQiPXDY76AykpxhJJPnSk1wMbD8eZjrmSB2AYmnNdQeJk+PzcoEGgPx5
         1EjA==
X-Forwarded-Encrypted: i=1; AKwUvBxz4bDKNXxw0PXJHovw3sH+5/M/Sz0y0ZiknWkmIMHFOybwOeZNFBjzic6R4VadQVX5AFTn0gxPMwPZpp0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzadyj1JlGWcCdB7RXdvX3n1Nw4ty5GflW/p8Q/f99bfz2Sr7A
	+QZkV1lZUC28j6VB4yv8VN9y1e3zoEWjrHuWpv6DILS+ecqMNs6eblfG
X-Gm-Gg: AYBFou1H/yti+SBAgzs2r6wdRc4S+f+ITx2EccHLTIpC1xnev9ZEccrR7e27SSgxGwL
	+8fvgR2YU4778JMw/X5zQcTZemcSZKdGXxCkGcKDkepOBL0A73OgNVpWf7kd9YQOf4fWNEEuarS
	8SriiWETJGB6GQz4NEMR+Td1cKMY9cxXS+dH/MUaR4DfRrZUop8nPkpEWPnIXj6V+QKrN0dxagQ
	PS1GebAuVyIDJ8GAj3w+WBXTDAVTgcfPPb3NHeF6sgThgI3ufb32Yb1JVoqBjhXJTMOvH1LbN7W
	CNqlsML4t/nQQhtOqa15kjYE/H6MVhApqCB/HwZ7Zs8yRRpclch6kh4UDCJBOx5dszjVzRR/V7y
	bbmfpne63iyk1giLwC2th+145X3OZqTG9haDby3WZziCDR2VCY+b55wcF6jFv3fLMOUV1OCaImB
	ug2/kYFofDDMVm/f+tgmPlCo1NF0nlJc9DgtzoRyo6j+eF9zr+vH8ym7CNAxmnTXNjfitRQ5SRG
	LS5ox9s29J7IgjqMziK1BCsOxB8zU+e1ynrDdKY3mWEuIdk5JCnJ2a0HsaAt27SMBUI4A==
X-Received: by 2002:a05:7022:f511:b0:1a0:5c85:d1b3 with SMTP id a92af1059eb24-1a05c85e6damr5681820c88.43.1793043191140;
        Mon, 26 Oct 2026 12:33:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm55689859c88.17.2026.10.26.12.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:33:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 12:33:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Remy Demangeot <remy@demangeot.net>
Cc: Eugene Shalygin <eugene.shalygin@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: (asus-ec-sensors) add EXT_Sensor temperatures
 for MAXIMUS IX EXTREME
Message-ID: <08a1e24a-2cf0-47c7-ac10-c58ef70f0614@roeck-us.net>
References: <20261026-b4-m9e-ext-sensors-v1-0-644d389b2de1@demangeot.net>
 <20261026-b4-m9e-ext-sensors-v1-1-644d389b2de1@demangeot.net>
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
In-Reply-To: <20261026-b4-m9e-ext-sensors-v1-1-644d389b2de1@demangeot.net>

On Mon, Oct 26, 2026 at 09:57:35AM +0100, Remy Demangeot wrote:
> From: Remy Demangeot <remy@demangeot.net>
> 
> The MAXIMUS IX EXTREME supports three additional thermistor inputs,
> EXT_Sensor1-3, located on the optional ASUS fan extension card. The
> EC reports them at bank 0, registers 0x60-0x62, as signed degrees
> Celsius, with -60 when no probe is connected (already handled as a
> blank value).
> 
> Add them to the Intel 200-series family as Extra_1-Extra_3 and enable
> them for the board.
> 
> Readings match HWiNFO 8.54 on the same machine, and moving a probe
> from one header to another moves the reading accordingly.
> 
> Signed-off-by: Remy Demangeot <remy@demangeot.net>

Applied.

Thanks,
Guenter
