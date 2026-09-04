Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6C24746BE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520151; cv=none; b=EmO2rr6ixCf+99yBpOAnTqHPnDo33toY+tBj8eT6abT6JoqE/q3FDVFb++4zaSxgkcNaxllPmhoQR4mc7O7bGUBFrpFWfgP88Ga375bDPhPt25Xqqg4+AGvluXJTE1sphoJAAQyUH2BpMm8KCw9AoE0BoCj3QHU1XziKV3Ix1N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520151; c=relaxed/simple;
	bh=NqgGWJeZVR7RxI+s0Oxqgtd29vzuC+T0iE7FmCCyjQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGm3Q3ptYxWivtaBNO5667eZT1MoStGy8XCu+DA0o6M2I8pjGC3Ut6HE/TJA8VI7erF6122SOF8kvJ9sar6ciRvjslIjy7R2YMlZm+AeXa5ZtfMVwd35Rzd5AAFrATH7PW1sQo8sqwKzAyY6I4O35g24NuOrTMdHanKC5EJRSyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MT3Pt8h6; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MT3Pt8h6"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7f3f52143cdso732170a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520149; x=1789124949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBPQhnDSu07cLC3ptpbpaZlMTGWNfmchne8qnaFZmRI=;
        b=MT3Pt8h6AvBKQFJIqYN35poA0ms1ZyfM86Rni55Tys6Vs1JV3Qu1caVQJ1zcjTeg3s
         R409NaCxiq/o6aI8AoTAuXhukkJn59yxqBL09L6P6o2V3zGCnSTEB+GKKVCHBiadisbo
         8nbfGdkkNaRXmKjBJICl78Bvmk42th851tv0jD8pIce7Q9Ws7s3zI0zPxs29a5Hg0s3F
         xAXLlV2EQ1aeAeJxGb42SodgyrldN2LFoSOAt7btz0JTLFzCfE4ZjskLqoBIrVSKc97T
         Z0w2W3uzkp++9mlI3uSAKuJJAjhREFMGA+FqTW+vcBQzdiquW5D6XuEWqU2idBkWjgZU
         AkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520149; x=1789124949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EBPQhnDSu07cLC3ptpbpaZlMTGWNfmchne8qnaFZmRI=;
        b=RaN963V71mT8ozZH00xePYO0Jhe+Y7N1fF1SzvFkRCvAQfe/1aHZAowq0w9n71ejvV
         fO3fgzxm/Pdj/eNJstP8dDchv8bIJI77t0zugiSm2LSoVkCap4ODNT0l4P8cSl99soTY
         HAabWLKH5h0zVZadELZJkLwXVvseP1kiyDh8xg7Yccg1GkXaQVMKhufDtDwa9vZrAJPf
         kdBsHZS9wX84bFjl2ndZBbNnmB1bZm08fyiCT3+Q5iaXYc5nxnoyjAPb1cQcB9A2aUXV
         5lffn8zCuxpppBfTJHoD06HoEG56lZd9Fcgq13xzcLTygad927wzOgcOv4nVhkZ2No6g
         1YbQ==
X-Gm-Message-State: AFuF++novLTIx6b0O9LYSc5Yv29NH3twAkUcvNwZWKyZAon2pbCCOUJq
	AzI2hTYtOF3c9/KMzd3riCvgSMhkeq8Nycy5nzCiRAdsIrWuKvvHRow4
X-Gm-Gg: AYBFou2MlAj+ZagfMsZYSakLdf/vevKRsDAzWiXKXcwRl4JrKZNWJtpR1OG4NoTY01R
	6klw5kCOMI0JkcBhc1iiIwzJZKZVZuO/RDd0NDV2SETPV51EGCC/DNaLT0LyT+VvTFtGajj3wK1
	G6xfer8kfckeM8DjKbQAdBDTsAtXMI1jUH9OgSEJbyGBnwJe+e5VuYSG6+91k9X9MyJRQtD/BIt
	XFS9GZ+0HPRcyOcPPa1D2oBZohGzHg+GoW/zEeA0yM6C0j971y/q58HOT7kTggw9N0RW37WAeEw
	KTNjezrem0sKvNLygf84Fm9HEBlMM2ZNjbwyuDKajiUT07Dj7gYHHi6MIAlNPeAD1zGbhXvixEc
	Ev3FaCTgK0hlrXBTkqYu/G1/241HbCP8SO+HaSiQS/biH5Ouhm2yiRX8sIJ4nvmBfM8DOfoDcCJ
	tf+n21tmWxmeXX1uBkEj+uxPz8AjOk89G1qSVC2/tbBemXt8Lop+cP0AKfdjswXRhSY5z1cOUzq
	FPXsMlrfNC0Y98=
X-Received: by 2002:a4a:edc4:0:b0:6b7:8415:d793 with SMTP id 006d021491bc7-6b78415d8efmr1183603eaf.62.1788520148792;
        Fri, 04 Sep 2026 04:09:08 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm5599656eec.18.2026.09.04.04.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:09:08 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Jameson Thies <jthies@google.com>
Cc: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 1/2] platform/chrome: fix typos in comments
Date: Fri,  4 Sep 2026 16:38:57 +0530
Message-ID: <20260904110900.20435-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904110900.20435-1-hemanth.selam@gmail.com>
References: <20260904110900.20435-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/platform/chrome/cros_ec_ishtp.c     | 2 +-
 drivers/platform/chrome/cros_usbpd_notify.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_ishtp.c b/drivers/platform/chrome/cros_ec_ishtp.c
index 3766cef81fe8..b21a27ad3762 100644
--- a/drivers/platform/chrome/cros_ec_ishtp.c
+++ b/drivers/platform/chrome/cros_ec_ishtp.c
@@ -369,7 +369,7 @@ static void ish_event_cb(struct ishtp_cl_device *cl_device)
  * @cros_ish_cl: ISHTP client instance
  * @reset: true if called from reset handler
  *
- * This function complete the initializtion of the client.
+ * This function complete the initialization of the client.
  *
  * Return: 0 for success, negative error code for failure.
  */
diff --git a/drivers/platform/chrome/cros_usbpd_notify.c b/drivers/platform/chrome/cros_usbpd_notify.c
index d842c05f4db0..6f5eea4938cb 100644
--- a/drivers/platform/chrome/cros_usbpd_notify.c
+++ b/drivers/platform/chrome/cros_usbpd_notify.c
@@ -64,7 +64,7 @@ static void cros_usbpd_get_event_and_notify(struct device  *dev,
 
 	/*
 	 * We still send a 0 event out to older devices which don't
-	 * have the updated device heirarchy.
+	 * have the updated device hierarchy.
 	 */
 	if (!ec_dev) {
 		dev_dbg(dev,
@@ -115,7 +115,7 @@ static int cros_usbpd_notify_probe_acpi(struct platform_device *pdev)
 	if (!ec_dev) {
 		/*
 		 * We continue even for older devices which don't have the
-		 * correct device heirarchy, namely, GOOG0003 is a child
+		 * correct device hierarchy, namely, GOOG0003 is a child
 		 * of GOOG0004. If GOOG0003 is a child of GOOG0004 and we
 		 * can't get a pointer to the Chrome EC device, defer the
 		 * probe function.
-- 
2.48.1

