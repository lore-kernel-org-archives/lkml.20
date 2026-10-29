Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284547;
	b=n5+t6wwQ7+kmU/i7D+RRjlCx8oN0XcxgyLALU63WJAJ6GeOk/Stp0HaToGkmjwaxFoAo
	 GzLRVQTEzFkl6AVg6T2sSZben77AtAb0rzSKoUctDdB6n5IAd+KWVCIm6+3vGG8o/pSBS
	 FytFXQpn5k7tLRFEDMQB7ymdouPRNZtoqe1wLL0TolSYSZhIEXWnjWJgYvCYcuoy51ltI
	 cLm8UXJGthto3iT53qSng26dAJrSh3Rk1K0JdmXl8Hkqbc+Id5xJb3Zr9fwqCnJrfg/A7
	 p8XDur2/h4DRqPUGstdLUR04qZyXgONXQCIVQFJJS0zLrV33JSzNkoYUPT/ZtOFYx6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=l6xcxDtlzQpcugPAaSZmvKKzHwB4F3KDnx148FqKe9A=;
	b=QlpT4Au0rYo1XcJj9/8uUg6J/yihK9ji+HGXkQTwbfniQ39ZfWQ2kuBcoVROmpc+1y+l
	 Y1dxYv7ixBBNKkrBzO6GRd4NxErPBhm7rU5lakw6IOobF5DdaTFI8LRO5JiPRAycpID6/
	 qCMvrNoOzFWD7f3t6F0qDgamLmsgX+QW/2s7xMpW1Y5NCr6kl/yF+FYCxssAxdT65l67p
	 nHQ/6xCqrZqv0ebu3phwVeFz4IfrhKZoizghqDFrME9qFm28IR8zZ6aygXmGvDrmTOAu6
	 LH4kkG1BLymwceIBd/y4ks4KgD3pmXam33fxezRvR3nKBK1ZqYEb29c5ic8zpX6hILg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i15Rr42E;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DB2606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78DB2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i15Rr42E
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3535a54bed9so3176961eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284547; x=1793889347; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l6xcxDtlzQpcugPAaSZmvKKzHwB4F3KDnx148FqKe9A=;
        b=i15Rr42EaIEWKA1s65MiXIZmoT+6GXqUWOV6NZH9RWcM1f1FnKLPQMoi2r8tasCb9n
         9VNt/m71psP/WbwThdwtGQt6YUu1YF3BS4m95IfFchu3raQ1GgYs1KvHdRmJO7XW3fdY
         2NPfmglJV0ymUs8yGrEPwzMvelHH0FOR760ypNk/ptzreeYP1+6xn0s3jsboq/BbHNhB
         NaQuu4SYO3qauHICevUEjrOBa0i6MEzZseyVmk7+IlRc/k4+QDNMtF8A2uaGaROL3xts
         n3oiaz90V5Tq81IVwTUtWuDzsNFrZZg2FwpyPTc8I2RDx/WLH6Bz2JW8iIuTmMZDVF2g
         cSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284547; x=1793889347;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l6xcxDtlzQpcugPAaSZmvKKzHwB4F3KDnx148FqKe9A=;
        b=S9wV0bHoDfpStADC3wJq6ID6irAHO86Vvd/zQ5O0G8dTvUOI2vj4aHsdpjgAdo/UkO
         O5l42razF6mqTFYBCdg6uubUJSXPYO9jVXY4up7XW60AMPbH/CLvJtxlYfeCJnfXtnjg
         JmP1l8O2uLXI5eloB0iX0G16+14mxG8rLl8WgvSrwipr7L0pTwYrZbBCu5HtaxzpsytL
         /DfJZnv4ir8JLb1tj4nrMVF1K+A2ILGuV1Wh/9K1aLQ/h7F3EO6Jvuqt3j8lbajB/RPE
         M5NW629EvQM1gmMmLN7wrm5bzDCZqpv1lx3IWcwaayM/JDFuah2Yf12vRRaI5D5A9Nl+
         ukzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPhfBMKJqhWQEDObWGby0KiIZGKz8lv7HeworCmbt1mWlhdpBfWAkgTQmK1h3LYnzbffrO+mSXesQ6cqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7ddtT7ur20Y0bA2Gm8xsJM/w2oq9GTBXfT8DWPNfdGD/Hqye3
	nn7MXJ3vZf9XiP6vFgKFgOENIkh36bcoQPOY5BeglY+rnjfkkjCkrdOc
X-Gm-Gg: AYBFou3vVErO/+IVO2Re74PwW1d3je3y8zcqUPc0hVliuYjR3TkEa+go7CZsZbg1VoL
	pibvHPAhIhxX0HC0ixqP6vfXwzMpjziydnfDpjlSMuRHYqAXZ/cKUvo7UYKtnwfngpoBdZNnJZM
	kjiUvAjfHMHd7RE+h7YBItScJWD70m3eAhisN3kT11p4QxU9Ix11p68fFPqHjIGNVaQSvb3Yax1
	FyHS7RUdJFxSV19u1SSkL44QnHDc52BcPKCsQIUPDjI/iYv+vs3xL3WIzhMaAxVWowg4laAU4rZ
	nrQGPjLhG8AqnrmEUdPz5dYBp6Aq79UijHS1i+wvjmIO3GILgXiHrsdW8ybpOhcy6C2gsGX4Ldu
	qAvzXfpY9yZFKDqhA7JdsynQgujOkfbWH5lGUrZ/YR+Ur+4yGyrjocW5PThmUWWFojurkAb0qrP
	oUbg0AA4QJiMR/5s0uuZKrVG5BOuvYsYA4wknjlFJ4YpgLB9pE1iFNppdhR7og1vjtNUsLCCdP3
	gYdwDfd+vriOLpTGqzlfMP1yCyIxiepmt2G/Gl+xUpXJE5ITB8yfJ/ictf8rQh8F7UiF1iZRwy+
	jdIRZ0apNG6Q5ZdTb2Z0TcruSEOPO0zMFDN796VeCeCNcQHtPRCW7j6F2NoSeO9T/lMhG/dDIJY
	=
X-Received: by 2002:a05:7301:4701:b0:359:8492:20ff with SMTP id 5a478bee46e88-36a20393e95mr6826737eec.12.1793284546478;
        Thu, 29 Oct 2026 07:35:46 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2395bee6sm17248533eec.21.2026.10.29.07.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:35:45 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: Nikolay Aleksandrov <razor@blackwall.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 bridge@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: bridge: mcast: release the EHT host budget for
 zero-address hosts
Date: Thu, 29 Oct 2026 07:35:34 -0700
Message-ID: <179328453413.1172981.17449459861301643018@gmail.com>
In-Reply-To: <179328352676.3327.7322681510650096532@kernel.org>
References: <179328314076.648427.17991367257682028617@gmail.com>
 <179328352676.3327.7322681510650096532@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

The PoC sends an IGMPv3/MLDv2 report from the unspecified source
address, creates and deletes the corresponding EHT set entries, and
observes that the host's num_entries budget is not released, while the
same sequence with a non-zero report source releases it.
