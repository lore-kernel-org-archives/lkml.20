Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467039;
	b=1VRoP1O9RZdeYWnvZs1OCWdzew9PjwmVpXoP0KrUw0EFrXUcjFtMTv5C1AN5JqnuZpM/
	 BacPMhwzBB4G9ujG2vs1y5IDo+HwCfhz03pFiL2F+R4y1M04LRZEtCU5EdcgcCInpOVYm
	 Us63PZZnk6uEvTMdDAInllyFDjZOou/3mO2PFRMnolEh6K8giFpzj8JA94lKU04WwOqwE
	 VnfIOGdDBn8fWc9yQ56YPzU6LI4l5sEysJfKcy6qWnfZt30NsfBDYZhXnIMJ+eHUZkTcz
	 D+Io8sYKTQ7BWnq9janW1blY41P4PLsUNldXi/4AvANSpfknyb7j3goFpMOfDFKCnHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=cvZvlspgGpI+sbuDThI8s9gyv6s5j58IUQpjPB+IafU=;
	b=qExtDZidUHvJbVFatkeSR3wW9CAcyhLGSus7WzJqSusxk/DGRmL6xLHxK6pePqIKV00t
	 XU/GAZVQtUx5INbAONhSfyyhy1LfqsUi/yjH02OaSNPnYC07gYgNH0Y3tRmEeDiO3GF4y
	 XhxTIEOMzRCeEny6oX0/Qe4kMQB7N1cGWXqKUEVUzH8sviAq4s2mjONfFRfqySu7gEDv1
	 06jsQwL3vSE8wY8xB1jZN+he3V+B4HeRJsVZhyM7OK1rHf6lVw4QEz/MswbTRp3gEN+1S
	 fpmkCxaoiAlTMjgJJQnkyWsHHfukO/AecYO6jav8Afr/npY3u+Ad5s+Pb42jvL2p9mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qxLjXek;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2458606A891
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2458606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qxLjXek
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f1e5d7450so395056685a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794467037; x=1795071837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cvZvlspgGpI+sbuDThI8s9gyv6s5j58IUQpjPB+IafU=;
        b=0qxLjXekTfmT5hXG9x3NrRSfhEuel/pLbNlWQvJv248mLJCEXDA1/maWn/8W3EEUSV
         jFPR1SHN0mrVZk6wd5aQ7QElQnxdZ88G2kvmKe6vsiyYC7wN39ULciRHEr2MOJ6FY0eL
         dsHZzVqlcS91yb/vBn+e1X+8I4LiKr9KT2awMSi6enbXhucN5qjKdJk+OOnAMquqMHcD
         urTZKauyMLz9v8s7vTxe3cdB8yy/IsijgcRtj8jIK0oPJ9yL3pFDsX+W0H+AokKf/15y
         us8t98GVk3Xx8MORFn2MUUnnB2DNuDKhuZHHUibPkI2kolhyAZ+28YB+BGa2o03e6Ihz
         392Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467037; x=1795071837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvZvlspgGpI+sbuDThI8s9gyv6s5j58IUQpjPB+IafU=;
        b=t7MHKC9B5VCBPLi2oAkGerg+Ep9ScORImcG+BAeGqI91z2HNYPLf9yKSuCN4OLfBq6
         p+HebwF56xjc2/WQv+vpeau8n8sQjNtzkGBwwBgVEym3iAmJclmO6Nj65mOAzu5/ydx/
         DGN9x5CIITz2CMuhft9KCqQ91Lh4gAyB8ndg2igm7uVdiommF0Tsm9tFKZqThFA7PkPC
         CvEVDXa378C1LNhcLz0QfleUlfaggoL0YQ+lvoX+KbSgLRKy6ZUHP/tN5CXkoAmoiwaS
         a7t0a11m3ijiAgkxclIKhYCn88EguQ71lTSIIH9yw1WBBG7A+fENngaUWUd4uNjMD08W
         5jfw==
X-Gm-Message-State: APuU4Z93aovk1pMVTy4sTXE/7WiGjqoLF/en5Y169abtmSTWMuspeUai
	pXjuO10CRzr6/ASItJmk2b220WNzUBkR5xKZiwzaGH07PZXtqr8S+Vbo5J2R
