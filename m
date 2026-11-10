Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307851;
	b=n2eMPFM1D3hhtyF2N+ZFK/NkurxsWJbiTqBXSU7uoVmGxRyNbMIgQis3FFWxXxHgQRdB
	 tTyja0d+PJk1OqKfDHdh7n4xD8j1ZDJYBMB0qqsQ4W4YHdxBUe2h3J8u7qA0JEaTdD0mo
	 JXuB1go8dpuf4WPiIPNNGC0C20iBAO3dRv/iWPSim39Izzr7Vov/VsYKxhazVkGTuBGam
	 tC7vb1lBqyugmYft1jediEyw1e91UuMCd7taXs3oYOpGs0OEnX9Hwm7wl5Rk8aaFMXNrN
	 tuTg/uABmxUpCzdeewt8S+Vool+zxKNhsdLW/Y/ElPDfTQ1k192YTG31pKY5ufUxA3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AnDWGbanVCtYqiunIfMsBWStugmAURIRo8wUmU6j1tA=;
	b=wAUi6kb0iR80PVQx18Bjint+n/XQSZKq1PyQm4BaO+I+ozGvXaKyDNXhsiU4h4rifjYm
	 2NtO0uHJ6ts9Y6/mDSShHM7xBvsugOofM/ey31122V3UKsFlmtwupDSmFi3topOzlmJ8r
	 FPNIX1ThGWyGzB3GG49Hm1GIKfbZwNXaErkArGoSLZtbwdojLajEQxIRoWLmofwb1t4Jh
	 BvN/63CtRjajMB4y2v75fUDCO6c9VtBqbQYlT9VPYGgEMNaWBj0WTlFzcoDlvLQ51ksGb
	 KEjmn4DvvoA69UPfNOQKPLdJqyaO9DpD3CUSp9TkbXYXzCvR058MKN8kbujdaxHssJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S7oOBOLJ;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86A3606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E86A3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S7oOBOLJ
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-170135e43c7so2830018c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794307850; x=1794912650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AnDWGbanVCtYqiunIfMsBWStugmAURIRo8wUmU6j1tA=;
        b=S7oOBOLJgkm5j3tpXKpiwJK8P5y+iQiS8q2DMIqq1hbNqUzm3Dk9Nt3P44CdaCrFnC
         NP1lvXmBMlAZLOlnIfUtw/GDGqi+w1LuNye8okF2f3p0ztePm1n0Pwhdry4x7bQ5Qk+k
         L/mhIwUJT75aXGy9Cr82QMvFE7QF9OzoYoCmNt1uqiJ/VtTHPbqHCYey1HDMra8+WsKY
         UTT9n9segkNKlcyfDUmqglN0a3BdUI3nlcSbj2+zZqkBoF+pZ+kXkeGvqIFaqOyoFaQZ
         rMQlfgtW9dZc07qCWSy+dKhp138PASsfNg8ulKkUOytLlUrqKw6VzftrgIOyvWwqE2Bu
         2HiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307850; x=1794912650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AnDWGbanVCtYqiunIfMsBWStugmAURIRo8wUmU6j1tA=;
        b=FNPok7ISbmmEZm+Ot1S6vkNP07yrXfv0W0Koss5GBxmSgXdjd5QSkp9lwGW9pMVJ2m
         Hgg3zqsTQVre1gm2D9k9mneqjtHl+idAPSgAyd+piO42UPja4ruPPESN6SQI/tC1Ps34
         n7KXYPSZXMHTQy0TrVrTKsEFn1xEuX2CZAK71Gwzl+zWIZC8QonF2gBIMB3nrinM77ST
         IkGMaWuo2TFiU5shjsLZoNhQR7Z+5lPCEFixQekRtCgg7h4ju2FFUM/C8p+klVsFovxE
         IDHwacIoeSCHVyP4NGrl5/Fts0kMi68345OsY7Xbf0aQlIPbXuSWK0rr9q8ffEt0bUx8
         gQQQ==
X-Forwarded-Encrypted: i=1; AL+hErGCmUtAn3zMhZmraCC4Z3/ogqEH7Ywn49n9+0J2TiIvyjgX2I8W2CFRfexmRfaHO13mLEEbFAY1EGNHitU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IncBypuHphcL6uYb5ue54D6PK5cCPFg4k69hm9zxzTG4/BdwL
	BDgEsy07Il57Jhb4LoNq1rW6J3BBmLtli6+k+bJwkMG/x8FpiO+vf9g+
