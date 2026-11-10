Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284948;
	b=2TNRivK2fmW4YuY/Vuz71l28elS6kvb92LeavUqjJDV7QISl1NysdVpVKMTnlc4X9qMe
	 UTr9yxaOOjGCZjRR+fWbj7rT8KhUI6PWk3htMnaAGcnE3arHdOryPFLg6mTmCfkGnW9fT
	 mKd0ge3HUuKOAG1UQBpicoC++iHw8T+ir7qH460prZNeF/b0beJFURpvt4Z90iKFZC+G0
	 6mNauWue29+l22OxgTGJJ5lNXgoLI04CglMGOITOg6gZYRbALX2IZGtRg9oIhYKjreEtu
	 uxFbQ0aB4ZGlg6fiUN7ZX4WkernzUs7M86peXP3s4T/cQk4OBWGzRJO8d3DGXHy8c8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PqMa10GWujoLZY5ARFf5ggCfIRSXU59hjyLHYjCoHzs=;
	b=Qc8gAO5xoB+qtFLOHAX3eg8RZb7AcBaAjNziV+WWzzi5aN4iMTPRxKGWxOyIMnP33zqX
	 6MCWHYXMEcza98Q8sSIk8ZuzeeMetSGX1dFtTjlxea2GPbdlFB/ew7N2PWiycl9ACOvbQ
	 ga6gFqD7ArUFmSWxtMpSUw3KqzO/Pp9bH5YDNN4TDWeJa7kAr9YevgmkxpT6fgxUsgED8
	 NM18acu2i2zfjAJKhgwq5PktMZwZ3Z5BSMvzd5kLrP1MUFB5ty2d4qXpPLkKT7OJIe0Xy
	 faQGN/W0lEXVvSAWGRkzdUpXiRWYt2H92uFhfa0idj8WMPWSuDoo1B9y292iauyZkBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QrvFQpiq;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDACC606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDACC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QrvFQpiq
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5495d549924so16770691cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284946; x=1794889746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PqMa10GWujoLZY5ARFf5ggCfIRSXU59hjyLHYjCoHzs=;
        b=QrvFQpiqQvmj+9/Nm3VJyN6X5xyfcId/jmKNHZdY0e0FU3aMxBm4BL/M9o01QeWsCQ
         koc7cCHYMlf73nRQkFxDKO32QoPULOSIjtBB4M78esWbcpLnr3LYactRLbs/vBHsjqk1
         zxHFmadM7TwhntDZbAVIpKoCUG3cCwgZ5ckFAoBx44dr5+YBPk50jfpAOuJ6q7iy40Kx
         E94s2zR/xHuxQhZDhhi4hZfZBrjmM1RMo/TYc+tabXSmCT1mzxyz4cqxWaTAek2KjrbF
         TIZkJeTXuWBhUAWv0DcIT2AKqT3JTYbAWmoFrUl2K8ERZ2Iy8mr31MUhxCQFMpB9ZRwR
         xeng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284946; x=1794889746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqMa10GWujoLZY5ARFf5ggCfIRSXU59hjyLHYjCoHzs=;
        b=LZobgXdih4W3QC0AKGpu1F3V5I9fTJZL0A2AliUxyCpH91iJp/EuIchHQSPqmPBgtH
         42lWU4wTRLxtsDeKBVM953NLHRliLCalD5vX/9Q2Cg0DZtMFc/S/OAF/SrMVg6bJMfuM
         lUCMxpLwtabg+wK9x+yPXZO1ESrFyOV55kPZcsCD9purLLnOv4DEna434vMVImrYQ2Ae
         +4JUFJ8bOgUEU1LV7FbdMK2swAoIKGwPbpn6ddt66eW9aBy8rIKmwBcNW8oAz0mVZvZu
         hQ/anwPnQ8g+kty9R5eRe3AjgID/ECFIRa8FztHHzgRxRmbN7ju4NBgTnKcd7OjZIZY5
         xdmw==
