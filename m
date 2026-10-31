Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793414393;
	b=PRYfC2hWAnQkooM69YgMP2DpzEO51gD/ahtcIFf9x6pCrmdXWlbQ6reuQV4hxp5jsnSR
	 h9ducU8x2pWT6s/KdndqQ6ALWo4bRu8IRX2lx0v0pH++1uKhKG16Yfm3NQpozsKxYE9ab
	 KjWFhP7gYOTAQIipMWW6rq6n2CvG0oVKNMKPgHiG7i9nmfRDsRae0nmH58rtuTty3Ce3J
	 kSZLmkel4K5cr55Z80i+8jVy7uoVrAvwi11+paxJSz+rjiOE25X+BD4jH8DXvljOQgDOB
	 Q1bUGA9yu5HA2GVTZGOna6WQinNkmWl20rj/lhHnw5J7y4OqnIDmCyp1f1HkUv/eTfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793414393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=piM8eBA62VwSbnQR+cjmfd8LxrXIq2seOpkUOZ9qd4E=;
	b=VOzuwcNzaIDmX9C0DbMqVtud6Hs/xB5A0ZFLBQvFnoAY8X+nQntbYy68BXMitd7D30Cu
	 52fmsbOffSnP8bmrMHDiqiYXIqFwJeUPo26cPSKeEQRybNIyG07ma9sQVF0iHv9h+4wtU
	 k9Rtm1AsHAZRAyYL9ZEAlY+pAl1LwzbYXBRXWT7Ob12qRoQjQb+UtAFhdoQ6zClkbw5lf
	 Ibak9/ks8obaCDAEp46v619t4lDlFts6od8pM46omdai5pwF41fAgam2JmOARt0gM/cDg
	 0hoNaiPnOezHJTQXchfF5sfqNWmcrqVmKwHFG+8IFurN9vIAlDhvqarpqs5cgBnt5zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LeRni7od;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47930606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47930606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LeRni7od
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2243237eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793414392; x=1794019192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=piM8eBA62VwSbnQR+cjmfd8LxrXIq2seOpkUOZ9qd4E=;
        b=LeRni7odaRZoXAvnLaclH4vnpxuCG3bxk+dXiY/g0FKl+yrvI1QqtiRFcLbmej/qaY
         cQ/L9gPjCJ5UpYHpkZ4tuqu+ZRSMquNWgCXlHGNs+AUKcIdsz/7/FWgZ1fiWvZXHHRrp
         TxoJyFErfbEwgh09SEPG0hLL2TyGRFpXTPI5FiTQu0QetUbHRyxjn3bf2EUuFkUEGcXM
         p6+cBjy1K2Iaa3MzBBOdNYsunWrGo+UjowMpsFE5fn3hYzF4gV7ULvruzZHGC7/RyvCk
         LdyF5FWz5AydyAfYbGndCi/9UiLrpIN2660YYJB8S/WcUcoASvLWssEzz24d49TmNUCa
         BCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793414392; x=1794019192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piM8eBA62VwSbnQR+cjmfd8LxrXIq2seOpkUOZ9qd4E=;
        b=IMDfSZE6350r5Ucp2uCwzu4mzDARsEAFIUI4hgaKxQLcCAlTDJE93hXPs/iDl32Vv4
         3XyW8YSxsuWtncosAE8ansFZ6atFChnPDoWdRniQrzR2hZieGzPqZXCHlYfLwxnDE0wB
         24uagOVxRImWuGt+Khfqm5+tkbTd4SyUd19uznPeVJ0SEiVMswb5iRSAIJMjhSi049np
         6s8P4gxtmIOunQcZ85h910wXBoaWe0ig2442Xr8tluW57zgxeZXWt7bBC8wpzQJI0hgB
         oB3R2lRphNHPkE5dnDG6dJ/vlm9qR/xZ0wAg1K6XdYwSnkIWr/Db7IjC3oQmCvBrC+lO
         FzcQ==
X-Forwarded-Encrypted: i=1; AKwUvByg30fctCOHTu9cbWBwcS2bUFYFUAMfsXax6VeQiGYtXAkzoxBUFPV512Y2Q8d7n+5cDoqht/UZHmnF0i8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJs8hrHcOu3uGQfeWqi95CRRn7lrb+8QXppsWr0cxwOKF310/Om
	PfIab6W04bZj/bHMHjcD4q7rL98EdsWTLvpwMYgiHMQ8PsHm64fYZu5/
