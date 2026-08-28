Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D8139A057
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908954; cv=none; b=QTU2OmJjdBGkBFB0naDYENDSkMWr5dsNciX0R9umkFb9mT5pngTKwLNK4vwEQ541jJR5tUG2SKoLfT/w426yPAEmZiONqQwewSHpxNk/zX8wv6kYKFv6eOr/GvVq9NIl5A4WEyJs/kx0wSqvz+1RrXW7Miq879BnXMDn3qVJBEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908954; c=relaxed/simple;
	bh=vKv+GXIuyE2hiDyG1h0rqn+IWb8EjWtNu3co1fIZfgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IwEHGejX1DkmJ89H7nWoBfwZ8uLPJ1MUwCBnAYOgpeLE2Q3w49JKD3JmhvnSnUKVxCrNNoJHv4waLQe00wKgsZQ9BfNlCDiuRqWiHo/BjlFxE3wP8C6TJB69JGD0pIVzeuGCaVvMDlktb9t8ej7GHX4zvblAwNlgSdUbWy0k5IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iit.org.ua; spf=pass smtp.mailfrom=iit.org.ua; dkim=pass (2048-bit key) header.d=iit.org.ua header.i=@iit.org.ua header.b=iY+eyMjv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iit.org.ua
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iit.org.ua
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iit.org.ua header.i=@iit.org.ua header.b="iY+eyMjv"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so2778385e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iit.org.ua; s=google; t=1787908949; x=1788513749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0x/pbKOdcSa5MoWBFxRhYpy2xSpaLcp53m9A0z28vvY=;
        b=iY+eyMjvfLzs6mBRq6QzAXPBKMR8uLSK2+efwCdmDBl4YkFb6vN1hMMptZCNGw+EMa
         vqiZ/1EbQfOU9HU+lGku1y5iSosIo/s4EoCVgL9tiX4Ui5agUGESSFWQgDNGNkdQ/YeH
         zOOj0mEkwd6zCPytVw3tTDO9kSIJhquM7AOTaemFcd8b+x1AJ10+NjMmS72hZ1qkrjmq
         gNQMCYG8y8r97hClDNCVAu6RyzPMtgFNuVYL3C4wjyOiBDbR8yGzRwXj6Sha4O//wW8q
         GlW1HDBfgJ6sizSBr/KI85vveBbuymIIIZp4YnoIKdoewaTknHWwm2ShD37Y5yMdGZGj
         R++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908949; x=1788513749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0x/pbKOdcSa5MoWBFxRhYpy2xSpaLcp53m9A0z28vvY=;
        b=kr8lf0SPQDmWjWx8I44QCp2p9sJZXUqzB1Ht1rtTJZV19a+tnRUmbJnvppjgceGyvS
         udfp2yFtF8oczI26/DEQwEu8NQPsrIry3fz00CRQSvVFkAcPyYXDo0ux5hIxCXp+kmUe
         K2a4CTbWMr4aM6B48dHz3wgM/XjYkRXreKzfej221riL0+NfiRGDAuZHjSbytmlh/5qq
         j4IQe4Wb74kGqYJUiCQZJCefi00OaVpaRB4kHTHTcnhOmrnxh578P4/BeWiTGNQF7E5N
         O0DhgJrXknzHP3V9jTJS013vw56eSkupjni6ioH+BiFgQvNhfxk9KsR4lhoGjww5+idq
         /1Dg==
X-Forwarded-Encrypted: i=1; AHgh+Rro97n7YPuBHkob/q2NmOi9tJO1XHsuZrDD/a171hAtf1wfpIekH8LASrDMzuvoGMl2ZncxSobHjkem9HI=@vger.kernel.org
X-Gm-Message-State: AFuF++k1t5hfko8N36WrlEozVVmhdGDfUksW5KmP5PKarqJdejMN03hV
	0avIwmq3vf/ozKssT6xzvnD0E/7B12Dja4Nm5xN5JvS7OtEYkIKs4yBJBlOiubXQPrY=
