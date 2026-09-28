Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA1E377AB3;
	Mon, 28 Sep 2026 18:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618862; cv=none; b=sk9lwbjCNhDfgyH6nxqubCDllNIshwbLqACuyiCy+72r1X1QA+GL82XDLLPC/RKhLfuYRLtHLLFl/0gOpnUnfDV+PaDMNtwBLBV4j4eFksifTiLiS0B42ZjVyorxYHb1xZrqURQoFmF5CqaZVgOHOSIZqprU8Qo7ponoV3epLnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618862; c=relaxed/simple;
	bh=896+lA3UytYPCLbkUZKj2uz1VlT7Rix0leA5YRM0Irg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4ZtrHEBLZSEHGdyHK9hOxENDosuEp3Q8B4sEWC7S+JaSdEKWhi2jmknIwowveF7b2M37FCojI5PTHaSbRb3uVjbVB98XS9Cd6xZZ6asEpqXHlkty1H1ngu59MLg29TB36QfXvBz/q/fky5WoKethr/UoxA1f+C7jCZwEsKMzkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9XcudAT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9XcudAT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BEB1F000FF;
	Mon, 28 Sep 2026 18:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790618861;
	bh=cMvGUI5cU3kfbw3YsxICXP5KybzlGFN2Dgqvultvh30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c9XcudATYAT8NcSMFwZuwbQQNidSplhH5RKB9Q+/yMDxBV3lvOQgaHDQfH0ahDahn
	 vH1r6riKDuHBj3WQbG9pklKQc5cDs3OIe6rTZQep/lJv5iRh7eJSmE1yQalkNQc0Eb
	 4DRf3D1P79/b9qCQY3FqPqIB2qkxPlzl/NzM0/SLCzESeKfcE+OUGty9ss+j7JL0zO
	 uBfNZU29rzlTPzvsMQmokNKsxYIvPyQ9KstzDSuvvmurT1a+lkekz6i9Ow56ubNei5
	 93jT/d/2qp2KqUNKaSl/S2iCCJO5Vqc2iAUlQcy6qHEOU7JeAlKAcN8AzSvRCU6tJw
	 r/62kYFAAvfmQ==
Date: Mon, 28 Sep 2026 13:07:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Minnekhanov <alexeymin@minlexx.ru>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	David Heidelberg <david@ixit.cz>, Simona Vetter <simona@ffwll.ch>,
	Chintan Patel <chintanlike@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>, devicetree@vger.kernel.org,
	Jessica Zhang <jesszhan0024@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	phone-devel@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 2/9] dt-bindings: vendor-prefixes: Add Shen Chao
 Optoelectronics
Message-ID: <179061885724.141103.4454365057824821893.robh@kernel.org>
References: <20260917-nt36672a-panels-v2-0-f8de8be5b86f@minlexx.ru>
 <20260917-nt36672a-panels-v2-2-f8de8be5b86f@minlexx.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-nt36672a-panels-v2-2-f8de8be5b86f@minlexx.ru>


On Thu, 17 Sep 2026 19:43:04 +0300, Alexey Minnekhanov wrote:
> Shen Chao Optoelectronics Co., Ltd. is a manufacturer of LCD
> displays based in Shenzhen. According to description in [1],
> the company specializes in the design, R&D, testing, and
> manufacturing of TFT-LCD liquid crystal display panels. Its
> products are widely used in the 3C electronic display field,
> covering a full range of display products including LCD monitors,
> laptops, and mobile phones.
> 
> [1] https://www.qcc.com/firm/5b0330df7040fba496dbb0bd5723f6be.html
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> 
> ---
> v2: correct company name, expand description, add a link
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

