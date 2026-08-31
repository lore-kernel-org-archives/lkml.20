Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FD54746C9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191665; cv=none; b=g97OCQxgKMOfYmNTwwp35W4BB6sacSQJqwgpeS95GPid5kqWvRumbG4kDKHL0PceBo6A1vvJs+8iQMtaEQXFLIAgZQL7aBm2LV5JHKGQkZjgqhWFXRIbPVZz1qszlmktOp34ZiKHhmA3heyxj9Gmo8HKTr69elFQoSTwP9HYPjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191665; c=relaxed/simple;
	bh=fiA0RXJ+cutJQ46iLKVyryXs5YV53pyfmTaFz17lMu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=no32sP5VGaz21FVMsYULRF9/8rBeDHESOzDX3tAsXV71O8mkJsUC8hCvNwcbznJfrX7HuyhTqdr7qDMDsYHdSqMFwqyeF2xnQq7SgCVzlaMJn/v6Mfj5AsQm0d1Omd29wjWIFnNcofwWSHvVfEJsJrOPJyAHcVAjbR9NMrVP/CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LdLVwoS7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdLVwoS7"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482e067e908so2712565f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788191662; x=1788796462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XWjANEXWVZsBsiiF2NEG2eJr+Ug/Njepr9rhQdCzDS4=;
        b=LdLVwoS7irBRHkYFp7vyWw7blDgZRuWvhXEfDsOXrfmn+xoH+RQGcYQH83mlrf5QWI
         Rx3RHJHt4N2TVf/RFz6hl9uktmPBq9dae4ic3FXORT197SDvFmRsemJ6WkGivVz/RuFx
         qEB8UGY7zBoydeEu5WmseHPtpuK/e/Oe0KAlOVtKzzfXSOK/DZQTzXcCH3r17Y8ztsgz
         8nL0nxtWFAUEZJ735QrafZjmGbHDg1AQzYA+K5zveDpyilMtHK57daM0hTkZJoJB/pCm
         87aJM6PzEjdrqwUTVyEY0SxP0LShPxhSPyopL81Tq7y9ccPGmLp6TfwPcJnskeLi48Xh
         +MNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191662; x=1788796462;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XWjANEXWVZsBsiiF2NEG2eJr+Ug/Njepr9rhQdCzDS4=;
        b=Ux5ZiE1sfbR4E7ZWL7q5hE9dkLw6SKL0ld17tX2+NpXmTMDocHcvor74l5bwiO+XRj
         tu6JK7jUtB27FwIbfAKKACt+n+w5QCdVNIdkZooeWKVXTfAmDAo1AmXiWUjFK/AejWOf
         qcSU32g8UM53qJuON/nWO72C9FjEfgrfcPZuNzJ7BtSozUykSsm1yI4jPRZoCr6gW/Ic
         cS9wrnWMHMvPiXjTOxj4pdI9F4omKNVlG0zB3IVofhjZK5I9caedsYYp0fxaI1M4WmkB
         /PXr/Hyv1V3BOqstf80bj7TZEp2qH33eZ/ZoBgwG7C32i6qEip5ImF+hnNRvb58sWn96
         P7cg==
X-Forwarded-Encrypted: i=1; AKwUvBzzszd/M0FRiDXZUiLnnSAvx6bkO2Lv18B36r6fHlnjpYzZH/jJG9BY1TLD1qG9qACuD3+Rml54cTDf6L4=@vger.kernel.org
X-Gm-Message-State: AFuF++nUZY7YqzrNK8X1hCJpEkFk4wgU7TwcHOi6YzecKsLfjrWQwudm
	izu6W8jiAThgHyZHrNZ7kOXMb4E7uAi5Y1cnNquYe3uvPoARJowzopn+
X-Gm-Gg: AYBFou2Vfa+l7mh3frWhLnwM/24YkLwYsAjQ6UfnswYZj6EdyrDxr7bdQbM8plw+Ruu
	Z/P1Zp8319/WIVXzdP2NsVfYcNQj7odBLvbBPhOslCMUGnv5FkW6yb3tpQZ9o5EdzmpwdNW2scQ
	dkHkD53ByeBd0U3hvNAf02porOXViwyH/6ELDpLdbtoIr455Wg+tj9/3YmD9vUoIREvD+vB/+WW
	bvgBT943/2ZIx2UFKSBoVKGy0LiikTJChhgsWSdT1x/gykpC7Oe12D0MxapDE6e57dAZLjgzjE0
	NOcFU2ySO5q6FXBffuAjsfko7NyYibLq8daJ0fQ8f569HrlbhlmOw1eaiCxW3rhqLyPa5AGobpa
	XQBwsxI7/a/Shy1023vn5oIe5E7YJN+YJ6tNl4zFgbPHHKrQLQ6xoOwH0ti9a4mlKkCCJ+2ofJh
	AHMFL1p2pQW65S/yvW7Kd+A0a2min5daH+uphXf8BvaoGUd6IDflROXpZ7fRvJtJgScBxZcomtK
	iV+gwYtpyAB7Aj1C+Fy5AHP
X-Received: by 2002:a5d:5e12:0:b0:482:ea99:6166 with SMTP id ffacd0b85a97d-482f79a72d9mr33372858f8f.7.1788191661680;
        Mon, 31 Aug 2026 08:54:21 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436e2af3asm12949099f8f.12.2026.08.31.08.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:54:20 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH v1 2/5] power: restore hwmon if extension update fails
Date: Mon, 31 Aug 2026 12:53:36 -0300
Message-ID: <20260831155339.181487-3-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831155339.181487-1-ivanrwcm25@gmail.com>
References: <20260831155339.181487-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

power_supply_update_sysfs_and_hwmon() removes the existing hwmon group
before recreating it. If recreation fails, register_extension() rolled
back the extension but left hwmon absent.

After tearing down the failed extension, best-effort recreate hwmon so
the supply keeps its previous monitoring attributes when possible.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 drivers/power/supply/power_supply_core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/supply/power_supply_core.c
index f550f70ca586..c041806f4f9e 100644
--- a/drivers/power/supply/power_supply_core.c
+++ b/drivers/power/supply/power_supply_core.c
@@ -1595,6 +1595,16 @@ int power_supply_register_extension(struct power_supply *psy, const struct power
 
 sysfs_hwmon_failed:
 	power_supply_sysfs_remove_extension(psy, ext);
+	list_del(&reg->list_head);
+	kfree(reg);
+	/*
+	 * update_sysfs_and_hwmon() may have already torn down hwmon before
+	 * failing to recreate it. Recreate without the failed extension.
+	 */
+	if (power_supply_add_hwmon_sysfs(psy))
+		dev_warn(&psy->dev, "failed to restore hwmon after extension error\n");
+	return ret;
+
 sysfs_add_failed:
 	list_del(&reg->list_head);
 	kfree(reg);
-- 
2.43.0

