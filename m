Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792999475;
	b=y1p/BvmzVrjke2WLWGEXIul/UiY/LuRLLwy6IiBMcl6rPucEtWAyelIeY3WQrmSNqOjk
	 0hNoEOXowM5B3tivTtEarM7pghoE8qyqjPuE3UkZ6MJMaUowwNG8tbZLvcqFP9QeT+7rq
	 lSNbALlbeZfXKGkNVrYy1jdXZrtFYcY2R4gI3gfViXgvHc3IrQK+5LQTAvOkX5tLvcRne
	 KknxV6DDLLqgou7xtM6dO5XWQYiYFGiEkbFy2z+51Z3zVG5118ozwoZH0+wqpOiXtxcNy
	 j8KHZoVMFOEZPxaWPeRRfkS1zHjbrfiYMNcj/9vEVlssRyCNBdCqYsDHYKvj6P+Utnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792999475;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=DNtf8N62TZAs0/m8oPs56srsuiRIll36IGkpT7NfcBc=;
	b=Gq9c5Le139P9Fce4SK7NWY4gPsb9Mcoitv8DPuzd4ztG2vuj0zVIEeQPhct6tNj5uqte
	 ZIbZRh3+AWsPrjL7g7SaVNtcwe+I6qs/pszi+PX8x/+nOR5PvKql8qJhpebVRcof7lEUu
	 HB/b6ON84ASD18WWqDQ6xUgEc6vup53vJ8vBNN36qtKRjW+Mv+J+kzwpkO8dcJNPBHmMX
	 hxxQINxNNLyIIHlBxhKNkSaIW7T6muqhelMDyfWri5SrM6BC6MkCekDlu3dAxUgYAr7n3
	 Zw9jColqwdIFSwXnNwydPmwDpw99w5FYCpXEvlAtx4bf+ucDtxmWfOBZBGhL8W5IcAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JFdSkP2i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E64606A329;
	Mon, 26 Oct 2026 07:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JFdSkP2i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5771D1F01828;
	Mon, 26 Oct 2026 07:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792999474;
	bh=DNtf8N62TZAs0/m8oPs56srsuiRIll36IGkpT7NfcBc=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=JFdSkP2iJW1pKifnLD+AH6i+fYSVMDcxRgQAM6vb2VRjR1fVJm/h49dYoc4CAho3m
	 +6hS00ne+kGCLB5y8Q2Ic0jIzEgsWDG+87nZFJVq+8Cu+VYbTLjFxsS1ZXFC3I+d5D
	 WdrQUgUKgBK7rw9t0eZB4uuFyM9CidllWJbKC+XUHqDTRab2Gel7BLawvm99eBh9xT
	 3l5ySg7QNGuK9KG0nnffjAFs+3hO+JhjLlkATId7f5FsBZDbZVVMZgeHqqpst0+0WZ
	 J4tEp+aT/meZ2z0PTxrrpeLBoE7suYdH4iwJ4IYRuj5efaS8VO17lB2oWaZvoixjD5
	 hJJO1XxPHCysA==
Message-ID: <e123e765-fdf7-418c-b8cf-e814a80c2488@kernel.org>
Date: Mon, 26 Oct 2026 08:24:26 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sitronix/st7571-spi: Add support for ST75156
 controller
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lars Rask <lars.rask@axis.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@axis.com
References: <20261022-add_st75156_support-v1-0-582525a39a39@axis.com>
 <20261022-add_st75156_support-v1-1-582525a39a39@axis.com>
 <20261026-dancing-beneficial-tuatara-d70263@quoll>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261026-dancing-beneficial-tuatara-d70263@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/10/2026 08:23, Krzysztof Kozlowski wrote:
> On Thu, Oct 22, 2026 at 05:31:05PM +0200, Lars Rask wrote:
>> +
>>  static int st7571_spi_probe(struct spi_device *spi)
>>  {
>>  	struct st7571_device *st7571;
>>  	struct regmap *regmap;
>> +	struct spi_device_data *spi_data;
>> +
>> +	spi_data = devm_kzalloc(&spi->dev, sizeof(*spi_data), GFP_KERNEL);
>> +	if (IS_ERR(spi_data))
>> +		return dev_err_probe(&spi->dev, PTR_ERR(regmap),
>> +				     "Failed to initialize spi data\n");
> 
> I do not see how you initialize spi data here, so this is just incorrect
> error message. Regardless, driver NEVER prints error messages for
> allocation.
> 

... and you have there obvious build warning. Don't copy-paste code.

Best regards,
Krzysztof
