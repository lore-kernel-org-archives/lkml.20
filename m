Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F8E34A76F;
	Wed, 16 Sep 2026 21:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593529; cv=none; b=cStUvRjYD2PZvMRaXjr8Ecgw9epEp6MNzjiLRHsKCLRDf+fTQ1ZWryYWJeEOfBLzgKhN/5DzL6BgXWIPgb18YWu0i164E1lXIBweMH7vSdY70rxf6yjhbEdgzHcfz5FAvflgBU4WER9Q6UPQuYLTjGGa+03G0SxapSb885fegFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593529; c=relaxed/simple;
	bh=WvAOtNQJWOs/gqFCrMBuTXlMfL+jBY7BIMxfWg4QE0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xr/xBrteV82Bfk98QjjT1NA71bPgioasRthQweigWB9WR+sPziuPskmLn3g5zzuaUmn/fidAbryW+WTAxlIUJLetkdJqhPp0xUMBR62PHypGl/dcXRi9GDjAEYE63nRH3uOY41LRX0tWUCYPSIhQrhqdqo9O8aYHs6tAXVKpBQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDToZh+P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDToZh+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7A81F000FF;
	Wed, 16 Sep 2026 21:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789593515;
	bh=2HWdk/t31/4smzSXtQLjbZsSk1nWBpNERAKtd1eR6u0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JDToZh+POVRHLmwsfpYX5uRwZ3g44RfOVUmoGUxD4BaORLNfRHCLNkZ3XMDo40dSP
	 V8Y5CfSpU0qNBdS8a1zQ3gc4hrfvkzuSbT4Q/THfPWMmSmOlAg9+TXSopiM3J6vPc5
	 h20d/AR/BcrbTWcswYvVMUQHF9AmS29K3LD9BYdpcACzGO4nSVYQhHhF0aUc0Betab
	 to1j9OW8E3dHMfWwhpNoAC6jXFkVJcGoS77BBmMQCujK2tK3dc4mbU2hvlqojFsgi7
	 U+OYcm+iHWN8fm+DZQEJBV8BJvmscTsGZV1PSrdf+aFQ5SUAxX4t39KtYRY83SD3Mj
	 tjeZYoB5U90DA==
Date: Wed, 16 Sep 2026 16:18:33 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Test User <test@example.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] dtc: dt-check-style: Improvements for continued
 properties
Message-ID: <20260916211833.GE1926857-robh@kernel.org>
References: <20260911-dts-style-checker-blank-lines-v1-0-85e779600d98@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-dts-style-checker-blank-lines-v1-0-85e779600d98@oss.qualcomm.com>

On Fri, Sep 11, 2026 at 01:42:03PM +0200, Krzysztof Kozlowski wrote:
> Merging
> =======
> On top of:
> https://patch.msgid.link/20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (2):
>       dtc: dt-check-style: Re-work classifying property continuations
>       dtc: dt-check-style: Handle multiple blank lines in continued properties

Applied, thanks!

Rob
