Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385054078D1
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356312; cv=none; b=Z274opgJjGIhOPeB8aITGWUGBZIzWfWaTkFcnvYLXjS1CoOhYF6B+JmAZDMuIZl+9cEaNmoc0fPsc0f389mqdqFVKyCFZWy1McXii8ksjjxFD2SFC5qQA0dfrjCCTXi1wvTlkGRce9Yj+17Zwpfh+EKl01dJ9+aHEH+jkS/SkQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356312; c=relaxed/simple;
	bh=nYw7CrwIsWWZ2NPPuERLElRuvwBTOJ+y+XwzJT93iaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ebffIr4Pfymbvn5ArPSF/ik5bjdJZ5CGr2xGZncM6dTRVzkouzqD5pr1kU3B1ieTBTdmkX6RKzLLc1WQbOrg5g/Dgow2FdkQ7FbwnxdJ59cpOgJYIu+fdd8qFIQCq5HpTD5zd+vnlmftveWhqew/tQBUWNyIDEN4zaX4+oneGIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKuux+ka; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKuux+ka"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so8707295e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790356306; x=1790961106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zI1uNrLXO6lrfRFZprfTQ1p/tdW6w070lpBa0j3NKS8=;
        b=SKuux+kaMroUezcTyhTj78WsTeqy0PQj+fD8CumhpehUz9T1lnbrD8mw1nXpYUMiKq
         wQmm8oNVtNLMx9IU3xyfSqQaK/wleoe3wrEn5RoD2pE/FignMBL6JEC6EBSSjPwuNSlZ
         2zdz3JudS3TcuPBpDJG5AlcftbJTrWqd6sbClBc/1Cd9NMc4DPKBFsRHYfEnDjqNE+L/
         5hmc0ftVqoMhuB+U2EMwZ1OoPdoA1M5l4bR1T/iLNY7hHxAh/xmUh9bB42TxJGwyjynF
         NIyrGgSvo11wwLdlY0OJ4skHQCymXW3XMnvY3Q+bFAOj3GBh11uoRfzO4uciIipmA4VN
         k4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790356306; x=1790961106;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zI1uNrLXO6lrfRFZprfTQ1p/tdW6w070lpBa0j3NKS8=;
        b=z3YnNDkkyyAqF31QivJLDpup8oP6gQe78GaiccjqgVE6DJqAlWTnXpjsYn2xLRN9kN
         fgbeudzYxc+oRZgrYalE3X2EBZ27PlvHbgizunJHYwaj/lNPoNwa4n1qyPBZZoiCGjJ0
         8kAyOIOJipfJaLmLxkWipQVWN1yzVi81V761ZqG/bP71h2E15Pa3DzlXLaRVq3loYKMg
         GOVsFQh89C9Fq0MAu3ZQVG0Lug3s1ZHeQYk7kxs9JnoE4JakYQuya645FUGXqlRinM4Q
         JW0d9PzuK8I5iQSFHc2ERJuRNCCFHA3rT/I3pu1E7Hr5sJtGore34fWHgVZlG4Yc7s33
         xDsA==
X-Forwarded-Encrypted: i=1; AKwUvByYgw7z32XksN7DCpOVLj1YgNOq9Dx5+bzU4Pg9AHN6xhJPYZy9bmkM8zm0gs7/JQes2XrfZkqKSAhzq18=@vger.kernel.org
X-Gm-Message-State: AFuF++lTonKThVnFFS8qQAKHD9Cp3MYJMPadT9wPPJ+jyyq7h4dHeXR+
	dDq5LNvducxB6MSfhhgBAsPWAnuK7SKNnQdOo29ZTMLWXir5w+LviNtW
X-Gm-Gg: AYBFou0jtP6EyOaM+HyB8U4sWqoN4M8nescHrJU728u+y19ykVVKPYkj8e9NKWa69yh
	Yctpczyrbu5vsLKXOvLuVYTJZcByo7QkuMp/InlxW0JBUVAmHK7o1QC44NaXIUMeu6ZgcKVy9oX
	VeOBIZKTiFr21crg/qRXd0BnIQaj9gj1OoVTrR7D9cZm60yT3RVNMBecnxT+QAeLi3QtlwBS3Ne
	j7YxMUWfxWaHqZLuTP3/QxDRYUt215qU/SXM3pLonTpZtp4A7vDeml53uPn7FT7/yK0e6RFynHG
	mOGl/5jwEt0+718Qb/+qhckkgrP/Jdh6sHpRJuUHRVcPsvcDZfQAPDBS4YnGVhCwPGhboKaWixB
	9y/dN2bXzvlO1gpnrryNdkPx0iijs2/XHGuOaD/rixMbrmyjsuSPuU9Vzk+LhOqJ/QoTR9VhSuK
	tFUbwAo+pxjWtylqc7qT3pzCG44W7oolKozQr89HFPbyj/QgAcC0joYk624X1UIGGkX3ud5v0zd
	egkUxyuFIooQJmVRvzH4v0f60qt9SzdDnA/PyIIuMzDLodMFwA9fg5KCToLNwi4+nr3HcAHsGm4
	YeqPz2Tf1qCwAxuzBwa8fE/05QsezQZZPIVId92ajRoHVhNFshQlVV4Iu6ioBAHFwiZC1y+FqBD
	zeQ+JwD7ocio55FdI
X-Received: by 2002:a05:600c:4e93:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49fe66d1097mr122428005e9.8.1790356305537;
        Fri, 25 Sep 2026 10:11:45 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-adc6-9c01-89ae-b145-8960-cf19.310.pool.telefonica.de. [2a02:3100:adc6:9c01:89ae:b145:8960:cf19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a35fb05sm9422346f8f.20.2026.09.25.10.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:11:45 -0700 (PDT)
Date: Fri, 25 Sep 2026 19:11:40 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Justin Chen <justin.chen@broadcom.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: bcmgenet: allocate RX buffers as page fragments
Message-ID: <araqwSZWDYqbPZWa@gmail.com>
References: <20260924101922.2675127-1-nb@tipi-net.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924101922.2675127-1-nb@tipi-net.de>

On Thu, Sep 24, 2026 at 12:19:21PM +0100, Nicolai Buchwitz wrote:
> Fix this and allocate the buffers as page fragments, so the truesize is
> what a packet occupies. 4 KiB pages stay one buffer per page.
> 

Tested-by: Karl Mehltretter <kmehltretter@gmail.com>

I applied this unchanged to current net at 11536ee3d3e0, current net-next at
42a9fb3382fc, and after patches 129 and 130 from 6.18.54-rc1. I tested each
with a 64 KiB arm64 kernel in a custom QEMU Pi 400 model with GENET v5 DMA.

My LLM agent helped me running these tests.

Results with a 524,288-byte receive buffer (repeated over five rounds):

                             Unpatched net   Patched net/net-next
Charge per 512-byte UDP      65,792 bytes    2,624 bytes
Datagrams queued (of 1,000)  7               195
Socket drops                 993             805

Thanks,
Karl
