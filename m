Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298419;
	b=AtF8pmaLFgPiQnqLVcgkrQH129OCuCh4xwRDBusiuBqvyHy8lkX8l0E1tqwqYvJAYoHK
	 AidCKy7kTRB0UrhFvv22bZiGc2eznw1sxC1aEGgnnH319KkER+p0evDbK9NCcgfFKNJO3
	 hU2oUf0sw+lcNIBcy8h8hZ4u0KVFKep3b3NJv0CBjU84sb0QKIqELhViCgDkSOf3C1ql3
	 fhYQ7bvyX/jFdEtBluz8XRCmzAt0d9olRLToKQnAaytaBMhg7pyC7faqDnMZH1N+GdXzA
	 sDGSzkl5gbSUKTFKQpcs3U6Br7NbhflcFz4tzhZaPbDD2hNmnFJhF/yzeMZnDn54hQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298419;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WyWgG8alvAiP6dZN+wnkNn50hQMCgufqPB6nftMdjyo=;
	b=wk/zCAkuWZoNxrVTAZoNBE52Zt8y3LRNhI1cNO7pfLUfrGRB9beQoy2D+Ox0cWLq8FHH
	 Fpk0A4QTXL5AVJe7FtTtojRIt8IPdGK1CrZaW3IL4ZieUeFs/u+DCHigMmKgJhnXGJiCr
	 nTiFaV9tZqYx8hhvlJ8GYKajbyy2+8ICD2vXNB4D/cIptXVHYuoXJsP1AVEk1vGa7+cNt
	 CAy4Us7+sGhUeZ8rpy/Cyxut/i3L+s7Z+D6cLq8g88stGhz/jbXYN2//8MM1sQmDei5UB
	 aivYX6fC71nNPuH5e/KdZ3dOX9Jrxqn0nW+8ysZD9ln7Zj14XmHVpyZZGSGzqlo5N4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPy1ZHCK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D714606A31C;
	Tue, 10 Nov 2026 08:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPy1ZHCK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6DD1F0089F;
	Tue, 10 Nov 2026 08:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794298418;
	bh=WyWgG8alvAiP6dZN+wnkNn50hQMCgufqPB6nftMdjyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XPy1ZHCKJRLqtlLI6aImqc+y39MOGlJHA+qmVcX5jeg0hnbFd5dQluJ6vbQRqtP1v
	 iMPMjr4aJ0UjdviT4220uT8k7AcIRi4cEpvxLbpjWDLhQDL/MLsF2xCASCN15wwwhH
	 U3LjWJrv3Axn4Y4ffbi3Xo4Ip+VdOJDceQLiSAMVGH7LS7ufpo1mZOPaHvdxiuus/0
	 mAoowkNHE9REYIXEHYnCXwGWrK+oh1q3f2kBAGtVzF5/OspgxLxNSn8NO9JHZp4/78
	 twsENThxPLigbaQTNv61fK30aS7wCANhyfHQdl6s3OYX0tS9oSBxMOvQfcZ4MeAWFG
	 zGEO39lSWxgpA==
Date: Tue, 10 Nov 2026 09:13:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gaurav Suman <gauravsuman007@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: media: Add qcom,sm8150-camss
Message-ID: <20261110-fictional-jolly-kestrel-4e4c11@quoll>
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
 <20261109-sm8150-camera-v1-1-3d2e7b407516@gmail.com>
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
In-Reply-To: <20261109-sm8150-camera-v1-1-3d2e7b407516@gmail.com>

On Mon, Nov 09, 2026 at 10:38:19PM +0000, Gaurav Suman wrote:
> Add bindings for the camera subsystem on the Qualcomm SM8150
> (Titan 175): four CSIPHYs, two CSIDs and two VFEs, plus two lite
> CSID/VFE pairs. Like the SDM670 binding, only the CAMSS core blocks
> are described.
> 
> SM8150's camera clock controller has no SOC_AHB branch clock; the
> slow AHB clock source is listed instead, as the downstream driver
> does.
> 
> This was written and tested with the help of an AI coding assistant
> (Claude Opus 5.5, Anthropic); I reviewed the change and the results.
> 
> Signed-off-by: Gaurav Suman <gauravsuman007@gmail.com>

It seems you are repeating existing work (see lore.kernel.org).

Dropping.

Best regards,
Krzysztof

