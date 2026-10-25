Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956320;
	b=MlrLVOF+MP2Mfo1uATZA5h75/XQv0Z1IYsasyMptIs5OzMvs4e/McpuTLXZ0zsgSiwIZ
	 YcXa6DXXqW7ETgAPtk1oI2WJB3TJmC7lbmulra00V5LI/bmXxwZbego928qJc1XeTxp0J
	 5pmBjzLnvPjHzX8uqck/CrbnySqyD5SJDAqtsAXowZrNWLxLsseaull0ko4mbIJ/YUpoX
	 DC36jrXqfDl4sxIBJRtqoBpiBk8X8vTEHMu7HSV23dpgJ7XMXIeF+TNE24coiYWUx11Zi
	 NOG3UKhJPUuAfYTxBm0KCcU3Rm2UrYlEd+n70XkAJhpomlNrF14HYDD4SjmBcS/mVPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956320;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=ypquldAWuxa1LSa+UX3kpk8yZZ3zjYWQWprvIQGk7+k=;
	b=DjwNo7rbihwkjvpfo0EfUu5EIPk8YPmFX2hz7sMK3ekR8C8CIUm4MIfa+CwjykvCxKqQ
	 O0hx+XHbBzA5YIPBYqOvWhE/jqMl2GbTMfrs82aqXNaiSB3YP0DbUr000+q01ZmZVALb+
	 46FhhKUP58jejSJuqcVEGwwWuoiZYljT6roTj7HcNerUVTBisecrN6ywl+LonoV1+H+EX
	 wXFuvPYLvfEMcTj+DNUBE+K64RLFaF6hwHFhtoXdbszcWAbA7v7e+U4sS44V29ff4K79l
	 lDO3r8tCnxqNAfp9Py493xd0PDBaj1JoMa93SJq3nKFkDC/vsM309AVetuXO1O2eW+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=ZFm+Ugxq;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F3F606A325
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88F3F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=ZFm+Ugxq
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJOc4G518903
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:24:40 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJOc4G518903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956281;
	bh=ypquldAWuxa1LSa+UX3kpk8yZZ3zjYWQWprvIQGk7+k=;
	h=From:To:Cc:Subject:Date;
	b=ZFm+UgxqtRhTxiJ1QIQr1yNtjYY0VF32BcDcSSw1V3+mr3AZUa2n9KHn2viDmKUIn
	 oEG9LgMtXNEAFsPCwadJ9ERltO2DgeWV97EZDJDlhDkpra/dZSwbCwFhdbo8yd3/r3
	 plBtswmRp73yRvrRE702jpl73NjDzdSEXHHYvjaU=
From: christian.koever-draxl@student.uibk.ac.at
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, luca.ceresoli@bootlin.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH] drm/bridge: dw-hdmi-i2s: support the S/PDIF audio input
Date: Sun, 25 Oct 2026 20:24:36 +0100
Message-ID: <20261025192436.209908-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The DesignWare HDMI TX has an S/PDIF audio input next to the I2S one,
but the I2S audio glue only ever registers the I2S DAI. Over I2S the
controller builds the IEC 60958 channel status itself and always sends
linear PCM, so compressed IEC 61937 bitstreams (AC-3, DTS) reach the
sink as PCM and play as noise. Over S/PDIF the channel status of the
stream is passed through and the sink decodes the bitstream.

Let platforms flag a wired S/PDIF input with a new spdif_input field in
dw_hdmi_plat_data, register the hdmi-codec S/PDIF DAI when it is set,
and program the audio sampler for it in hw_params: S/PDIF selected in
AUD_CONF0, 24 bit sub-frames, FIFO and sampler reset, then N and CTS.

Tested on an Amlogic S4 board: AC-3 passthrough is decoded by the HDMI
sink.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
Tool use (Documentation/process/generated-content.rst):
This work was done with the help of an AI coding assistant, Claude
(Anthropic), used through Claude Code over many sessions. It did a large
part of the hands-on work: it read the vendor kernel and the firmware
interfaces, probed registers on the board, drafted the code and the
changelogs, and ran the builds, checkpatch, dt_binding_check and the
tests on the hardware. I directed the work, reviewed every change and
the final patches, and take responsibility for them. There is no single
prompt to quote; the sessions were of the form "find out why X fails on
this board, fix it, test it on the box".

Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.

 .../gpu/drm/bridge/synopsys/dw-hdmi-audio.h   |  1 +
 .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   | 48 +++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h     | 14 ++++++
 include/drm/bridge/dw_hdmi.h                  |  3 ++
 5 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
