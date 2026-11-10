Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325566;
	b=LM0Tb29TNp8m0n6LW4E1yC6/Aa8/Kk+/e4AiWgeqPxuJtfclMMvnpOFgXc1Wn55ZcOBJ
	 mJeKBW3AtiZmittgawLksXL19bKNMtbM1wFF/3r5SeUId59iKicPZ2tYjU9XJG6hVBQdB
	 Soj6Lo4hy8kcl+t3vXN7J8FAiqyaTUlnALpt8gO9DRgHV4QyhubbnT1b9XzDqJDUOmjT8
	 UjPenNwNPGKC5si8SoTE23UOby4OZUrefiyeGUnosj/N/f+BHxlJ/76CAb0xkhAnB3aSt
	 70xbVoSZEQay8iZSmRfBd5/z93xrKiWKZmQh4ej+bUG72171AVR9tfoIAC2iZkzYH3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=I6jvLVTJ6/L/P1TOo+cN1ccJTZcH95Jo/fx+GgYHa7w=;
	b=B7qOy+y9ykV68UjBiWSg3nGvuECF11z0WsiVjAJ93OBRJD3y6Wt4urtldo9uRRS0r61e
	 j+eex6GTDy3/Fyorlp0+7V/v6qJ/39dMn6LOSHniiDj8ey4cgM4JexjjcTiSfONUNA4QM
	 XFKHqhSFvprRkJN6Of9ISnnK+vF37c6udk+HDgVZG2x/lFrQs0TsaS5kFp0FuzdLy/RoB
	 upBmSaYimkdFnuqa3AIWEoD0ZOOLN169LgXJu+guw93fcqP0Talc88H5Fw106HeNZ53Av
	 A/3PTvjtLZPOpaVn0gVFjINT7VyAPjgAsaXUp21vYRI5ascTl4EllnPKhiY+S/V1J2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="TxW0Z/LW";
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B671A606AB78
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B671A606AB78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TxW0Z/LW
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso918214a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794325565; x=1794930365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I6jvLVTJ6/L/P1TOo+cN1ccJTZcH95Jo/fx+GgYHa7w=;
        b=TxW0Z/LWuMJ4ao/uG9mGPMndIv5WC3u70B6uIi8rUgqnmcROMdn9Sl0bVRAXmI59M4
         /AycfUqZ0pFWfuRkTZyWmAmLqaPNQXOX5W9WGgBiOlmkKsTPL6Sx1k0opbLsIDTni2XS
         CRCzdKwHbXTTEcJCNQ5liJoYpkajPt4r8MVPmNjLlZYQOPAEQggPHOCuZQDTNChULRor
         ahABAHl81KNf9V3L/ToxTodxcpB8GsRxYtHCwuYwsc7ex1IYkms0uwl7+Lwe9BoYdtc9
         NtM3Jj9BI3qZC1OcYx1l9fBWEsd7CSF0dm4d6iGz7gQehCPciPKJyH5cn18rcMALAOQT
         k2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794325565; x=1794930365;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6jvLVTJ6/L/P1TOo+cN1ccJTZcH95Jo/fx+GgYHa7w=;
        b=b+1ho/yzBt9sscgRSqxVTI8rMQ92srFAecYfeiJoZCpEAsSY3NjEetPap3RGNENQt7
         at6Jpvx6mkX41SrotxFnuMbMs+La7J1LRVwiscLggYPsn3qVB5d1fIecSZYYuWbPdUbV
         SbDvq/d2KaFdI9lv1Ldke6ur3NG6MmxdZfKuZuXJ1KnErR1VqTKz3NGjNyDwVV02twoi
         mAQMCKIVJSlZCfqR5Q/BQOVCQDLao/o5OW+n26qblOmyVUHnNyDLWcdGbxoBPuk6SEjj
         utIpUyJNiQffFL4vAmTEa3dQoeWdi8PBcm/3uqsQDSXropi93urqJdaqWFXN3IfdxviZ
         uGUg==
X-Forwarded-Encrypted: i=1; AL+hErH5scf6DhJEFc7uPiI3mrJxCm1stYv3u51RbBZg2sB6HxBj5hphuvKYrapacUnlXNFechOlql6qUWXNtoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EbQcT3gpdEgHfRPE05NXr+FJv85qj9NjVK5OY3QDKbh+vzcXD
	53cS0Lii0hH8xr96xl7n1J/+XKw0icjWhp/EvYUKXbiaTvlqjV8pH/jyoiAVRZ7JYaM=
