Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333328;
	b=tLAFL8vSnKhX78bALwVTB0j+FkAcnlHf6q3Tw2/vCV8HIHlnCUx6h+Mopd/YVGf60N+g
	 XTOV2FtqlMbTkHAmtDmx0xtmMz0VWmhymPYs7vzvDT99lzAHBOJX+TRqLr3NWX6fpT3L1
	 Q80x8P4QlXSIYynzaQcEeuu7Ik9wCb9sLw/zj0s10bBqczkEDqe+BmV9sOs7P+5TU+5L2
	 9KECYOuGHcv/BcB+HbmHjDT0vxc3eIETr4sJSWRMpDUKkJC9hUuk+0NhkkRRMVhHOUeC8
	 DeYfzPDUVqzXiN8I+dZh0r1n62C1ElRGkjRql7yWuvgQjYYporSq5BEXkp8dp8u77FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2oyZPxVsUGR3lEqjPv6CqcgMqDvTEtbVpGv2X19Zzdk=;
	b=ApiZ+51Can7ntwoqfjVZuScVZRzFACvq6dDBV/vwBVzlj9qHK4IXjVksLmYsNBD9myo0
	 Rtevu5vDZrfhfmUIenaxPKwHkY/r5WdnvICbru8usmNU59WdnNNYkmk38keaFFQmyGwAJ
	 8MUKfNpshGY8l6vzvt7Y7LIWbmxd0txBExE3olwi3puQTb/b005FFYlRQTsZymK3TuwWX
	 vAlXEMBVV/3tirG142azOuZIQoeMggtCMMSkV8av0hyU/tLN5Fym8cmlgNAWZkZmeK34N
	 pckrTgZqPhAaRubIwo81nABE3NGkADJw6YAxliP2kNahAVIJ3HSd+V9QCaKyj1z5YfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=guW+sKpx;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50667606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50667606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=guW+sKpx
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a18fc7a38so840550eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793333326; x=1793938126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2oyZPxVsUGR3lEqjPv6CqcgMqDvTEtbVpGv2X19Zzdk=;
        b=guW+sKpxxfru+jvDWjH7g+qClU0xEqlqQcz5Pf3hUGUYWFWaVdN2oIl46Robhpbyvk
         /xnqjDS8NMAmztXaC7ZgmOHSYfgsJY0iGP/KLp7bVEfqPOrT+sXL+aTzANB5jmgzLlm3
         VqHHDIMBiO3whPYPQFc1PI8Gw+l7cmFKFew23G6tgwi6UIgjrPI44CCZvN+SljLZsLcy
         RYGMxM61G1/CN6XNkehX8GzNpcJpaacyiFc74bUWlYmj1+Jv7Em/9b3Kvg5TSp7KLo3f
         A/DE4ft81r6pLaWULoiLhA6+Ig2TUsvA5T2q1YVhuNm+3gA2aBOZMM96ZjHlbo36HpqW
         D2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333326; x=1793938126;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2oyZPxVsUGR3lEqjPv6CqcgMqDvTEtbVpGv2X19Zzdk=;
        b=ooJv5FjOIIVcuRXJ6LRPtZ0j97yOCDHIiHPtCmDW76LgO9E5QZkN6vvL8tA9xrLwAt
         TZSNp5mQ4c04Nu0yQnENYrjN5hlumuTnCBXndba/gz5iwqev5YnqAxkQdCQnqaZE0Yx3
         cJ534JOrTHw/YZoqTE1gQj14V62ZonM5e/VrpWpwfFz6amg34yTZD3UkQacPd6R/XV2B
         9rEgVc8HyWgFm7IwIXZna+fJ2La7M3f31htwe8HGIBL6OwEe8hBHfq0y/XcmKHsKgAUj
         yhiuit75wp/MO+eTnpRXdIXDB15IVV6YrrgH0Yzjt2RzvIyIgScpbJIU+w3e+xschy9I
         qWLA==
X-Forwarded-Encrypted: i=1; AKwUvBxaZPmxmmamwiUyv44LU3eHLFo8Z+/PteSnMprjy2h50az62EOg9ZB+eYTt9s05LkbEVMGCosVLzkJzyBo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAKSSOAJBLa6sCMq8gJ7au61BF8CJZjidTLq3HnZh0XzyUZguW
	A764Hgwl8pkS3ZT5eq80z/nC7m/A3CpV/spBSuNFVooEcUbnioRtncXZI3SdMFMCzwI=
