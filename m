Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B003218BA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790250550; cv=none; b=f9n8ZK1Ob0Do7ceGE+ahZmhCKETYxk7ZR8huxOmkVYIeUoyVQ3ZhxR0yEmPA3sfv+MvHyhRoHFs7DC5l/jCghgreXNuK2FiH6MiVdKM2NaImP1RhhYfpAnrPCPswRAZ4y0BAk5HVQbLBXewkAR3J+hK7nRKyTiQ8aHrnq65MJFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790250550; c=relaxed/simple;
	bh=OcsDKXTJZfmq0qIGGKf9E+bKmE4xgkEDDiDzEYV2m/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nFLYZHB+KYUQ8q6f5CCz1lj+2itgi6M2h75ce8ASxnGrSl4XxofDTnSUibkm5mwoPeqtbwM9oadlhumw+1yhQxv02fw1m9F97o+3azy7EdnotGya4Ph/f4MfcCBSf2RIgItBhV6UnLuYHSBkzeIwQ71eDlCK73FR59gWGGsl5kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuCCpQ5E; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuCCpQ5E"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398cb5615deso1463675a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790250549; x=1790855349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6lZ3igjwc2yFqwfsFsDo7+TnGLNfpdbFLRcAS++D8X0=;
        b=iuCCpQ5EaEfmLzEFZQ0XLujL966DSVoElM03JhzA3klvxReFwBWDu5+sr6HKFayk2g
         qInomg5FDKbFoJmnCn7sbMxYlyqWIw+zbg3f9FZEjmvWwDUxcjCRKyh+2faEQbOWq4bS
         AaG9t8KJkJ65FuRkgb/+8F6UixUWF8BOfE1w135tPqq2PrtmX2htnmET41f6C4QoDUJ0
         RdMIdoyzHVEkIA31XEJ3KZvpFysOjiyxJqpkFaN14kt4v0LaXk3ol/M6NRMiDipk/rgP
         MQyTt3hOJOI0ej8IO2oVPQk/fIkpwNaCu/rLrzG2+IMVXXe3CLiCEkQeqiRm1gtThwme
         /E5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790250549; x=1790855349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lZ3igjwc2yFqwfsFsDo7+TnGLNfpdbFLRcAS++D8X0=;
        b=nhoBbzr/bp4bY8cHSvGfrsfr8cYNoXczEhBxn4tvnzxGPOrXH6xBk/gPQpzlXqf7F+
         jGuI4z9VNNSl1foUSRqMu5RRZHGYt1qiGb0r8NK7enCKnZ4yS3qEGYrtRc3nKV+B3MHa
         mXq57MR88kQwDaFbar+rztXDGRGnFtfqASAdcXvhIqBHu+93FOuCJfT3PJfKL7jvlEic
         7PBBozdInMgyfdtSXtEdnIqpFGWU7qmqL3dsmB9b8cGXlmN/CVBhmZOCtdfB+EUMuKU0
         x10zkRjojxgKu5rqQJUcOHuVZa9TdjJTWcfUSGlETZ6bfSCwkDozbIKeurNKNAV2QX1n
         u9Kw==
X-Forwarded-Encrypted: i=1; AKwUvBypVvuqFMRT3wdAYebHonIUGd/XgZG+80LykjgF+AXPwPEqSIyx/WHgEGVrnDArwoGMf2+udjrRLzx/nOo=@vger.kernel.org
X-Gm-Message-State: AFuF++n7Sm7pTXOKgIAqWVrc8XIT7ud+ul0KUUdKA891ljEbswN2u68v
	HBK7fuNcyiBnuHp0IcpboM3UkknyOUpp/rZRx8zyjfN0drx0CrSwB7eQ
