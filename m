Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80279388377
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 20:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791146936; cv=none; b=JYqS8TXyuGc2TQDjmCkaBRhoWdHAb7To1TtOC3CkQIaJwQKpvzCn/rfNM1prfZiaV3y8J06oqxUUnTUP7Xs3/s/f6cyDihXpP3IhkZkt39tVj38N9oRVOUkFsRZd0/95VDvE3J6Bm8E0MhOQ2LwonXMz9R2hIDE9kJ+lGdIqP2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791146936; c=relaxed/simple;
	bh=OcJVs5yn0YnQaQ4cSxKF5bO4C3o583LMnGdciACqpJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Z/Q/WLRo+/ogt5MI8nx1dE7bHm4nB9wtPckkerbDGSAXbuWuPYks0fhymVaq5PgytwyGW5/qjlyYj+4xF3Oh4i2u9W2N1qBsObJLQB9IwNwSVWJuNuuq+XB7IK2JAhsoc5LZEBN2G3x/P0UEraYWYyPNwRqyvZABB0jq4PioyBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SU7b3zuJ; arc=none smtp.client-ip=74.125.231.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SU7b3zuJ"
Received: by mail-oo2-f8.google.com with SMTP id 46e09a7af769-81d53a6ca68so1869565a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 13:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791146933; x=1791751733; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=64dx1BbNweAnxiSqrDwTCBobsnxCeoMwaSiq5ZXWTOc=;
        b=SU7b3zuJsXhyOAer7JoytkYw+EqZANM9AmAA0ZI6DCRECgbLLng9eJOGAKPenWPHGG
         aanIcJZe3n0nwTN3ewyICmK55otow/G5aez7mGIvUFWnLxo3osp2s53L3pIHmq0/5GXQ
         zGQAR0LlQVrVKhjiN47+3aqozyqpzh+ifeWP1V8WocdGJnWf6mXUsT8HgZD7Z4Mxxo1j
         SwaCT/Uoi0hgyocToH13ZNSJh/L830JSiny+ut9ja5KP8FPrwTxUAcAYn8PJMVepz5mf
         Hi85GXKwiJVKDOTEQxTbfzAgzoYfVhIbeDlHIrZZuv293sI5r6AzTvUmNN2zNFHiGmOL
         bSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791146933; x=1791751733;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=64dx1BbNweAnxiSqrDwTCBobsnxCeoMwaSiq5ZXWTOc=;
        b=ZShZgaoV9OkBOx/XQzHDBdrQnEMODdB7IvEb4uSrTWordHoWeICbCT8urmvxM555dM
         mAND9gLNzk7b8NTthOcY91GYCdqv1Xfztp1TcN1KDXGH9rrljmyBPrtLx0TNaeerAgio
         q0ggLVjnjabTHgUytH4mWd7P8Mv4cDhtEl7aNg+r2Rse1DKa6A2XMgvZGjeWhIJqEmrT
         6RblPHesCfa73uendvM/s4J/dsboRlMQQlMtNm8blr4+oJYpn86zaG3Q6bznY4U1r00t
         zU4GaiAfgxm6Msqfo6TuaskK/3W6zyBhmFzk6Gvq6aTr5f0ROoou2WKiDKKYINo24Ikx
         DmXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzapAgMJERFHUStfxiZ2V0lBStHmZdgbWE1+K91M8cKPOWNM2Ks5gnuN6Ae7POP3EU43kf42NzS0f/Fd1Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lOUv7zr2rqfvzh1jt9Q1gfYjuD+QUEaPV9VlwIpBMg5Ta7rYkK
	VzdVO8cxHMAq2/XLYKO/aFuUNkWp5TSiAuLWdvRe7TYTeYlVbsCzSvwe
