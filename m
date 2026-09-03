Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4E74F55A4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454893; cv=none; b=Tdz03A9yGFg0ol7uX6PAsZ9b6s74Hh5FFyfNCpTJncjGT/bm3tSm1fgX83T50eeQCV32tKa3eV92qiCV9ZDHI6Rf6xvsX/omsONPefirwIe9mOd9SMIzGohNHIijE2WiwteHDF11BFXWeqgTWPFJCaEFBA8CkmS4xpbvhzkhGWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454893; c=relaxed/simple;
	bh=3UMQjWNFb9Xwa3eKvxywNyx78656HAnkC2aZLshI8hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sD+YLnUligJ5okT38rPD2Fmo53nP/oWPUxcQM6IaBubFrq/9c9ma665/htGLnmLJIrYa815s4Tgq6j17U1XtfZJN+EmStEVBXLTayv9CDe3vRBtr0UzU2p5HznqMk7JeT4mEgnjQiDMt51Ib3fNR6cMdyTDKX+JxqLbfDa7JB5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oqi8/5sm; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oqi8/5sm"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso2303787e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788454888; x=1789059688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8CY2lxlBuhLH/6xYb7pukad2G53hZxpwZtqvTnoKYUw=;
        b=oqi8/5smLZi5bs81O/O37jqjNNJ/BjBYTmJBk0480ffF2i3lz/Ao7U+99F79ZEMp/L
         Gw+Xx2Qhk82QkmMgjNAKkLjUgT5VOVaGwoqfD51OZmDGxOFYFaJlzbnNAglytfzRXfeb
         Hct+b7t0tkeDnlDTdwFoTzFL7MHVWWWXPuZsJwA9syHw0HDiSaJNKusxlizKnvriUC1N
         w6Oadaub1ggI9nQiVZ3v1Q/Id5fvuVhgK4uZQfAA41I47UaTRR/qR0V0ZLTrhAMCwABS
         PrMdqmQI7Z7rRpJ+TpreI8ZZhIcNklTj+ZhFejymIZmblwyp+ZK9Tne/LDq+AdE7ccBL
         eFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788454888; x=1789059688;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8CY2lxlBuhLH/6xYb7pukad2G53hZxpwZtqvTnoKYUw=;
        b=Cr/PXTMGfwW+N5MoCalFmI7Gi2xEMXEqEz/aNPrY0iFVcrZnaDr3JtBcFsPVdWhHq2
         7Nx2pdinzJh+8tnO55fNhVaXgvAACb3gV+1Tzv5EH/ydYKUnfsYdk5jTBgo9PdZTQiMf
         voYsuXYBQgcaLRyXiz9V/TTBBIKI+GZHtTkryAGhhafAEebdNP2fYu9p6T1Of9hvh1mm
         prbBj5ZB6dy2ipU8Xm+ImJNy4TqOtJ6ZhTb5RTOmMi3GgDHgA+sbFnTAOpzkousvUk6T
         azFZA/+RLmyfhxNBhHGQM7ihtBHTdWTZK6azSZZ+hfEl1icQIIVXcMTmW0JnVw3iZSc7
         8ZDQ==
X-Gm-Message-State: AFuF++lP/6CecMfzZ5fvrkmpPsqye/5P5uoA1I6DO1TLk17xLcIztKMF
	fw0CNF3XPW5h9X6iHxNkcF3mU/BqSIGMMXYGf9gUWpmsh0shRx8z+NiMPdvQ
