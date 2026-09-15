Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E79A368941
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436148; cv=none; b=qX4J2WNGYqmo9lxq3Ib6pLeVpPjxGI+nSY4UX/BI6zQa6mEzDfvCA5R0XDh9XugCdi1p6Bgv6hcEB8hhnKjkBOyXrSr/PFd9rXcYtIX4zK8atoOM1uaJbFI6V+GdU6XHqyKDsEz4zrdnoqkNn35uATiCIFHYTBPiBXHbwqjm8kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436148; c=relaxed/simple;
	bh=6Ks+xsuYG7cTmaDMBguFljJXWFMHILbuZCCXEhp3hz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vue8ErpMSy6+9DnOWIjwCuO46r6lU8t+XvajI7SRo8SW+u0HDWVTvSKID5YQoQLioLjcsAR9Y+xY/hIGv+nfsgA9ncKCAf+Bb3TGbpTmkGogt/Dg45DXVmKalkVlMg9Wh2W4o2Jg55w182+7KFSefTaeoQ0ngciq9ilfXJ+aCTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYRZXE2Y; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYRZXE2Y"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ef1d0so29275971cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789436146; x=1790040946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OYSdJ3BpaBA99mybiSOcxyeplaGMmUigodcgqfqpRMM=;
        b=YYRZXE2YfGN6AWFt47nNnux8MA6K+niA4xbntiuOuNcsUQL3TNCtm+XlCv5Vxe+QKs
         /anhC+UE2x2kkpT+mK8BATKxCOoHBgYzYrb5nxQgqv3839HBKAn880usg3nkl2LGrD6N
         MAuTolgIkq2O9dr3u0aR2ntTql6oSYyyIo7eioVXB6kj3+ACfCHAQ2Nku8kvhT4CPhQz
         p8QgZ4zg5BAxdTYsssXSNloSAW4Z3A8etBDfbmaKcxykr7hK+Dg13xBfFyyHDESMMkSE
         hgjSfenwmIiaOmDL3TNA1yshuqfJCtVwAAYrH8aBzYChaHSI4uigN4qTuUaF10DLQ4jQ
         bUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436146; x=1790040946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYSdJ3BpaBA99mybiSOcxyeplaGMmUigodcgqfqpRMM=;
        b=rGIDeAyX63bbmfTxWC93I7kL3es1Ia0/a3/t2/RDdk5P6kEmEkKkdZx6hfYKjb4Frr
         DrS6TGhJ6kHSFnUxWnVy6h63toXSRnwgrTjBtuekCLf9WUD6iomIUTNBZ5O3u6RIJaGX
         jeDwrAUeHCsnZet8ajC8NSvOTOFzS46vuIaeCXUiTY47ymF2lkVoy6Jbt691bsp2gWwx
         otZ0n7xT2NJMbC9J1sYewo6AYUkBbDXvI6VQWZmr7czWn3exouJHvPCXYFh3dc9otcM3
         0QJGnlYs76gj+Oh6/jqA8duenFbUZCKJypmoszJY4I+1uv/qVVW6sLjKL3HI2NbKxH++
         7/sQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPbhmMHTXLhgHp/ZQoaRJmnTzPtkkEuY0wuFr5iMvh5Tcl2LqBtJYXK4bMUs2tCjXrQ/HdLLP5QVADjjU=@vger.kernel.org
X-Gm-Message-State: AFuF++mhveDB5viFcKUOyZqUwtGitImCo93yQvexkH29yFAn8LtYSPuA
	w9YPd7+EvB72F/CliGlirjBFAzYIILRi38ZpLK/wJ4lFk3POiji8zgY=
