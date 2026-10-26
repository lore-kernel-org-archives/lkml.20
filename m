Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975053;
	b=JopmkhG+8VJBrLxnBtwTamJSuG22YnpCI227ijxzzb9KF4dEJZKuohb7UwoFedm+/ql+
	 cqQjS9QJiEXIryCOVYcM8PqFyO9a1FUXGhgLY9ukAI/mbac/IF3HG0Fzh5WhT5ZJ+w53Z
	 BoJXvP0mmrmU+CHoqoTNSoTDc9zLj+ohRs5K17MIPy+5HMudSckw6T7m2NXAtHjuyMbaF
	 4oWmfKiS1eCN56A/UhYgzyyEOApvYlkN2q1pelF8yXMzQ8UTYD5/LTj54tG/wKN0Kh1zV
	 ltg6a/pGJ4oCy6fqw2D729iIFFuFx5rAWUuR/NQqRDTZnXWB187275jvi/nK82si1PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/r2wCtdnrDJsEXzwIAQNFz7BfQauVg6nVHFaCnIJdp0=;
	b=EW9vurYv2ZgVxbYDUIqzqbvvuKmWkRTnHAA61fDF3OyWFloYxQjuKMAP4l3z++XSaT4m
	 gCW/QV0mnEpJ9zSrAXKQSPxb7F0nqOw7OdrMZOBWr1qChQYg/BPeIKoOrpDhIwDug2Jcx
	 opqq5GrUUhUi/wu97DzwHiOuRiavujlSDXnxRPM/yhXKieukcTkj0Xs6GOESVvtK9BFLB
	 4lSGyEArZuI9owFPdoFSMCxdlyRcKD5D++9rJsxJqjaMpjnJwO5fL5q7TUPLPoH+AyP3M
	 11rLdHptJ7EgviEwS7sJLMuPMcfJG95VnRdx6glcselsGvyrh+pgEyot3fRIhC3Kz2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kQ4KO2JE;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0C3606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C0C3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kQ4KO2JE
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so1895139a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975053; x=1793579853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/r2wCtdnrDJsEXzwIAQNFz7BfQauVg6nVHFaCnIJdp0=;
        b=kQ4KO2JEql3oihR/SCtBt1vJKCgrVRl25/fb2gLlEZFJPuafW+8/uX0PuylfUgsOeQ
         ZBiFgxQamRcLUW/InXMrst3KtjE4PFLNoUmTzwWab9UKnsDnwpjniuqfFR7LRGOSs54E
         NDBHGmnbJtXdkmD81sndY+WXvXwNHCUvdPBon1Iz5VJlwYL7PLSbJxnoLzmSJY72zX9u
         VDw+njuTy+YQhTtd3HZqwgQvEO0eQ6c4VExJt78JybsY6X3judkiVcwhlQCUBSLwGfSe
         jSauTJB8gN2PthrXekPk0v2YN0Trk3OUmhj9F0TzJyV4FcQl9D6vwG21LroJpTEuVOIT
         +0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975053; x=1793579853;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/r2wCtdnrDJsEXzwIAQNFz7BfQauVg6nVHFaCnIJdp0=;
        b=2Nh6+bRptxc3noZMmah0mcAC6hlqMFiB1GYGVm2NOb7poEGwKNXbivosnCHIXDOjDS
         m3GLi3Mm0/f9/gxSxmRtifqMW9xIGRGEMLjZ23UDMIgteIaPuk0Iz+IIE9mrcDLCH6Hf
         miXCPwzhq3tWpgOwm9gKnlMb+kl1fiBL494RZA7gFBxZFoHC8TyAlESoCzMC3MyiWu6U
         /evJdh2IFQ7R31VqmvVnt9kRK0MjigUoNwtrClEyhrM89UsV/ZuXY0Wh2k3hkK3HfUqn
         7nYhPMfZY4b5lvDxUbsqcduna5SXBVc9SpSdT1nxV0N6e7HiInNVuxWeF69+umv07eLB
         dL6A==
X-Forwarded-Encrypted: i=1; AKwUvBzmCQ+mclw6/n2zTWDxY1HLSDzc0+Gc+tNDYPP8Mw8N5oPaPO76AP6/TO6gp+ipewfTkkob1piW9L5H2x0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCNzQ7XULUxgWipt/CX+DmWTF5tdRFjF0z8VuTqv5uEkA9F+NM
	zxdULrL43DNnJQloU738o6Bz3/mauucMpDgoCAO7ZHoucmw0qknnoU/W
X-Gm-Gg: AYBFou3d32kjDTQtHq5qbxhoyfQDBrpfnUvF9OB05jJussi6m/oGy+nW9Jaga/kXTEJ
	/vU0bOUuDkaqff2qv07hIL0exLV3Dg4X6ERkoP+oN808X33nPco6ATkRbgWy3rBLk7DmHsyljjJ
	SC1+rSPRvv0CT10JNQi/Q3YiAg3Pk/WY5LCZyqZrvmu1FwJZ3+qvAW+ErTNf77SVySik2rMkoXx
	WQRNXVD7IZgNAn58yARkY2u+QeYdPKpkVPcbTtY8irbwUurQ1unnNT1q7MuEJQsc5rQMTw7dZy+
	0o7OkPa5qDzQBhDcYFk7QTGyKVAECqO4HTLOHNhhWPhds295EdBzFuFSHa4cBV3oucIEXBtK665
	rnf3lzQLHw6Xq+7iGiQoUxIYZ+rDhUwUEGV85qZgHeI/eXkUhAF5zuptE0vCC8SeHwjqAFFiDub
	bc2BUoRlevZ7bTtm14hVZKOxNdikjfrv7VV7l2CDXZgLYYk2zeNhFtyYBMw5OAItl5JpuRMIR7j
	5XgC1lOhh/1hUiCDYljPP0FOX6XWBOM6JGnoJoRYFUxCiYx/NNGKv/+rEz4nMqygeIixQ==
X-Received: by 2002:a17:90b:17c9:b0:3ac:a139:1b14 with SMTP id 98e67ed59e1d1-3adeafc4fddmr4768147a91.57.1792975052754;
        Sun, 25 Oct 2026 17:37:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae29c7e756sm600001a91.16.2026.10.25.17.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:37:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:37:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lars Petter Mostad <lars.petter.mostad@appear.net>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
Message-ID: <30747603-76ac-4032-b3ce-4e24f1a5f55e@roeck-us.net>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-3-27ece4e43d04@nexthop.ai>
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
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-3-27ece4e43d04@nexthop.ai>

On Tue, Oct 20, 2026 at 08:02:07PM -0700, Abdurrahman Hussain wrote:
> From: Lars Petter Mostad <lars.petter.mostad@appear.net>
> 
> PMBus 1.3 allows for relative encoding of voltages in certain output
> voltage related commands. These commands are encoded relative to
> VOUT_COMMAND. Support this when encoding/decoding commands.
> 
> Signed-off-by: Lars Petter Mostad <lars.petter.mostad@appear.net>
> [abdurrahman: rebased; check VOUT_MODE for 0xff before testing the
>  relative bit; use signed division and clamp the user value before
>  scaling; reject a VOUT_COMMAND that decodes to 0 or less, or above
>  INT_MAX mV, at probe and from the regulator, and scale the relative
>  limits by it without overflowing s64; update the cached VOUT_COMMAND
>  only after a successful write; decode the regulator margins with the
>  register they were read from, and in relative mode bound the output
>  voltage only by MFR_VOUT_MIN/MAX, since VOUT_MARGIN_LOW/HIGH move with
>  VOUT_COMMAND]
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Applied.

Thanks,
Guenter
