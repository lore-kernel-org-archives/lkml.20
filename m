Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DDA4BD784
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490386; cv=none; b=ZFCuDAtzpgb6j4hjUOdqn4+ILbyxBGiWWhxPtaEuEMSs6QrBVzGSPJ7Ab/o0uwUb2wHb55u7bVaUJEOLA58eG/ew4aReX5iWUKA3i2jficBp5DaezCQFU/eAiUM4QUxq0DHtARbL/BFmsU9O8AOOpplvAvy4Ie1ahVEVSPL+STU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490386; c=relaxed/simple;
	bh=JsVLlfjey0a58KfixwrGtomBeCJUGjnry+vFaKbTQs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j1H6wBueCyD5X4VoTJ3/oT3yOCK5O12ow9w27mZsEr2T7wyDN42pl45l9dqA3Jehy6qF+rhMhVJ5tHo1fEUH0lW0PGQ2g9wwzR4zbBYQ0jMZa/CHlrkBchILyO/Izv7/oGe+qBmGu5Uauwlq6eWLJp3GQ9CIdVnqgWpmWchZyIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=FqxOKnW4; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="FqxOKnW4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=+P/aelEmT5OmZhL5uaEKQ81rGaiX1if48juBRP3e/OU=; b=FqxOKnW4UAtlz/+j9rCK4PvGx4
	Q1oIU4etLxxljXppJ94pMP5Yr2dFkPBv7DH2Q23GAdMuV4/ZX05Gs4jv+tH/W2PHAw0VABoqTNZTQ
	T/ImrUc3hoC/laWHvX60W7bUD5QJPtq5zroPQWeiNWlHehdl/C4ZTL10ZcV1B8u11aMTG4OUJ0fjP
	1oQWN2A3dy7ZIOV1ffZc3u03gEYr9ajoc5O6BsJOQzL1t/HgGXjCuhG6RO2uBD70mhnwbVPwTct3L
	lhUKXEUD8raQCUfBk1eJ9F3aZg1QRhlPI8r57aorNhRkh7MXc/uU7iGAIsaiqwp/mWWSLxVS+giSN
	nAEmmHfA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Chaoyi Chen <kernel@airkyi.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: (subset) [PATCH v5 0/3] DSI Controller improvements for Rockchip platforms
Date: Tue, 15 Sep 2026 18:39:17 +0200
Message-ID: <178949035407.582306.14026680120994991425.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914013331.108-1-kernel@airkyi.com>
References: <20260914013331.108-1-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Sep 2026 09:33:28 +0800, Chaoyi Chen wrote:
> This series is dedicated to enhancing the DSI controller and PHY timing
> interaction, refining the lane rate calculation, and addressing the
> associated hardware limitations.
> 
> Changes in v5:
> - Link to v4: https://lore.kernel.org/all/20260812073002.328-1-kernel@airkyi.com/
> - Change the upper bound check for target_mbps from < to <= (sashiko).
> 
> [...]

Applied, thanks!

[1/3] drm/rockchip: dsi: Add maximum per lane bit rate calculation
      commit: 3c58af05953af5ab120e2c9061d7bdedde0d1bfd
[2/3] drm/rockchip: dsi: Add dphy_get_timing support for multiple PHY types
      commit: 5363e01e4ff03a204cab85292b89cf90c2d1b101

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