X-Gm-Gg: AYBFou2Vp0Qhlay6yPmVmLMkEFyNOwsMSCKDOCffo7H9T5618Z2wkehIm4tGZI/q2xD
	RsAHyx/738rffby0U+/Kve8bG/iXlgTTU8zaC+QpPQAujnNXaAZcFIqXJ/1GUjx0t4FhlyAu0WT
	j52ProhvC87Vdx7EBDmf30kpGFvikXu6x7utzKbJsvJH6MJkvv72jWPSzXJx/rpdkYvjsrc0q7U
	A1yf7cFRlsmDTQdT/lzpeXkDn30P4FOaPDHHzd2Nl0LazjfIJvSuvzZI7fqrL6g402LOW2yTq6E
	ueMDJWofGKDY1u1X0PLNuiWjEQJ95ZoR4Q6TXtFYuCL6sfc/vxG20m0mU1BssFL4U3liVC9318T
	YBK2VumEipj35Z/6mWIQzAzaeYS+MiDPXlhsxRaRrh+Py0wbqO9E+XevRoFyT2bI7SV52a4Zpwd
	lJ+mKrsP7jxL+zDpDEz2ZtwX5WwX/1HLvEtkzhH2Icj7Gy7xTtytXmOKi9VYO5buTzMcrrIltUD
	BEgIgnLf1oIi0GVzTvxFBHy1DWa+0d553LzGfa422TCaF3+wYyk/MPqVt91WCvCAfuNP+gk0Iyj
	PotAm0v/qj6saatgMZCOH/hu00DvvEn3V+JHw4aNS7LVMGMcOEEGuygBYETzFVkN6JOhRA==
X-Received: by 2002:ac8:5a51:0:b0:530:e1b1:eaeb with SMTP id d75a77b69052e-5310cf60669mr78434021cf.21.1789436145940;
        Mon, 14 Sep 2026 18:35:45 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530f9b99fc7sm66059601cf.30.2026.09.14.18.35.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:35:44 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: "Arvind R." <arvino55@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] EDAC/i82975x: Balance PCI ownership on probe and module exit
Date: Mon, 14 Sep 2026 21:35:37 -0400
Message-ID: <20260915013537.71211-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

i82975x_init_one() leaves its PCI enable reference behind on failure
and removal. Also, the fallback probe is never removed at module exit:
i82975x_registered is initialized to one and never changed.

Balance PCI enablement and track successful fallback initialization so
module exit removes controllers that are not bound to the PCI driver.
Only remember a normally probed device after successful initialization,
and release the saved device reference on both normal and fallback exit.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 420390f06a5a ("drivers/edac: new i82975x driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/edac/i82975x_edac.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/edac/i82975x_edac.c b/drivers/edac/i82975x_edac.c
--- a/drivers/edac/i82975x_edac.c
+++ b/drivers/edac/i82975x_edac.c
@@ -233,7 +233,7 @@ static struct pci_dev *mci_pdev;
 					 * already registered driver
 					 */
 
-static int i82975x_registered = 1;
+static bool i82975x_fallback;
 
 static void i82975x_get_error_info(struct mem_ctl_info *mci,
 		struct i82975x_error_info *info)
@@ -597,6 +597,10 @@ static int i82975x_init_one(struct pci_dev *pdev,
 		return -EIO;
 
 	rc = i82975x_probe1(pdev, ent->driver_data);
+	if (rc) {
+		pci_disable_device(pdev);
+		return rc;
+	}
 
 	if (mci_pdev == NULL)
 		mci_pdev = pci_dev_get(pdev);
@@ -620,6 +624,7 @@ static void i82975x_remove_one(struct pci_dev *pdev)
 		iounmap( pvt->mch_window );
 
 	edac_mc_free(mci);
+	pci_disable_device(pdev);
 }
 
 static const struct pci_device_id i82975x_pci_tbl[] = {
@@ -670,6 +675,7 @@ static int __init i82975x_init(void)
 			pci_rc = -ENODEV;
 			goto fail1;
 		}
+		i82975x_fallback = true;
 	}
 
 	return 0;
@@ -688,10 +694,9 @@ static void __exit i82975x_exit(void)
 
 	pci_unregister_driver(&i82975x_driver);
 
-	if (!i82975x_registered) {
+	if (i82975x_fallback)
 		i82975x_remove_one(mci_pdev);
-		pci_dev_put(mci_pdev);
-	}
+	pci_dev_put(mci_pdev);
 }
 
 module_init(i82975x_init);
-- 
2.51.0
