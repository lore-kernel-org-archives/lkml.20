Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD664EBAD2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788453267; cv=none; b=Xa9ILcVep33XgxOiDKKwVSPlf5CKSavzlUoz5lzDM27qnRrjy3jzG94AWX1NOkIcakwy5iv6Z/yLsvF7k2q0fPbDBAhJ5+/4sigk5Kbo71hXE07pLL0Va7KsOhjfakLH8TKy0KLEa7407AP2N0VzCvLGOHOQrACvInRpqGsepr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788453267; c=relaxed/simple;
	bh=CB6E7YllCVss3h0P19VMUKalmv+zE7NkffGbnJApLBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ECegsuTXNZzotChfI7Jj5IK46HjiQLeufhnfIKOiSoVGkYU104iGnJiFcQjFzSTjVBdF/TjcwLCGqYrHP7e5UBRinFmlA7xxI/WldcgJXJs+ZM5VdE66DBbrsm2ACkiNyFvjgiZN+lLIJ1NJts3POon7HN0rUyf5osgs+KfumXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=kvPpxYWX; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="kvPpxYWX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ZS6D3dNfXN/WHHhWf6mBfOo10yYBtRBlMynvNuuKjhk=; b=kvPpxYWXgdKBe382DNY/BvGN8x
	DNlFmCjcaldzhRskNDvW3lWW1aU63ogTZtKR7aFVNgvlIRe3QxCRG5LeWrHe2Lp4nqS0vUjA0gNRE
	oTtS5FKFJI+8bO3sMc/Yu/dP+ajod3lNcOUwNlpaSccHg0xpyOA3s4Rmr3mRnqzdaBvmpV6ZZi7Oe
	rdBaku5uZ1KfTLQf8lgKMd+yJpG1j+i2hCMriN4bZfmrTzJ9+iwPynAwBxKlOfQrtYUEkBgGvZUYP
	KQAKJn8u0wVXYO6S7s6xXDpE1nW2CFJwJTjbWRRZ2XsVER4vZiyzRhNIUmrpnHztm8ZW4YW+iJfHW
	eoC2voKg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Igor Paunovic <royalnet026@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Marius Dinu <m95d+git@psihoexpert.ro>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/rockchip: Add missing DRM_BRIDGE_CONNECTOR selects
Date: Thu,  3 Sep 2026 18:34:00 +0200
Message-ID: <178845323373.2687836.517588125431937296.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260813144019.12089-1-royalnet026@gmail.com>
References: <20260813144019.12089-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 13 Aug 2026 16:40:17 +0200, Igor Paunovic wrote:
> While testing the dw-dp v11 series I noticed that ROCKCHIP_DW_DP does
> not select DRM_BRIDGE_CONNECTOR although dw_dp-rockchip.c calls
> drm_bridge_connector_init(), and Sebastian suggested handling this
> independently of that series [1].
> 
> The ROCKCHIP_DW_DP gap was in fact found before: Marius Dinu posted
> the same one-liner in March [2] and dropped it when the failure
> stopped reproducing in his build. The failure is
> configuration-dependent - any other enabled option that selects
> DRM_BRIDGE_CONNECTOR masks it - so it can come and go with unrelated
> config changes. It still reproduces on current drm-misc-next.
> 
> [...]

Applied, thanks!

[1/2] drm/rockchip: dw_dp: Select DRM_BRIDGE_CONNECTOR
      commit: c83e3e806d4c115f1dad9ef756db4cd91448a262
[2/2] drm/rockchip: rk3066_hdmi: Add missing Kconfig selects
      commit: d72aa5cf045a69d5fd433cde5dd4e113d9558fd1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
