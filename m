Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974192;
	b=k/KIK2KydqOMoY6fje856WKgrnsY+1vZQQzc8Mg59qjiRG3c3dvXa8FtUfbQeGl51PNV
	 wwFzhe8/Sm5uAmEr0vTCJIg2HWGZPQWnTawKMQWEco1U4abtV5EQwv462BImc6W6gnuO4
	 GKVJ/FuqYIKFRlYR6P55ts5rWoZBVwLzrODj72AXRFMXU6IHAODhL4xfobaOZYi5l2HQK
	 SK3SLOD1cKrTiZTjbhHGNfCxd+XYxUIxLwVmPcxzTjmzzkdZDZ/EBEl2KkJjztEvYcDhm
	 6TtgOf53xyt94TnD+Qtbf7qPRR0yUjyoisxAIDsX3WO8eYOXum0NXvPuWUdd6jG6xkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=epcB0hTiu30Ay9YCdkZT2sgsaeYosE/fH0Ud9BHE6pY=;
	b=bb568x9G7jyWdfDJC5tXJFNrrZnX5UXvl6/KvldPQ2heiO4Z9ZgTdasjkXpUYT0wzu79
	 VZllot/TiFGfFjJJGnqPhcfhCr+zBUFkm43Wsodpp62ApHlKOv+x4N1aO2J1JTFlcjL/j
	 D+mJz0P41G/1Iq5uQ7sDG48g9lo7HAuvY55nVSqvKLu7j2oRzQ5Que14FwJoEuBjQfBq/
	 JcqnsTGMO7CyN2jQ+38p1JmNRSi8ekhDSaX8hI3TxhvKghjPez362OtraWzEZkI8hZbiR
	 ZozF40pZR54No58iseQO3Cp9TIainl1gCuDo80UZ8og9dVK6ql8UHTUVhd/15WYgmZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=evuX6trd;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DD0606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02DD0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=evuX6trd
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-89d6bd67045so1070975b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974191; x=1793578991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=epcB0hTiu30Ay9YCdkZT2sgsaeYosE/fH0Ud9BHE6pY=;
        b=evuX6trdavY+rQ9hdPiLIt32D3hJt9DYx00L6w8OmzUs22ucw02BNil0BHuuMxkhe4
         8fm689/990j230sqwymJwa3YjRqx/kNmw3Li+TMTM+3ABPNfbLRrc9dBJeHRTxQwa9qI
         jwOH7s7dPgf0yLY4zdCzUv5FSlyj/Y2sRTrHkonfcO3whO7vzcEAOoiMbXiXY5cwSHje
         gP8UzQ3lo+8wkTqA7o+fgHEamuHpNnctKrVe8MOGUG9qvYryv1kB0HJR8455C8wTtwNU
         Rodyo+x7mygqkaG4PSajSOABavski4++afbp+dLQT73Bk8EJKP3qegP9DeV8V7swTJLF
         txpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974191; x=1793578991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epcB0hTiu30Ay9YCdkZT2sgsaeYosE/fH0Ud9BHE6pY=;
        b=rTUXFrYFTDR/9VN+xHxSx1D67fxLD0f/w+/rtnSO+yY5Ok5VAxOkNCxGB4X/AjD/OF
         adJOUehp5RNIiwh250fs+oU/Jn0czFcRtfUImyzCn56rNu03t+mPFUkNWLFDG2JhA8Yk
         B/CS4xDMYokOo3LmBAKhIEuwAfZ8pkbSNH2So7+iMYbWLW/aOw8UdInMemLWWHmOKvRV
         Fjt93fl7lEafBaJXupb6Sw010JFHeAxoaTvjJIXed0K591SmdzHayZKXYO5jsZ2kR9XD
         W5h8e6WmchrTvoTkvTVYEic35I2Fud7lmVkK7dC9XOueII84rWEL98lcUUdkNlMfW9cG
         Wzjw==
X-Forwarded-Encrypted: i=1; AKwUvByFeVISCVeNjbAmCa1HJlmIIRVBfOwotlvgBQl6Zoz9scMZnBzs6yztwZLoYR+U3SbiFdyabc3QXRL7K9c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKF5HH8l6fsoN8D8zPa11MYpAt9vkRanjxnnlBtM1rz1Vg0y71y
	fuXcfadq7ZRoBrZQoX8QyCf5RZUibnV8og74DY0qijGHNxwbXdU8HP95
X-Gm-Gg: AYBFou1QDCDzmEpvLgQ5Z9GDh5u2r0IKhyE6ZfYSMqpbMfPMAIBeUu+sgKZt8wgiM6l
	qeZTLyA+6B7rO1NzXzcTn7knEeNLDGDMce5o/n4v2xQm7uDlV0XBmk8W5qBADVZujYBZyMcrKkb
	jbWybsWeml5Km05wZRtVf1rWOUaqRJJ5UH9cSeWaVIqn3VkaEBNQCEkvF3md2kltiSiPcRccLGA
	z/99pZbvSZ0KUVzzdC82uO1SOF8hVPPTZS6bfbWmrthl1jjKWcr+MI0Jkm/zyZcTDisCEv31+Qt
	uAxUvTXOn3QJb0+PW/SnCFIvrZptcXXLYCEhplyJT+UlZR9LeTtax/xgw49U3PMYVhY7oBVkyjI
	LmPD5D82gs4NtAt0pRg794VxaEPCNY1Ub9SLxDqBOAADuh8UxqIPXCbsuYAqroBeLM5XYQCLIUi
	H9Iz8LWZnQ7pUMZYctldjiJoZ2m9pZ0SrhCwxXSExM+IcDjUTjL6MZ+/28oMpSoHZt+Femc4uLU
	5FNb8tV6ZY5MAzdoSeOPlnO2zBhL8W4mJL8W/kpQ7HTmViX32GqpQkKL+9gsnuSCXPmgqhu8koD
	SQgkV/DTU36vu+A=
X-Received: by 2002:a05:6a00:1889:b0:899:529e:dc9d with SMTP id d2e1a72fcca58-8a36a6c5c9amr2879726b3a.1.1792974191295;
        Sun, 25 Oct 2026 17:23:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d85e22sm783839b3a.8.2026.10.25.17.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:23:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:23:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: lm75: add MAX31875
Message-ID: <4c365f2e-8dd7-42f7-b96d-a57daf23bc53@roeck-us.net>
References: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
 <20261023091550.1494-2-johnerasmusmari.geronimo@analog.com>
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
In-Reply-To: <20261023091550.1494-2-johnerasmusmari.geronimo@analog.com>

On Fri, Oct 23, 2026 at 05:15:48PM +0800, John Erasmus Mari Geronimo wrote:
> Add MAX31875 compatible string to lm75 dt-bindings.
> 
> The MAX31875 cannot reuse an existing lm75-family compatible such as
> adi,adt75: it has a 16-bit configuration register (instead of 8-bit),
> four independently selectable conversion rates (125 ms, 250 ms, 1 s,
> 4 s) and four independently selectable resolutions (8, 9, 10, 12
> bits), and reports its alarm through a different configuration
> register bit. These differences require dedicated handling in the
> lm75 driver, so a distinct compatible string is needed to select it.
> 
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
