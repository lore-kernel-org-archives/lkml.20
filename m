Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1407A5505DA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083597; cv=none; b=H9SoQk8SW89Apz9pHbWNx0TjGjw8C913dyJhbJdVh0Kob8D892driVnu5xAbwawhcAUSHk92zVWhGBmRU50RU06E0CMa+kXFq6qLhwjiM4QFCdJTEMwwBwRAAklklBwABO+ugEsiyMPtKmIDlJXzeok2SAj7G9SAu3vROjLo2Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083597; c=relaxed/simple;
	bh=46iz/lG108zgBFKfIkb2vqYMsjU9G0lUOHcMCW1xbmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BmG1sI5T9Icj1KjnRUmZYjwWvK73rXLz20q5b/EagVfLuN6PUVOnnLx/rKALL8vNDB0l1e4Kg0uU0yrOozy+H9ZhfbGxFfzFw6gORstlnoGiNsM5ABRa7+fKWN0ADtY8SW8xAruobzw2Mq4Fg+DTi1dfsyfdxqSD9MCD5XwYWz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLAgWgmd; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLAgWgmd"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f05ffdso29422395ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790083595; x=1790688395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eCUkLn112v9x8co6KH0UJQtidDQHBj7ffImfeZ1slwQ=;
        b=WLAgWgmdl72LBmKn+E9ynK0TCieZl8lmhfo5Kqkc0i9LZ608wJ+PHY3z+Er/gsl8qq
         qL9MHK/rE85Imqo64VSIiKcBd2xKui3rb0v2vgPwDrtZByNvs4phdciyWHoL7MlzXUBT
         Kl7iIfz31cPfs/fsRIUlWBVfWG37L5vg0r56GsOr46HrY+ghd70m/rSREkrSFQOF7mLy
         4oeebirLbEkh721omx9gdIOCU0jQM99X1XF/N8c/NNx6h12tMa71df0vQ84WLLVPrfHa
         KljgN+UVOuirWwoma85gatlizyVawu9MZTx3rDl01D2RLXBSALjhSniEOl7ePjBUb4Wy
         3TzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083595; x=1790688395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eCUkLn112v9x8co6KH0UJQtidDQHBj7ffImfeZ1slwQ=;
        b=weSLY84k3NN9vWP88SPcLx87ot+7LsJiTQy5p4ldTUcW1oz07Qo3VVux5ItjQlpFnP
         pt7fPZULlPls4lte9PMis0AEMQnHKSskfGzEP85jiaIRmW23WvMQ/3s0B+2/TOOwNdRU
         oRQrvzHZLOGxfncLd+DBqsJbeJlpH0MJXUAZ1LRDGxmtj2enlMoKL3ZQz4NexMx0HwfM
         XYIll9w/9ZjuxD9Y8o1cXEL6FRPYXDgFrXKkYWWZAg5RhRK8YTPwfU3yy/8EA25TwbvT
         OXnB6/Ioh+VIgFzCWYqHemJgYdc8Nqv4dw2CEP6mLxqy7Ne5BzZEv/FLEHsYSNzVtJT/
         rTKA==
X-Gm-Message-State: AFuF++m+twuua4MJY8IF9f2VfZxGXKFLNcf+lSnIkt8i0XBO+kXuKcvj
	N76rgPyBgfH0z1kyB6NEgyFSA2To5FaTJ58OLJJ+sp1whaPdCP27RmiP
X-Gm-Gg: AYBFou1kitHfJ4QSeCtYfh4bVVgHXLzeULUFxbL5IY6scfKpamfpU/lzzagS+ZEHTRE
	PghEp8FllenUPTy/CIIEs7pGA4aPa+JLKHkKMg2NRkge40sjUw/WBEB/2/kbNhYe+JGWkrW8kO/
	Puh3A3OkfxvGQ67hLTzj4TsYTGp0jGUKpbiJpeppTs6+RNa9FKaBIeaqlsNzlxZ3KzpOmdgMkMV
	vQ4kpuM1FK0ExK2Mjzjx2vbDSyeDY3U6E2Dsf+Po0ftXP5g1mIihU7Mqlt5Qhb81tbgGTX+qK+I
	rMO8AG9f9tPr6nScCrXXuY+78KRMJTOQxQooLjDzsuWKi7ZyYw3YARdIIHJ6vvoN2uTrilRQ2up
	DfSz0JtT5XXuiOIdOHgOwM3lmHgKR/na9AGJbF39yS94b+tgrjzuVxW/6/9XLTOOCJsXbRSBALl
	MR+kRXmRAZ5RYWXJ583eH5fQjL5vX4UM0adtsb/UKb0LWn16MK51Xvmll+Xm5RJIwJ
X-Received: by 2002:a17:902:d988:b0:2db:5052:fd6f with SMTP id d9443c01a7336-2df609d4f2emr14537855ad.17.1790083595144;
        Tue, 22 Sep 2026 06:26:35 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6365ef10sm3971725ad.28.2026.09.22.06.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:26:34 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] init/main.c: remove unreachable check in obsolete_checksetup()
Date: Tue, 22 Sep 2026 22:26:27 +0900
Message-ID: <20260922132630.177941-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 1ecfea06386c ("init.h: remove long-dead
__setup_null_param() macro"), .init.setup entries cannot have a NULL
setup_func.

So remove the NULL check.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 init/main.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/init/main.c b/init/main.c
index d276e194393b..e7a84799639a 100644
--- a/init/main.c
+++ b/init/main.c
@@ -215,10 +215,6 @@ static bool __init obsolete_checksetup(char *line)
 				 * params and __setups of same names 8( */
 				if (line[n] == '\0' || line[n] == '=')
 					had_early_param = true;
-			} else if (!p->setup_func) {
-				pr_warn("Parameter %s is obsolete, ignored\n",
-					p->str);
-				return true;
 			} else if (p->setup_func(line + n))
 				return true;
 		}

base-commit: 277efa234c9a49b6cb9aca1cb9d75138ca392eae
-- 
2.43.0

