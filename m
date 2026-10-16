Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBB04E1C7F;
	Fri, 16 Oct 2026 15:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166350; cv=none; b=uXhGnr9IDTRUWe59SLTT9WUy5QuelQlQJ/eyAxm67UoFk6U7IiOH0oFnTCmFSfM61fc77O4hjxgAY6xmIjpChpdBEDJGwcYMRZJpXtn+iiOA/HkK3jur1Ni1wt7GlpFcqov1coqf5wXa/i9k0rj7eqd/BdPJH8l311CLeQcOkN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166350; c=relaxed/simple;
	bh=JZkCUaYNbTjvJWnmmtv9H9MNAuE+gT+Yyx0xOr1Z3h0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KxMDYskhOKGdbAJEJGHgC2VIg3DxsLDMUC5AeBjkn7YGTASLaeAlE+GPpdQmbDLJY/BH1pwMGDKWjSJV7c4msdtBDUvpk0Fdosn/+8uzvVyhqVULJSvDzpmiwp5bP+HyOi02HlnPSUKQQdNiNA5dcTqnnJtmTF3JlxW/2DPG1Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCPYR1rf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCPYR1rf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B8F1F000C4;
	Fri, 16 Oct 2026 15:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792166349;
	bh=YHSmvSRoGh4J5BvFL3E9o6lG/BagsB6+05cLPaRYUy8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HCPYR1rfQwKKl+OfX65tFRzcJC75Wb6PDIe6djP3MycwDxWp1rbve0D4LF4OrQ98Y
	 vCZZj2IEwb5k+e+tejxlHvUdSp32BJYDltdAgAAXBhjJjqhneK/hSDYXpRS4lKRev0
	 Hgoa4FDsA1LwwyRIUnz94caDEBAG9PtKJ2FpkjPUJafzRSdzwZ3XpSrsVpvTkVz91i
	 85hb3MU0JiQXNz1KEyE36pjk4WqdoMM2BEg0XksXD9oGxWGO+lJf9J9kDZLPS+VwR6
	 yxX4WCEMu3RPf+C4mTDeHxBxCwwnhdfmSvmj9fzj5sd/LTz4AgrhNZfzexncsA8tTm
	 iSWpMxU89Ogeg==
Message-ID: <e5d75c47-2051-4b09-9d33-d2eb64a141f5@kernel.org>
Date: Fri, 16 Oct 2026 16:59:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: media: sony,imx681: Allow a C-PHY
 bus
To: geocausa@gmail.com, Sergey Lebedev <lsa.uz@pm.me>,
 Andre Gilerson <andre.gilerson@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015-imx681-x1e-v1-0-fd22f5f3b0c5@gmail.com>
 <tP5-ts7J2p2uA3eoaiQwwAt4gozW7_GQiAxznsXqqGXZ8LQ95eM_ulaspPz3EoTdN6kIUbHAio3TI31qbvjukg==@protonmail.internalid>
 <20261015-imx681-x1e-v1-1-fd22f5f3b0c5@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261015-imx681-x1e-v1-1-fd22f5f3b0c5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2026 22:25, George Neacsu via B4 Relay wrote:
> From: George Neacsu <geocausa@gmail.com>
> 
> On the Surface Pro 11 with a Snapdragon X Elite, the IMX681 reaches the
> CAMSS CSIPHY over one MIPI C-PHY trio rather than over the two D-PHY
> lanes of the Intel model. Let bus-type select C-PHY, and with it a single
> data lane, keeping two D-PHY lanes as the default.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
> ---
>   .../devicetree/bindings/media/i2c/sony,imx681.yaml | 26 ++++++++++++++++++++--
>   1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
> index 62e7eae..51256a7 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
> @@ -14,8 +14,8 @@ description:
>     The Sony IMX681 is a CMOS active pixel image sensor with a square pixel
>     array, used as the user-facing camera on several Microsoft Surface devices.
>     It operates from analog 2.8 V, digital 1.05 V and interface 1.8 V supplies,
> -  is programmable over I2C, and outputs 10-bit Bayer data over a two-lane
> -  MIPI CSI-2 D-PHY interface.
> +  is programmable over I2C, and outputs 10-bit Bayer data over MIPI CSI-2,
> +  either on two D-PHY lanes or on one C-PHY trio.
> 
>   allOf:
>     - $ref: /schemas/media/video-interface-devices.yaml#
> @@ -54,7 +54,14 @@ properties:
>           unevaluatedProperties: false
> 
>           properties:
> +          bus-type:
> +            enum:
> +              - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +              - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +            default: 4
> +
>             data-lanes:
> +            minItems: 1
>               items:
>                 - const: 1
>                 - const: 2
> @@ -63,6 +70,21 @@ properties:
>             - data-lanes
>             - link-frequencies
> 
> +        if:
> +          properties:
> +            bus-type:
> +              const: 1
> +          required:
> +            - bus-type
> +        then:
> +          properties:
> +            data-lanes:
> +              maxItems: 1
> +        else:
> +          properties:
> +            data-lanes:
> +              minItems: 2
> +

I think you should constrain the existing minItems for DPHY mode and 
then add CPHY on top of it.

Your commit log says Add CPHY mode but then it goes on to do other 
things like this.

Break the two things up into different patches.

>       required:
>         - endpoint
> 
> 
> --
> 2.53.0

---
bod
