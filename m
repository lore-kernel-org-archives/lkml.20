Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587960;
	b=G51TmUhvp4GQNjQt9Qv+NlnovcNXERYbdRSWRZBVx8rvjz+X6mhGbdpkAArT7zUnh3xi
	 5dXAzp3JA8quyyof3aya19j8zn25mN8izV2sRkXXWyORcLAnmjbi4iyOQ3KP1tuFinP+L
	 P13Iel5kgxTtnypJhklmvq2nM3gZ86xkFOgxWyDXvGK/mYq9ZTAdaqbHF3ynY0Y4KwXrs
	 bAxAGKY6juey1S5zU9RduMUuc2zDYM3vtBENk3QR7BErbfkxLv0hoECoaSMfWBoofqpRU
	 1FSEt3kYzIXtad2pXvF0ypACBjuMi0musU4khdCr1WvFVhkb1Juwr+Sjv5wAaMOPvrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587960;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YsJoT5vV2LhXiRt6uTgKvwX6IT1pNPlfM93Jnxpg4QA=;
	b=qUYfgzK8/d/LaA/Cd9NnsqyfJGtVzAMSCnE3Otia1MqMsLKkpvRUarlhQmEwOpnzhT9p
	 T7U3ct5R0boJgEUzneF6iOLxbyB4cQvoTkGoo22Ob+vMSJEsY+jRHfIpL5ItdhU0R5Fdp
	 SLupFYptCQFzQqKK5OWCWUX6GOPpyJ4UT2DG1M4o+C0c5e1gtdemI0k+RD0Rz9LTxJvdk
	 6qugPpqtj4dPs2y2GqTM0GssrQYo+pJOyG4cSmLLy5MpbbeJ1pHwfJax21ztzQMP/bAZn
	 2PUSTTHwSGSTnYLd/X6Y/olBmYaFL5PvS5kVWAdUBhzyutyR1n27lktrAOqDkFzkIqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=edbGmpe5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29254606A8B5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=edbGmpe5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794587960;
	b=QBzcu6yXBZSZpqIfMPoz8DPpj2fMKkGXa4INLmo8ffURM4peZqd0kBh38m8HhNb+alj2
	 fl5s2F2e+0VSyTUhnRskw5p8zMvK5PIgpAwpVGiDK2HGpp3Dv0PBARKNmk5sVhoAR7bTp
	 7dlXvLf9bfqtwrAakc5PTuI7UcC5cj4fXuuy5L9P1cF5hPn8oX40L5hK6o8jWlaA/sjcN
	 GjEn59ZyAor75w1ROafUNOeEg9RoAUhLT1+jKZBT4Q64rx8X5ltDK0NsB8W4wOvLrd6uv
	 wRSliB+1St7y1NRbguCr28MLVPIzlrpHurHhugyDwlAg6CJW5iR8hlx7LyTNPzSnGug==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794587960;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YsJoT5vV2LhXiRt6uTgKvwX6IT1pNPlfM93Jnxpg4QA=;
	b=S8Yj/9JCKLkRodfWrr5cO2icA5irQy2gtIzrmZP780uRWDfGJvQcu2iUNyjpt+7sdAvo
	 tmwB1Q+4+xB8enQHJYuNNl5gaN8NPfI5dRDGeEd9RHbpNtib1G1fFZSAdrED2aSfo+MO1
	 Xm1WgTY4WKq9VROnuXlMuuYVJxeeB4ViXPtR2tBJ26E2LkQTJUSAJhPe4LGnDtBUnZUji
	 wItJSRJyFB08D9PPHnQeEW9dLrYdOAeo5bxms6FoEXzLyE3TibGcc7QGfi9wXmKWpyuS3
	 tIOUJxvsJIgAQCXiNt64Iaj0t2EsrUQ1dZbVkxHNTmE2iRaRiDCVsOhzAlc3+XgGvLw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 078AA1F000C4;
	Fri, 13 Nov 2026 16:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794587959;
	bh=YsJoT5vV2LhXiRt6uTgKvwX6IT1pNPlfM93Jnxpg4QA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=edbGmpe5Pwi+R0Phxga94HCKttQilyaVEkobep0dGphkf4wzEXa/8D0snKxVbC0Ej
	 7ZTCKoumGouzc7Of0OP1qb+Fi89Ijx+L4CsqW0QTy8wRoej/TOqzglhl0WFp9O8zsr
	 ZLlyk2E+h2UzUMGsspfZuDCLo4dgmg2KI7MqB196QK9a5Hn7VzH1d79n5As2qxzPEY
	 AGMPfahtCYiyHdmrfhE9gzlRkoxJBbFJ6URqmx6RNRhAkLNAgM6OequsHFvJKQT1IJ
	 m3cVh7aFhxq+SWvMQyKkcy/CI+dsHSUgg8D26tGiRhVXpBrjZK13IW2zdCI9u9ppy3
	 1Blu56RJV0wVw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8E094499A6;
	Fri, 13 Nov 2026 16:39:18 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:39:19 +0000