X-Forwarded-Encrypted: i=1; AL+hErHY2csT6CX9mbNS+0d8BGSum0a9vzJSTL6FVNm5l6CuIy/AOdN3U+PkI7vpN3BiVHj8dUWb8dm48UWQrSs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Mn6ykT9w9kBIkmU9xoGYl0xzN8a+0TmqMOpu7Syja38KINP4m
	cwOX4CoAiMCR0TvWiBPAaqEy/UXplhkq8P5hDOM0HRqcL+IC+3ai6mM=
X-Gm-Gg: AYBFou3u8/+R60xJ1ClTi0Cldnwh2lGrQ8t28ip7kZUoAr50G+i7KSxwE/4TAPM+k8a
	EihgDSUrXH/jkabophiuUkbja8NHa/mcLoe6ebMPpsrTGnVok3rBakgxO1Qb/OsBRW/dGtNw90Y
	9aQAsIKNWv6eVIKHDw9QNItZ4EPLJ2t5RPWTI2mRz93gz463cv8YPr7igxiMMZ+0bYjkY2eplyP
	5R9z6SdnKxrYy2tVZMaIFWjwPzfcjwgXOU1N1Pf+p3NbFwV188XdJ7UXg1Re0K3H5hop/QFVlZw
	eqmK/117E5dgPO6i/L3h7OKlNBrIJU+ghN5dO8fkatetiSDyA8Lcjvh2S0iDvxIZd36kuOV8I32
	OR1//VuSlw0w96KX+u5yKW9S0yaFsZacZ4hs7soXUhiHxmP/3fSrh4mNbCVUnxoe3lG2HIBp8GF
	vumRSirloh4dBj++YOKK4RcHsuGtzVx0xdFBfFBVNunEwKSrSc305AmO2883K61xz8rghtisWak
	GojdQsnVToER/p4W8xUixyx6WB39hLMH4dobjJn3tlUSDr8XhG88zp49o7jKGC5uONP521mzsfk
	BWDIx0vfyu099G6Fk57P91wn1HGqxWdgo93y/xHLQROTezlyoyT5Rx1jG/iWzsuFjJbAK4rooV0
	bEDb790bD236pELp0aoukXLwSDiL3akomJzGf5jsg5sm2lydMyUqZw5kzNpL98FFl
X-Received: by 2002:a05:622a:1787:b0:537:dea7:adb1 with SMTP id d75a77b69052e-55524e01138mr24744181cf.4.1794284945612;
        Mon, 09 Nov 2026 20:29:05 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b93ee00sm14190091cf.16.2026.11.09.20.29.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:29:04 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH net] net: 8139too: cancel the thread work after unregister_netdev()
Date: Mon,  9 Nov 2026 23:29:03 -0500
Message-ID: <20261110042903.55991-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

rtl8139_remove_one() cancels tp->thread before unregister_netdev().
rtl8139_open() or the TX watchdog can queue it again before the device
is closed, leaving work pending when __rtl8139_cleanup_dev() frees
the netdev and its embedded work.

Move the cancel after unregister_netdev(), which closes the device
and stops the watchdog. The work then sees the device is down and
does not re-arm itself. Synchronous cancellation in rtl8139_close()
could deadlock because it runs under RTNL, which the work also acquires.
Disabling the work before unregister_netdev() would not suffice because
rtl8139_tx_timeout() reinitializes it.

Found by a static analysis tool under development.

Fixes: 83cbb4d25771 ("8139too: RTNL and flush_scheduled_work deadlock")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---

 drivers/net/ethernet/realtek/8139too.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/realtek/8139too.c b/drivers/net/ethernet/realtek/8139too.c
index 8241bcf76664..efcf46fd9842 100644
--- a/drivers/net/ethernet/realtek/8139too.c
+++ b/drivers/net/ethernet/realtek/8139too.c
@@ -1103,10 +1103,10 @@ static void rtl8139_remove_one(struct pci_dev *pdev)
 
 	assert (dev != NULL);
 
-	cancel_delayed_work_sync(&tp->thread);
-
 	unregister_netdev (dev);
 
+	cancel_delayed_work_sync(&tp->thread);
+
 	__rtl8139_cleanup_dev (dev);
 	pci_disable_device (pdev);
 }

base-commit: 0edbc945eb9edd0086f25b151a79cfe4adc0dfa8
-- 
2.43.0

