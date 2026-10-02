Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3071424679
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942806; cv=none; b=AVqJGOvJ3lb7z9c0qurmobOwVpjUHN5ljb36u/bTvsusf3tZgqIK6FkqvdRO0/ataJEBJpagF0WevXGFGAq1rcPbTYD3Kb6aqd/2bEfL67QVbLjzqk775ZwcIEVYAh0wbClaFwE4NhChJyZy7c4X5C7kaq45pNRZ3MyqAB1NcUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942806; c=relaxed/simple;
	bh=aKYMYC5Y6AKBePjC1K5kqQ5WX6AyctYZvcNDmdzeM88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ofVZUcznGt14ZpMJQgZaSoBnd7kXR6RhbvU7EezmRA3EdM6h47amPXty0iNeOMXpuNdtsFv2M309R5BpVys1mEuEDqs7RHuOCxIxAdH2O0c1z2g121i43+hTMSe/dQSPoLTt/QYA49IDAdTrSjC7Qt1lPa08xtlMFSlBHMriaDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SNP3Asfr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SNP3Asfr"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a026611b2cso41835e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790942803; x=1791547603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dFS/llWUsV6IPWSL6GqmzpUSlcy95iXkpLVDJshManU=;
        b=SNP3Asfrf6gGhvpOUkb/qLt/aScvePXcbaDCt0pSENrD2YCgYUbtdp1DErYvjEyx1b
         fblyLJjvsf6rfY2AnK/FoozGGyJriJh2Eos460kwoutN0JG0TzOkLPXyGL4UjrXo4jCQ
         4TjHOmnVJrl8h8Wdr06aozOKcSuESyiJ447bEpmuAUJEFBtX0A7bW17Wai3SeBXmsgT9
         /NXHI0JCsC27okzYi0pcMoWDX1DgudvSPiJUWSczBJw1bPfeO8xnH3RNuxeEuMOUgCvi
         HIN/I2Y/PS/rgOimVSPsKZb8w8p7XClQQJTVclV4CuIuO5Z+8Apf6on3kVR/WukXR8a3
         xVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790942803; x=1791547603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFS/llWUsV6IPWSL6GqmzpUSlcy95iXkpLVDJshManU=;
        b=okAqhmqYZeW1ZYLDqszd+qCBO9Vp96verJRVYVXgo8x1/gvo+CNUoqMrNkY6M4jxev
         ZuksgSO8ZOIhlpYGYdM6UK/zqkqaWg4Q8cvGRPAsirrT9beYWKyQaHzPVp2wYsZk87ll
         ZIZgtPSl8gyVHBn9k2GmQZrJILpPjvMMllsCxKNlqCByqAzpwf33UiXDPecD0ArD21Ot
         GuflwWhBQIo7HGvjcb6hs4/zXDapMQSdP2CrX0X7G2pLn+IA+2QoKUhTCN2SxF84jJfE
         QNwYzaPjLMedkbSEKqOufYPYSj2hfDLhV1PYjoASU2gPXuFjj5PM2Su4wlJuxzA5XWM1
         SgXA==
X-Forwarded-Encrypted: i=1; AKwUvBzMnom5JdVWx7OUlyfZLuaXQJ1X4Sqz2dRhaul1I6RFrFHHFUsZDbBDzvOtTEap2M9+bbFrv29yj45gy0A=@vger.kernel.org
X-Gm-Message-State: AFuF++mg/H17mQrFq8j/zeUwsUb/A237h0UOWU6QfjjZYFfO4PVa6iHw
	PEOPr7opqVI+G6CMttGQFwONgl574ard/+RVPZQt8GqkRPmhHt86bCuccMYngXLs4w==
X-Gm-Gg: AYBFou3660x9qZRB8HxBK0DZYQSGfQAw83/7JuGMI8sP0uRridKXLKskX3ZueoeA/a8
	s9duX4aY9MGRmxV7HiWJiL35+Wk9sZ2buIXF7gvkTHKw9kxPrPLf+htz4t++Jair+IiB7DxvZTt
	jEkGMVMPA1F3yTuO3w0ouurbj9dG17TEfziLQ9tdeI0akS6C66MoIA3J2h/zk1XYurb84zQUEOO
	2n8+7D3jIKRbTVA+WzTwhmMl1SGPvOYJXtyOOno7xd3yHQkmL/oLo3v/cLrpl3k1Q/ZJ3PbocME
	P+N4lVt3k5VdH5zUGblLBi5ANJsyxuLbUcS9vw0iommiBA5u2fdq0nXlAIxGHEkUckRVZVHr2dl
	5qbf8CoquK/7nHr8nFOJBIu/Q/9vVN9vIwvg+gsb9xazOI4HsXxeC9XJrUCkdd0VdjVwqU3cR40
	8duaCnb2/WVW9u3LpDRDwpfXHj5OWcgQCBTcsOqHZWZhVIbEQMgnhohqbC/b8KWG4gZA5cQbfSs
	sdFZMSAo6p809ilPA7fGZcjgeIVDkNZjggEXXS7iCTfK1BlY7vdoDNW0Os=
X-Received: by 2002:a05:600c:3103:b0:49e:65b0:7b7c with SMTP id 5b1f17b1804b1-4a03043ceefmr722325e9.7.1790942802364;
        Fri, 02 Oct 2026 05:06:42 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:3df4:daeb:1782:2337])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027727cecsm79239085e9.9.2026.10.02.05.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:06:40 -0700 (PDT)
From: Jann Horn <jannh@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] futex: Fix !CONFIG_FUTEX build
Date: Fri,  2 Oct 2026 14:04:47 +0200
Message-ID: <20261002120446.2313940-2-jannh@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

futex_mm_init() is unconditionally referenced by mm_init(), so
!CONFIG_FUTEX builds require an empty inline version.

Fixes: fcbe4307bda0 ("futex: Fix mm reuse handling for FUT_OFF_MMSHARED")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610020501.bKHR1IPb-lkp@intel.com/
Signed-off-by: Jann Horn <jannh@google.com>
---
@peterz I'm not sure about the right process here...
I'm guessing that peterz/queue.git is a branch on which you can
still squash this into my other change?
Or should I fix this up locally and send a v2 of the original patch?

I'll make a note to myself to think more about weird kernel configs when
writing patches...

 include/linux/futex.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/futex.h b/include/linux/futex.h
index 7eb645e49dd4..a895d8c69d66 100644
--- a/include/linux/futex.h
+++ b/include/linux/futex.h
@@ -156,6 +156,10 @@ static inline void futex_set_vdso_cs_range(struct futex_mm_data *fd, unsigned in
 static inline void futex_fixup_robust_unlock(struct pt_regs *regs) { }
 #endif /* !CONFIG_FUTEX_ROBUST_UNLOCK */
 
+#ifdef CONFIG_FUTEX
 void futex_mm_init(struct mm_struct *mm);
+#else
+static inline void futex_mm_init(struct mm_struct *mm) { }
+#endif /* !CONFIG_FUTEX */
 
 #endif /* _LINUX_FUTEX_H */

base-commit: 6f8319e3e9a44dd537d17f41565a8453c560a581
prerequisite-patch-id: f52fa75faf6a5569e9c607696533ec5ea842ab35
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

