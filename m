Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7025CA6F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260368; cv=none; b=b5erncZJei5hh135z9UrgGlqa+m/TiGpaJrD5Vt7E7Al08/rvU+x2KXKIDACamj1GvEC3wSyskoqNNYxMmZC2PdyFrwC11TBC2bwCVJYjK3ZWaTTBN/5WUw5Dl9eN0CdYs6XhyR3JJidvmxAZMa37DiiaGxVt2+N3mezCGmeqcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260368; c=relaxed/simple;
	bh=1yRKnNp+6dJmFDDAgwGqjE4D4lrDphKTw5p0Wo2NV7A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J9XHv/hQdO2DlMXpmhrQPzbSOtltDxoEo8Xd5OFOF8rqmPjzmCNPsZGIE6DLDGCWFAgGFjO6XOvna169YvYiSgpN/o94IIxYBgAq5rbJfu6Fnbg8REZGx/+SyTrkOp1HrwG0qXwtVz2znH/z3CcEvYbgb4Z5+v7ZskW/8rTHeSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6lZ0ukM; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6lZ0ukM"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d94c868ea5so12090825ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 03:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788260366; x=1788865166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cX7EjhloMvh87ibhYzHTwR5IMqnRMYO6qnjKtDs5XDY=;
        b=Y6lZ0ukMlti+hmrXBamYFGA/WSFS/ohhBUHipTPeMU27d/d+P8X+np22+4vNKmizwv
         uzexdHS1lQ26+N/GNsA4njDrWrAJ8ZGDCEoxfeiG4jM+OFe5reN18mh7/Kf7l4EwI71Z
         ksaf7xWWmeqRfcWME0M4WLN6yfjZSTHb8dcF5HFd+hfWywTdBg6KMHj+KiLtH7RKwygX
         Q2r7oyimEJJPwPLu0L2aFcXL0DfP7qKTaRYBTzXqtCYsFNDiD8HoCZ/rJlQTr0hav0ju
         G597+wxJ/V31NKMV5qkveXsuWJdDMK0xQXdSj2VYKWYdE774D02dpyiGfkeEwFW7O9yw
         1CHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788260366; x=1788865166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cX7EjhloMvh87ibhYzHTwR5IMqnRMYO6qnjKtDs5XDY=;
        b=olCS7x6P9H7+5CWVqWyIyBqloYNMk45OyDPHJW3NCeSN7mY34eesuwjbi8ZUJ/iVxA
         b8oHevssDJrOz4ryelaxKlBhZ/YkqNzfDiLTzVsihaM+rvgjVPiWfuG1jRC0hegkTp1p
         ZMKothVuRy9NfxFwj7eOHxPov8ukgxrZVVtg0NO3WR6vXuASMGD8IjOV4yxu6O+YhavL
         +yg4CKSJqLRdaAVXA9q0XPz9nBxnUFuptqdYCdwxfQRqumBmr7jfAF7okZ5Lv6FBfspf
         l5Y+wFaqkUKWLqBbYlnpP4/cJdavwV0ABP67Ro1hTP3gwwiGrgpSFTGhJst/b+GF0OHQ
         cqgg==
X-Forwarded-Encrypted: i=1; AKwUvByodSKxG7E0VnsLUo3LoQ7pO+CCm84k57BCw3+AupdUfF9xx6kxvScXR7yp3dXbQUzT+i9rkKpUvmctKJo=@vger.kernel.org
X-Gm-Message-State: AFuF++lHO/EpF90cm3V2kSer/aYKf2xHo2rpewsYTtp+oXNhsIW6G515
	IcusFYePyGDtK4PjOr9RcW94Hy9NshA+rqKvqWoFnYFPgGLpu4xEPiku
X-Gm-Gg: AYBFou3SDcXBQgF+aoT0DrhjlfpDe7Is2GsyAeEeb4V09zc6SrInzA80vzUU+WoHaGN
	/utlflehcN69Ltkwd/Tn9z/McrwYkjdwFk7uOcGOCLyHcjjqH7SWPC+HlTCGbrBZib2xsB0H1Hm
	1QYH8gkrnDXsW3V5T/RXLGeFEFno5P+zlZkQaGU16pnmpo5ADkGNk/wpjsTEt01h12A+SuGA3F2
	+VCvXPWqnUq6Sne/gUtLpAYVsomPt8AEmEYCGZKeSFNXhC4r40IYfkcEfG66jzH0e6W2vnwa7+T
	3BqY5kY7LxZthn1ZDzOUuTFrp17NgkgLuJ39UMQc3x0O46umP6JAb+Ke+9+MNUMs+eoejguJQaK
	otar9uVuALxyFLQVtllEzmUw10PvIhamy9XZE+TLhxdkW9mdSUWtvZkghDzg0752aDsb8/tawkZ
	sf/Jv6xYD3oajvY9XMrsA9LKxr5tzPzpMlXQvFkhMEXj76aUDqYHhiEN3hNhfwiuTDVrSMUKhY9
	o6v
X-Received: by 2002:a17:903:458b:b0:2d9:51bd:534f with SMTP id d9443c01a7336-2d951bd58e9mr63941605ad.10.1788260366011;
        Tue, 01 Sep 2026 03:59:26 -0700 (PDT)
Received: from celestia ([2402:1980:9c5:2de5:8b4e:3f3c:b637:4ca5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d9458299aasm20706695ad.43.2026.09.01.03.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 03:59:25 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Liew Rui Yan <aethernet65535@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mm/damon/core: always return false when esz is zero
Date: Tue,  1 Sep 2026 18:59:25 +0800
Message-ID: <20260901105925.106186-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After setting goal_tuner to 'temporal', if the goal is achieved,
quota->esz will be set to zero.  In this case, damos_quota_is_full()
will always return true, even if no regions have been tried at all.
This causes qt_exceeds to increase unexpectedly.

Fix it by always returning false when quota->esz is zero.

Fixes: c7ec7d5f6b3d ("mm/damon/core: handle <min_region_sz remaining quota as empty")
Cc: <stable@vger.kernel.org> # v7.2.x
Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---
 mm/damon/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 644daf5a1656..53cf32f1d515 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2560,6 +2560,8 @@ static bool damos_quota_is_full(struct damos_quota *quota,
 {
 	if (!damos_quota_is_set(quota))
 		return false;
+	if (!quota->esz)
+		return false;
 	if (quota->charged_sz >= quota->esz)
 		return true;
 	/*
-- 
2.55.0

