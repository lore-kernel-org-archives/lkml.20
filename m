Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5C1332EAE;
	Wed,  9 Sep 2026 17:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788973597; cv=none; b=jnAHHPVqmEFVZszIoNctnWbHFTo8QGJCaI13FaicrTDW/dbi0g0+Q2oTcThEwhVcNCS16Ex2ojRJra8bbFktWeY2QAdQ9dxQsK4IDaCBCeQdxr+KL7SAu1MlObwwf9QQii3Z5VMZ3Gve+hfE++XF+gj5cTx9+dpUVYPeIDVX3Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788973597; c=relaxed/simple;
	bh=77+XzkSOXInCvVcDLKJcCQpyTJcm6rqnBky9V4IS6QM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsUGEBhRVhqqx2RRE7WbvI/Rtr4ROQWNuFeike+xZkDu8XIVd0yCHmvTtjaEJk6dmhBXiXCMz7gEymotH+FqCZNYDB0Ar0zPn1z7qONZEDl3OO/O+WiuV7gjBYLRz4XR518efvw+f01rzvFLOHiO4LIPbZbveCmZgq0Mv4JCgB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I05C/y3R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I05C/y3R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3355E1F000FF;
	Wed,  9 Sep 2026 17:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788973596;
	bh=tEGujVrnh45aRHa6TGYv0vK65BrEMTGrkS+B+KBLQdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I05C/y3RGAUYs8rLS+AVasAowNXB0L71hpYAq6erADUXn5hHQkhD+0+xtK7cpCsFX
	 Tlg4o87zyOadC7pg8Zqfvrpa4NWWwtzsEjHVzbJvRHmZ3589sP1HNv4m90tU5iPCVc
	 gB8dR2YKj9bZRHjqnSn44gva1V3e5jNI1wf4Z/VMyno3eylGdGRwsNncBxZXN+//yw
	 15YtQvmp0YemRPV6GYgQ5SjxP5ZGE13+YXTRvm1urVIwEg97CY6xYzzTqRKeDQioUe
	 eP26eJBDjf1MDrLEkTNvR/RTG6pdANv7Nzs/s3fCwGgeyalvTl+kQrZOd757ld1QFn
	 LzyeefD/yNBHQ==
Date: Wed, 9 Sep 2026 19:06:27 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 04/12] phy: phy-mtk-dp: Migrate register offsets to
 SoC specific pdata
Message-ID: <42rp4gtodsf35nqkabudeskzxxdfsrhvsyug74i536cuyrhjfz@puo46jjfbnf7>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-5-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707154245.198361-5-angelogioacchino.delregno@collabora.com>

On Tue, Jul 07, 2026 at 05:42:37PM +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding support for newer SoCs and for adding
> more capabilities to this driver in an efficient manner, migrate
> all of the hardcoded register offsets to SoC specific pdata and
> assign that for both DT and platform probing.
> 
> While at it also cleanup writing the driving parameters to the PHY
> by iterating through all lanes with a loop instead: note that for
> that to happen the default 0/1/2 driving parameters were added,
> those are really just zero.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
