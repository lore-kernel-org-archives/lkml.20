Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E444E55C31B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091638; cv=none; b=i+lCwUo9GMCf9/PykvNDXsdr6jZh1rIObombP1SBqzu/bhvShmDJB4O3u93bxhc/4cV0Hm/Jdp12w86lI5YvBTHS1Y25ZM3qIEGbRhXFhQHUaiq4MPtQhFSYOTP6hgHHSN+wyuBIYVUNjYtm6Ahj45ErXOqoHH31UAf7DtbLR0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091638; c=relaxed/simple;
	bh=983PoGRnItfbcGLq9/2KSAqK/+R/CY53c2rZGuZ7b1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNoEVOkdyyhLwLsjr1HZPzFUOyJbBF1oI+Up4epKLvJk/uZi8sn2bXkS38IfH1rRwigssXvK29XfjMBPuB0CUCNOyWunQg+20aScSIgcTI0F58f9CnB6YWfcFMwYjc1EklztnRcoXXV3IirgtNbr79OLKMaZMLAiIHK3u3dcGzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TmSwgIDT; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TmSwgIDT"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-868b2e5be4eso14702b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790091635; x=1790696435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2HjM704yjUPc3oYEkUo0s9e3MpU0+mzXloxkK4JXLZM=;
        b=TmSwgIDTNxrv/ArInFd1UDSm3liM+/JTtbsK9UCnhipd6SD3R6CHvF0GwJtfKYtFJ2
         /YAqGrJhHkeiN/n+ZId9wZb8MVdg6JBhtX9RYnBUexHdQ99eA+tynxqcDfpMQscHNcPV
         JtCujN4//PLKCsQEko5817TlF14iopig5ESjT+8xa+HEQBmPNwJ3I4+P8JxcDIpm6kKS
         huMDplf+SR+qRF9OT0sqLAt9sqVOzwh8bETHKHIdnPjrEb8D0qRCVZDAAN2hNqVWi190
         d82tzygq22iHwRTpK7BNKjjjn8AVAPSj8g/vynUl2nS1OBbJpIZWF/cRajQB2VQ1DB38
         C/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091635; x=1790696435;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2HjM704yjUPc3oYEkUo0s9e3MpU0+mzXloxkK4JXLZM=;
        b=ZJBrmBoEeJszJW+tB73GdVNVpe9NuHkUxEzypWCGm3PjwbMP6OrXJpWvpOyoGGNiA+
         2vTbfmxWwF5BEBY58/pyws/HFopVpDEKJsMDkA9S/F2TpGWHjQ+1Y5xuy1lqWmQYvvDP
         Vp2ffF3cZS1Rjjjqj5tKZzYhnXQz4U90UnbJwMKxurqTqhfZrD7sseYsi/MElN8gezOz
         A9L+xI0pENbFSxPSR3HsL+oNm0u2chdIb33G86PUQzvvqffj0kcKPcvNCBdF9e+jAGT6
         A+C+xQPb7D3REUUUcEFsbBaLYXaIlhU4ARSn7DKKDbPNozqNkNbsaeUx8qb2FP/EVXHi
         Q44g==
X-Forwarded-Encrypted: i=1; AKwUvBy4LXB5T4hbPJXiTb8UZO6P36LoJS6rIlKiGGfboOhCR3CkxKYmtVX/RKnHTU5qUTZKcBAUv1/0vHXgQKM=@vger.kernel.org
X-Gm-Message-State: AFuF++n9EqbHihl7EycqgTsfCSKyyIZB480Mmt9v0xphi2OTo3Ns7j17
	Z25uGqk5ynatY77TJ9gmOlEI+mU9zYsZ8K/f/YbOl9eQWaO+/Sg3vIZz0owsnI4n2c8=
