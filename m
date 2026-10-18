Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCED361965
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309057; cv=none; b=slgkttSc4tkWZm6lL5xjc8aUHXTRJom/MfIr+axYZrDfxyDt8ypzPZUvFbx347MG2sARe90NtyRaCz0NjzYcepZrXyLU6oXhOZkgjR+rl18/hDuETd09iB4QKbmezIfe1cE+qctw+tX73Kfs2iJq7EEugpnnaaLSTTVwHLzu7mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309057; c=relaxed/simple;
	bh=Hmuqp34RdqLcrKeTbJbfrXyrlGzTauG3Lfevk2ShF0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LSGxBGYIrCfeW9PWp/PnxgvIa2gxOFq5kqyeoKUvvsT7hbo7pBV1dXG0lpjmXZg/ggvBV5CY8wGx6jBvHU5/CG1EF/jhTP9fixRgoUlyz4wIk49zhcvCR9d/EJ76FwQOgGcNibvib6FtfOAXrycvOo7qsBG0gAOpXF0VSnlTN6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gapp.nthu.edu.tw; spf=pass smtp.mailfrom=gapp.nthu.edu.tw; dkim=pass (2048-bit key) header.d=gapp-nthu-edu-tw.20251104.gappssmtp.com header.i=@gapp-nthu-edu-tw.20251104.gappssmtp.com header.b=sYlzw6kT; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gapp.nthu.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gapp.nthu.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gapp-nthu-edu-tw.20251104.gappssmtp.com header.i=@gapp-nthu-edu-tw.20251104.gappssmtp.com header.b="sYlzw6kT"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so1136734a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 00:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gapp-nthu-edu-tw.20251104.gappssmtp.com; s=20251104; t=1792309052; x=1792913852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4P75elqeqT0pWSHwcolbg8xSb+LUrEqdt2+nUrRtVI=;
        b=sYlzw6kTv2g+mickTRL66oStXXwnUEprmjwWo85GYJpty4Ei1yX9kBPH3VFeEsejZa
         3H3WLnrmNrngL8q1JKrmlV4aQysjejfVbkxSwtzcaNuJ6ohcB0BRPBcbQkKdP0oZu6Lb
         4duMcCvosh+m+lAuftY38mLGfwwoLoh7F5UA1l58pVe5LX3yNQItWmycQrlEIGd6f6EG
         QD8mc1MPKrS1uuMW0XTKmMB0gvFDyUeQs+ToQyrxc3mznWAWdIO/7vV6efDbmLxIaHWi
         Bm+3ZCsIQ8n8LIG9u7DYrIEF+T4FhjuY1a9cpdL3jqoPNGmWmRY1clSjIirvklecHlqb
         N1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792309052; x=1792913852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4P75elqeqT0pWSHwcolbg8xSb+LUrEqdt2+nUrRtVI=;
        b=oe2sdNabqvrzK9fCpq574FPsqCxSUqnvpQqx0nbyF7MVPuEe4F17liitGpQMTnT2fZ
         PUcO8oqJIYVnvs6+JfDgOgRSjdbgdpAtfIypyRdscWrzhp8MaFwTKE+517pILPHmD95f
         150FOC+4iEmS1rxb4s/7rHdGwPPy0Fa1wsIyHkZ7S6a5w8ajGAnS0e2015mEN6y9wmSX
         LtTwx6C5Uq9VnlmmCGqEJ3+7tcBjh3lkfs+IlM+LWYa//Ao4XfkqbjL0MCIxK/JCg3MI
         /IkaLFp1saWBy4zt4adAPYVNIG93jZWOXDnm/6ubMbXe8P428xAc/agBb8RE3upUY5rS
         Lj3g==
X-Gm-Message-State: AFq9FYK8y8mCDhby8aBXcogqMAZ8jQW+r3G2dZoc5Drj3eATRNwEFYrM
	ewnh67RIQ5qSPeSi/ZBg3JhqzaK3A6Tit87Ij4i+5+8axop2E1DP37HGQoVrjkzPeyY=
