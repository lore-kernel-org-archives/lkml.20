Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D283563E8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788225228; cv=none; b=SRjSXmfd/AQqqWX+vboLAKa2aYNn8rbmfifDL25COaZd/qq6DCaiwge1K2+VwQ4FVC7gSZ5/hTA8MMPxn0GGpT6cyAusT59TcrgYW3kqXwXJ9cskkOqiIMSDA1nXBldmi1mcFUtVArXwXA2XOPBDgg9dyXYFyYZHowFdjUOCkzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788225228; c=relaxed/simple;
	bh=BtmQtSAcOc1sMwXsSXHd/N0LJhsNzGr+XDlMMcgHhfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WawdVcLUs+OmmP2FOpjRxvmlsAoWjsqgNB5Mv1eRWB+PiLuPuN2fdwhnhZutK6nLn6AH/uKtnpAhlv7Xoe2lNKUnu61JG7DPGjRKsJAAbNuW+30dhmlEQsG0+w6bPIAPrw7N3KwG30YPZyP4nrJfc4TgXFejsxw5A7cM58sYhEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=UeO3NF6m; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="UeO3NF6m"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-939309d02d6so181794485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788225226; x=1788830026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/KJ6sckLCdEVJDbpdFqbeYqPNdthT6c5yyUBXrsMRU=;
        b=UeO3NF6mBiYWu/bg2jtm+5yt2bc4QNZS8A+vHdyNKJYVdxBjqTBU0XuzYLSO351pX1
         Dga8jS+KlnI6U9rJPFIdB9pVlnItoSEMc1kYSUppdTDrCYRO55eebDax6IhEsP4+lrLE
         OzKjaLhrvQJ5OKunc/rXgGjZp5cB4I3zcQpbjm9CxXrz12L6KT0zgUsHydSxBpC+MLHU
         DUV11en0BbwjVTOgEsu1dea4JHdi8Gka4OCaY8flwbB+7GGiFzu7gGABQpOxwZlqh3Ak
         pZkWgnL1p0GvY3lYkDYgmZQVDWRpoRZyE0Klq4kRKbhOyOFI9JdRQ7qSDe+GTR2Q3xGO
         BKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788225226; x=1788830026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H/KJ6sckLCdEVJDbpdFqbeYqPNdthT6c5yyUBXrsMRU=;
        b=FbRrP0BUtuzwq97aMMbp43/6L65AxJtJgjMyGq89gfzF7M9WKet38a9U4BWCJq0zOt
         n+W+QTx6aUsgXYjv1EGHGPuLczkgzAYqM95V4ce8v5J71dtjJSICLNAdAe4K6I+4kISm
         hXFI8XHFY2mmBKjQz9X/5dR6JFQCu65P3gjlxgrbJylcpRcI0Gc2ibQqj8BUVn/PUj9n
         PsWUJie/2Hvv63QXtQ+ra6F5pssxjsGr9iNj1wPRSQ3CvVI9h1rRd8aS7TijxzK2V92u
         /XsCh/yWVvKoP4/eXPYK8/5sl+vMRpWX+iMEhCvfhb1pGnw0l0PK1tjbGrVBZ0aC0RLA
         tp7w==
X-Forwarded-Encrypted: i=1; AHgh+RpyLMXuTOZJJV1CK0MbfjBPw4cRwuqqrEwtSY4bQucgHjHSD3TL/7Unm69tl24f190OKjXSREqbvOC4Yl0=@vger.kernel.org
X-Gm-Message-State: AFuF++n7v/YkPWGC6bdWDj2W4GNDC51FnQscQ0L6yVJifNzsIa8X4mpt
	JmmRwFbgIE/nT62bZmdLot/rkJ+j/HMdRKl3hc2cZAYhauKlUE12ehFrKBa5NwJapeg=
X-Gm-Gg: AR+sD1121Mu0MWcR/twYyIPWySZQaOvk35VL5DA27Lo4uS59dCrtJjxDrJPVzYHrlio
	DiiQdfrUybgv4JhZ9mHJNso5YcOB9DA2BuplRlu9ib9eOYSr8RzVo04WJ84TKFHC+u1fLhGUpsu
	x4OHt7ejyag5zAeOvQG1uny4NVQbBOSLrisMmX9+9fMSvaXTnQmkE/TtlW3t1TaV+ag7M6ISkuk
	vc3GDEuY/U2efh4Cam63aE7Z8ipQOzSaQXrm4BumnN5L4Xn8na7USM+vFz5oHM07HgUJRzGpqJZ
	ITzyMvWYbj4cPbFzmColz30NFJKqW0lpRjoRi2VPznqfsneyh9Zv7mEAoB3LZKMKBppVeoo6brM
	FhIcBBE2pq1RVGJdGF1KJ9+SdCdFPpGfIjktAvejWIcco9ITo+PnJ5BbPB5KerCXrJEy58BabX7
	toHP+XvIQWPg2hnEeJu0kSjQY2dfpG/8CXWFbH498Nx5a/FyIa8CjGz+/dhtGET4Hr
X-Received: by 2002:a05:620a:319d:b0:937:2e9f:70a8 with SMTP id af79cd13be357-9394819fd3emr665302685a.39.1788225225778;
        Mon, 31 Aug 2026 18:13:45 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391740a307sm581347285a.42.2026.08.31.18.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:13:45 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org,
	saravanak@kernel.org
Cc: herve.codina@bootlin.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] PCI: of: don't zero flags in of_pci_get_addr_flags()
Date: Mon, 31 Aug 2026 20:13:35 -0500
Message-ID: <20260901011338.1323243-3-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901011338.1323243-1-elder@riscstar.com>
References: <20260901011338.1323243-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The flags variable whose address is passed to of_pci_get_addr_flags()
is zeroed before assigning a value to it.  Skip the zeroing and just
assign it instead.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/pci/of_property.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 505226b876c56..22fea1905a080 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -82,12 +82,10 @@ static int of_pci_get_addr_flags(const struct resource *res, u32 *flags)
 	else
 		return -EINVAL;
 
-	*flags = 0;
+	*flags = FIELD_PREP(OF_PCI_ADDR_FIELD_SS, ss);
 	if (res->flags & IORESOURCE_PREFETCH)
 		*flags |= OF_PCI_ADDR_FIELD_PREFETCH;
 
-	*flags |= FIELD_PREP(OF_PCI_ADDR_FIELD_SS, ss);
-
 	return 0;
 }
 
-- 
2.53.0

