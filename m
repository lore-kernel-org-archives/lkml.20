Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9DD378D9C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787837817; cv=none; b=jZjGF+BaFZbUazITrNcSPWJG2yrBDkLQCRBikGmb6bPd0qgOv2s4i+WHd65KMP/sFqKleEhIV0Cwp2EmGqowhrChu/LM3BndgGO9yZLDoy6u3azyjyjX5oeHqh6+ctVoYq0Zx4b7mIpRl1LptZ/llKxFcGXOzMEVHQp0ITuh5OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787837817; c=relaxed/simple;
	bh=A5r0+yUXSX3XQUcP9QrMrgeywepUhT6vyR5hnyxxQlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N73i1mMXND0r5AKj/lE9RdRGmNPNKaTQ8O6kHHWxXpacoGCWBw5LliSFkwbSRZpDHtf2jD73c0mKII/lLM9s1vsJSzRRdOS9eZRLsbNMMG4rOzRRmuRWl7RPFJAi40of8MwAo+EHmvOi3E+OPZjhjxsE1jvZbP6BQU8LdbM+M/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=p0Ew9lVd; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="p0Ew9lVd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=A5r0+yUXSX3XQUcP9QrMrgeywepUhT6vyR5hnyxxQlU=; b=p0Ew9lVdxDMpqqMCJQPiMrrSIN
	oczAEJ9P4l57EslTO8aBrNgTsmyf3KIRpzzzqFAyIcw2u6VTGv3x+sBRVotqHg+IQZRnXc+D1L9bK
	FxpYMMrunx627E71POwRG5r8BxHZmMNbFPRNG/yqtxcaRD6x1Fm6sqmv/PGnNB8w0bWpcUdl4t8qi
	Kw/PTXYKZc7lLDpV9IGV9E54g6GXOB+Op8ho9NgvV4g7b2MsPZm34dGdusYELoqPjQASwuDOlkBrn
	vMK8mB1/bAo9u9yxPy/A9iDc3ygx0FQk+40tvoJK1u2vSs9N8PX7YM2nwxAwv5cH1yCg8sWkEMB2M
	uGh4IFRg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, jason98166@gmail.com
Cc: Heiko Stuebner <heiko.stuebner@cherry.de>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
Subject:
 Re: [PATCH] phy: rockchip-samsung-dcphy: Enable runtime PM at PHY core level
Date: Thu, 27 Aug 2026 15:36:42 +0200
Message-ID: <10904774.nUPlyArG6x@phil>
In-Reply-To: <20260821-dcphy-rpm-v1-v1-1-a7db728b2539@gmail.com>
References: <20260821-dcphy-rpm-v1-v1-1-a7db728b2539@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 21. August 2026, 13:44:19 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Jason Yang via B4 Relay:
> From: Jason Yang <jason98166@gmail.com>
>=20
> phy_create() only enables runtime PM on the new PHY device if the parent
> already has it enabled, and this driver enables it afterwards. The PHY
> device therefore never gets runtime PM, and phy_pm_runtime_get_sync()
> returns -ENOTSUPP for every phy_init() and phy_power_on(). The block is
> still resumed today, but only through the supplier link fw_devlink builds
> from the phys phandle, which fw_devlink=3Doff and =3Dpermissive do not.
>=20
> Move devm_pm_runtime_enable() before devm_phy_create(), as done for the
> sibling HDPTX PHY in commit 10ba8479f460 ("phy:
> phy-rockchip-samsung-hdptx: Enable runtime PM at PHY core level").
>=20
> Fixes: b2a1a2ae7818 ("phy: rockchip: Add Samsung MIPI D-/C-PHY driver")
> Signed-off-by: Jason Yang <jason98166@gmail.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


