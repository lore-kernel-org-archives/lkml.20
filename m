Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793339088;
	b=NwqZopA2eSHrAorKboN/2sVoJ7fMVASlFonlnjZ0XsQhtQAjRHw+0NZNFpHHSJX/SssR
	 8lk//iFxuuhnp/ktdenzMRQEyGyVKhiFxDRcyWPtX5v4DF+d70rh2ovf/wjiOBDkNz/LU
	 +RpqQTZe0vRpQ4EmO7/EwfxEmHKQ7VzK7LNtgTBi2CvKTNhDseQn1RocZhixINo39aOWa
	 7xwzU1ld1ccS1oxbafSIOp86sch4pBDSNfjlfMQ37KuzseBmE+aq/nwXLAUsF1YO835WZ
	 hCwTM2S0Jx5qIaLjHCd3jxtacwlsFgOEXaZjPg2JQkLxzD7D8HyQfNJ3IkTPSys3/OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793339088;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=tDKGqmiBVLJpzdIws/ZQNznjBJouadAkG3/umP3KG5A=;
	b=Gc5SyfqWbXF/iJlHpcH/nZznhqJnZMYLy0C/X4dXMZvWHETb41ygqaDroEsXgLoiYOFF
	 bRIAeVcPuX59TTDKfq7Jkr848h1gbfqNs5OBSxVeSwmNLoqJ4MoCA5b1Po1xHckJIrzhw
	 5zim0T2xUSXt/PfuVCiaCuCi4zFRYurTCcI+oXCv8X+JyedDABbzfEiabRRzKB8kOf2F2
	 BGScRBcGxBLANyvvGc/Aq8qWiOsvPxwr6RqRh1R2hzn6mFjTUvLa8ySeDYGi4X95R8JiR
	 AZaitBbb1OxauR/NB3ZppP882AXb+t8iuCUd7EUj4JePuHsllvK+r+6xdidlCqE7skg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4327606A31A;
	Fri, 30 Oct 2026 05:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4327606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.150])
	by APP-01 (Coremail) with SMTP id qwCowABnO++1LuRqL2kEDA--.17661S6;
	Fri, 30 Oct 2026 13:44:26 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Date: Fri, 30 Oct 2026 13:44:15 +0800
Subject: [PATCH 4/4] drm/panel: ilitek-ili9881c: do a soft reset in
 unprepare callback
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
Message-Id: <20261030-mj070bi30ia2-v1-4-a0f65b65c290@iscas.ac.cn>
References: <20261030-mj070bi30ia2-v1-0-a0f65b65c290@iscas.ac.cn>
In-Reply-To: <20261030-mj070bi30ia2-v1-0-a0f65b65c290@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Icenowy Zheng <uwu@icenowy.me>, 
 Han Gao <gaohan@iscas.ac.cn>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
X-Mailer: b4 0.15.0
X-CM-TRANSID:qwCowABnO++1LuRqL2kEDA--.17661S6
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWkCFy7ZF48Ar1kGry3Arb_yoW8Jw47pr
	W7uFy3AFyrtF1ayFWUC3Z2va47ua13KFW0kF98Ka9xuw4UZr40kwnxtFWDWF1DJr4fAF4a
	vFnrJ3W5XF98ArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
	WIevJa73UjIFyTuYvjfUOyIUUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

In case of neither reset pin nor switchable power supply is available,
the LCD module could be DC polarized (which is harmful) when the MIPI
DSI host is shut down.

It seems that do a soft reset for the LCD controller could stop the LCD
controller from biasing the liquid crystal, thus preventing the harm.

Add a soft reset after putting the LCD controller into sleep mode.

Tested on a Sipeed Lichee Console 4A, which has no LCD reset pin, and
the LCD supply is an always-on one.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 83148c40e25ca..8b874c6f7d37c 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -2493,6 +2493,10 @@ static int ili9881c_unprepare(struct drm_panel *panel)
 
 	mipi_dsi_dcs_set_display_off_multi(&mctx);
 	mipi_dsi_dcs_enter_sleep_mode_multi(&mctx);
+	mipi_dsi_msleep(&mctx, 120);
+	mipi_dsi_dcs_soft_reset_multi(&mctx);
+	mipi_dsi_msleep(&mctx, 5);
+
 	regulator_disable(ctx->power);
 	if (ctx->iovcc)
 		regulator_disable(ctx->iovcc);

-- 
2.56.0

