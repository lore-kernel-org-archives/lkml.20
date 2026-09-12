Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D247343893
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 11:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789214103; cv=none; b=LDvsu+fVGc5AudydkZH947jdOSOwpRm87iQvpy1DB0981m18/60ORMvXnwg13AKAZ3Ub1tMlyeAIORkUXsFXf3bfS3XdCOMeaVfztejDNJ7O1kOs6YVL9H8/UDg3B0bVMDApAUdmqZ6q2QQad1SgET62T5BH7+xzBPLXSC2tITI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789214103; c=relaxed/simple;
	bh=wjrfmzwCB2Vf8FRU6UVIgozAzhd2ZwXNpub4sYKeexg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ief5i8e0kH+5m9q7QB2W0CntJTzTWYBKROoX7v/3Vrf9eIAPdGPopT8MfMeeyKCQnkzXZnGT2G4N+bkEvnPQK9UrcxzyZ/lWBovRJbv3/EJ5NuYGsSHX/LPUrdqlnxkHp/vvzkW5U1o1iNTYI7JzjsOmWZJd5Swuwxj5xr+0QoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCASUYaE; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCASUYaE"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49e6b280cadso8838065e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 04:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789214100; x=1789818900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HHQY0It3MNtGCYNfDhAD2naKxs+6llSjkNyX4pY9SfU=;
        b=rCASUYaEbNTpyMF0BRRBGNHkvqnYUVBAI8gLyHmp6U2/zglnuMC/vPuKbRWvBmveBV
         ZXH6RdLZTS2l/1FbYjXkD6FP4W2WkXlN9Wv+O0g6hPfg/9gq57CYZtt2xjXCNS96Dyt4
         92jR2Xo+xrVe70Rqxh4PUgBpuDEGUDDH2SNODN4NZcdBs5a00OEDymBgC3m2p5vYVlCs
         kqxfsBJfkXiligRzntEqlnt3jpboxmCHd79uPV91Xgi1KVTSEjHtH4Ekx72xasL52fK2
         wARWNa6gU8bzFZpOPWfT3QkT2YES/znDwBMhvIwFmgEkydKlsZMAYERv8rB6ZwsrVxz8
         voZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789214100; x=1789818900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHQY0It3MNtGCYNfDhAD2naKxs+6llSjkNyX4pY9SfU=;
        b=DfqKGZZTSEF+30FYmH2Wb9SG3PqQqWuWuM9O9bBKlgAsaArhZVnOKphV8JH4YGKkaH
         aOf6YzLhaOY7SmjxyxVNaDtRyAFqOBhUwr+3hjd6tcjqumQsl5XNeaDu+evj0z5ghpaK
         GBxdr9uLU4FAntRWludpmup+kXVRaWVArbjo2DA4U2xnkYO5PPn7L6gVr+rQ9O6bGgNk
         5y7/oKtepeImxOO47PDLU5YsJ2tXH+qlCJhxsOxcJVICwd4HaJOppbU/Hdu/QDju5xwT
         3m7AOpIEHe+UVnSrAg6kJ/62eoMbaGGDufoHDbCUl1yVSmtIIHV2WC48XDdJZhDtKBNe
         K2tw==
X-Forwarded-Encrypted: i=1; AKwUvBwJUV5iRKOwGneuAZg6gX8w+WCC67UP8iWA1ufoCly4UDuCP61cV6UoUZ/nKFPRiwgiKsRXFJu7B0wE8fY=@vger.kernel.org
X-Gm-Message-State: AFuF++nl80MqwNXmhHmzouDRqgy5KO43c53kaNY3R3EeRIEx6xKxo98/
	XJRYqC4wQQVlKk4z+0Sg19T//EX1/nKRzRnvrLWwNX6UELRFtIOdNz2x