X-Gm-Gg: AYBFou0kKCWgwgfG504VE63rNBaKHNtRCp6QPKOdtw8+goJcWDw3cXCFnU37I5IOv9k
	N5Fkv3+KhCPgwmugKWek+to0yRbxwANSgwtiyKYzvZcTocGxTe9GkUpWXryfhcEcux+xm1ggGlC
	aH5MD9yYPBw6042FdSy25nzwP7ZY6uA+07s61+TiIbe0baAvaPEAANFnjkRExnix+Yd1dzEBnXY
	uM/DJpzbS+taif9YbvhzyCOQhBdFHmanE4VDzj6D4UmnxW5IEWy844T6kXWh9UYUcCeqAfG4LLk
	kqIs6vrFPV/e9CobD4L4PoWOl0jHVlK48ntAfc6w9C32Wj0+MUoY2CQX9qPiel7zsRGF5URT/oa
	/UhUJIBH2fJ23kKTHQUvhAKH8ngNqw22MUyz30XLw7ZWWLbpT4MNGvAlpPeU1ytsdYL2Ic2Ff7e
	d61FdNNU4/00hJlAPuhBGX9HwkHHZmQCoQcA9QqzrFaBHZo0yIBXynVhamc36j2E5sN3qonMtqe
	ETNGvzU4GF3KW+Q+6GjS/JlnxFmj3UK3WKlnky25GBlg02csda4sNnDhaKtL9nG8Nn6HJSiR7ko
	559aOfzAAx3JjpQLOclLqEcVC/+VQGmrCIq1reerxhkh65C7Xfo0Mg==
X-Received: by 2002:a17:90b:57cf:b0:3b0:b64e:1e34 with SMTP id 98e67ed59e1d1-3b166ce8e72mr3333472a91.51.1794325564896;
        Tue, 10 Nov 2026 07:46:04 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:a917:5683:7f92:9eda])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db2fcfesm325724a91.4.2026.11.10.07.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:46:04 -0800 (PST)
Date: Tue, 10 Nov 2026 09:46:01 -0600
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
Subject: Re: [PATCH RFC v2 04/11] remoteproc: report VIRTIO_F_VERSION_1 for
 non-rproc-specific vdevs
Message-ID: <avM8OYHxB4nAKCnb@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-4-26b300e01c62@valla.it>
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
In-Reply-To: <20261102-remoteproc_virtio_map-v2-4-26b300e01c62@valla.it>

Hi,

I started reviewing this set, making it to this patch.  I will continue tomorrow
but due to the KVM forum later this week, I may not finish before next week.
That said, I applied the first 2 patches so no need to include them in the next
revision.

Thanks,
Mathieu

On Mon, Nov 02, 2026 at 12:26:41AM +0100, Francesco Valla wrote:
> There is currently no way to report the VIRTIO_F_VERSION_1 using the
> resource table alone, as the per-vdev feature array is limited to 32
> bits.
> 
> Considering that the VIRTIO 1.0 specification is now ~10 years old,
> always report the VIRTIO_F_VERSION_1 feature for virtio devices that
> are not specific for remoteproc usage. These latter, which as of today
> are rpmsg and rproc-serial, are excluded to avoid impacting the existing
> usecases, since VIRTIO_F_VERSION_1 changes the semantics of the
> communication (e.g., the configuration space is assumed to be
> little-endian rather than follow the device's endianness).
> 
> While at it, replace BUG_ON() with WARN_ON() and return an appropriate
> error in case of features that would overflow the 32 bits limit.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index c56d3330adfe..f1b362158a9c 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -16,6 +16,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
> +#include <linux/rsc_table.h>
>  #include <linux/virtio.h>
>  #include <linux/virtio_config.h>
>  #include <linux/virtio_ids.h>
> @@ -27,6 +28,11 @@
>  
>  #include "remoteproc_internal.h"
>  
> +static bool rproc_virtio_rsc_vdev_rproc_specific(struct fw_rsc_vdev *rsc)
> +{
> +	return (rsc->id == VIRTIO_ID_RPMSG || rsc->id == VIRTIO_ID_RPROC_SERIAL);
> +}
> +
>  static int copy_dma_range_map(struct device *to, struct device *from)
>  {
>  	const struct bus_dma_region *map = from->dma_range_map, *new_map, *r;
> @@ -268,8 +274,17 @@ static void rproc_virtio_synchronize_cbs(struct virtio_device *vdev)
>  static u64 rproc_virtio_get_features(struct virtio_device *vdev)
>  {
>  	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
> +	u64 features = (u64)rsc->dfeatures;
>  
> -	return rsc->dfeatures;
> +	/*
> +	 * All non-remoteproc-specific virtio devices are assumed to be
> +	 * compliant with virtio specifications 1.x; there is no other method
> +	 * to transmit this capability from the remote processor to the host.
> +	 */
> +	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> +		features |= (1ULL << VIRTIO_F_VERSION_1);
> +
> +	return features;
>  }
>  
>  static void rproc_transport_features(struct virtio_device *vdev)
> @@ -285,6 +300,7 @@ static void rproc_transport_features(struct virtio_device *vdev)
>  static int rproc_virtio_finalize_features(struct virtio_device *vdev)
>  {
>  	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
> +	u64 features;
>  
>  	/* Give virtio_ring a chance to accept features */
>  	vring_transport_features(vdev);
> @@ -292,8 +308,14 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
>  	/* Give virtio_rproc a chance to accept features. */
>  	rproc_transport_features(vdev);
>  
> -	/* Make sure we don't have any features > 32 bits! */
> -	BUG_ON((u32)vdev->features != vdev->features);
> +	/* Make sure we don't have any features > 32 bits except the expected ones. */
> +	features = vdev->features;
> +
> +	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> +		features &= ~(1ULL << VIRTIO_F_VERSION_1);
> +
> +	if (WARN_ON((u32)vdev->features != features))
> +		return -EINVAL;
>  
>  	/*
>  	 * Remember the finalized features of our vdev, and provide it
> 
> -- 
> 2.56.0
> 
