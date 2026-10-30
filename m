Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348620;
	b=rGIkFrIyCpANacochaBJLIAhHbXqjLyYir+kiT1yMbdTqNAHC9ZZ3BP1Xxa5BtBw7S4Y
	 b1cy3dTYYwYMHVB7mrI2+DE6UQCkC2BL0bkkborSLqctrdaABTlWdaPbSavyvAwvt1Mtm
	 TVRE2wt/BnMSrZtCgNg8pzjAPwmC9i4le1T5SGEuNw4Dp3n8DAT7Hfj+3TcASNP9aB4ee
	 LbPOlnEJQ6T/e3oEYev+OTVSA02M/p1xwEl+QQpVS4ZnczQ9fFxWJol1DTsHBvc2I7KGA
	 UCCp13HN/1jhhkA4TJ9tPUXj1Hhm9SvZMtJeJATiAgLnAb313AVDiTP1lqxXPS8g9Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zKfMVQP8od4iZpgtVKrymgT3rG+VRxSX7EBWgqm4V80=;
	b=MRdUb8dI2NG2T0ODsZLhsjXjV/nBnmosEH50ta+73CY7InGbq/uuZ91aVifcTV/Hx9Wp
	 m5jhOsSxa933zeo7YuOZ6kEaSaXE+z1etVTJpcysYl/G+xbjF9atoNY28pD/8hxUGDYpd
	 yAFGN25cdr1T92JWCqV5pI30ee4pSI98EHgnolHRPBlThjFOmz/IeLUYcaA0HXWlakqUo
	 hjMqK1yoakuaMGkMETD6/nOI1BdfJ1fmRe0+09uNod85nBHnVb28xhcWpsRw7YbDFelzF
	 yMnGZtH1BiUqPSkVmN6lERxwFr320Ev4wCjiOjWoKVv2bwOTiSJYvckzSnKYaO7zGcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="L/1GsL6A";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31964606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31964606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L/1GsL6A
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso643416eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348619; x=1793953419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zKfMVQP8od4iZpgtVKrymgT3rG+VRxSX7EBWgqm4V80=;
        b=L/1GsL6AlrMsRx+CVkeNq4CT6jAWM2QzQbsEeFBy2FlY6IZLlFeuQzVwKhsGa54ijB
         R0Dgk60OVk/eFruyRAZqC74HJYdLoQwJd/BusD9ktSxb20C8+NMxui3NafEGL2fkGLFt
         zrStcNzrcyD4X80NgGkDL0IgGSZGi87M+oXiHJzMK2wJQmRvQ2aDNZz7/DR3SvICc2Fi
         rcyGTcjcVk4GuM+BrpE9XkiyC2EdWYMbcZQg4C/wtgFambKwIkzbyNir/sa16kvMLmB1
         /rG1JmuBfyPJ3dBWdVsVW0dU+njlKxfI+FOlmQKc7iC+CBRYiKTW7tVLRSQNQwHOOvp5
         lOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348619; x=1793953419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zKfMVQP8od4iZpgtVKrymgT3rG+VRxSX7EBWgqm4V80=;
        b=CXisanoZVVdnhtzl9/8pMxJD8x/bFAJ546cDVBYrSqAW0nLnQEq4pqcJoirjVP5gh/
         Vkr10GE4hYnRSz4OYC1BkZnoN79V4v/p5uhK6YWC9/VgSyjZAstwmoJqGvodho+QHWSE
         ydXd4JvktYwwz1hetlq/ZcxcqgQ/h1Oo37rJFzq7uV4KpXNoJfm1AbyJ+Q2Tgbz7RA54
         3jxbK1PK5c869CXlYdvEGQx2D/A1+h3GgJncI2uW7iM2xel9BxOt+nq773iSwObFVSDV
         pL0eIr13wGnU+g5KbEzOJvbFPbL4by24UJvFUKNIIb7+KDpba9a3/co6FfpkjyfHmn3A
         XC4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzXlIF50EvQ+nsLUAPJRTm48vgSwBNlMujhD0AimD7FymcMBK1pdxNY/lBu52d1dT2VrheIXzN4D2h/ZvY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJtiqFQxPyoR3H3Tnz97ExhBVH1OS5/scaXnFg6MoHDSgskd33
	47vrIVD8agaYHlKAxkhr52QfG+RjUa/p/OEkRXycZeZglV8w0+dlvsu/
