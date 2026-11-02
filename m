Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639792;
	b=0UI4IbgyRqdlDl+Wo51fXKoaV6L+ljA5p50BZTjpQlFs0embS8C0Uuev51qNLpsL+QbL
	 HcjZ+Fc+kE+Dlh6kDVt/L6rQwlyY/kp8PhEIERXTrUgEnApo79HXHLQjdOMC0aEcoTKcR
	 9ePrWp1wCj9GulEeHXJzP/KVt03R9XKIMyH3ZinVqkV9VUQWd8b+ySWTFL3BSr9162+6p
	 vfVvJdPKNbeYfKM/O2pWNpEDISCooMpj0Ar91NdLB9GPybs4/pmmoYGiiCwH2VKQmj1yp
	 E7IMZxGSfVx1maANo7avZ5+08cMlzuYXNU69STuyR5CcAdDIKMvCED3sI87XsYHnT6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NR3/tN1V90TozjFG9Rx5B1HVtu90LsgGKeCShgOT7Qg=;
	b=xJqLUsH5iOcOVJ8YBuwE4hFd2UM7p7UB/aXUrDAfCX6Ir7ZtuD0sSUD/Wf03tbSI0DKg
	 t3r8fjYablfX6Z3R5HqKB8wCrcnNL7B3Buzqlwak+VNblDXEkdZ3DEp0ry0NdD82xK4kT
	 H8iwEu3qnMHa2syFbC2pRPDPi4IUKAMRw/BNd8jnHdZI33S400U5RAv9CfFu27kvsaYHi
	 8Ve2RwIAZtXmUNOkYvCMa9wcLKFJV/FyiTxB5/9bsBcbW0nBGatpFH2vCfKRhuJETxqgf
	 6mTi6gj/cTKv/Rc0Bcde31nlxwL7rsLcRCkBMNHaNjWBJXKhuxy5Z/IVYaK+M2XISbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wdpuALcm;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185F06072C4C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 185F06072C4C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wdpuALcm
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso37711505e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639790; x=1794244590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NR3/tN1V90TozjFG9Rx5B1HVtu90LsgGKeCShgOT7Qg=;
        b=wdpuALcmBVDPr79qb46Vd29xoJDhHjCEwAZE3BkIgFhvWgsFpy598eghyLExpQ2jXt
         k/cKJKBdRGgqFmfdmE6L7T/hye5nnNqww9JYYqwJ3JLmgGNom7Cz7lBcrN1D2J5xkdsO
         oKTyeNuQDr4eLRiLxkebDctGcmdu+9+SOVx1hB8wavex34EuJF0ndU0qICyOMWi0EptM
         IrzhDXC+khoYLw2bECiE3Kdz5JstZtq3L24bNUwS1Mi4yeoPTZ2rXE0tcdV/J7ZVpJbD
         v/lvG1GAx4CZ5vfNGAy7n6fXwfTC6kdvuk7xCOGqJWaWlyGVu3hPFDA0vMD6JREv63TG
         sgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639790; x=1794244590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NR3/tN1V90TozjFG9Rx5B1HVtu90LsgGKeCShgOT7Qg=;
        b=FLyGnKG8OQbhbFsOy1Z6ypfMDyN5h8+g8D2AGsgMnIkKQmYtA0+KnrCcAezGrg7gOI
         8ToMfl225FL1KevrTFC5l0pM/RR0lUtHjU90MZIXczFyri1hijcpENGPZIRSwlc/cXYf
         dTBtMxoYD5wcRvZ0+/KRzVZ66uco6eWYS5ibbjmPlr0dzQfQJ6PF5oCGI3OGQ1YC0Gj7
         29QzE2qTpokCKk1ig14y9dMJfoD/CMcD35PudU+J+0dbRSHhoL9NIZZiJoYIViIP6sOr
         1FlgE6cfyo2YEehDvf+25/TnOWjlOgDk8Iuta5PRy64OZdrjrUJ/0Rz3KNPmycVnOUzX
         5U2A==
