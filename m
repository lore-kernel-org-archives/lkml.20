Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5CC1E98EF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603617; cv=none; b=ft7xW4Kzfe1qJkbY92GGIOpVhslqp5ZAjXxKhGHVI8k3T7zU+3hW8ZXy1k/SvA9MJiRH3+JQ6WSE8J49U8yTVo/0XqKhYKWzu5N8t54A1IMQNyQhU6oCGHG9EbYLzpCvMHiHlCOVnfcuAJGeaciCcfC7CmN9h6YHohJ1ANWK5EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603617; c=relaxed/simple;
	bh=+ThdJPNy+byv+5Bn8J2b9hHnhaBGGv4AJj/JK9pn78I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUo5Ufb8gLTQi3wY7cugQMFUR0cSe/8n0Bm0KFFxaMqEc1Nx5aZ7zUyV62bByBl0Box1rtHz1BiuH/8DaHPKj0DiRuNBTVyZQC08MaFtciVTMP5gNe+JaBWd8w0aOC4gE1XyNI4LBulVE4h0/e9S+vxP/sF6c+AeLzwjQoEvTNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ic3WLNfh; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ic3WLNfh"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so2444905ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789603616; x=1790208416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZlhBBh6GNry8e/hmi/l6fJM69DrRa/l8BJNW8A1qQkg=;
        b=ic3WLNfhwU2fzmV8IaKnGslnh6GGuVvR5hlzb7CyCFJBasdoUZUWa8XhFzeDZ1C1jt
         qlXnaMa2o2dYgsaezRHeHTe1iq5aPo4cI7krEwCSxA0NoFvSlKJ7LiJzKkRpF7g8bglE
         wFzFrCJ/aPkBCxxAqEbpV4XNdHD99due8xNwIlj2fWA49S3Nce2tIj5zldGmJ5IP831T
         iIcQhaxe+ky5iNgiBw/SFC8/E1AGQYd/HccVkYyIloEeDRPFrqQO2OpGzhuUh9oRxCOk
         FCzGxHE1BpMa0cKiPp2C96NhsggKQSgmOcUj5g/4wXcMseiobuKI5cZR+PBUVSr04U4p
         l0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603616; x=1790208416;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlhBBh6GNry8e/hmi/l6fJM69DrRa/l8BJNW8A1qQkg=;
        b=gtDoOq1wYuJxRS6j0iqhxws2r3CglH+v5b0jSvAPwmBVmp3SHGFQMG9e5Kfc8oXPox
         Fm4S9Lxd7nCWVLabguBwavr3Kx00YTgUK82buHQfo1f5wMNE7nqqQ7fncmgbL55fOctv
         QP7AvGhtr2sv9dFli3L6NWGUoxXvGLxQ2klTwDVgxi7v3fZRiCHgIqASu8FQM58q1RY1
         3Cx1WYFjocHibsMRj6GhZZQJ5rpMns2I64bXLEW0WY4mIAPb/IJTUaOeHEDEaftJJaLs
         t9kqrtkodLxcvka1wgmqc9at1bOgGVSntjHPDx/NhW2kejiysKtiSN2G4c36Koon0EOn
         boYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSG2mUrvPiqmGp2paZvvvcf4SMqnGD0HV+uDNauhVgYtSc0kcj/I0U8oAzBycZZaHcARLGYVIlLCrYrO8=@vger.kernel.org
X-Gm-Message-State: AFuF++ndTpqOgUXGdZJ+oDOvAvbPPrnLchLH3dBem+EBrtV+DC/oeZnZ
	Kp+kwp1voyymOjk79cqHPHE0tIluWVfRP3/cAA7nPzzkHfWvzOjhdN+k
X-Gm-Gg: AYBFou0O7ADLG/0EgxOCwAm8f4ZIlWMzkbp/lXRNHsbN6tE7yqNLsWJLeqDMVmal9pq
	iXwRKPCsphanotbfVLKbNsuRdIpECJWZ94u14QBZ19VoYTRG1jz6VfEl84Fqo25OZQkgf+PIUP3
	DSPRBp7Hb+o9KdKNGGPu7Qwcrh5wEx+Ewy+fwM8Pl70x5ueW1jFw0nR4rcEb8jKhlmEbAmOU6kw
	FqCUjm3TD+8qZ1nQbWFhApFteDwPrwfLKgfiiYn2mJhxH8NbH10p2MoaNPFPJ1O3Fq+kdtJyqv2
	sj5iwacxWONadD0dbFzPzUxOwhy6nXKLGg88pEccdEWikVbmtkBHHCLwlgM63YqewjU+JuRJeRP
	LomAGXmDeBkfaeCt3OSyf7MREgjbQ+YyjnhQkM1GrarAR16QFwFAMLsiOsYTQ8vF1WrywKF1jg2
	KFeVIUBxvNKY1e5zKDq6fUKHIwnwBWss34SRIzM7S78Agerh3BXDX7oAyj0W+3RGhMQyxdk7/Xu
	XvJzCUkkrExxgWSKA9Zrrs=
X-Received: by 2002:a17:90b:5388:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39e1e509fc1mr10470483a91.22.1789603615636;
        Wed, 16 Sep 2026 17:06:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b1d335sm11616315eec.28.2026.09.16.17.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 17:06:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 17:06:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/tps53679) Select page 0 for
 single-page TPS536C7
Message-ID: <01bcbbc1-d613-41ac-b848-462b309a3a3d@roeck-us.net>
References: <20260916235406.681131-1-sanman.pradhan@hpe.com>
 <20260916235406.681131-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916235406.681131-3-sanman.pradhan@hpe.com>

On Wed, Sep 16, 2026 at 11:54:21PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> tps536c7_identify() sets info->pages to 1 for a single-channel part and
> then accesses page 0 (writing PMBUS_PHASE) without ensuring PAGE is
> actually 0. pmbus_set_page() does not update the PAGE register when
> info->pages is 1, so if boot firmware left PAGE set to another value the
> PHASE writes and subsequent telemetry may target the wrong page.
> 
> Select page 0 explicitly before configuring PHASE.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
