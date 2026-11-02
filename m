Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593957;
	b=BR60xMnLbGUKjhEm2Aa0WVVk1ugqenVfyCq+an6P/s54GnkbVfBLElC/T/wVn/KGrPqY
	 pkeXL95XiarFSqKS7glJWFTuOr1UExqBTGTs+eaCLET3Hs59iZaIltxndumCqFzIKHkx/
	 jqmI3ra08Jgc6QPE7hpfx7bVhA7MbGqc3m646vzsdWg4M9l8Ge7ciL12WTyrR/R187WUt
	 mBhXmtCZeeJETWyJcrTbWic6u1KPiLc+HPhkMR0jBF2dpT52TeSbADOzAI5hbXU81m+6x
	 lE01R1gUICyEyJrFJBpuFTzSEM832oGRHZDcTFOYfJYDWV8rO30FVkZmezzL3jNwtNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DS86y1R/e+vYAd5ZdbpE3wI/YqrQmdLU7KuNVVjn0j8=;
	b=mQWpiS2XWxHMMn8bToxt1Bq1+T0EayXCXXe0F89Ak176J5M9dZD2PbVG+VAg/mLbEpzV
	 zkwWDkrN8GY5Tu2IjMBogHh70OByiie/CFxrd8z4uDVHkFVqPwCZ5W5JNiXwx7QBOzHZs
	 z2JytC0pxlXRkbhYhuxjn/W7r1NDmCyf8HIOXtX2eYfddJ1qu/pJkZtYdR5SKAigCs5yj
	 6npt8ZSI4LHZtHs/pFDowO1u9p+/LH/pimhB8OdfCDfWoLpUhSPLQYNbEB4TDeAnvUWE0
	 060VzP/IxRVDc2s34Yn3pjNXTtNR4XkZahh6082ZgTDUnK75ykbYRmp317DjRxdfYHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R1m9gC4J;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91AA606A334
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E91AA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R1m9gC4J
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36661f953e4so4134168eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793593956; x=1794198756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DS86y1R/e+vYAd5ZdbpE3wI/YqrQmdLU7KuNVVjn0j8=;
        b=R1m9gC4JVvwt9EoLktyQyjoTeE3RvhqMcdX4ygN4Ohrp57a/O+0gW6JPNCV7TxkQNx
         iSUflg2kOd7cSfGSWIfYMEBoEihuSk87Aq5MrGo954A+ENYQcxWInnbV4hXLmZld3/fG
         e0MXgX++H2u0lstI8SpCA5wogM8NgnE6tglrK5Qx/MAYifrv40uzjN8nEmxMAv1r5EKC
         eEeTMwgHyNLhONHF9pvQ6chFFgKZK7IfGTKuBfsCrSMgi6Af5ZqXNzZ3UmYK/94b4JON
         KQB9x4pev3RT7ULY8R0p+PzCTnBJiDib2FBRhyynKT1ClzPWHUv3gAcdBBLXhdYSCQkx
         2gTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793593956; x=1794198756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DS86y1R/e+vYAd5ZdbpE3wI/YqrQmdLU7KuNVVjn0j8=;
        b=CkXqVE+Ng2oHzorWvKQCQOeCyYFhlHmgqKXruAVEA+oWwiMs5SG77jGkrj3P7mWoKv
         HktzbfGDuu9Z/vWM3hIqOxmazaD10u7vx/SqvbpVX4f7I/2sXEFsHu8XQGJBYGZnAwvC
         vxgJRK9syQrzJz/mfxFjPI/nWR+DXkLYZ7H3SaVBEl0ej23lrkD/JkLK0sTqIfggi8G3
         OqEat6eQIUlw8gGm6CvBSgNafOYa5j44GcZvl3Nzsw7FqxfaApFGnMo3r5JtKeBNy6Sf
         3Eeu61a3tJ51ANI+OMovJVeMkflIJeVWePT75ow0ezwnJasxiNf9qzKqncKPD48FRD1m
         bmXw==
