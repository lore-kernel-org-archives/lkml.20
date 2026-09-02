Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C854A9D54;
	Wed,  2 Sep 2026 16:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365188; cv=none; b=i+cKTM5otg2vucvJTjGmxwiz+2TMlSwm+Nm32KDW7yRn2YgQCmlqHMD/5qWA/bg8O2SJO064U4KVl/0+RE5BOJcl/E22J+UL7AT9put/W/i729m0jgn31VAs+jV+2rWBP/N+OohIctJU+aVVZca97V9t6stJpL15dp9ohIma/Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365188; c=relaxed/simple;
	bh=NQJJEJebziK927aHUUh1It/mDKFdKS6tX9mRgw8Xjjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/RaE49duvWzkyRSvmiYqozBtQJncbt7LyCHOOdOIseop21F2PbpjYxdc7hOv/qXOY0GKFShON1nwvQ3Ts8YANQNdM+fbraB4h5iUsZoIygFv8NNz0oVFNwcqkrzjgPrUntIgesH1wv7TGGR/Xzi3YGUdc/i5xcN2k2T+4GeI9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0gK+Hzj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0gK+Hzj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69471F000E9;
	Wed,  2 Sep 2026 16:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788365185;
	bh=6mPM2QrK3+k4qQZbJgrxtRptJibEjDw1XeLRQM0tPpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a0gK+HzjYGWpxOA2Y9GFMa0ZRamanNJZEIbJPcOvqOlx27aaU6fVjq2PwAo9+Y3rj
	 QA9D+rrM7JdjXIrmf+uxjEP9E+oRyR1Jl2KeJ6r1qtWS39YV4KF72ujCkTO5AnjEvP
	 91T1pEIj7mxajMhmY1o2yWWTU/eJZd+gUuMyMweqrGcdwhjz8wgqG6AQu2Ga/ZioOF
	 c+eOzgB2f+uKTm5xMdU6bZRSH+zM/zY+8xOC8+gktkbeymk2mtk6MOPyxgKpObDo2y
	 hf7c2DvQEJLeIWrpwuBfxc9l5uF0JqcUng1PRWtlWBIpAh5FJacPGXvH/A27y/FaeO
	 u0C8O+ll03O4A==
Date: Wed, 2 Sep 2026 18:06:13 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: actions: Replace spaces indentation with
 tabs
Message-ID: <cd5h5yvpxnp3h2vagf2x64nesjani2hxxkklbx7hyrpo6z45ut@7l5mpkcpn5jy>
References: <20260829194140.108124-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260829194140.108124-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260829194140.108124-4-krzysztof.kozlowski@oss.qualcomm.com>

On Sat, Aug 29, 2026 at 09:41:42PM +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Please take it through ARM SoC tree.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