index f72d27208ebe..4149ae88188b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
@@ -18,6 +18,7 @@ struct dw_hdmi_i2s_audio_data {
 	void (*write)(struct dw_hdmi *hdmi, u8 val, int offset);
 	u8 (*read)(struct dw_hdmi *hdmi, int offset);
 	u8 *(*get_eld)(struct dw_hdmi *hdmi);
+	bool spdif;
 };
 
 #endif
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index 2c903c9fe805..304ef881e06c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -12,6 +12,7 @@
 #include <drm/bridge/dw_hdmi.h>
 #include <drm/drm_crtc.h>
 
+#include <sound/asoundef.h>
 #include <sound/hdmi-codec.h>
 
 #include "dw-hdmi.h"
@@ -34,6 +35,49 @@ static inline u8 hdmi_read(struct dw_hdmi_i2s_audio_data *audio, int offset)
 	return audio->read(hdmi, offset);
 }
 
+/*
+ * S/PDIF input. Unlike the I2S path it carries the IEC 60958 channel status
+ * of the stream through to the sink, so compressed IEC 61937 bitstreams
+ * (AC-3, DTS, ...) can be passed through.
+ */
+static int dw_hdmi_spdif_hw_params(struct dw_hdmi_i2s_audio_data *audio,
+				   struct hdmi_codec_params *hparms)
+{
+	struct dw_hdmi *hdmi = audio->hdmi;
+	u8 conf0;
+
+	/*
+	 * Configure first, then reset the FIFOs and the S/PDIF sampler, then
+	 * latch N again. The receiver always takes 24 bit wide sub-frames.
+	 */
+	hdmi_write(audio, HDMI_AUD_INT_FIFO_EMPTY_MSK |
+		   HDMI_AUD_INT_FIFO_FULL_MSK, HDMI_AUD_INT);
+	hdmi_write(audio, 0, HDMI_AUD_CONF0);	/* I2S_SELECT clear: S/PDIF */
+	hdmi_write(audio, HDMI_AUD_CONF1_WIDTH_24, HDMI_AUD_CONF1);
+	hdmi_write(audio, 0, HDMI_AUD_CONF2);
+	hdmi_write(audio, HDMI_AUD_INT_FIFO_EMPTY_MSK |
+		   HDMI_AUD_INT_FIFO_FULL_MSK, HDMI_AUD_SPDIFINT);
+	hdmi_write(audio, HDMI_AUD_INPUTCLKFS_128FS, HDMI_AUD_INPUTCLKFS);
+	hdmi_write(audio, HDMI_AUD_SPDIF1_WIDTH_24, HDMI_AUD_SPDIF1);
+
+	dw_hdmi_set_channel_count(hdmi, hparms->channels);
+	dw_hdmi_set_channel_allocation(hdmi, hparms->cea.channel_allocation);
+
+	conf0 = hdmi_read(audio, HDMI_AUD_CONF0);
+	hdmi_write(audio, conf0 | HDMI_AUD_CONF0_SW_RESET, HDMI_AUD_CONF0);
+	hdmi_write(audio, conf0, HDMI_AUD_CONF0);
+	hdmi_write(audio, HDMI_AUD_SPDIF0_SW_RESET, HDMI_AUD_SPDIF0);
+	hdmi_write(audio, 0, HDMI_AUD_SPDIF0);
+	hdmi_write(audio, (u8)~(HDMI_MC_SWRSTZ_I2SSWRST_REQ |
+				HDMI_MC_SWRSTZ_SPDIFSWRST_REQ), HDMI_MC_SWRSTZ);
+	hdmi_write(audio, HDMI_AUD_SPDIF0_SW_RESET, HDMI_AUD_SPDIF0);
+	hdmi_write(audio, 0, HDMI_AUD_SPDIF0);
+
+	dw_hdmi_set_sample_rate(hdmi, hparms->sample_rate);
+
+	return 0;
+}
+
 static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 				 struct hdmi_codec_daifmt *fmt,
 				 struct hdmi_codec_params *hparms)