X-Gm-Gg: AR+sD13gQXCW269ixnvc8CK7RHBRVchd49Qmb2ZNF9c+bwSbzZ3mPNop/7sE9MU16xL
	E3vCddor2F50yDoPxN+SXOf0tfVG516KA5CdsfEaowB63Brc+e2V9RtVQrnwj7XC0PTCzV0c/MY
	IYRAnC/JegtiSviojgoMVhPNo7vX5i7M2oiLXMKmhV8m9EEqb0M2IkQM03CFmaqUqqJfbcgzGzM
	bjVbYo2GZSVI9TZ/HG6UXBZacltYsKa0Eq34C5ZMvGXuXPpz3RuUrK70MR7+iKDVlsjJ2VN9PfW
	CCiBJ8kSKdZ8gTZbDqXfqUqFF8j1esNPrZFzyt3Sc1iTjzBLDdRniuosSaI2dFhmX80E4UcS/pw
	0MbDJqvXBlXFzRErPjdm9ZyyFvx/6V4hVsQwGwOQkAEk8vnbAH4b1wCF7WQMoUsoJf8qxQeZHTn
	GN+UbCZIBBswl6+xfKr4dhy0J3MeWqrDaYbjYTyUGGPs/zyGApWJe2yA==
X-Received: by 2002:a05:600c:5487:b0:495:7888:281c with SMTP id 5b1f17b1804b1-49b91bd1463mr61514445e9.0.1787908949656;
        Fri, 28 Aug 2026 02:22:29 -0700 (PDT)