Subject: [PATCH v3 2/8] drm/rockchip: vop2: Don't use uninitialised
 dividers on RK3588
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
Message-Id: <20261113-vop2-fixes-v3-2-08ae37e83b5c@gmail.com>
References: <20261113-vop2-fixes-v3-0-08ae37e83b5c@gmail.com>
In-Reply-To: <20261113-vop2-fixes-v3-0-08ae37e83b5c@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Piotr Zalewski <pZ010001011111@proton.me>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Damon Ding <damon.ding@rock-chips.com>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794587957; l=2183;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Lc7BUM364hkyo1nY0cQj9eSkLiB7Dn5RbOTOJc1X7j0=;
 b=jSag1E1DXsleRCrlZtdOXT6hQo3zaRqaKCsaluyVcAUyhAGK1/1lOYxMWFvOI7y9rQiLuN6vg
 kqup9p+yrgaAyUPTysWEKwZ8YB+zznIJaLEWiFVnyZA2ZCtS6N9ADxt
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

rk3588_calc_cru_cfg() converts all four dividers with ilog2(), but every
interface only sets the ones it uses: dclk_out_div is left uninitialised
for HDMI, eDP and DPI, if_dclk_div for DP, MIPI and DPI, and
if_pixclk_div for DP and DPI. For HDMI and eDP the uninitialised
dclk_out_div is then written to RK3588_VP_CLK_CTRL.

Set the dividers an interface doesn't use to 1.

Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
Suggested-by: Damon Ding <damon.ding@rock-chips.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index c44648e1bc0d..f340aba5bfd1 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -1597,6 +1597,7 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
 		 */
 		*if_pixclk_div = 2;
 		*if_dclk_div = 4;
+		*dclk_out_div = 1;
 	} else if (vop2_output_if_is_edp(id)) {
 		/*
 		 * edp_pixclk = edp_dclk > dclk_core
@@ -1609,6 +1610,7 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
 		 */
 		*if_pixclk_div = K;
 		*if_dclk_div = K;
+		*dclk_out_div = 1;
 	} else if (vop2_output_if_is_dp(id)) {
 		if (output_mode == ROCKCHIP_OUT_MODE_YUV420)
 			dclk_out_rate = v_pixclk >> 3;
@@ -1622,6 +1624,8 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
 			return 0;
 		}
 		*dclk_out_div = dclk_rate / dclk_out_rate;
+		*if_pixclk_div = 1;
+		*if_dclk_div = 1;
 	} else if (vop2_output_if_is_mipi(id)) {
 		if_pixclk_rate = dclk_core_rate / K;
 		/*
@@ -1643,8 +1647,12 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
 		 * mipi pixclk == dclk_out
 		 */
 		*if_pixclk_div = 1;
+		*if_dclk_div = 1;
 	} else if (vop2_output_if_is_dpi(id)) {
 		dclk_rate = v_pixclk;
+		*dclk_out_div = 1;
+		*if_pixclk_div = 1;
+		*if_dclk_div = 1;
 	}
 
 	*dclk_core_div = dclk_rate / dclk_core_rate;

-- 
2.55.0


