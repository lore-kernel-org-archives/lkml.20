Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A6539022A;
	Fri, 11 Sep 2026 05:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103959; cv=none; b=Z8+vWL08OjJh5X6NntsbzVXAnI6oPTzpzy2XrmZEbCIfqzxqMh1hWaEQfZG7//hk7DRU2fWI7G+xUIilb0pwB66Xg4Sc07Gd5O1S86rLeDuqOqoROzN0L5YdQxDgW7Kjl/0q+eXixZpPr6RZWihL7OgLfZ0K5EtjDwMa4LzL4x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103959; c=relaxed/simple;
	bh=D3BJ42CqcQe00Dy27oSrI9DdjFMjZ4vo9W0M1ENceus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttMLMQU9Jr4Z1dVXzCrVNz35WXnlwXJygDLf4wunMGt4iY3LxoJ+NTf/0bm16c0oFen6Jndr0gXgqkLSfhC4l/JY8TjgHRKKT5Pcj9scQnimd2t5bg/nUZoiWJKiQYedyhSB55LbWDWIVfgvJ8lMh57MPFff6hMuDcJLI3Opjv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UIPZ94Y2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UIPZ94Y2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF871F000FF;
	Fri, 11 Sep 2026 05:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789103958;
	bh=HX/WIqnMbATxafvirWBU6MEtc3JzCHTqWHGTjtEKx98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UIPZ94Y2fHaLGK3NgL80e2cW2pDVV7qnn4o21dkuRO+gxyB/T2NNftpcuajRrLRU2
	 s9I9nia32rI+aki5uWTxwRmzNnWPp6q6EDm701QffqwS5smT2PCVVWu/9SMyR2Is5P
	 M/iTYXkzclQs2oOXVXI4cFxSZUMyr1qrr5hJnI4vjuMw1AFl7OliO9VYReTkFy8tUh
	 INEr2I+Ynb+NJrVYuS8JX3TRxfVJOTb924Jl0Ghy/gLbP98wZeN6H65bJwM3OmTbN/
	 gZg1TwNANF7V5AvHV97cfQ3KDcFzNM4JoXSiIAKIBB5+6PedTWARuLVxyEJrEwMf9m
	 ftMhcV4ABCUpg==
Date: Fri, 11 Sep 2026 07:19:09 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v4 08/12] phy: phy-mtk-dp: Add support for digital and
 analog calibration
Message-ID: <peqvlalospng4dbcldlitpxko53jtnmlphlaogyaiul42lu6wl@pa3avgnnfe4s>
References: <20260910092038.48291-1-angelogioacchino.delregno@collabora.com>
 <20260910092038.48291-9-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910092038.48291-9-angelogioacchino.delregno@collabora.com>

On Thu, Sep 10, 2026 at 11:20:34AM +0200, AngeloGioacchino Del Regno wrote:
> Add support for reading the calibration values from eFuse: if
> present, write those - otherwise, rely on the defaults from
> SoC-specific data.
> This also adds support for writing the calibration values for
> the analog part of the PHY.
> 
> Note that before this change, only default hardcoded calibration
> values were supported for the digital driving parameters.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
