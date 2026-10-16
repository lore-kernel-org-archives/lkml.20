Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F3A3E7BCC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144661; cv=none; b=pUE0Nf5+Vve6Y3EIVBPqu2/lpxA7NvnjuSSOrNEqU99O0szjiqOf3hsmfZVncu0djNn8WM71FGYa4gaqwyjnSkgRrcGqTUJaGGmjIH9J6XUUnS+9lGe0up2UmQIa3c1CpPkJgLie0/IcEWQk9MoausT6k8WFmovMXSG1DBCC9j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144661; c=relaxed/simple;
	bh=UoTM8ItbqEeaBM/lQeEOpEFLul1eJGMCR3RCy34RXQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hqzVZ6VXzoRFgk2vztRPIKIB+KRPT2+u+6Plf3R1RbrCaDMdA2fagP+lMdANAeWgudyPdS2La/Z65us8Us05FsJrR41Pcj+lW0fNpkcEzV7vHK3xBPZM4c1/jEtw+pmqgzVtfdo8NNYJaEyBHxQ5unTfNn9Xuybyz+fgCn2P72A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hJx8nc1e; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hJx8nc1e"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48afbd2c386so3709172f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792144658; x=1792749458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4lS7au6nzsuO2aRNvLqMF0r9p85w4fxyfzI4JwkyMGs=;
        b=hJx8nc1e+erCz8rSQJup1CamQwiqXkj2CRC8qcWRaNKxq5N1aU1ogIUVpqKthB9jv6
         54YK1hrXivK3fDmUSlH0IL+D4ZFdd+rsneBQhm+VFcp6rP/yIUQQ9O2MO5HP30l7lA7d
         krKaZUe8Og6yqkhDpubMwAAU4Ca3NLvYPYVr5JwCpoi66fReE7af4qd6IWtlGRouv0PU
         h0umP9dyZ/WnA1aP3oRquagemH4Si6tRu/WpclJa0dTAKZPDXtlA+tgV9skhYwCkq7LV
         /6umOdCAjBl4/JTOHHdbTjAKlDxELy84w5wldWmb738M46/I10IzOxtDIk+fPGIruQiX
         C5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144658; x=1792749458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lS7au6nzsuO2aRNvLqMF0r9p85w4fxyfzI4JwkyMGs=;
        b=GALzoqp6QcpVd0X489XdlZhkxGZ+ruqbZwxJAp3TPlWiNygp65TSt0OipnKd7gFDW9
         7Si+HbG35+1ytav9b///jifTP6F9uosi18PpIqnLDcDCYSGpSvg4B7okBoFjE7XZbXXc
         HLcA61eUp5CXIizi+SNa0M5ToSUvyuw9nFKy8y7Tqp4M82azss3kffP7KA3aQ0J+7I53
         oe0b5Ew0VXhOITFa/Jday8DapxmnIoSFgVknIAO7sactZLQhTWYheDa6nbmvCVCNh1cy
         6w3FtKVprSfI3uvWOt9Den7GkrfiLb2oBbuiZcjJKi2lmU6yA2ZaGSPpD6uxfNM9WhzB
         sH6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwohp0PWc6Cz+BhTeTFQfdTi+2QN+1uvWExzVq6jFRb2x/Z4CkEa4tpS/zdBIeokl40lAcC+vzpg626ujQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOU6m52YA1WsOTNNNDJNiZ3rbGeLFnlOUodrChIOBvA7n8swow
	U4LjeIE5UJeVN1HWqtTUlTRPFmFaqn92V5+FsJAoBEOno5GgNJ8B+zKzKEy4gaqHuKU=
X-Gm-Gg: AYBFou0VyON4CEEoyVZC7bJIV3xUicao/NctTf4CN5CjqHnSHbgbyEwd1KMJtrewvua
	z3fivCoxhsw0sMyz9bA+/cE5KO51Zz7UGJ8iFx3iB5RpJ5PE/rIudRBaviJyFGIyYzyiLZMnyFW
	80PEArTOLFmc3wInHxCDjqNoxVPddwI+LxW63I9VtLCd75eU9NRP8ZhcKjRAoxatSRgaeZj32f4
	7bOXZuALDXcL+LAQCIvqQdtxIaXG+tU+cOLXfFSdc7HCaCxdcRPQKMdVt8R0mYYIyxFzJqi96lq
	xlhfr14fRk0QlhYLV9G6NqamlvG0GoVK4y61UJR8OaBa5JlSAk3kdcJKp1e47aP1iC1G/qlEnHg
	o58K5IShmP7kQw5CBFFqumqFqmpfBhFAsASyBj3H4j8ifpCs5jqPSRprioVoMoBlEWxkeGwwp1Q
	89wSrKPzxIqfRShCrECqo2h2zck+akmhoeH0DEGRHgVtLyMI6SY0vE8ey4rA3+u+BLWgw=
