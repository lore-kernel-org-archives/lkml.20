Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974733;
	b=kVAqq3lfkJlRCHAmUBwFgDxP+8QzGdTzBPTVSPU8zRx6fsmj89CGXHEiES2a0cyYU3t1
	 4k4zgcERADOYJ10NPbOgudr7Nn+BJbYddXpPqcjQSVC3BpohAVxs2Vlg91YzzlVrsz0FW
	 mMGXVB2tH65HOmjAVw3CEckGIxXpHeq/PRrR8blQBNJJB0ue5NIsd6GlH98cxAinIyj20
	 A3livTcw6GebMyo0o5ZYczqL7yYM59wMx+altm3WOAZ4rQuHvo7iuwPm/EALiLSBMcbuQ
	 FZMkJ9kZ1+XTPTzpLHxXcSO+e4gaUzX5O5LZfchOMxwnbobjh+TTCLPhkdQIrf8/9nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/cCFGfv4+RhGeu8mMlHwvLdoS33FbKvKHA2FJNQdGOY=;
	b=fMDKGmHdp5prR8EHNMRkCohs0cfgarmb5KO6egbE4oW9CMDQgDGCUqWZdCWCrg0rDeEl
	 zX9JM066LWRQgruad+QMUqQyqNEF1+RyBIH5A/d4K1pqIwGjT7oQLS5ZgbShgDn7FUoIG
	 rO1LqWaJJFSLvPWhnYPVQQJWIDcMqChwU2gPwwVEr1TTNJiAn8hasgp0PM2qrd8rsKYRt
	 mu1gm5YwlechhfoZCrujCy9iiL21gjB7AxJVJEtIe1znnznAyLMzwBrBs4MR+PTCB3mMS
	 wbAlTMnQlX1YCW0JJBYHVbwyZGnYQo4ESz6Ny1UiSQoPpVfQha+I/EMzfpa/qd6NRvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I6pWqzPj;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4996606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4996606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I6pWqzPj
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e5378b281aso16591755ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974732; x=1793579532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/cCFGfv4+RhGeu8mMlHwvLdoS33FbKvKHA2FJNQdGOY=;
        b=I6pWqzPjSgZLdxH34xc2dF+rZUuuIatv+YisOPFKEasZOKbUr/+KWvJu5PTfZceiS4
         P8d66oqH8rf5x3VqTv1gRyI+725YMimPt7AnUi3kr0znJFAuIqQEWKbYy/NRkjaHjxCv
         58CnUcXPwIcKrlStfd63Zeaci3ljmfoZmh4LZdhqPidscbUb/KER5RT8TCwDUAEDhe0f
         BbMXF02iL0OMyWo0iiFsC6WFfFJ2GgYUd7Y4Gi2+vlMJh7EHzvFBVvah+U1X3/PzAPLS
         4PIcfgmPbH0bpxVTAgqg3sSihMSlGMqHuVg1Txz/3MZ2q3Dff4/AnaLDtHKvyQBhwmMP
         9UbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974732; x=1793579532;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/cCFGfv4+RhGeu8mMlHwvLdoS33FbKvKHA2FJNQdGOY=;
        b=Tv4LyM+kkwsosAHqRkpEgNC90ddC32Ey1oFM6Xc5gKSFRTqnpyIx/uQz8+8FJz6NiS
         v1LzTp15e0aPL6vXVWkykZ+xcUBXT9WwSEoV1jwm6Fy8cQBtZ6uH8+3cJVX2YviC1I1y
         DhUwh99MXPPMBooDKatXLFdkh8XiLbOmrWM6oeElMYpG6JgpKWZp16s1IQ96ahlGmqxY
         X6X/6NnNxtAVRyYBY6jJ8Dx1pd26JcgiCdkw6M+ZFfe0vQTdi3mrG/fuzFzYfPL9/5Xr
         zkXcWqjtB6sgr4LTQeyB3I9HK7Fh1poFHNYcpjLlVHTj+1vj6E01UwdX+3eZnoWK0kY8
         Ugsg==
X-Forwarded-Encrypted: i=1; AKwUvBzdTxUVOv5vufcdwRWlT+22rdWk3UaSEiHz756WTZjfvo31IT6Ti29DTTHXeWrF106OHGwSvZ9LOn4kU9c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmSOevybQ/B3/tZ3fh4aV2GfDkxmw9bREyHGx+It5oX+xvUXoS
	5GO/AtApvPO30ghjbBFAd1W1JGQ2xgVE1ructY3cWh3ZGFNOiJkzIae5
