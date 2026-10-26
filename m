Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003969;
	b=QrH1/hRWD6xonYxobE6cDqwzR8BwrcTO1ShvqcEsnzN7/9qGvbh/WlWDVho9gYqSnaL+
	 M8RXvuWLjPOsgJN5lz36yLNrSzeV8gXAhWAtoV9LHJdcDm/OuI0eDCnMosYUVXTsDypFw
	 r6KbvPU6lh63g6h6+5B0J4/xkfLTvXM9qZT4ptycAQGNQkbWHLeKfXwHWhyAHxCGv+92K
	 KSjoogMTqHQzGTjhzH2Dk4i4cvolpoGIyiGnr2g93dE7bgvM8sroxBi+oXZzc9Y+TBvih
	 9YXk4HAFU6yDJIAjjl28rWNEOeMFlsO4qUg3PrpzD1XLG1kaJ09w9rjPIcRa1VTWhIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FNsk93EuVFBxLJj508WFUJM8x83vnwjCep0MYdpKjqI=;
	b=gEZNGjUwTeb3/8Uoy6ZGHtVpbQwlwizCGBA9hOcgpn+WeRhJAK23/h2Z21Lg3qxqux/+
	 XmcGuDqFrBpr+n8jIdumLyc/VbqeYYf6a4OHFk8ziX43jF12ALEMeXK+UVEyHmEOIrT+N
	 jeSXXRJKhpqaj6ugL3pJE2IsIdkJMYuqwe7pcxLN7T/z+kyOtewPoemmMt2JYg9JvSZf1
	 9ITy1GMm9N31E0xiwVpd6rXiqq8M56iF1Tc3pTAABC1HTEXq+YoEw+FRkeenybtJtjbiL
	 xhxGBRKsqZpApwpbz1M7oo+WU8g4SCCMf+em2oCXNzBF4WmqQO0RODs9DWdiWRagtcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=rg1j5lHg;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C28A606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C28A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=rg1j5lHg
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1631789f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1793003967; x=1793608767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNsk93EuVFBxLJj508WFUJM8x83vnwjCep0MYdpKjqI=;
        b=rg1j5lHgIKe2pYctEnUSlK2gfR/BB707z/jC+v7QfZhX6VzgxZxs5z0aKmRwx9kbZL
         ixyd4iSTbbqPzYfy8XapAwDptOtJt+8GNnzD9HPmy/99EIf6ii3UmYFWTzXcPMNYNXXd
         gujqsxf2RTyoezpIOyMzyNuZQ0JRiySvH6S1qTephY9OxOZoH0s4k/+72RJ6Ssy/5WhS
         RzaAbPq87Rxhvn54uLbQm9t/kzWXMFupa5HSMYU1YVbMMn5MRih0CzP6FpM81bcM/o54
         +cIQDQJIQos50HjcBcdryfXvAurhHjB0oBs5c+Z8L4eweKXt8qRL/dE5F3FRqidRWIYu
         9hTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003967; x=1793608767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FNsk93EuVFBxLJj508WFUJM8x83vnwjCep0MYdpKjqI=;
        b=E/U/aw9ThxM/pqUuCL0KUnl/ZU/WbcM4Tw/K/4fLSK4OwxzuLENxaS4H3psiUmAmg/
         5B/nqXM7qPAXutxvfjQ7OfLS44NBctkCWMz/gblXhwFLpZhtXYvtfGcDRM1VWX/oZMSm
         zQ1npxraHEbFQKMzTxlPf/btvEM5ERX4+pnILGTcHvOKhcYpBuOJn98ZG4fZ7wNrbRII
         10iHlIvx5Y4W+Ba45am2OmRPW/dwBhLUiMQtyd9Gsbmaoj1IFOLAU/hSSDBqSzKcN3Yn
         FuHoOJ/OxY+pJBkr6sCsbxWGduMi2YK51GMyraPo6OVgKLnqGsfLvKzl3XibDKy6jiA2
         hSdA==
X-Forwarded-Encrypted: i=1; AKwUvBwS6SSEM2JS8MJn9vF4BvcFqXFLPpA8uCO63XrwrxODbcOOflLIEd/sN4Vpvrt93fCnj5snSVUiLbdh0pA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJeD9p3zpQ2Nivu4SKI/H6wGtzsmV78eHBrS/aQmnqOa6mNcQC
	y0i7xuob9CauBsdpOdqd8IywYBVzpryFGlVo23Bmm4ihTAP8x1F6Xs+lKfHLH0XH1Fw=
X-Gm-Gg: AYBFou3SVTTPbaXVoHP44nDMXghYGoTFzbQZem53+fR+8VOgYNqU8S/LPuIJnJ7syRi
	mc5QFga2dkYnPu8C9HXprkJLk667MkMrKOwg4sGVyFLQo3mhFqEOi+1JXJ+/ZYr6HZ/Hg7XrlfU
	auavNnkNrMibUdCIpdL149dtTiDwKeS6m8gCe84B0Cr7ydS0U3G/dMy1OpBbUYL4VrC7LWykvC6
	C8YRYb9B/trM5mT5aljZsIHDfAJvXo++lVYf5WR117eRdYcwu/tCh0fkroKacmCUs0V4poI3P1q
	ixtuxACkFAKUvdmRn/CvPhy4JF/xru9ugJMPiYMqXM27q7H+B8gedmmuUhEE3KcwB8aDeaZDngY
	nUTqyiSkNXUvb5nx82+5PuL+b9z3w4/cHcVwXaeyxbwjb6OvszBeWYrl5Cxsa7E08I7FwB7za5E
	Bz+Y+PFb4PLqXp7ALEBMA5xcRBb27bzuu6KojgQFImVEb5CdJdveityP6cFes/7wcaIerfcac1P
	/f1xMDRUvyN54qSPuPPJ9y68T588d2k4885bDVOPmeWKJxkddannKk90LuFCG+5UyQsN0Ep3jqs
	R2cjC4QmXg8qGw==
X-Received: by 2002:a05:6000:188b:b0:488:8bc1:a2eb with SMTP id ffacd0b85a97d-48e3eb98ee3mr11807123f8f.39.1793003967452;
        Mon, 26 Oct 2026 01:39:27 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f25fsm14673690f8f.2.2026.10.26.01.39.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 01:39:27 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: Re: [PATCH RFC 0/2] mmc: jz4740: Use the integrated DMA controller on the X1600
Date: Mon, 26 Oct 2026 09:38:11 +0100
Message-ID: <20261026083811.67574-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025140325.73204-1-olivier@mgcrea.io>
References: <20261025140325.73204-1-olivier@mgcrea.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ulf,

Please drop this RFC, both its premise and its question turned out to
be wrong.

The X1600's MSCs do have request lines to the system DMA controller:
the programming manual lists PDMA request types for both (0x34 to 0x37),
and MSC_DMAC.DMASEL picks between the two DMA paths. With dmas in the
device tree, the existing PDMA path works on the HiBy R1, card setup
included, and reads as fast as the integrated DMA did (23.0 to 23.5 MB/s
against 23.5 MB/s with dd, the CPU about 20% busy for both).

And DMA_DATA_DONE does come. jz_mmc_irq() clears the flags of masked
interrupts, DMA_DATA_DONE among them, and on the X1600 writing that bit
also clears DATA_TRAN_DONE and DMAEND, which most likely is why reads
looked unfinished.

So the X1600 needs no driver change here, only dmas in its device tree
like the other Ingenic SoCs.

Sorry for the noise,
Olivier
