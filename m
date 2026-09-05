Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BED63C13E3
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 08:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788598740; cv=none; b=RXmQxdMKZCqvjpX9AjtFtzf/0vqh5RJ0b7TteJtUIf1ENUNYeT4Fg6D0nWh35uTiihnuM4BuZbd9RCfNqJM7MbBaUZkzZM6mYqj2ZOxB4UPngtN+eKOZ2+WoFJkLdHCb/1tAgg3C4yHzCG2dlQ0yX9/AcQBxQoOPKl2888ceTBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788598740; c=relaxed/simple;
	bh=wwO1tiUatXUNiREkAKHOy4KgtEdLsUuk32neGIK+pVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XM7n5YdGUuP5qJZPEL8TsQ+ZNQLux1hHEWYu/OqaXU0cnwXyft0VzDBqPdsq8Zr6iK7bpP3Zmdjtj5bj3xc0MQd1MrWl+3vtpK6DJojSvpkGKXbdysMB2LfwSwulcwjV8rfcF6uH0bCTJBG82Obd7BtlwTGA0nkD5z01OVAkZ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEP7kryX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEP7kryX"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso22458125e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 01:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788598734; x=1789203534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gvGhL3HZ4A6FyUQcqo6y9PFuXiif2pxtShOv+n9uw9o=;
        b=QEP7kryXnMSQRxg9RVwS1KJY3vLyUE0xdDqTyG6OoQi6zGM9a3fJm4kStxxu/V+nw+
         pL/0o5aaJZZWbGNovZyrBHlhAA/sm3ieYr8VDoTloEDfFhJGafoDHbqNz7NFD+yUQzH+
         MmxIoPBQ5f7vZyccQbXeMAb3shM5KWB9d7ep0HjJg9itf2KAuJp5OP6kfD9uhmQID6hW
         r46x5P6uV/tw9VFPng8Z0isW7w/gFmg+pWLo0dwGuIYVztPPGCDGo+Ow9VXSWfBcIvpP
         pb8y/K8zqdxI2MFfY6b3uQ1Lz97UYQ2U1Ao6jUmdKY8nbjyPKGyDs7CC0t3Qpj9YEVWn
         IaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788598734; x=1789203534;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gvGhL3HZ4A6FyUQcqo6y9PFuXiif2pxtShOv+n9uw9o=;
        b=iRlft0dkDfCcTmdL3pZqFA2HkGQqoO+cELMedH6rSSY6DyLn5yigj7XOR+HDUenbpv
         2EjFWmF1Q9tB3mWwV4P+XFai+9limH2k2YD1QMz/Tl2HuC+Zx7o2ZE4G5GYiHs/S+T29
         RXOimdTLDQwaBtaqoEpquNK3G+8y1crqS+ZPUvLr9qyLy3x9tP0fYSNsgLnMuktdh8k3
         cHXkdXWM0B1DwEKOvznb3eWUwuo18Tqoxc9quUra8yGmZguyUa6ThQf5BabWL4TxWSTO
         8icjN53w61iGNodn/ITAvWnVLa5Pw086dLWYjRRhTR4URXfPjphxWdjVjZFINeAoy8hD
         l6EQ==
X-Forwarded-Encrypted: i=1; AKwUvByeUtJzaX+kVINfcDROkJxDljYSHsQ6kIMmhwksTgwYOCGRSE+pL0asZt9tP5e9aWnF+KUov3rWIuFO75I=@vger.kernel.org
X-Gm-Message-State: AFuF++mQrbWMAtMgp3B6S5bvt3vPDvyqHgnvELkYvri+t1UsOhRqDqR1
	KphH28dJ6TRvseijX2l2x6ksBCQJ7Vkjyd0NseuehSt4976ooCLh2/A=
X-Gm-Gg: AYBFou19djMJ8WRw7siBfR4wTkcI8zDgOBMCX6fBTO1YTGSyRX8sbzBJ/ybRzKwIIgl
	VXcfJfq4eq4HscEtxQmkci4Tc9NUSBdISHvRBxSreqMCmPWHWUnc+rqQkMaVTUpTLEpz+p3Q8je
	Jk9p1Imw+O/BG9r1uv2SVh9FNOE1lh3l9vv4snMSosfjLJYuhvTjk3YXNDgxxw3z1m1R+mn8coB
	cN/6Q7Gu0M/DRy8sh59DnaLKyDIokBvSGSazjitpwQZWd0nLKz30OfyrI0GuzxXELDSbcj2wxeN
	qOi4NrhC8mu3HXfoUwQV9pt9GONBhmkqTfjz1G5Dx/mLMiCyJiujy4w5sTqGVjHMfWzHeCG4VSM
	TU2g+Lvk8HSK9R2s7krcGXxVjQVOD/xtKY5bRskPmtrRKGCJrHyIeQI8AMlFgGoopE9O5kmjUav
	hYD+WW5+v5sdBWHP3qWBWxBuNCyubPX1WO1WdWfEJ5HGCq9S84J7J1QaryYTQVCFEImTXPTyi7M
	Clh+MBVOxZRZrUy7U6n2q1+vYASZuSYSDBgBEoD4fqR38vkDJgQQGWRNQrVDeiFPpEB1idgOgRY
	7yF1ww==
