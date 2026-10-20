Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505678;
	b=05oMdZbC15IDuSmpF8gpoBPMXRzvC2OhO6ssWO1XLdeUOeiuAfCQnI36Kq4mOHj31t7a
	 3R04ekSm6Bx4WxzV1mcURZcNUBNQEo5thITuEMP3PfXUES4JPRTbhMDocMx4ei5b92ZyT
	 i0EDL6+/i1kk8MzU/P7+LkXf++vsBpZACSXwJVZPzCSSaGRhFB1l+ofXyl0lV/k9aPS3I
	 1C+0RGdJFRWTT6ItqHzCCsibRdSn8C318o4LhValSrcro7IP2QM8j98AbI1Rmuv3po2Fc
	 ev/p0tnRCOrjI9jSplV4P8IWgu38l8pmgOmpFuul8+ETSjVNtHAUnFDGC8fbQNao/vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fonscNQS4COatcL+WW/DCh1Xn6CqNyHho+uEL9p9pZE=;
	b=vU6OQ0V6UTd8LKN8aDBeL0WhiR+7jZI7bp0DFECPR0nCdt/jIs/unBDLO/nTv2PRS5zi
	 MiNbc20ybx+ZBSX/soW8MbtDxVD3DWBDV0ZZHAxQ4mtT/fwsKdOpqqmdUi2rSMzEznx5j
	 pgUvmwnKTbFlGr+EFQDB4VeqIXAut4Aj8KeznYWml0PLSm0wMfBkmA9TpEYsPFDgp7p/3
	 yjuEG/A+RvJrYd1DvOMiQGqgnPYpYeFluNOJMhT90MmtBd5gkT7v67f1yqKZUdJVgGgHS
	 x1eYfr6qrzJRdmkYUL998zeIkj23w0s+eLy53cxYWoYBwkTavGIv5EHZiNNaJGLPDQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B0jZaAl3;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155B8606B25E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 155B8606B25E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B0jZaAl3
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2037032f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505676; x=1793110476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fonscNQS4COatcL+WW/DCh1Xn6CqNyHho+uEL9p9pZE=;
        b=B0jZaAl37uE2jP+id9lp6+NTaAbKZcOWrK4Y21lj49LuQXcXcluGFvxCljc5fqOQgD
         RFiHcstH12W3nJDqOyw2jugtx0TSUpZW0Uy032suu330DqMGtmCe044cb6y0AJuCQ2qz
         IeaJ0C+NZPk56iU8RbLsfuT/7aUTD/nFWhCF9wgPOzbgJmBE14bwErEKZPu7l8/hJ8ql
         QF/eBWE/s0SRHjTyKQZrXLpMSCc9zcy81uEQm1sD64SzKcII7kXTvtrBwFr+kOHgrCjm
         Qm+BUz1VvWw/mU9SgDWHOdG9G8bXuiG1/6FYiEFP54gEUQIzmOXtivHrkjqf37ksHR3F
         /gJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505676; x=1793110476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fonscNQS4COatcL+WW/DCh1Xn6CqNyHho+uEL9p9pZE=;
        b=IzipDY2fVeAsUMDnyRFXHQNQ3Z+A4zSpUtuiWkFa84hmvD5NoDTrmYSvTt4UizVUy9
         Gvu9l8bflJohew6/znGNJpGG/cglu74Hd9/1XjvKZ7cVgK2DUnIUXvBSbt7ZH4IWnIbF
         59wFzduPSJtcfiPCxbtfF9pfUxbL8B28NKJ2QO1ZdgA7s9C7u1vA9qbTohxwbJkHuvLV
         WlF09FmsZuAuepHAnV61R+hhBK5xXWUHTLdT2PDJbLKeyo1HoawDt2TG35/4zmbxdPPO
         mbarWc/zDhvvwewmE2RlkIeJVJB4x4VVI365fIG/aW0e+j6xXjyKBgc//jdfZZrCM6Vl
         6YxA==
X-Forwarded-Encrypted: i=1; AKwUvBy63vQTUK7gqdQcfMaBKLWvrzmIqKjeV115CaMIvtECKads0ydalHwjLHuPpvYAk0/CmyjkFI4BNILW1hA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDz5VRbg3hOz91cU3qOHKc7SjdSjk9JbwAWFWxc3PG0DD97Grz
	bmfc7Lr1QYGw8fWO0Qb1gX4zHkrWHnmigzzkF4scwIWgfR/sYcOSUuOP
X-Gm-Gg: AYBFou3l+HXamu7vwP040/PNOzYoJgpCVwCLt2rC8zwank1W2WRZTRYQYr0o/tZFQMO
	YC39JGBK+rwq+RiZFDFY+x1NNFS4A444T5/Wrn0xRaA6WC5KJrQUG0Z+X0g/4eDIVKiAx0esnL8
	8XabwPCrP8wFQzvKur59BL3DB4PwXqFFGHHBEPqfNBhz9AM5ZBpb/Nob36VdM3JnjXEp3hhqU2T
	UYUBW22eaWQ5Fvng2mte8DuclL4hTK6WSUy6Bf+nO/b12PP6wlai64+zga825FkSqaT03VOupnS
	UguLiR2P2uy7++HKQzVygnkJ0uOkvO74EPMnQPrSZhkHn85+h+E6RZpPzDoStIjQmmJ1MDyI8Lq
	fRs6jfe0xwPvu3vShUKZQyS3wQjLF6xnyz1LXDAKY1dKDIduHhqsWkFwcKHPGDPMsE5ZwBjnIJi
	SSx6QJtwKjOkHkMDKhbXPFb0/bSDFb66MGZE06RotdnM3TnrpdO3I5gj2PL6LlLS575gbeR/QPd
	ggBZzeXUym26vSd8nddq6W1ZkVy5wSf1/IM1FqFwkth7wv4Kuo2mI60yPdGnXyE//D0Xj14jc4F
	ZYOwdIYylqBAryyxQKARiNVRzGyiENjh4crVp4jrGrk=