X-Forwarded-Encrypted: i=1; AKwUvBym++gsBNDiE0u/4+aIekS4/iEhy8Hqa73Q49/s1R0SU2trgBt4rcqQ5rBzcTcMq9qoW1EJV4/bY8bH5hk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLI3zYeDuimLjXYcb9a5/GKHv45lwdT507ZR59AHTGOWhXCPG1R
	dkA/F+5EkbsZQdWDfWfE5lCAioaeGe3IsPjSULOBEOo/c8XtSprh/O5k
X-Gm-Gg: AYBFou2KegiTThc+ISnNqVihKlSJhORD54wA3UAFNMWrCKMagE3LJPV1b2AmT7ZpopD
	19mozIZUQcFESqpdxpPXnxJemaD08/LmjjsWFFuGadkrp3q2et8tiI0Msf/BdPp0v3F/siD0iQ5
	IwGs48pJVxcE0FIxktnWRUijXTp3aN5ocpj0jVs+BBthqAESQFozcZrbcwq9OgUCPaHNH9qtvGN
	K6BR/DjbKHLhAGBybRuOM07bHEwEj5HOPD+vH5tgTPEFEoTgTIVF4F0zNQV+uXprF16Ect/RPLn
	umanEjkVDuC12qXI3MbuJhT9T23oGFu4wIepm2+dnmLIoYJ34+iJ2SZh8gpX/6gyEgxVkx2x6bu
	P+DmE9dibrHhAXafzL5zRpC5I7MmZX8U5ozfdIrJDdJrWuJHKWNu9UUSZiXOmPsoYt8aQID6wyQ
	Mm69klJUR7sKiqe1QIvKgtqnfTos9vaiFFpuj6Ug0Pb0yp+zmfdAHuMQPPNWdN4/w0BPIJbz2YJ
	SGSxj9WUOoRgjA8dcIbfQB06edx4SdMsjOFKqO+5JODxICNtYFQVuu1WxfUx3Ds8uoGcoRbPHXM
	k6lWkm6k46EjSgAl2EPtzKt6L0GdIDF+YYezIne775pKnCa6TAaEgtvgSxAIQZg=
X-Received: by 2002:a05:600c:638f:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4ac17d16a26mr248796895e9.6.1793639790352;
        Mon, 02 Nov 2026 09:16:30 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm23598760f8f.6.2026.11.02.09.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:16:29 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 3/4] wifi: cw1200: handle the XR819 channel switch and join
Date: Mon,  2 Nov 2026 17:16:02 +0000
Message-ID: <20261102171603.368298-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102171603.368298-1-pmazzini@gmail.com>
References: <20261102171603.368298-1-pmazzini@gmail.com>
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

The XR819, detected as CW1x60, asserts on SWITCH_CHANNEL while idle
and only joins synchronously, confirming after up to 5 s. Keep the
channel for scan and join, as the vendor driver does, drop the
asynchronous join flags, and allow 7 s for the join.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/net/wireless/st/cw1200/fwio.c | 2 ++
 drivers/net/wireless/st/cw1200/fwio.h | 2 ++
 drivers/net/wireless/st/cw1200/sta.c  | 8 +++++---
 drivers/net/wireless/st/cw1200/wsm.c  | 3 ++-
 4 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/st/cw1200/fwio.c b/drivers/net/wireless/st/cw1200/fwio.c
index 6601aec1f231..1a68ef6ed2fa 100644
--- a/drivers/net/wireless/st/cw1200/fwio.c
+++ b/drivers/net/wireless/st/cw1200/fwio.c
@@ -69,6 +69,8 @@ static const struct cw1200_chip cw1200_chips[] = {
 		.revision = CW1X60_HW_REV,
 		.firmware = FIRMWARE_CW1X60,
 		.sdd = SDD_FILE_CW1X60,
+		.sync_join = true,
+		.no_switch_channel = true,
 	},
 };
 
