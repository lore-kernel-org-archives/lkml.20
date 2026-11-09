Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794255653;
	b=y3IRpLoGVLhPns1elzWlLnqvygfFee1/iXZTbSROE/RVNH1Zdf2kmL0uUySK8ZmLB/Rs
	 4koiMKlnjfAKrG4wifuZX2JIYe3v9qW6f9Z2T2psdncYtLotRYZG2QA+hEmIJtu9xf5Yz
	 YhzQJTHgiKOYIjlYPEESVlHgpApDX7TBiYisdTsfXxvI5+l95Q2dVxtnGzM6OFcv+MOxD
	 ekMocxygBGUiPkpykSjlOTzprokKjt4ptMIUrruT7r/huRd37WTBNjYtvU5h/wb/OdA9x
	 4x5ODRl6XThEYL0wB5nKh1QCywXOPVpnv+pleOk7Geo0ZoPrTed/zZGnWWVQWQQ2veQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255653;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=p2VWU/WN+cSmCH2dIzfqt0paEgoVmZoUIq28wLtQsws=;
	b=zIYSshtyDfyPfItC570XbCL/S/RWfwueQEX7PfXswP3srpDIEcLyFgRdAGr6JKh19hCV
	 cvE2biyBVaN1SgVWFLbr+Rt9Spiy1QOZRmSMIfQGJONBQ+o2pQNvy59vNJUVmJjLQz2Uk
	 q07/F/XCJfHAGvIrYv2tHsKyoThy6AiEsNtFEaBqcI2jqTjSthrGtmc+wTW7VtEnrp/yW
	 eiEyvuUmiwjliXjXRlqHeAuJZXCKqRdkQfMmaAuvCsjsHoxF/uFoHQqJP2ALvgAeacwnM
	 XK+vdHvr8xZqG+vZp84rO9kps75GNqfEB4mcf+7W77qNUJBjSrY1xrgaW07FApcdxjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=NW7ei05y;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D96606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5D96606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=NW7ei05y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794255651;
	bh=8QMmlJOyXYlkKm0qbr8+Mg9iII8ZAXA3eOsqDxVO/1w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NW7ei05yK1PBmE5ViCWK6tUV0mV3vMfhGFrcViShk5+pP1bJnhtX2F1/ZptB6GOOd
	 Tg4Co234NOUFYxFsiLy/LkRdykrl/QrqVdLyo0W7pRZuf16oh+2P8YZ8P86vaS2jnp
	 GezkwiNZ7SeKfB7sPmZ6UDyNSfTql+kgkZU9GnPHnAltiv2etmGpxHSi4EjhMpCn+L
	 GttjhmwdRP6Gp9rt9cRp/NKOyRzMCZ8VsqZghR6DH84zVvHvIaesomYNglK34MJnks
	 b5PwNTiwjNPkfI3lAeD3ZdlnhBSoHwrMit3vo2hpx1KZ9EdGZ4EX4b9yhDP2mcSmDM
	 PwwxQ3YZettrA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB8D317E0DC3;
	Mon, 09 Nov 2026 21:20:50 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20261104-hdmi-scdc-scramb-fixes-v1-0-16a9bb3d64a6@collabora.com>
References: <20261104-hdmi-scdc-scramb-fixes-v1-0-16a9bb3d64a6@collabora.com>
Subject: Re: [PATCH 0/3] drm/display: hdmi: Fix SCDC scrambling corner
 cases
Message-Id: <179425563470.412379.16294380759448058422.b4-ty@b4>
Date: Mon, 09 Nov 2026 22:20:34 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-36e3f


On Wed, 04 Nov 2026 15:26:19 +0200, Cristian Ciocaltea wrote:
> This series fixes a few corner cases in the scrambling helpers
> introduced by commit d653818324ed ("drm/display: hdmi: Add HDMI 2.0
> scrambling management helpers").
> 
> Patch 1 fixes a potential NULL pointer dereference in
> drm_connector_hdmi_sync_scdc() reported by Smatch.
> 
> [...]

Applied, thanks!

[1/3] drm/display: hdmi: Prevent NULL pointer dereference in sync_scdc()
      commit: 6e73b637dc16953067635d9ba2019f5645092217
[2/3] drm/display: hdmi: Use committed state to decide on SCDC resync
      commit: 59d532e39ea794ba6d0f8e8acd1ea4fb20d27877
[3/3] drm/display: hdmi: Reset sink scrambling on non-scrambled modesets
      commit: b4146c6155b1efefe8caa604ed9cc7a2673f8591

Best regards,
-- 
Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

