Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC2F4A68BF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016553; cv=none; b=QCnbqId/7SFSYjUSBYm96x1Z2PJwbWwuHEQolqHtjQUwa9XbqBpHP2XBycYLNNCXyZfJbW7za3di1HjWZWe8Lo9ekCSKehIAy3C4lzQMJLNCgOOfkoRICUnRBRC0Y5dJ8YhsKXh8BopLBvFVWIehoUHymO/kaNzQEU+Nju/c0Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016553; c=relaxed/simple;
	bh=YFWq/IvCJbQstHX7Ft2w/D3TTysjlDhgep/4kllNw0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZZ9tRprNooFxRJLFfemFmcJP/NkZ5VgcVcDq/IhmDaSFxj1tdW/jENj7Tg1f/FOtWhUYYispgfk8sFujQLqv0j9S8awehRuLDH3S7UqenCMSPBVrJFbIFLk+dyId+TK55EAj25gAu/01y+x3BupKFjTWsUHX6B+HusrIKuRPa+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJKxP6FI; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJKxP6FI"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-141395927feso8950491c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792016551; x=1792621351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mJcssE+Ust9/2+nrgLqVuTl5Th0jv3D9ktZ8Z2ELH5c=;
        b=MJKxP6FI606+RMW7an8hm/JiIhPnXGOtW74e2LUA6uUb5XKr3OQSb5BeQvb+gwbnUw
         so3bCPSCAyG+vjbWyrRFLBNHX0lnWWx1tcU2JW/5qkwItlRZDX4FO5GKBf/CLtsPLPHp
         UYno2mxchn+tlYWr4hI8RXNW9C6QRG06rElvVSfmsSknyLXugo2ecJU1/3Lz70ZODiPc
         Jvri/KrHBGP3FSzm3lmrJ0Ks2fLPO8pq3XOWaAkcV0XpF7kY6Zt+bTFfqIDUABVNRI1w
         aOuwd0IOk9GIR/S9Oz6NWyei6GxzJxIiP9ZG1Bi8Ht9pwMEqfU9Liv6zUrapMvGC7sab
         lPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792016551; x=1792621351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mJcssE+Ust9/2+nrgLqVuTl5Th0jv3D9ktZ8Z2ELH5c=;
        b=es85WutP7T7oEnywE/h4YieezfLAi8IWVRBGqEnblcx9qOL0jJ7cwy0P5U73wsV3rG
         6MYjTuoYiGYPOkra+Jx9pJWC8gHKfipM1MMinEl3SHh58E7KrG+/8QuIyQr+BqWrCWKJ
         grSn1nRsa8fGbZSUcu4rGutY0gVbf17fFBQecT9OClkcLz2n1Gsg+eKUGjXi5qXsqfvx
         GLMfGEGoe9ij38+jBZ/Cu4sxixh5Ge+B3Q0mc+GU8/XSl4YnkQyG18BkhwpI24P02o3f
         KM/FjWVeue9/+C9gtpKA8f24f64zC8QwM7uZMlS0bfDJm01N+wRIkxDy+oXkNAxiO6Hn
         Dnmw==
X-Forwarded-Encrypted: i=1; AKwUvBzHMf/ZogfQxEGC6s0pQZlcZztF1ZrIMFsttabQ7ElUxXCBbJS8+rNUu1HKlJ7rQZGqv7Uykp5zfbf3X9o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvqB2Z2M/pyTc2qhhQgqyLj9zJOcD1S5jPuLkroFQs/WKrB+oR
	rrz10EVNjRXwHr4Yid9d0RmT6r6o/xTyC5hvrJU5Zd6TZEJDtFd8EGkQ
