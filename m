Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794654596;
	b=ym12LAuY9OHwPsg1Kc3oLeT/9aUNw9J4FHhwc8Vg5wstjdiWKQeTPKEpbTa6BaXhl5Yu
	 w8QblxM3i2NOFAj+WABgB/opC51nMo2Y1IATQmujf65zOrE6/F5nkt9p1VQndRjjGgWKA
	 BIXxkU5jaPswsFDUAMpdwtjIppVZ2741hOZTVsBIZZIxOiKDZw+kIROL2wQ43Znh+FtBs
	 Q5/ILZMdqR+Teo2Jor+zlroSFBI4kardaO7dRnzeOPgtRmAAydg2Pnb6pRUbVmmlfCiTU
	 Vw8fTxvfB3qrkyn6TLmnmbNpVpeSJnxHOnv6Bfisjj8DZSF64Y4ev/ToH+oWTK8wt4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794654596;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Nkz6IOsKVX4CAJi41DV4Lpiz9U6GxjKdS2J9FEVnLac=;
	b=Xgj/sQGh1fxSvB4MTnD5UIFTp0efRsN4d5ipMnrpAjEEL4tGoAfMREddGEefQGm3Y4IF
	 /zFl9qnlPgNcjbs1PN+d6KSVu6mWJal1OFpR7t+VZNQMvslsCv9iFO6C5Dj/sWPpMPiqM
	 IzafM128WjKNWHqs21eiL2Q0EwNUM/J1Of+Uc2IpwPU8pSsD2kE0k9sZgCWS0eur2/djV
	 MsBElwwZLKZpdB2/3UsqS52b/DZTnT25G+vO58xyTUa0Ocd3gzKRyLFkmtqSxG2BY1i8l
	 jek+bzlhdUIedrJqpFmdo7x+DIXeZLKAEcsPrWalBPVhXn3EgsI/jRKVA0Du/SfZ+vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E9C606A329;
	Sat, 14 Nov 2026 11:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E9C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSBdk-000000003y2-0SSB;
	Sat, 14 Nov 2026 11:09:48 +0000
Date: Sat, 14 Nov 2026 11:09:45 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>, Marc Zyngier <maz@kernel.org>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] media: rkvdec: vdpu346: Limit HEVC EXT SPS RPS dimensions
Message-ID: <c4ce1bb36e2e02cca1ca240f88c817b28e7bf686.1794654074.git.daniel@makrotopia.org>
References: <cover.1794654074.git.daniel@makrotopia.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794654074.git.daniel@makrotopia.org>

The VDPU346 control table registers the HEVC EXT_SPS_ST_RPS and
EXT_SPS_LT_RPS controls with 65 elements each. struct rkvdec_rps holds
64 short term sets and 32 long term references, the limits of ITU-T
H.265 7.4.8 and 7.4.3.2.1, and the VDPU346 shares that table with the
VDPU381.

Register the controls with 64 and 32 elements, the dimensions the
VDPU381 and VDPU383 use since commit f0b9d7e5be06 ("media: rkvdec:
hevc: tighten EXT SPS RPS control dimensions").

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v4: new patch

---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 119564e33877d..ba61e373b4342 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -278,12 +278,12 @@ static const struct rkvdec_ctrl_desc vdpu346_hevc_ctrl_descs[] = {
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS,
 		.cfg.ops = &rkvdec_ctrl_ops,
-		.cfg.dims = { 65 },
+		.cfg.dims = { 64 },
 	},
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS,
 		.cfg.ops = &rkvdec_ctrl_ops,
-		.cfg.dims = { 65 },
+		.cfg.dims = { 32 },
 	},
 };
 
-- 
2.56.0
