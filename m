Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216268;
	b=z+DI3vKYWlKI3T4qDzEErLLz8k6Cxd4bzNnZGKg2CMUhvbtcn23+eNSasqt+VTXzSIt0
	 ZHwZjoXUGNMj7boE+aJvzYm+oCRp/8Sea3hnyC1sAwk6SZwcHEDgwb2JdJS3DJKNnhSf3
	 JInikGoN++Q6REV2NhghRjhrfErFLMD2bfXGoE3FDEecnVoNzP/xS44bRAceTWwmGoe1W
	 OEIZdqB6uZccdTbuiHhHZ/HHt7Rp4XPaQWmu2UclG4QSmnckjnzo02+cAlfBiDeDGCWU+
	 7pzwnCgJ+TEUyU4Lcz9ZmLFIXKJgvpvl1C2Wf0vgExM33KAprpDAXUCy3HhPtrY4Z7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pFI37l3u8zC3Prxu9gp+hh5bUJYQTYSaiZYyT2P9tY4=;
	b=UFeJWyN8n9GjxCF/dUiN5iH3kru4U9bqaqCJdnfCG1ITysu42QbUsO8aFVG7wAoKtbSV
	 YCfyY1xInLvdF+J1lLBEHktA9I3Sw4TCWWk+O9bqpzAeqc114niXBAeR2Do5QP5b/vZd/
	 D64ecqpZrdzYPPkwpyMpNmIrWv4XSHw9cS6avfOoLl2Sgwyt75oURtqWZ0zGUBmWmFjFC
	 a7bxy5ABkq5ao1nVv1u7IY9kaqX6mt220yo3fiH0oYLeSLvWdA/9H0i6beevIHJ4oZHnZ
	 QkDkWEXJyMXWgKCEJLC+yQVNHjtkOBeG4Wp/1STx3rCzhpHsZago7h8P30Bp7qJf6ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POwcUWJh;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A39606D81D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5A39606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POwcUWJh
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37071c0f42aso1278177eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794216266; x=1794821066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pFI37l3u8zC3Prxu9gp+hh5bUJYQTYSaiZYyT2P9tY4=;
        b=POwcUWJhRVGKOBm2//Q1aL9FvlAg6++8vRHkx0fa2yyCmHy6ZxAwrj0WBAbCm4ATvs
         Vvhnl8SFPff03A1WgWrhUVReAP4tNVxYDP4MXUnxJp/m7HUHgA8QTPiBN9Fjt71a70Ft
         GAeemBEg9qCGyv8Zkfp66bw4czK5SBDcuTKQfnjOfzY42PRIqZmlBIzMBDzEJ7Ohdmty
         vTbPHSDo89ppM/4YI2qPV7csX4Sw+JIv7A8/DZId3wtAKHfIR6Dg5OUNh+julFhPkB62
         M6IHbgB8VBlTjt+x/b/BGWEyStdYR2bIfGuIFvOqIrnSXGKusgqxt0rF/ob3zV+dLCCB
         s59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216266; x=1794821066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pFI37l3u8zC3Prxu9gp+hh5bUJYQTYSaiZYyT2P9tY4=;
        b=Q336s48VJk6y3Np1mjeEsylSS8Ci5oef6PveZOVa6Sw7TeAkc2dM/JNbk2VG26JF3N
         X+7sQAymMjBzHGShIyedzC6JmqRQunujlVWhNxPOJBgSnDGN1z4F2tOyQspLaY5n1yH/
         2wZUX0Q/lQBaJEkCmjyE45fvHUXN8jv8cYi9JvcDSjtAB+PPCwN7vxQAUv/L4v/yQati
         R75gJWhjwUb+AeU48UTYv1dKaYaQlJfdaxUf0f95x7XZkbEmZGF5B72HQR79Qc2dqKJ6
         eYNhxn8VGxZtqekmaL2/We1fLEhIsGrI6tADoexptdLBT5TJpVmVM6l+EMoHcoIpMYwl
         iKHQ==
X-Gm-Message-State: APuU4Z9ZiulbjBRvCKqdRJjAGaYUGX9BRK5bL97SRiKzRSooF9roxcOS
	Nlu5eOOZKfIBmad6pN2VBoqPJz5o1LAKPuZ2AR40vaZSJIa5URCTfSsf
