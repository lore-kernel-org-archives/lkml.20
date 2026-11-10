Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295003;
	b=qAkYZq1c0a9DtG+mXvhMTmHVx70s8Pk5Ugit7VPtrHH7J+U42YzGjC0CGlRovZXl4mha
	 D+c/wxsIWY/ArHaYwd+ot/wqvaENx+2XtAOSq8LDxsgbYOmRWpIcvUz4boya7pJc4iJSf
	 Bs8cHk+C+xa9o/z1bmAN/0LFbcBX9RIYh5o+XkCX9Ocfe9OqkjoXCw4mWrgpWrJ91scY+
	 xZnYWsHM+e9uULtJzELBYw+qDpagfWZR7JrTx9xOZHp0BDalstOn5iWtk7UN8JLlmiGYV
	 HWRCgWhaeuvXocu6KqWrtXXilpk1AZHbYlYr9EenC/90KLahbAI6pqVGlsk7qd1Ta4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295003;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jb5VhK9RVWn299dBgnYQWC7azpnh+7liBpJOmzkXfak=;
	b=WGnEhLrDT551b2uDKGrcJ99ui7WDHvdAUJpF0ZAYXPd2ikRPtpEHBJRLDS0LQGFyuwog
	 xJYE5fIqOGYeBOG+GiDL7NpaIrmi4nHTezU9O1gM/zzb0VkeM2EMKgAArHN8dyo6LsNtD
	 ZQi3skxkBl6b/H+2xfcACTO2dLNJ04WYBaCN+hpjaHQyqajv448YTQL+7fpqWzI3dC6B4
	 uqJaFrETgzE18rjxokCtA64zxKT8NHlW8I1nwY2S103MmtobFB4sZPUrVu0SkHByJbsgq
	 hk1jS/JhrkLkjwxwJgCiLWjzPesM41Nbz991h/NFK9ZdxMffUDa5AKyd4F/MBEf4VOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l2bh61aT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A51606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l2bh61aT
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295002;
	b=gM5488e2uoT86yhwhmByI9RIsje39KGozq4bid0bGK1M5BtTMKWd9j3oo8iK7I0L+zFN
	 T/VZo6vlV4e/x47R3FWSaQxj06MPUM8fQ4zYo+wZvDvygGXly5D38zafBfwQdYFP0PJds
	 gzYj9EgElqcfYqDkFfrz1FtNvutTsGfiK+GtyarIJTyEl1XNZc0bFJwbCR7Ov5SJ5MBtk
	 ZXYRedUkIM1S9UQF+S14t38GFIX0LBYeysyxXFK23o2sI8xNJDRxEjGjFwdKljRQGA966
	 SxaZR7K1kj30ZG1GPLsTjCJSylp5J+isBBmfmyNxEcv3du0I2/d/Iz8QAWLgAq5LE0w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295002;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jb5VhK9RVWn299dBgnYQWC7azpnh+7liBpJOmzkXfak=;
	b=U1jrm3VyX7G4w61bWcxvwhlMmQlJ1schpNKEFUydSFmO+JsKQe9esB9f+CPb+ZJfIoWV
	 5MrMELn2IVgj3k8/0y/xeksLohHU4T4izZQWACG3Gbv6sm276wZ+MS4uS+W6IjjpvKllW
	 sGlOgLvh7b+xIASdJB4MrlFfvRxIbCiMUu48QE9ky86meiwfNeE8HaOmeH1M3mxHIifde
	 NBxhtd/3q3h4aoCHzan2VaJ8P96uwbrlthR0UCSEpO0Hn3a02fYDK1uvvn06NR6b1sIr1
	 xS4iiUK4+OYCZEokugEM63NI0NB0i3RxUKmndw4xdnKixLBOsN7fIGCP29Db8a9YcgQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7A081F0089F;
	Tue, 10 Nov 2026 07:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295002;
	bh=jb5VhK9RVWn299dBgnYQWC7azpnh+7liBpJOmzkXfak=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=l2bh61aTSJkrKQoGwcOkj9FfnEONOptUG9qmHCIMarWMrFVJVDiqfOp6ojzZTPJH7
	 LQGSW1MQT8hzjCOOjHce5nDDA6vZNrhrnwvxV/teTgXLgTw4jqEp/UgccTAcy3hUZN
	 wXSR5TEW8sk4ZAPea1EPZ9aR1sQFo13MjXJqLULy+N/dCqKQia7FY+XAAb6HPBNrRI
	 ZhXSwYLmxcRC/tyWA6jL9jrcZBY1OO/ajxDvuRoVOFg9S5WNuh5s+0UFjofm0+TDe4
	 b66uANiddjPxfdov7VJt/v+Rm3ejcEvf4Xi74dDq6unbBx2wa30rIhTImG+9UWoo44
	 QnG6LfpHuiNKA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5677F4891A;
	Tue, 10 Nov 2026 07:16:41 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:16:41 +0000