X-Gm-Gg: AYBFou3XH3LDf9OHPOuyJq4QLZXslwJrNUYDudgQKfaOUAR4KAveTuSs75IGhWKfkcY
	/4tm/bq6ZiZsQrQWhP1pK/5fgrSA2603U6ZvyoLcKAXpT6zIUdli/E0hBmFaygHaME3seUU3UF+
	cRt62734kZ7cfNraPo1Raz51yMdd3FBDfzZjiD1C8rvYW+53Pa0UNboVFCfcU6Bm5ur1I4D+YFX
	zRv6DBpH1yKn3JWLxQKzkem+yWOuA/uWPPJlblzSYZqVmUdY8KHirJP9SFzA1jy46tK8LX+ncil
	AypHvphFLnlvd+UEYyTmwEGFkQvM0tP0uwhU/H4ck+LJm9PQKWImsUiTForsDg/W0HdoAJFsDwn
	Y9PUNOeBDLCWqkwl55gQ6DdGF/uPfO6SwRKPJc/DEZL/kFasMh0PnSsmNcEVy/o+ceVqKRLbnbE
	OFzg4nXYJJmDaT32fcND3sgCF2Zr5O4nb4741NyAndRTYbfASgxzvTGj/moXd/8LXFwPmfpVH5
X-Received: by 2002:a05:6a00:1393:b0:85b:8606:627f with SMTP id d2e1a72fcca58-87c82f7f151mr1827877b3a.26.1790091635190;
        Tue, 22 Sep 2026 08:40:35 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1046:ab8:737c:d2e2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c2fc4b581sm1104255b3a.7.2026.09.22.08.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:40:34 -0700 (PDT)
Date: Tue, 22 Sep 2026 09:40:31 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	imx@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 08/12] dt-bindings: remoteproc: add remoteproc-virtio
Message-ID: <arKhbxi3Snbt1_Mn@p14s>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>

On Wed, Sep 16, 2026 at 11:10:53PM +0200, Francesco Valla wrote:
> Add a new binding to describe remoteproc-provided virtio devices; while
> these are discovered through a resource table parsed by the remoteproc
> infrastructure at runtime, their description can be needed to probe
> non-discoverable buses (such as I2C) or to link consumers and suppliers.
> 
> Each vdev is described by a dedicated "group" node, which then includes
> a virtio-device node, which binding is already existent and used by
> virtio-mmio. Each vdev shall be stattically linked to a "group" node
> using its index inside the resource table as the reg property of the
> node; this permits to have multiple instances of the same type of
> device.
> 
> The binding is intended to be generic and adopted by any remoteproc
> provider.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  .../bindings/remoteproc/remoteproc-virtio.yaml     | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> new file mode 100644
> index 000000000000..c4a0d84b1460
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Virtio devices over remoteproc
> +
> +description: |
> +  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
> +  and its resource table. For some of them, a device tree node might be needed
> +  to describe remote undiscoverable hardware and/or connect consumers and
> +  providers.
> +
> +maintainers:
> +  - Francesco Valla <francesco@valla.it>
> +
> +properties:
> +  virtio:
> +    description: Contains a group of Virtio devices exposed by the remoteproc.
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      "^vdev@[0-9a-f]+$":
> +        type: object
> +
> +        properties:
> +          reg:
> +            description: Virtio device index inside the resource table.
> +            maxItems: 1
> +
> +        additionalProperties:
> +          type: object
> +          $ref: /schemas/virtio/virtio-device.yaml
> +          maxItems: 1
> +
> +        required:
> +          - reg
> +
> +    additionalProperties: false
> +
> +    required:
> +      - '#address-cells'
> +      - '#size-cells'
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    remoteproc-cm33 {
> +      virtio {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          vdev@0 {
> +              reg = <0>;
> +

Do we need the 'reg' since we already have vdev@X?  I'll let the DT people
provide their input on this.

> +              gpio {
> +                  compatible = "virtio,device29";
> +
> +                  gpio-controller;
> +                  #gpio-cells = <2>;
> +              };
> +          };
> +
> +          vdev@1 {
> +              reg = <1>;
> +
> +              i2c {
> +                  compatible = "virtio,device22";
> +
> +                  #address-cells = <1>;
> +                  #size-cells = <0>;
> +
> +                  eeprom@50 {
> +                      compatible = "atmel,24c1025";
> +                      reg = <0x50>;
> +                  };

The previous patch introduced bindings for virtio SPI while the above two are
for GPIO and I2c, which is very confusing.  I suggest you pick one and apply
everywhere.

> +              };
> +          };
> +      };
> +    };
> +...
> 
> -- 
> 2.55.0
> 
