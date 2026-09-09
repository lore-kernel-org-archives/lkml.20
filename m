Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3F352B1FF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956096; cv=none; b=Zy9PWqkVpXcp3rnPKbNy9xK93ZYl84OPcFQBR/PHlbyQw24a63tPG4MbG+QO1BfYpCQSL8EDtxl+hBdCokKinoJQjLbkwu/pvDIg0J4jheYm7KCjO7qrfekkDp180a2JzNoFGtYsAI1BMqo1Fop4/9PLxdKGoegmfBBVlVdfeE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956096; c=relaxed/simple;
	bh=hzCE37uZI149uf8HBl8Q/B2wOI687g6UE4boyN1ASoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t7tg86Vc7YfJ0sr1N81L/jpK1J9uJnTb7K116P43AowWSRYHLuypA9t3O2gZjJUIWIFWzJZDrXQk6z2jUZugkLgGTfepWneJr/RiucKejk5rK0GJCQ6/OPzLpbYi6vV2w7aLB7okciVd9pu0gfpEO4Y2UzI/7oNAMhGMlEmESvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4HJ+R8o; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4HJ+R8o"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so68190285e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788956093; x=1789560893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsuivYkcY/5Dx3d9+yUm5h+u4pSa4bcPrVtBnEBIRQY=;
        b=e4HJ+R8oSdqVTKXmIbRp0+xUe2CkPvAfx4ideYPj2OmkxX28Hpn3wxPXfHR3nzONnb
         uwTzgpm/WSf3n1UGRU7ijif+ItayFasjiejwTFGAjuqQvT7g3VeTrNL0QaNmNxtEv6V9
         rKPBdPCGoehHQmDJGahKhVEBjrsmagbMDyx+BDD8MvsBsFsvgTGKc2hBGOhvg9hVb936
         q9+Ztz+pn4xmAmMceIKAa3WnGQYRyxKZoOl+fdoNvf9CKo/debmU+maL8evZHxiQ1n3A
         KCnYmQFE7pvQUiBU/tN6DsaOHdyT/gW3CFY75rT0iKMhpvNv6V51DPVAMvJvJM2uPnj2
         fQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956093; x=1789560893;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qsuivYkcY/5Dx3d9+yUm5h+u4pSa4bcPrVtBnEBIRQY=;
        b=B/06QMfkJqEq0ZuUMhWD27ZclznUKLh/DQHTo1MVvW3qDIp3YNq1D5s2vRvPsnXXj9
         RuxGiTrbs3qzx7dL0/F0B3E6k1NHXkz2UEc+WDiD3K0xRUU6eCe9ViCcY0WHUsJF31GH
         WWk47PQk32+BivNX2yioZxFtEQSXMFwR0wSh9uQTcZF1s0NPutU/FtkTnxlkhGvxqj99
         xwvDW7qq1pZTnQp9+E5OvzrbyNpPOqa0gEc0c6GeJ+x/F1FEB4SeAw9Ak5hiEYYFU08d
         a26ECZj0/7fXW1QCA/s5/7cnj1mqGrFbI/TQDaY/bGeJTg3K4K4CmwUCOycubPcfX8XR
         nLFg==
X-Forwarded-Encrypted: i=1; AKwUvBzgAP7ifwgMZxjYfVl+GAga5dBNqF7keo/qvDL38JF7CK6Mg0SD556ytAhDvuV7O1zPkePP5dpLFdeCRo8=@vger.kernel.org
X-Gm-Message-State: AFuF++klyJON6d/lrUWhMz3rkoHdsjSct5tBDtXV/egNVi3zKJ/I1Vuk
	KcL6SXPBVXfAs1SeKB85py9Ix13mzijfNsGl5b1RHukY+QT3bdfz8CGeIWyqtwow7H2Uhw==
X-Gm-Gg: AYBFou1bgNivMkzkexeFcNZNJHesYbPABKzqUh3RUvzb7mlzDqZB0evfLxuCF0YGNhk
	WOAjQGfwrHUD3tEGDwC6gOtDUUquznL0Ciz+QtK0zCDI7XnIBYDuBUVXbKPNY35p+XHHyiMLAeq
	frC922QHJc4Hwt9OECTJx6zqATbwCCPs39eWOqnH5pRvYFGqDvSzWICiaqgF51vXn12JkWKElji
	0ZYAKeZdMYlpRt/TCU5x6Ya7rtGxXo6ksAqTxDSJTp7A7T84p5K3EWJ6eeXnXI/wNe5d7TTDAnZ
	67HON2AC/QJOXCZgzrU1hZ0gKdwvNikWNalIwJB13O84+UNHNk35hXqknSWja6cc4czK6vSYp7O
	xmmLBYO8l/3qZImGqxZKqt2iDnavSJASnjKgPMIfy8Ta0EP6EIz0AcAB14FQD8bk++CJh97WOgV
	r9m0tRgdwO8+hgcPl/RgMLdt9IGbYqTyZlfe/CL+CL5/5qlDmX1uxhuqOu8qixQf1yF0pVvshwT
	JfvcpA=
X-Received: by 2002:a05:600c:4585:b0:49c:fc6c:be16 with SMTP id 5b1f17b1804b1-49cfea09f08mr302913425e9.28.1788956092594;
        Wed, 09 Sep 2026 05:14:52 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf772692dsm547547485e9.10.2026.09.09.05.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:14:51 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: david@ixit.cz,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH net] nfc: llcp: fix WKS SAP hijacking via prefix match in nfc_llcp_wks_sap()
Date: Wed,  9 Sep 2026 15:14:31 +0300
Message-ID: <20260909121437.33744-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nfc_llcp_wks_sap() compares only service_name_len bytes, so a short
service_name like "u" matches longer WKS strings like "urn:nfc:sn:snep".
Fix by requiring exact length match before strncmp().

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 net/nfc/llcp_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index fda236e4d9fd..5025d8bdfc36 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -352,7 +352,8 @@ static int nfc_llcp_wks_sap(const char *service_name, size_t service_name_len)
 		if (wks[sap] == NULL)
 			continue;
 
-		if (strncmp(wks[sap], service_name, service_name_len) == 0)
+		if (strlen(wks[sap]) == service_name_len &&
+		    !strncmp(wks[sap], service_name, service_name_len))
 			return sap;
 	}
 
-- 
2.55.0