X-Gm-Gg: AYBFou1metIleS9K8ynC+c9NsrAyCOcX/NLw3ZQSGMk9Pdhr7McrLAaEJfYxEBsIDwX
	ne0HQRsXUXopBPgSiKEK8Rj6GhFVE/jPIRZ3U0ILHPJp+Wztu9TQNnw5Awz1aQ3oXc37zEQcGCO
	119gKc+v/swTLc/tfZwO5vU3o5DvndNiSZC4YWWLTdDGeRfOjoTKvd3/7pI+q998WT6EtLgWSEp
	tb+2R3g0gyliq0vtEPSfMWRWhOnXhi1t+ENhfYgom5wmZQYBb4luK2SA/+IhSXnvFmjCLwFXR2q
	DqyGxkZsBZmsUANgi3Rctw/y+TxMxhcP3jZqhlIY6QzPw8kCpQ8P7Jb7sziYpXCBHHxXWLcnKkY
	HsREfd+t4RjSs4l48Z3OPob5r+mYM2o5+yaABl1rdx3WCthYNGh2lf1d+5MoLMZF99m5mtpZRfD
	PA2p8jlTfYQTyrL2wVeQ5cpzzmuTOZ4BIVV/r0uSAUczUW2x1qJymjeVf64vx2r1nSREhKgD+VX
	BdlrhTgznFsyAS0S6eueyOqjxd79TJwbzNPhS2PI5mvZVFb5rA5D2+zWq2heJ0rai8IvxE74pl7
	CdbiJbJn4bx01HbEhWHgwhHki9MWeT0/f3b8QZRKav8ShmoyZMtL2mpKk14JiYI0CyhWPYakKRc
	VrfaocYSQxq9ejz89pdWkkcNSOjNbANK2Vei6rKincR3uIUbmDumAOlo7CFZUSgJFFWN+DaAN95
	YNU9CmiECyAkIXQM++D2gyl2q5WYhy/3DE
X-Received: by 2002:a05:620a:600c:b0:93e:d364:c9fc with SMTP id af79cd13be357-947afb90a8dmr714407485a.5.1794467037587;
        Wed, 11 Nov 2026 23:03:57 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e619affsm660698385a.4.2026.11.11.23.03.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 23:03:56 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] extcon: ptn5150: request the IRQ after the resources its work uses
Date: Thu, 12 Nov 2026 02:03:55 -0500
Message-ID: <20261112070355.38837-1-mhun512@gmail.com>
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

The IRQ is requested before the work cleanup action is registered.
On unbind, devres cancels irq_work and releases its switches before
freeing the IRQ, allowing an interrupt to queue work against released
resources. Earlier probe failures can leave the work uncancelled.

Request the IRQ after registering the cleanup action so devres frees
it before cancelling the work and releasing its resources. Keep
ptn5150_init_dev_type() after the IRQ request: clearing pending status
before installing the falling-edge handler can lose an interrupt.

Found by a static analysis tool under development.

Compile-tested with W=1 for arm64 and x86_64.
Not tested on hardware.

Fixes: 782cd939cbe0 ("extcon: ptn5150: Add queue work sync before driver release")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 drivers/extcon/extcon-ptn5150.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-ptn5150.c
index 0b96b58b4212..6ee4edd7adbd 100644
--- a/drivers/extcon/extcon-ptn5150.c
+++ b/drivers/extcon/extcon-ptn5150.c
@@ -307,16 +307,6 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
 		}
 	}
 
-	ret = devm_request_threaded_irq(dev, info->irq, NULL,
-					ptn5150_irq_handler,
-					IRQF_TRIGGER_FALLING |
-					IRQF_ONESHOT,
-					i2c->name, info);
-	if (ret < 0) {
-		dev_err(dev, "failed to request handler for INTB IRQ\n");
-		return ret;
-	}
-
 	/* Allocate extcon device */
 	info->edev = devm_extcon_dev_allocate(info->dev, ptn5150_extcon_cable);
 	if (IS_ERR(info->edev)) {
@@ -338,11 +328,6 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
 	extcon_set_property_capability(info->edev, EXTCON_USB_HOST,
 					EXTCON_PROP_USB_TYPEC_POLARITY);
 
-	/* Initialize PTN5150 device and print vendor id and version id */
-	ret = ptn5150_init_dev_type(info);
-	if (ret)
-		return -EINVAL;
-
 	connector = device_get_named_child_node(dev, "connector");
 	if (connector) {
 		info->orient_sw = fwnode_typec_switch_get(connector);
@@ -362,6 +347,21 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return ret;
 
+	ret = devm_request_threaded_irq(dev, info->irq, NULL,
+					ptn5150_irq_handler,
+					IRQF_TRIGGER_FALLING |
+					IRQF_ONESHOT,
+					i2c->name, info);
+	if (ret < 0) {
+		dev_err(dev, "failed to request handler for INTB IRQ\n");
+		return ret;
+	}
+
+	/* Initialize PTN5150 device and print vendor id and version id */
+	ret = ptn5150_init_dev_type(info);
+	if (ret)
+		return -EINVAL;
+
 	/*
 	 * Update current extcon state if for example OTG connection was there
 	 * before the probe

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0

