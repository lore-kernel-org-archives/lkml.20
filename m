Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334229;
	b=ayQxmCRzhTJH7QfH765h66+AtXZRRZaVloGcz3OMBV9qQq7lktHreEefJMpNfLdDRoTH
	 IsroDB7Zbkh5vXjJhwnStDca5ONSTLZtIBfwtNXiaO94xdKadHgg70+7vpAhkNu+dzUfr
	 UZInCWzzQEgdw17DVI8cht6eFK6jTA8WA5rOxCn0KjtAUzjFTeFPiDSTiMHMWkElkhhAY
	 gwHucbycx5VX1UtLIQ9UenMAtjm0jFyTUrnxYGGxT18QgJ5CtvSmkDLLkCw0O5gE69ynD
	 EAE+WyyPi3PRQahE1QwajFvzRO37XQg4WxoJHrUEgVWX29C2zuhFgnhT4wF9Y1I0hww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U33PwnQchcmiu/3DoDRSizdfuZPUsYa8ijDdkFvBI70=;
	b=BrLIYoPar5D7MVyvh5rfwFo5tQHVr0LoX0c3C4+otsVA41/3TqOj9iehnsXCBOu+QiiL
	 nyOy6DITmF/+JONSFUoxh9r4frP44gSEu11AlWYPtaf31a2pg1GbHAEeaH42qJDjCWjpF
	 GDeqRviVVLqaB5KwMNyM5GmIKz/yhH/9RfELNpi6bIHHNrL+JapF7InehWRGS7astwhLv
	 mkADdJg3QdpY+kCN/gIryALornKMv67tLYcyUVY/nVuF8cQaZEISoJqFpoZQ7sNekD7LL
	 XaWwNxvktIM9XI0reiuA0Wx1NxfvQT8XmlstA1zTTTdTHH+yhV+VVqPD6lGnim/6WuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=ewJSf1EA;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C43A60A260D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C43A60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=ewJSf1EA
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8241a56cd70so259697a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793334227; x=1793939027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U33PwnQchcmiu/3DoDRSizdfuZPUsYa8ijDdkFvBI70=;
        b=ewJSf1EAYYXAoofrmcJKCw4tcCXjw7AUYGkbqeux913ep5QDF8FATzA6TVzw2xru/R
         WT3bcT7eITVcX/+WrVZVmoDI7fbmxTNNJwtkRmfUp/f1d+yOc+t7RXYGyIPVxsgMrCvQ
         o6RPxyl1ZhFYZfmOEIKU3oRah5iR6/hNW6ASI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334227; x=1793939027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U33PwnQchcmiu/3DoDRSizdfuZPUsYa8ijDdkFvBI70=;
        b=vaALEDnSzCvxsSgmsZh18LWhVV9zLYHYyFw635Wk5OzWwcZvw7+QnbC3ow7qf/aR6f
         +PU33Es/NzeCeU3bSgDnJijbb6aPwhcdEnLxTKgXJs/Fb1gf260GlpmUpZgcIoi1KlE8
         O6bnJQbe4j6HWINz9zgsI/ZeTrLnFCgtwySbb4UWHJ58jxGfdJ+WVR1C6Nk13roILUjg
         ZHMZS1PoQf0VziOtgtEUgW4UCQJZO1WwH0+clJekmizqLe1e38VF3BPqwToCcaY49u5i
         NI/mBWRF1BT6HOv+oMUvPoOl0Ms47sY1cAfBQZoGN4oBtFcg5R0wNicXMoZTJYPtXtod
         EADg==
X-Forwarded-Encrypted: i=1; AKwUvByK3N1/m9QWYigAXAvEcuIAHvgj4jWuJX9eCPc9EUxFXqinjJAJNAMLEOuMmZoHnFW/uaeCcBVTAw+B5so=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5H96i7pJjLyJKAaG4eAM5auY4b1YsZaiGEKqPUvLyPJtGrQfG
	ChpvSI8I3k0KkXaUF3wf/Yb4aHpbTDcc9KwNFS/6dh5YHRRerpR0bRnW8COrTVEZHOc=
X-Gm-Gg: AYBFou0qbbpme+hypAIVSfqdwRCAN+Slh+NdWR4bqbh7rZyk82BYWFFlfKjgXuwqT48
	Lmv7GhiY8wpbKSsZUkOqnMF/YlywFjcwO8brplflfn2YCdRnYXL0Lx3gAYN/l6RdmoWUy1VD5jm
	KYMczCmB0FB0vHyo5HEiwQGBpuS/Sd0Ib8jhXWyX2dF0XsSZMCohKmuMuRQ465MGCd4TE+Y8uYm
	i8j92hXipCh1XN6MZydNkhEFiZIzQgD1Ez1+wbT5PSzEcEbr4Ozi81O9tv4zEIVlmZ0lJIBDd+3
	2JgafBEdAUEcDc40kFXGd7DMt4x104hY0VMN2fgS0vXDL0sLX7/z9EnfoRoGcE6hpO2VFRSN/U4
	5Vvc9j5qmGovV93T8D/bpfZxCo5wqR72582OkjQXOCkmthfUHbbfu1Uv2RSqE+csYmcTvGzo4hQ
	Cne5nJPhcFaOvFWOcpJdJ0DH39EMZOdQXGcmr/DEyRzx+Qya0IEoOeqdKKqICH1PYnTRfaAJ8Ul
	51SV7PqKDoXgEP23GOkbHQfPPvAUYLkv0baOxmSRoKajMzalhUWEV7csZpYJ0XQbwjO0RLrClqu
	NddvaI5Z5HAzxsCtMPbpRU4NOFHqsu8IWYJwL7+IgrXijaWEW97lTp6w/dCtKd6yDdp/OmVEZSA
	XLnjeVmHB4t5GjPjQC8bM1Mm8A19ALA==
X-Received: by 2002:a05:6808:c125:b0:4b9:a829:f015 with SMTP id 5614622812f47-5640de7bd0fmr906110b6e.33.1793334227478;
        Thu, 29 Oct 2026 21:23:47 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe423fasm747960b6e.16.2026.10.29.21.23.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 21:23:47 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: iommu@lists.linux.dev
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: [PATCH] iommufd: Reject opens until module initialization succeeds
Date: Thu, 29 Oct 2026 21:23:45 -0700
Message-ID: <20261030042345.74537-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
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
I have a reproducer for this issue and can share via DM

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

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0