X-Gm-Gg: AYBFou1HKP38Q1JQu5HK2FNvBsJadk5hj0upvBzMxtk5J8fe9wCf8dOrv5IZ93B8Wu8
	FUtD7k278MGQqaKduUqXSMfeMSUvfcYhAdQ2bNN8rVvGFIupK6eL7bT80yhPcyWG+CjwHYymFlU
	lQoIlLA8yCQADGI9f/xePIMLkh7Syw0gmOmirm1DxGURgxrtd69MIYquv7UhX6yNUgTYsaV0N+x
	7jN1JiGVQDxD3Elp9OGPeRw0CljZUvBGU6xfXUK56KClfri5khyyVxCRrGpo5Ar307aDzPLYwCL
	X2mZQJtQ2QHfGXg1U4OaMNySBzz3WEDDtjkJN+lOMBVHLWcZVLoXAMLl8yusmaev33ft2zMMXE8
	stCQ2vWb3KKSVoyyKfw4bfY0+weaG7VWvJZ/Ufh0k85gGXU+o/XxXsR321dYOCf+xOHO2omhgVT
	N2m/zP/dIrl846FVhNHSd7HWGM68Zjn+fNX0KuCosQARMCmV3WRzBGhujDqDZYm2ltUSX80imJS
	ExIh2dObZIql6GPrQnlEYVHFfnhmAJwHkhxtHHLqdB6MuExuo6H0ZVNlGsMGhBNVRk7MJ55xZMv
	eTeTOqYs/IdvwT9vETCkmNy/5SwGTVOCFCD2
X-Received: by 2002:a17:90b:3b46:b0:3a4:b418:94cf with SMTP id 98e67ed59e1d1-3aceeb95ef0mr4132371a91.14.1792309052524;
        Sun, 18 Oct 2026 00:37:32 -0700 (PDT)
Received: from tomato-cultivator-HP-ZBook-15-G6.. (2001-b400-e3eb-c3c4-7570-5601-90d0-d34a.emome-ip6.hinet.net. [2001:b400:e3eb:c3c4:7570:5601:90d0:d34a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94792925sm15452896a91.13.2026.10.18.00.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 00:37:32 -0700 (PDT)
From: Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
Subject: [PATCH] gpib: gpio: use %pe to print error pointer
Date: Sun, 18 Oct 2026 15:36:49 +0800
Message-ID: <20261018073649.41902-1-ku.loong@gapp.nthu.edu.tw>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In allocate_gpios(), the error from gpiod_get_index() is printed using
PTR_ERR() and the %ld format specifier. Use the %pe format specifier
and pass the error pointer directly instead.

This allows the symbolic error name (e.g. -EBUSY) to be printed rather
than a bare number, making the log easier to read.

No functional change.

Signed-off-by: Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
---
 drivers/gpib/gpio/gpib_bitbang.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpib/gpio/gpib_bitbang.c b/drivers/gpib/gpio/gpib_bitbang.c
index 34d14b94a0b8..e6f3a3a239ce 100644
--- a/drivers/gpib/gpio/gpib_bitbang.c
+++ b/drivers/gpib/gpio/gpib_bitbang.c
@@ -1152,8 +1152,8 @@ static int allocate_gpios(struct gpib_board *board)
 			table_index++;
 			lookup_table = lookup_tables[table_index];
 			if (!lookup_table) {
-				dev_err(board->gpib_dev, "Unable to obtain gpio descriptor for pin %d error %ld\n",
-					gpios_vector[j], PTR_ERR(desc));
+				dev_err(board->gpib_dev, "Unable to obtain gpio descriptor for pin %d error %pe\n",
+					gpios_vector[j], desc);
 				goto alloc_gpios_fail;
 			}
 			dbg_printk(1, "Allocation failed, now using table_index %d\n", table_index);
-- 
2.43.0

