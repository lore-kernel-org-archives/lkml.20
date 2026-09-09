Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D3249E5F1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940977; cv=none; b=i/MTdJke0uplp5JYmNRKhyNuA5E6rW9Gd+3HGy2uXDPf2x0zKQ+MefAAWwCpmGlY2IHcSQF7dpMHjdQFrUvD+j8VPjRpG+3YOMXFeh+85ciAozslfAbP3VP25tShq3O+SUJwefoQeO9farnGzYd7DFLXSc/Iq/89lANUEtI+ixk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940977; c=relaxed/simple;
	bh=/m0RpJ0u8S5AhBcgXm1RmBFb5U3snGeLm8WGcbiID5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gg9z3pXvqFpMFkboe00ULh97x8lEhmcXQQXr4MJPz4cfoQCecGqFh3PNuAhN+5/nfb9e9UWql1MM/5wQOssDbgAKbbHH1Pd54hByABZaKHpPxApqprnxYC81s9Ipdocm4YmrT38vYO77S541/8OARdyOQCCSF3k7NfV9oXYFI1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1GlQuqd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1GlQuqd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso47949425e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940974; x=1789545774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVDpspAXsp3IRqO0vAB8A/WjYsXTyisUBY8DG2eZLy8=;
        b=A1GlQuqdfGVUGWy8D+0ghB1MHVrUG8KPVFumA5pVVLslWymUDszMXEJYDEKNdzSYO5
         +LVUIOjoRjwlb3Fib2F0f61oJpYWJgVbmzlBlIbBOXvoFWs1llrFpPrZOHNfppHH3X+a
         mRaR45Tu8oq5AKYn3VjKjESQuGwXlDDH5S7q3Ka5ZUBqQuMRj2p4YR1+i8hnLP8kXhXI
         RNT2zothJms6GhYcMHbJlvb4/2Rlh+2WeFwV1vrkA1RJbh3pW1Ndfy5KONxiY3WeWeuB
         o7QmrqKZ2XtCBL+IZss0sPB7braGfJaSi8Vu64j4R1NW4WbMKyFw37L6tzR2oN+2fNYZ
         7IWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940974; x=1789545774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aVDpspAXsp3IRqO0vAB8A/WjYsXTyisUBY8DG2eZLy8=;
        b=eIQQ8HDaIkgCSBnKDlkkG8ufLRB+0E21BcVIaBFCK2JBZEpcEHrKYvuEjUESkklTIG
         YKVJzgvnGGV3vpP575CRAc2d+Lza8xet4fr2EL23N7ScFxudf98jZD4/qTrI+0RSbAcH
         SPmuHXIjncJR4LWl2E+pCgw0uosXdDGiC+ZR2/0q3fKDElzymgk1BCoidHozrmb4hBAu
         vxoZO//mEIhPE/v8Cld0DJElXndT01DYA/O8tA5TvCNMvqFQhWAQWmBWFJ+Bh3L6F75s
         32KYh5ioK4iEmhRRpOeYksgh6gKySAgc4EqFET7UgpZCP7GEbYNPnnOuKFQN9q6186eg
         N1+Q==
X-Forwarded-Encrypted: i=1; AKwUvByaQ6CwOcPNgLVP3MkMmd/Oud/Ad+xAVUMO2/Ksjeo+J7mwQSt+G7A7IoIcOR+nEHZeiU4aXZqTFP0UyxE=@vger.kernel.org
X-Gm-Message-State: AFuF++n0u4o4rlS+3ZpfE8hylaUCfEH/86F1qSTnub+1WBEyoTQYIuTb
	WkYzUJuE6fjkisL4u32uibav5+kVhNzb/OJOsU5OEAAemE+cSOJWdbdY
X-Gm-Gg: AYBFou0qRI6SFqL/1NxUiFBj9O13JhL5w9Gk0n81kWReOSy6xlvUa0w0eiheHMjJHi/
	yEUqH0e/J2xSbOLDkeFGYenUZSoGznap4SeF3y8pZZJWRLjM6rotz5IqZ6fOi06ZANXnGfbJIq6
	QS+Z//ws3+uuEAqaIQRyGJa1M9ZnFXhuE57LIftJ316Y4c9q6OLsl7Hzuv4rMFPZTsfEJ1R0kca
	E0xN0gGCYYXocNmEmgj7TxnYDHUNRPIQEon+vGrZu+331LAMRwZTc7izzxnFefEBZks6ti8kpCt
	Hn0Y9W0o7lQytt80iItQ7v70Bu5X3gEPnZQAoX6o88onRwTWj9nmbmjDmvzXWNUcI4klVkQa75a
	OBphwEeYSnas1oVnH3acXgRic8MfdChgd4vtzl4/Va5ciQU2kJ1DgtLvjRj3Bd97MU7btzlRfwH
	01UynX7WPzImuUIkMHZoHsxWHZFa4nSdyxOT2oFHOhEuDWVJ3ib+Dmbw9BrlOHPj93zQpXhFC46
	XwsRf2Xc8smgm4kmzZfn6e9zvCbA/JN
X-Received: by 2002:a05:600c:3b9e:b0:49c:fc6c:be1a with SMTP id 5b1f17b1804b1-49cfc6cc121mr298320835e9.32.1788940974059;
        Wed, 09 Sep 2026 01:02:54 -0700 (PDT)
Received: from chubuchnyi-ThinkPad-P1-Gen-4i.lan ([158.173.155.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm412817125e9.3.2026.09.09.01.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:02:53 -0700 (PDT)
From: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	mani@kernel.org,
	michael.riesch@collabora.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 4/5] media: i2c: ov8858: Add missing v4l2_subdev_cleanup() call
Date: Wed,  9 Sep 2026 11:02:26 +0300
Message-ID: <388522f369605158e040af66390a2a518f3e38a2.1788940469.git.chubuchnyi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788940469.git.chubuchnyi@gmail.com>
References: <cover.1788940469.git.chubuchnyi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The subdev active state allocated by v4l2_subdev_init_finalize() is leaked
on unbind. The driver has no common cleanup helper, so update both sites.

Fixes: e14d3ac81bd2 ("media: i2c: Add driver for OmniVision OV8858")
Cc: stable@vger.kernel.org
Signed-off-by: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
---
 drivers/media/i2c/ov8858.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..2076620c7 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1953,6 +1953,7 @@ static int ov8858_probe(struct i2c_client *client)
 	pm_runtime_put_noidle(dev);
 	ov8858_power_off(ov8858);
 err_clean_entity:
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 err_free_handler:
 	v4l2_ctrl_handler_free(&ov8858->ctrl_handler);
@@ -1966,6 +1967,7 @@ static void ov8858_remove(struct i2c_client *client)
 	struct ov8858 *ov8858 = sd_to_ov8858(sd);
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(&ov8858->ctrl_handler);
 
-- 
2.43.0

