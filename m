Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794597280;
	b=Cb34yAaA3DOjTLq+IsBL/fEI3GbUVjZTZB6ijcsVjppbc1Ek3AxdsWXbGG0j2kFCt7zV
	 8XiqdFPDpU1uMCH5wYhahB3v11RWOzfaNZmEZKxg/xPX42udsHwmgVW4cZJsspGNRRt0T
	 HNCSTnZXtZCCdOrC7LTNcSzee8JrNgbmYtqz6Iky0HqcDzmc1VPAM1pgBCPWk26Y7kYGx
	 KVbNZKAeMmyLBWjn7/02jLz7cLxOm0GKkt8fGiEUCfL+2dLPAFqtLOOOzMmT95J16Kgm9
	 LYDh46ww8mTvjAsiJuFlnDnNTdgvFbO/Zp+jOW2br6JGG54J/1Z3G/dnhVjeaLv3b9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597280;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Xw4dlDTgPJT/BnwFPwaIMe2enaTgj+arClqbigx9e0w=;
	b=Y0XAF+v1QuWRb1Pkx4aUvLFIuTmlEQ+yAfO7EgGm5t7FAOsFkd9USOBJpm7E0mSpRAQo
	 6CgAhlfZ2VbmdVmfW1wFdKNnSu6lv5PUol42HTbjMAYIf957mzPM8Be40HUfmqM0oCvKe
	 55CSQrhYpSx92wOaMXk4UlfF8lRI1ivV5St5gtXcz9YqlQA6YYVm9MkleakTUcczmsJXD
	 ceEA8cCd0RiGNsawoqiLcy9KP5+Ig1EjkXhUwqP1gUawrLbF/nCwRZoXiC5g2N4ijE/4M
	 2S8hW4lzdoO44KuOIaEcVd1pQjWHmwhRgdYoV5rGDkn0fn2tQP5loyG8yp8hhSekGxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LvYhehyF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE88606A334;
	Fri, 13 Nov 2026 19:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LvYhehyF
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794597280;
	b=TvTIsbbbqDt1Wmg6apfKnxXs7iCbWms/LCVvAjkB3qb217K5SR67VW0k7s1JhLmWAN9N
	 QmmYGF/++WlBEsbVgnn4ZyYKaJtaAZWHUmUazTkzGpmNuDLRlyDMtpUIF72AmLtsn6Pmp
	 3ZKdue0/qdDOn8gGdMRzf5pDC6uxLX36/ZqSCuSJru3eCgeIqo/sGGvNZELtWmGlBWrxN
	 h7qllNvhUTW9BjZ5xqeEFdSteUQObpYYK2qGWDmv0kL3ZiZpzWGKPSwqttsnrJuuxcFyf
	 nh3tGYxDNlvytAJwzfvfCRUVlSOfN+32tCBFkJsg90NCpzmvbS7yl+TPOXPLpzqkwig==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794597280;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Xw4dlDTgPJT/BnwFPwaIMe2enaTgj+arClqbigx9e0w=;
	b=HxNNGEtvnkR+7DYdg/HxiKWA5LU03kfkWCtLDombBkPfVGLAHmRSPCn5jPYSvV9wxz51
	 IdWzkMjWDN36DMjisD6si8h7jCvTZPN+HRhz+laqrjmtVCzy+JNvlt+l5f8z28m/JJThB
	 CHFhAOStyOH0DEjoZWeFc1DRTPAdisliwkbmhw4XB1DesJh6NWclgTzcQZGvlRUYwcSyr
	 bY6FNHzqbxA/6RJ2fRrGX8k5UOQDCLa68Ev7EzFANGZD/Cq3v6lHQdTBZoVwpDU1ekR9c
	 VmAnYxMcseCvUqjWTd85/O6CZ9Hsky/aGYBLf/hx1ou+z0nzqi5n92OcmGMWS2p1YAA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0612E1F000C5;
	Fri, 13 Nov 2026 19:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794597280;
	bh=Xw4dlDTgPJT/BnwFPwaIMe2enaTgj+arClqbigx9e0w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LvYhehyFIxtwiRtjPNReAdkMnR4KUwF3zdLCDqJ1tI9Yr8pxOie4WMceUUJg3dqPZ
	 72VdhfMbaqCFXo3RFPa3hsGQtc608WMm2iZBXSEldFwT1yMUMgx50qZsNB9R0iG9Id
	 /HqHeaJN3zbDnOrmbh5Ryn0wSaEMaxH2OGWhEIT1PFEEkkfAv3m4T6On0f095jjZMg
	 hq2M6/IZEB/qnUIvGn8DEV8T10cCvjLBWTb/UMC2RpYmfYXf55PZadaVn5Ggxfcdtx
	 JsKgXu2PITT9TYukr6ygQe35/M4FjuUpLlUBOYlnEzzcj8ffQG2uF1RUPIHy6p0Ef1
	 Bpgl7r65fjnVw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 83EAE49A8A;
	Fri, 13 Nov 2026 19:14:39 +0000 (UTC)
