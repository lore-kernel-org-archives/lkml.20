Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305289;
	b=pYQfnE+np45R5IBfGSjvfhUyjPUsCMrNgRC589TUQQ17Rqm+ZWWL+ZXJOmzJZZ/9nKle
	 TcU/KDUm2C4xTMYtBWsp3+I71OuOvrQ6NRt9TyxcXROLro011L5f1rkMfyPvHAu+abvjQ
	 AQVo83NifiAjBIzFlUEsKUaJ+5HI+askho810r9JYYbDk8KsEEfjEvXeXHXaF30OCnLSp
	 Vdvq3xLHez6YHizD4OF4Zl7b/dvRN0SglLx6vcbE+gqA0yDkZk4iMfpLDcS46AL2YWwxP
	 PNEP+gv5meqNaKvvAY4IYMAiq/MBMAm8OxVa5wFGimCDaHh06AiPeRYWy2CRa/SK8aQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305289;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mzP6mkQqBJ2czTJ6YFbl+lnGd5vAEuykbrNW2Ee3wlw=;
	b=gAWF7a2lLcWmHyRZbYY5bmb2nsRZ1Lvg9w77j+f4/vzxhcJSpi8xWKUkGWpgpY5oGFR/
	 6yrMGGtbvHcDhRqiz8O0YykjLf5Jg6e/IG0q2AMn2lbrtTNcS4CqAqOoE9SkQMWtpYYnO
	 ZvzU3U2KyAqaMT9KrExyyt/KhpYpaHcMKIDkZdLxIOwK8GKrF/z97sjC7X1vwiPxNex0i
	 9nRfXfoKFGBBYDDDon4LZpPUBK8r2fiGZwgxH2tk3tePvk//aOFHZQPymQaBDk6ANDjWg
	 F/sDyEuZf7ascR7bhq4wIBmHU2/WSKRTkXZh2wmbJ45wHF7jRGqTtz5znSacv/cHI6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fvu3+TlR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E392606AA76;
	Tue, 10 Nov 2026 10:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fvu3+TlR
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305288;
	b=ioEWTgqQE02D0MPYzd5vPmrvYwlhkcVDFE6fpRSS0QM1x0hrlpZU92zn3Zhtyp6qj2At
	 rRcGbfuzjQsGX7PH1T8X+sGb9ps9j6iSKR1ouzYJhJHWHKVxgTekbCH6D14+AIVXeZ6af
	 zNDKvwuTcFSSKXXY6XSWdJv3eB8UhNp+fQFGFf0gc00aghoRaUG4pcesurg92gm42vJBw
	 hnjQTg3hem8WIHxxqXW7iRTi7tuDod5Rg0Pq5UM7dCbBnB9Gb/8BQrEz3jNVpwNtyrK9Z
	 4Gqpn2MD8PyWzjFWnrgADp4f82WNsWq5I3/kOGO377TXLsXIym652ZDeCnUjpnUOzxw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305288;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mzP6mkQqBJ2czTJ6YFbl+lnGd5vAEuykbrNW2Ee3wlw=;
	b=xyp/PhThgCrhTB5aK98GWMZBor7c0EMXr0aArUasOcooCjjLa5aljeTpo1/ngLZRwpAt
	 rihWe4QK80fZbHwyKx5jFjL3FCQ6bJugJUb9Za49MQZPWLadHPGIf1LplsY4cb/QLniis
	 CzOJkjPviH0jtVMEK7TcJz+jeU0orCqLt/FGHl2uOA3MikwgIlMz4dHefc2M6SBY5uoQg
	 Qu51M8X0vVVLj1CNyAF4HCHaMycq1r/pBSywpQKbHkOEPFJ6hyN7BrW60s6VQKUSGx8ac
	 M+6jAn4dwqhG0IUZVJ5Qdf2+lvwLWsOv1rfWN2t/xpdX/OjxUJe2qQxoRs/AKJol/Qg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EB3871F008A7;
	Tue, 10 Nov 2026 10:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305288;
	bh=mzP6mkQqBJ2czTJ6YFbl+lnGd5vAEuykbrNW2Ee3wlw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fvu3+TlRkSnAhuihviT2A9Cb+zrd8Sk9oVa5F/NEmKenDSUHxww12al8TtIiUC9g7
	 kjDx+AT51ZLqlfvRYo6kuo5HkbB08JzuT46qfWASANG405KI76RgRrvf6EKKz4ZRCT
	 3pOo1WDNduD6C4/YSRClGOGnhOLYaa92SJadDp6OissOeHVlWBvrd3H+0nHQcOUQmx
	 pyrypWPKDa+T5ygq1mDEgLIKQcnjp6u+yfC4W6xW5TS1GfjANKtyrUPZs6MeMaFnVR
	 dA31ok/p101h+RPEvwtRlkaLrLknnUKymWAWhYzKSFH3rxzM4TF3KRLKAnUGKPXSwx
	 6htTbUqxAbP2Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9263C48AD3;
	Tue, 10 Nov 2026 10:08:04 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:08:07 +0000