@@ -50,6 +94,9 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 		return -EINVAL;
 	}
 
+	if (fmt->fmt == HDMI_SPDIF)
+		return dw_hdmi_spdif_hw_params(audio, hparms);
+
 	/* Reset the FIFOs before applying new params */
 	hdmi_write(audio, HDMI_AUD_CONF0_SW_RESET, HDMI_AUD_CONF0);
 	hdmi_write(audio, (u8)~HDMI_MC_SWRSTZ_I2SSWRST_REQ, HDMI_MC_SWRSTZ);
@@ -197,6 +244,7 @@ static int snd_dw_hdmi_probe(struct platform_device *pdev)
 	memset(&pdata, 0, sizeof(pdata));
 	pdata.ops		= &dw_hdmi_i2s_ops;
 	pdata.i2s		= 1;
+	pdata.spdif		= audio->spdif;
 	pdata.max_i2s_channels	= 8;
 	pdata.data		= audio;
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 34c5f583e910..3c0a7775678f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3542,6 +3542,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 		audio.get_eld	= hdmi_audio_get_eld;
 		audio.write	= hdmi_writeb;
 		audio.read	= hdmi_readb;
+		audio.spdif	= plat_data->spdif_input;
 		hdmi->enable_audio = dw_hdmi_i2s_audio_enable;
 		hdmi->disable_audio = dw_hdmi_i2s_audio_disable;
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
index af43a0414b78..e977053e003a 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
@@ -402,6 +402,8 @@
 #define HDMI_AUD_CTS2                           0x3204
 #define HDMI_AUD_CTS3                           0x3205
 #define HDMI_AUD_INPUTCLKFS                     0x3206
+#define HDMI_AUD_SPDIF0                         0x3300
+#define HDMI_AUD_SPDIF1                         0x3301
 #define HDMI_AUD_SPDIFINT			0x3302
 #define HDMI_AUD_CONF0_HBR                      0x3400
 #define HDMI_AUD_HBR_STATUS                     0x3401
@@ -945,6 +947,17 @@ enum {
 	HDMI_AUD_CTS3_CTS_MANUAL = 0x10,
 	HDMI_AUD_CTS3_AUDCTS19_16_MASK = 0x0f,
 
+/* AUD_INT and AUD_SPDIFINT field values */
+	HDMI_AUD_INT_FIFO_EMPTY_MSK = 0x08,
+	HDMI_AUD_INT_FIFO_FULL_MSK = 0x04,
+
+/* AUD_SPDIF0 field values */
+	HDMI_AUD_SPDIF0_SW_RESET = 0x80,
+
+/* AUD_SPDIF1 field values */
+	HDMI_AUD_SPDIF1_WIDTH_16 = 0x10,
+	HDMI_AUD_SPDIF1_WIDTH_24 = 0x18,
+
 /* HDMI_AUD_INPUTCLKFS field values */
 	HDMI_AUD_INPUTCLKFS_128FS = 0,
 	HDMI_AUD_INPUTCLKFS_256FS = 1,
@@ -995,6 +1008,7 @@ enum {
 	HDMI_MC_CLKDIS_PIXELCLK_DISABLE = 0x1,
 
 /* MC_SWRSTZ field values */
+	HDMI_MC_SWRSTZ_SPDIFSWRST_REQ = 0x10,
 	HDMI_MC_SWRSTZ_I2SSWRST_REQ = 0x08,
 	HDMI_MC_SWRSTZ_TMDSSWRST_REQ = 0x02,
 
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 8500dd4f99d8..55caf9cd1842 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -138,6 +138,9 @@ struct dw_hdmi_plat_data {
 	bool use_drm_infoframe;
 	bool ycbcr_420_allowed;
 
+	/* The S/PDIF audio input of the controller is wired up */
+	bool spdif_input;
+
 	/*
 	 * Private data passed to all the .mode_valid() and .configure_phy()
 	 * callback functions.

base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0

