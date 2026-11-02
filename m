Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593960;
	b=R0OgHnAqBxhvJDfGe9QEfxM0PFX/lKQfXy+2rUkSVEcF97P+PCcVTb49BUZ+3ZYO43Yw
	 Ork55LXlotGwEmtCiNC5ZMg4PDcnSieIWuCjZ1L9amu7uFyWOo9zy6IwyxpbyNi47hcK4
	 FARywC9AGgKiBE4DHY/VHY79otnFc53umvtMPnO4KbmNPtDPRE/WX0+appCf/OELTtU1l
	 MnJRU4mxvBfwoGLF02g5ubywArWgx0axUUlgPQdmT6kp1qPtW7OmtJ8qUC4KBy4pzap2i
	 Uk//pfgS3IpNU+HhuUJ6ODKvMSdsKwXzq4OUZoeVlZHvWdybfSXLqJRWsnujE5SGw8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K5j1pwkggFGWmolmU2OjJfiaIzHorqtOlyZmT6W8xzo=;
	b=mNtX4xUabt81d06533AWFmUQfZqBWp/PaUScCGZKTkPasuy0J/WHKTSGpuRsYTAKin+v
	 wHOs63jw50UnCUNS4JuVbQl+FwqSJ6U96/GaXCV+DnGLTDXWbycg3l/0OjmZe6mV/T0Bw
	 mP3m3Nt6G8ioi7acP9wKhT5UCuGD9dJZLVze7d2TKrhmoGJE30WSA35sit+mpwiNQhKwt
	 SiwIwpSrQayAmjN5otS6NsyrunInIiAn9q/wBgHmAmmYtTQWSL/Zv//kz87wo3jpTLwKJ
	 uCVUtEDFu01wZwgbTsgkcJs+sxPug1Qq3FIRFoNDwNF3QALdFRT1PR1qi64ukjVzS8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VZTDfbIL;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB42A606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB42A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VZTDfbIL
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso288029eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793593959; x=1794198759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5j1pwkggFGWmolmU2OjJfiaIzHorqtOlyZmT6W8xzo=;
        b=VZTDfbIL6cPyCSb0cC89yqZjKh1RmI58ZEiOkTVxoJch8hA639mqDLj7+1j7LMHLDB
         KYKdLAbKzTPCZY4a57hCsxbYwiaXvfZxpIFeN8HOBkQ6G/0IRxFuFDkaIbvxCzzSs+5s
         3ys9WxOaTQJ/o7WgGnByUnFEzPShWLvi3tFGatTzitY+u6onkvB9o8q6SUry0i+H7unV
         6RvPLwS1c9MxI0ndfACSDkZuLmjCL974lpry718OiPIPpN6wvLqQPavuSOhOASo9jWpf
         stCCUeHtBNZwVtV9m2kJb/qeVooYkdE5KdKj69XDvMUTYKLAougEC1uGjoKUdqtSxsm7
         t3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793593959; x=1794198759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5j1pwkggFGWmolmU2OjJfiaIzHorqtOlyZmT6W8xzo=;
        b=SiBO2IkrKXMwcUoFJ8OARCcboUOI8HeUFtREMgw+wkeCSOHKB9m0bt4ClN3fa5kUKt
         OiAUJ0XvWbzBtrLrClOkOwuAm3xOiuKlprRNep4GxYtW4woxFl1gG1dzuqTmDWo/MGEu
         Fvm7eiYiV2SE9j3uAp/jIK7amL9TX4vqyAzVDcqbXp6mgq2Q1o7NBPn3cGBL0mQ7O5hC
         h+k3yPiT42bJwp5ak5SK2s+DAXKhbGByem0g/I2d+xRE5yqvqORhdnlVEmEAAAVDvoR9
         O6ccmGzLZ02PBJoggj5z7pXfPfbzEQV2FUqBFuG1QiX9YEqV8KhenGQ3P8Sh2vbHTgnV
         8Xiw==