X-Gm-Gg: AYBFou17C/lqe5SUh2817fG/grA1KevmcxfB78u8VNityJsK+V5xG8CtVvfNmbp+9Yk
	cT+t+HFpmTLxGHh3d3i3LIY0psI39Y55SV0842yJZyHaprZGxUDg36aora3UfjaUOM1YCtXygSi
	0NBgFJ5alhMkjaA2Q1tc7dDbQuGfF0Vdh7dozcy9zG/bxW+Togqk+SENosVCgd0EFA+fHmXYZ9c
	XQdSkN1Q9reKL8yJPJqcF13s7DPXA0teYsfdol/JcpiwndkfjyKnwACOmo5xpfD6U8c1zp1XQhn
	+RFStnYIA5RfJyegfWiKEKPptyviO+Ej+NIWjNbJcHUVYzYiiJo79GO2FikqCfUQKZT+l700NFk
	leGxYgLrMf893j7Ss9jiAYGUfOWlii9Vo3aR80/UoWHWw2W7Y0XQU0CI7o7ZAJ4rSBYWsSUYttM
	gxIuuzCDA4CNM1in+pVQSE5G0myViz8gjzVNCcF58FbmxZrTCxDkZEa13UrV6g+y3efa/i4e3N5
	PvEgafVMA/N3H1DE+6RkuqUuM88hY00OQVUknEI8JuxcKCj8kAWYDOi8Ot/amI/kjwzB2PuCBui
	XkWC
X-Received: by 2002:a05:6512:ac6:b0:5b6:4ad:77b3 with SMTP id 2adb3069b0e04-5b61557fa77mr629884e87.27.1788454887923;
        Thu, 03 Sep 2026 10:01:27 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b61669b215sm5563e87.11.2026.09.03.10.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:01:27 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] wifi: ath9k_htc: count WMI timeouts and length-discarded frames
Date: Thu,  3 Sep 2026 20:00:50 +0300
Message-ID: <20260903170050.1089917-3-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903170050.1089917-1-nerijus.bendziunas@gmail.com>
References: <20260903170050.1089917-1-nerijus.bendziunas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A WMI command that times out is invisible unless CONFIG_ATH_DEBUG is on
and the WMI debug bit is set, yet it is the event behind every register
read that came back as -1. Likewise the receive path discards short and
zero-length frames with nothing but a debug message, although a burst of
them is what strong interference looks like from the host. Keep a count
of commands sent and timed out in a new debugfs file, wmi, and count the
length discards in the existing LENGTH-ERR line of recv, so both can be
watched on a stock kernel.

Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
 drivers/net/wireless/ath/ath9k/htc.h          |  2 ++
 .../net/wireless/ath/ath9k/htc_drv_debug.c    | 25 +++++++++++++++++++
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c |  3 +++
 drivers/net/wireless/ath/ath9k/wmi.c          |  2 ++
 drivers/net/wireless/ath/ath9k/wmi.h          |  2 ++
 5 files changed, 34 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/htc.h b/drivers/net/wireless/ath/ath9k/htc.h
index 6c33e898b300..0bdb300f0ad7 100644
--- a/drivers/net/wireless/ath/ath9k/htc.h
+++ b/drivers/net/wireless/ath/ath9k/htc.h
@@ -328,6 +328,7 @@ static inline struct ath9k_htc_tx_ctl *HTC_SKB_CB(struct sk_buff *skb)
 #ifdef CONFIG_ATH9K_HTC_DEBUGFS
 #define __STAT_SAFE(hif_dev, expr)	do { ((hif_dev)->htc_handle->drv_priv ? (expr) : 0); } while (0)
 #define CAB_STAT_INC(priv)		do { ((priv)->debug.tx_stats.cab_queued++); } while (0)
+#define RX_LEN_ERR_INC(priv)		((priv)->debug.rx_stats.rx_len_err++)
 #define TX_QSTAT_INC(priv, q)		do { ((priv)->debug.tx_stats.queue_stats[q]++); } while (0)
 
 #define TX_STAT_INC(hif_dev, c) \
