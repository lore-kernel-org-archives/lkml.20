Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E536445ADA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144978; cv=none; b=ApQ8mv91qZxEc1+WuddxSn3XLDlksP+QSUk0rMsacN5ahyfYNOAMkyEbJLUsxcp1/AtkQf+1wSET6IqMgFjnGUuQbt+D0VDD24/5dXQnRMhpxZ4jS4WI9zX9STo10/7bajw4AnNPMf52b+Pq6YNbnOKxe2mzb7543bj236WvZN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144978; c=relaxed/simple;
	bh=Bmj2nhdQ7L8Wg4P/gKwr0Uz/KKXJKocTqJsXYXBeQ2k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ctt7hxijB/VtofrS1+LmJSvo5o0o9oFhbZ2fpXrShhE9BQNl4BOAheaxMmmBYulMmlWq1NLlBS1Sc3hh1WXq/ZcIG/ONNlHyhA7y4XEiIxpJ11/mIHQrS0PcIusxWYUO/ojmO0tf7a1C5fAL0GBLupjOCWMEdLbwXCwamYuj06c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANmaUx9R; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANmaUx9R"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caced6038eso4079005ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144967; x=1790749767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BLJDwfik8v5sXhgfZiByNmP7K0w0uZHSBWxfXEf9m1M=;
        b=ANmaUx9RDSh/uX8dcbiX8Q9zrlR6BBu3Jw9kgrxTgN54IW1HDhYptbmQoL/1sYGzEv
         vaV6AylNMPgvkuLXTaim4rCzmfyIur1UIQjLZ8GIFh8IvShSqhDpDQIavtw8p6YkeWT+
         3gm3U4q4x5xnrwxUtGOCDruCdvjcEuUaEvWxNDH6gmbyhDa7tMiBbGczSMUBhBawkv/v
         TLGtb/FTAHPUCgrCZdXJ3salHj6oHlnRZ8kuCOuaSnJBUqcOKosnvwvmAsfaGb08ZJUC
         T9RgmlSDz0YhIOIH8eZ5dgZXBOYIO+DVERxV8XWNpYvY83rim/5Pi/jMfaTv78pTDOKi
         U0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144967; x=1790749767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BLJDwfik8v5sXhgfZiByNmP7K0w0uZHSBWxfXEf9m1M=;
        b=Yq6ZuFwQUNB7YLnRtQbkKesN4hmr1zm+VXrB5u155AKTsmsG/ggRx5UUARbDtYgqI9
         ZixmLS+XOO6UbMvbf8JY/2o+9T6yxRP2GfKuepLgwFL1zCZsafAcQIQ0T0uiH9pZDyqH
         ND/h5nY3SU3tJQ0ce1M3Du5TwWaGmDt86M++joss1jqU+5xTKSjlKhaw6RhB0gIjWTLX
         ZCt/vw4P0AplkpjfNPZpMKfjnnEbkYe+ezceH93CAvIA6TDQV+6fFBcLTOfKnXNESKBA
         6Eck1asIMoTlD+ZiAINCJiQHAnHI1NoUlaUs+pG3GXg8lIi10pSz3azgwhfHiFClp+wS
         dJzw==
X-Forwarded-Encrypted: i=1; AKwUvBx7X+pXsqLmWPHgH07O7E8h60whOvDaoeBMlKUAK15EYKIWAv4XbUe9Vu2Ftmw+0klN2W8xRxPBu+62h8I=@vger.kernel.org
X-Gm-Message-State: AFuF++nL3CT+9Txw7Lv68kNc3L0khe+dP+eJooxbfaym9L63qUNGewmV
	WTBws6XSixJ7kBkICSr+k8KI41DGDvAT6Hg+LrPWMx5UCkh8IuiuiOlz
X-Gm-Gg: AYBFou25Ux3HCniaW6l/v81qdvkS/lPFQ9OaqWyzVt7qazdRQaUngNGGyqNG0uNSMDY
	Grp7SVmu+HwThcktQ0gYg0ji96WFgo/yn++sDiscNtR+rF9VWZV8fiIW1sBKdQngVcGMSDPIEav
	Omv1LLvNpQeZ9kfAut73Ep0XItaXCOi0f0lw+RjxK4R/RfCwpNVKRgA92MVlHTHBenQmlHH5115
	OSYMqtGqskX1G0vyPyPYI+NorHBL1udQ4O9qTVC0TZFAuUwXBJelA0ZzbKbAtNipGYC2Jegw2NP
	CHnemGjPFUGw6wxf1SCF2EmNVSXtoenlGJgRqfBPqcnzwqyhT0cVDywyWvApFq602jG3l/sTvlh
	GibsDDWp2xUDeBAjaNrbwZmhFxWhxeHad1Xu/7iO0THiD5kCcteBXW2kd8+I3BUtxaRgR9uvpgj
	pjK4m8SgWyLibUQu1RVN60WNcz3qPyvqiJLUtJsFg3UXuWi6p6Nv+BG6I6aIo0TcDhKSKmjx2bj
	RsCe5xRBauR29wnK/m/cQ==
X-Received: by 2002:a17:903:3c2c:b0:2d7:1cbd:9ceb with SMTP id d9443c01a7336-2df60aee398mr25552315ad.12.1790144966712;
        Tue, 22 Sep 2026 23:29:26 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516bfdsm5620465ad.5.2026.09.22.23.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:29:26 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Subject: [PATCH v9 08/10] mm/vmalloc: extract vm_shift() to consolidate mapping shift selection
Date: Wed, 23 Sep 2026 14:28:30 +0800
Message-Id: <20260923062832.479455-9-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923062832.479455-1-jiangwen6@xiaomi.com>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extract the vmalloc mapping shift selection from
__vmalloc_node_range_noprof() into vm_shift(), preparing for reuse by the
vmap batching path.

No functional change.

Suggested-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
---
 mm/vmalloc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 6e0dec73107a7..a43965016eb4d 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3568,6 +3568,14 @@ void vunmap(const void *addr)
 }
 EXPORT_SYMBOL(vunmap);
 
+static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
+{
+	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
+		return PMD_SHIFT;
+
+	return arch_vmap_pte_supported_shift(size);
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -4079,11 +4087,7 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
 		 * supporting them.
 		 */
 
-		if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
-			shift = PMD_SHIFT;
-		else
-			shift = arch_vmap_pte_supported_shift(size);
-
+		shift = vm_shift(prot, size);
 		align = max(original_align, 1UL << shift);
 	}
 
-- 
2.34.1