X-Gm-Gg: AYBFou34JPNE8LKu/Th62a00rKMf87cLW2sgOmZO//9KXRc4zZbQDHhw+ST+E+v1Qpd
	0FGHYQRxKtDm916iH+4FEyoDeDaaBpXM2xKsihu1kYrdmJLfW4miYrnllH30YElCcil9tsyX98s
	e/TJQ0iUse1yU9E+N0chl7/RZZdKF+2xgc1zpw03Y098/m6+qVZsUzvFIkbxfAY9TV2kNpYiYWJ
	QLGY5UTEdVSFRhSI3dK03JJonzy98wgh2e0oIibJRRpuWxrtI/7UkVXDZwq1T2zOLRdbG5IkOsX
	49yHO6ZSlc9F4spW7wbLZ/PMdGU4qeZafvpEtSJ8XluR0QvYVPkw8AQfjEMcoS6X9Bnl4P0xyBQ
	vPRIUekwdeTbksq3PsFkKjjDBwRGHUBVLdMGl7ZFfIsKx3g7GkKJfImIzDhUr4eeTyJ7rDnB74b
	Pa6wldaLV+sQ/9rVWvAoSplJQ/vhnSoJ3YOhJg46p6schBCSDAgLbFugkJT9pYt1ve8xB6jAg3s
	lU2qDia6r6n+7+GE2hmi1bhBWBRvuz+8DiBuVCX9PDKyb4mY98zQe8IHfNQUCUSXyCY9J95Yau3
	scGQS3L+T4pEN1SFxG7B3YJHWA==
X-Received: by 2002:a05:693c:87c6:10b0:367:5e31:ce29 with SMTP id 5a478bee46e88-36a42404ab3mr6235454eec.20.1793414392190;
        Fri, 30 Oct 2026 19:39:52 -0700 (PDT)
Received: from spidy ([2401:4900:55af:1de3:e93d:d70:4a7e:784d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429000f8sm11231278eec.13.2026.10.30.19.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:39:51 -0700 (PDT)
From: Gowtham S Bhushan <gowtham398gs@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gowtham S Bhushan <gowtham398gs@gmail.com>,
	syzbot+41172204e7323356ecdb@syzkaller.appspotmail.com
Subject: [PATCH] spi: core: do not WARN on OOM spi_controller_id_alloc
Date: Sat, 31 Oct 2026 08:09:42 +0530
Message-ID: <20261031023942.591298-1-gowtham398gs@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In spi_controller_id_alloc() (drivers/spi/spi.c), idr_alloc()
can return -ENOMEM when radix tree memory allocation fails 
under memory pressure or fault injection. The function
inappropriately invokes WARN(id < 0, "couldn't get idr") on any
failure rather than handling expected runtime allocation errors silently.

Modify the error handling path to only trigger a WARN when the failure
is due to reasons other than an out-of-memory condition (such as -ENOSPC).

Reported-by: syzbot+41172204e7323356ecdb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=41172204e7323356ecdb
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Tested-by: syzbot+41172204e7323356ecdb@syzkaller.appspotmail.com

Signed-off-by: Gowtham S Bhushan <gowtham398gs@gmail.com>
---
 drivers/spi/spi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 40cda0037ea5..a1276d194465 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3631,8 +3631,17 @@ static int spi_controller_id_alloc(struct spi_controller *ctlr, int start, int e
 	mutex_lock(&board_lock);
 	id = idr_alloc(&spi_controller_idr, ctlr, start, end, GFP_KERNEL);
 	mutex_unlock(&board_lock);
-	if (WARN(id < 0, "couldn't get idr"))
+
+	/*
+	 * Modify the error handling path to only trigger a WARN when the failure
+	 * is not due to an out-of-memory condition
+	 */
+
+	if (id < 0) {
+		WARN(id != -ENOMEM, "couldn't get idr");
 		return id == -ENOSPC ? -EBUSY : id;
+	}
+
 	ctlr->bus_num = id;
 	return 0;
 }
-- 
2.56.0

