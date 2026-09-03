Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1B535E958
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 21:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788469801; cv=none; b=rif7fHoC/loiCVhbw9w4qTB4GFv+7U0egkjcmDt29+lqolUmb0pYv3tsuXcgx3em8Pna1WkIdf8JOnq9ZuuTLiy5exjR+kDZmzp2X8ZfsJCm2pojo+x295gR0CaCTgKWgZ9qkuA5PM2JWseEFN227WF1KMxlebpjU5hWWC1SJC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788469801; c=relaxed/simple;
	bh=Or0670Aa5c9tVQk4xYbDTc8zaw5a535xrjioF+KtQ0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dtjwCkxMED46YKTe624cif11iKfzC3c7SZFjxG7Xi9iABDzmeMoc88TKC2x3COcEwxzS/wr3Zr4f9tsZVPdN088Oj7J3FdamO/BOGgxDea/MXcLDO4bIXrzuc1b2vUJeW+j/vYhSVvGR4URmCNHJNb0i2vsGISiaq/M1bIaR+0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=rHE/PaMW; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="rHE/PaMW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Jn4fU7y77lECs7I6hTxfYjF0J9XYYojKqt6y7PNxEWI=; b=rHE/PaMWwEQJHJqpiFRbjAmxov
	H82kIeKRs6/bXHDWJZNT8gfDziefluhXSWk/oBJu/qlFwhCD18Nh3jpgb1kEi3igslJvIgl1cVTk7
	k6xcPxk3f5gGof/gUfxFZanoLSh3VrFmtnqabn2OiJU17+yWOjWEWXQCJzz1YHRtZ5qp3riHreGUR
	8ZN0ET0Xg6UWBWpKSjcmvW+Y0SfufXtWdVP+Ii/P3x6FlRnQuwKECbRrqu3Z0o/cljfeES/ZLghaM
	kx5hpxb3paAjFaq4DWpgMgIamX8cTLBzKYtnJNsCeQVBmsfi5qdrutLeYpQliXhI+HmjGSsnNPHBW
	/li1+feA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Johan Jonker <jbx6244@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?SMO8c2V5aW4=?= BIYIK <boogiepop@gmx.com>
Subject:
 Re: [PATCH v2] drm/rockchip: rk3066_hdmi: convert to devm_drm_bridge_alloc()
 API
Date: Thu, 03 Sep 2026 23:09:38 +0200
Message-ID: <4592222.hdfAi7Kttb@diego>
In-Reply-To: <afde7cfa-bd1e-40d2-9315-d3d88abb7606@gmail.com>
References:
 <20260824-drm-v2-1-7f9273c6020b@gmail.com> <2814844.6tgchFWduM@diego>
 <afde7cfa-bd1e-40d2-9315-d3d88abb7606@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Johan,

Am Donnerstag, 3. September 2026, 22:44:57 Mitteleurop=C3=A4ische Sommerzei=
t schrieb Johan Jonker:
> On 9/3/26 17:12, Heiko St=C3=BCbner wrote:
> > Am Montag, 24. August 2026, 12:21:19 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Johan Jonker via B4 Relay:
> >> From: H=C3=BCseyin BIYIK <boogiepop@gmx.com>
> >>
> >> The function devm_drm_bridge_alloc() is the new API for allocating DRM=
 bridges.
> >> This conversion was missed during the initial conversion of all bridge=
s to
> >> the new API.
> >>
> >> Signed-off-by: H=C3=BCseyin BIYIK <boogiepop@gmx.com>
> >> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> >> ---
> >>  drivers/gpu/drm/rockchip/rk3066_hdmi.c | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/=
rockchip/rk3066_hdmi.c
> >> index f28d6a883e09..39c65ee07caa 100644
> >> --- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> >> +++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> >> @@ -703,7 +703,6 @@ rk3066_hdmi_register(struct drm_device *drm, struc=
t rk3066_hdmi *hdmi)
> >>  			 DRM_MODE_ENCODER_TMDS, NULL);
> >> =20
>=20
> >>  	hdmi->bridge.driver_private =3D hdmi;
>=20
> Can this be removed?
> See link/comment below.

that is what I meant. bridge.container holds the same information and
bridge.private_data is not used in the rk3066_hdmi driver at all.

So if some future function needs to access the struct rk3066_hdmi it can
do so via the container field.


> and hdmi->bridge.funcs are redundant by this change?
>=20
> Not redundant, just funcs are attached in a common function __devm_drm_br=
idge_alloc()

that's exactly wat I meant. As they are attached already in the common
function, there is no need to do it _again_ in rk3066_hdmi_register()

>=20
> Please advise what changes are needed?
> RK3066_hdmi is broken since somewhere 2025-05.

So both should be dropped.

Heiko


