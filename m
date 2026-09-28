Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8627B35C1A1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790558162; cv=none; b=jPdZL35y4bWVkBo0wcWZszb77JNNh9xG8scd7fyaSmHg4FnYOq0cB4gSsQN21BnM24j8x24bIo39v/ECu1cQ8jpOM05MYbNkrlxOCN3Xhbb8g04IV+2CG8q3FftoBI46sxHG2NRqEErXRwGAYlJkd1rdh+KEpE/On7Oqa52ZIUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790558162; c=relaxed/simple;
	bh=+I2BolBUioXjtWJBg+bex5SMVHjpHt/tnYuBkI/f4jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rTZiphkA2D1HTRqxDayZdg+FWlIb4Qhy6RAZ1mt/GNyyqkK/n55JjTjqNfMobgWITFIhNruRcbL4lZPYVTuDXg3CkPRy1q1gn/uglHHINMM5UBR4Krfe2Diz8R6FQdWBnP4mOmbkNRUZeW/TK0FYkQqIuiyt77+ea1jR/reW8H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZoahKGr3; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoahKGr3"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0acc274baso175923a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790558160; x=1791162960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vhcu3imKwpmuJ1Tju1r9h/N7S7nL7GpOkubpL/2zJc8=;
        b=ZoahKGr3XikS5e9HejiR6qwxx3tVqe/v21x7tANAM1ATDrnoEdpnGWFvV7NwNsQw95
         Tesqvn2dt6UkoGBGQiYErKsEZHow2HBKvxFW2D4TwyUx9qylPnQfL2kopQ5WX1GtC2z7
         TY7HMJy2l4nR+UwIrqXPhz1a+kft8DUNbV1AoCWFFwJh744Nb8XByRkzzFLj1roj4Qmo
         JPdvBJ13ST3KJ2PI6RPPO7kN9lwIqZSYU5Z0Xgbb/7Fufmta0hbpqrzFpdI+oX2kRNkj
         qvaeroQ8JrkxeKASXPnFj02xWOgPtGJCTGkEVhJ9msM57rCRDvFGL6yEIqKABzZbzjU6
         pcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790558160; x=1791162960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vhcu3imKwpmuJ1Tju1r9h/N7S7nL7GpOkubpL/2zJc8=;
        b=v6KH0h/y2ARcY2cVsIsg3GAPl0M2/cXzqy2Pw/9kSjF2m46xDojNOL1EkVr5koIRBC
         i2AqnmbkR3z0/2KRM8flQ44SR26d6POPvF0T3cRIO91Fuk6/U59Grc3Qbpqmo8v+zE30
         qw05emXdKhFx4/7GjbxT3nvLDYGfDmEehwVLhpiYP3ROe/kQDeu8Keo/820MQoDF4NCs
         lr4NTKOPAe4XBVX1wSNHOzzXlgz2lkvqzLSOalJneaOnJ21KhZxo+97+WwZ2FGwXKPL+
         Sx/+u1YLzHV9ssn4a9PBak7zl51QHAZNks5s04okmwYN06oKdsaVbx+97lSDfg/HjwrT
         DnRQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8vs5atthKdeVlskvyBz7CqP5YxNgIPBraJkh8z2yZyumid6n70rci/ASbt58Tuz1TTbw0zPi0loMJ+7Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLO1ntcoanxCD7ZIT5bBrCkqUHahgLXfKLna2unKmwiNitFG6ph
	6kcL8SegnhQJx0RuTlHrCq+8ANrpC6u6aGAaK30m+Omn7i5JnolZ2q9z
X-Gm-Gg: AYBFou1SIGhPoyuD60CjHQlygZ2OiKxVlg6fzWsfE0yi2hESuXYHSjAs6U5EGxaf90R
	1goftSgHtRg287KZ0ZibkTOlFR6O5cF0cEkmdVCvcQ0wvHvqOQJ1HrXjo2cQmAS5TIXoErEETZl
	T90OKENDhROMAtfgcgfDzZjKA8AidVlApW71GdLSi3vh2vcepNsJr4LHhq2dizwYazT20fCy6k5
	63xVHdaPzzsbnU3H3sDwbUoh/a4x1omPeWUksZddwg0wSOyRvlNNEI9CblgRrzVBe+TwDjd+J3p
	sfNePnW78qwkf0wwlVB48clZBE0y7I2izkpj3yc3JFBCGi9nSHka3nwYFpLC5UwGX8i+Lgx/kLZ
	XSQUUe5yQGIQVMK3bbHRai+ZAulMDlW2YCiKStXhAD7Je229KtVYXjD7Sj95fzhTy1KTQUJZgvs
	6jkji0SvjvHMXt6cwNl7saHU5bsoOTgFZHbRxFAXm14rKz6Q74gOP05sM5LYePtbClB+ynMnvaz
	GwaG2g=
X-Received: by 2002:a17:903:1ad0:b0:2da:dd0a:99e0 with SMTP id d9443c01a7336-2df8e6db03amr104467805ad.2.1790558159845;
        Sun, 27 Sep 2026 18:15:59 -0700 (PDT)
Received: from LSSP.an0.nb ([2001:da8:7001:22:6cf6:6d8c:1a91:b208])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142937asm33747505ad.46.2026.09.27.18.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:15:59 -0700 (PDT)
From: Guanxin Li <bruceli20040604@gmail.com>
To: Moritz Fischer <mdf@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Tull <atull@opensource.altera.com>,
	linux-fpga@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guanxin Li <bruceli20040604@gmail.com>
Subject: [PATCH] fpga: region: depopulate child devices on remove
Date: Mon, 28 Sep 2026 09:15:51 +0800
Message-ID: <20260928011551.15629-1-bruceli20040604@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_fpga_region_probe() populates child platform devices under the FPGA
region using of_platform_populate(), but the remove path does not
depopulate them before unregistering the region.

Call of_platform_depopulate() before unregistering the FPGA region so
that the child devices are properly unregistered and their references
are released.

Fixes: 0fa20cdfcc1f ("fpga: fpga-region: device tree control for FPGA")
Signed-off-by: Guanxin Li <bruceli20040604@gmail.com>
---
 drivers/fpga/of-fpga-region.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/fpga/of-fpga-region.c b/drivers/fpga/of-fpga-region.c
index 9107a5b461d3..fd3f81db0385 100644
--- a/drivers/fpga/of-fpga-region.c
+++ b/drivers/fpga/of-fpga-region.c
@@ -429,6 +429,7 @@ static void of_fpga_region_remove(struct platform_device *pdev)
 	struct fpga_region *region = platform_get_drvdata(pdev);
 	struct fpga_manager *mgr = region->mgr;
 
+	of_platform_depopulate(&region->dev);
 	fpga_region_unregister(region);
 	fpga_mgr_put(mgr);
 }
-- 
2.43.0