X-Forwarded-Encrypted: i=1; AKwUvByrSBOCI5UDPMuH9/48pehM5tOIXZWrRGRXL+oAbB3DXXpe/6FpRVMt+2xkxl6N7QyPE1rWW7hz0At+dNo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/4jjxm9nsPJLt4HnutWyCa2KC3h/pMsTColp+085T4hFFBSP2
	FPNZpEzICGhbHk2fAYPp4bj/vMhZ2m2bph9v4fX2V/Naz/JS6VUH7y9S
X-Gm-Gg: AYBFou0Wlw8OfQsnhB43H+dOVlTMjntvtLyUSWMTwJXuQhkeEu5iHk2dysqRTMv3IJL
	ZPYgnQqI4ibzzdXl2ha0PnSPR+8nu3Jp8UvtWyxGGjAya+3mqYZXSCZY4hCaikW9unTYBMdBMsK
	EK54zTpugFnbDz1HlbtcUE7kOfTcmLGG0gksRG0kbrRYbrbJ/8oPiQIRHfZGhFROssNGfSeBOqJ
	z23iS/W7A1TbOb6s1ip1qYKHh/7AbzQwZRWmv2AUIMr1MD+QY2d/odzIneRaVimt1k9vt+fneTe
	Y77xTl6OZNqNaTOHO4mGsealkPqbepWy8JK49K4IH81zt0uWZGunv3aRJ/uEdt2TRgiMjtq8vky
	YGyZDsF3IBQTQjV5ktGCzeLFHNgrUATGJkKaD1xdsqZIPlKgbladQDCoPdPGBgOoxz7/33FaP2H
	76FQVpJGw2pMw5cHEsmHvuWMHo66j9m0m9zRS1y7cz+zaT4B9zdtVrC/7sbs79OvbmndloOXOlX
	scZDUOWbHEFtkCLd43JIAkuPFGtBrrKIC9vgQ7LX9quq/k/l4+pR3w4VW7rGi8idXIIAMUhQlwX
	gxDhw/oZZmqyh3ROjWw5GMI0FsTh/sVxOlF2M8xP2dGnWrKv/TUEa91IzUP3nP6osjOMApc++Sb
	/03D1HAJPRWN82MsGLDXXCqJDOUXexqCwE04tEEY=
X-Received: by 2002:a05:7301:1886:b0:35e:6eae:c01a with SMTP id 5a478bee46e88-36a4237d9d5mr14161509eec.19.1793593955580;
        Sun, 01 Nov 2026 20:32:35 -0800 (PST)
Received: from NB150512.ADVANTECH.CORP (118-163-147-185.hinet-ip.hinet.net. [118.163.147.185])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm38581063eec.26.2026.11.01.20.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:32:35 -0800 (PST)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: dianders@chromium.org,
	neil.armstrong@linaro.org,
	jesszhan0024@gmail.com
Cc: jagan@amarulasolutions.com,
	osama.abdelkader@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH v2 4/5] drm/panel: raydium-rm68200: Use mipi_dsi_*_multi() functions
Date: Mon,  2 Nov 2026 12:32:14 +0800
Message-ID: <20261102043215.990351-5-hungen3108@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102043215.990351-1-hungen3108@gmail.com>
References: <20261102043215.990351-1-hungen3108@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated MIPI DSI DCS helpers and custom DCS write
wrappers with their multi-context equivalents.

Preserve individual DCS transactions for registers that do not support
auto-increment. Share the multi-context with rm68200_init_sequence()
so that initialization failures stop subsequent DCS transfers and
cause prepare() to fail instead of only being logged. Errors are
handled by the cleanup path in prepare().

Use mipi_dsi_msleep() to skip delays after a failed command. In
unprepare(), clear accum_err between commands so that ENTER_SLEEP_MODE
is still attempted if SET_DISPLAY_OFF fails.

The new helpers log failures at error level. Initialization write
errors are no longer rate-limited.

Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---