X-Gm-Gg: AYBFou2RAKYhUaoIPFkfwOZ4OO46wGRYJkUwVYrVGZv9oLKzpHeJJ6QFuJUZv220b8b
	6rASLlRyNMWk6MI2RcC0qsJQ3jgwVJHkYqzugVEuoVJqcYbXR6jtpyGyDx1S4sPsxBfsUO3C6PH
	Xs1Aik4c2Ty/XfP16TbHJrKPmjiXe2PDCZbeY7TcEXSA5A3deGHKyYSYTTyCuRzMvYNJzpM9Skv
	Msu4Ee34xBxKrtz3vf3XcuOo+of+w0PyXOt9syLDURp/UmBdYNT3BLRirtogyWt4hWXH3uun6/b
	tuMZYGGbloV6Qz7JCiH2nLTUtvnz3Kao8OCot9i4vWIbLr3lguJtKoPlZAiABjWPv9TiPWaJNkQ
	k8k+Q0y+iDjNHV7ZIEstcUoig6++lk1LbzfhorhjTB4zLlnZtk7v0eByMmtXyl3OG9qUiYVbbcn
	uKM7ivnZ0v+IW6YKHVCHFsVfUv7X0UCFFnxZ+/cdT91RG2StVqI4kXBLjaQDnbJsLzepteIj33M
	1+pRlowc2Sla8qA9weqFyIt/zWYRSTahqEB7M78DpkrbFQ0NkQiC2ZLaSfxhQjhzHxeVYPORmrb
	FekmLN1Wj9MosEd/NMP/GHoP2JsznjYmPZYtLIt0EidVCrsLjDeDOzADJrH+UYru8jcGvDxcOXq
	T1XVo0IAwyE0=
X-Received: by 2002:a05:693c:400f:b0:369:f72d:1010 with SMTP id 5a478bee46e88-36a423af96fmr2930709eec.18.1793348619040;
        Fri, 30 Oct 2026 01:23:39 -0700 (PDT)
Received: from chitransh.. ([106.221.205.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm5999986eec.26.2026.10.30.01.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:23:38 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com,
	srinivas.pandruvada@linux.intel.com,
	david.e.box@linux.intel.com,
	irenic.rajneesh@gmail.com,
	qipeng.zha@intel.com
Subject: [PATCH 1/8] platform/x86: isst_if_mmio: switch to devm_mutex_init()
Date: Fri, 30 Oct 2026 13:52:55 +0530
Message-ID: <20261030082303.284271-2-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
References: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
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

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Replace mutex_init() with devm_mutex_init() so the mutex lifecycle is
managed by devres.  This removes the need for manual mutex_destroy()
calls in both the error path and the remove callback.

Since the only action on cdev_register failure was mutex_destroy(),
simplify the tail of the probe function to return the registration
result directly.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 .../platform/x86/intel/speed_select_if/isst_if_mmio.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c b/drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c
index 950ede5eab76..0a3fdf6b8bca 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c
@@ -124,7 +124,9 @@ static int isst_if_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (IS_ERR(punit_dev->punit_mmio))
 		return PTR_ERR(punit_dev->punit_mmio);
 
-	mutex_init(&punit_dev->mutex);
+	ret = devm_mutex_init(&pdev->dev, &punit_dev->mutex);
+	if (ret)
+		return ret;
 	pci_set_drvdata(pdev, punit_dev);
 
 	memset(&cb, 0, sizeof(cb));
@@ -132,11 +134,7 @@ static int isst_if_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	cb.offset = offsetof(struct isst_if_io_regs, io_reg);
 	cb.cmd_callback = isst_if_mmio_rd_wr;
 	cb.owner = THIS_MODULE;
-	ret = isst_if_cdev_register(ISST_IF_DEV_MMIO, &cb);
-	if (ret)
-		mutex_destroy(&punit_dev->mutex);
-
-	return ret;
+	return isst_if_cdev_register(ISST_IF_DEV_MMIO, &cb);
 }
 
 static void isst_if_remove(struct pci_dev *pdev)
@@ -145,7 +143,6 @@ static void isst_if_remove(struct pci_dev *pdev)
 
 	punit_dev = pci_get_drvdata(pdev);
 	isst_if_cdev_unregister(ISST_IF_DEV_MMIO);
-	mutex_destroy(&punit_dev->mutex);
 }
 
 static int __maybe_unused isst_if_suspend(struct device *device)
-- 
2.43.0

