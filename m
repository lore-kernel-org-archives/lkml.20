Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298825;
	b=LTjHIZw3ev1QforQZGJoowEw//P4wihiHne2IjLL7lHqfAUiXVzf4y6ZiEnn32wyvQ5U
	 95ONyqzkYHI4Trrv7VG10pVivD5Qk6C+D+iX3tEK006hl6AnpGa+1auEA31v6iVfX+lL3
	 5EXp3TGWFb83UF53tljYXfa2L6tkvbzL8ztAgSvnDSV8aAvtJxg8kFJewQ63Jx4/ohIC5
	 ETO30XytqYYLUVW/Ij0EuttFOpO5jV11oWpJNwZjFEazdpfT/6PQ8HqSA12n4AL3HwFFP
	 4AwPMu1d/uQIKxVqFpyNp/FYbC6L1sqV9OCcMfiEablRJH9z+XFeAJY/MeZaQF/Z/uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298825;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ENzz8NZonYwjU0KiLCtNEEw39IJFuXJ/1RaYB2v0MVQ=;
	b=RujwTfZZ6+RgO5JJhizxgtknrjY6DWM8tiiEWLlLHLX855h7aXBS54dXsBMLhuOhn/AH
	 oTua6M7EeXSiXjiEHDhJrFnSXNoiQPFNXJCk0apyW5c0HUSvKxkgq/GFy3V+k2Gy1+Ndt
	 gvBWpEDrnaKzYgiCbASo62NCPOJKrN2SfSCleHr8MiRjnHhNijKc18PFs15ukvTUDjhue
	 uBk+W23aJhRKWybWeZAyX5Lh8i4hD/MImWAmbHWDYrCsybBRXz9kDh6WGsmL36TbChi/S
	 jGG6zltPH8NkYIW3g67u3Dyf22myx1x6z4eJcQfhZEwJi1O92dhbAo6GJ6ClZqkALQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VyRwHcOQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3A7606A31C;
	Tue, 10 Nov 2026 08:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VyRwHcOQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 512E61F008A5;
	Tue, 10 Nov 2026 08:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794298825;
	bh=ENzz8NZonYwjU0KiLCtNEEw39IJFuXJ/1RaYB2v0MVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VyRwHcOQMWzM/IkYaG6CsNhy95wNICdmPOHtQhLPMFxml8vPBcos7oRtKpmbE++Gj
	 tttQPjPKEgHYVkYRvqJ3EirnNw5trvPEYbEkiGiMY/58LuRcOo1A+nQGW6irTwGaYQ
	 0X1BA0Wd4BJgfDaqFGt+jmN8q2JU5rtaDuDJ4A7g+gJj64Vc0GhUe/CMmFwo4EJUBr
	 nttD+sX0q3WHwj6CnsQ+1T8Z/3QN7jA0guEoK5XUwG3AX9VkmJRqQIk7Ntss0DT5DD
	 MzGMVJqE99lj+Fn6Tj1/Qi5cAkoa2Lbtj4F+yLTiuXG/c4/I6Y7H4VBGgmD6XKLlxc
	 j00KKvG+U7dUA==
Date: Tue, 10 Nov 2026 09:20:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gaurav Suman <gauravsuman007@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] dt-bindings: media: i2c: Add ON Semiconductor
 LC898123F40
Message-ID: <20261110-visionary-undetectable-reindeer-9635a4@quoll>
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
 <20261109-sm8150-camera-v1-7-3d2e7b407516@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261109-sm8150-camera-v1-7-3d2e7b407516@gmail.com>

On Mon, Nov 09, 2026 at 10:38:25PM +0000, Gaurav Suman wrote:
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +

And why difference here (which is correct) from all previous patches did
not raise your suspicion? Did you even review the actual code?

Best regards,
Krzysztof

