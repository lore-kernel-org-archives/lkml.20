Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCBB3F411B;
	Fri, 11 Sep 2026 07:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112210; cv=none; b=pO2ufT9/sT4BYEH7RNpjLyYMMAvh2xUGEOh9SHFAgBfDUfkV0kFhnyqkxyzxepyjupTZVk5Mnb1yAF0DouM7xlwUtVlcIgymKrzSb7/HvFkhWzhigvaNpkwhmfsNDW3Ta74Bjk/qNgLvGQo8nHU5g0O4cGX6qT2mYg4M6Kh5qts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112210; c=relaxed/simple;
	bh=AnroKEyqdJQvFOpvOs79z595jN7dadCJbMNEsa6kYew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRcKlu/a7lf7ar+b8dqEIsuYYJlxEs/ATHTZ2ZMc+iJQ4oiANluxbUhUv9X8tfaJ+jVi2PuORQuUEaNznaa8pTDEtMOhGr6U0x2vWx4EVpqg/2mlql3ARDd2cEWOSe581R3pTyu7VRYhY0xblQe7fmkUTi4hSwqQc+CjuMNnHKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCeK6J2L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCeK6J2L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74B31F00893;
	Fri, 11 Sep 2026 07:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789112208;
	bh=7a9YePOnaFH9W0Y5DqstZ8618+Ta51BlMEbNhzPrNtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OCeK6J2LqDCgnJeGGAZqb5qagM06mnJEZGwq0eTmnkQT3suYJsiGNTZRNMu8qi8De
	 5lQXMq/vneH7Ny33rqRaJ9I9NiP4FdqJ6KKxisIxMelbqpjmjEDPQhk/UqS6L8NC1T
	 ENwW87j2Q2ZdMfAuVCCGb3iOEnZd9Bbk1Gjso+igTNCprJjxi05LLZB6Rjqn4rxHD7
	 kXZwm2XnEjfwlpxrJYD4sdoo+ExL7vyPHwa3+ieMTE1KWKJvRPUASs26Mi3i/WZLET
	 twRYqc2L0lGh625eA20uyyJYpAtPpj4LRoNZcNsel2Z6OZ8k9ZIpVkwR3L+ZCww6vN
	 Y75HiNu/MaVWw==
Date: Fri, 11 Sep 2026 09:36:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	German <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: media: Add Sony IMX681
Message-ID: <20260911-wonderful-marvellous-petrel-7dbaf2@quoll>
References: <20260909203717.90605-1-lsa.uz@pm.me>
 <20260909203717.90605-2-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909203717.90605-2-lsa.uz@pm.me>

On Wed, Sep 09, 2026 at 08:37:30PM +0000, Sergey Lebedev wrote:
> The Sony IMX681 is a CMOS image sensor used as the user-facing camera on
> several Microsoft Surface devices. It operates from analog 2.8 V, digital
> 1.05 V and interface 1.8 V supplies, is programmable over I2C, and outputs
> 10-bit Bayer data over a two-lane MIPI CSI-2 D-PHY interface.
> 
> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>

Just remember that "Tested-by" does not apply here.

> ---
>  .../bindings/media/i2c/sony,imx681.yaml       | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
> new file mode 100644
> index 000000000..6d2e4ddce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx681.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX681 CMOS Image Sensor
> +
> +maintainers:
> +  - Andre Gilerson <andre.gilerson@gmail.com>

Andre should ack this.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