@@ -383,6 +384,7 @@ void ath9k_htc_get_et_stats(struct ieee80211_hw *hw,
 #define RX_STAT_ADD(hif_dev, c, a)	do { } while (0)
 
 #define CAB_STAT_INC(priv)
+#define RX_LEN_ERR_INC(priv)
 #define TX_QSTAT_INC(priv, c)
 
 static inline void ath9k_htc_err_stat_rx(struct ath9k_htc_priv *priv,
diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_debug.c b/drivers/net/wireless/ath/ath9k/htc_drv_debug.c
index 9437d69877cc..f1bf8cc90d3a 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_debug.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_debug.c
@@ -310,6 +310,29 @@ static const struct file_operations fops_slot = {
 	.llseek = default_llseek,
 };
 
+static ssize_t read_file_wmi(struct file *file, char __user *user_buf,
+			     size_t count, loff_t *ppos)
+{
+	struct ath9k_htc_priv *priv = file->private_data;
+	char buf[128];
+	unsigned int len;
+
+	len = scnprintf(buf, sizeof(buf),
+			"%20s : %10u\n"
+			"%20s : %10u\n",
+			"Commands", priv->wmi->cmds_sent,
+			"Timeouts", priv->wmi->cmds_timed_out);
+
+	return simple_read_from_buffer(user_buf, count, ppos, buf, len);
+}
+
+static const struct file_operations fops_wmi = {
+	.read = read_file_wmi,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
 static ssize_t read_file_queue(struct file *file, char __user *user_buf,
 			       size_t count, loff_t *ppos)
 {
@@ -505,6 +528,8 @@ int ath9k_htc_init_debug(struct ath_hw *ah)
 
 	debugfs_create_file("slot", 0400, priv->debug.debugfs_phy,
 			    priv, &fops_slot);
+	debugfs_create_file("wmi", 0400, priv->debug.debugfs_phy,
+			    priv, &fops_wmi);
 	debugfs_create_file("queue", 0400, priv->debug.debugfs_phy,
 			    priv, &fops_queue);
 	debugfs_create_file("debug", 0600, priv->debug.debugfs_phy,
diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c b/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
index 299064a7fa49..aa4c8beb10d5 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
@@ -986,6 +986,7 @@ static bool ath9k_rx_prepare(struct ath9k_htc_priv *priv,
 	if (skb->len < HTC_RX_FRAME_HEADER_SIZE) {
 		ath_err(common, "Corrupted RX frame, dropping (len: %d)\n",
 			skb->len);
+		RX_LEN_ERR_INC(priv);
 		goto rx_next;
 	}
 
@@ -997,6 +998,7 @@ static bool ath9k_rx_prepare(struct ath9k_htc_priv *priv,
 		ath_err(common,
 			"Corrupted RX data len, dropping (dlen: %d, skblen: %d)\n",
 			rs_datalen, skb->len);
+		RX_LEN_ERR_INC(priv);
 		goto rx_next;
 	}
 
@@ -1009,6 +1011,7 @@ static bool ath9k_rx_prepare(struct ath9k_htc_priv *priv,
 		ath_dbg(common, ANY,
 			"Short RX data len, dropping (dlen: %d)\n",
 			rs_datalen);
+		RX_LEN_ERR_INC(priv);
 		goto rx_next;
 	}
 
diff --git a/drivers/net/wireless/ath/ath9k/wmi.c b/drivers/net/wireless/ath/ath9k/wmi.c
index 284e8c13b043..d293f3adc214 100644
--- a/drivers/net/wireless/ath/ath9k/wmi.c
+++ b/drivers/net/wireless/ath/ath9k/wmi.c
@@ -345,8 +345,10 @@ int ath9k_wmi_cmd(struct wmi *wmi, enum wmi_cmd_id cmd_id,
 	if (ret)
 		goto out;
 
+	wmi->cmds_sent++;
 	time_left = wait_for_completion_timeout(&wmi->cmd_wait, timeout);
 	if (!time_left) {
+		wmi->cmds_timed_out++;
 		ath_dbg(common, WMI, "Timeout waiting for WMI command: %s\n",
 			wmi_cmd_to_name(cmd_id));
 		spin_lock_irqsave(&wmi->wmi_lock, flags);
diff --git a/drivers/net/wireless/ath/ath9k/wmi.h b/drivers/net/wireless/ath/ath9k/wmi.h
index 5c3b710b8f31..9dc5deffcdfe 100644
--- a/drivers/net/wireless/ath/ath9k/wmi.h
+++ b/drivers/net/wireless/ath/ath9k/wmi.h
@@ -158,6 +158,8 @@ struct wmi {
 	u8 *cmd_rsp_buf;
 	u32 cmd_rsp_len;
 	bool stopped;
+	u32 cmds_sent;
+	u32 cmds_timed_out;
 
 	struct list_head pending_tx_events;
 	spinlock_t event_lock;
-- 
2.55.0