X-Gm-Gg: AYBFou3svWCDRI2SwOvYuQb9WI2jrE1gccJPHIsUzu6quqXjDtbCYyTetXt+amEmEMu
	P5IkGc+23qeuNFwcfmynUCcIvK1kYJOXLgSdmtut4AQl/M+UF0gDeQcj+vmGm/+dj4PPt70u1Ui
	VwSWs7A7sIeLY/ERyDWEDFYJnm42MiIGSQFuH1F4pyeQaOqLeFGHYhDsTWgAQWqn8UngTfRTPcX
	WxDMHR/vBx8PzFuHfVjjuZUvY9xLdBmUZ+V0bscZfc5a0hZo0u5IB1eXZ7LpVlGpuyXU2VGHsfN
	BhH4k0S7yorWooBluNgEuWGSHOpYaNYMspPNYPQbkc7FdVw5g2lfmAxE7RU457xn9mMxXKXZKMH
	fVY2+lOxUfezTqRI7HiUokKLmmlW45b4piGCTSjTu1Xf7LqWYXuQFVNi7gCZ3+NwidCD5Kc361q
	3+oRnZw1zLDQun7A23Qq5sKpecWgwTI2UVvlihge73AprFK4ZyvTUXrqO57RxjQ6zeV7dIiGjZR
	FYK
X-Received: by 2002:a05:6820:8cc:b0:6dd:5f11:2772 with SMTP id 006d021491bc7-6e09eb5bb95mr4694735eaf.67.1791146933277;
        Sun, 04 Oct 2026 13:48:53 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6df3bb8ed63sm7997183eaf.15.2026.10.04.13.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 13:48:52 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 04 Oct 2026 15:48:44 -0500
Subject: [PATCH RESEND] drm/mediatek: dsi: force command mode in
 mtk_dsi_poweron()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791146930; l=2760;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=OcJVs5yn0YnQaQ4cSxKF5bO4C3o583LMnGdciACqpJE=;
 b=1l4cNu6iSTNSIv+NG3qt0kh7o+fG3x0bWp03ylDgdgiAL0DWdqVdOTa9xSzUY40MnsckbQ/8g
 XtXLdSNzganBnvGGX4IVpkwFUR+rd0uh9jLeNxs4jVcDEwbAksd83xb
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

mtk_dsi_reset_engine() does not touch DSI_MODE_CTRL, so whatever the
bootloader left there survives power-on. On boards where the bootloader
lights the panel for a boot logo and hands the DSI over still running, the
leftover value is a video mode, and the first mtk_dsi_host_transfer() then
takes the "already streaming" path: it stops the stream and waits for
VM_DONE, which never arrives, because the engine reset has already stopped
the stream. The panel's very first command fails and it is never
initialised:

  [drm] Wait DSI IRQ(0x00000008) Timeout
  *ERROR* failed to switch cmd mode
  sending dcs data 8f a5 failed: -62

Set command mode right after the engine reset, so DSI_MODE_CTRL describes
the state the reset leaves the engine in. The video mode is programmed by
mtk_dsi_set_mode() when the stream is actually started, exactly as today.

Seen on the Amazon Fire HD 10 (2017), whose LK bootloader draws its logo
over DSI in video mode and never stops the stream before jumping to the
kernel.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
The board this was found on, an Amazon Fire HD 10 (2017), is not upstream
yet, so no in-tree board regresses without this. It is a state-consistency
fix either way: mtk_dsi_reset_engine() stops the stream but leaves
DSI_MODE_CTRL still describing the mode the bootloader was driving, and
nothing writes that register again until mtk_dsi_set_mode() at stream start.

This touches the same lines as "drm/mediatek: mtk_dsi: Transfer register
offsets to per-SoC const" from the MT8196 series; I will rebase on top of
that if it lands first.
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 7961139333ad..4cb486f54653 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -737,6 +737,15 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 		       dsi->regs + dsi->driver_data->reg_shadow_dbg_off);
 
 	mtk_dsi_reset_engine(dsi);
+
+	/*
+	 * mtk_dsi_reset_engine() leaves DSI_MODE_CTRL alone, so a video mode
+	 * left there by a bootloader that handed the panel over still running
+	 * would make the first command wait for a VM_DONE that never arrives.
+	 * mtk_dsi_set_mode() programs the real mode when the stream starts.
+	 */
+	mtk_dsi_set_cmd_mode(dsi);
+
 	mtk_dsi_phy_timconfig(dsi);
 
 	mtk_dsi_ps_control(dsi, true);

---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260916-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-d834c029f4b8

Best regards,
--
Ryan Brue <ryanbrue.dev@gmail.com>
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

