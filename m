Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A494A387A;
	Thu, 15 Oct 2026 20:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792095461; cv=none; b=Ya32R0Em8qfB8K9nHL5hWh3Nz/yuYT+AOKaAULI2ZBVj/5BMloVtAWqU9iaFx3TnzKBDHOPA90B16ZiOODC3CTOTFhhxpdeSu1aCMbCJyEPVXjQCGUvuiofx1nImaYWIpuGD9xuoo0GUqiliXvznAtzuH1g0s38ondMAiOqREKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792095461; c=relaxed/simple;
	bh=1csYnh8NJNkq6uRZqlYEK9ZmrxncKaIr7ge1zJ7f/MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxx9IqN7nmXYl33vShXMDdXG6S5acye15txzWC2pjNz6gS6mxNObjHxAhgpv5/Szu0n0pTKIhwLF94D8dZcjxEOIrA9V7v5BiPG2hJTl26pebZAj5Fr/IPq6w9kuE7691vRRdC+DYleNfJU4/xKjvsSPo4lZ/939ubLQ8OanyVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nhbj4LGM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nhbj4LGM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5B81F000C4;
	Thu, 15 Oct 2026 20:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792095460;
	bh=z7MWpo4yUfswYEg3QkBO+6xOC6XoabSR4y0LBHpKx6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nhbj4LGM27km89n5hLEeuMFX57KDu85e0nQ95I6ATW6nLLjC4+5Eu9ai2gscQG59k
	 gNCpMWRj1B6zSNOAyC/3/m26UjBk6lDHTrO5PFW35FVYCwFfIjjzgT/raYHOBr2NlB
	 jCDYwhvfguqn2gSeN4CH12ZjgCsRDNzcpom4f6klcrEVsoXJ2ekhcLk+WZjfrYt1zN
	 7Y+jjy/4XskdRDOASOatbuU/s6CK05sU85gnhujM00muzK5V3mNkDEWY1NkPwoMDWt
	 FM6jyOwOudVXcWQSurHWrWt6yw/KX4KhMcjHQ0yVu3SdePu3LfkR5SZufNTzB9f9ZH
	 NMC7qfKKbHbOQ==
Date: Thu, 15 Oct 2026 15:17:37 -0500
From: Rob Herring <robh@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 10/16] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
Message-ID: <20261015201737.GA2917324-robh@kernel.org>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
 <20261015-media-starvis2-v4-10-75fcdb4163f3@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-media-starvis2-v4-10-75fcdb4163f3@raspberrypi.com>

On Thu, Oct 15, 2026 at 04:57:36PM +0100, Dave Stevenson wrote:
> There are multiple members of the Sony Starvis 2 image sensor family
> that have the same hardware requirements as imx678.
> Add them as options to the imx678 binding, rather than duplicating it.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx678.yaml | 38 ++++++++++++++++++----
>  1 file changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> index 098f72544216..027872a134f2 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> @@ -5,7 +5,7 @@
>  $id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Sony IMX678 Sensor
> +title: Sony IMX678 and Starvis 2 Sensors
>  
>  maintainers:
>    - Jai Luthra <jai.luthra@ideasonboard.com>
> @@ -13,21 +13,47 @@ maintainers:
>  description:
>    Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
>    image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.
> +  It is part of the Starvis 2 family of sensors.
> +  Other members of the Starvis 2 have the same hardware requirements, and
> +  therefore share this binding.

If you want paragraphs, you need '>' modifier and blank line between 
paragraphs.

Rob

