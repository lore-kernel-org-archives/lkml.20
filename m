Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.210.214.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793253964;
	b=uyvWGwCpVIQOD1CB9pi11ZtLMaYQCtI2uuQ35r908dLluX9aBSGJfCqStBGhuYpYajCn
	 DBzUxD79I1k84iL2E3pwE9l5xBat2eR22KzHmKImzMmPyxsN2HCzbEzq6LAvGKffZp2qn
	 h+Y2iFcfoZB2m0iqpuvGoJtwZSRnGKRzdwPeklWxx3iWgDVvCWd4VBIj6Kb+9FGnOmiKs
	 vfaKgDK7AWmgXruIgTbO8LYr13gq73nFpcu+/o1LzEI3YgFL+zzufPoQNN4jiosaaPwWo
	 u6yIFR3/akpQKiWzy2m9oaR+Omnq7dC0wY5Gg4RcT4fWtY5grwbjq4LZLyAzUTujW0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793253964;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=TVw3BohKuLMa7W+lADfBwRsku9YoKiKZKOxm1/KhoH4=;
	b=Ak+xbsA50QiOBfTSsMgLcOT1cQpNg4yPJ0VuTvuGJfhtulWM4zAs8ocAE1Venr3a/BJj
	 xc42jZpp1KaFztrvJMtuoec0kyhVkImG6ugUw+XyCf026sNe/wiKVke6WHXlAOtUudzo/
	 zvefSy7QIEKTw2rGfL1tfsRQI6b8v8z9UKQ+mBPQHyv8RWJVsDSgrQF9ChqCd8K/v8bu4
	 Qpd8B6xWayVsdoKAOIAtNf+Vecw2FaOFBbS1aQ4Rs8Qx3UlP01u35GRLmJMBlOn4IKymh
	 VyPWTGD1bth+ZTpOJLitirLi2TqxSl6zsycLf5Za/ZT3AiELQhOaYmndBrvdtSnyM2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codewreck.org;
	spf=pass smtp.mailfrom=codewreck.org;
	dkim=pass header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=XfGeKiAJ;
	arc=none smtp.remote-ip=62.210.214.84
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B84E606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B84E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=XfGeKiAJ
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id EA86914C2DE;
	Thu, 29 Oct 2026 07:05:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1793253961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TVw3BohKuLMa7W+lADfBwRsku9YoKiKZKOxm1/KhoH4=;
	b=XfGeKiAJRMTyb5BFZKDXvcC78UdYBJc/q8U7/DUOnispkb58psA16jIRFs6n2uIci6Qj0d
	YZ5ylWY1SaXdZcfhQ4gcRF1nadR721uvmVL4ajmh3ofbB/jwgN4iPtJufy8cb7thjA1F0Y
	PHhp5bwM/CyTyJQPYzF+le9Xm/0qyyz19s0AicfCjw6u/I/sPHgwXS/4tXrf2XiHqjX8cW
	GJpxfweAQCuYwNyutbcpYaQFNEhQfWmqYICd0u+m7dPGfuUwz2R1mKX0GNQMHtRnKMTkJX
	5DqjIm3x61nDvZ4JN0sANM4PtTg9Mnbl9b42700IgW66OOvBrD641FsrLf+DCQ==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id b67bafad;
	Thu, 29 Oct 2026 06:05:58 +0000 (UTC)
Date: Thu, 29 Oct 2026 15:05:43 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Ankit Thakur <codeankit.thakur@gmail.com>
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	v9fs@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] 9p: fix header guard comment in acl.h
Message-ID: <auLiN_HvzFiEOUDh@codewreck.org>
References: <20261024092154.1844-1-codeankit.thakur@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261024092154.1844-1-codeankit.thakur@gmail.com>

Thanks, I've picked up the 4 patches

-- 
Dominique Martinet | Asmadeus
