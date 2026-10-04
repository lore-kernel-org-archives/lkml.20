Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060A5222597
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 07:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791098209; cv=none; b=jRxRusf+ZZau6qEdp89ACA/55NLVNvqP8tbB99ez4SyMFSimwwBX+Qt29LPkj0UIATIYeXyZMUjV3iO+av6GAnfhJsKfktHmd+iFNxYrRRbTQFW1etP06g8Xt9dbD6uXJcRWUIWCrZX7lrGVGte7pwmCZ90gf0WVExCEdx43w+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791098209; c=relaxed/simple;
	bh=mqTIou6UQSRNHX8tv22yJjt53JYED49fGdrWzWiSUTY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jpVZHgHPtkSrusRFc0qAwUSO+B/4hqubd/6+I6rQQv356R7MwOu3EDz3SKrZW6cCktmn28IHtf923yiw233keiWqOG64jr0LF0u9vus2Nez8Ka1JCzrov8+gouJMr46acFzqOX0a4SkfW5HcSuc+8UHroBr9IX3wtDvpRMlFzmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjDhZRCQ; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjDhZRCQ"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso270490a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 00:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791098207; x=1791703007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yYskKmzxLvnwE/h8QZQoDUu8kWT1A5Av/FLoV5znHig=;
        b=XjDhZRCQYO684zcb1Fnyvox5gj2tOfHrd7HO9XRw/SXKC/bCbSFDEPCpEBh8ymVIYt
         iIqYNi9dMTQzIpItwya/jE9LKx6HXB00Zs+FEh8ooj6oZDKSPj1tpH8DHCZOZ0CXWKjc
         GVJJqR1HPlFkvRwGGbMGyzMLtHw0r4rIBEsAUHR4jwK2yH4lI6cOSt1R5HyXoEG3dW69
         GkpBe03abT3N83lOtjn+x1D4a1dUWOIkg/gSgnJ09HSx7J5eHruo898j+dxnt1Ziwmhy
         cuoHOeXy3HjYmwFoS3n0bHlwsWlKjl95v+IuUqKWUYs+ADFw1XUMZrPJHqorAIr07tgg
         NK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791098207; x=1791703007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yYskKmzxLvnwE/h8QZQoDUu8kWT1A5Av/FLoV5znHig=;
        b=MXBPUoCREqxRIlkYOkHiDppTkLxCDv4ZHxastNiNnqcQFMTcLR0zV2/DQUTH6CKIDT
         Duxa/yN8zsPB1YgH6xsvCgZG5WkVyhsscj8l5Xq2hEGzpSoIFqw/tc4Q/MEq+Nyc65N7
         GtXSUeGGpo3iFmOgtUBpkaYHBmjP6gv/+hk99Al8aIrhN62DJ9/MlIHSSfFJE97fzPRk
         ZkXHMJg1HH2XYgm5igGBRH+ct9SJ126ifYOeAz1ExVza5qdAdmq6slHn2u5exq5SsLFv
         yIl/wzEHOBfryu0KnYYIHNeizcvCIgDJdxR9+HIjH/C/uz+NKLcEOyBDJCQI8zLMX9g3
         ZN4A==
X-Forwarded-Encrypted: i=1; AKwUvBxkrkVqEp19TAtxa1Fgfg4a4N8oYKSuDhQLu7Hef3/ZoQ09kzeiPblK6hMmde1mKiU0PKUBl9ORgUF9/fI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIW1SXUsuHlhHX8YHPp3AWbCKhvMRABSW4S/RMQC5lZihhifec
	aDMkcDTk39CyJAahFq1NMls5Zz8yMz+xivRuDo+lGzVSm6tQnCD5pG+D
X-Gm-Gg: AYBFou2pOLKPQLDf2DWm+vk6X9xh6H79awnjF9IKF5w5Y8hy4+C9urq19X5pAEufWLI
	E/D3Q92tvDt/yj474GxyfMIuuaIvH626WgMrWmHSPNjoqy8b50Jaz36fGSK9DkcXqDMSEbgWdpp
	aV7TZRjGLKsTmmfzSQjWN5W0pIN/s5gKIZ8z7ObK2AQwpzeMPxNo/vntchkz247tKRSAth46chG
	TTKHIBUw9wlrB4rnCV6ntSmgmGuNiD7xzZXvjEBx0ZG5VG06ZXqYfhl4UOJHH2TWHtbLWcU+Fl7
	8ic9+csHKhHrx2Oax4SPp8S+WBxhesVzfhGGhj/vOfhtif1HNyV4bOsMEQTbQH0dhOAYyIoLWkk
	0QSGAa5INEVLBptpmqZTYGhJ/Ujlpix2pvH+sIEw+1ywMphEdwAlutZd+kWnJ2KQbRwkMEE1zn2
	5qV21nsLTIaC2WxYrEhxfMb4z7SDk4iYM7q2typIxHKIOx+DwrW8m3od4ZeManAtvut1c=
X-Received: by 2002:a17:90b:3ec1:b0:39e:6a81:f34b with SMTP id 98e67ed59e1d1-3a7873dc91amr3372842a91.37.1791098207091;
        Sun, 04 Oct 2026 00:16:47 -0700 (PDT)
Received: from 027.. ([223.215.74.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d65d85csm5609608a91.4.2026.10.04.00.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 00:16:45 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org
Cc: urezki@gmail.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Wen Jiang <jiangwen6@xiaomi.com>
Subject: [PATCH v2] mm/vmalloc: bail out early on invalid page_shift in __vmap_pages_range_noflush()
Date: Sun,  4 Oct 2026 15:16:39 +0800
Message-Id: <20261004071639.119857-1-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wen Jiang <jiangwen6@xiaomi.com>

__vmap_pages_range_noflush() currently only warns when page_shift is
smaller than PAGE_SHIFT, then continues with the invalid shift. Return
-EINVAL instead so the bogus argument is caught immediately.

Suggested-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Reviewed-by: Barry Song <baohua@kernel.org>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
Changes since v1:
- Use jiangwen6@xiaomi.com for both the author and Signed-off-by.

 mm/vmalloc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bea9f76ed7e7..838c8e0ccfe9 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -684,7 +684,8 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 {
 	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
 
-	WARN_ON(page_shift < PAGE_SHIFT);
+	if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
+		return -EINVAL;
 
 	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
 			page_shift == PAGE_SHIFT)
-- 
2.34.1

