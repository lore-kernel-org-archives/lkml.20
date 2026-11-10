Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329285;
	b=SKmmsWx5C9dCCAwrqaBNpPcM11Hool4aSJHUQFpkQmupEYpe2Dzxv6B7sb6BpaEDWVBC
	 T45CCjzu6YR/5rf16VG8mhVg5HL376YzU8t5Loky1L5tLiVmiBR+i9jJw3+7fe64Er9HQ
	 Ha5Ve8HE5cu5MVLHN1RnZdM8iK0YUHhdhg9hO6WwPuSvcGj+4duE2o44maOJnrERduVPH
	 VyzHTQU2TaFwSsqZCfi96VT+5Fi8wkzqsQ+k6BU2wmUtz+1BaETZYX0sZTFn9NkErFsNV
	 zl2zoRb5Iw1WFKvohNwx2sD3ON++MVrz55bw3P1RSbCcTJkR6P4Hwod2qyayuRPHENQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jLheQF6W1LFri0+j1fH9wg0sTTI0eF4EMKTUTC/ER1w=;
	b=0s0xswToEd/R9woWXPnMw0HVogCnrX8ZeefiM/DT+Mo1cd+ObZl3E/o0+rWKNaZgjS21
	 Bic0mbR7RHmT1X5voI8YMr+XCcu4PiKX1ZC5ZJAICdbRmqsJMozqdpe2cAjPLIlK4Juqp
	 NeXd2nQAaX/7HRbSSzL3f3PGU6QGHowb4U3H34SxWDgQYU/g8nntpxgX28N2Xf3T54aQC
	 h9QxkVWweKLlnfbmpLEkXiyRuQ2HhYNHToe3aAs/k8cdv3bGKhw5pZFe3Ph2SeGYn2MOs
	 WNs2HWKWn88jWXPFvZ7/KcLb3YTOX3Z6dDFeMl3imJtS/jXtIxcnraAhBOipeBOSeRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxQcBjPi;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F4160A2602
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56F4160A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxQcBjPi
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so11235295e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329284; x=1794934084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLheQF6W1LFri0+j1fH9wg0sTTI0eF4EMKTUTC/ER1w=;
        b=kxQcBjPiVyFWLDYYdtTl/ZSHU6ycTbAFLXH3TamCjuFvOBO0h9tqVVQbmiS9PAzXY8
         REx1pTHHz/lLdxqu8NxEwLtNtLUDbtc5TKJqh2ssWNePRZWBfVaBdOviW7nOSf3mzzqA
         cDB3NPGWpxI5yZAk74Pcwo15bz4objRcju84dcO+JbSgof8Ffx8HXCBHhDzMAFS63NWT
         Y9Q0+dBHNfLkVbtPFpBciuneolTVVv6RNxyQxusY1rcHntK0Q3HybZ4VhTz296S7dnBA
         6VCAtgSNP606J4k8eHfXWRISxBAiTWs3MWdUXkddesLdXgV8sLq5lhj3l3xr2OJF7Jht
         5t0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329284; x=1794934084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLheQF6W1LFri0+j1fH9wg0sTTI0eF4EMKTUTC/ER1w=;
        b=or0WUOl9df8t6j5uz8JBbBoO+HnOohWCsYqlASZTyLIli0w3mt7nYBO5JgrevUcXvh
         MA+X8S+9jVlYtMqeUMuYBkGCEF6WiMmo/F/m5JJBau+qF45vo8B/b1pyKPJyN4ER9Gv4
         H1jG3Px1ELIMB0Ydu8kb15eXcDzJhZmqnuVYlutk3SYHN4uuSi8KHVbgxoa80LtedS6L
         brvA7xef1ItosuadLpbvEUIrn3c1et8ZuUEWb7y7r22IyGGt0RoOgRGy/ED+mhg960xo
         jVXeLIB6eg3gjRjz2O5SFPQuL0i4ZRjhja7DWcGBjf2oesWoCHNoktKYYJGnH3mEysia
         /i3g==
X-Forwarded-Encrypted: i=1; AL+hErF8zENx6fNPDoz10X0Qx1x5+/YXr/tJ0GyHHYsFaqz/qloJrwiQ2Ke2gYkTl+hIAnSkrek0cfTpElFRNVU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+WaGDk+gwwsGek74tvR6vwHrIbavOM5SxIXvexbp9V2p+Y1JT
	F+SgP6yz3WC5++nitWUqMM8pc3GHdQu4WR8gVG4V+tb0B7XAsNmvfoea+AOI6tGYWNM=