Notes:
    Changes in v2:
    - Merge v1 patches 2/3 and 3/3, as suggested by Doug.
    - Route initialization and DCS command failures through the prepare()
      error cleanup path introduced earlier in this series.
    - Drop Doug's Reviewed-by tag from v1 3/3 because the patches were
      merged and the error handling was reworked.
    
    Validation:
    - Mechanically compared all 58 initialization calls against v1.
      Command addresses, payloads, and ordering are unchanged.
    - Verified the expansion of dcs_write_cmd_seq() in v1 using
      preprocessed output, confirming that each register address is
      written in a separate DCS transaction. The macro is unchanged
      from v1.
    
    The uppercase hexadecimal literals are retained in this patch.
    Their formatting will be addressed separately in the next patch.

 drivers/gpu/drm/panel/panel-raydium-rm68200.c | 208 ++++++++----------
 1 file changed, 91 insertions(+), 117 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm68200.c b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
index 3a59eb00274d..8ce89f09540c 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm68200.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
@@ -98,149 +98,123 @@ static inline struct rm68200 *panel_to_rm68200(struct drm_panel *panel)
 	return container_of(panel, struct rm68200, panel);
 }
 
-static void rm68200_dcs_write_buf(struct rm68200 *ctx, const void *data,
-				  size_t len)
-{
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int err;
-
-	err = mipi_dsi_dcs_write_buffer(dsi, data, len);
-	if (err < 0)
-		dev_err_ratelimited(ctx->dev, "MIPI DSI DCS write buffer failed: %d\n", err);
-}
-
-static void rm68200_dcs_write_cmd(struct rm68200 *ctx, u8 cmd, u8 value)
-{
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int err;
-
-	err = mipi_dsi_dcs_write(dsi, cmd, &value, 1);
-	if (err < 0)
-		dev_err_ratelimited(ctx->dev, "MIPI DSI DCS write failed: %d\n", err);
-}
-
-#define dcs_write_seq(ctx, seq...)				\
-({								\
-	static const u8 d[] = { seq };				\
-								\
-	rm68200_dcs_write_buf(ctx, d, ARRAY_SIZE(d));		\
-})
-
 /*
  * This panel is not able to auto-increment all cmd addresses so for some of
  * them, we need to send them one by one...
+ *
+ * Use arr instead of d to avoid shadowing the local d[] declared by
+ * mipi_dsi_dcs_write_var_seq_multi().
  */
