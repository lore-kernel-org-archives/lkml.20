Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460319;
	b=QyP8umnXKAfHTfYv6RFAu/neZAA9cslUA80Nv6FoNJHTGvGJM8IF99cthFG8zVh//i0t
	 1c6075Nn9q/crYmBtYu/vRbj7px8mM30kr44ylsyUjNa1HvGtV1/drbVAYlu33nRE2cEP
	 NiTfnuOMiu4FZ1efSOWz5DJNk1JSMbAP0fuYcTwlvMftRKKs3S4UwwerJM7pe2Hxm4kRy
	 ehZ5DvT5UK6JLz2ArXci/6vRwRtBtTPXjiv0wJFJKLVBsi5pgiUurqOBR2ohoFLv3bT8T
	 +FvrL6KMGhomCv/lKeTISy8FBU1piZ0QVqE7x4mlZoDGeLHOHwIpeVSra0+NXeihW3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LjwwN5Dzf8X1Yx08q6zZspcMWuK38LtYvZHShxnEiOc=;
	b=M7XkYvxSzKWfM1sQr9MO8uvZTNmBnonSVsZHZ6B89l0y6CbcdAseeBX5clp8UVWRFaVk
	 Y5BX1hH3tGD+V+4sz8HAeAnGZqKMMAohctPlDvP0KtZeuc4KmkIE4aCXCkfOfZPC48f6T
	 g+oLYBsg9xOUtx0r7J6gJbi8UeD/9k7+zdl64TVnCJZnj/Yb21vvqtOrq3rl2+vFocuAm
	 bxpcY64l1fi78anFBW458wfsyXjRwbgCYzmgWjinmPzm22rWjmtlpO+EcvmiOumEBcluF
	 RQBMEgVCdEEJ8/ZZ8zeGh0s5qWkK6bspZHBpOX3ixjcPDRrGrPVaOPyModAKJz+dRJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rhK27hUj;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D6A606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66D6A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rhK27hUj
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso6602712eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460318; x=1793065118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LjwwN5Dzf8X1Yx08q6zZspcMWuK38LtYvZHShxnEiOc=;
        b=rhK27hUjeHRnkhbrVNJ2XwhZq7l4qeNjK188G/cQOCNGrllyZZrjFdmE7BBmC6PbZ0
         FqpQMmlLnaWvKqtvLwsP3VoeRu8uWRcYOA9ni1wMMT2H0G3ODy0x+IpphTIFPd3Yv0/I
         OiK8oGmEqGaMBBu1Yvhzln7e6Zgm2NH1kyRSgAGkThUXOFf4T9CG5Xg4Lb8dgNxQK1OY
         zGI7XFWCPwMcaI/ldYUB8ytRSo0huZB2FgurXz984M4tjKyRWOS8mLPdz+yFxO5kyzxO
         2AePlDfj0/lvRVnUnyQdoseg+5cRhVxFR/kx6i0QWz1eDRegxuSi8pCDH+bgI2hbVJQ8
         cXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460318; x=1793065118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjwwN5Dzf8X1Yx08q6zZspcMWuK38LtYvZHShxnEiOc=;
        b=t8XSoh1Lfka6Mm267vxMsLTvNbXcZ3M8IrLgyFykQ2/Q+5vHBTo9uP3ct5iYZDU6oa
         NCjX4WTD46n+J/DzMLuJUgAaBHBvsGVM8jeVJdd6u/dbGc9u6943I52QzH5Oj8b2VoD0
         jQYgWILtzutR0j1oc8GQrpSJq4qAnKbbZko4CQaVFgqd8az6RiIeO8jRvwvqY6G+zOt7
         d30rY4ij3dtbxZfJey51Ouudc2hK8RkWDtb9MT4EDunFvgOTb5AtaV1DggsEmpwL5qxs
         T2RjOWyc6XNsj1xbfvEzpo9xsMNvQulufmpKSIt3MbIkmyU5vOgKH7JaxxXW82ab2cXZ
         lEOA==
X-Forwarded-Encrypted: i=1; AKwUvByUl+GqC5rl1Enl1aoZL5mJ0SLILcr/NRvEqfz3LcrAXRaLKpdHs26emg7g8L8uAek9gSfjKN3dcbRK4jw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcyGhZl1G+3vhOTEA4bty+HetRSZ+ho92KJ3mKha/rv2NqRrtG
	xEqZaYUFOUKiqrxNlu0PvqGE7zV6h9+XLjU37JcqcDuPG5Sia+TP5QnS
X-Gm-Gg: AYBFou3DEErD9VxzwkR/nLhCDJYxoRTWVdd2YQUy3OrluweaMPsPCRgLmQ3yGhEIF1u
	KZvsObYqZmMESXyjL7JE8vmuhaheNiE9FhdGskvM38ORf/rSe0Tg1VrtCK5hkqVkos4Rw4btYP9
	7uIirM/zesCPzJBD/cwe7RR5+Eu2SQ2BhGsapq9LAWEgLtOCTsgb63nKstUySgzOpYMAxyoSf9z
	oi88CEcxaLn+YA0nBLvvaNi3KHL6kRuswrHRXosuD1KgGW6Jti4tshMskU7v2m3Dca09wOeudcu
	yTmZtzPb787fdDEjEo0jxNbOPw29HWgUOZ7yl9nGNWmiQCED1DtitY92ufBSfI8tmyoXnvlmdEF
	5CqYsJXXrkiHw9QRTGsnWUqXJXjtOs0OiQYSszudCxQSjjCx5tHQEqONNdqtci0khZCJ6lRgwYY
	pBA66Mtukjcb865b5nsvsw6MytX3kZ8yuK4DiWKcQ7rutdcUlTyYodhvVRK6sFzR8A2cpq8j0nT
	Mr2T0H9fLMl
X-Received: by 2002:a05:693c:20c5:20b0:35c:2986:35ab with SMTP id 5a478bee46e88-361a1668b4dmr13507939eec.13.1792460318438;
        Mon, 19 Oct 2026 18:38:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm37720983eec.7.2026.10.19.18.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:38:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:38:37 -0700
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
Subject: Re: [PATCH 2/5] dt-bindings: watchdog: gpio: Describe minimum
 heartbeat intervals
Message-ID: <704e79be-3fa0-46fa-aaa9-d13fb9d933ac@roeck-us.net>
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
 <20261016221617.2223004-3-f.fainelli@gmail.com>
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
In-Reply-To: <20261016221617.2223004-3-f.fainelli@gmail.com>

On Fri, Oct 16, 2026 at 03:16:14PM -0700, Florian Fainelli wrote:
> Some GPIO-controlled watchdogs require a minimum interval between input
> transitions. Add an optional hw-min-interval-ms property to describe this
> constraint, allowing the watchdog core to defer early keepalives.
> 
> Also remove the 16-bit limit on hw_margin_ms. The generic GPIO driver has
> no hardware register imposing this limit, and its heartbeat interval is
> stored in an unsigned int. The MTX-1 watchdog has a nominal 100-second
> hardware timeout and requires at least 1.6 seconds between transitions.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