X-Received: by 2002:a05:6000:2012:b0:48d:ffe7:e883 with SMTP id ffacd0b85a97d-48dffe7f678mr2448773f8f.46.1792144657874;
        Fri, 16 Oct 2026 02:57:37 -0700 (PDT)
Received: from localhost ([2001:4090:a244:81d0:2c16:1c4d:8a04:e0bf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8bb6sm4232702f8f.34.2026.10.16.02.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:57:37 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 16 Oct 2026 11:57:12 +0200
Subject: [PATCH v2 1/2] can: m_can: Fix suspend deinit() error path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-v7-3-topic-mcan-suspend-fix-fix-v2-1-7efa2b172cce@baylibre.com>
References: <20261016-v7-3-topic-mcan-suspend-fix-fix-v2-0-7efa2b172cce@baylibre.com>
In-Reply-To: <20261016-v7-3-topic-mcan-suspend-fix-fix-v2-0-7efa2b172cce@baylibre.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, Sean Nyekjaer <sean@geanix.com>, 
 =?utf-8?q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Cc: Kendall Willis <k-willis@ti.com>, linux-can@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1960; i=msp@baylibre.com;
 h=from:subject:message-id; bh=UoTM8ItbqEeaBM/lQeEOpEFLul1eJGMCR3RCy34RXQM=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyLX/4bXF/CVHWC97a26KyFs5xmO00o03x64mBx4sXbx
 hO4V7+Y1VHKwiDGxSArpsjSmRia9l9+57HkRcs2w8xhZQIZwsDFKQAT+a3FyHB/3zwHq7n7+zb0
 T1rz+4eSnevpL4pcrK1Wnts+SPl7lDoyMtzlUv+nYsLwa+upsr/Xe4omlwrqfivRXm5St5DxYy3
 TJ24A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

When suspending mcan, deinit is called and its return value is returned,
but nothing is restored. Returning an error in the suspend function will
stop suspending and resume the system immediately. So on error the
device should be restored to its previous state. If coalescing is
active, the hrtimer is restarted.

Fixes: ad1ddb3bfb0c ("can: m_can: call deinit/init callback when going into suspend/resume")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 drivers/net/can/m_can/m_can.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/net/can/m_can/m_can.c b/drivers/net/can/m_can/m_can.c
index 16f80607e150..02a95a769a78 100644
--- a/drivers/net/can/m_can/m_can.c
+++ b/drivers/net/can/m_can/m_can.c
@@ -2612,8 +2612,14 @@ int m_can_class_suspend(struct device *dev)
 			hrtimer_cancel(&cdev->hrtimer);
 			m_can_write(cdev, M_CAN_IE, IR_RF0N);
 
-			if (cdev->ops->deinit)
+			if (cdev->ops->deinit) {
 				ret = cdev->ops->deinit(cdev);
+				if (ret) {
+					netdev_err(cdev->net, "failed to deinit device while suspending %pe\n",
+						   ERR_PTR(ret));
+					goto err_pm_wake_source;
+				}
+			}
 		} else {
 			m_can_stop(ndev);
 		}
@@ -2625,6 +2631,23 @@ int m_can_class_suspend(struct device *dev)
 	if (!m_can_class_wakeup_pinctrl_enabled(cdev))
 		pinctrl_pm_select_sleep_state(dev);
 
+	return 0;
+
+err_pm_wake_source:
+	if (netif_running(ndev)) {
+		if (cdev->pm_wake_source) {
+			bool coalescing_active = (cdev->active_interrupts & (IR_RF0N | IR_TEFN))
+						 != (IR_RF0N | IR_TEFN);
+			m_can_write(cdev, M_CAN_IE, cdev->active_interrupts);
+			if (coalescing_active)
+				hrtimer_start(&cdev->hrtimer,
+					      cdev->irq_timer_wait,
+					      HRTIMER_MODE_REL);
+		}
+		netif_device_attach(ndev);
+		netif_start_queue(ndev);
+	}
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(m_can_class_suspend);

-- 
2.55.0