X-Gm-Gg: AYBFou3tglKcMb+yhzmJBoL76Xd6Jnz/GrpEC/lkIVMIZj/px/om1Cbtq+aCW+MxYRO
	FbsRc7kaQKYeCq1U5SCTaMrmkOZ72Zj0flMwo1hpGHsvZQGj1xqD2rbMSi1tkNftJx7yhT6Rcey
	pPUgG6uYmwATJu/4oC2aOqKm1DNJ68/kLHreRzYdKtUe268kXpnGxKxRt3eAf4jnnlbiAw250ms
	SZLKKeqtQFbdrgAVbqajIE/Zq1YWoOVNxbR3FXkPQmwK1fxoaRFX1sE6i7PEtJHzkGq0oZ8hZ7o
	qwlwrn1RvOb1+guQHXM4PkGaTuxm6WeW2ZhyEY7kqWwJdS7VDmqprEXXxIdhBeitdE5ss1ZnC9q
	ItUHYdrFs4sRDTWztwpXgaNYsSzGbyKAOs6uFh9mEBpyWnGfK5tqiG/p3ZRDQ25oJx1Mm687f35
	4R/4VtW+LGubyPyLrQBTLoIEtQMt813j4wtPU9XpjTwgtftWoEM5faZaVuCQfmH0zOeihm1troF
	DC7D6jQZUK0SQWi
X-Received: by 2002:a05:701b:454b:20b0:144:f096:4dda with SMTP id a92af1059eb24-16a6203de6dmr22350239c88.43.1792016550880;
        Wed, 14 Oct 2026 15:22:30 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::5:7561])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567aef5sm49030839c88.19.2026.10.14.15.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:22:30 -0700 (PDT)
From: Zinc Lim <limzhineng2@gmail.com>
To: alexanderduyck@fb.com,
	kuba@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	linux@roeck-us.net,
	horms@kernel.org,
	hmohsin@meta.com,
	mike.marciniszyn@gmail.com
Cc: kernel-team@meta.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	zinclim@meta.com,
	limzhineng2@gmail.com
Subject: [PATCH net-next v4 1/6] eth: fbnic: move sensor read logic out of fbnic_mac
Date: Wed, 14 Oct 2026 15:22:19 -0700
Message-ID: <20261014222225.2803660-2-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014222225.2803660-1-limzhineng2@gmail.com>
References: <20261014222225.2803660-1-limzhineng2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sensor read lived behind the fbnic_mac get_sensor op, but it is only
ever used by the hwmon subsystem. Move the read into fbnic_hwmon.c and
call it directly there, closer to where it is used, and drop the
now-unused get_sensor op from struct fbnic_mac. No functional change.

Signed-off-by: Zinc Lim <limzhineng2@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 56 ++++++++++++++++++-
 drivers/net/ethernet/meta/fbnic/fbnic_mac.c   | 55 ------------------
 drivers/net/ethernet/meta/fbnic/fbnic_mac.h   |  2 -
 3 files changed, 54 insertions(+), 59 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
index def8598aceec..6c8c66ab86c1 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
@@ -28,15 +28,67 @@ static umode_t fbnic_hwmon_is_visible(const void *drvdata,
 	return 0;
 }
 
+static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *val)
+{
+	struct fbnic_fw_completion *fw_cmpl;
+	int err = 0;
+	s32 *sensor;
+
+	fw_cmpl = fbnic_fw_alloc_cmpl(FBNIC_TLV_MSG_ID_TSENE_READ_RESP);
+	if (!fw_cmpl)
+		return -ENOMEM;
+
+	switch (id) {
+	case FBNIC_SENSOR_TEMP:
+		sensor = &fw_cmpl->u.tsene.millidegrees;
+		break;
+	case FBNIC_SENSOR_VOLTAGE:
+		sensor = &fw_cmpl->u.tsene.millivolts;
+		break;
+	default:
+		err = -EINVAL;
+		goto exit_free;
+	}
+
+	err = fbnic_fw_xmit_tsene_read_msg(fbd, fw_cmpl);
+	if (err) {
+		dev_err(fbd->dev,
+			"Failed to transmit TSENE read msg, err %d\n",
+			err);
+		goto exit_free;
+	}
+
+	if (!wait_for_completion_timeout(&fw_cmpl->done, 10 * HZ)) {
+		dev_err(fbd->dev, "Timed out waiting for TSENE read\n");
+		err = -ETIMEDOUT;
+		goto exit_cleanup;
+	}
+
+	/* Handle error returned by firmware */
+	if (fw_cmpl->result) {
+		err = fw_cmpl->result;
+		dev_err(fbd->dev, "%s: Firmware returned error %d\n",
+			__func__, err);
+		goto exit_cleanup;
+	}
+
+	*val = *sensor;
+exit_cleanup:
+	fbnic_mbx_clear_cmpl(fbd, fw_cmpl);
+exit_free:
+	fbnic_fw_put_cmpl(fw_cmpl);
+
+	return err;
+}
+
 static int fbnic_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			    u32 attr, int channel, long *val)
 {
 	struct fbnic_dev *fbd = dev_get_drvdata(dev);
-	const struct fbnic_mac *mac = fbd->mac;
 	int id;
 
 	id = fbnic_hwmon_sensor_id(type);
-	return id < 0 ? id : mac->get_sensor(fbd, id, val);
+	return id < 0 ? id : fbnic_hwmon_sensor_read(fbd, id, val);
 }
 
 static const struct hwmon_ops fbnic_hwmon_ops = {
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_mac.c b/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
index 16271c717a5a..3e1256ffd141 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
@@ -892,60 +892,6 @@ fbnic_mac_get_rmon_stats(struct fbnic_dev *fbd, bool reset,
 			    TMI_STAT_TX_PACKET_9217_MAX_BYTES);
 }
 
