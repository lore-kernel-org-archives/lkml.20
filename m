Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AC9392838
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733340; cv=none; b=SClSiJhziQpSLnH2ReX8uwxecANZjGI/3L5fNG9LWja9/Xoxj5UXyQXGpeDjbrg2mC9w5UE8AhFW1kvyzXlbToZBCh2T0RzNJROj2NbAzMNfDLwOjpP4CB2X0MOQ1DG3JnyvdrI5SOyxgNkijSm+2F3TNVWf3URm7JHDF6+BSTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733340; c=relaxed/simple;
	bh=D5wAVqifshoGV6GyWkI3fNfqvP+PxrNLxNJ3PFw/AL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qfO5BSOd7gnJDXC+W759S9uW5YAy6Tfm6C04KCtMmT8OT2KRq3FKXmiSHb20lr5uh3nLf52YFSjpCR9s0N1AjPVh3VPR5pUuo1p1FH8hF9z2I+TfmDhZoXIbC1Mr9qIXSB269jMTA1FpGI183lM//uMcrqtm//3UG0W4ucCC/EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pJhOG6LG; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pJhOG6LG"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so590569a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789733338; x=1790338138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ha8wUO0vAad7WPPmqJPILgb1Ew3Bf7lbxU7bR2Z218I=;
        b=pJhOG6LGq44KPdP6BAVT/qIW82Xlu4qwgz4rRjfAmOJ4yOwjilC5/+fh07tl5Q0ojL
         gAg5qBKw+4v90uM+vGoTI50alwfusrbtgBwxMGHKlIW9ou9PAF5OAFmIJ9Xu4tLSr7xr
         66biQOPl1MSHkBAyM/sV803VGBPaHkGZtXV6Q3OERgtgYHPuWYHMyB6iadX2+8Isx+IR
         tpj3H7ImoeoCbL3wIbdVgwKtqeZEkPCVbll499bluKKh+fAMRDNVVa4ohAUJiDsnqeaP
         AmCEqvvlctnAjDEPdWk5zeSVrD+gNp/DXLIK4zuhxlOjlp3V85ngs2dfEbhU0t+BrXRZ
         Pvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733338; x=1790338138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ha8wUO0vAad7WPPmqJPILgb1Ew3Bf7lbxU7bR2Z218I=;
        b=a3O2q7hrCUMuIxYv9UXmVZiTX18sbeN7sXi27KwiIsSXTHZDNyZlI5C0XtyekcrjRs
         gaLnakOLQyEHfuqHqwBsnh8s7Nsof1UYL3P1X7ynmtIdh/0sVY0IKkuw6A/WneDPPCfF
         HEKv4Vr4asAqxjDOszFg/5TmKZgMbrt1hbEHXsaeypXUYYY+HgStyQPHYC+vpy904jnn
         Z9FH4BTC+O1LJAtZyJXEkMoOgLbHAfi9b7rIcjCNNDskv/8xhZQonP/lfpMn/4z+yOtL
         FDuif9jfr+EUtIjSAcc1XIRp/J0Xkio/dCB4Dq6fhSbvy+E1D7tus4XKBwJTb8pmnsOl
         lPfA==
X-Forwarded-Encrypted: i=1; AKwUvBzBOyrYqDM1WxE1CzpLkMchgdSHuWqPZWAMQWxFbOnxpz/WP14cvvwk3OXcNQb0DvWQWHn4teRb+f54GQA=@vger.kernel.org
X-Gm-Message-State: AFuF++lKrjYIxyejZIKQuSSXzQH9gaJ3rxZQvmXhjXSKIVXk02++EOCL
	wGqxbgC3xTTmgPxs83XLVccO5tjhQR8hM1+d8bM5lFMXKqOiBsDIqN6c
X-Gm-Gg: AYBFou1VXg2y7mybyOXof0a2Hw3as2kmMtBdxR0S75ydGfJFRXpnST5ILXeqf9beh8e
	nt2HGYnT9k9yrfI8fYCF37Bx6f6oNH0WdJARbC4ZpZYw9CbKBcJql0Qp1rytrgmCvuGVf4r0kaV
	hiGXMM41K4YUsfh62c1q4n0Zar2ZdjT8MhIMNh6cguGM6usoU43s3IyYhclEeDXw+4gv5MMjB4k
	rNVs2r4WMdoeneFHMw6mpn6VZ1DPLkKhKeIRXu1XWm66Z5RT9LVg5m7fFTXmJo4GSSCJbvwFbl6
	GwlrVOTCrs43XPsC6IsM/IUzuiA8j3wGL8M32U6NraUi/IXMqKxgGtuz0jI/+L3Ess7oCb9G14t
	YQ+API70Zix4tFdyWqRWSoUdQiJqisYB3L9ouWtqItD5ZPlMuHFdQ95s/jJcG5fBw9KlIUFHcuC
	LnUQAb3Dj00hx6Q442qEVmByNJ0YE0dH6R8fcB/nzomWL5Vd0KakxkGEGlt2+QpTEmUCI8l8YrN
	6U4p1Q9QhcE
X-Received: by 2002:a17:90b:398c:b0:39e:1c2c:1d4b with SMTP id 98e67ed59e1d1-39e54bcd0a9mr5392355a91.11.1789733338063;
        Fri, 18 Sep 2026 05:08:58 -0700 (PDT)
Received: from nevers1dd ([118.95.161.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c28180a4dsm5257193eec.0.2026.09.18.05.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:08:57 -0700 (PDT)
From: Siddharth Karanam <sid9.karanam@gmail.com>
To: nm@ti.com,
	kristo@kernel.org,
	ssantosh@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Siddharth Karanam <sid9.karanam@gmail.com>
Subject: [PATCH] firmware: ti_sci: replace kcalloc with kzalloc for buffer pointer allocation
Date: Fri, 18 Sep 2026 17:38:39 +0530
Message-ID: <20260918120839.207459-1-sid9.karanam@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, the buffer pointer was being allocated via devm_kcalloc that
would check for a mul overflow before allocating n * size bytes
(size being desc->max_msg_size), but since n is 1 here, we can instead
use devm_kzalloc that allocates the size directly.

Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
---
 drivers/firmware/ti_sci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 33d7c4a4181e..8e346440e539 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -4132,7 +4132,7 @@ static int ti_sci_probe(struct platform_device *pdev)
 
 	/* Pre-initialize the buffer pointer to pre-allocated buffers */
 	for (i = 0, xfer = minfo->xfer_block; i < desc->max_msgs; i++, xfer++) {
-		xfer->xfer_buf = devm_kcalloc(dev, 1, desc->max_msg_size,
+		xfer->xfer_buf = devm_kzalloc(dev, desc->max_msg_size,
 					      GFP_KERNEL);
 		if (!xfer->xfer_buf)
 			return -ENOMEM;
-- 
2.55.0

