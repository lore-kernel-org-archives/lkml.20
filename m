Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39553E7635
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789094850; cv=none; b=FX9QEgepcXl6pVdOMntrvTPQ1oJ/T+fTnK9zWSqru4TRO1HESdyM8aaU/WqJy9yECw1Uf6EZluRKFhlQmrPSSSzFVqdBAo9FSDDbYASnCAR2TXzV5REYCCxZ8t1ZrbeJLNxhmXfCvDPDORuwlrvq2xpOW48Z24tXefMiBTTvEGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789094850; c=relaxed/simple;
	bh=Q+vE+X+sG/ZYk8rkcS5IYVR/ggcGiu0wbko6eWTdm1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bDqLsZy73cv1WrsSgnpQS+JNWKYFu/5ngtkdl8rROLepRaRODpeFxbv/Sct/+8EKr+w7jda/TOqmmYs0clJH1cYfaS+bqK8MXiogr0m/Kj/H68O3df0yCzbOULd8XTNbRrm4RH973cejL4/57pRw+eB1o5vzPxrpnJgS7/vLsQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KB+BmbwS; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KB+BmbwS"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d6e954afbdso2702695ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789094848; x=1789699648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4VRnd7b8ZPPVwC55w7njfDr576OvKBxuHB8QDsx2Fm4=;
        b=KB+BmbwSTZHuPx0pP35Vp3NGj9m1+h0BBVGFgob1gVqIDdJwxNsj15uol0PCLhLwCc
         hxlz+XACn1ey8u6ybj2ynG3treyvdIOTYJA7wENFI8mZz8Dwd35Bt1axOc3SYGkKm0Y1
         hW9G8A3x3dJbAKvJli1ttuBlQVQ2mnZnuHr/uV4E9TslALNQBMStdH+gxVBViczNfs7u
         +HXSCzial1FIdnEwP6fzbC97QydglctiaeeQESjP+WBSJMeRMGQm8TqQaoWhd0K3T57D
         dugGl8KbjzwIb8usCY11uWzY8EbNEPLhjGAjHfLowF46sLowg8O2nZmuicHNP6dz4zD4
         lHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789094848; x=1789699648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4VRnd7b8ZPPVwC55w7njfDr576OvKBxuHB8QDsx2Fm4=;
        b=Hp/Bd6Ze8Crt+11g2uZHMhhjQRWcCaz7Sez94EzYTPvnuN7fXL3b5JsdvCxSEesG93
         B03bkr0/vv5K0yf7jR0kz95UeQDxwUKRPorMPqg5HOfQvBnbndIFNP2aatvNOgbzmFj3
         vgCMX/j7oQq7k0c48uD6jyMShyjSU7t1RV/h+nRswyctemwvXsbAQ642aax6Eg+UPoZP
         +6G9t7szKhxw+lLfuapmie4pwpiJ2BJPggniopjzO37AMk+oe6lLFXVo9rBZ+VQfQvk/
         aQEg72Wex1FO40V40m/tU0GGtQRPnj2DHxU5kRlhuAzmt+GpXBAUZ+RtO/9JOi76+vpO
         WkBw==
X-Forwarded-Encrypted: i=1; AKwUvBzigbehm+fU4GvVWyrlw9+8pGhCRAY9adeJnRUUZm02EVmBWpXs9TJ+80iswkNGe/BBxYjn9GHG3nz4Fak=@vger.kernel.org
X-Gm-Message-State: AFuF++mzuoCFgxcwCoCUPerwumO06dSX4ge0mc8Rltx1e2wqghkEzgx+
	Z0kubuhO9mselrHgX/K320EcM5uBleN4kEiDGJ+NAIR7P0R5hCK2EfXs
