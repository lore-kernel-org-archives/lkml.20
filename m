Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED73B38B7D7;
	Sat, 26 Sep 2026 04:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790395298; cv=none; b=G8WIe41DyItsVPCW+Yv8dPkwP+uFclhoq9aTcIpEwZaj9h0dl2LDqkM0seQn+HDjpmVBLb97kaodVgX7e904UNUQ5z2kFsxSjzWX7gsUiTdOKGCmbqj7Rhz6irBoWv5Enb6SgWKLmIoNlSVKa4CNFNf0KnziQQyXQd4QX8v3NOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790395298; c=relaxed/simple;
	bh=eZNgZYtJiV/iT3wjnqPn6ibJrAH5tFfyDgdkBGrodYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTaAFwbFU4CvsxShlnRO0r9S3wL4u8wWB/nRLfkLg2tizyEpXT1wRowOyYzQAditYSk+uxgKA3UfdmSBxHTEyWmv3IkDjV4ePC3Ru64v5d79IkRHUdfxkjHTmF5QGoTustpN/RqlxkG4iYkmriISU10u2kxd+HMPfVI8E0eV5Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F47S8sH7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F47S8sH7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F42C1F000FF;
	Sat, 26 Sep 2026 04:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790395295;
	bh=ym8bShvMR0/XgGYUzNS+yMcBMiYlCn28ZC+AfCdVr0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F47S8sH7mkF/YnJgEU4cNr1xfbihtqSoERgC6ZEC8e3qRLo9ytzfkp+TZKVkzQbs8
	 p7gXRgSPajgC+2NJIRFLLL4ENaulWZR8HqVvNRMeW1kcIbN1smf/Bc4p3ma5+E3ro1
	 NDrTD4pb5zQDdwLwljeeqza578DuNYzY3C4C6l7PDFlBTM0QujnFBd2XoU4yZgYl9i
	 LyVpO3SYd0BjZMyb6hPCocAVHGh08GsXjZqLFr5QBo/5G1GQHftoQmBVLWlO1ybpjp
	 8Zj6tLtuVKk0MdCMnGyxOR/XqPC4GEZQu5yxopY8mz4BIhDUqdDmfxve90DBY0nQ7f
	 rjIq+Q0MIw+iA==
Date: Sat, 26 Sep 2026 06:01:16 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v15 10/16] phy: rockchip: usbdp: Add missing mode_change
 update
Message-ID: <grlhnslyhggwmajaxrtkdlbbvjlylk5bckwmao2bo42xgebtth@k3rptwhxyuzp>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-10-80e2c11d1ce8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-10-80e2c11d1ce8@collabora.com>

On Tue, Sep 15, 2026 at 03:49:57PM +0200, Sebastian Reichel wrote:
> rk_udphy_set_typec_default_mapping() updates the available modes,
> but does not set the mode_change as required. This results in
> missing re-initialization and thus non-working DisplayPort.
> 
> Fix this issue by introducing a new helper to update the available
> modes.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