X-Gm-Gg: AYBFou0EJRLBp98b3flFt6xUxJniMk1RKFRpT1jVSIwH/DCL2DTiezu6K/2Syge1cUj
	8LDFCmJju6QO6vgjeeWkAd9HrwcPgLuVcS6ubhA9J0WUkaGJDusPV6y42Gv0ZmqFHr13kZsFc3v
	nbRvSKP3FlxivAERLyDa9CweT6hEpiWhplGCdn2mEkJGM25ISQ9rbVURam6yAklLuqQIr553tcg
	6H+KkVe0JXkdS+piuLJY9GNnasTbzVE/st+C2r2dKACyhEZGaSrtOfmIZssPRlwjGLV8kRTydtX
	zkTfFSapePs/7OzCVCLfCFRvg67jgA6fZVcjA+RgFTximADzsk7goak+NU7zAEKDPFXerQC5AKu
	bPYRAnJg/YPYoZfoOoxpxQVaIVIwBBAiXodVUWiudWorfZvGOYCcsKWStm2N1TtJ49H+qb14rcz
	InKVuOota4/R6Vxkw6n3hDNqirTfUWinhKfr9AygoNt5n/LB3WaWn0qf4d1mI1j3rRGyF7UglCx
	bZH2nyPDk4zgaVCt/EJO1/9gx6tBDmDXu3mQ0MFDy/PL/oPHWEVYboNSptMWYYt7o+Cqe8Eu/i1
	nLGNcIxh03OksQgyfYB7Y0opaIPu+oHszi5GfUCf9+d6caAovhCNmYOt+tsncZ1VD/1hMw==
X-Received: by 2002:a05:701a:815a:20b0:190:b2de:1549 with SMTP id a92af1059eb24-1b3b5e6524dmr3147999c88.1.1794307849889;
        Tue, 10 Nov 2026 02:50:49 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2ff3bsm7899356c88.11.2026.11.10.02.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:50:49 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Niklas Cassel <cassel@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v4] ata: libahci: delete the SW activity blink timer on port stop
Date: Tue, 10 Nov 2026 19:50:40 +0900
Message-ID: <20261110105040.2483806-1-hj351016@gmail.com>
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

The software activity LED support arms a per-EM-port timer (emp->timer,
ahci_sw_activity_blink) from ahci_sw_activity() on I/O, and the timer
callback re-arms itself while the LED is blinking. The timer lives in
struct ahci_em_priv inside the port's ahci_port_priv, which is allocated
with devm_kzalloc() and freed when the port is torn down.

ahci_port_stop() never deletes this timer - nothing in libahci does - so
when the SW activity LED is in use and the AHCI port is stopped (driver
unbind / module unload) while the blink timer is still pending,
ahci_sw_activity_blink() runs after ahci_port_priv has been freed and
dereferences the freed ahci_em_priv (use-after-free).

Shut the timers down in ahci_port_stop() before the port private data is
released. Iterate every em_priv slot and skip the ones that
ahci_init_sw_activity() never set up (emp->timer.function is NULL), so a
timer armed on a fan-out link whose port multiplier was detached before
port stop is not missed. Because the callback re-arms itself, use
timer_shutdown_sync() so a concurrent re-arm cannot resurrect it.

Not tested on real hardware (needs an AHCI controller with SGPIO
enclosure management and the software activity LED enabled).

Fixes: 18f7ba4c2f4b ("libata/ahci: enclosure management support")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
Changes in v4:
- Iterate all pp->em_priv[] slots instead of the current links, so a blink
  timer armed on a fan-out link whose PMP was detached before port stop
  (e.g. by sata_pmp_detach() on failed EH recovery) is still shut down
  (Sashiko AI review). This drops the now-redundant ATA_FLAG_SW_ACTIVITY
  gate, since the emp->timer.function check already skips unset-up slots.
- Correct the Fixes tag to the commit that introduced emp->timer
  (Sashiko AI review).

Changes in v3:
- Shorten the code comment (Niklas Cassel).

Changes in v2:
- Gate the shutdown loop and skip em_priv slots whose timer was never set
  up (Sashiko AI review); superseded by the all-slots iteration in v4.

v3: https://lore.kernel.org/linux-ide/20261110090303.2415681-1-hj351016@gmail.com/

 drivers/ata/libahci.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
index 001a6f5..6d73c7f 100644
--- a/drivers/ata/libahci.c
+++ b/drivers/ata/libahci.c
@@ -2605,8 +2605,23 @@ static void ahci_port_stop(struct ata_port *ap)
 {
 	const char *emsg = NULL;
 	struct ahci_host_priv *hpriv = ap->host->private_data;
+	struct ahci_port_priv *pp = ap->private_data;
 	void __iomem *host_mmio = hpriv->mmio;
+	struct ahci_em_priv *emp;
 	int rc;
+	int i;
+
+	/*
+	 * Stop the SW activity blink timers before devres frees pp, skipping
+	 * the slots that ahci_init_sw_activity() never set up.  Iterate all
+	 * em_priv slots rather than the current links, so a timer armed on a
+	 * fan-out link whose PMP was detached before port stop is not missed.
+	 */
+	for (i = 0; i < EM_MAX_SLOTS; i++) {
+		emp = &pp->em_priv[i];
+		if (emp->timer.function)
+			timer_shutdown_sync(&emp->timer);
+	}

 	/* de-initialize port */
 	rc = ahci_deinit_port(ap, &emsg);
--
2.43.0