-#define dcs_write_cmd_seq(ctx, cmd, seq...)			\
-({								\
-	static const u8 d[] = { seq };				\
-	unsigned int i;						\
-								\
-	for (i = 0; i < ARRAY_SIZE(d) ; i++)			\
-		rm68200_dcs_write_cmd(ctx, cmd + i, d[i]);	\
-})
-
-static void rm68200_init_sequence(struct rm68200 *ctx)
+#define dcs_write_cmd_seq(dsi_ctx, cmd, seq...)			\
+	do {								\
+		static const u8 arr[] = { seq };			\
+		unsigned int i;						\
+									\
+		for (i = 0; i < ARRAY_SIZE(arr); i++)		\
+			mipi_dsi_dcs_write_var_seq_multi(dsi_ctx,	\
+							(cmd) + i, arr[i]); \
+	} while (0)
+
+static void rm68200_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
 {
 	/* Enter CMD2 with page 0 */
-	dcs_write_seq(ctx, MCS_CMD_MODE_SW, MCS_CMD2_P0);
-	dcs_write_cmd_seq(ctx, MCS_EXT_PWR_IC, 0xC0, 0x53, 0x00);
-	dcs_write_seq(ctx, MCS_BT2CTR, 0xE5);
-	dcs_write_seq(ctx, MCS_SETAVDD, 0x0A);
-	dcs_write_seq(ctx, MCS_SETAVEE, 0x0A);
-	dcs_write_seq(ctx, MCS_SGOPCTR, 0x52);
-	dcs_write_seq(ctx, MCS_BT3CTR, 0x53);
-	dcs_write_seq(ctx, MCS_BT4CTR, 0x5A);
-	dcs_write_seq(ctx, MCS_INVCTR, 0x00);
-	dcs_write_seq(ctx, MCS_STBCTR, 0x0A);
-	dcs_write_seq(ctx, MCS_SDCTR, 0x06);
-	dcs_write_seq(ctx, MCS_VCMCTR, 0x56);
-	dcs_write_seq(ctx, MCS_SETVGN, 0xA0, 0x00);
-	dcs_write_seq(ctx, MCS_SETVGP, 0xA0, 0x00);
-	dcs_write_seq(ctx, MCS_SW_CTRL, 0x11); /* 2 data lanes, see doc */
-
-	dcs_write_seq(ctx, MCS_CMD_MODE_SW, MCS_CMD2_P2);
-	dcs_write_seq(ctx, GOA_VSTV1, 0x05);
-	dcs_write_seq(ctx, 0x02, 0x0B);
-	dcs_write_seq(ctx, 0x03, 0x0F);
-	dcs_write_seq(ctx, 0x04, 0x7D, 0x00, 0x50);
-	dcs_write_cmd_seq(ctx, GOA_VSTV2, 0x05, 0x16, 0x0D, 0x11, 0x7D, 0x00,
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, MCS_CMD2_P0);
+	dcs_write_cmd_seq(dsi_ctx, MCS_EXT_PWR_IC, 0xC0, 0x53, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_BT2CTR, 0xE5);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETAVDD, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETAVEE, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SGOPCTR, 0x52);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_BT3CTR, 0x53);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_BT4CTR, 0x5A);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_INVCTR, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_STBCTR, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SDCTR, 0x06);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_VCMCTR, 0x56);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETVGN, 0xA0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETVGP, 0xA0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SW_CTRL, 0x11); /* 2 data lanes, see doc */
+
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, MCS_CMD2_P2);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, GOA_VSTV1, 0x05);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x02, 0x0B);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x03, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x04, 0x7D, 0x00, 0x50);
+	dcs_write_cmd_seq(dsi_ctx, GOA_VSTV2, 0x05, 0x16, 0x0D, 0x11, 0x7D, 0x00,
 			  0x50);