-static int fbnic_mac_get_sensor_asic(struct fbnic_dev *fbd, int id,
-				     long *val)
-{
-	struct fbnic_fw_completion *fw_cmpl;
-	int err = 0;
-	s32 *sensor;
-
-	fw_cmpl = fbnic_fw_alloc_cmpl(FBNIC_TLV_MSG_ID_TSENE_READ_RESP);
-	if (!fw_cmpl)
-		return -ENOMEM;
-
-	switch (id) {
-	case FBNIC_SENSOR_TEMP:
-		sensor = &fw_cmpl->u.tsene.millidegrees;
-		break;
-	case FBNIC_SENSOR_VOLTAGE:
-		sensor = &fw_cmpl->u.tsene.millivolts;
-		break;
-	default:
-		err = -EINVAL;
-		goto exit_free;
-	}
-
-	err = fbnic_fw_xmit_tsene_read_msg(fbd, fw_cmpl);
-	if (err) {
-		dev_err(fbd->dev,
-			"Failed to transmit TSENE read msg, err %d\n",
-			err);
-		goto exit_free;
-	}
-
-	if (!wait_for_completion_timeout(&fw_cmpl->done, 10 * HZ)) {
-		dev_err(fbd->dev, "Timed out waiting for TSENE read\n");
-		err = -ETIMEDOUT;
-		goto exit_cleanup;
-	}
-
-	/* Handle error returned by firmware */
-	if (fw_cmpl->result) {
-		err = fw_cmpl->result;
-		dev_err(fbd->dev, "%s: Firmware returned error %d\n",
-			__func__, err);
-		goto exit_cleanup;
-	}
-
-	*val = *sensor;
-exit_cleanup:
-	fbnic_mbx_clear_cmpl(fbd, fw_cmpl);
-exit_free:
-	fbnic_fw_put_cmpl(fw_cmpl);
-
-	return err;
-}
-
 static const struct fbnic_mac fbnic_mac_asic = {
 	.init_regs = fbnic_mac_init_regs,
 	.get_link = fbnic_mac_get_link,
@@ -959,7 +905,6 @@ static const struct fbnic_mac fbnic_mac_asic = {
 	.get_rmon_stats = fbnic_mac_get_rmon_stats,
 	.link_down = fbnic_mac_link_down_asic,
 	.link_up = fbnic_mac_link_up_asic,
-	.get_sensor = fbnic_mac_get_sensor_asic,
 };
 
 /**
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_mac.h b/drivers/net/ethernet/meta/fbnic/fbnic_mac.h
index 10f30e0e8f69..bde2daa65645 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_mac.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_mac.h
@@ -137,8 +137,6 @@ struct fbnic_mac {
 
 	void (*link_down)(struct fbnic_dev *fbd);
 	void (*link_up)(struct fbnic_dev *fbd, bool tx_pause, bool rx_pause);
-
-	int (*get_sensor)(struct fbnic_dev *fbd, int id, long *val);
 };
 
 int fbnic_mac_init(struct fbnic_dev *fbd);
-- 
2.53.0-Meta

