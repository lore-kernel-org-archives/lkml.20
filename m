Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA8C3DDB0A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788558617; cv=none; b=lW4qUW4NQh7DYD6ajvB57CNuOYBKByfBUGjOsC0csAQXlAfEhQ4zikQau2RBWuP2VAkuvFdFEyseH3S+I5vuHckj7NI5DJuPlBeMDJ9p/rVU5HNp5ZB07O1ciRjqr173THV8tLBSpJaKwerzoTprBFhTrRAT8mn5TKlXuELrtws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788558617; c=relaxed/simple;
	bh=HRpm/PikTeid4SxhtPG58lLWj9vHexiupAlM1DtQk2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qHSpiPyatpm1FhP2TJIyXULpL+QoqFFPF9ktj9nkM96oeFv+iQXg/0uOL2lYJgsY7c9at88pP0pfHoEPDGhuNJRxyG2ZdnIP6soBzUCkRvE3mnNdm6JNT8N7YAlmOD7r86rp/uP4lk+uMMjiuPtm68QUIQv1kZIyzGJrTzHOtuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ed03kEpI; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ed03kEpI"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2db18e5cb56so11318355ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788558615; x=1789163415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sD9Hx1FwVR5Eafl6UTBAMgGfntaRlJCf0MQwhh/QWi0=;
        b=Ed03kEpIXy8yQrPvpbmFjdXOdxNu53kcAR1f2iBbxbOjJ+oX2Whpgjlv4eYvrav6Xn
         liKmE1GvXDvuwvPxc7/rjhU40nlNYNweKM+5lMS8xxZM9CdaGQJ+p4E2UHEZ2pTIGIIl
         ZmANXFkTcXMp81OXZ7Tp/wKFw05Bp4/FaU0pAWi+cSOgo5QuHtBkGjU+iEGdqA7bCme7
         5TonwIiAOeTwCOcweDUSVraB+XkV0mKXszMlvV/gWjWCMXOySwbJAJJ2oj/Vckq4iWab
         F8HvxeRe24g1Lzuk4p4NjDfN6PGTYY4Phx9tnYThLVG8dvKmzCFYg+/nLD8oWmr3Al5f
         l+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788558615; x=1789163415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sD9Hx1FwVR5Eafl6UTBAMgGfntaRlJCf0MQwhh/QWi0=;
        b=nvsXIAgMPQDYmz+cRL8LLz/b/+Ijjbop0SQBmeV9RH8Fg40MHpj0svk+I8owVoqk1g
         0k146bbG5tUdBWm15Hx4kRQ0vEplv7s1/yyhTljEQkT8b1HtYd9kaAw6mx1lloJ0UULe
         Gc1tTjjaoGbvXPTP1RfQZyDa+cnoBpRZ6218wsqLJkv8SVpzwXY4G8L7wdw8FXEqzd3f
         uZGa8BdfIVvUcXxzoEGF+pEZjYDOd8Y6b/LgQe6/JOw7aZJ0qtdwXqCyAWMmFH48WJcn
         7Uu2515F2B+r3foGIx3mJ8L0WizqCfk24GSlOL9kceuJ2sAGjSSRLLxHjCfCL8Nzc2MK
         ZIBw==
X-Forwarded-Encrypted: i=1; AKwUvBx5zy06h4KfJ8AVluk+2faMXdHdrMoN5QIFnF2VjED4u6OD47z+6ONBmHw3pgYUJgPqdGWHqAFRMtYsfto=@vger.kernel.org
X-Gm-Message-State: AFuF++nisEGBnaz6JARK6ZIFebIkRbHkEvss1eZ/CECc4EWZOyUhbMLp
	3BC6GJdv8+v/H+TggBVfLkAehbFhJ/9lRXX8ZLBolue+9E8RAL/+nzr6SiAPJg==
X-Gm-Gg: AYBFou26b3IB283yW7GJUdxw4iauquRooyhHrQ1HzJlVCpQlPmslVZ+v9/WIT1ssn/I
	rnhILKS7fJVrpOq5/F6PotMXgDmGCBQz/BnYqxDB0YCjJsoVQOspDtA6jgiCarYcfYpqGKMuIDp
	uPgdysdGv7QpbxKEphttpAz0EB/Jy1sMUgD1ROh7ZFoSLYT0i7mZadmTKuiRRBW0yzghfLAvq1V
	yKzMuYOBl9G3gbRpzZITKtRB5J09tuGvLrV9fD1KK/C9Kyu3+mEJ+5yjc+w2z8uEABKef6X2QhF
	N7mD3Pb9ZZqjOc3/Nh4U5eHOJzK5UinDFRNPv9GWuhVOK5UlFpassnN+p8AM85/UEQzj3wc69ya
	Nubpbc3B1kw+2fqWEov6SJAuR/1GNI52Kb1bq8WZ2cdwnQQmgz2/9ZvtedajZT3mbhk61QW/Cgw
	Sfs/KhZhOwIwHZaA8UFNIL8GG/liD1hDFI5HQ8IaFQcVO1LEJj6vHqDEKEiJaySlkLgHGvV+HRk
	UgAhu4gOfrQrOV6wTNv0FimH3vPxNc69akTMWw1gxmefDXE/UK+aPrSAnLvm3su/oAgj4hgso5W
	okPLzkLnaXxS7lCXyRAd2fFkn2BzHkAeIrrgAQ==
X-Received: by 2002:a17:902:f64d:b0:2ca:e19c:986 with SMTP id d9443c01a7336-2db125c83dfmr131050775ad.1.1788558615405;
        Fri, 04 Sep 2026 14:50:15 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149cb5f0sm14512185ad.67.2026.09.04.14.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:50:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE),
	linux-actions@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: actions: owl-pll: cast delay to unsigned long for uelay()
Date: Fri,  4 Sep 2026 14:50:13 -0700
Message-ID: <20260904215013.98283-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'delay' field in struct owl_pll_hw is u8, but udelay() internally
compares its argument against MAX_UDELAY_MS * 1000 (2000). Since a u8
can never exceed 255, the compiler warns of a tautological comparison
that is always false:

  drivers/clk/actions/owl-pll.c:189:2: error: result of comparison of
  constant 2000 with expression of type 'u8' is always false

Cast the delay value to unsigned long to widen the type and silence the
warning without changing behavior.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/actions/owl-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/actions/owl-pll.c b/drivers/clk/actions/owl-pll.c
index 869690b79cc1..5e30ce35f2f5 100644
--- a/drivers/clk/actions/owl-pll.c
+++ b/drivers/clk/actions/owl-pll.c
@@ -186,7 +186,7 @@ static int owl_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	regmap_write(common->regmap, pll_hw->reg, reg);
 
-	udelay(pll_hw->delay);
+	udelay((unsigned long)pll_hw->delay);
 
 	return 0;
 }
-- 
2.55.0