X-Received: by 2002:a05:600c:35c3:b0:49c:fc6c:be10 with SMTP id 5b1f17b1804b1-49cfc6cc055mr83086845e9.22.1788598734103;
        Sat, 05 Sep 2026 01:58:54 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm228306435e9.3.2026.09.05.01.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 01:58:53 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>,
	Oleksij Rempel <linux@rempel-privat.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] wifi: ath9k_htc: fix the byte count of a full RMW buffer flush
Date: Sat,  5 Sep 2026 11:58:06 +0300
Message-ID: <20260905085807.384488-2-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905085807.384488-1-nerijus.bendziunas@gmail.com>
References: <20260905085807.384488-1-nerijus.bendziunas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The AR9271 PA calibration has been running with its last five
register writes dropped since the RMW buffer was added.
ar9271_hw_pa_cal() queues exactly 15 read-modify-writes, which fills
the buffer, and ath9k_reg_rmw_buffer() sizes that flush with
sizeof(struct register_write), 8 bytes, instead of
sizeof(struct register_rmw), 12 bytes. The firmware gets 120 of the
180 bytes and applies only the first 10.

Fixing the size alone kills the device. The command becomes
8 (HTC) + 4 (WMI) + 180 = 192 bytes, three full 64-byte USB packets,
and the firmware ends a command only on a short packet
(usb_reg_out_patch() in open-ath9k-htc-firmware). The 192-byte
command is never delivered: the device stops answering WMI and stays
dead through a warm reboot until power is removed. An AR9271 hangs
this way on the first interface open, with the linux-firmware 1.4.0
blob and with an open-firmware build alike.

So cap the buffer at 14 entries as well. A command of n entries is
12 * (n + 1) bytes, a multiple of 64 only at n = 15 within the
buffer's reach. The next largest RMW batch, ath9k_hw_4k_set_gain(),
queues at most 14 entries, 180 bytes, and a register write batch is
8n + 12 bytes, never a multiple of 64. The PA calibration then goes
out as 14 + 1 entries and all 15 writes reach the chip.
AR9271_AN_RF2G6_OFFS then reads 30 on 40 of 40 opens, where the
truncated command gave 32 on 78 of 80; a firmware with fixed
reassembly, given the full 15-entry command, gave 30 on 19 of 20. The
on-air effect is not measured yet. With the cap, 120 interface opens
ran clean: 60 with this patch, 20 of them on the linux-firmware 1.4.0
blob and 20 on a second AR9271, and 60 with a bench build of the same
wire lengths.

Fixes: 8badb50cfab6 ("ath9k_htc: add new WMI_REG_RMW_CMDID command")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
Changes in v3:
- v2 said no caller fills the buffer; ar9271_hw_pa_cal() does, on
  every AR9271 reset.
- Cap MAX_RMW_CMD_NUMBER at 14 in the same patch: the corrected size
  alone yields a 192-byte command the firmware never delivers.
- Assisted-by in the form Documentation/process/coding-assistants.rst
  now asks for.
Changes in v2:
- Add Assisted-by, rewrite the commit message, rebase onto ath-next.

 drivers/net/wireless/ath/ath9k/htc_drv_init.c | 2 +-
 drivers/net/wireless/ath/ath9k/wmi.h          | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_init.c b/drivers/net/wireless/ath/ath9k/htc_drv_init.c
index 6de78ae85726..0b49d2cc99f0 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_init.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_init.c
@@ -405,7 +405,7 @@ static void ath9k_reg_rmw_buffer(void *hw_priv,
 	if (priv->wmi->multi_rmw_idx == MAX_RMW_CMD_NUMBER) {
 		r = ath9k_wmi_cmd(priv->wmi, WMI_REG_RMW_CMDID,
 			  (u8 *) &priv->wmi->multi_rmw,
-			  sizeof(struct register_write) * priv->wmi->multi_rmw_idx,
+			  sizeof(struct register_rmw) * priv->wmi->multi_rmw_idx,
 			  (u8 *) &rsp_status, sizeof(rsp_status),
 			  100);
 		if (unlikely(r)) {
diff --git a/drivers/net/wireless/ath/ath9k/wmi.h b/drivers/net/wireless/ath/ath9k/wmi.h
index 5c3b710b8f31..256f46098a6b 100644
--- a/drivers/net/wireless/ath/ath9k/wmi.h
+++ b/drivers/net/wireless/ath/ath9k/wmi.h
@@ -126,7 +126,8 @@ enum wmi_event_id {
 };
 
 #define MAX_CMD_NUMBER 62
-#define MAX_RMW_CMD_NUMBER 15
+/* 15 entries make 192 bytes, three full USB packets: never delivered. */
+#define MAX_RMW_CMD_NUMBER 14
 
 struct register_write {
 	__be32 reg;
-- 
2.55.0

