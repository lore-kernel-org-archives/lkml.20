Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4526737B407
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154257; cv=none; b=cvVeHEK49vp2MzxeHJ+b7jEw4j2rsTl3PvT35KigCAahWTCKrVeeMTm9kU/1bzS+qGR1l1XdUfJo9pp4BRcolLL0L45lU6SpyieiZN1oHm2mOIyAs+o/X1DghOsPkzQQYs//aFepUkTgvIcGtiEB/SOKX2MspW2igOvotrBSmfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154257; c=relaxed/simple;
	bh=z5AMCbTCJKiKwhdeueVhwArRsGJl7LsXJxyw2+s69h0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhkIIi6Wyk8nZ6URSqWXHQHjeYKs1oORd8NniZB3FFDAQB1hxGoIktDZFzCMUypHnUqucWCRaXEvrL9Bsu5r9KtremLvDqz2vPxLysAdgObuaPrxZ5xiZt+gn1rwvbQRpywhuiXSI/kqsd2EdM1HhXfe+zlY0dA8uKb9Zk0fHyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n5Wd7qUb; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n5Wd7qUb"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1676072a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789154243; x=1789759043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+1FYrSwjWs0il95z3HoNX6WKScSsEKBA0Ab3Jhz+P48=;
        b=n5Wd7qUbXBb52MIPy9zOsuTen8ubkv6bp6Pi48hWIJn8Z1qNhctuUM2Oj7bIG4y8f/
         70N/78FcKN1xKbIA6cWus/VxbyyxnEmrnCmzG0SiVc6Gv1Cs7AEb9akpyFDblB0iiC7F
         sX0LSupbCOzYLnRRYHiq/Rp0sZtsAWDRu2fKObHySRggJ6vlkXS+0S+LDg4FLOXnydx5
         9o+rZX4fAzVGFeJ9vPMV+vmKaBrLlH2+MFeEN4WqJX+yQ4pY1FuKpAWQnZ/UeX3X+WK6
         k5d2wEDI0RyRB5H+wD0XbNA1rD2zp8TqcxRuSMKDkBhULvb9EekiRjwgqe8N02XMuXjP
         6/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154243; x=1789759043;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1FYrSwjWs0il95z3HoNX6WKScSsEKBA0Ab3Jhz+P48=;
        b=G0TkfJ08af2vQ2i1xDEJqpyqjSBlSP9SMCcxi4NHjXQ9XFtBiguY+0AIlZ2bppVo8c
         chmLVUiYW/ipK0mRqTXAh3T6AbYWd67r9+RmOjWDGiIhzCWr/6Z+MeEdx6WvbAlEqICp
         ywBesyQCQLpLB43bKBLrNvD3S7whYFpWmLJGl5/2GlW+EZbBB4meuJtRmfEZA43Xs6wy
         XuHoCeFYq4CobsCxKkNs/Q0V1NF8aXognqk4OGlnrUnU4IQ6UeS5vM/vaHMn4LPttW7t
         o6lBxegxqrpT3/2GMEqIkl+vsaZyC5pN+d3IM78wGIo3Cvfy3Pe+IboSdiWzGv+yorhJ
         HLCg==
X-Forwarded-Encrypted: i=1; AKwUvByhogvwUGmNQ+SctTvXpJigNabD/oNUdmdWBRDMXScpnUYV3jvQJow9A6g2V2Qo5F1lwy5bZjd2wn8QjeE=@vger.kernel.org
X-Gm-Message-State: AFuF++mJhs7nZAGeNoq1LQUi6GI0dB38FU1Pf7JT2RUsM25dPO+K2QRh
	ba34pFnWTLS/VmgPBRhVn37KDXHVVjjbS8d8uau0VPxW9xRmFzMvpu1p
X-Gm-Gg: AYBFou06+wWcv5G0s0tGQs9AplJgntqwP6mvH6AG9uSk3UD6nKvDjPAufiqJPzqBN74
	3u51HT53C0YwUic+C98sllw9FpJcM1hqwobHBXQ5OAi6GewksO38UGFLMzqQ5dJJUkUTU3ZTzSm
	cMKKa2Qj5jdQ/R9tbHIqG/nGck0LA2WCdDKI/tjXbpbgwyOMVuuRDY1lDe9hDNBBvq714j0IvF+
	V3Qdx0hSV0WZqDNZD/1mP+6o+ejc8CiqRUUVpWN3vPvHy5RWwWDB16l5UBbKrTfpAER9/T9Y7To
	vHi8IXUpki/JRnUKilsRCxtvj8V1p4uAT4g2Vg0UdbjLiz8/8C5NGazqqnP0baqRPGnc7CYWeQn
	9paFi4h6m+W+NhgC+4RUQ+g/d2huvjAhxTnKsCy4SYs1GTZDaDIsPBSZYU+XLDAYVsC4R0+2sZm
	U3MWgh1qnVFv+bPU3KFSz7NSbxRqDhCXNbMLo5yIhWcr8tUTCD/eI3on3FT9iHuXBiHBa1s+gWE
	vmLa+XLEbGz7Q==
X-Received: by 2002:a17:90b:1b05:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39d9bd9515amr8974372a91.9.1789154243279;
        Fri, 11 Sep 2026 12:17:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94744dfdsm6689115a91.0.2026.09.11.12.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:17:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 11 Sep 2026 12:17:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Werner Gartner <Werner.Gartner@congatec.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (cgbc-hwmon): Fix current sensors ID lookup
Message-ID: <8b822b80-8d5b-403a-8bee-c288fde6cbc6@roeck-us.net>
References: <20260911-cgbc-hwmon-fix-and-new-sensors-v2-0-0c6bf078d173@bootlin.com>
 <20260911-cgbc-hwmon-fix-and-new-sensors-v2-1-0c6bf078d173@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-cgbc-hwmon-fix-and-new-sensors-v2-1-0c6bf078d173@bootlin.com>

On Fri, Sep 11, 2026 at 07:31:58PM +0200, Thomas Richard (congatec GmbH) wrote:
> Current sensors on the Congatec Board Controller don't use consecutive IDs,
> unlike other sensor types (voltage, temperature, fan). The driver assumed
> consecutive IDs and performed a simple lookup, which caused an unknown
> sensor warning. Define current sensor IDs explicitly.
> 
> Changes the warning on conga-SA7 (type and channel are correct now).
> Before:
>   Board Controller returned an unknown sensor (type=2, channel=17), ignore it
> After:
>   Board Controller returned an unknown sensor (bc_type=1, bc_id=11), ignore it
> 
> Cc: stable@kernel.org
> Fixes: 08ebc9def79f ("hwmon: Add Congatec Board Controller monitoring driver")
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Applied.

Thanks,
Guenter