diff --git a/drivers/net/wireless/st/cw1200/fwio.h b/drivers/net/wireless/st/cw1200/fwio.h
index e97cbcd54e57..9925d4bcedda 100644
--- a/drivers/net/wireless/st/cw1200/fwio.h
+++ b/drivers/net/wireless/st/cw1200/fwio.h
@@ -30,6 +30,8 @@ struct cw1200_chip {
 	int revision;
 	const char *firmware;
 	const char *sdd;
+	bool sync_join;		/* no asynchronous join */
+	bool no_switch_channel;	/* scan and join pass the channel */
 };
 
 int cw1200_load_firmware(struct cw1200_common *priv);
diff --git a/drivers/net/wireless/st/cw1200/sta.c b/drivers/net/wireless/st/cw1200/sta.c
index f3f31aa52499..eeb2bf56edff 100644
--- a/drivers/net/wireless/st/cw1200/sta.c
+++ b/drivers/net/wireless/st/cw1200/sta.c
@@ -349,8 +349,10 @@ int cw1200_config(struct ieee80211_hw *dev, int radio_idx, u32 changed)
 		pr_debug("[STA] Freq %d (wsm ch: %d).\n",
 			 ch->center_freq, ch->hw_value);
 
-		/* __cw1200_flush() implicitly locks tx, if successful */
-		if (!__cw1200_flush(priv, false)) {
+		if (priv->chip->no_switch_channel) {
+			priv->channel = ch;
+		} else if (!__cw1200_flush(priv, false)) {
+			/* __cw1200_flush() implicitly locks tx, if successful */
 			if (!wsm_switch_channel(priv, &channel)) {
 				ret = wait_event_timeout(priv->channel_switch_done,
 							 !priv->channel_switch_in_progress,
@@ -1304,7 +1306,7 @@ static void cw1200_do_join(struct cw1200_common *priv)
 	}
 
 	/* Enable asynchronous join calls */
-	if (!priv->vif->cfg.ibss_joined) {
+	if (!priv->vif->cfg.ibss_joined && !priv->chip->sync_join) {
 		join.flags |= WSM_JOIN_FLAGS_FORCE;
 		join.flags |= WSM_JOIN_FLAGS_FORCE_WITH_COMPLETE_IND;
 	}
diff --git a/drivers/net/wireless/st/cw1200/wsm.c b/drivers/net/wireless/st/cw1200/wsm.c
index d6529e5b73b2..6b0b333620ee 100644
--- a/drivers/net/wireless/st/cw1200/wsm.c
+++ b/drivers/net/wireless/st/cw1200/wsm.c
@@ -20,6 +20,7 @@
 #include "debug.h"
 
 #define WSM_CMD_TIMEOUT		(2 * HZ) /* With respect to interrupt loss */
+#define WSM_CMD_JOIN_TIMEOUT	(7 * HZ) /* A synchronous join takes up to 5 s */
 #define WSM_CMD_START_TIMEOUT	(7 * HZ)
 #define WSM_CMD_RESET_TIMEOUT	(3 * HZ) /* 2 sec. timeout was observed.   */
 #define WSM_CMD_MAX_TIMEOUT	(3 * HZ)
@@ -445,7 +446,7 @@ int wsm_join(struct cw1200_common *priv, struct wsm_join *arg)
 
 	priv->tx_burst_idx = -1;
 	ret = wsm_cmd_send(priv, buf, &resp,
-			   WSM_JOIN_REQ_ID, WSM_CMD_TIMEOUT);
+			   WSM_JOIN_REQ_ID, WSM_CMD_JOIN_TIMEOUT);
 	/* TODO:  Update state based on resp.min|max_power_level */
 
 	priv->join_complete_status = resp.status;
-- 
2.52.0