Received: from archbtw ([212.1.106.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm111484255e9.4.2026.08.28.02.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:22:29 -0700 (PDT)
From: Stepan Svatenko <ssvatenko@iit.org.ua>
To: Raju.Rangoju@amd.com,
	PrashanthKumar.K.R@amd.com
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stepan Svatenko <ssvatenko@iit.org.ua>,
	stable@vger.kernel.org
Subject: [PATCH net 1/2] amd-xgbe: fix comm_ownership mutex deadlock on SFP module removal
Date: Fri, 28 Aug 2026 12:20:22 +0300
Message-ID: <20260828092023.105405-2-ssvatenko@iit.org.ua>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828092023.105405-1-ssvatenko@iit.org.ua>
References: <20260828092023.105405-1-ssvatenko@iit.org.ua>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xgbe_phy_sfp_detect() acquires xgbe_phy_comm_lock (via
xgbe_phy_get_comm_ownership()) and holds it across calls that can end
up freeing the external PHY device:

  xgbe_phy_sfp_detect()
    xgbe_phy_get_comm_ownership()                  <- mutex_lock
    xgbe_phy_sfp_mod_absent() / xgbe_phy_sfp_read_eeprom() (SFP changed)
      xgbe_phy_free_phy_device()
        phy_detach()
          phy_suspend()
            genphy_suspend()
              xgbe_phy_mii_read_c22()               <- mii_bus->read
                xgbe_phy_get_comm_ownership()       <- mutex_lock again

xgbe_phy_comm_lock is a plain, non-recursive mutex. phy_detach() ends
up calling back into this driver's own MDIO bus callbacks
(xgbe_phy_mii_read_c22()/xgbe_phy_mii_write_c22(), reached via
genphy_suspend() during phy_detach()), which independently acquire the
same lock, so the second acquisition deadlocks the task tearing down
the SFP module.

This is reliably reproducible by removing an SFP module while an
external PHY is attached: the removal handler hangs forever inside
xgbe_phy_free_phy_device(), confirmed via /proc/<pid>/stack and the
kernel hung-task detector (blocked 368s+). Reproduced on a SolidRun
Bedrock V3000 (AMD Ryzen Embedded V3C48).

There were two call paths into xgbe_phy_free_phy_device() while the
mutex was held: the module-absent path, and a second one inside
xgbe_phy_sfp_read_eeprom() when the EEPROM contents change (e.g. a
module swap).

Fix this by never calling xgbe_phy_free_phy_device() (directly, or via
xgbe_phy_sfp_mod_absent()) while holding xgbe_phy_comm_lock.
xgbe_phy_sfp_read_eeprom() no longer frees the PHY device itself; it
only records that the SFP changed. xgbe_phy_sfp_detect() releases the
mutex before calling xgbe_phy_sfp_mod_absent() or
xgbe_phy_free_phy_device(), and re-acquires it only around the
remaining raw I2C access in xgbe_phy_sfp_external_phy(). Neither
xgbe_phy_sfp_mod_absent() nor xgbe_phy_sfp_parse_eeprom()/
xgbe_phy_sfp_phy_settings() touch hardware directly, so they don't
need the mutex held.

Fixes: abf0a1c2b26a ("amd-xgbe: Add support for SFP+ modules")
Cc: stable@vger.kernel.org
Signed-off-by: Stepan Svatenko <ssvatenko@iit.org.ua>
Assisted-by: Claude Code:claude-sonnet-5 [Bash] [Read] [Edit]
---
 drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c | 41 ++++++++++++++++-----
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c b/drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c
index 59a074ed312a..a264ec5bb085 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c
@@ -1218,7 +1218,13 @@ static int xgbe_phy_sfp_read_eeprom(struct xgbe_prv_data *pdata)
 		goto put;
 	}
 
-	/* Check for an added or changed SFP */
+	/* Check for an added or changed SFP. Freeing any existing external
+	 * PHY device is deferred to the caller: xgbe_phy_free_phy_device()
+	 * can end up calling back into this driver's MDIO read/write
+	 * routines (via phy_detach() -> phy_suspend()), which take the
+	 * comm ownership mutex themselves, and that mutex is held across
+	 * this call.
+	 */
 	if (memcmp(&phy_data->sfp_eeprom, &sfp_eeprom, sizeof(sfp_eeprom))) {
 		phy_data->sfp_changed = 1;
 
@@ -1226,8 +1232,6 @@ static int xgbe_phy_sfp_read_eeprom(struct xgbe_prv_data *pdata)
 			xgbe_phy_sfp_eeprom_info(pdata, &sfp_eeprom);
 
 		memcpy(&phy_data->sfp_eeprom, &sfp_eeprom, sizeof(sfp_eeprom));
-
-		xgbe_phy_free_phy_device(pdata);
 	} else {
 		phy_data->sfp_changed = 0;
 	}
@@ -1296,26 +1300,45 @@ static void xgbe_phy_sfp_detect(struct xgbe_prv_data *pdata)
 	/* Read the SFP signals and check for module presence */
 	xgbe_phy_sfp_signals(pdata);
 	if (phy_data->sfp_mod_absent) {
+		/* xgbe_phy_sfp_mod_absent() calls xgbe_phy_free_phy_device(),
+		 * which can call back into this driver's MDIO read/write
+		 * routines via phy_detach() -> phy_suspend(). Those routines
+		 * take the comm ownership mutex themselves, so it must be
+		 * released before making this call.
+		 */
+		xgbe_phy_put_comm_ownership(pdata);
 		xgbe_phy_sfp_mod_absent(pdata);
-		goto put;
+		goto settings;
 	}
 
 	ret = xgbe_phy_sfp_read_eeprom(pdata);
+	xgbe_phy_put_comm_ownership(pdata);
 	if (ret) {
 		/* Treat any error as if there isn't an SFP plugged in */
 		xgbe_phy_sfp_reset(phy_data);
 		xgbe_phy_sfp_mod_absent(pdata);
-		goto put;
+		goto settings;
 	}
 
+	/* Same reasoning as above: this must run without the comm
+	 * ownership mutex held.
+	 */
+	if (phy_data->sfp_changed)
+		xgbe_phy_free_phy_device(pdata);
+
 	xgbe_phy_sfp_parse_eeprom(pdata);
 
-	xgbe_phy_sfp_external_phy(pdata);
+	/* Re-acquire ownership for the external PHY access below; it talks
+	 * to the SFP over I2C directly and needs the mutex held again.
+	 */
+	ret = xgbe_phy_get_comm_ownership(pdata);
+	if (!ret) {
+		xgbe_phy_sfp_external_phy(pdata);
+		xgbe_phy_put_comm_ownership(pdata);
+	}
 
-put:
+settings:
 	xgbe_phy_sfp_phy_settings(pdata);
-
-	xgbe_phy_put_comm_ownership(pdata);
 }
 
 static int xgbe_phy_module_eeprom(struct xgbe_prv_data *pdata,
-- 
2.55.0