X-Received: by 2002:a05:6000:24c4:b0:48c:7143:610c with SMTP id ffacd0b85a97d-48e07fa0e60mr24326202f8f.36.1792505676409;
        Tue, 20 Oct 2026 07:14:36 -0700 (PDT)
Received: from archlinux.cern.ch (ppilicho-1.dyndns.cern.ch. [2001:1458:202:228::101:227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80f9cdsm6256287f8f.11.2026.10.20.07.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:14:35 -0700 (PDT)
From: Patryk Pilichowski <pat.pilichowski@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Patryk Pilichowski <pat.pilichowski@gmail.com>
Subject: [PATCH v2 2/2] platform/x86: msi-wmi: Ignore WMI events for keys also handled by atkbd
Date: Tue, 20 Oct 2026 16:14:27 +0200
Message-ID: <20261020141427.1580282-3-pat.pilichowski@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020141427.1580282-1-pat.pilichowski@gmail.com>
References: <20261020141427.1580282-1-pat.pilichowski@gmail.com>
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

On MSI notebooks, several keys generate a WMI event through the Wind
event GUID in addition to a regular AT keyboard event. Their event
codes are not in the keymap, so every press logs "Unknown key
pressed".

These keys already work through the AT keyboard, so mark their WMI
codes as KE_IGNORE, as is already done for the MSI Claw. On models
where a code does not also produce a keyboard event, the event is
already dropped, so the only change there is that the log
message goes away.

The Wind event GUID is not specific to the MSI Wind. It is present in
17 of 18 MSI notebooks in the linuxhw ACPI dump collection (2012 to
2024), with the same _WED structure. The codes are shared across
models too: the volume keys on the tested notebook send the same codes
as the MSI Claw (0x21, 0x32).

Tested on an MSI Katana 15 B13VFK: Fn (0x0b), mic mute (0x19),
settings (0x1d), mute (0x23) and Bluetooth (0x78) no longer log
unknown key messages, and the keys keep working through atkbd.

Link: https://github.com/linuxhw/ACPI/tree/d6d30c6ef6f4/Notebook/MSI
Signed-off-by: Patryk Pilichowski <pat.pilichowski@gmail.com>
---
 drivers/platform/x86/msi-wmi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index 5369ac28f4c5..dc56e8da0cdb 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -34,7 +34,11 @@ MODULE_ALIAS("wmi:" MSIWMI_WIND_EVENT_GUID);
 
 enum msi_scancodes {
 	WIND_KEY_TOUCHPAD	= 0x08,	/* Fn+F3 touchpad toggle */
+	WIND_KEY_FN_NB		= 0x0b,
+	WIND_KEY_MICMUTE_NB	= 0x19,
+	WIND_KEY_SETTINGS_NB	= 0x1d,
 	CLAW_KEY_VOLUMEDOWN	= 0x21,
+	WIND_KEY_MUTE_NB	= 0x23,
 	CLAW_KEY_CENTER		= 0x29,	/* MSI M-Center main menu */
 	CLAW_KEY_QUICK_LONG	= 0x2a,	/* MSI M-Center quick access long hold */
 	CLAW_KEY_VOLUMEUP	= 0x32,
@@ -44,6 +48,7 @@ enum msi_scancodes {
 	WIND_KEY_WLAN		= 0x5f,	/* Fn+F11 Wi-Fi toggle */
 	WIND_KEY_TURBO		= 0x60,	/* Fn+F10 turbo mode toggle */
 	WIND_KEY_ECO		= 0x69,	/* Fn+F10 ECO mode toggle */
+	WIND_KEY_BLUETOOTH_NB	= 0x78,
 	MSI_KEY_BRIGHTNESSUP	= 0xd0,
 	MSI_KEY_BRIGHTNESSDOWN	= 0xd1,
 	MSI_KEY_VOLUMEUP	= 0xd2,
@@ -63,6 +68,13 @@ static struct key_entry msi_wmi_keymap[] = {
 	{ KE_IGNORE, WIND_KEY_CAMERA,		{KEY_CAMERA} },
 	{ KE_IGNORE, WIND_KEY_WLAN,		{KEY_WLAN} },
 
+	/* These MSI Notebook keys work without WMI. Ignore them to avoid double keycodes */
+	{ KE_IGNORE, WIND_KEY_FN_NB },
+	{ KE_IGNORE, WIND_KEY_MICMUTE_NB },
+	{ KE_IGNORE, WIND_KEY_SETTINGS_NB },
+	{ KE_IGNORE, WIND_KEY_MUTE_NB },
+	{ KE_IGNORE, WIND_KEY_BLUETOOTH_NB },
+
 	/* These are unknown WMI events found on MSI Wind */
 	{ KE_IGNORE, 0x00 },
 	{ KE_IGNORE, 0x62 },
-- 
2.56.0