X-Gm-Gg: AYBFou0K3Ae1aewbM9AhGmm/M3tNCG5qTqEAcF73XAA6Ug0logyY00KVqTB8m4MiqtZ
	hpl6RzV8E4yLgp+6vLh0OtkyLQnhO94uXK3zx72AgqKY7trC7cHYG6So1jYhKUSYSSZzmX3sAqV
	ulaIEqpLfpxiOuP3cfHQh9IkXY5w4qx21x0pot3zxK1aCwdNJVEVGykcAXPn5yj4TpubG9m6J7I
	+3pcNj1UhlikPYHSlytI5KwOCf0a+1vAsolERAK142ozqtf+jD4vaHK/i4EC4a76HY7k/ED8nvp
	yt+5haneHKvTaXT4vcQnKIWMHqXdO51r4ZgjP2k1zXm+XA3wuUpwtrw2y5RSLJzAhP2YPgN/bJP
	D6hYGpTvw1yxmf8x//bBhqrjW+YZ1N1DcceQIXT9f8iUYN5XrLLc9qR6iei2TUF1uTKuoUn9ilH
	3QHKhSl4TOmSDWr76KvhwPuhIjgVBJBKLbo9TU6ohPfTQqmhrLmNWkJC+nHobzBr21sePz2OK/5
	dy9yaI8hirW3Jr1YCVuYT8AABV5eRT4bU4pfgka4kNnOa0n2Nce9//OkCfsolI8ifxtu/s=
X-Received: by 2002:a17:90b:2745:b0:3ab:c674:cad1 with SMTP id 98e67ed59e1d1-3adeafd682bmr4403381a91.50.1792974732064;
        Sun, 25 Oct 2026 17:32:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebaddd45sm4618312a91.2.2026.10.25.17.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:32:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:32:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Remy Demangeot <remy@demangeot.net>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Eugene Shalygin <eugene.shalygin@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add MAXIMUS IX EXTREME
Message-ID: <bd8640cb-cc7c-4e52-afe6-635c0dce0ab6@roeck-us.net>
References: <20261015-b4-m9e-extreme-v1-1-621da921e320@demangeot.net>
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
In-Reply-To: <20261015-b4-m9e-extreme-v1-1-621da921e320@demangeot.net>

On Thu, Oct 15, 2026 at 06:09:31PM +0200, Remy Demangeot wrote:
> From: Remy Demangeot <remy@demangeot.net>
> 
> Add support for the ROG MAXIMUS IX EXTREME (Intel Z270). The board
> uses the same EC layout as the PRIME Z270-A for the chipset and
> T_Sensor temperatures, and additionally exposes the VRM temperature
> at the same register as the 300-series boards (bank 0, 0x3e), so add
> that sensor to the Intel 200-series family.
> 
> The hardware access mutex is \_SB_.PCI0.LPCB.SIO1.MUT0, as on the
> PRIME Z270-A (verified in the board's DSDT).
> 
> Readings were checked against HWiNFO 8.54 on the same machine
> (Chipset 47 C, T_Sensor 25 C, VRM 32 C).
> 
> Signed-off-by: Remy Demangeot <remy@demangeot.net>

Applied.

> ---
> The board's EC also exposes more sensors that HWiNFO reads, but they
> need access patterns the driver does not have yet:
>  - three extension card fans (EXT_FAN1-3): write 0x0a/0x0b/0x0c to
>    bank 0 register 0x43 (selector), then read 0x57:0x58 (BE RPM);
>  - EXT_Sensor1-3 temperatures at bank 0, 0x60-0x62;
>  - Water_In/Out and Water_In2/Out2 on a second EC (firmware ID
>    "RGE2-Z270-0109") at I/O ports 0x68/0x6c, bank 1, registers
>    0x0d/0x0b/0x13/0x11 (same offsets as Water_In/Out on AMD boards).
> 
> I have a working out-of-tree driver for these and can prepare follow-up
> patches if this approach would be acceptable.

I am curions - any reason to assume that it would _not_ be acceptable ?

Thanks,
Guenter