X-Forwarded-Encrypted: i=1; AKwUvBwzI8W9l0AqeqxsZbFzjFBfIxwIWzIaOv/CqDJpqMh/IHrxVZlHKPqbYq4ne7B+csV/vhQetv+nYzm1HUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mc4AFiTvgKEvazOqIxRFfvEuT9ZsHUuRtWWMCvZu/IaRmCLlp
	ZAEtx/kjxed1HCIWVbTDcPjzXlzpoKUQKDBG7EnVMAUzOjVMV4TBiVfo
X-Gm-Gg: AYBFou0Cqk+O6iVATNNi4cLAUIb/RWrL+u0jcbPovX5nnQ3utInxZ6Bx5wXT4mD0kUA
	hnMDIK002GvNLq/VbqFlEpLpNlxasp70BOrCFKpSTBF8AZr/VmifF8IL1RevobnZ45mvihoRaFU
	POd8fqyB40q039fLhb16oeXHTK6z+BmiFtLikE3P2MUMTGGBJXr3KdFrmEUOIps6FKPqtrmYE8q
	AA6OsrF2ZVDuYz/kEsmUKDqswiIk/UseLMZkcZL6oSOzNXVGwHdbPwuiFD+vUI9EvFBXXeSRlT6
	tNXDUjZRG8sxAlk7cg6dK6ZGTfzcv9Vo2WHydprKY2pQxg6Sg4+NDPqyfR7Lw+okTGLNj9VsGVO
	S1QfrY/FX6Ni6uqafjemZD9gSh77KznXkahecVU2zTS9PRToyLu0sRBDAh5rDVXDdRH1PzBnHMs
	3kryoPTwf/uZYeZ/pmCwvraqj1tkk9DLQF6hj4Wr+1Yl6BYyYv8lZbUX4kSUq7n/yP3ybxiuS/0
	B+lmyW/wyTeGwD5IDE9tPyT9GpxplajFMf8RkI7qQAp2j0gJid8jH3/+gkXMahBUMZeyZXLGbPF
	9uh4ifh28axJqb707UKalD45ERqDRfdubfg1q/4c+H8gKBkqFlQEHtKkt9qVRwuDh7S0eqzsD3t
	MiUAgOKyMUy17k6Ec8IqwkdUQi+t3MmWBBj7/JTHn
X-Received: by 2002:a05:693c:6382:20b0:366:f9c2:9b16 with SMTP id 5a478bee46e88-36a423f5d7amr14181136eec.31.1793593958509;
        Sun, 01 Nov 2026 20:32:38 -0800 (PST)
Received: from NB150512.ADVANTECH.CORP (118-163-147-185.hinet-ip.hinet.net. [118.163.147.185])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm38581063eec.26.2026.11.01.20.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:32:38 -0800 (PST)
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
Subject: [PATCH v2 5/5] drm/panel: raydium-rm68200: Use lowercase hex literals
Date: Mon,  2 Nov 2026 12:32:15 +0800
Message-ID: <20261102043215.990351-6-hungen3108@gmail.com>
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

Convert hexadecimal literals in the RM68200 register definitions and
initialization sequence to lowercase for consistency with the
preferred formatting convention.

This is a formatting-only change. Register addresses and command
data remain unchanged.

Suggested-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---

Notes:
    Changes in v2:
    - Add a separate patch to convert hexadecimal literals to lowercase,
      as suggested by Doug, keeping the _multi() conversion focused on
      functional changes.
    
    Validation:
    - Compared all 65 modified source lines after normalizing only the
      hexadecimal digits in literals. No other differences were found.
    - Confirmed that no uppercase hexadecimal literals remain.
    - Built the driver before and after the change using the same
      configuration. The .text, .rodata, .rodata.str1.8 and .data sections
      were byte-for-byte identical.
    - The build completed with W=1 and no warnings or errors.
      checkpatch reported no issues.

 drivers/gpu/drm/panel/panel-raydium-rm68200.c | 132 +++++++++---------
 1 file changed, 66 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm68200.c b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
index 8ce89f09540c..df99b6837057 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm68200.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
@@ -18,7 +18,7 @@
 #include <drm/drm_panel.h>
 
 /*** Manufacturer Command Set ***/
