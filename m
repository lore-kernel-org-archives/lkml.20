Received: from smtp2.iinet.com (smtp2.iinet.com [52.129.46.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2B65304B4;
	Fri, 16 Oct 2026 16:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.129.46.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169616; cv=none; b=d3Wd3fkDD4VQLsPlsi4x6btT0bNvZWyEH13xsiNrZNyBjRUoMwAPb+/TddQQR7/HH1oEOGte5W6DjUmybS6YzBMyXU2Prx5WoDimuKYOYpiJbVivycRujSHtvF8HDkSnW59pLPABOVeZ2wdAmvvHsjkHMOIVzhU3YtaP3gKfylg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169616; c=relaxed/simple;
	bh=mLOobzZw9ri5z9DfyH0H77hni9eiuLnPcW8hgcMAARs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nkoEhZOSqIIAWnBSPJxO6A+GGMayUf3KymHal4CpvtswKApJk475u0qzIozwgl0W1KvzOYEMBhWeSV3+SDOI+37pJyzTKKDzyPQDO0iaFhFhPel1qFNgHBovnMHBO6JLix73X+NrXDn0BMhWoHThCecZQJbEsrefLsXDA+U/8nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com; spf=pass smtp.mailfrom=nwlink.com; dkim=pass (2048-bit key) header.d=nwlink.com header.i=@nwlink.com header.b=jgBnSc7s; arc=none smtp.client-ip=52.129.46.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nwlink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nwlink.com header.i=@nwlink.com header.b="jgBnSc7s"
Received: from porter.hsd1.wa.comcast.net (c-98-203-133-45.hsd1.wa.comcast.net [98.203.133.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kaf@nwlink.com)
	by smtp2.iinet.com (Postfix) with ESMTPSA id 3229EB42A47;
	Fri, 16 Oct 2026 09:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nwlink.com; s=mail;
	t=1792167944; bh=lduHQheDCz3i8FFYU7NtHJXTKQv57F6ZVQOT2STr+XA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jgBnSc7szcHhi9bn4e9FRV5LsC0EfsXE0frPMu9uEwvfX1lik6rQqpj41MVDi3eyr
	 X3dnYVLI2Wv1cZRfkpiwCIl1DjT4/xjFI35/ek/CV6GH+xbSASNPb1umOkerh3kzEn
	 lQDY1y7kHD8wjfRR+OAxoVEmM8nD1Pf26Gf7I+qL+2oC27xhzbyMiDdFfQ7iEOx4Is
	 9vZ5boCgIPsQOg1aNzzmYpMDBlSXxCk9J/9PhoK7ELVQzkbFNfHkwt6vwQBz+yPeTg
	 39ZWsPWaKKAtPLntcEdWA5QsFOYlNuHerSYHOjW38VPNIuk4u+lWFm9ZLe4wLd40uX
	 cvHYvACtDD0lw==
From: Kyle Farrell <kaf@nwlink.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Kyle Farrell <kaf@nwlink.com>
Subject: [PATCH v2 2/2 RESEND] usb: gadget: f_uac2: allow explicit channel count independent of channel mask
Date: Fri, 16 Oct 2026 09:25:34 -0700
Message-Id: <20261016162534.384844-3-kaf@nwlink.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016162534.384844-1-kaf@nwlink.com>
References: <20261016162534.384844-1-kaf@nwlink.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The UAC2 gadget driver currently derives bNrChannels from the number
of set bits in bmChannelConfig. Since the bmChannelConfig
channel-location bitmap provides only 27 predefined channel locations,
this limits playback and capture streams to 27 channels. UAC2 permits
bNrChannels values up to 255, independent of bmChannelConfig.

Add ConfigFS p_channels and c_channels attributes to configure the
playback and capture channel counts explicitly.  Preserve the existing
p_chmask and c_chmask interface and semantics. The default value of
zero for p_channels and c_channels continues to derive the channel count
from the corresponding p_chmask and c_chmask.

When an explicit channel count and a nonzero channel mask are both
specified, require the number of set bits in the mask to match the
channel count. Partial channel-location assignments permitted by UAC2
are therefore not supported. Additionally, reject Feature Unit
configurations whose descriptor length would exceed the one-byte
bLength field.

Assisted-by: LLM
Signed-off-by: Kyle Farrell <kaf@nwlink.com>
---
 .../ABI/testing/configfs-usb-gadget-uac2      | 18 ++++-
 Documentation/usb/gadget-testing.rst          | 18 ++++-
 drivers/usb/gadget/function/f_uac2.c          | 71 +++++++++++++------
 drivers/usb/gadget/function/u_uac2.h          |  4 ++
 4 files changed, 87 insertions(+), 24 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac2 b/Documentation/ABI/testing/configfs-usb-gadget-uac2
index 133e995c3e92..8e264843e492 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uac2
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uac2
@@ -5,7 +5,14 @@ Description:
 		The attributes:
 
 		=====================	=======================================
-		c_chmask		capture channel mask
+		c_chmask		capture channel-location mask. The number of
+					capture channels is derived from the number of
+					set bits unless c_channels is specified.
+		c_channels		explicit capture channel count. A value of 0
+					derives the channel count from c_chmask. When
+					nonzero, c_chmask specifies channel locations
+					and may be 0. If both c_channels and c_chmask
+					are nonzero, the values must agree.
 		c_srate			list of capture sampling rates (comma-separated)
 		c_ssize			capture sample size (bytes)
 		c_hs_bint		capture bInterval for HS/SS (1-4: fixed, 0: auto)
@@ -20,7 +27,14 @@ Description:
 		c_volume_res		capture volume control resolution
 					(in 1/256 dB)
 		fb_max			maximum extra bandwidth in async mode
-		p_chmask		playback channel mask
+		p_chmask		playback channel-location mask. The number of
+					playback channels is derived from the number of
+					set bits unless p_channels is specified.
+		p_channels		explicit playback channel count. A value of 0
+					derives the channel count from p_chmask. When
+					nonzero, p_chmask specifies channel locations
+					and may be 0. If both p_channels and p_chmask
+					are nonzero, the values must agree.
 		p_srate			list of playback sampling rates (comma-separated)
 		p_ssize			playback sample size (bytes)
 		p_hs_bint		playback bInterval for HS/SS (1-4: fixed, 0: auto)
diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index 4921e5307d49..c050218291d1 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -741,7 +741,14 @@ The function name to use when creating the function directory is "uac2".
 The uac2 function provides these attributes in its function directory:
 
 	================ ====================================================
-	c_chmask         capture channel mask
+	c_chmask         capture channel-location mask. The number of
+			 capture channels is derived from the number of
+			 set bits unless c_channels is specified.
+	c_channels	 explicit capture channel count. A value of 0
+			 derives the channel count from c_chmask. When
+			 nonzero, c_chmask specifies channel locations
+			 and may be 0. If both c_channels and c_chmask
+			 are nonzero, the values must agree.
 	c_srate          list of capture sampling rates (comma-separated)
 	c_ssize          capture sample size (bytes)
 	c_sync           capture synchronization type (async/adaptive)
@@ -752,7 +759,14 @@ The uac2 function provides these attributes in its function directory:
 	c_volume_res     capture volume control resolution (in 1/256 dB)
 	c_hs_bint        capture bInterval for HS/SS (1-4: fixed, 0: auto)
 	fb_max           maximum extra bandwidth in async mode
-	p_chmask         playback channel mask
+	p_chmask         playback channel-location mask. The number of
+			 playback channels is derived from the number of
+			 set bits unless p_channels is specified.
+	p_channels	 explicit playback channel count. A value of 0
+			 derives the channel count from p_chmask. When
+			 nonzero, p_chmask specifies channel locations
+			 and may be 0. If both p_channels and p_chmask
+			 are nonzero, the values must agree.
 	p_srate          list of playback sampling rates (comma-separated)
 	p_ssize          playback sample size (bytes)
 	p_mute_present   playback mute control enable
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 46255ad0a9cf..c7801bb8765e 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -50,8 +50,17 @@
 #define UNFLW_CTRL	8
 #define OVFLW_CTRL	10
 
-#define EPIN_EN(_opts) ((_opts)->p_chmask != 0)
-#define EPOUT_EN(_opts) ((_opts)->c_chmask != 0)
+static unsigned int uac2_num_channels(bool is_playback,
+				      const struct f_uac2_opts *opts)
+{
+	u8 channels = is_playback ? opts->p_channels : opts->c_channels;
+	u32 chmask = is_playback ? opts->p_chmask : opts->c_chmask;
+
+	return channels ? channels : num_channels(chmask);
+}
+
+#define EPIN_EN(_opts) (uac2_num_channels(true, (_opts)) != 0)
+#define EPOUT_EN(_opts) (uac2_num_channels(false, (_opts)) != 0)
 #define FUIN_EN(_opts) (EPIN_EN(_opts) \
 				&& ((_opts)->p_mute_present \
 				|| (_opts)->p_volume_present))
@@ -671,15 +680,16 @@ static int get_max_srate(const int *srates)
 static int get_max_bw_for_bint(const struct f_uac2_opts *uac2_opts,
 	u8 bint, unsigned int factor, bool is_playback)
 {
-	int chmask, srate, ssize;
+	unsigned int channels;
+	int srate, ssize;
 	u16 max_size_bw;
 
 	if (is_playback) {
-		chmask = uac2_opts->p_chmask;
+		channels = uac2_num_channels(true, uac2_opts);
 		srate = get_max_srate(uac2_opts->p_srates);
 		ssize = uac2_opts->p_ssize;
 	} else {
-		chmask = uac2_opts->c_chmask;
+		channels = uac2_num_channels(false, uac2_opts);
 		srate = get_max_srate(uac2_opts->c_srates);
 		ssize = uac2_opts->c_ssize;
 	}
@@ -689,11 +699,11 @@ static int get_max_bw_for_bint(const struct f_uac2_opts *uac2_opts,
 		// Win10 requires max packet size + 1 frame
 		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
 		// updated srate is always bigger, therefore DIV_ROUND_UP always yields +1
-		max_size_bw = num_channels(chmask) * ssize *
+		max_size_bw = channels * ssize *
 			(DIV_ROUND_UP(srate, factor / (1 << (bint - 1))));
 	} else {
 		// adding 1 frame provision for Win10
-		max_size_bw = num_channels(chmask) * ssize *
+		max_size_bw = channels * ssize *
 			(DIV_ROUND_UP(srate, factor / (1 << (bint - 1))) + 1);
 	}
 	return max_size_bw;
@@ -764,10 +774,11 @@ static int set_ep_max_packet_size_bint(struct device *dev, const struct f_uac2_o
 	return 0;
 }
 
-static struct uac2_feature_unit_descriptor *build_fu_desc(int chmask)
+static struct uac2_feature_unit_descriptor *build_fu_desc(bool is_playback,
+							  const struct f_uac2_opts *opts)
 {
 	struct uac2_feature_unit_descriptor *fu_desc;
-	int channels = num_channels(chmask);
+	unsigned int channels = uac2_num_channels(is_playback, opts);
 	int fu_desc_size = UAC2_DT_FEATURE_UNIT_SIZE(channels);
 
 	fu_desc = kzalloc(fu_desc_size, GFP_KERNEL);
@@ -976,13 +987,27 @@ static int afunc_validate_opts(struct g_audio *agdev, struct device *dev)
 {
 	struct f_uac2_opts *opts = g_audio_to_uac2_opts(agdev);
 	const char *msg = NULL;
+	unsigned int p_channels = uac2_num_channels(true, opts);
+	unsigned int c_channels = uac2_num_channels(false, opts);
 
-	if (!opts->p_chmask && !opts->c_chmask)
-		msg = "no playback and capture channels";
-	else if (opts->p_chmask & ~UAC2_CHANNEL_MASK)
+	if (opts->p_chmask & ~UAC2_CHANNEL_MASK)
 		msg = "unsupported playback channels mask";
 	else if (opts->c_chmask & ~UAC2_CHANNEL_MASK)
 		msg = "unsupported capture channels mask";
+	else if (!p_channels && !c_channels)
+		msg = "no playback and capture channels";
+	else if (opts->p_channels && opts->p_chmask &&
+		 opts->p_channels != num_channels(opts->p_chmask))
+		msg = "playback channel count does not match channel mask";
+	else if (opts->c_channels && opts->c_chmask &&
+		 opts->c_channels != num_channels(opts->c_chmask))
+		msg = "capture channel count does not match channel mask";
+	else if (FUIN_EN(opts) &&
+		 UAC2_DT_FEATURE_UNIT_SIZE(p_channels) > U8_MAX)
+		msg = "too many playback channels for feature unit descriptor";
+	else if (FUOUT_EN(opts) &&
+		 UAC2_DT_FEATURE_UNIT_SIZE(c_channels) > U8_MAX)
+		msg = "too many capture channels for feature unit descriptor";
 	else if ((opts->p_ssize < 1) || (opts->p_ssize > 4))
 		msg = "incorrect playback sample size";
 	else if ((opts->c_ssize < 1) || (opts->c_ssize > 4))
@@ -1059,12 +1084,12 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 		return PTR_ERR(us);
 
 	if (FUOUT_EN(uac2_opts)) {
-		out_feature_unit_desc = build_fu_desc(uac2_opts->c_chmask);
+		out_feature_unit_desc = build_fu_desc(false, uac2_opts);
 		if (!out_feature_unit_desc)
 			return -ENOMEM;
 	}
 	if (FUIN_EN(uac2_opts)) {
-		in_feature_unit_desc = build_fu_desc(uac2_opts->p_chmask);
+		in_feature_unit_desc = build_fu_desc(true, uac2_opts);
 		if (!in_feature_unit_desc) {
 			ret = -ENOMEM;
 			goto err_free_fu;
@@ -1099,13 +1124,13 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 
 
 	/* Initialize the configurable parameters */
-	usb_out_it_desc.bNrChannels = num_channels(uac2_opts->c_chmask);
+	usb_out_it_desc.bNrChannels = uac2_num_channels(false, uac2_opts);
 	usb_out_it_desc.bmChannelConfig = cpu_to_le32(uac2_opts->c_chmask);
-	io_in_it_desc.bNrChannels = num_channels(uac2_opts->p_chmask);
+	io_in_it_desc.bNrChannels = uac2_num_channels(true, uac2_opts);
 	io_in_it_desc.bmChannelConfig = cpu_to_le32(uac2_opts->p_chmask);
-	as_out_hdr_desc.bNrChannels = num_channels(uac2_opts->c_chmask);
+	as_out_hdr_desc.bNrChannels = uac2_num_channels(false, uac2_opts);
 	as_out_hdr_desc.bmChannelConfig = cpu_to_le32(uac2_opts->c_chmask);
-	as_in_hdr_desc.bNrChannels = num_channels(uac2_opts->p_chmask);
+	as_in_hdr_desc.bNrChannels = uac2_num_channels(true, uac2_opts);
 	as_in_hdr_desc.bmChannelConfig = cpu_to_le32(uac2_opts->p_chmask);
 	as_out_fmt1_desc.bSubslotSize = uac2_opts->c_ssize;
 	as_out_fmt1_desc.bBitResolution = uac2_opts->c_ssize * 8;
@@ -1308,7 +1333,7 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	agdev->gadget = gadget;
 
 	agdev->params.p_chmask = uac2_opts->p_chmask;
-	agdev->params.p_channels = num_channels(uac2_opts->p_chmask);
+	agdev->params.p_channels = uac2_num_channels(true, uac2_opts);
 	memcpy(agdev->params.p_srates, uac2_opts->p_srates,
 			sizeof(agdev->params.p_srates));
 	agdev->params.p_ssize = uac2_opts->p_ssize;
@@ -1321,7 +1346,7 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 		agdev->params.p_fu.volume_res = uac2_opts->p_volume_res;
 	}
 	agdev->params.c_chmask = uac2_opts->c_chmask;
-	agdev->params.c_channels = num_channels(uac2_opts->c_chmask);
+	agdev->params.c_channels = uac2_num_channels(false, uac2_opts);
 	memcpy(agdev->params.c_srates, uac2_opts->c_srates,
 			sizeof(agdev->params.c_srates));
 	agdev->params.c_ssize = uac2_opts->c_ssize;
@@ -2091,10 +2116,12 @@ end:									\
 CONFIGFS_ATTR(f_uac2_opts_, name)
 
 UAC2_ATTRIBUTE(u32, p_chmask);
+UAC2_ATTRIBUTE(u8, p_channels);
 UAC2_RATE_ATTRIBUTE(p_srate);
 UAC2_ATTRIBUTE(u32, p_ssize);
 UAC2_ATTRIBUTE(u8, p_hs_bint);
 UAC2_ATTRIBUTE(u32, c_chmask);
+UAC2_ATTRIBUTE(u8, c_channels);
 UAC2_RATE_ATTRIBUTE(c_srate);
 UAC2_ATTRIBUTE_SYNC(c_sync);
 UAC2_ATTRIBUTE(u32, c_ssize);
@@ -2134,10 +2161,12 @@ UAC2_ATTRIBUTE(s16, c_terminal_type);
 
 static struct configfs_attribute *f_uac2_attrs[] = {
 	&f_uac2_opts_attr_p_chmask,
+	&f_uac2_opts_attr_p_channels,
 	&f_uac2_opts_attr_p_srate,
 	&f_uac2_opts_attr_p_ssize,
 	&f_uac2_opts_attr_p_hs_bint,
 	&f_uac2_opts_attr_c_chmask,
+	&f_uac2_opts_attr_c_channels,
 	&f_uac2_opts_attr_c_srate,
 	&f_uac2_opts_attr_c_ssize,
 	&f_uac2_opts_attr_c_hs_bint,
@@ -2207,10 +2236,12 @@ static struct usb_function_instance *afunc_alloc_inst(void)
 				    &f_uac2_func_type);
 
 	opts->p_chmask = UAC2_DEF_PCHMASK;
+	opts->p_channels = UAC2_DEF_PCHANNELS;
 	opts->p_srates[0] = UAC2_DEF_PSRATE;
 	opts->p_ssize = UAC2_DEF_PSSIZE;
 	opts->p_hs_bint = UAC2_DEF_PHSBINT;
 	opts->c_chmask = UAC2_DEF_CCHMASK;
+	opts->c_channels = UAC2_DEF_CCHANNELS;
 	opts->c_srates[0] = UAC2_DEF_CSRATE;
 	opts->c_ssize = UAC2_DEF_CSSIZE;
 	opts->c_hs_bint = UAC2_DEF_CHSBINT;
diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/function/u_uac2.h
index 0df808289ded..bacd841c9df6 100644
--- a/drivers/usb/gadget/function/u_uac2.h
+++ b/drivers/usb/gadget/function/u_uac2.h
@@ -17,10 +17,12 @@
 #include "uac_common.h"
 
 #define UAC2_DEF_PCHMASK 0x3
+#define UAC2_DEF_PCHANNELS 0  /* 0 = derive from p_chmask */
 #define UAC2_DEF_PSRATE 48000
 #define UAC2_DEF_PSSIZE 2
 #define UAC2_DEF_PHSBINT 0
 #define UAC2_DEF_CCHMASK 0x3
+#define UAC2_DEF_CCHANNELS 0  /* 0 = derive from c_chmask */
 #define UAC2_DEF_CSRATE 64000
 #define UAC2_DEF_CSSIZE 2
 #define UAC2_DEF_CHSBINT 0
@@ -46,11 +48,13 @@ struct f_uac2_opts {
 	int				p_srates[UAC_MAX_RATES];
 	int				p_ssize;
 	u8				p_hs_bint;
+	u8				p_channels;
 	int				c_chmask;
 	int				c_srates[UAC_MAX_RATES];
 	int				c_ssize;
 	int				c_sync;
 	u8				c_hs_bint;
+	u8				c_channels;
 
 	bool			p_mute_present;
 	bool			p_volume_present;
-- 
2.34.1

