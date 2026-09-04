Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBB2476688
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522790; cv=none; b=u1NoIlidIYfSe1Tggc2EGG2NnifJLdyeAHBh/7/KkT63N9J5q/+EtVgolkplgJt5FeKX+07NWwZYpheN+93u5v65wNdsHbPoaW5DG7UEEAOa0wdSdOE42zA9Ksg7N7NQb/0gf0KdAFCZ2h3aqnSYiZ3IhgzgtMwRWx7aF33xKio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522790; c=relaxed/simple;
	bh=AvA5xutwueEBv7g4m//lMANLh5n6he6fF22r33hj24U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sRODtxv859XRwt9GuhClvH2VY/cVKuqqXAlmhTidfZtnhgMmzaGZf49TPlCEmB81GyG2LlXtS9Nj/ivyICGyA/eesMX+TuQ4vQ0zzX9X+GcpMSVhumHXklEWDbsTj/VCqhIswIFiwIuYmvrYe8E328F6FcoWz9aZeity8Rb/aLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwfKl0C2; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwfKl0C2"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so962204a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522785; x=1789127585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=su/pv3iYAht5ogkGgF2P0degCEAQbGRgDBNWGy4Uw6U=;
        b=EwfKl0C23Bv9jaD1T1pZQSsEZBmX5iJKyesIlpM87AMwvYrNG3DApe7Vvxt7feShMl
         22KstIhUgo102sqc1DWWYZsNEFmYAnaoNK1HC7EpYNJoA0llgIOmYCCwSjz/4p1QysK/
         izK9ypFP4ctySeS/RiK7v1MLmuQ7CaBCKMW+ckcmUnbpdXEVPW2stuJwgDI3i30WEAGm
         wcGGtOlSxojDDBmOOJGDfe0HFk+3aR4zISY7U0lkaNDfxAN5bbbQfhm/qHjBFGiySmVI
         kWZFB0mFkYYooAl4+SEoQ5G1BNA3Pz2v9ag7koS+hVZFv/jRlBpC6xhCfay3AExC/T8q
         E5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522785; x=1789127585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=su/pv3iYAht5ogkGgF2P0degCEAQbGRgDBNWGy4Uw6U=;
        b=ZPqkOFsG3Gvhl8nMETr3AlUtiQZeky1KnDmc8nugdhGW0+it3xV66FJWJzLEQpDO43
         t23sSiBy3c65eFrFWvpSb0T481JOofyStn77HYb9MZFNA8iE01J3CaCpIoM2aHuTnjrH
         gpSZep8vcW+yVoqqGNFUODK+/e4Dx4vARXHhS/oG8xxsEF1SfyTIhhmZl92b/RH3PgWj
         OULFDmxSqrFd2N0llkFAjJIn9en/15Cx9Jen8KOp1gu//XGibRQocypkBXKlUUSkl3IV
         lixN8+YtAev1HmsvMWbIrlpM+iFQThYk4KoVrZUfh+DBix/QQuB+8PboXw6HSXZzftFa
         a74w==
X-Gm-Message-State: AFuF++mdS1ijzEo90DRMQjBt1CO/XgJIAHgVMDdhIFAzV2zO1EHT31Cd
	/fDF+47uczaG2axvY9jUY9nebbhNSBmKj5pdIsbA6t2yKWpkW6X4DzVU
X-Gm-Gg: AYBFou1+s0VMJTvb7gXN6DKd3RXRysrexhvQ+ZA5a0HfQfBeqcdf24SWAwwBugd2HWq
	DG+CVbL1TRaehiztMSLk+72YxJSFKM11C2LgpjN45njAyr9roIugdBCcw13H2rwpOvLgE+T2DpL
	gFt77Lc+UuYeWX7EpvrpryAgpjOtCWnQq6x9Vegbo9vjlVt4K0NEJltDBFtWAtoFakgNF/2wH1w
	+4QZu8PKSq/fR9KD0rEN1ji9ZD5LAxSbyodMhiHrDhhqIkt5xKrCmdgbi3FIw9Mv18GtWaX3rkq
	7DXXGc3gYcZ5RgDHbmm2efIreC543Ht730pvw9hbBGveniJT8a2w8NPj9cdIObYUi8rCuecKr5P
	ym5Ywu0nNQHvU1/pYZ3ID/pgZ1mkmeN9R7FJ6msFNp49CE4B7czjEydU+Yj5sAyGrhU/HN453Vn
	+bSpFzdlWoTIkFGa9O15lO/je5EkN55fghcvoPA3zA5ykMTwrKr1W1/5LPQh1Y5JVi5vQyeyzVg
	YPHmDnIM3HzWi0=
X-Received: by 2002:a17:90b:538c:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39b26204a3emr9193570a91.13.1788522785070;
        Fri, 04 Sep 2026 04:53:05 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm9221726eec.16.2026.09.04.04.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:53:04 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget: fix typo "harware" in comments
Date: Fri,  4 Sep 2026 17:22:58 +0530
Message-ID: <20260904115259.8346-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "harware" to "hardware", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index df5cca43afbe..f6352e814598 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -2091,7 +2091,7 @@ static void handle_ep(struct pxa_ep *ep)
  * @config: usb configuration
  *
  * Post the request to upper level.
- * Don't use any pxa specific harware configuration capabilities
+ * Don't use any pxa specific hardware configuration capabilities
  */
 static void pxa27x_change_configuration(struct pxa_udc *udc, int config)
 {
@@ -2121,7 +2121,7 @@ static void pxa27x_change_configuration(struct pxa_udc *udc, int config)
  * @alt: alternate setting number
  *
  * Post the request to upper level.
- * Don't use any pxa specific harware configuration capabilities
+ * Don't use any pxa specific hardware configuration capabilities
  */
 static void pxa27x_change_interface(struct pxa_udc *udc, int iface, int alt)
 {
-- 
2.48.1

