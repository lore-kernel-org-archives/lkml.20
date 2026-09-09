Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF3B370ACE;
	Wed,  9 Sep 2026 17:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974646; cv=none; b=J8LbcwIRXQrU3Um8IcZl3X5HTE+NRa5kRfviv40+hcidCPOdOwQgvBmD2pXLm2tc00idnwgM6HiXCEd2i8djUJlkrS0ET6Aw1Fcq0GND2+YWDC1jZFBqHtwZ73YIJOfH+M605UynQcbcDLJPqmr52msmhdOHata/bim2fpKU+YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974646; c=relaxed/simple;
	bh=BSkOskzacTustR6qXtyh4JwyXui5A0TbNzHGYZgKZSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4k8GBXwxxfxoltTnKwEwa+LvpOC7r0U+c39OyzEDiRI45Pb8/0mOKcSoNJ1Qm+ZyyNzchCGwmSQa3+oNqJOtQqYpLYMw4qJ1B3XguV5ES6KL+gH3Qorsq7rYrawFegxPbwdp6+DdyhjMtfrvX2mpUNGijm/sI40y386gLnaykE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpMURs6m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpMURs6m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4D61F00893;
	Wed,  9 Sep 2026 17:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788974645;
	bh=H308Fze0XRt9N+Ri5zLt+4vWDFRB8Aw2ZkYI3hwsFW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GpMURs6mvtA/GGO6Qq64gTORmYhXiY0sEas28tbjcuZd7L1O2z1/TN98BsQCKtGa5
	 xKJiii3dzXSjojd9xT50qH9b6BFigiOmanQlEfy3u1VIbr0UzOdXD5URi6ED0Ca0sT
	 rQw6KsLXq8Xee8gKMJN71Hyx7dYBnzUpZ6wDiV+XPabmmLhcOCipNaVb9czOb757EI
	 AUpP+W6nhnrG3Lclz/P+vrydIU3DnKmDfeu3vGPfeeGLWeEC0oPMZZVADj1SjsaBhy
	 3fchyCWAx5BefCPvx34AaJ2PazeIg/Yuc05eblEEeKq+12JifaPo/CS2/ZCVfTYD5c
	 VG+I6y30p6puQ==
Date: Wed, 9 Sep 2026 19:23:55 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 10/12] phy: phy-mtk-dp: Add bitrate register val
 definitions to SoC data
Message-ID: <mmkzupat6ef423xnsd5hspcs4rzjxs223mr5n4qetpjltbeoer@sxsxpeqrd5tt>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-11-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707154245.198361-11-angelogioacchino.delregno@collabora.com>

On Tue, Jul 07, 2026 at 05:42:43PM +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding support for the eDP PHY found in newer
> SoCs, transfer the bitrate register value definitions to SoC
> specific data.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