X-Gm-Gg: AYBFou08n8weqtvh0mzZNpWmmm44k9qvm4YSQUbkdn8Ya3zTdXnesMTkV/HoudLQISc
	LOoGd7vVGtYMOBeYCEX4sjKMBcQM1RPhp51t4eeUqEsevL2gde+Jx2V2Hcl4FRSTzS/+tPl7TB/
	C6n9jdRkF7CSxgFLPXDg8rtGZP76n3loh/IBv+xqnZ5egdmTVn0/VL9kCxFP+SADsyvM4Ls3NOJ
	wikPWH+0JS5Gq333ShhfUPLOaCiGi7OI/vAkCRhWKny+kR6jQaeFfp7omZjs6cHRl4947wgFQa0
	TxvWuJBIQsjz5fc2yxVaHWD9fWa/hT4BlHbYir2hpBbkJALODdMGWd8PUG+INpy6NqW39NX/rlq
	TqedvtP8aYWQay2owLzvJxfTOAH2b3DFkAyU7Wdw1AvvC+siKE/n3a8g0F0+X2FFh3SqOGgJ/Pb
	qkYIQtq2sYX2JrWiZdmH3a1go27JeqQiLoBm46Ecbfznfclt4JhPTv6EL6yh3aUpdqc1hhj8c/W
	uSCqomOIinX5RIxlnGjCFL+fw2Elucp3ERAXZz/SfGZVGp6Cp99cehCUIZbKX9gFMagS+Csue6n
	ROKXXl4codW3BwYXDLDex64sQ1KS+ugOjxXp57AFu9bUaqT4aPp20XCZn6+ve5om0zAD7ErkFaB
	gcQWVPue2iEKFC5Q=
X-Received: by 2002:a05:600c:6098:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4ba02358e34mr57908015e9.31.1794329283656;
        Tue, 10 Nov 2026 08:48:03 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0233e5d7sm58289665e9.1.2026.11.10.08.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:48:03 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Tue, 10 Nov 2026 17:47:48 +0100
Subject: [PATCH v3 2/5] firmware: raspberrypi: Fix indentation of return
 statement
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-fix-raspberrypi-firmware-v3-2-e001feb542dd@gmail.com>
References: <20261110-fix-raspberrypi-firmware-v3-0-e001feb542dd@gmail.com>
In-Reply-To: <20261110-fix-raspberrypi-firmware-v3-0-e001feb542dd@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com, Manuel Ebner <manuelebnerli@mailbox.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=779;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=7sDxVWSqwejFDqOAjIoLd+iPbqF2wOTBa0hAn4PF2nw=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq80rAS/QfPs198xpDZcp/E2wIRsfwHmmJsZtOY
 XaXmEXaGyqJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCavNKwAAKCRB4zXhFDAXI
 Z9CBD/9SjerHFaYxJpf7NQEpGPkfEIaY6AD6B1MXiOFzzObg6X1SqDBtlg2Zy2Aul2z75f0NOyr
 m3I/Ti4ybJ5m4ASeCzTGmirRO8DUevEWNAiYugyhSblFVvTNZK3CunUlRZ/bCxR6pNjIm8rHV/w
 iJkD9Y2wjE4BKHchdnTWLX0xBDtgvGo19iOHopDHGQDQgOMBZmf8JXo0EPXsDK2MTdbsS5WAAaG
 41uTymG3ZLK66bRtTNDviLkvZPWgSRYqwOfj+G22WvHjvk/xwSLaah4luwa88R51Exxy7MHXs1r
 Gx4W9+O/Jw1lu6xbo5S0HxjZqqUGYALUlU29Gm4d6SAZdbBhu2NfFoUDg0Umn0NcKOi7QONwlW5
 sadh/v+0zmEWe/hmGM+evgfkVw9NqVYSXOGpFnKJxOvLwQyoqFOBRaKRydQjtBE1FOBrvfbbb/0
 V5tvgxL8oVkFI5AZmI3MWwy0/x53v4lQLGAQpR//6fqVtvSFJM2i5WpQbSzj7zIjInw8cV52x5j
 pT2BT6j2BjMhCJYNGmlaJ5cd361BovOYqgO5ouXnIZW5nzmpFECpuT967M3uzmOkvNj2BoYSClT
 JWW+9T7m+Yo40WoZfipVc3us4CJaHVyowSH4gcPuBP2/1OHaRyyGm6O76GoNqDsHfQsTYwHJsIm
 7gdy64tKPfCX8DA==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

The return was over-indented; statements should start on a tab stop.

Reviewed-by: Manuel Ebner <manuelebnerli@mailbox.org>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 8f3653c4a669..e0c91719b4d0 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -267,7 +267,7 @@ unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int
 		 * assume the maximum clock rate is absolute maximum we can
 		 * store over our type.
 		 */
-		 return UINT_MAX;
+		return UINT_MAX;
 
 	return le32_to_cpu(msg.rate);
 }

-- 
2.56.0

