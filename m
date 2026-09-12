Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6C02E88A4
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789198588; cv=none; b=pv2knPNKWZkWtXQ3BLEdWQ9qlTfZz+sLK9wpXSAukGArO27uFWI2jnPIuu8MX26s6dBt2nm9O49eAX5gSed032g/Rcr9ljbXACKtgt54PPigWSkTH2rTeraiaFuwDtRJcWgXwtYJSsJkLcRqoJzPmnqs7GqJtPSPA4JyuhA2/5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789198588; c=relaxed/simple;
	bh=BuQCrCf+mQSigNEIwwyGIr/Jb15zz9/6CrrJ2HCzriw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MCuirZ+tSk2YJO44joWwIWhR5kusL8UT8geuyjFylXTYnefYGw3i0WgYDwuLAIgprCfC2zc9JBo4Xl3EriyXzzjKzxBol68+sYQ4wV5N/+gC0L8iYrOyTs+ijIS6OHJ5TCjJ92bpa6A3gzGCtx7dOZvtIjNdOJ/OrBU3yYBV0XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqdyXe0T; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqdyXe0T"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49e6bad7b79so3721355e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789198585; x=1789803385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pmwdaFlGrRaB21X48sX6rYaTDcYS33SWDbPNO4WTsx4=;
        b=MqdyXe0TEJMHEehkfn4E2ajLVoaoCTsp5enZENkkj5MdhLOiNRObeT+RZMsebzQomS
         Hf6+LNeAQHaDxsvPDdOz71VG+BQ/AUMJMqg9vG4vozZCbigziWJ4/KkZ1eNKWO+R9ayK
         wx/6lfWbNpgOQ2kV0/CN/wnq0vV2epTGxf4//UImQtcV+XmDoZTCHVYGK5l6cK/pFj2x
         9DuxFR15Q2UcPVvKwlX6qxjoOEnPEdamQL6XfBiYML2z7SKr4ozUP/GZpdVd6X+txRbO
         4Sh5/hDx3uHYmzsfG3X3RaUyIVPlL/Eh6jhjBCJJu0VLi/+E8ShGhF62S0mAGeL/X9dn
         Tu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789198585; x=1789803385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmwdaFlGrRaB21X48sX6rYaTDcYS33SWDbPNO4WTsx4=;
        b=PQ5I+Hvv5m6VpupdS4OxZqQU3TdUNkvDHAnZi2Z7EubpJawxd7V8rDpj3k1+gKwysw
         jhFxyJTWShiSppopjmuVrjZTyDyFnLXwoFVde6CVUvRp3G0vo2oXg5Lqox12WNHCyOyt
         9G6IYPC8d5M2rXNNmIh8Ke2nYsArfeAkciLu+5eUpw3jW5t4mCZXej3szNFmhOANErP3
         Btf7Kefa1Cayy5s7S294KKUSaAgTWEqZ8zWVPdC+yz5V6rZxTJnVMWApEEHkgksNu8uX
         BcjekFhQwVnSF8yyMhF9Mh9R4SjjriB8Evi9Sh8H0hs/vMCbWuN14p3p+uhAiua04vTJ
         5ndw==
X-Forwarded-Encrypted: i=1; AKwUvBwW7NZwbyf6PQzrknlKUlAv/TpsCG4WyMuRKM7GkMF2a3pSW64IOM7IF9p/3hhRc/vNr9KzabMW2LvYhwU=@vger.kernel.org
X-Gm-Message-State: AFuF++mqZb3/F3A1Yul16Bx/c6jBGhmPNsP2VX7CNp0UCuw4GuQ3EEmU
	YfV1tI78DgPdJnIm0XSS/VAYpJ9BlJ8H/tO6+eW+idwHmMM6I/BbzmwRSaACyDX2
X-Gm-Gg: AYBFou3tr/vgva9aBSPXCW+Zy1qi8xAWiGiPQ7IpvIUt0ZnSMrd/hnme5de0L6hIeAQ
	qJqPrCXyDaRZcKzDhlxniCLkcAET3XkeInbZHUtKmZ6pAPWTyvVwT9IyTcWAbiqLYxFXZ850mCb
	qGs0LkErPA7EgdaVaUYS/QO7miwgp8+hjSdvTqVKO+FTuBsw3E0SziiLXYZ2XceuDj/dwWi8oq+
	Wvc/0346LKnFSfPEGYdXdMbT5807cTxnbhK1adA5J/5N8Ik0NHAU+7xrlHrGw/m5dl37tDIjDZy
	T42/dqtrhy8txEoLXll3bXYY9d8yw9kosutueynzd/c61g03GVq4JX8DUQtRhF3zJsFuc2wH7rb
	buEpF5kANKWcve3uVn60elghhk/9hEGpwlz4apyxrQpFPJbmQ36AejeyLg+0Rbo3hp5DMeLR/I2
	mmEkVXM5M0C8Y6XFRf2CsUT/BbZFpHYYktUJWhWvkHp5WHtGQRMw7G+mZ/GQ0FdMMRcHfeWpVGm
	OtuQ2FrzOa50GIc3W+PCa6OawYWGOXgmL9rLgUK+F3lySoXIdIwjx3Je2UquhuuuQJ0uTUsbPjW
	7WH24P9QZElILdvTZ8usftHUSf5j4FDvqjAUtSSHItBXqIiAlQ8x8t124ZikzvvzrCFJeLivCk7
	AwWa/ncc=
X-Received: by 2002:a05:600c:3513:b0:49c:fc6e:a3d2 with SMTP id 5b1f17b1804b1-49e619bfdc8mr81901125e9.17.1789198584578;
        Sat, 12 Sep 2026 00:36:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60acff8bsm139876525e9.9.2026.09.12.00.36.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 00:36:24 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: intel-thc-hid: intel-thc: Fix the return value in thc_dev_init() kernel-doc
Date: Sat, 12 Sep 2026 09:36:20 +0200
Message-Id: <20260912073620.51223-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

thc_dev_init() returns an ERR_PTR() on failure, never NULL, but its
kernel-doc says "NULL on failed". Say ERR_PTR().

Fixes: 1b2d05384c29 ("HID: intel-thc-hid: Add basic THC driver skeleton")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
index 7b4a58e1416d685186ef4bb222b882fab130a4e2..02ec5db9ad26977e72a7c8026b1796bc5d83bd6c 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
@@ -190,7 +190,7 @@ static void thc_clear_state(const struct thc_device *dev)
  * @device: The pointer of device structure
  * @mem_addr: The pointer of MMIO memory address
  *
- * Return: The thc_device pointer on success, NULL on failed.
+ * Return: The thc_device pointer on success, an ERR_PTR() on failure.
  */
 struct thc_device *thc_dev_init(struct device *device, void __iomem *mem_addr)
 {
-- 
2.39.5 (Apple Git-154)

