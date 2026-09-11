Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D494D36728D;
	Fri, 11 Sep 2026 05:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103855; cv=none; b=rLcanABWvTsg7QX2FsPpjJ1TRd+sIMBhbofVite2pjIxmMbsaTV/KEAZA80d9isxiJ6os2CvA7H2r4dMVjn/qL2JX9jzSjoBR1uYl//vElV5c+dzxgpCjbGaF6wL3vLnhmr4vz7ukPhXAGfZ0eyHrq0mfB8WcSDVh4WuWx/rkpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103855; c=relaxed/simple;
	bh=VO6Go7nTSwCJIn8OdFG89Zy1T1f2i+xs5qzMLIbxGVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+7EIDyJjBOxxRjpqUZsjHJi8BYtCq6QEZLd75sBG+B07kkIye3jjPfxuaQCaJu7WXoCwIBcBNO6LdvamYcNUeF8O1pZlAiNqjABB0gVHQV74M7/nZHpdOCyQWUSaPO60nkWRp0t3wqu+g3n98NE4pfCIJoPm8ePrIzYHbUgMe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMmIbpxI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMmIbpxI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD391F000FF;
	Fri, 11 Sep 2026 05:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789103854;
	bh=MyiTj6alOlQUBpvVanvP3WSeuGMqb9NQa3cYxb5z/kE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aMmIbpxIlWoNOpEzY53NE/GrzWX+ITjvAwiJ7k5RzH99owz9sqGHfCEeLVJPVvxvv
	 fRWfuu4jGHGC1Ko9r6fwd+l4+bOy1buyVW6OEnHr8TWj4nk/LxxPj6Fex1qDUHAX5x
	 +ZZE9k27z55QOAD/QshaCbFnnrRubk6JRkjIQJPK9Rw+Zkt8V+b2Gwb8YnJojhMgKQ
	 8SvJUxn2oFJGW4K132CNUODpE//NcdEiY5I0E3xjInfVyGt8QTt2dbYRTVJ8781qmp
	 hNdmRZLdRTQsMtt26u2Ld6uNShYjV0sR5e8h4smj/N0HGDGY5D7z7PCPBjUZYnAEZm
	 TEX3nnBAlS2xg==
Date: Fri, 11 Sep 2026 07:17:25 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v4 05/12] phy: phy-mtk-dp: Implement power_on and
 power_off PHY callbacks
Message-ID: <woh776xuf7vavnb55lrup6runersvwtw5hkauarjn3rzfuu5sx@n5b5tjt3firs>
References: <20260910092038.48291-1-angelogioacchino.delregno@collabora.com>
 <20260910092038.48291-6-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910092038.48291-6-angelogioacchino.delregno@collabora.com>

On Thu, Sep 10, 2026 at 11:20:31AM +0200, AngeloGioacchino Del Regno wrote:
> Add .power_on() and .power_off() callbacks to mtk_dp_phy_dev_ops
> to be able to call those with phy_power_on() and phy_power_off()
> API in the DisplayPort driver to be able to stop using all of
> those hardcoded register writes in that external driver.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
