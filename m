Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CC744A3EB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292646; cv=none; b=lyMMAXv/yzKvBUJ70U3EZP5tEUACHwg2estvZoUsLeBt2QVJF8xeKI41ZwouUMuIBnaRLwRx2/DuxoUXZ9Sfnp3OLCLjkxg79aCNPe6y2PPi+VfSTQgkF3buXfhEh+80Zum2KFykgDEaCNNpawaPXtF11kNiVEqDXSX7FoEa48U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292646; c=relaxed/simple;
	bh=c2iPczLtPVzAMlawjRT1iQ+YfNBlqk2yLxQ0fD8HXv8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q9I/V38Y4/ipRAq9i4EW5p17xdjueCtdRmzJrumQcJzdSlA8L+O9lMRdR+ulkgiD48qNj5eBBnNcGNRVnXJS1g2GapedWpg4RZEvwFnQn2Q+7wV9NdgiJICsnFZwKPmaHXWfBh7usGDrbinYvmjVP5BNFDN7yF3KtvndLZ8Ccuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JVLkvuIi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JVLkvuIi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788292643;
	bh=c2iPczLtPVzAMlawjRT1iQ+YfNBlqk2yLxQ0fD8HXv8=;
	h=From:Subject:Date:To:Cc:From;
	b=JVLkvuIiBYqlD8jXgnDZxYeLJZVp44FOH97rQwVJezq4g3p3cq3Vskm3vfhuU7YRn
	 FpGKkdffe7inS1riASp3ckgbTOto2+saVAbB35sfF5ZdwE9NZebiPP0v5OzI+o/SBy
	 hshlsCSg/XzhlTttyUU2DvWRvVSVgGSYE0qKBj2ph0Ok3NjNcT0yuvukAAT0EGDboM
	 utu1QIlNiFZ7VUrA8WZjlzA4DbS92v6vHAb036VbrUuXQHn3yvkHCyTGdt5Q0sKsxv
	 Ht088ufTchxzS6dkl9FKCgopWGlHtfI0G6s1zErOspyp8LpxKnXq/2IfN2HhCgRZGL
	 rHEWCDaShwygg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B23D17E0260;
	Tue, 01 Sep 2026 21:57:23 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/3] phy: hdmi: Add FRL TxFFE level control
Date: Tue, 01 Sep 2026 22:55:12 +0300
Message-Id: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ7CIBQFr9L8tRhKhbSuvIfpgsKvkNRSAUlNw
 93FunDjciYv8zYI6C0GOFcbeEw2WDcXYIcKlJHzDYnVhYFRJmjDWmL0Elcyjkhk2yleoxAdPUH
 ZLx5Hu+6ta/9lj49nScafNDZE51/7X6o/9l861YQS3uCguUbJqLwoN01ycF4elbtDn3N+Azwd5
 yq7AAAA
X-Change-ID: 20260328-hdptx-ffe-a89c51e66904
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2

During HDMI 2.1 Fixed Rate Link training, the source and sink may
negotiate a Transmitter Feed Forward Equalizer (TxFFE) level to
compensate for signal quality degradation on the physical channel.  The
source starts at level 0 and may increment it up to a maximum agreed
upon during LTS3 in response to persistent link failures reported by the
sink.  TxFFE adjustment is optional and entirely independent of the FRL
rate and lane count selection.

Patch 1 extends the HDMI PHY configuration API with two new fields in
the frl sub-struct: ffe_level to carry the requested level, and a
set_ffe_level flag that switches the semantics of a phy_configure() call
to a pure equalizer update, leaving all other fields ignored.

Patch 2 addresses an issue with the PHY/PLL configuration after
reloading the samsung-hdptx kernel module.

Patch 3 implements the new interface in the Rockchip Samsung HDPTX PHY
driver.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Added a new patch to fix samsung-hdptx PHY config after module reload
- Rebased series onto v7.3-rc1 and dropped the dependency on the "Clock
  fixes and API transition cleanups" PHY series which already landed
- Link to v1: https://lore.kernel.org/r/20260328-hdptx-ffe-v1-0-53ebd5dea20a@collabora.com

---
Cristian Ciocaltea (3):
      phy: hdmi: Add optional FRL TxFFE config options
      phy: rockchip: samsung-hdptx: Handle PHY config after module reload
      phy: rockchip: samsung-hdptx: Add support for FRL TxFFE level control

 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 80 +++++++++++++++++++++--
 include/linux/phy/phy-hdmi.h                      |  6 ++
 2 files changed, 79 insertions(+), 7 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260328-hdptx-ffe-a89c51e66904

