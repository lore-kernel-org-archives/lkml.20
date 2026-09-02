Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA34923E25B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339418; cv=none; b=arwAWIkDrazPXo3vMI/1pC9yvkOxtDv1lmwoM9NflQqsHfRyjeqikIdTCoUnPo+oZOxF51rSp79pSdpuoM82QiP2QQI4+QpIrrf1Wa/mAv2mDbKc1UAJSLHMa5lnaqXz5/1EyJKe59Yd96TSsAd7hLeelPoG3PWiiJyUiUfC7/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339418; c=relaxed/simple;
	bh=980pOdPtGMiXSSZH8UPaZzgXub0XiX+t2bwcfO1bAL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KNL1QjH8ECO8XDvOtCfxRUv4R1W6nRMhwmNnv3mG0z8tfHib4TGBvLFe0qPpx5E+p0SNHmPyJ0h4Rhtw70Kgg0BwGX5cc/lQlp83RkzG/5BKHaHFTGmon1kvoXCrrGZpyLcrvLiK98Y0nLeCGIa1xflM8pFABtGeaXA1x0fHvYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b=gq3SqGV2; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b="gq3SqGV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=gq3SqGV296OiYgRyLEYWLllkhyp4j0ROUzfdbKC/QmIJZ66r0eT+/lJDLeX8YrOdr2TqV69dQMHIc
	 HCoFNsOkd8EbSZ95H/qqnrlECaYw5olhHZQL2U8bmQBWkVGsdmJkFvv6VJpbAEhV5UBzpAWfd0UDE4
	 LLr+E9Aa8lUZBgqQ=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56a97e4cd4e5-a0fc4;
	Wed, 02 Sep 2026 16:56:46 +0800 (CST)
X-RM-TRANSID:2ee56a97e4cd4e5-a0fc4
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36a97e4cd79d-f1852;
	Wed, 02 Sep 2026 16:56:45 +0800 (CST)
X-RM-TRANSID:2ee36a97e4cd79d-f1852
From: Liu Jing <liujing@cmss.chinamobile.com>
To: glider@google.com
Cc: elver@google.com,
	dvyukov@google.com,
	akpm@linux-foundation.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Liu Jing <liujing@cmss.chinamobile.com>
Subject: [PATCH] kmsan: test: check vmalloc return value before use
Date: Wed,  2 Sep 2026 16:56:43 +0800
Message-ID: <20260902085643.16309-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In test_init_vmalloc(), the return value of vmalloc() is used directly
without a NULL check. If vmalloc() fails under memory pressure, the
subsequent buf[0] = 1 and memset() calls will dereference a NULL
pointer and cause a kernel panic.

Add a NULL check immediately after vmalloc() and skip the test if
allocation fails.

Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
---
 mm/kmsan/kmsan_test.c | 6 ++++++
 1 file changed, 6 insertion(+), 0 deletion(-)

--- a/mm/kmsan/kmsan_test.c
+++ b/mm/kmsan/kmsan_test.c
@@ -352,6 +352,12 @@
 
 	kunit_info(test, "vmalloc buffer can be initialized (no reports)\n");
 	buf = vmalloc(PAGE_SIZE * npages);
+
+	if (!buf) {
+		kunit_skip(test, "vmalloc failed, skipping test\n");
+		return;
+	}
+
 	buf[0] = 1;
 	memset(buf, 0xfe, PAGE_SIZE * npages);
 	USE(buf[0]);

--
2.43.0


