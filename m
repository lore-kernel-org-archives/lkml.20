Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504993DCDA4
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789887337; cv=none; b=o+PTWIaO8tm5HW0DMvxpdsVqV69CFe8G+ymh15uKn1gJCSsXJMAFojZCgxf9pV/F+L7LROb0x8jZHB77ER6rfwvUL0hkLBepA3zU0SSg8p47xSsxrxOPeTzuUUWBN9NEngUyLiIieFy7Z/fm76XHtzShke0Ao7LIZD3yp8gmcE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789887337; c=relaxed/simple;
	bh=0VIJh85HxygJnoDoON5bocAyZefHxJluvcfKFtk1vg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c/FaTZEYe9akcPyGIBmQAKTtW2me/Plql2Y7PWaDZJOreqztHEXHkURHoixmpQajzihS2O7yIQi/QAQPqkR2MfjPt7xy8wDIqmSQl/j3X1uhxlILteGrYOSVx89Sq25dGPK6dro5t2whzVscA5AbIh8V+yoIHte0ULNBkt5aXns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B09u9cwR; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B09u9cwR"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so995747f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 23:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789887334; x=1790492134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M78s0H8Rd8+nOr7J2QsqNabn6ZGw1eXwc/smiKNA8Bg=;
        b=B09u9cwRashfpaH1wwuBNhfGQdJNRZPlW89UDYAQlUoSqkHyb/9Om4yVFleYED7fpX
         QCyRVUF0O4aSb8x4trX9hTchftJX5lv3TBFHn5qhuQ26QtHsJexPbIx1b/1/sQJNVkzo
         nYKyDMbMne8r+ElRmsxyvwIDu8Bu1YOh2peIQ5GC5YfDxOvskvNOlaG8m2446r8Veviq
         tRPeJLi52bptQxrcZZOHRiqMYwI3KP4wlv5D6MsK+FHeas4GhdY6b/cpmR1YRjF2EFY8
         BExSfLUWGmD/2KQIcPqfXUe7EwlWcBkLFKqz7wmM9fn6ABn9xOrX1donlWQfzikhxoAL
         4aeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789887334; x=1790492134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M78s0H8Rd8+nOr7J2QsqNabn6ZGw1eXwc/smiKNA8Bg=;
        b=vD7yZca8cYwlHv2ByNmdn+injxKpu2ElDfMppVlUZSZus+VZLbyrb4V4cko0hGDhnH
         wbMdTn1YoMl1OpfATKpqky1ODXQtdn+660j/lpeMEp91ZmpxqMRld4yzIFMCt+ouegti
         g6ilEzKSJfDtxgfXFtNUuFOvTTvT2miK6nb5Qer9xbsMYwmZXxpjnnsNMuFcVY1iSREa
         poWddV53mGXZWMw7plxOzmNg8o4p/MijdsXv3ps342zwIDWRbmUXV4748LjzWgl6S29m
         f1ezsqxPqQ51jXClIcBnSiemugX1OrX8pj0+9778/uoaNURiq0B4zSrYlyhyPnhGrP7h
         JP4g==
X-Forwarded-Encrypted: i=1; AKwUvBy7aLFbW2kkdByCYzZmymcpKBDfSTuOI2nUKXUF8goz4Dp1Q7VvyJEKv8peLYrl15BWplXe6tPsQtYO4KI=@vger.kernel.org
X-Gm-Message-State: AFuF++mqkbxhG3KvcBYTdiT6LSiHm92RFE2X0waJtcbFkIgMnIJivtQu
	WhbLgike0iQvWfcPhTNMPhw2ym+HmLK+ufw0AtaJN3Gat+cllDOf7j5I
X-Gm-Gg: AYBFou2GxAtRR5W0K0Pj9PeOCT6tkEJACjvmMvghZXYqCnMoSfF+svet854YsIQ3kXP
	koqnl/QcEHiht3XSM1TD6B5rW92uPBtoIbhNT8ZPS4ZVP/4lyAbsNgOkusf7jUnIzL+EzQHKHsO
	YB8H9italbdIHx2MIWrvMbcwZdRBNDhpTTzUko0r6grEHlPM5LAQNLDD/U9CXHwWSrdy1N7EgjF
	xSRiOrecTCUJHBywQB4w+EkK3UozT694INUhHbpwLlaSnB/A9JufI2xNOE+JdYdR4ohUQhwfmji
	/Ad04RdDUd6xeF33urJjEqj0JmoJaP58xPqF/8ybmWwc/V9J+JRs6uQvNVXDl+MCraBJstSLA/T
	CsqFUNbeLmBODEwQRXbTBTmJveszrgM4h/wr6nb33NVXhMVttbY6DA6687+sxsqdlupQHLwCxhf
	q4uDXxEB+DniYt9zsG3STom4tBQiWviPGc5W8rkAUITJKMpAA2YfbhB0zytJuNCGr78y7ws9Py/
	s8Ve8PzAiGPzVuHshU1Lew=
X-Received: by 2002:a05:6000:2405:b0:487:bef:31a8 with SMTP id ffacd0b85a97d-4871dfac13emr11120143f8f.0.1789887334516;
        Sat, 19 Sep 2026 23:55:34 -0700 (PDT)
Received: from fedora.jkuat.ac.ke ([41.204.187.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724596604sm12443626f8f.30.2026.09.19.23.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 23:55:34 -0700 (PDT)
From: Bramwel Barack <bramwelbarack89@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com
Cc: acme@kernel.org,
	namhyung@kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bramwel Barack <bramwelbarack89@gmail.com>
Subject: [PATCH] perf/x86: Fix missing error code in init_hw_perf_events()
Date: Sun, 20 Sep 2026 09:55:10 +0300
Message-ID: <20260920065510.15362-1-bramwelbarack89@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In init_hw_perf_events(), a fallback block intentionally clears the
'err' variable to 0 when a vendor PMU driver is missing, allowing the
kernel to fall back to software events safely.

However, further down the initialization path, a second hardware safety
validation check is performed via check_hw_exists(). If this hardware check
fails, the execution control paths jump straight to the 'out_bad_pmu'
cleanup label. Because 'err' was cleared or initialized to 0 earlier, the
function erroneously returns 0 (Success) to the initialization manager,
despite wiping out the PMU configuration structures via memset.

Fix this by explicitly assigning -ENODEV to 'err' before jumping to the
cleanup sequence when check_hw_exists() fails.

Signed-off-by: Bramwel Barack  <bramwelbarack89@gmail.com>
---
 arch/x86/events/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index d1af33d96d0a..81873eda5b17 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -2164,9 +2164,10 @@ static int __init init_hw_perf_events(void)
 	pmu_check_apic();
 
 	/* sanity check that the hardware exists or is emulated */
-	if (!check_hw_exists(&pmu, x86_pmu.cntr_mask, x86_pmu.fixed_cntr_mask))
+	if (!check_hw_exists(&pmu, x86_pmu.cntr_mask, x86_pmu.fixed_cntr_mask)) {
+		err = -ENODEV;
 		goto out_bad_pmu;
-
+	}
 	pr_cont("%s PMU driver.\n", x86_pmu.name);
 
 	/* enable userspace RDPMC usage by default */
-- 
2.55.0