X-Gm-Gg: AYBFou04g7J91tfzMtkfs2kepS+NrdBrBcRMDGnpk5M3OpKkiJjfBGdtlg7KJhN4PBi
	q09VZlrofv4F7GMU97WAc9Zpnq4LCnRsVeKz7S5OC8dp2IQczSXXXfvdm9gNT+yefc8zHdL63uZ
	b5HtMwYpEmJ9YVZ/FMf6j9/q4PLIRjBz+bymGiCIsMmqoO9/Ohtgw4/bQcvc38o8qPF4SCNQOwn
	+8tZGpbJXF0ahBE+H2ntFkD5xAOBB5WanTN7xVxxmmL4aY5xPgGvAwVr1izwTpduQ1LwmyG5/aK
	do2im9KxPGM+Zby/1u3e1ZXO5/L9a5iBoPVUQyhmCHpmQAqn/hlO0c6ql2Py6d8vwezkQmFlvpZ
	DE7xc6PM4yrAHqJqUZ/R5T2Al0Wx4FCeJ9b0/FrqJOmTM98ng6woYg2B/rKL0Whn6pvr2VVpUbD
	gjliQhAmTvODMF7MrbqDtrAE1Lh2AFwkn+qdTeVf4knn53oIJKsERU5b3s9uoB5VRBVLmkN9tv7
	j2sZnOjsyG5D2IwAMryIaUsoorYcMT3Fx/9wpgJdQmzcXfCQf7LwGj1DHYtMfkpKBvkoMPn1WGa
	r+qnlb0qh2hbOGcKrVMpUtYQgzlX4zYg2wTJrINKv9iF3oyZVleoF8wcinZ+wDA9DZNP98pDQTx
	Iae03jLQfFtpf
X-Received: by 2002:a05:6000:2c0e:b0:484:3313:fd86 with SMTP id ffacd0b85a97d-486eb2eb014mr9316892f8f.27.1789214099433;
        Sat, 12 Sep 2026 04:54:59 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb350686sm13413575f8f.27.2026.09.12.04.54.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 04:54:59 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2] interconnect: Add kernel-doc for devm_of_icc_get(), icc_enable() and icc_disable()
Date: Sat, 12 Sep 2026 13:54:56 +0200
Message-Id: <20260912115456.89169-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/driver-api/interconnect.rst lists devm_of_icc_get(),
icc_enable() and icc_disable() in its kernel-doc directive for
drivers/interconnect/core.c, but none of the three functions has a
kernel-doc comment. The directive silently produces nothing for them, so
the consumer API section of the rendered documentation never shows
them.

Add kernel-doc comments in the style of the neighbouring functions.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v2:
- Describe @path as an interconnect path and explicitly state that
  passing NULL is a no-op returning 0 for both icc_enable() and
  icc_disable() (Kuan-Wei Chiu).

v1: https://lore.kernel.org/r/20260907020504.24783-1-kmehltretter@gmail.com/

 drivers/interconnect/core.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index 4aa991a54101..802f07e806d5 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -423,6 +423,17 @@ static void devm_icc_release(struct device *dev, void *res)
 	icc_put(*(struct icc_path **)res);
 }
 
+/**
+ * devm_of_icc_get() - get a path handle from a DT node based on name
+ * @dev: device pointer for the consumer device
+ * @name: interconnect path name
+ *
+ * This function is the resource managed version of of_icc_get(). The path
+ * is released with icc_put() automatically when @dev is unbound.
+ *
+ * Return: icc_path pointer on success or ERR_PTR() on error. NULL is returned
+ * when the API is disabled or the "interconnects" DT property is missing.
+ */
 struct icc_path *devm_of_icc_get(struct device *dev, const char *name)
 {
 	struct icc_path **ptr, *path;
@@ -786,12 +797,33 @@ static int __icc_enable(struct icc_path *path, bool enable)
 			  path->reqs[0].peak_bw);
 }
 
+/**
+ * icc_enable() - enable a path
+ * @path: interconnect path
+ *
+ * Mark all requests on the path as enabled and reapply the bandwidth that
+ * was last set with icc_set_bw().
+ * Passing a NULL @path is a no-op and returns 0.
+ *
+ * Return: 0 on success, or an appropriate error code otherwise.
+ */
 int icc_enable(struct icc_path *path)
 {
 	return __icc_enable(path, true);
 }
 EXPORT_SYMBOL_GPL(icc_enable);
 
+/**
+ * icc_disable() - disable a path
+ * @path: interconnect path
+ *
+ * Mark all requests on the path as disabled, so that they no longer count
+ * towards the aggregated bandwidth, and reapply the constraints. The
+ * requested bandwidth is kept and restored by icc_enable().
+ * Passing a NULL @path is a no-op and returns 0.
+ *
+ * Return: 0 on success, or an appropriate error code otherwise.
+ */
 int icc_disable(struct icc_path *path)
 {
 	return __icc_enable(path, false);

base-commit: 986c24e0fe44f844b44d365b71ce831947f50298
-- 
2.39.5 (Apple Git-154)

