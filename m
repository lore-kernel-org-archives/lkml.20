Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849378;
	b=M2bgaULyrIU1RC9QT0LlQVswaWdPizvU3iaAj2qjlpmDK3UWGrYV/NCdsCufrz4IcQhd
	 DakXy0OoGg+B2scq10+y9fVjpH2EfC7S1aX++Do5dRjuqkewgxQWN8ZoqddRTiNIk0NdF
	 050L3WY5ntDAQ69qcW6GSmWbZqFqd39yg2DuDPcxqVBDSeDcyNwQ5rkfH/GTf5fIkQszj
	 5vER4t2X+ccSEH/YnHH+ZAfvtsu9FuI45Lcri7yxPwsGGVloXYV9duBFar2v7zDWH+rKH
	 9DID48PmPttljATPyZL3HOpGp9csinUOexCyIdLA5otb20LAzAPSHImQo9MGdjjzsOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Bd5KkZtIi9hEU9aTOnohsJP4GtQbznYQgq/LOm2c1XM=;
	b=LJc5Za1NWg5NR6ThgNk1vj8V+lfGOPZGh4JDm0XrxEk459iScNA0Tfad4Aqweb6DZE18
	 ihvA+Epd5sNCbZYp3Kz2rB8hoKjTHYp0Agcg96/7a9882Vsq4cku3psVQpPIgQDYadyt8
	 VCoDqRMKZi6WsEXr96V+NO2ZbkCS2tCHPN2K2KgcmQ/qayKyjhTshPfQvojPvrzLPfcyQ
	 hbpk95AV+ojfoKSsensLXIh1PUgx7v1AJesdP2jAuhCHUvT0O6F9Jp8X596gl/5ege8Sb
	 JuGx02qiFygHTMRSzleLyfLaIGoI4IJGByiYt6AM1dejvc91O3W6Mbkpoh6mh5GsHJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HkMSiR+d;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A585606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A585606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HkMSiR+d
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8c20d68c83fso39495b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794849376; x=1795454176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bd5KkZtIi9hEU9aTOnohsJP4GtQbznYQgq/LOm2c1XM=;
        b=HkMSiR+dksGlcwGZWXhn8RdtxqBYdJQtbxVMvbLI96Ikx2BxI3kJdM8SEHvcYMuweq
         Mg3EHEZsItCRb824lZUmdTkkxwc2OpLow4+0NsHeKkxKzP6xOXIY59In7u3SCoBtPfqY
         BJZM4/S1UARezX28Zhx/rN944CAeFFzwvXAXf0YdLsW6fmthJG+3kSv7zhsrNw6xnVr7
         IJsBWKe+bcNa1RisuddA3+9M9p14aEOUNjmYrYHbT3epecNIi+eb132pbV75ve6d780Q
         PSoRo+KCZDtD9ZU+3rUiMM71agE0dNDUtfWgY4kZCgotc3BWLs8iYy3Abq959FUkwprJ
         9vSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849376; x=1795454176;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bd5KkZtIi9hEU9aTOnohsJP4GtQbznYQgq/LOm2c1XM=;
        b=I6+5jlffMPYq91XQU1I/Ju1sMZ8EZGyyNEPneXCS5Okd6xgOaYJG192+NgHELjJIGP
         cUYNXBD2oPqCgagLJzDhv0ellChEY0vss6sMyQa0MI2lQOMJHYmqZPfVGSrKGJf5Vtsl
         wmuX0PqD5P225FmljnWTSmr/wQJ3XAa36aDNSh1kU6hVXyhgv2KhzebI/kZTSTfb0BeK
         AVP6+fz6O5+bU4etBn544QOTBK9NkBsH/qR7nzrh/9ff9hILHrZ9cvF0jtsrXWz6yROa
         MZ3fEjaCOcTyVY9dxSiiy/HvM169emJeNtUW3UCKqNPqr83WaxXrzjPozKlk7GSDY6gj
         ugEQ==
X-Forwarded-Encrypted: i=1; AL+hErGPcvrTCj0SJxXPRQcOgXHA1/E/O0asnZWfrCjzMdk6GsVJqSUjsS2Jy6dEG7+YM1RSYcAK1GRo4y0cUcA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IHN6sFX+elayzTSGs519yMb4kgLMknfGq8Rme4GCmitzgYOSR
	pE7XhqG2AjE+dHsOGUJOuha2fk65SLwBGJERL30BbQLBwhvpZMurTYoZE6ZwOJu3uj0=