X-Gm-Gg: AYBFou14UIY1elvoW0RwyTlgSms2b3DCkG4Qezvo+Oof4+LCnAAufwEpDlOw4txgXls
	hPSatoRr8Y6+t7Ebmn4zYVj/l8HCe1VmhQt7TqMJR31josXLK0kCpK6HRsI284+tAvKqFn/TKjy
	1eA7Drxi5JpLJUbF+n2tu70p4a/zmYF72tKXLlB58JmyqrlM2krVHO80Hdd9HJ64OzPzhhplAnm
	f2Vf/k6O5i2jsFxafOGl3qAzejP5BMy/iydw3CNxTpwwLW/6exJxtc+z//P+HAKji6UalfriO/g
	poxE+HaelA+dzgNGv1Ei5yLdA8XKAPXNhGiGHBt2AatKfSJH7X+krpNp9RZBvpdRnSmgz0fohKb
	B8bSLwLjnjyfpGqbMRDMrdUJuhpcdtdJKMW/ZvqbTS+pQvUp6DaazFyZtcvegJ4foCidUss/NgD
	d1/ffI4k/GDtNRF/FkloQZcaeCC7syjBXL5u1bkrhkXBL7FHK3DYWE1w==
X-Received: by 2002:a17:90b:4acb:b0:398:b1eb:136c with SMTP id 98e67ed59e1d1-3a098d43e23mr1937592a91.9.1790250548551;
        Thu, 24 Sep 2026 04:49:08 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a096b8753csm4771097a91.0.2026.09.24.04.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:49:08 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Guangshuo Li <lgs201920130244@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Dan Williams <djbw@kernel.org>,
	Maciej Sosnowski <maciej.sosnowski@intel.com>,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] dca: fix provider device memory leak on domain allocation failure
Date: Thu, 24 Sep 2026 19:49:02 +0800
Message-ID: <20260924114902.1577261-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

register_dca_provider() calls dca_sysfs_add_provider() before looking up
or allocating a DCA domain. If dca_allocate_domain() fails, it returns
-ENODEV without the matching dca_sysfs_remove_provider(), leaving the
dca%d class device registered and the corresponding IDR entry present.

Route the dca_allocate_domain() failure through a common
err_remove_provider path that calls dca_sysfs_remove_provider(), and
reuse it for the existing dca_providers_blocked cleanup.

The issue was identified by a static analysis tool and confirmed by
manual code inspection.

Fixes: 1a5aeeecd550 ("dca: registering requesters in multiple dca domains")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Use a common error path for dca_sysfs_remove_provider() cleanup, as
    suggested by Markus Elfring.

 drivers/dca/dca-core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/dca/dca-core.c b/drivers/dca/dca-core.c
index 583510850fad..1acfae12d689 100644
--- a/drivers/dca/dca-core.c
+++ b/drivers/dca/dca-core.c
@@ -360,16 +360,15 @@ int register_dca_provider(struct dca_provider *dca, struct device *dev)
 
 		if (dca_providers_blocked) {
 			raw_spin_unlock_irqrestore(&dca_lock, flags);
-			dca_sysfs_remove_provider(dca);
 			unregister_dca_providers();
-			return -ENODEV;
+			goto err_remove_provider;
 		}
 
 		raw_spin_unlock_irqrestore(&dca_lock, flags);
 		rc = dca_pci_rc_from_dev(dev);
 		newdomain = dca_allocate_domain(rc);
 		if (!newdomain)
-			return -ENODEV;
+			goto err_remove_provider;
 		raw_spin_lock_irqsave(&dca_lock, flags);
 		/* Recheck, we might have raced after dropping the lock */
 		domain = dca_get_domain(dev);
@@ -386,6 +385,10 @@ int register_dca_provider(struct dca_provider *dca, struct device *dev)
 				     DCA_PROVIDER_ADD, NULL);
 	kfree(newdomain);
 	return 0;
+
+err_remove_provider:
+	dca_sysfs_remove_provider(dca);
+	return -ENODEV;
 }
 EXPORT_SYMBOL_GPL(register_dca_provider);
 
-- 
2.43.0