-#define MCS_CMD_MODE_SW		0xFE /* CMD Mode Switch */
+#define MCS_CMD_MODE_SW		0xfe /* CMD Mode Switch */
 #define MCS_CMD1_UCS		0x00 /* User Command Set (UCS = CMD1) */
 #define MCS_CMD2_P0		0x01 /* Manufacture Command Set Page0 (CMD2 P0) */
 #define MCS_CMD2_P1		0x02 /* Manufacture Command Set Page1 (CMD2 P1) */
@@ -28,44 +28,44 @@
 /* CMD2 P0 commands (Display Options and Power) */
 #define MCS_STBCTR		0x12 /* TE1 Output Setting Zig-Zag Connection */
 #define MCS_SGOPCTR		0x16 /* Source Bias Current */
-#define MCS_SDCTR		0x1A /* Source Output Delay Time */
-#define MCS_INVCTR		0x1B /* Inversion Type */
+#define MCS_SDCTR		0x1a /* Source Output Delay Time */
+#define MCS_INVCTR		0x1b /* Inversion Type */
 #define MCS_EXT_PWR_IC		0x24 /* External PWR IC Control */
 #define MCS_SETAVDD		0x27 /* PFM Control for AVDD Output */
 #define MCS_SETAVEE		0x29 /* PFM Control for AVEE Output */
-#define MCS_BT2CTR		0x2B /* DDVDL Charge Pump Control */
-#define MCS_BT3CTR		0x2F /* VGH Charge Pump Control */
+#define MCS_BT2CTR		0x2b /* DDVDL Charge Pump Control */
+#define MCS_BT3CTR		0x2f /* VGH Charge Pump Control */
 #define MCS_BT4CTR		0x34 /* VGL Charge Pump Control */
 #define MCS_VCMCTR		0x46 /* VCOM Output Level Control */
 #define MCS_SETVGN		0x52 /* VG M/S N Control */
 #define MCS_SETVGP		0x54 /* VG M/S P Control */
-#define MCS_SW_CTRL		0x5F /* Interface Control for PFM and MIPI */
+#define MCS_SW_CTRL		0x5f /* Interface Control for PFM and MIPI */
 
 /* CMD2 P2 commands (GOA Timing Control) - no description in datasheet */
 #define GOA_VSTV1		0x00
 #define GOA_VSTV2		0x07
-#define GOA_VCLK1		0x0E
+#define GOA_VCLK1		0x0e
 #define GOA_VCLK2		0x17
 #define GOA_VCLK_OPT1		0x20
-#define GOA_BICLK1		0x2A
+#define GOA_BICLK1		0x2a
 #define GOA_BICLK2		0x37
 #define GOA_BICLK3		0x44
-#define GOA_BICLK4		0x4F
-#define GOA_BICLK_OPT1		0x5B
+#define GOA_BICLK4		0x4f
+#define GOA_BICLK_OPT1		0x5b
 #define GOA_BICLK_OPT2		0x60
-#define MCS_GOA_GPO1		0x6D
+#define MCS_GOA_GPO1		0x6d
 #define MCS_GOA_GPO2		0x71
 #define MCS_GOA_EQ		0x74
-#define MCS_GOA_CLK_GALLON	0x7C
-#define MCS_GOA_FS_SEL0		0x7E
+#define MCS_GOA_CLK_GALLON	0x7c
+#define MCS_GOA_FS_SEL0		0x7e
 #define MCS_GOA_FS_SEL1		0x87
 #define MCS_GOA_FS_SEL2		0x91
-#define MCS_GOA_FS_SEL3		0x9B
-#define MCS_GOA_BS_SEL0		0xAC
-#define MCS_GOA_BS_SEL1		0xB5
-#define MCS_GOA_BS_SEL2		0xBF
-#define MCS_GOA_BS_SEL3		0xC9
-#define MCS_GOA_BS_SEL4		0xD3
+#define MCS_GOA_FS_SEL3		0x9b
+#define MCS_GOA_BS_SEL0		0xac
+#define MCS_GOA_BS_SEL1		0xb5
+#define MCS_GOA_BS_SEL2		0xbf
+#define MCS_GOA_BS_SEL3		0xc9
+#define MCS_GOA_BS_SEL4		0xd3
 
 /* CMD2 P3 commands (Gamma) */
 #define MCS_GAMMA_VP		0x60 /* Gamma VP1~VP16 */