Subject: [PATCH] phy: rockchip: samsung-hdptx: Power down the lanes on
 phy_power_off()
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
Message-Id: <20261110-hdptx-lanes-pwroff-v1-1-c2f85b7e06a4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBBA0V+RWTtgUnTRXyku8pjUKSWGjI+A+
 O+NdnkW9x4glJkEns0BmTYWnmOFahtwk4lvQvbVoDs9KKU6nHxaCn5NJMG05zkE7L13Az2CsVZ
 DDVOmwOWevsa/ZbUfcst1gvP8AVjUIdd2AAAA
X-Change-ID: 20261110-hdptx-lanes-pwroff-5ddc6e3fabb2
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295001; l=4329;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=9zRGlMGjmoLlgrDvFR8/ToCDMVtXPZbT51yULKbcMq8=;
 b=6fx2PKWiYRVDjs7I0iNhOex9Fyzd6QVNJbps4tjjwXUS6cM3JvtMx1U8AaTN6EHtjQ6dKlxro
 ghkAys44cnwDqKkz5wDNuNDP16/vM5N5cK3WGXJV0vZ8bGKkCft4wAW
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Since the PHY became a clock provider, rk_hdptx_phy_power_off() does
nothing but drop the shared usage count, and the PHY is only really
disabled when that count reaches zero.  The count is also held by every
clock consumer of the PHY PLL, so with a clock reference outstanding
the lanes keep driving the link after the HDMI controller has asked for
the PHY to be powered off.

On RK3588 a clock reference is almost always outstanding: the VOP lists
the PHY clock among its clocks so it can source its DCLK from it, and
the Rockchip power domain driver puts every clock of a device under
pm_clk, which prepares the PHY clock (i.e. bumps the usage count)
whenever the VOP is runtime active.  As soon as any other video port is
in use, e.g. a DP output, switching the HDMI CRTC off therefore leaves
the HDMI lanes enabled and the TMDS clock on the cable, so the sink
never sees the link go away.  The lanes stay on until the whole VOP
goes to runtime suspend.

The lanes belong to the PHY consumer alone, whereas the PLL is shared
with the clock consumers.  Hence disable the lane output and hold the
lanes in reset in rk_hdptx_phy_power_off() regardless of the usage
count, and keep leaving the PLL to the count.  This is the state the
PHY is in between PLL and lane bring-up anyway, and the next
rk_hdptx_phy_power_on() restores the lanes through the regular
rk_hdptx_post_enable_lane() path, so no additional PLL re-init is
needed.  The vendor driver does the same: its power_off callback only
clears the lane enable bits, leaving the PLL to the clock refcount.

The DP mode is left untouched: its PLL is not exposed as a clock and
the lanes are torn down by rk_hdptx_dp_reset() from the usage count.

Fixes: c4b09c562086 ("phy: phy-rockchip-samsung-hdptx: Add clock provider support")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
The problem was found on an Orange Pi 5 (RK3588S): with the HDMI output
switched off, clk_summary still showed clk_hdmiphy_pixel0 at
prepare/enable count 1/1, held by the VOP through pm_clk, so
phy_power_off() never reached rk_hdptx_phy_disable() and the PHY lanes
stayed on across DPMS off. Rockchip's vendor kernel only clears the
lane enable register (LNTOP_REG0207) in its power_off callback too.

Tested on the same board: a trace of the PHY register writes shows each
HDMI CRTC ACTIVE=0 commit writing 0 to LNTOP_REG0207 from
rk_hdptx_phy_power_off(), the lanes staying off for the 3 s off window,
and power_on writing 0xf back with the picture returning. A run of 102
off/on transitions over a range of TMDS modes, checked with a camera on
the TV, gave a correct picture every time, no "Failed to get PHY lane
lock" message, and three suspend-to-idle cycles resumed normally. The
patch has been in the board's kernel since.

This patch was developed with Claude (Anthropic) as a coding assistant:
it wrote the code and the commit message, and I reviewed and tested it
as described above.
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 6879eecc5a9f..751bb503dcfe 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1768,10 +1768,25 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 	return ret;
 }
 
+static void rk_hdptx_lane_disable(struct rk_hdptx_phy *hdptx)
+{
+	regmap_update_bits(hdptx->regmap, LNTOP_REG(0207), LANE_EN_MASK,
+			   FIELD_PREP(LANE_EN_MASK, 0));
+	reset_control_assert(hdptx->rsts[RST_LANE].rstc);
+}
+
 static int rk_hdptx_phy_power_off(struct phy *phy)
 {
 	struct rk_hdptx_phy *hdptx = phy_get_drvdata(phy);
 
+	/*
+	 * The lanes are owned by the PHY consumer alone, hence shut them
+	 * down right away.  The PLL is shared with the clock consumers, so
+	 * leave its fate to the usage count.
+	 */
+	if (phy_get_mode(phy) != PHY_MODE_DP)
+		rk_hdptx_lane_disable(hdptx);
+
 	return rk_hdptx_phy_consumer_put(hdptx, false);
 }
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-hdptx-lanes-pwroff-5ddc6e3fabb2

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


