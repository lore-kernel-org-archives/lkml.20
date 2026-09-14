Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F5F35C6A5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789424578; cv=none; b=a9n/HF0kCavdSBa1YzgAtzv3NU/AUL+tnjfn7XhfNowXG0xHNzGbmEJSyNesPbhaUSpKE2NoAtWxtTepH+UJ9R3hEQDqVRI46tz0SXE2YFkvAoKA31YI20iIvmoVSdM+3U9j3Gq4jApUsJpymhDB2w36y2KgiYZuX73n1P+wBJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789424578; c=relaxed/simple;
	bh=foOHSdJTOJhU6+yYWGeeQMxkB0Vsh9TMpxUCdttflIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bem9HFgE4krY4ihBSXp1gGaEwiGUOUGRo103/zm5YCIOWpEshjGbkFv5B7/rhD5YJ8gM1ydHDJSTzAMJVyoL7uEuc0f+XuBN6dpV99/sKeHDDsMglRa/pYzMkfO2hbfNHJxCvYG5pWfkIaFn0s0rSu+iGP8Orzu9ojSOOi60q1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pn2h3Z2u; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pn2h3Z2u"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cc46c7so190295385a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789424576; x=1790029376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZYIfd78aSnlkErTq0YH0tchJ7mjAaSn1gqbunL7HHbw=;
        b=Pn2h3Z2uok70LqsU4yQ/B3TILoLDCbxMRrR3zovCCuHHObDc4JUk/uZWyGZsdcOczJ
         N3/Eh7eAGtQ6bQpdEwfVtohbS3U7L2+s+BVo8FbzKenFSImnCiej50fgaobG3rCgLr6Q
         JajI3aGB01xda2hlCMOHwXR7aRfVegKP6RVEPNMw9no5hip+iA8pfjNv6GaZXVcrAZU4
         CSXKTlZf5j3vwznWwshJbvQ66zNwKV8+BZgNoav2VNs6+bRyBWLhd93sQzI+tO9SllxD
         dZ0SmGttwYDbg81hWtsQQT7ggYCyjwj9aRMyvDQPMIWFUHnE7U4CbkjAUEnEfzNcdaSX
         bTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789424576; x=1790029376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYIfd78aSnlkErTq0YH0tchJ7mjAaSn1gqbunL7HHbw=;
        b=Nlsfy0AuKD96CqaCuODa2uhu0TCpegipg9kK9TG/XOoHi5FtsgVtmYg8OcLCEpaBGZ
         +HQCt91lD6LMpBIKBnketXqSlEbZplsYCw6bnnsZzSEUAgEfu9dD1kFIZ7N9gZtZDfVV
         35q3JSJ5+m+XjbIkrA0hwy296xt3b52pzkM1dVv0WIHpKpq3hnP5cRMLmr/YdT96W0dY
         hdQYlZcgQm3N84JGKVSPmix9q3hR8rO7vu9ajeV1fdINgDcCI/ENGSKXIMSebtywFHIE
         xLSlAA1+x3PWHgS6z0WAI622+OMIpNCi727ESrbq8Hd3SwKfkqIhvhyLNqsy6EPUCqSu
         DN/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxf7aHDXvpxZH3S4PG7LFdXqOu90HLU/fIBtKp+LVWH2RUE81BXClRM6UF9IgrrLm3KF2tqROeLL3OQR1A=@vger.kernel.org
X-Gm-Message-State: AFuF++kaeDtxKSvtx7iI4q+AvKRBgNjx4aZKS/P87ywa2ADzyveAQqGz
	x/X0WLcylr351PgU/4bpPHVmSKlq/CfdjPzKcCZtL9DWT8AFRgXmeRk=
X-Gm-Gg: AYBFou35F64hEBjFcr3N+5KACLWy98VR5jJItifXtBlzrPxD56yoqv+hHofP7asExBt
	ft7XxHCzYPtvv8YM1+FUimLvWtbVJd/1/Kg4MwWtMMoGRrnwSf5Ujd5YMzZiIeCjHz8f6BoqS63
	EEckuYpNqBoPZzHU2XOH9qQlbj81/Yp3a6FXq2StO/i/2/GVw2XyYu3Nbm2WxD29nXdYUEd1O2b
	qN0tR9VzYvqmqXdR0nJf46A9IMazJkG7uCNJkxucRLmkggctr2RYIZa66MLZGUt3a7aGaop6Pn/
	GBLnEHhhX6ddwiFo7jCPJlJ0SAgBgCw/VPV1p0/9uy4GSAkRyZbAS2EYHQ4+WQ1VqVfCcBFb45T
	vZU0R5djqc+LErAngdsrVUEMpaCyD9Gamw6CTmcRpqd8Gis0Ll4MnpyIz6PFCNqCV2y2vvD4Ngn
	pPBY23hsO8H4OPdYZTIQEEtmObpWzr1CtvYfNgYuihUWL8vv0N0ziNCKA2tS6AroTZzHb4ZK32c
	ffPIzG5nZCpUh4omb42d5oVPhSROq7e/klzqOvToNEOEH7ASwCXTJXya2H0bHNWr2P9f0UaQl5M
	v2sWSGUAoCdF4gJEFpmLvrSN8MF+4Pxbtt6txZd1HGp5lsJj5srUC5y0XKauKJGYG4CRKg==
X-Received: by 2002:a05:620a:468b:b0:936:623e:2603 with SMTP id af79cd13be357-93a2985c9cfmr680154785a.17.1789424576182;
        Mon, 14 Sep 2026 15:22:56 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45adb3sm104283876d6.9.2026.09.14.15.22.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 15:22:55 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Michael Chan <mchan@broadcom.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] tg3: clean up PHYLIB resources on probe failure
Date: Mon, 14 Sep 2026 18:22:46 -0400
Message-ID: <20260914222246.29761-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tg3_get_invariants() can register an MDIO bus and connect a PHY for
USE_PHYLIB devices. If tg3_init_one() later fails, its common error path
releases the mappings and netdev without undoing those PHYLIB resources.

Disconnect the PHY and unregister the MDIO bus before the remaining
teardown. The existing IS_CONNECTED and MDIOBUS_INITED flags make both
helpers safe when initialization only completed partially.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 158d7abdae85 ("tg3: Add mdio bus registration")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Remove the redundant USE_PHYLIB guard; both cleanup helpers already
  check their initialization flags, as discussed with Andrew Lunn.

 drivers/net/ethernet/broadcom/tg3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 73a4b569b..91c7ad997 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -18047,6 +18047,9 @@ static int tg3_init_one(struct pci_dev *pdev,
 	return 0;
 
 err_out_apeunmap:
+	tg3_phy_fini(tp);
+	tg3_mdio_fini(tp);
+
 	if (tp->aperegs) {
 		iounmap(tp->aperegs);
 		tp->aperegs = NULL;
-- 
2.47.1
