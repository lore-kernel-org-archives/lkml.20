Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793420732;
	b=S/fOTWJ6EZgIkQITN7ZD/p0Af1PDrY/wiUqkmj84fYkjvzhGWOAvAUsZ2p6yBYpCTB54
	 UWI7ZBAchEqqgzq5pjkQejbpiZYuiW6byItFkHdgGd7QXb2iA2XzLksTdbo+j9NhuC+aP
	 QSDhWTt12ah0u/GqyCRizH2g+g0DXQZcf5OJzG23tRSXGaktEeSI8wCPnWVDzwuRi3yG5
	 v7nfVC/AwlhP3Xj7ht86pABNMTfJbe3/Ubv74xY8P7J57mSi3DQ1jQASZHjSFnUJXhVi7
	 CoFqZWBh6DrmtJX5L/6J1ZEFGVCXdaCBIIDTUx+colgFVMHhsGT4xkKEHHERIBk/Epw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793420732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HBqVKgD/J3O3UsdCswiaBpwuPrR9DAwLVOA8ARw7ulc=;
	b=neOvhWGMisg1LsT7pEeME2yNXQFYPCEOkjgEnCszYZUrAUbH/zPWk+IMAqpYaNeK9DcC
	 fGvKDuuRuts3eQGXA2i9H6eKyctEwWsmx2trIYDPOGqqpbFscxqEiPdMTQExmI+38ingC
	 Q120HdFPsrQwyL2g0zWwVbMru77dwMSL0DydMY/PzEPMkuSVJZ3gztVNmrDdJQuyK2E8R
	 ju1A7hT5ZgMnnTUnw1iU6gkTmX2TwAEzpq+/kcl/SW+Cv0+b7r7r8S+DV543TKUhECWGi
	 70+PAe1WfjfxiH6e9h2M1JNtZIh8vMQvPe5nyKrBHKp/mzsDLg0/ec9G0Cr/HJGq33A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=dDje2y5J;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA944606A322
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA944606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=dDje2y5J
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4af173320f9so1118058b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793420731; x=1794025531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBqVKgD/J3O3UsdCswiaBpwuPrR9DAwLVOA8ARw7ulc=;
        b=dDje2y5Jik+h5jb7T9rZIhoHtE4bhzaRwTDYQ0UlqZAkyT6UoBSUdx2OW1BC8Wm+Zd
         tFBM+18vBKQEPJcqAv3jWvTTD5KFoEHng/6Z+cczS6l+QgJcnYhqdSL5wnxGjgfnYlZs
         YG7qtfO8FOcJm1aP8FW1ihU4Co0DUEEnoSLfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793420731; x=1794025531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HBqVKgD/J3O3UsdCswiaBpwuPrR9DAwLVOA8ARw7ulc=;
        b=Qa/Ia2l1DT66YcqijA3cSTVUXOvwJdfqM2lBGBRB1DJA//4v2TaztD/7ungPlwI5Fo
         UIq9X3fupIHVwO2faPOWOAUTdou9hzRE7aSU2d0Tb1YQJ/9xMyyNuyqLJpp0ayVbhd1m
         tMmEae7zImrFLi4pteytIAja38sSqU0TXVEzmykE4zi38ULeSplmqTmHyupSlOt+J7ly
         PRmzDTDGTPVirzqX3tAzWBgZa/oVPwDQb25rCxH/affR2SfdDk8yYS7Xrw+2ZrfMVFnH
         +ELaUlP0S7a8FKIc2lQGljttTBctrtFPQLGTaV48NtzjD/9j6kQS0Rur2lCBrzJ1FM2i
         OZ1w==
X-Gm-Message-State: AFq9FYIHA9hNkdTCR1zzX8PZF5IauPBXhEMa6kdInwvOfcrYG0lXxdjs
	HNDQwxhljY6NFLsdy74XWASQVmOXUOmdi0DkoQh6LMJVmodGY0lTFXsPiq1s5tHeDyM=
