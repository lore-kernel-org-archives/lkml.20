Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58372529403;
	Thu, 15 Oct 2026 13:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072421; cv=none; b=FJvp7IoNlXlD12Zrzqk4w8deVUy9Bngqyx55/OZRas7djw0OqeYXAsdl5faUY5PjD1LJtWxvxNlWaSl++RTK3g6VEOBaSJtYX3+0JVjQ9i4v2djQXWhk94deKCdaaeD6fWH4OtmOVS596urbW7NeYXB90ggMPDp+R9Ed3RrljZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072421; c=relaxed/simple;
	bh=lAwqKlBFyfyhIVL7moxRjqQkR0Ch/SiUlzWTEFN7iXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LoDLCUAQ3Zqsi78U0zeqkyXdT5ZEpwTgOnUUyB4E8YKx51VMQBLlQUZm5JZQobBZqeREpNEowGuHS9aJDFi91CjH+rbPBh4dr+aU+DeDpE3WTiy6029UHOx0mFslx+NuPS84euxYj1yZuDgQ2+QRxbzbec2sD2V6a7I7Aga4Nyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XSAVjZAm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSAVjZAm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E241F000C9;
	Thu, 15 Oct 2026 13:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792072420;
	bh=p7Qlw7VXf7AY61LSa5FCk7VLQuFTd8n0dC9+kQeBHzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XSAVjZAmBfm5ehhCuVBXrPqH0OdDBBH0bB9l2UYHkMovPwIkndZsgK+yFO+q2cRs9
	 fFDPojgaGZfCC7rwjiOJieJIgOp7/ruO6AKfbzF0VMy8daMwwj6HnWWG4Slvm0ohST
	 iOz4JaombKV9cyVv+/agoWrNSbnHSkKzkNqcgUMcW0fbgEi1uFUxoJDfJwu4jUpW1O
	 MsRUMaeI13UKDlT5fu49hsDOq/Dxr+mWbNDICUU9t+Wp1/9V9b+26wbeu9kVQXiQnn
	 KxePPtNaRJ7Qa1vE4p6TKRI8jhyQF/EgWUj2HNs2aLUUSwhlckpO84TAsTRtq+QDy2
	 y2UZaA2pURxAA==
Date: Thu, 15 Oct 2026 08:53:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Baihui Liang <liangbaihui@linux.spacemit.com>
Cc: imagination@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@kernel.org>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] dt-bindings: gpu: img,powervr-rogue: add spacemit,k1-gpu
 and spacemit,k3-gpu
Message-ID: <179207241674.34261.14585638486927486054.robh@kernel.org>
References: <20261015-spacemit-gpu-binding-v1-1-a7a23c7e7788@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-spacemit-gpu-binding-v1-1-a7a23c7e7788@linux.spacemit.com>


On Thu, 15 Oct 2026 15:00:48 +0800, Baihui Liang wrote:
> Add compatible strings for the IMG GPUs in SpacemiT K1 and K3 SoCs:
> - K1: IMG BXE-2-32 (adds a dedicated entry for a single core
>   clock and power domain).
> - K3: IMG BXM-4-64 (shares the same configuration and entry as
>   the T-Head TH1520).
> 
> Both SoCs require a single power domain provided by the APMU driver
> (currently pending mainline):
> Link: https://lore.kernel.org/all/20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org/
> 
> Signed-off-by: Baihui Liang <liangbaihui@linux.spacemit.com>
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml      | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 

Applied, thanks!

