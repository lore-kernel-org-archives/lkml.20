Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411739;
	b=Kij2UyhfjKXH7mLpmxgoBVEOIThHH97PYwKK5kC57qOY5NtXSH3rwHeLxMiXpqMIIhn/
	 a3k340RT6y4GjPJV48bctmGgOBQgaRaTLvIj2YtAtIgJtxtpOy5x+CBobw2i8paO/ja9c
	 hrEncrF7RRKRFppYtbY+5VrkqpnoSg3QH7dhTz+73qVrLJS0bSan/uCrr3lNMRZ5kcBsc
	 twS1ZgAg3Tf7AzwkVnqoHkHjh/CvNFKke+XxCzVzzqRvoF/jbM+P4Rqr7+cuAdJTyZUZg
	 VnZ/P3fTalPTs+Rtd94bhIigKLj0w2DHpdTuJw1jdvU7ZYtJwPS31qaNXKqDevRAOyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f2svfin22g08o5fv/WK77SgkqAotNAGeVNpe2VRdJxw=;
	b=FnHIVwW2IiTd9ukze0z62eK/Xg5+0tabhwhkSbZP8khF7U1VN7lSgpjzwjh5vIJzw5gS
	 tuc0HgVXW8iLxlcyOBOjYy+s+zbIbz+T3phD38S8ZiuMyaX4y9+6sunQWJsMvSMuXvCMy
	 AFH9uSOperxsGxkAOrJgZ6j0h0ax5JyqLT85kI7l20mJjNMxNntOKqW19ilNl+CUGqU+C
	 Ycn928lbGYXuYWhnbo8THVcanKUAZe6pYJQZqG0CPru/m7wAZn+Dr6RpgD1EZOR8RHit/
	 EEqljXAeDEOqlVQtC1OZ+OmIkBLA0j7rIK1cTymZuLp1eGe6J3SHF1jvbtm0NXCcsBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d8RfiqQI;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D0B606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09D0B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d8RfiqQI
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so5008901eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794411738; x=1795016538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f2svfin22g08o5fv/WK77SgkqAotNAGeVNpe2VRdJxw=;
        b=d8RfiqQI7NwKR9QbEjP1Py9zneis7a35gzFVsS9RbCKQRkWPhs1xV+kOIGKNRamnyd
         usTz00G4WvQKKHfSfblfEWeQ4SGOP4ULurqpdRwFooFEQsBtz1XVAn3hKPrNehSB8yNv
         Gw0FSvkHNy8emHd54jKk6Uv6f0OJjAFueNsOrpp/3l+KzqXCUM34GjIK7Sv8jdt+9jy6
         fr2zVP1o6GiQ5OGb4jI6SY7ek3+RNSLounadoZmIjQ+CFz8civI79x2PpDSzVxuQqy/P
         7WnWpvkHw8j5t5V0HUGiXof8ajjV/Z3s02QBk/LIPhyhI0iaSlPcYj1dpPG8W8+gDXBc
         S6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411738; x=1795016538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2svfin22g08o5fv/WK77SgkqAotNAGeVNpe2VRdJxw=;
        b=hrmhWDIXAS0oS1vodo00EN5atC/5jXi20inCZop1PjMXLct23kfHuNKY6PrI0SF/IL
         mO/WRgSBt/WXqBKNqqTzdvay9/q6wmjBOWQLY2MNA2Iz6gi7jh2uTJCLlXKgG9l0QuT5
         ojVsjEoGn2zRuXeOdoIYSrYM8DVokJ24Ypvnx+jCo0LjAJ+FRRlZXnYEz6c055v1mw2T
         cvRFp1bhp0kl1CJg5Ns/DRN5jxwL9gUcUYx5Zz88UYwtjgu6JkR4m64CM7BNJJxfAEDx
         VLloYIZhCpyfgp5QtoztLTCxm8r8UxdT/czz+O7vUXwMyT65xXSCASCHCs5qeDzFHCul
         IG3A==
X-Forwarded-Encrypted: i=1; AL+hErF/gjrZEwqfiHgw2vSNS5tbqAtLHex6A627zxLACXmUPnwbQ5fh1G2U35O+PsjqcJXZhoxBqR0a9LxfavU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CcYce0zKrrtuzKA5u4YViPSy9QDClBTFiaq3kavGYtKpI7SiR
	FKTj64+a4hB0HDR84uu/38rSGXAapDiyGABUpnqXZ4LFPqYP0N8Vhtvy
