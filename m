Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48E63D7A0C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369195; cv=none; b=UQ+2ZMUsxZ6NyjsuTpnZF3s2X+iN+K9XniuHES/gNdw9RMK4pJgT3DciDIFkq5qe3LsBDWrT2ZWEjczLpijYusY5immiZ+jeNAIEQOQDLSXlR9b4o35mOSq6yX4s03khFWIEy327F7Zf6R9Knyn4sNdjK5CwmwwKNGEF61AV9yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369195; c=relaxed/simple;
	bh=EI0yaxaUN8OKEbiy7o89NqeQY43DO8r+Zr8ya6jFJTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bJpB80qLC0gKohlgWPT5ODKnLBTFgHUb+lScDI5ArI5sPWGN8WwvoypF5QHssQpP8fFbWO0nnej0TEScQ25Fgv2K2cy9r0hpqwKuRNNIK7XqFaouaLY22KRptNFqxqqSN75Qlw21i2IdL1CojCZe9AgDqFiITRjo2zFVC3Gk/mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azSCcJaB; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azSCcJaB"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-486e70f2457so1740329f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791369163; x=1791973963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ZH3e8JlOg2YzEIhOq4sZb5mwpidxRCG0IJ4sQhxF3Y=;
        b=azSCcJaBNaZ7MNVRBZOu7QM7uVWjD9hfpnbpmB8ZR7ioUJhwLA+oXvnX0RcchwiUFJ
         7kpCy+zZQVjOR7z/IRwiYm+CHSsIZj3BYEuLfNEuT5dwgyaN6q8tXNiHwyKQwmEHihDO
         wAF495N7V9mr2sR92VEv92csNkdVEM+eIJvX7xs5vx1KCYlEhbZtiG5un0fNJ31qpj2S
         4RE+UbGlevYk2iQ0LqGuu/gTh2PnxZuKnezQNSk23WSnYuyLVGLYX4m8kaQdJteH9yLn
         bDMtjXMi5iTV8VCyKBqRmguvRo+kfmNkqq4Oc4EGrKqeGIdawpXovVe6ml2LHZ7UEbgN
         tV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791369163; x=1791973963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ZH3e8JlOg2YzEIhOq4sZb5mwpidxRCG0IJ4sQhxF3Y=;
        b=c4QEfcBgnooz01aiQw4RZhQ0DiPq4cK4A4GnfGAI8rjqmQ1r1zS2XS26lwqLfUGySB
         vANWK4RfF6rrJE5GPyW3yUZE//cfq0FbA3UFNDHXHYvwLGYSgiowJ5FWERJopcTmY/ds
         kU/PJNHziwH6HbW+U10kC3QNQrPvaLKMrBWczh6cugxCoZeEf0tqkqLHOWor/iQkR9du
         0tL9lWcRnhJEd0aYb7k0KHWPHswyHe1SI8g7jscfHRzPMrWKMZwxLNZw669gt5RiLCHC
         8oESGx33SbktNiN7vksyucoWc/5d4e280HG7esJp2MzEZbljAshmkmQEjHIV3KcyOnjx
         b72A==
X-Forwarded-Encrypted: i=1; AKwUvBz40bQd3xKzNoGd8IUKnXPsw99kCv1NOOUq3Ke6vEm05nhlX+lm23+dY8TfFWZtfbxtnF3NB2K+VYrmUv4=@vger.kernel.org
X-Gm-Message-State: AFuF++mxAcbgPpELD09MEAK4zSPrDJPiAE1NZwJBPARGAgyHL8tla3gz
	F0tsdMMSd6S73yfuDl25rU++0Wld0hLqKaDwnRbzf6B91KgK8WCZtUms
X-Gm-Gg: AYBFou2O9QY7aaupRton16Ev/mwLgLKVD0aQn8q4I3MDSNWWU5cz/pgGGcBhi7z3atO
	p1+58lhHsPWaqc8PpA30bao5tXYmpOvSn6SlRWDnauCWAewS+i2fV1N26vIjeHOvG5js+pRZ4DD
	omw5sqdR6r9RmkzgustedzKaTkQ/wbjFAb5klae1IP2L9b+tOIYW5EkQSPXA5SiNU3EwW4Vi+N3
	ffp1pINJyQP2oUprBGscajPCEZfx80uJTflTUzCAnAxXRqYkUswJOK+jdPDIpKCbilQP5/WZBrp
	HE/AO2Z3LRd2QhqPpZzXMZbAuNv+87dxFjwPQoG1HNHtr6jP7kXSjQ+tqCABkfedu0/Jkj7/bbg
	GDof+ec9Y1+UcmeN4Tc7r89Yb5O/gvM22fq5CH0JZXYet/6xpgM4RShNithzBMIusRefnUoo3p1
	0AOnCU7Hl7lVVLX9ulWBLUkwWhzmhm+d6LjoyHAiYuis6tRbIrabs61pJgcwK114/qR+hIRDCWF
	OwZoFXY
X-Received: by 2002:a05:600c:c0cc:b0:4a1:6517:ccf1 with SMTP id 5b1f17b1804b1-4a1815a24a9mr15342205e9.9.1791369162669;
        Wed, 07 Oct 2026 03:32:42 -0700 (PDT)
Received: from fedora.domain.name ([217.218.152.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm234277655e9.11.2026.10.07.03.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:32:42 -0700 (PDT)
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: use u8 instead of unsigned char in NDIS typedefs
Date: Wed,  7 Oct 2026 14:02:36 +0330
Message-ID: <20261007103236.37607-1-ampr.mhd@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the plain C type 'unsigned char' with the kernel's fixed-width
type 'u8' in the NDIS_802_11_RATES and NDIS_802_11_RATES_EX typedefs.

The kernel coding style prefers fixed-width types over plain C types.
This addresses one of the outstanding TODO items in the rtl8723bs
driver: "convert any remaining unusual variable types".

No functional change.

Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
---
 drivers/staging/rtl8723bs/include/wlan_bssdef.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index f4c1456f1..df541e956 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -15,8 +15,8 @@
 #define NDIS_802_11_LENGTH_RATES        8
 #define NDIS_802_11_LENGTH_RATES_EX     16
 
-typedef unsigned char   NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
-typedef unsigned char   NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
+typedef u8 NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
+typedef u8 NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
 
 struct ndis_802_11_ssid {
 	u32 ssid_length;
-- 
2.55.0