X-Gm-Gg: AYBFou38QECxebm6O/Q03fGy0+7ZYcx2k3apNvWcoO4efk045IHxnhWhLDmS0/f1O+p
	nT8Q0Rzgnsso9d2DpJFB9QjFhHvvY/6r25S2BJhEQqndzzWBV6FDzS2neb/n6MI3fHLMz/DCp2S
	F34ugTsXVjfmEaXqEXysSPkJMXck1dOUZaryHcoKrMVSSwxomCqXeyYwnKHOGms1mTwqLlTAaOn
	e26SN56Aq48f+cGoEQ+bEaYUTCvOqOHRJJ1YnSsnienrSO4PLIdDz/21kOg6zHkBkTobyVZxupo
	PwnQ522MkWaBsvve6J+JLi1Fa7ohKXxOsifbqadZ5mGGW+LUKintzoI+ZKEYuEQcmsmHE3XMBbG
	krqMIBDhA9dw5JU/zbMzGOaSR+TC4WKQ9Xe1R7WlFHD4VNTBkO44mCuIBdONnML2Hb0hCBFC7w8
	Rd1qAzRa6AxNB74674Dmeba0AaRirQrRzgudQuYtjFv4KQE3mVvJ2iEy3FKQwpB3y0nFnuDlZXH
	lETu0RxLzMjSSEhYqFpKOOXUsChkfw4mu9R8AyiglnEQ+p5pvTL2hKqU4auLZGmdQdr0YdkhRC0
	lsOSPMe6GUlFAY+6uVrBQlieein9UtT6K1b4bYwzvBKf5FSv2HgGsv6WY38efk3Il24j/ewS5SF
	mSqt8kjkglttvrTjMZyI9y9VPEnA/KqNLX2FYX1dxPWUS4WECZaU=
X-Received: by 2002:a05:6808:16a7:b0:4b9:e88f:89dd with SMTP id 5614622812f47-5640de8da6emr3144357b6e.43.1793420730742;
        Fri, 30 Oct 2026 21:25:30 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm3000260b6e.3.2026.10.30.21.25.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 21:25:30 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	outbounddisclosures@openai.com
Subject: [PATCH 2/2] iommufd: Reject opens until module initialization succeeds
Date: Fri, 30 Oct 2026 21:25:27 -0700
Message-ID: <20261031042527.6418-2-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031042527.6418-1-kylebot@openai.com>
References: <20261031042527.6418-1-kylebot@openai.com>
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

iommufd_init() publishes /dev/iommu before registering the optional
/dev/vfio/vfio compatibility node and running the optional self-test
initialization. Either later operation can fail. Since file operations
can acquire a reference to a COMING module, an already-open file can
survive the failed initialization and refer to freed iommufd module
memory.

Gate the shared open callback until all fallible initialization has
completed. Publish the ready flag with release semantics and read it
with acquire semantics so successful opens see the initialized state.

An early rejected open also needs to drop its module-backed operations
table. misc_open() holds misc_mtx across the callback, so deregistration
waits for it, but the VFS's fops_put() on the failed open happens later.
Restore the inode's core character-device operations before returning
-ENODEV, avoiding that remaining reference to the failed module.

Fixes: 01f70cbb26ea ("iommufd: Allow iommufd to supply /dev/vfio/vfio")
Fixes: 23a1b46f15d5 ("iommufd/selftest: Make the mock iommu driver into a real driver")
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 drivers/iommu/iommufd/main.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
index 9a921b153162..781a8d63dda9 100644
--- a/drivers/iommu/iommufd/main.c
+++ b/drivers/iommu/iommufd/main.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
+#include <linux/smp.h>
 #include <uapi/linux/iommufd.h>
 
 #include "io_pagetable.h"
@@ -30,6 +31,7 @@ struct iommufd_object_ops {
 };
 static const struct iommufd_object_ops iommufd_object_ops[];
 static struct miscdevice vfio_misc_dev;
+static bool iommufd_ready;
 
 struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
 					     size_t size,
@@ -316,6 +318,17 @@ static int iommufd_fops_open(struct inode *inode, struct file *filp)
 {
 	struct iommufd_ctx *ictx;
 
+	/* Pairs with the ready publication at the end of iommufd_init(). */
+	if (!smp_load_acquire(&iommufd_ready)) {
+		/*
+		 * misc_deregister() waits for this callback, but not the
+		 * VFS's fops_put() after a failed open. Restore the core
+		 * character-device operations before dropping misc_mtx.
+		 */
+		replace_fops(filp, fops_get(inode->i_fop));
+		return -ENODEV;
+	}
+
 	ictx = kzalloc_obj(*ictx, GFP_KERNEL_ACCOUNT);
 	if (!ictx)
 		return -ENOMEM;
@@ -799,6 +812,8 @@ static int __init iommufd_init(void)
 	ret = iommufd_test_init();
 	if (ret)
 		goto err_vfio_misc;
+	/* Pairs with iommufd_fops_open(); no fallible setup may follow. */
+	smp_store_release(&iommufd_ready, true);
 	return 0;
 
 err_vfio_misc:
-- 
2.53.0