-	dcs_write_cmd_seq(ctx, GOA_VCLK1, 0x07, 0x08, 0x01, 0x02, 0x00, 0x7D,
+	dcs_write_cmd_seq(dsi_ctx, GOA_VCLK1, 0x07, 0x08, 0x01, 0x02, 0x00, 0x7D,
 			  0x00, 0x85, 0x08);
-	dcs_write_cmd_seq(ctx, GOA_VCLK2, 0x03, 0x04, 0x05, 0x06, 0x00, 0x7D,
+	dcs_write_cmd_seq(dsi_ctx, GOA_VCLK2, 0x03, 0x04, 0x05, 0x06, 0x00, 0x7D,
 			  0x00, 0x85, 0x08);
-	dcs_write_seq(ctx, GOA_VCLK_OPT1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-		      0x00, 0x00, 0x00, 0x00);
-	dcs_write_cmd_seq(ctx, GOA_BICLK1, 0x07, 0x08);
-	dcs_write_seq(ctx, 0x2D, 0x01);
-	dcs_write_seq(ctx, 0x2F, 0x02, 0x00, 0x40, 0x05, 0x08, 0x54, 0x7D,
-		      0x00);
-	dcs_write_cmd_seq(ctx, GOA_BICLK2, 0x03, 0x04, 0x05, 0x06, 0x00);
-	dcs_write_seq(ctx, 0x3D, 0x40);
-	dcs_write_seq(ctx, 0x3F, 0x05, 0x08, 0x54, 0x7D, 0x00);
-	dcs_write_seq(ctx, GOA_BICLK3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-		      0x00, 0x00, 0x00, 0x00, 0x00);
-	dcs_write_seq(ctx, GOA_BICLK4, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-		      0x00, 0x00);
-	dcs_write_seq(ctx, 0x58, 0x00, 0x00, 0x00);
-	dcs_write_seq(ctx, GOA_BICLK_OPT1, 0x00, 0x00, 0x00, 0x00, 0x00);
-	dcs_write_seq(ctx, GOA_BICLK_OPT2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-		      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
-	dcs_write_seq(ctx, MCS_GOA_GPO1, 0x00, 0x00, 0x00, 0x00);
-	dcs_write_seq(ctx, MCS_GOA_GPO2, 0x00, 0x20, 0x00);
-	dcs_write_seq(ctx, MCS_GOA_EQ, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
-		      0x00, 0x00);
-	dcs_write_seq(ctx, MCS_GOA_CLK_GALLON, 0x00, 0x00);
-	dcs_write_cmd_seq(ctx, MCS_GOA_FS_SEL0, 0xBF, 0x02, 0x06, 0x14, 0x10,
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, GOA_VCLK_OPT1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00);
+	dcs_write_cmd_seq(dsi_ctx, GOA_BICLK1, 0x07, 0x08);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x2D, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x2F, 0x02, 0x00, 0x40, 0x05, 0x08, 0x54, 0x7D,
+				     0x00);
+	dcs_write_cmd_seq(dsi_ctx, GOA_BICLK2, 0x03, 0x04, 0x05, 0x06, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3D, 0x40);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3F, 0x05, 0x08, 0x54, 0x7D, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, GOA_BICLK3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, GOA_BICLK4, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x58, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, GOA_BICLK_OPT1, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, GOA_BICLK_OPT2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_GOA_GPO1, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_GOA_GPO2, 0x00, 0x20, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_GOA_EQ, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_GOA_CLK_GALLON, 0x00, 0x00);
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL0, 0xBF, 0x02, 0x06, 0x14, 0x10,
 			  0x16, 0x12, 0x08, 0x3F);
-	dcs_write_cmd_seq(ctx, MCS_GOA_FS_SEL1, 0x3F, 0x3F, 0x3F, 0x3F, 0x0C,
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL1, 0x3F, 0x3F, 0x3F, 0x3F, 0x0C,
 			  0x0A, 0x0E, 0x3F, 0x3F, 0x00);
-	dcs_write_cmd_seq(ctx, MCS_GOA_FS_SEL2, 0x04, 0x3F, 0x3F, 0x3F, 0x3F,
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL2, 0x04, 0x3F, 0x3F, 0x3F, 0x3F,
 			  0x05, 0x01, 0x3F, 0x3F, 0x0F);
-	dcs_write_cmd_seq(ctx, MCS_GOA_FS_SEL3, 0x0B, 0x0D, 0x3F, 0x3F, 0x3F,
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL3, 0x0B, 0x0D, 0x3F, 0x3F, 0x3F,
 			  0x3F);
-	dcs_write_cmd_seq(ctx, 0xA2, 0x3F, 0x09, 0x13, 0x17, 0x11, 0x15);
-	dcs_write_cmd_seq(ctx, 0xA9, 0x07, 0x03, 0x3F);
-	dcs_write_cmd_seq(ctx, MCS_GOA_BS_SEL0, 0x3F, 0x05, 0x01, 0x17, 0x13,
+	dcs_write_cmd_seq(dsi_ctx, 0xA2, 0x3F, 0x09, 0x13, 0x17, 0x11, 0x15);
+	dcs_write_cmd_seq(dsi_ctx, 0xA9, 0x07, 0x03, 0x3F);
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL0, 0x3F, 0x05, 0x01, 0x17, 0x13,
 			  0x15, 0x11, 0x0F, 0x3F);
-	dcs_write_cmd_seq(ctx, MCS_GOA_BS_SEL1, 0x3F, 0x3F, 0x3F, 0x3F, 0x0B,
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL1, 0x3F, 0x3F, 0x3F, 0x3F, 0x0B,
 			  0x0D, 0x09, 0x3F, 0x3F, 0x07);
