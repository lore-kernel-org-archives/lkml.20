Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464841;
	b=zkFL0XVWOWVV8Q/9Gg2xbsoq2Q8ehq2CdBfItQI7bAsekbylH/vzxx/96FP36h5UJaCd
	 d4i62y9mqmSoeoUCDNiEPR9viVdbjHQcwUYXLnpgeZyQJgSkfL8B4d0l/9Vs9dzqpdC0U
	 3+Ys+0UR9UiHCN9wrnLrj45Nd4+cr35bVpymR4qkqRHH8xPWlYvU0Y1YHVwhdvh0c6pxK
	 XVdGm5x6lfCO7RaAWoeLj3dYAdwhdpE0ZCjyshnACwzdPzWQozX4wR6adCreFdyWDU+de
	 kMmVboAtTw21bOoNCpCt/wbkVkA5YAWwS5g/F6q7wJfr96iihfcxXvXHqf3rPhk5NOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=RF8nSYHgZ3mAndPkH0mt47AX5IWuspIpOM9gMeupC3M=;
	b=0MlYHtYb6TgnsTE3HvOyMr0piMvVHgLAZD03sEx5SnnBLAHjk5JF9ntm2nCVXTtVcuS3
	 fa3PyMuYLRxVh0LxULwUu/vTh2ezE97bdZpk+6uO2qYC56V+76hcP4HDKvBy0HCRki8O0
	 TIwaM7ZC/pmQhcQe3LjPqpsffKenP1m9jNcHmSCGXoL95vyOx+SIjXbY5Fe7whWkgaEJy
	 De+HvRyfbCEOdv+ITlypSN1uLJaSvXrouCneF+z6F37mNaSEJ1/llzQH4HFkWKUEFz9h5
	 8+t6QnxJ8ZoQXfwSLCymK3L4zfD7CnwxTlq4Hh1Htokqe//QUNYoKpBtWh7+qwhyNEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ffroot.co.za;
	spf=pass smtp.mailfrom=ffroot.co.za;
	dkim=pass header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oALOAzYZ;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22266606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22266606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oALOAzYZ
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e47347279so2478741f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20260707.gappssmtp.com; s=20260707; t=1794464838; x=1795069638; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RF8nSYHgZ3mAndPkH0mt47AX5IWuspIpOM9gMeupC3M=;
        b=oALOAzYZM+oMzDxJH9B2GI5my8j2p0IDL8+qPlDJUCJEYhlsBObm4Pk2X9QbvtFSpZ
         2LyZDB49iDJ9+DtBhTuvu87YPbCsw/OSEJ5hJ2a0O6e7R1UzPKAPJX2NugKrRwtbtuq0
         3xC7W0RvAhGt+Qpx1VejPwHmlIT6VNajbZNU458fy6aueaBfNXqYFMW4jKMc/DI3TQQi
         9Md/6tcZfofUoCwcALJPp26LEblCgoDZsESSyGZKCOdgOe7+3gW0qf0q93u/IoFJUcD+
         uAYr5zfl7Q04WWv1nrxz6w+1RJBlxuYXZud+4X4NC12tJX840RdKGPQLBTmmYRJgKDZn
         l77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464838; x=1795069638;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RF8nSYHgZ3mAndPkH0mt47AX5IWuspIpOM9gMeupC3M=;
        b=xSZoBVX9p+SVClYct53LEle0Cux2OySD84sj4ORPgOidJ5TnM3VR5iUj4YFD4kDVzB
         kHxbn18Q0IEcczYfqtKdwH3xr8R/7n/bmtxmQg/lkcyOMJdpXzospIrryhA8J18xbGbY
         DBEpE/TWnPodkQKzkbCXVnUf0jVf0tbfWDf0AgGeaGUUGTA875WeAqo9zx1Aoz2JTSCh
         cntaLoi5esfi4kJlvqVWABuL4QJVN46d2oXsHifqjXAk6oKqiqjIp2wtH7/ZVPgrwnN9
         Fj8ncAVX+St/iUIrLfZIUYVbxkINkp+jfbeGGbRx12+hg8/wvXe1PHyWcn/R9BmcLASA
         x1gA==