X-Gm-Gg: AYBFou3YOALtIlqS25CNEXvLs5H4EyOu/pGAZNDxzfghQbh9uMVCIMUf0E/oxptl6Vt
	mBrzddjd494f1fVucCnm16aJKE80T+SePReNX4mF80VRlQjFI1ZcInvpI/mK4FBxzk7Mx79aaKO
	5x5FQi2sNFl4HRX7FIJifUUREOnnZo2seKqyaXy3o/qukXomc8B/QxL1GDJhaZO4zJOERftTka5
	pByYwGJUIHLslyxZKqO3wxCUI9aG8ZzjhkCEmoUxfe0wZEMGgGydHcmN5GVWm4XFRyXjD2Y+HTh
	esBm1CTQIBYTM/ipALdQmS05USDqG5E6WGQYNcVjHdSDHyOYa3JGNlu52c2UMsCONdQGrno7pZj
	9CeVZ+HAj0H4fj2m818MFuaPgu5NWS66usV50aL/RJVR6kVkWg5G1aakkLHT/eCJ0sujWH43wbE
	sZ8bxMUZD0WDgiP7AaT06P9VlrjGl1rZKIEVtpx+SQg7e5ItGvJTX/9Rwk7ZIZbdeQk7LVxxw5H
	d3RKPEbI38Ig+1hUsDDr3pqGCfOqJvcllgFgZHci5YJK60bGjNXhxOcxQnaCrnXfFDMuPzSLBXw
	Jp6pQdgk+KiS31ZXpMv+fDwFAwZdM4a6i/Y4rfaPWV2wIdfHyVaW
X-Received: by 2002:a05:7300:a9f:b0:369:fb01:2eb7 with SMTP id 5a478bee46e88-36a4235f45emr1732875eec.13.1793333326139;
        Thu, 29 Oct 2026 21:08:46 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm3272988eec.8.2026.10.29.21.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:08:45 -0700 (PDT)
Date: Fri, 30 Oct 2026 09:38:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haixu Cui <quic_haixcui@quicinc.com>,
	Jason Wang <jasowangio@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] Add devicetree bindings and maintainer for
 spi-virtio
Message-ID: <auQYSv2ad5WJSHdI@vireshk-B250M-D3H>
References: <20261029-spi-virtio-bindings-v3-0-ef30217abefd@valla.it>
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
In-Reply-To: <20261029-spi-virtio-bindings-v3-0-ef30217abefd@valla.it>

On 29-10-26, 17:27, Francesco Valla wrote:
> When a virtio transport exposes a non-discoverable bus, the devicetree
> can be used to declare its child devices (if any) and/or other
> properties. To allow for that, the virtio framework searches for a node
> with a suitable compatible in virtio_device_of_init() when registering
> a device [1]; such compatible takes the form "virtio,deviceXX", where
> XX is the hexadecimal representation of the virtio device ID as defined
> by the virtio specification.
> 
> This patchset thus does not introduce a new functionality, but allows
> proper validation of nodes tied to spi-virtio devices, aligning SPI to
> what is already being done for e.g. I2C and GPIO virtio devices.
> It was sent initially as part of a different patchset [2], but since it
> complements a functionality that is de-facto already there and is useful
> beyond that specific use case it was sent separately (also following the
> maintainer's feedback there to separate it from remoteproc-specific
> changes).
> 
> This was tested both with virtio-mmio using qemu-system-aarch64 and with
> remoteproc-virtio with a Zephyr backend (with relevant remoteproc-virtio
> parts still not upstreamed - see [2]).
> 
> On top of that, I added myself as maintainer for the spi-virtio driver,
> since the former maintainer's e-mail bounces back and its owner (Haixu
> Cui) did not update it after changing employment.
> 
> Thank you!
> 
> Regards,
> Francesco
> 
> [1] https://elixir.bootlin.com/linux/v7.2.8/source/drivers/virtio/virtio.c#L488
> [2] https://lore.kernel.org/linux-remoteproc/20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it/
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
> Changes in v3:
> - Add Francesco as Maintainer of the spi-virtio driver (instead of
>   Reviewer) as replacement for the former maintainer (Haixu Cui).
> - Link to v2: https://patch.msgid.link/20261027-spi-virtio-bindings-v2-0-67927b24b9d4@valla.it

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
