Received: from mail-pz2-f17.google.com (mail-pz2-f17.google.com [74.125.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190CA3546DE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789623040; cv=none; b=eXA+I9z/Sx2sAmc4Q8pEU1unrcJJSWSFtpVxQDBlJ+fwYC+PxeNfqNBpTNdyoLtRtqsJOXzFY2Bmpdzy5zSgLBG6OLWWvPl0R7IdwKdU3LAPT5mzS0j4DiL5UBLMvXZhJbVZP16UDIvTOTKohJw4+lBOTFTEgSL1a4ALtzXPDCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789623040; c=relaxed/simple;
	bh=8yVhZ3fE/86hGPVlLHCwsytF1kuIHqv5hZXT51LmS14=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=djPhWlwHmlcXglayxYMnYc43Xu9ZSAsTjot8Q9KcCaoht1JuCbqiSUkDgNOvBofjzRtqm6EM6kCYUcN1ARl5WOagGTLBacMnXU6+/beil8UVCzXzizC3DvQRVOsADlMbyHLDhOtrYq+S5isFZngsPfaxlh5c1xZo+iZ1lKp7ysY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNi1oe+f; arc=none smtp.client-ip=74.125.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNi1oe+f"
Received: by mail-pz2-f17.google.com with SMTP id 41be03b00d2f7-cc4c3304784so299068a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789623038; x=1790227838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NzaNd9dh5gQiSMMbEDA26vNGMF5WFO7Tl8lfuiT6OXc=;
        b=JNi1oe+f9tI0s588VKQrW23NRsTC/PKiryTHoMmZ4zVpSJuVbg8OfSxzQhYmgbZ46H
         GirW+wbeca85hf1ZnPs9sYCvWBHI4BM9sf136DySthwrKo7jkRzdFHCy/GPX9woAmXhh
         m+tH0kWMCeEOft27Fi5g4LOb6tRMKhauyGvOe6dOyOpmvLctF5ul/oYKVMAbdwec68yK
         ZHUS/G01o79YZB1J701068LgDSk2iuUly4R7TA8kETPKTemaS0gHPK83WCsQNPOyNqcl
         vKYyuH9LaE6Y7CVPKVXzYmU7LnM3fG5GxPD4L8m4qLW9zfva/VG4IuxfKR6NhmfKPTlm
         vTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623038; x=1790227838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NzaNd9dh5gQiSMMbEDA26vNGMF5WFO7Tl8lfuiT6OXc=;
        b=BEsCyCG3aGIAKO+wTFVC7EJnToQMqAZKbRLmHkWHEntp8ED0MVadaK4KvRcXxy4hmQ
         QoRL0D9lNneHF/J7dkzxxAhfaJXV0YMIUx4eGxljcZdBAjjsbmFqRcH5U8x9UlZ+Lmby
         zzBFusnIiHrvXxPJd3Cax5KlcX7iMficBixQyhW1FMR/BgfC/esFp4oIRvwe7rpQhacl
         k2zBLx4Gsq8ooeTLYk/bU8n5kidnXa2e67Mi2jOfshJPL2kRJ50lXozcgFfpPz8wvP0o
         5x+Uztj/G5wY6UGMs1km+IOc+qX0b3U9r5Eq3repbjTBfw6P2FaqwQpvZHgJhZQXn7nf
         OZGw==
X-Forwarded-Encrypted: i=1; AKwUvBw7pRlK30vZenOvb/C0ViHwIaOory5jzhzc7dp+MBT3rj1LLh7BHf8e7Elqe2XREyqhVu1vzKX96h4q5jk=@vger.kernel.org
X-Gm-Message-State: AFuF++meuYIVOk02uFanQ+xc3rcuAiKCTdtFkCBEjhX6dpQ+nvnxkK+C
	qV+oTBbV6xC47GdQz8uH7mLbpqwLRnPFVQnjE5l7YvgMVlLA/U2r0XVC
X-Gm-Gg: AYBFou2EJlgNLFHnxqOyELQRV2EcyFfxt628eNvN/YPIODvu+tCHfoUHdbD0Nq4qxq7
	LStQSxHT4ccqboEFKsAG5dVW96MazIUdZIhYe59WqPmOGmAP1X/Q88cIC8tcwhs7DElOpfZrLfZ
	J+usrry/xelLjhJq79rsrN/AKdNcOxskWnw/bA5ruzsWsqx5vGFKcrgc9HM1njyT3SKUb+DR1km
	zejrC0KGLly+Brmv6WJtghK5VIzmk9cKTG4UkNtU5acWsCPAcVaTKmr5+Q4pWtVy35v47fty8WT
	6IUkOX5bpNI1Alc3XMVKojXyfZqyAi5eqMi8aT+8qdtK1u4E9T8yoknoTpX2SwAdrdMMFfuWkit
	7RJ68PPuskfNUR4w13PbbNlmHRjxuqMcujKRKWjNxttnXCF4JCLfjwzjXOlvNkNLyxUgk37n8AB
	tEI/zQ2alse1yY99tLXA29ry7yQ4V1sNBq6jc9EBjVC5uT4Z6ChVSf2QOTR4SRwSnKKFwOuau91
	eM4sl15zZtYOfQcPauvJqbclzU=
X-Received: by 2002:a17:90b:3b91:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39e1e2bf7a7mr16057715a91.6.1789623038178;
        Wed, 16 Sep 2026 22:30:38 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1955836a91.14.2026.09.16.22.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:30:37 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
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
	ryan.roberts@arm.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v8 08/10] mm/vmalloc: extract vm_shift() to consolidate mapping shift selection
Date: Thu, 17 Sep 2026 13:29:31 +0800
Message-Id: <20260917052933.188679-9-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wen Jiang <jiangwen6@xiaomi.com>

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
index cf1daf931a6f6..ed868afd8194d 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3532,6 +3532,14 @@ void vunmap(const void *addr)
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
@@ -4039,11 +4047,7 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
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