Subject: [PATCH RFC 05/12] media: rockchip: rkvenc: Don't enable adaptive
 QP with the row rate control
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
Message-Id: <20261110-rkvenc-v1-5-ea8b47122d8c@gmail.com>
References: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
In-Reply-To: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Jiaxing Hu <gahing@gahingwoo.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305283; l=3648;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=tLKMbjBrFkOCagEOqlv6uXY4NBsMdfw5qJbiBJd+iIo=;
 b=lo5eJNn04MYXqUEt3tXUrIg0BJZcQ1BF25ZTy1Dqp4LeRaO2C6Z2alDIUl2ex+h914cJCyJpJ
 LIXBslSRMkrD5CnUnYMQtMvnUy1f0KtwL+36JX2yy8vJpJ/t0RvgIji
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The row rate control setup enables the texture adaptive QP (aq_en) with
MPP's MADI threshold and QP step tables, as MPP does. On the board it
costs PSNR at the same bitrate in every case measured: 0.7-1.3 dB for
H.264 (where SSIM drops too) and 0.3-0.7 dB for HEVC (1080p60 clips, 2 to
16 Mb/s, CBR). Leave it off: only the row size deviation moves the QP
within a picture, and the aq_mode field of the row rate control
parameters goes away.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/rockchip/rkvenc/rkvenc-hevc.c    | 3 +--
 drivers/media/platform/rockchip/rkvenc/rkvenc-vepu580.c | 9 ++++++---
 drivers/media/platform/rockchip/rkvenc/rkvenc.h         | 2 --
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc-hevc.c b/drivers/media/platform/rockchip/rkvenc/rkvenc-hevc.c
index 5bc6960a521a..a3d35a7fdc3f 100644
--- a/drivers/media/platform/rockchip/rkvenc/rkvenc-hevc.c
+++ b/drivers/media/platform/rockchip/rkvenc/rkvenc-hevc.c
@@ -40,12 +40,11 @@ static const struct v4l2_hevc_enc_rps_limits rkvenc_hevc_rps_limits = {
 
 /*
  * Row rate control: MPP's HEVC deviation thresholds are {2n, n, p, 2p}
- * with the adjustments {-2, -1, 0, 1, 2} and AQ mode 1.
+ * with the adjustments {-2, -1, 0, 1, 2}.
  */
 static const struct vepu580_row_rc rkvenc_hevc_row_rc = {
 	.qp_adj = { -2, -1, 0, 1, 2, 0, 0, 0, 0 },
 	.dthd_outer = 2,
-	.aq_mode = true,
 };
 
 static int rkvenc_hevc_state_constrain(struct v4l2_hevc_enc *enc,
diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc-vepu580.c b/drivers/media/platform/rockchip/rkvenc/rkvenc-vepu580.c
index ab23845a288d..86703dc659f6 100644
--- a/drivers/media/platform/rockchip/rkvenc/rkvenc-vepu580.c
+++ b/drivers/media/platform/rockchip/rkvenc/rkvenc-vepu580.c
@@ -805,7 +805,6 @@ void vepu580_setup_hevc_tuning(struct rkvenc_core *core, bool intra)
 const struct vepu580_row_rc vepu580_h264_row_rc = {
 	.qp_adj = { -2, -1, 0, 1, 2, 0, 0, 0, 1 },
 	.dthd_outer = 4,
-	.aq_mode = false,
 };
 
 void vepu580_setup_row_rc(struct rkvenc_core *core,
@@ -825,9 +824,13 @@ void vepu580_setup_row_rc(struct rkvenc_core *core,
 	thd = 5 * row_bits / 16;
 
 	rkvenc_or(core, VEPU580_ENC_PIC, FIELD_PREP(VEPU580_ENC_PIC_PIC_QP, qp));
+	/*
+	 * MPP also enables the texture adaptive QP here (aq_en). With its
+	 * tables that costs 0.3-1.3 dB of PSNR at the same bitrate (and SSIM
+	 * for H.264), so the QP only follows the row size deviation.
+	 */
 	rkvenc_set(core, VEPU580_RC_CFG,
-		   VEPU580_RC_CFG_RC_EN | VEPU580_RC_CFG_AQ_EN |
-		   (cfg->aq_mode ? VEPU580_RC_CFG_AQ_MODE : 0) |
+		   VEPU580_RC_CFG_RC_EN |
 		   FIELD_PREP(VEPU580_RC_CFG_RC_CTU_NUM, blocks_per_row));
 	rkvenc_set(core, VEPU580_RC_QP,
 		   FIELD_PREP(VEPU580_RC_QP_RANGE, qp_range) |
diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc.h b/drivers/media/platform/rockchip/rkvenc/rkvenc.h
index 3515ffc2b490..c2dd0bb91c51 100644
--- a/drivers/media/platform/rockchip/rkvenc/rkvenc.h
+++ b/drivers/media/platform/rockchip/rkvenc/rkvenc.h
@@ -264,12 +264,10 @@ void vepu580_setup_hevc_tuning(struct rkvenc_core *core, bool intra);
  * struct vepu580_row_rc - codec-specific row rate control parameters
  * @qp_adj: QP adjustment for each of the nine deviation buckets
  * @dthd_outer: multiple of the base threshold for the outer buckets
- * @aq_mode: value of rc_cfg.aq_mode
  */
 struct vepu580_row_rc {
 	s8 qp_adj[9];
 	unsigned int dthd_outer;
-	bool aq_mode;
 };
 
 extern const struct vepu580_row_rc vepu580_h264_row_rc;

-- 
2.55.0