@@ -119,41 +119,41 @@ static void rm68200_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
 {
 	/* Enter CMD2 with page 0 */
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, MCS_CMD2_P0);
-	dcs_write_cmd_seq(dsi_ctx, MCS_EXT_PWR_IC, 0xC0, 0x53, 0x00);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_BT2CTR, 0xE5);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETAVDD, 0x0A);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETAVEE, 0x0A);
+	dcs_write_cmd_seq(dsi_ctx, MCS_EXT_PWR_IC, 0xc0, 0x53, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_BT2CTR, 0xe5);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETAVDD, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETAVEE, 0x0a);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SGOPCTR, 0x52);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_BT3CTR, 0x53);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_BT4CTR, 0x5A);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_BT4CTR, 0x5a);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_INVCTR, 0x00);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_STBCTR, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_STBCTR, 0x0a);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SDCTR, 0x06);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_VCMCTR, 0x56);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETVGN, 0xA0, 0x00);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETVGP, 0xA0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETVGN, 0xa0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETVGP, 0xa0, 0x00);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SW_CTRL, 0x11); /* 2 data lanes, see doc */
 
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, MCS_CMD2_P2);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, GOA_VSTV1, 0x05);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x02, 0x0B);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x03, 0x0F);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x04, 0x7D, 0x00, 0x50);
-	dcs_write_cmd_seq(dsi_ctx, GOA_VSTV2, 0x05, 0x16, 0x0D, 0x11, 0x7D, 0x00,
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x02, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x03, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x04, 0x7d, 0x00, 0x50);
+	dcs_write_cmd_seq(dsi_ctx, GOA_VSTV2, 0x05, 0x16, 0x0d, 0x11, 0x7d, 0x00,
 			  0x50);
