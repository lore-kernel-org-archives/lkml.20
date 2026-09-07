Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BEC411693;
	Mon,  7 Sep 2026 08:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771441; cv=none; b=acJMJV3jgd/4APxmbf1O0MNVGNY4ey2hABd0tVQ7aSct9Hp5o3+Uw9raLx4Nl4T7Gcu+ab2xXvZBqQth+hY4wRO+Z46bPILOttYTI7uwblEFCGE03kX/GzohVcTl3HL4tPI0SM3LVqaFJOk/FcIsH36ONiRs87kydwpwGxDJvng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771441; c=relaxed/simple;
	bh=LmpNtm7UKcqpqfBlpXstB9HQ6K8r676WP44Et/ZufDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7IIhtGSLGZHs6kONNuJfoqGdSrLbTHIV1lTv0x07XYT/Lqak6Xr/27YLK6Ue7thmxaST64n0ZCD8CmO5cKBqODqNHUeGJhgHTZ6s9zqDSWTUu0FZjbtKT/wPfvNcczvpx0mkUdlq6koLHbQhmFb5sI8OklzH98+1MexIOFTa4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHqj+Zb2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHqj+Zb2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034561F00A3A;
	Mon,  7 Sep 2026 08:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788771439;
	bh=AMPM1yZHFzG6EjCvtkpbe8MOIkMaHAfMvIR2rnpmnj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dHqj+Zb2MdJPMi8/84owM3B/yAt995hHE7xSLXucrHYa5Zry6ir0GbW4jQ+V3ccNx
	 PGKsuQJvh0uv715A39YqibiAclKYa/YPe52LYY5BQTVbjFMjW0qhZ0KDzsTZsApzvD
	 A4+D8sfi3TQ8BRmxH3n6LReBf7yl8Uu94DHVt29HpAcTPYDHj498O6pYfXeOx3eEHI
	 v55dHO9sEwmdKTQzsGDnALgYGSTKVI2PC0zxskrmQ15vTAxilhjdBC6Kd+O0AUQVWt
	 q96UWj88Xeo2pylPsBNpNNc7lPhYZs1kurBVLTSVILSowtm071fj34dXLjDFpXYVZO
	 73mVqczxILYIw==
Date: Mon, 7 Sep 2026 10:57:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: amlogic: add Xiaomi Mi Box 4
Message-ID: <20260907-cryptic-macho-pronghorn-b6ac16@quoll>
References: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v3-1-1a8e395d923c@stu.hqu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260903-mibox4-dt-v3-1-1a8e395d923c@stu.hqu.edu.cn>

On Thu, Sep 03, 2026 at 06:18:45PM +0800, YuChia-Kan wrote:
> Add the Xiaomi Mi Box 4 (MDZ-21-AA), based on the Amlogic S905L
> SoC, to the list of supported Amlogic boards.
> 
> Signed-off-by: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

