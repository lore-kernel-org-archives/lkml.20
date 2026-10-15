Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22364A68A4;
	Thu, 15 Oct 2026 10:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061244; cv=none; b=pSGiAPAvTFe7vtKqGtOoLTPAmnOMMSm+SwXsnfRQWAP3USsYVB4J2+qvQHsqhT/eDYrYNigkW/WyfTI+E8E+WoaWP41HyfQW7yCyQ7PHQAWvh5HAjfI4CUFU1/pgLgs3ydWGOBs3B9TLAsUuGFQkQZ1DoMV8meMagyDZkbfZV+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061244; c=relaxed/simple;
	bh=ONURpB3HSGYME8haTqrD14l2ii1BxFeAfDQ7jZzZSo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPo0Y6VRgs18eVSUBWtCIgsuaeewl2b3cuabR/HLxVCl9z68jZMe2XsLBVG8YwGc52jWX2aC4Uq+2xl6aQLIGYLje4mh6b0MlwJS5+3/+B5MPB5i2oTDJ3H/9vYe0ry6MA5DnrVZ8GYE/xYT1Bs98IbcTJDQDqnzCNz8tWliilk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qp9GsYQF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qp9GsYQF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A8F91F000C4;
	Thu, 15 Oct 2026 10:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792061243;
	bh=bn1RVhh00tR2vWhDxqlS04Kzhv5cg4PHb+mrabZlf2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qp9GsYQFpkwJFALLlWyLztGsBZGaiC8y9HyLf54K4ElVhjIsLpZFVXaaIsqRrb2SI
	 BCzlrWoYyljSUUVVJb0M9DevB4bp+VkxEav2UluERBUpIh+DXw4wG9NBG4itegwGqC
	 CINJalsZSHC0wjo/6i1HZDyke6vwB1UCYurjooRGZMJJsCw5XIWFmGzDkuAjW7qXIj
	 gh+GLZWuMtBYcFkkOycW4/vdRjZEaWaXSIacmF0X17YK2aEi1RilGLXhTPMdb98I7d
	 Bv6bbJqBOqlNiIe55UaNQr4w2qYsPFEkp3LNonL7d0mqH/b5Pd2ez2HShcNJb/Z+F5
	 sfX19PQDxzIvg==
Date: Thu, 15 Oct 2026 12:47:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Baihui Liang <liangbaihui@linux.spacemit.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: gpu: img,powervr-rogue: add spacemit,k1-gpu
 and spacemit,k3-gpu
Message-ID: <20261015-cordial-unstoppable-jaguarundi-bcf668@quoll>
References: <20261015-spacemit-gpu-binding-v1-1-a7a23c7e7788@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015-spacemit-gpu-binding-v1-1-a7a23c7e7788@linux.spacemit.com>

On Thu, Oct 15, 2026 at 03:00:48PM +0800, Baihui Liang wrote:
> Add compatible strings for the IMG GPUs in SpacemiT K1 and K3 SoCs:
> - K1: IMG BXE-2-32 (adds a dedicated entry for a single core
>   clock and power domain).
> - K3: IMG BXM-4-64 (shares the same configuration and entry as
>   the T-Head TH1520).
> 
> Both SoCs require a single power domain provided by the APMU driver
> (currently pending mainline):
> Link: https://lore.kernel.org/all/20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org/

That's not relevant here, drop paragraph.

> 
> Signed-off-by: Baihui Liang <liangbaihui@linux.spacemit.com>
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml      | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