X-Forwarded-Encrypted: i=1; AL+hErEg2DWBIS3wzwCN5gS6NfeISzhk5LrJpnJgK3bZnxmDeBoG26DBur/njJebBPREIZMUFQh3DSFOaX1V2pE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XGPAwGn/cIm6D1jJ0z/bNS0xEUSz08W1AGUhFB2odVBcOj7bo
	e9xjJlWiLY7xcPm114jYUpjO2h4ePWVL0KVIgtS2P2TC2yeTnA1fCGiByph0JBUNndI=
X-Gm-Gg: AYBFou0x3Jm0MYtBth1ZMSi8LNZNf50G7+ZwfDiyrRQyhUIFsSEYX4PWbdz8xUOXjRr
	alI60dohu2gUhKxR9FddkHsXJyDXjPBGT+23mb7oWxkI80Eu6xrgW4naMPUbK6r9E9GLYaZ+qis
	SQ+PwOaw+8ugkyA2tif9HAAH55KHRbSXe1qXmuuGWudfgI6nXs4P70SQ3eie2G9xSl4xxSy1lOo
	YUGqg7WZIzuq3UBNTVweMJ5J0HWdUrNfI4Bw3zasRFPWMSHMXyMeoXo2MzMtd6OMkyU5/g7/56n
	icWGEGB9iX7BualzkmjtYi5NHyAZrt4CPT6Ri+cKs6Tc2fkPo0/XYvsBccFwyBLwkUwLpbdPZSE
	yps4A6bEwMo2x7CTpxS2B7tSU4Z/01hbXsAeHMURPLSedXPK1S7uHdxNtGXeYZfzwG2XjafyrGJ
	ynrh8Txsg6qJWfsj52LYXrXjuQ3SfVtUhIHcbVCB8DDt08UhpWCPN3GKpEUE5hRkkOLL1UdfJz/
	3eehvr/tjoJDl5cv83AxOk6TyMkSK8TaPxlZVDxqH/yw9yyHA3/NJgfl3YyyAHLK63r6PIkN2Fy
	sPHB2XmGhk13NcxiD7GEkdedtQiDxtb8OiS/pP28oNZRRe3/s1PebxbEtI7eizMSiKYQwkhwFVl
	xTTw=
X-Received: by 2002:a05:6000:460b:b0:493:2eb8:e7fa with SMTP id ffacd0b85a97d-499c888ce81mr7051233f8f.43.1794464838079;
        Wed, 11 Nov 2026 22:27:18 -0800 (PST)
Received: from andrew.office ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4982eedfb36sm14820585f8f.0.2026.11.11.22.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:27:17 -0800 (PST)
From: Andrew Gaylard <ag@ffroot.co.za>
To: Lee Jones <lee@kernel.org>
Cc: Dvorkin Dmitry <dvorkin@tibbo.com>,  Wells Lu <wellslutw@gmail.com>,
  Linus Walleij <linusw@kernel.org>,  linux-arm-kernel@lists.infradead.org,
  linux-gpio@vger.kernel.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH 09/10] pinctrl: sunplus: Validate pin_func index in
 sppctl_dt_node_to_map()
In-Reply-To: <20261111215256.1982044-10-lee@kernel.org> (Lee Jones's message
	of "Wed, 11 Nov 2026 21:51:54 +0000")
References: <20261111215256.1982044-1-lee@kernel.org>
	<20261111215256.1982044-10-lee@kernel.org>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Thu, 12 Nov 2026 08:27:11 +0200
Message-ID: <sa6se1636ps.fsf@andrew.office>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Lee Jones <lee@kernel.org> writes:

> In sppctl_dt_node_to_map(), the validation loop checks that pin_num is
> within sppctl_pins_all_sz, but does not validate pin_func (bits 15:8)
> before indexing sppctl_list_funcs[pin_func] for fully-pinmuxed pins.
> Check that pin_func is less than sppctl_list_funcs_sz when pin_type
> selects a mux function.
>
> Fixes: aa74c44be19c ("pinctrl: Add driver for Sunplus SP7021")
> Closes: https://sashiko.dev/#/bug/linux-977252d6-b0cc-4d3a-ae2d-59d1e2f8a649
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

Reviewed-by: Andrew Gaylard <ag@ffroot.co.za>
Tested-by: Andrew Gaylard <ag@ffroot.co.za> # on a Figment Design HW84 board