X-Gm-Gg: AYBFou2tW+CD4Ujymc6kIoiuSptlEGtE6SVLJ1CZxcfJzMHalKmPs8P8FfWIgBKtD0z
	qOMVYfmLUhIpwq3zS5IIko5oSLaJoLBNAeX9+O6IJzo7HhO9PbygwMg9IJZJ1IuY+gPHCjJPeIJ
	iXTmHK+aJMH3gL6TqMmXL0KcOjAWclTyA1dXa+TkUmrHz2TZPWNprP52Km2wayy8pnBVkQBac1v
	g3yJTJuOb/ofdzKP9Y+qi16tLjj71aJSHGXwQ8qzhyNziMJXL70TwIQsQAzbkUJv+PMwCjDAqjC
	xINQAJ5X16f57Vnes3n6MwCo/EmCSYAHyyu+1Y8tozidh3TUGUp10eLsaE3Tojlh+xqhZhxZey6
	xO4xshshVMP3K+QBvISuZUoCw0BzKNlgfQQc/VzTKgbCiy7rHwDtguVRdd/c7E8jZ9urXZYa/9B
	zArUCQ2kkrQEDFDJlIeJn1OUIXvzYpkb+Qgen2258+566Ne6kbGJDqRisUllKtb9uts69PIm4LB
	GeCYNU5F/lXF6bT8V0vuQAEI1+xbKTw4fCXJcjgvWzr8b4KbJE+42Vu+pdzjkuDoAa0JXupDRSK
	ZG6baFODl6LqhUT6dLGMmLKSYBhgtux6
X-Received: by 2002:a05:6a21:7a46:b0:3de:71c4:a22b with SMTP id adf61e73a8af0-3fd29c153b2mr84093637.1.1794849376336;
        Mon, 16 Nov 2026 09:16:16 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ea6f:45e1:c614:f10f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a97f9sm3778408b3a.14.2026.11.16.09.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:16:15 -0800 (PST)
Date: Mon, 16 Nov 2026 11:16:13 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 05/11] remoteproc: virtio: report
 VIRTIO_F_ACCESS_PLATFORM when required
Message-ID: <avs6XQpoQmY_MNYx@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-5-26b300e01c62@valla.it>
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
In-Reply-To: <20261102-remoteproc_virtio_map-v2-5-26b300e01c62@valla.it>

On Mon, Nov 02, 2026 at 12:26:42AM +0100, Francesco Valla wrote:
> Depending on the driver originating them, data buffers used for virtio
> communication can either:
> 
>   - already be allocated from the coherent memory area that is
>     accessible by the remote processor; this is the case of
>     remoteproc-specific virtio devices, i.e., rpmsg and rproc-serial;
>   - be allocated from generic kmem, and thus not necessarily accessible
>     directly by the remote processor.
> 
> In the second case, the DMA APIs can be exploited to obtain a
> functional communication, since they will take care of cache maintenance
> and - if required - bounce buffering. The VIRTIO_F_ACCESS_PLATFORM
> feature flag can be used for this purpose: with it set, the virtio
> framework will use the aforementioned DMA APIs to map and unmap buffers.
> 
> Bounce buffering will be transparently used in two cases:
> 
>   - if the buffer address supplied by the virtio driver is not suitable
>     for DMA transfers, or
>   - if the reserved memory associated to the vdev is a
>     restricted-dma-pool; in this case, *all* buffers will be bounced to
>     and from this pool.
> 
> With this support in place, any kind of virtio device can be supported
> through the remoteproc-virtio transport, at least from a data exchange
> standpoint.
> 
> Note that remote processors behind an IOMMU need da == pa for the memory
> region(s) the buffers are allocated from.

I'm not sure to understand the da == pa requirement - can you expand more on
that?

> 
> Existing use cases (e.g., rpmsg and virtio-console) are not impacted as
> they are explicitly excluded.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index f1b362158a9c..1496659ddff9 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -280,9 +280,14 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
>  	 * All non-remoteproc-specific virtio devices are assumed to be
>  	 * compliant with virtio specifications 1.x; there is no other method
>  	 * to transmit this capability from the remote processor to the host.
> +	 *
> +	 * Virtio devices that are specific for remoteproc usage take care on
> +	 * their own to allocate memory from the device's coherent pool; use
> +	 * the DMA APIs for the others through VIRTIO_F_ACCESS_PLATFORM.
>  	 */
>  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> -		features |= (1ULL << VIRTIO_F_VERSION_1);
> +		features |= ((1ULL << VIRTIO_F_VERSION_1) |
> +			     (1ULL << VIRTIO_F_ACCESS_PLATFORM));
>  
>  	return features;
>  }
> @@ -312,7 +317,8 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
>  	features = vdev->features;
>  
>  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> -		features &= ~(1ULL << VIRTIO_F_VERSION_1);
> +		features &= ~((1ULL << VIRTIO_F_VERSION_1) |
> +			      (1ULL << VIRTIO_F_ACCESS_PLATFORM));
>  
>  	if (WARN_ON((u32)vdev->features != features))
>  		return -EINVAL;
> 
> -- 
> 2.56.0
> 