-	dcs_write_cmd_seq(ctx, MCS_GOA_BS_SEL2, 0x03, 0x3F, 0x3F, 0x3F, 0x3F,
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL2, 0x03, 0x3F, 0x3F, 0x3F, 0x3F,
 			  0x02, 0x06, 0x3F, 0x3F, 0x08);
-	dcs_write_cmd_seq(ctx, MCS_GOA_BS_SEL3, 0x0C, 0x0A, 0x3F, 0x3F, 0x3F,
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL3, 0x0C, 0x0A, 0x3F, 0x3F, 0x3F,
 			  0x3F, 0x3F, 0x0E, 0x10, 0x14);
-	dcs_write_cmd_seq(ctx, MCS_GOA_BS_SEL4, 0x12, 0x16, 0x00, 0x04, 0x3F);
-	dcs_write_seq(ctx, 0xDC, 0x02);
-	dcs_write_seq(ctx, 0xDE, 0x12);
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL4, 0x12, 0x16, 0x00, 0x04, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xDC, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xDE, 0x12);
 
-	dcs_write_seq(ctx, MCS_CMD_MODE_SW, 0x0E); /* No documentation */
-	dcs_write_seq(ctx, 0x01, 0x75);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, 0x0E); /* No documentation */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x01, 0x75);
 
-	dcs_write_seq(ctx, MCS_CMD_MODE_SW, MCS_CMD2_P3);
-	dcs_write_cmd_seq(ctx, MCS_GAMMA_VP, 0x00, 0x0C, 0x12, 0x0E, 0x06,
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, MCS_CMD2_P3);
+	dcs_write_cmd_seq(dsi_ctx, MCS_GAMMA_VP, 0x00, 0x0C, 0x12, 0x0E, 0x06,
 			  0x12, 0x0E, 0x0B, 0x15, 0x0B, 0x10, 0x07, 0x0F,
 			  0x12, 0x0C, 0x00);
-	dcs_write_cmd_seq(ctx, MCS_GAMMA_VN, 0x00, 0x0C, 0x12, 0x0E, 0x06,
+	dcs_write_cmd_seq(dsi_ctx, MCS_GAMMA_VN, 0x00, 0x0C, 0x12, 0x0E, 0x06,
 			  0x12, 0x0E, 0x0B, 0x15, 0x0B, 0x10, 0x07, 0x0F,
 			  0x12, 0x0C, 0x00);
 
 	/* Exit CMD2 */
-	dcs_write_seq(ctx, MCS_CMD_MODE_SW, MCS_CMD1_UCS);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, MCS_CMD1_UCS);
 }
 
 static int rm68200_unprepare(struct drm_panel *panel)
 {
 	struct rm68200 *ctx = panel_to_rm68200(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret)
-		dev_warn(panel->dev, "failed to set display off: %d\n", ret);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret)
-		dev_warn(panel->dev, "failed to enter sleep mode: %d\n", ret);
+	/* Attempt to enter sleep mode even if display off failed. */
+	dsi_ctx.accum_err = 0;
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
 	msleep(120);
 
@@ -258,6 +232,7 @@ static int rm68200_prepare(struct drm_panel *panel)
 {
 	struct rm68200 *ctx = panel_to_rm68200(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	int ret;
 
 	ret = regulator_enable(ctx->supply);
@@ -273,19 +248,18 @@ static int rm68200_prepare(struct drm_panel *panel)
 		msleep(100);
 	}
 
-	rm68200_init_sequence(ctx);
+	rm68200_init_sequence(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret)
-		goto assert_reset;
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 
-	msleep(125);
+	mipi_dsi_msleep(&dsi_ctx, 125);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	ret = dsi_ctx.accum_err;
 	if (ret)
 		goto assert_reset;
 
-	msleep(20);
+	mipi_dsi_msleep(&dsi_ctx, 20);
 
 	return 0;
 
-- 
2.43.0