-	dcs_write_cmd_seq(dsi_ctx, GOA_VCLK1, 0x07, 0x08, 0x01, 0x02, 0x00, 0x7D,
+	dcs_write_cmd_seq(dsi_ctx, GOA_VCLK1, 0x07, 0x08, 0x01, 0x02, 0x00, 0x7d,
 			  0x00, 0x85, 0x08);
-	dcs_write_cmd_seq(dsi_ctx, GOA_VCLK2, 0x03, 0x04, 0x05, 0x06, 0x00, 0x7D,
+	dcs_write_cmd_seq(dsi_ctx, GOA_VCLK2, 0x03, 0x04, 0x05, 0x06, 0x00, 0x7d,
 			  0x00, 0x85, 0x08);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, GOA_VCLK_OPT1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 				     0x00, 0x00, 0x00, 0x00);
 	dcs_write_cmd_seq(dsi_ctx, GOA_BICLK1, 0x07, 0x08);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x2D, 0x01);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x2F, 0x02, 0x00, 0x40, 0x05, 0x08, 0x54, 0x7D,
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x2d, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x2f, 0x02, 0x00, 0x40, 0x05, 0x08, 0x54, 0x7d,
 				     0x00);
 	dcs_write_cmd_seq(dsi_ctx, GOA_BICLK2, 0x03, 0x04, 0x05, 0x06, 0x00);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3D, 0x40);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3F, 0x05, 0x08, 0x54, 0x7D, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3d, 0x40);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3f, 0x05, 0x08, 0x54, 0x7d, 0x00);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, GOA_BICLK3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 				     0x00, 0x00, 0x00, 0x00, 0x00);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, GOA_BICLK4, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -167,38 +167,38 @@ static void rm68200_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_GOA_EQ, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
 				     0x00, 0x00);
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_GOA_CLK_GALLON, 0x00, 0x00);
-	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL0, 0xBF, 0x02, 0x06, 0x14, 0x10,
-			  0x16, 0x12, 0x08, 0x3F);
-	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL1, 0x3F, 0x3F, 0x3F, 0x3F, 0x0C,
-			  0x0A, 0x0E, 0x3F, 0x3F, 0x00);
-	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL2, 0x04, 0x3F, 0x3F, 0x3F, 0x3F,
-			  0x05, 0x01, 0x3F, 0x3F, 0x0F);
-	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL3, 0x0B, 0x0D, 0x3F, 0x3F, 0x3F,
-			  0x3F);
-	dcs_write_cmd_seq(dsi_ctx, 0xA2, 0x3F, 0x09, 0x13, 0x17, 0x11, 0x15);
-	dcs_write_cmd_seq(dsi_ctx, 0xA9, 0x07, 0x03, 0x3F);
-	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL0, 0x3F, 0x05, 0x01, 0x17, 0x13,
-			  0x15, 0x11, 0x0F, 0x3F);
-	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL1, 0x3F, 0x3F, 0x3F, 0x3F, 0x0B,
-			  0x0D, 0x09, 0x3F, 0x3F, 0x07);
-	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL2, 0x03, 0x3F, 0x3F, 0x3F, 0x3F,
-			  0x02, 0x06, 0x3F, 0x3F, 0x08);
-	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL3, 0x0C, 0x0A, 0x3F, 0x3F, 0x3F,
-			  0x3F, 0x3F, 0x0E, 0x10, 0x14);
-	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL4, 0x12, 0x16, 0x00, 0x04, 0x3F);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xDC, 0x02);
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xDE, 0x12);
-
-	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, 0x0E); /* No documentation */
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL0, 0xbf, 0x02, 0x06, 0x14, 0x10,
+			  0x16, 0x12, 0x08, 0x3f);
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL1, 0x3f, 0x3f, 0x3f, 0x3f, 0x0c,
+			  0x0a, 0x0e, 0x3f, 0x3f, 0x00);
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL2, 0x04, 0x3f, 0x3f, 0x3f, 0x3f,
+			  0x05, 0x01, 0x3f, 0x3f, 0x0f);
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL3, 0x0b, 0x0d, 0x3f, 0x3f, 0x3f,
+			  0x3f);
+	dcs_write_cmd_seq(dsi_ctx, 0xa2, 0x3f, 0x09, 0x13, 0x17, 0x11, 0x15);
+	dcs_write_cmd_seq(dsi_ctx, 0xa9, 0x07, 0x03, 0x3f);
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL0, 0x3f, 0x05, 0x01, 0x17, 0x13,
+			  0x15, 0x11, 0x0f, 0x3f);
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL1, 0x3f, 0x3f, 0x3f, 0x3f, 0x0b,
+			  0x0d, 0x09, 0x3f, 0x3f, 0x07);
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL2, 0x03, 0x3f, 0x3f, 0x3f, 0x3f,
+			  0x02, 0x06, 0x3f, 0x3f, 0x08);
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL3, 0x0c, 0x0a, 0x3f, 0x3f, 0x3f,
+			  0x3f, 0x3f, 0x0e, 0x10, 0x14);
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL4, 0x12, 0x16, 0x00, 0x04, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdc, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xde, 0x12);
+
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, 0x0e); /* No documentation */
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x01, 0x75);
 
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, MCS_CMD2_P3);
-	dcs_write_cmd_seq(dsi_ctx, MCS_GAMMA_VP, 0x00, 0x0C, 0x12, 0x0E, 0x06,
-			  0x12, 0x0E, 0x0B, 0x15, 0x0B, 0x10, 0x07, 0x0F,
-			  0x12, 0x0C, 0x00);
-	dcs_write_cmd_seq(dsi_ctx, MCS_GAMMA_VN, 0x00, 0x0C, 0x12, 0x0E, 0x06,
-			  0x12, 0x0E, 0x0B, 0x15, 0x0B, 0x10, 0x07, 0x0F,
-			  0x12, 0x0C, 0x00);
+	dcs_write_cmd_seq(dsi_ctx, MCS_GAMMA_VP, 0x00, 0x0c, 0x12, 0x0e, 0x06,
+			  0x12, 0x0e, 0x0b, 0x15, 0x0b, 0x10, 0x07, 0x0f,
+			  0x12, 0x0c, 0x00);
+	dcs_write_cmd_seq(dsi_ctx, MCS_GAMMA_VN, 0x00, 0x0c, 0x12, 0x0e, 0x06,
+			  0x12, 0x0e, 0x0b, 0x15, 0x0b, 0x10, 0x07, 0x0f,
+			  0x12, 0x0c, 0x00);
 
 	/* Exit CMD2 */
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, MCS_CMD1_UCS);
-- 
2.43.0