X-Gm-Gg: AYBFou1SnSCf8Dv6zQnxohFp8bq3+d6wCuObh+VsgyGfG21sHQhcbPM1AAWCJDMnhtz
	Bt5kanyF6vd5M0408/2dh4ovXLlDHGx6GuVeWQSnPEICww+IMSxreMO866HSL+YlN8OjuRzdlFz
	GPUEnQewQ1AtAePSuUt4wXA9M5f2IeQYDFAI2pvLvd4n/getKdnCFUnoFTFk4SJf4qjGj7+Rovi
	uynufHH1mLj9+aEJ8FHOk7GUS/yIfFH6YkxW+gLjSn2v6nbBg+I4euMcnED7cdFBBIB+XHzLQfl
	oR5sMymu97PBlAOoei3Nqfh22+O3+iET7lI/YaCkN9d9S24YWRG7GDx1BQwUOE+UyjsEFJ0S8Yl
	a18N0Rdk0+3PGsWiHQ/2b979FVYUDyOvjv3l5D8/o451ugfOJoAplapW61/03Zus2ctrRiXqPzO
	p68t4hOGCRtlfL17KbaFN09DpP86PvXwZ3f7ejgK0UJ3GtKxryQIwQGChpUS34Y8f7uHu6ZBi9w
	ho9ebxqOoP59qC3nDjlLqFAYbueEue9agn5i6IyQj5LaYK8E9Bgdnc+XlyJJIsstlmZoPQb6+QJ
	Xt4Iv/aZViFJ0BCwgqW00XxgUsQP40YLiFCbtyIwEAjb6coA
X-Received: by 2002:a05:7301:1885:b0:36e:d060:8bad with SMTP id 5a478bee46e88-3725b06f63dmr6559413eec.5.1794216265687;
        Mon, 09 Nov 2026 01:24:25 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265c0701csm11989483eec.13.2026.11.09.01.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:24:25 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Niklas Cassel <cassel@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	linux-ide@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] ata: libahci: delete the SW activity blink timer on port stop
Date: Mon,  9 Nov 2026 18:24:15 +0900
Message-ID: <20261109092415.1436149-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

The software activity LED support arms a per-EM-port timer (emp->timer,
ahci_sw_activity_blink) from ahci_sw_activity() on I/O, and the timer
callback re-arms itself while the LED is blinking. emp->timer lives in
struct ahci_em_priv inside the port's ahci_port_priv, which is allocated
with devm_kzalloc() and freed when the port is torn down.

ahci_port_stop() never deletes this timer, so when the SW activity LED is
in use and the port is stopped (driver unbind / module unload) while the
blink timer is pending, ahci_sw_activity_blink() runs after
ahci_port_priv has been freed and dereferences the freed ahci_em_priv
(use-after-free).

Shut the timer down in ahci_port_stop() before the port private data is
released; timer_shutdown_sync() also stops the self re-arm. The timers are
only set up (ahci_init_sw_activity()) when ATA_FLAG_SW_ACTIVITY is set, so
gate on that flag and skip slots whose timer was never initialised --
timer_shutdown_sync() on an uninitialised timer trips the debug-object and
lockdep checks. Sweep all EM_MAX_SLOTS em_priv slots rather than the
current links, so a detached Port Multiplier's fan-out timer is not missed.

Not tested on real hardware (needs an AHCI controller with SGPIO
enclosure management and the software activity LED enabled).

Fixes: 18f7ba4c2f4b ("libata/ahci: enclosure management support")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
Changes in v2 (thanks to the Sashiko AI review):
 - gate the shutdown loop on ATA_FLAG_SW_ACTIVITY and skip slots whose
   timer was never set up (emp->timer.function == NULL): calling
   timer_shutdown_sync() on an uninitialised timer trips the debug-object
   and lockdep checks
 - sweep all EM_MAX_SLOTS em_priv slots instead of the current links, so a
   detached Port Multiplier's fan-out timer is not missed
 - correct the Fixes: tag to 18f7ba4c2f4b (which introduced emp->timer and
   ahci_sw_activity_blink) instead of the later code-move commit
diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
index 001a6f5e4172..3f6844acb413 100644
--- a/drivers/ata/libahci.c
+++ b/drivers/ata/libahci.c
@@ -2605,9 +2605,32 @@ static void ahci_port_stop(struct ata_port *ap)
 {
 	const char *emsg = NULL;
 	struct ahci_host_priv *hpriv = ap->host->private_data;
+	struct ahci_port_priv *pp = ap->private_data;
 	void __iomem *host_mmio = hpriv->mmio;
 	int rc;
 
+	/*
+	 * The SW activity LED blink timer (emp->timer) is armed from the I/O
+	 * path and re-arms itself, and the ahci_em_priv it lives in is part of
+	 * the devm-allocated ahci_port_priv; shut it down before that is freed
+	 * or it can fire against freed memory.  Only slots whose timer was set
+	 * up by ahci_init_sw_activity() may be touched -- timer_shutdown_sync()
+	 * on a never-initialised timer trips the debug-object/lockdep checks --
+	 * and all EM_MAX_SLOTS slots are swept, not just the current links, so a
+	 * detached Port Multiplier's fan-out timer is not missed.
+	 * timer_shutdown_sync() also stops the self re-arm.
+	 */
+	if (ap->flags & ATA_FLAG_SW_ACTIVITY) {
+		int i;
+
+		for (i = 0; i < EM_MAX_SLOTS; i++) {
+			struct ahci_em_priv *emp = &pp->em_priv[i];
+
+			if (emp->timer.function)
+				timer_shutdown_sync(&emp->timer);
+		}
+	}
+
 	/* de-initialize port */
 	rc = ahci_deinit_port(ap, &emsg);
 	if (rc)
-- 
2.43.0

