Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755014;
	b=i7yBDavSzFOAdnC9i3NbiJQMPQU9t+C/i66g4hkOgBztWV08Ym3iGebh1u5VmpnnuwGz
	 sJE842idFeaV5Cay/T6mzVydxDIsWMG9eO9wE/KkfcPjtCB3/amF7V7N5cFHht6HqQ1h5
	 RIUCOSPG6Hfl9zHWFZCGT5dDs3kbVizOKZ1o8eQr5wfqpg5a1Uk/DluW+524/gnMfPtov
	 7b5aIYWW5kG5vwyQX2bPs7M87sSz0pwbDk7UUAIItb8Y2yD8En6j6rEu9zM84fTw49Mdb
	 /iQDb5uQZRmEf1RrZ2j9w1brpXcmMrBEAP9mMjEf5VgouphbKG65/k4+dPMfd4G5fQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755014;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=cuIPeSmMQumt6Xz/JP9UG4bk+SAVXVlRFXLYgQ+8MVY=;
	b=wTbtgFlZw25xzboUYGz1TXLQKq2YpCNzlVQE/dEOUu/FYPHJAuP8riFLmcnQZ1aFMwfb
	 8m553OQp3a8iXuYJXqJ9zDvO9sO9Ts3xiVZ1JfSceo3KtLwb1XXTG7Jex2qTEkiZZzNbj
	 wb5pqrYef2txq/0e9aNTzwa+PKz7hR/xZ2Ae/S7At/0rEh2YxwEV7m72BDXNG5nuvnhKq
	 qN0C6zPur3mTSU8PtsvN77Hx9dd0OY5MmCVz34kxYjv/AJeNJWmYMEUtjpPag+n7DN/DO
	 JcpjJemDMnMLIxS/sRGIxi5Nm27MYKRheP+y41FTags+/SE2kS22MTjV318A0FnoaPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hm5I51Hh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62F2606A31A;
	Sun, 15 Nov 2026 15:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hm5I51Hh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821021F000C4;
	Sun, 15 Nov 2026 15:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794755014;
	bh=cuIPeSmMQumt6Xz/JP9UG4bk+SAVXVlRFXLYgQ+8MVY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hm5I51HhmteSNslariNAGq3luQb33RBBUVD8h6cTRV733B9WRFMMxIfAZh95Y34AP
	 omVgGGvPDO+j2+glRsgfzVhl+HsD0unPwDT8n8qnQzc1oVLmucPm9lyLWBXH6UHkBg
	 fTxZY0J8INyk4qujuHLbma3GE0cH/QnFvu1IOj+dwF1sact5wTZvlKpKV/J3Xf0YVq
	 Od66PSwJRQaQLArlPZ8rHNvivVRmFQk6TfwgYYp/iDFJG9X23oPMOy9Z9PzrWMzzN+
	 HYC5mmsdmxoJyyOzxgBG4iUrztSgUAGiRIy3f82glCCfYl6932ep8nT9d78z8HuWaF
	 Ug/ashFhhiJ8Q==
From: Chen-Yu Tsai <wens@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261104185659.884455-1-jernej.skrabec@gmail.com>
References: <20261104185659.884455-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] drm/sun4i: dw-hdmi: Deinit PHY in bind error path
Message-Id: <179475501230.3244977.13845276937669658695.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 23:03:32 +0800
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
X-Mailer: b4 0.14.2

On Wed, 04 Nov 2026 19:56:59 +0100, Jernej Skrabec wrote:
> sun8i_hdmi_phy_init() enables the PHY clocks and deasserts the PHY
> reset. When dw_hdmi_bind() fails afterwards, the error path doesn't
> undo that, so the clocks stay enabled and every further bind attempt
> enables them once more.
> 
> Call sun8i_hdmi_phy_deinit() in the error path, like unbind does.
> 
> [...]

Applied to drm-misc-next in drm-misc, thanks!

[1/1] drm/sun4i: dw-hdmi: Deinit PHY in bind error path
      commit: 39e407b553ec15d4a233b651531ad431ed7542be

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