X-Gm-Gg: AYBFou2hGlPhF97/iUGnvdoa9L3VRbWJGgOh50Bahe1vSNxMQNoK3LCz8IzUeTAKm/s
	jmCr8gFB1bumno90oL1ceqzCkKv09g65iuJEB8lcJ/NohvQuH1+AQvsqSk9On7Wtn9NG9zzOcp1
	HUiNkL2tsLDf9dKCdU0yjhOZalhLmeOyBlbxnsHEai/YzjrmSQb1AH2w9aAA6WbsJxlx/2ChDkC
	WEIsqzStwbndnZ0cWmwcJdbKn3AV/UFrW6k8GrW6ebzZaOifYhAkrXsJQz/vfRmyc/YdP4Idore
	z0Zv/qbjoTvUXLBzSefuywng3u8BfPo1zNCCEliirun7n9sm2HD0WqiaAupPujjcChrl+s0FdYM
	2/quYg3B3BE1iJ5LGILwHRBbkdDo8eWkQHZN9z3wx1jp0mqazxH9IMPWfhWlJqDVIlkfUV0kFGb
	C4G0tYsF2HOUUdDNowea6mu+mtYuYQ+MzVPWNBRfOg38mV8KVUO9r4vUNUX1KAgkpKBLj+q1BDn
	dmeM6JpjZdtkSCCfixjKNZ3jFIXcl1R6v5Va2AU/ibxLi8Gk94wMQhc+htmBfSlo+0WAuYJoQxH
	PAmmJYecMMtQCMIOYqOauLRhOwt8KRLEqec/UnYYN2i33plK
X-Received: by 2002:a05:693c:80c5:b0:369:f182:8e99 with SMTP id 5a478bee46e88-37686d33267mr3130321eec.35.1794411737783;
        Wed, 11 Nov 2026 07:42:17 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm16762001eec.11.2026.11.11.07.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:42:17 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kaixin Wang <kxwang23@m.fudan.edu.cn>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] HSI: ssi_protocol: cancel xmit work in the stop path, not ssip_reset
Date: Thu, 12 Nov 2026 00:42:10 +0900
Message-ID: <20261111154210.3178313-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ssip_reset() runs in atomic context on several paths: the rx_wd and tx_wd
watchdog timers reach it through ssip_error(), and so do the HSI message
->complete callbacks (ssip_rx_data_complete(), ssip_rxcmd_complete(),
ssip_tx_data_complete()). cancel_work_sync() has an unconditional
might_sleep(), so calling it from ssip_reset() is invalid on those paths.
It is also called under spin_lock_bh(&ssi->lock), and the cancelled work
ssip_xmit_work() -> ssip_xmit() takes ssi->lock itself, so waiting for it
while holding the lock can deadlock.

cancel_work_sync(&ssi->work) was added to ssip_reset() to stop
ssip_xmit_work() from running after the device is torn down and freed
(see the Fixes commit). Move it to ssip_pn_stop() instead, which runs in
process context and is still on the teardown path
(ssi_protocol_remove() -> unregister_netdev() -> ndo_stop), so the
use-after-free fix is preserved. The watchdog and error reset paths do
not free the device, and ssip_xmit_work() bails out once main_state is no
longer ACTIVE, so they do not need a synchronous cancel.

Fixes: e3f88665a780 ("HSI: ssi_protocol: Fix use after free vulnerability in ssi_protocol Driver Due to Race Condition")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
Changes in v2:
 - v1 only moved cancel_work_sync() out of the ssi->lock section. Andy
   Shevchenko pointed out the ordering vs. the timers; looking closer,
   ssip_reset() is also reached from softirq (the rx_wd/tx_wd watchdog
   timers and the ->complete callbacks), where cancel_work_sync() cannot
   be called at all. So remove it from ssip_reset() entirely and cancel
   the work in the process-context stop path instead.
 - The three timers never queue ssi->work (keep_alive only re-arms
   itself; rx_wd/tx_wd call ssip_error()); the work is queued only by the
   xmit path, so dropping the sync cancel from the reset paths is safe.

 drivers/hsi/clients/ssi_protocol.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hsi/clients/ssi_protocol.c b/drivers/hsi/clients/ssi_protocol.c
index 7c6ca83..aa2d6ed 100644
--- a/drivers/hsi/clients/ssi_protocol.c
+++ b/drivers/hsi/clients/ssi_protocol.c
@@ -401,7 +401,6 @@ static void ssip_reset(struct hsi_client *cl)
 	timer_delete(&ssi->rx_wd);
 	timer_delete(&ssi->tx_wd);
 	timer_delete(&ssi->keep_alive);
-	cancel_work_sync(&ssi->work);
 	ssi->main_state = 0;
 	ssi->send_state = 0;
 	ssi->recv_state = 0;
@@ -950,8 +949,10 @@ static int ssip_pn_open(struct net_device *dev)
 static int ssip_pn_stop(struct net_device *dev)
 {
 	struct hsi_client *cl = to_hsi_client(dev->dev.parent);
+	struct ssi_protocol *ssi = hsi_client_drvdata(cl);

 	ssip_reset(cl);
+	cancel_work_sync(&ssi->work);
 	hsi_unregister_port_event(cl);
 	hsi_release_port(cl);