From: Patrick Fischer via B4 Relay <devnull+admin.tsv-stahl-riesa.de@kernel.org>
Date: Fri, 13 Nov 2026 20:14:20 +0100
Subject: [PATCH RFC wireless-next 1/2] wifi: wlcore: Allow lower drivers
 without firmware statistics
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
Message-Id: <20261113-upstream-wl18xx-fw-stats-v1-1-cbdf50739185@tsv-stahl-riesa.de>
References: <20261113-upstream-wl18xx-fw-stats-v1-0-cbdf50739185@tsv-stahl-riesa.de>
In-Reply-To: <20261113-upstream-wl18xx-fw-stats-v1-0-cbdf50739185@tsv-stahl-riesa.de>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, linux-kernel@vger.kernel.org, 
 Patrick Fischer <admin@tsv-stahl-riesa.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794597277; l=2225;
 i=admin@tsv-stahl-riesa.de; s=20261020; h=from:subject:message-id;
 bh=DLPaddbG/sGe9ubZujK/V4mAu1TXJj8UjY81Qo5V66M=;
 b=4e8PvcIh0xJRjtVB3WR0qKh2zYw/1nx9wl1QhH4bTAYCqbJMXLHA36J21KFsEZxJLVd1v5yeU
 PsfVm7HfQLFBWcsUL1s0ZPkvTyIc/OgzAxL8bwTQ1l2MS6HE7MdJoU4
X-Developer-Key: i=admin@tsv-stahl-riesa.de; a=ed25519;
 pk=D+v6EloYcEY9PIUHFyTM5sqcGIU/fIXzLUdkR8vjAtk=
X-Endpoint-Received: by B4 Relay for admin@tsv-stahl-riesa.de/20261020 with
 auth_id=1251
X-Original-From: Patrick Fischer <admin@tsv-stahl-riesa.de>
Reply-To: admin@tsv-stahl-riesa.de
Content-Transfer-Encoding: 7bit

From: Patrick Fischer <admin@tsv-stahl-riesa.de>

wl1271_debugfs_init() always allocates wl->stats.fw_stats and exposes
it as fw_stats_raw, and the lower drivers query the firmware for it
with ACX_STATISTICS. A lower driver that cannot use ACX_STATISTICS
safely has no way to opt out.

Treat a fw_stats_len of 0 as "no firmware statistics": don't allocate
the buffer, don't create fw_stats_raw, and never send ACX_STATISTICS
from wl1271_debugfs_update_stats(). wl1271_debugfs_reset() and
wl1271_debugfs_exit() already cope with a NULL buffer.

No functional change for wl12xx and wl18xx, which both set
fw_stats_len.

Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
---
 drivers/net/wireless/ti/wlcore/debugfs.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ti/wlcore/debugfs.c b/drivers/net/wireless/ti/wlcore/debugfs.c
index bbfd2725215b..23fef3009561 100644
--- a/drivers/net/wireless/ti/wlcore/debugfs.c
+++ b/drivers/net/wireless/ti/wlcore/debugfs.c
@@ -47,6 +47,9 @@ void wl1271_debugfs_update_stats(struct wl1271 *wl)
 {
 	int ret;
 
+	if (!wl->stats.fw_stats)
+		return;
+
 	mutex_lock(&wl->mutex);
 
 	if (unlikely(wl->state != WLCORE_STATE_ON))
@@ -1274,7 +1277,8 @@ static void wl1271_debugfs_add_files(struct wl1271 *wl,
 	DEBUGFS_ADD(irq_pkt_threshold, rootdir);
 	DEBUGFS_ADD(irq_blk_threshold, rootdir);
 	DEBUGFS_ADD(irq_timeout, rootdir);
-	DEBUGFS_ADD(fw_stats_raw, rootdir);
+	if (wl->stats.fw_stats)
+		DEBUGFS_ADD(fw_stats_raw, rootdir);
 	DEBUGFS_ADD(sleep_auth, rootdir);
 	DEBUGFS_ADD(fw_logger, rootdir);
 
@@ -1304,10 +1308,14 @@ int wl1271_debugfs_init(struct wl1271 *wl)
 	rootdir = debugfs_create_dir(KBUILD_MODNAME,
 				     wl->hw->wiphy->debugfsdir);
 
-	wl->stats.fw_stats = kzalloc(wl->stats.fw_stats_len, GFP_KERNEL);
-	if (!wl->stats.fw_stats) {
-		ret = -ENOMEM;
-		goto out_remove;
+	/* A lower driver without firmware statistics leaves fw_stats_len 0 */
+	if (wl->stats.fw_stats_len) {
+		wl->stats.fw_stats = kzalloc(wl->stats.fw_stats_len,
+					     GFP_KERNEL);
+		if (!wl->stats.fw_stats) {
+			ret = -ENOMEM;
+			goto out_remove;
+		}
 	}
 
 	wl->stats.fw_stats_update = jiffies;

-- 
2.56.0


