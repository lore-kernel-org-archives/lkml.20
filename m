Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3A43F107B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968519; cv=none; b=TbFVehvd+PB0l6+ViAHn2jxH0KVbj/W+OyUPkwqoH255sslc5uYCgoH5q8dooAxMkfazo+YlCqJ0zVDsZPzck0ZdwdpcxzVqYPCboLWY7a4zt31clrKh1yN1sNvG/3arEH8zw0pZlbOtCF9ztWtkkBfxIRJMXV+K3C7SJKjrOnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968519; c=relaxed/simple;
	bh=uzuTwXk8WkiER0K96nRtdmtlQc4RXbfFoRo/1xUc2P4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2SrdUcg3THW1K+a1G2LE4lHYhbhgf0cz7j3pUh2AI0qbhITzjx05ItpPqEfI0q7ZX6GR4C4LP6NmbP1UjxF0yTk+NwodHDQVzDNZVAbJ0YTsiwMIv+unKAWUgpWmn1gocJMEeiioZPpIddI+pfMHwAhBwRk3xlhXXYYyqHdbWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6gzlLzK; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6gzlLzK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so1379735e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790968516; x=1791573316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5Abc9lhmWr9w80vEfggZt06aTIBY7WIzDl4UzYH0h8=;
        b=C6gzlLzKSW4zBzA8p4XKkZOXmDYUjrY2vE1WacYFXqv0DsME0Eibg3UzJJEyn5cMVK
         VZx7fnLP0NQ895SCmUzsdHTRpsHuVFR0dfyV7l3SLMufncE0kNBpkgNNZllKNL0WvtQI
         SgB6fMryvLzqGqCpEhsZHLgmktfef9EJpxD5R01nn7HZJ0DdVLVlLBaNtQ0HE20ZVMBq
         IaewlffuSBMjk6YYVnNCCJYFUN0cdninKNm+FIpktU51w29cbvg2Zw9Fpqm88TYLi7+G
         kG7dlHM3/hrr9LCQdKV11C1eSafU3NVUgQmAKe2AVQExMqHCok8bHlvWs7nQ8P9tvwi5
         bGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968516; x=1791573316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G5Abc9lhmWr9w80vEfggZt06aTIBY7WIzDl4UzYH0h8=;
        b=xSmyrC8GIRfcuhUeBDg4RwRDi1sUFdfEUWjy/FX65K4cOmIWmFuteOqFl5Fdv0ASMq
         gsxOuxzzkiCZuF67njzuhSlLDjRXWGCC8H+zjBbA2JtjDfe4rm5nGh4+bgouhzD13H5Z
         J5iLOdf42eCbcCTJ/h45JcHbAwcDNKvWFEFFzJfEh/LxVfPynzvX0EOTH9wGUb3iKS26
         VQ3JIHV3npVnyXxsX3ABd8/kB2kTd/kH9JPofWslCt9pRrF5cEVPec9F3QxwuNLYQFIE
         cR7zewOj2Tvz7eWIP/2HEMoki5A4bxi3NjehT73c2UCr/RCGNxhxi7H2BIEs62MmMbxU
         KoJg==
X-Forwarded-Encrypted: i=1; AKwUvBxb8Y90sAzf2qgfMomea7vGhdbSDqA8UU4yB5mTaI2Z/tHF4dfIgRKJ7bOQbq/ggDDKM1tSSk4J+IsPq4I=@vger.kernel.org
X-Gm-Message-State: AFuF++kL/4k+CFjdm6pQEO/T/4PHeKxmmh/BObCwUA1FEFR+T1yb7vfb
	71FnFpA/stfD8P9ulbkTBTb3/NAj5nFujY6Zd/4DYHJ4CUZM5w6jRQA1cOR8GZLkLJM=
X-Gm-Gg: AYBFou31+CA+7Mpkb+ovAHx6esjKAIMyof5p0HCRxH3mwrf9UfqTWonQXf1auonzo7z
	5ad3vI2N8ljjPL7dtGjkmI81yq4ZhP7p5f3MEGwjSBQmwuchRuIecqmSeFl0OWX2TXm2HhOjQjD
	VKkSZG6tOUUK6XmIqKzAKZ8fcrPM5ZcJrx6u4E45Wk9BYkOt76ymC7nqeqEAeig3Tqy8EYyz9Q+
	aJuE9NmGfbMYyi+PCOUQTqSVsvHpgwKAWsrvIrPaongv+tcM6ESM2S4xr4JELYAtnY6nkmeVyMl
	Eb+FziEhWfgRN9UPTyrCxXa6rKD85cYMJW+ABdu2UmdJSk9itR7BsE7AjpFw7nOQ2PCvXoSJGig
	3Z5QoCmtQR2fOoz9nYX337nxC4ayBKPLCOvYHKxbFF9ZEkNfKidUEbqrxvZPDSdHgUGcoGTF+1V
	kRXFJ78bPRTkkNzW6a/dXzsnlXVLJF4GjAd7tRy93hxtpR7+YOypai3dGRsLgtW3kBiuLGCeuRI
	NR/OSumzG4fDZOk7AQg7tmkFf0jBEqQMyCHMdwySLzxii5FqdU7
X-Received: by 2002:a05:600c:858a:b0:49e:7d74:7b7a with SMTP id 5b1f17b1804b1-4a02756f0d0mr44522405e9.6.1790968516532;
        Fri, 02 Oct 2026 12:15:16 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm81151145e9.4.2026.10.02.12.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:15:16 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 7/9] platform/x86: hp-bioscfg: validate SPM state returned by firmware
Date: Sat,  3 Oct 2026 00:14:32 +0500
Message-ID: <20261002191434.58529-8-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002191434.58529-1-meatuni001@gmail.com>
References: <20261002191434.58529-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

status_show() and update_spm_state() use the state byte from firmware
to index 3-entry string arrays without a range check. A value above 2
indexes past the arrays, and the result is printed with %s by the
world-readable status and key_mechanism files.

For example, a state of 3 makes status treat whatever follows
spm_state_types[] as a string pointer.

Return -EIO for an out of range state.

Compile tested only.

Fixes: b2715aa2e135 ("platform/x86: hp-bioscfg: spmobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v4:
 - New patch

 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
index 4d94e48c1..f0eb5c445 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
@@ -118,6 +118,9 @@ static ssize_t update_spm_state(void)
 	if (ret < 0)
 		return ret;
 
+	if (data.state >= ARRAY_SIZE(spm_mechanism_types))
+		return -EIO;
+
 	bioscfg_drv.spm_data.mechanism = data.state;
 	if (bioscfg_drv.spm_data.mechanism)
 		bioscfg_drv.spm_data.is_enabled = 1;
@@ -153,6 +156,9 @@ static ssize_t status_show(struct kobject *kobj, struct kobj_attribute
 	if (ret < 0)
 		return ret;
 
+	if (data.state >= ARRAY_SIZE(spm_state_types))
+		return -EIO;
+
 	/*
 	 * 'status' is a read-only file that returns ASCII text in
 	 * JSON format reporting the status information.
-- 
2.43.0