X-Gm-Gg: AYBFou0wU1N3A/ri3iO3oTe0FGi2bFIGSqK1KcjJ0D9qeptOUU0rXwlSCTQaabnIqu6
	OeDanjFHmnHLUPLu6Sg4H4eXcxnAqh8nYqx52hB5ekeIMVPcx2Gg1cpkynRrcd8yXTuvCGE1F+/
	4Wo0whqUYJ5a/YpPhwz2TisprV/34XdPEvWj+V0xT8boDm+dEFgSECBP8bAk3pVWQKR7Lrb2ZoK
	M/CL2WxLiemPaeU/DzN9mtijc04NczwbL7emJGGZsTfuRaKjtPAwmRiD0JN0c3ZhlgX+JtSrd/T
	8ux3LhRK8WyOnb4iMQ5RkZoTK9/OrllDkg4NwQhJxZZhW5zn741jrc5R0ai+ceLaJfir9gVM/2B
	GsVmGjyp/dvMiTru8VpOBXw6opQtRe3XqgZ6VKOFlXZvmiS/TQDMom4eTsXWJKVMGucbcLfi9fL
	uHdk5VOem7rr3nP1/4nV+m7XpOr7WuhSsfJFREKGQXojFbEmvQjFtdYKB2MrR/OXKX/oEGomcDY
	GG5EXhQpezIhKy+rQ==
X-Received: by 2002:a17:902:dac2:b0:2d8:f965:7e48 with SMTP id d9443c01a7336-2dd2a1bfaadmr39930245ad.1.1789094848007;
        Thu, 10 Sep 2026 19:47:28 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca26c2sm4129225ad.10.2026.09.10.19.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 19:47:27 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: ashish.kalra@amd.com,
	thomas.lendacky@amd.com,
	john.allen@amd.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Cc: alistair@alistair23.me,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] virt: coco: change tsm_register() to use a const struct
Date: Fri, 11 Sep 2026 12:47:07 +1000
Message-ID: <20260911024707.3485954-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

The tsm_register() function takes a struct pci_tsm_ops *ops argument.
This eventually is stored in struct tsm_dev as a const, so we should
just change the tsm_register() register function argument to be a const.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 drivers/crypto/ccp/sev-dev-tsm.c | 2 +-
 drivers/virt/coco/tsm-core.c     | 4 ++--
 include/linux/tsm.h              | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/ccp/sev-dev-tsm.c b/drivers/crypto/ccp/sev-dev-tsm.c
index 46f2539d2d5a..48df8c579c74 100644
--- a/drivers/crypto/ccp/sev-dev-tsm.c
+++ b/drivers/crypto/ccp/sev-dev-tsm.c
@@ -339,7 +339,7 @@ static void dsm_disconnect(struct pci_dev *pdev)
 	streams_teardown(dev_data->ide);
 }
 
-static struct pci_tsm_ops sev_tsm_ops = {
+static const struct pci_tsm_ops sev_tsm_ops = {
 	.probe = dsm_probe,
 	.remove = dsm_remove,
 	.connect = dsm_connect,
diff --git a/drivers/virt/coco/tsm-core.c b/drivers/virt/coco/tsm-core.c
index e784993353d8..6b735ac2a814 100644
--- a/drivers/virt/coco/tsm-core.c
+++ b/drivers/virt/coco/tsm-core.c
@@ -57,7 +57,7 @@ static struct tsm_dev *alloc_tsm_dev(struct device *parent)
 }
 
 static struct tsm_dev *tsm_register_pci_or_reset(struct tsm_dev *tsm_dev,
-						 struct pci_tsm_ops *pci_ops)
+						 const struct pci_tsm_ops *pci_ops)
 {
 	int rc;
 
@@ -78,7 +78,7 @@ static struct tsm_dev *tsm_register_pci_or_reset(struct tsm_dev *tsm_dev,
 	return tsm_dev;
 }
 
-struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
+struct tsm_dev *tsm_register(struct device *parent, const struct pci_tsm_ops *pci_ops)
 {
 	struct tsm_dev *tsm_dev __free(put_tsm_dev) = alloc_tsm_dev(parent);
 	struct device *dev;
diff --git a/include/linux/tsm.h b/include/linux/tsm.h
index 381c53244c83..6ac12de8c4d3 100644
--- a/include/linux/tsm.h
+++ b/include/linux/tsm.h
@@ -120,7 +120,7 @@ DEFINE_FREE(put_tsm_dev, struct tsm_dev *,
 
 int tsm_report_register(const struct tsm_report_ops *ops, void *priv);
 int tsm_report_unregister(const struct tsm_report_ops *ops);
-struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *ops);
+struct tsm_dev *tsm_register(struct device *parent, const struct pci_tsm_ops *ops);
 void tsm_unregister(struct tsm_dev *tsm_dev);
 struct tsm_dev *find_tsm_dev(int id);
 #endif /* __TSM_H */
-- 
2.55.0

