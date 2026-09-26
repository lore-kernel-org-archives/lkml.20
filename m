Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D94346ACE
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 23:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790463942; cv=none; b=VFZPkuJq1jNqgAAKuHmHakh5KOz90ieDinoG5I5Gf2jGa/SYgfYSnTdYACK/v/H6H+DBfie96w1T/c8mHnwTwhyJexz9MTETDgbFvEdK85Xp7BqEyrVDBut8Jx1SZozUPpAa7Xr+2DHR9NwZDUU2WgRGsnI7ZVZEftxmTCkPM8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790463942; c=relaxed/simple;
	bh=lUZwpcjfJVbjPXfPcIHxuhk3nhpQ2sZnS/KtAXx4GVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B6ZmVHAOVNY8fFCAlhj1F7jPUHGwlyRsuqoyaxXGm52HrXw04cKFJGZEt6UrPMqI3B3U5YdvGSxe9m/dKR1YWAvm+K9y4aqENhWXjkc1wD6bF2OfxUTOzvxUNy4WCpdu/GhJFGZPLq0zwf3/CIOM4QR1TatCt9zRej7mikPxCMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pxAM65l6; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pxAM65l6"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so652966a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790463940; x=1791068740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5b+3IogLhmEcJn2krORIy7k4m3K29JGGK/T/+oSR1EY=;
        b=pxAM65l60lZ2HlYEikg54edpgUfZrqhxZYv/ooKkv4BstNJinUOdZVWF5lyS1QiBdc
         FTj7wDn+KdIqp2i0TLcZasj87lmTRIWsRNXLNo80hbzfMtsgfwwRxeZY3syC+8KHeNKB
         QzS3zYiwpnNvuLKzVDDSHaeSxNASvpDORrG2Uw/+4HiHowa9+MDeefoPVZzz7P067uus
         itLPBJcxwzUIliZxLqhW4GzyyWeaOtHzMA0dtUS4g5cKmv8DSK3656XIrCj3cPY8zMLp
         wrb0ZnE4fU6QHN28So5++s6JaFGqeYMs6WJQvbMhAPliDLL2JgWllbTqwqFVJkggX+2O
         MfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790463940; x=1791068740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5b+3IogLhmEcJn2krORIy7k4m3K29JGGK/T/+oSR1EY=;
        b=Oh14kHHq6II08SWHBNe9uLzIG3gUrCfAxIC3J4M3LhhcKqbX1VYWNUHOL2gFyww9hy
         e4wd63t7WAtlTzOWw24YPDTyyJ1B1yeh66A/Oma/cypsHqT8GyB8hQUjTnCoTne/IQLi
         QnbbzxjJ76aDxmZZztb/M9q05kJmvtJ9xU/0ZGaXeypDhN7Kjef9rnJI60JM6/Y6bSMn
         2lKYi4m5TySpemgKKIoiVNM6M2u5DUFxxhz1MqNjGxO6/RJ5o4COt4oZ+fmu/nB45IeM
         jCrFDA/aaRzP6R0377UIuTEkmdxBcyoot/wo/fsKOBstr3fJgh4Os6di4locz9Pg1hso
         gwYg==
X-Forwarded-Encrypted: i=1; AKwUvBx5+h9f8DrJBJc0qz5D4wFhIVUTXI3toGsDAs9ARmxdeEgiD0nSwqirjnDFDy0kWbaHIPkMOTzDImuscN8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRplRWKby/3goSDZtvXBDhDznglEC4Hv81KuvDHLt2FPpSd0Tj
	bnf+WqlheiJO9FWWOCO2BpO/UtVX8bFbL1vEOn/Wtk+0P+mpcwMbSItt
X-Gm-Gg: AYBFou3cuMmysqcLW71igXiM1WTG9x4n6C/gmckXIHt1miXYyKEvozgphr0dk3WIqxw
	6LEJ0rypOj+YzH5XD31qNIvoZ/TxLJJgBye843K3kHx+SI/7MLBKEFtZLD1TgQ5z1/Ec5azZEoF
	cAk5RXAilftb1p4BnOxSIxdSWmAnYzsNBHkXYVuJFPjCUIgrWT4tbFv0sjk/Yi+LxxRk8phKyap
	75IjJXPPVzFWEOb0dgLZZXVxcFAj7AVIM0gpcK0V6gmeUpQWO9rArLJv1VQgaQcnCTx88+BeY5v
	5eCAkM0h9II67u0/osQEPjXIW7CFg2qW/NLZCOPEpHqbnT9qWMnPeUYAi1Fk76ajnvslmQxhhUz
	bM+X6FpzWpCy+DoOk9mWNMYy6nu8Io1nONf1uc1J78jCUE3ZJE818caCeRfjHyZB7L2mNBMqncW
	SEAj19rL2q8SMCEwAIknK/6ZIF5xxqVpTLPtQOPQXTF8RyO7r9Mk090c/+n0CwJPwWjkFI5+HIg
	T6HSyBWfNleTj6Mix2ItyT+NFouZ9sQwCA0ODhHFiH1CXgjzdVuK+eeyEQk6MMdaxygl80SlXz/
	e83E3XKQYbC6OIMD6G46K4njhSb1CW1Fpu5ffynxamRVq0Uh
X-Received: by 2002:a17:90b:5247:b0:39e:6c68:fd8f with SMTP id 98e67ed59e1d1-3a098b628d9mr5530592a91.36.1790463940362;
        Sat, 26 Sep 2026 16:05:40 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9355e49sm11778543a91.4.2026.09.26.16.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 16:05:39 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] USB: bcma: defer probe until USB3 is ready
Date: Sat, 26 Sep 2026 16:05:38 -0700
Message-ID: <20260926230538.223565-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Northstar SuperSpeed data goes to xHCI while D+/D- go to EHCI. If EHCI
probes first with VBUS already on, a SuperSpeed device falls back to
high-speed and stays there.

Defer the NS USB2 core until the USB3 core has probed, and enable VBUS
only after that host init (of_platform_populate binds xHCI when
xhci-plat is already registered). USB2-only chips have no NS USB3 core
and are unchanged.

Remove the TODO since checks are being added.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/host/bcma-hcd.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/bcma-hcd.c b/drivers/usb/host/bcma-hcd.c
index 519386255886..9a5704358996 100644
--- a/drivers/usb/host/bcma-hcd.c
+++ b/drivers/usb/host/bcma-hcd.c
@@ -396,8 +396,13 @@ static int bcma_hcd_probe(struct bcma_device *core)
 {
 	int err;
 	struct bcma_hcd_device *usb_dev;
+	struct bcma_device *usb3;
 
-	/* TODO: Probably need checks here; is the core connected? */
+	if (core->id.id == BCMA_CORE_NS_USB20) {
+		usb3 = bcma_find_core(core->bus, BCMA_CORE_NS_USB30);
+		if (usb3 && !bcma_get_drvdata(usb3))
+			return -EPROBE_DEFER;
+	}
 
 	usb_dev = devm_kzalloc(&core->dev, sizeof(struct bcma_hcd_device),
 			       GFP_KERNEL);
-- 
2.55.0

