Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229FF370D5C
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787983534; cv=none; b=sBHbSd8odTVmn2gy4F5tUy4bzYqYUe30oYQ4If0gaxR1bmcyD6MtJdBRn20BKk591rGdsOnB3GKHRAYlBUcNkrIlD1RdBZbdd8Skp+DNBFeV/Xz7At8LyJizCexiBQqT8MfkYggkNLd6XRTgMu/tQNx/GdWNX7Ct0nGudBYs5AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787983534; c=relaxed/simple;
	bh=o6PeFz/eb2/Zu4CF1vb+zadSXp55cFSSJyfDin3quVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bRbwrVgIYBYa6cQ0h0RrfaR1imMIKcR8/k9ol3jXajGdYsFwgXVgpl4fx6W2SDGWeSUGWnJbOqLPJ9H2cPkLjjMeq7qLHXTzvjE2aDQz/Dkg5ns1Cp4p4s5r9/3ZWeCuVBZIhpBpXlEypC4QVUWCzwabzhgxMIINDz804LI//CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOBRmksV; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOBRmksV"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d530328efbso15429965ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 23:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787983532; x=1788588332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TkuG7a4t9AcWIusJS9uwYTZnKDwEZgSxcZyE1iPjyLY=;
        b=nOBRmksV/kL92K2z8ILE3CgNu+5d+u1HcGaaUaUZ0zb3OpbWsGqjj8f5C7dp8n7Jzv
         9ydVigGLHiA5nqLQTb9HgIvy46cYlsxKsJjmPdy2etjtCYEebbke+ualwMWVzYXhWU4Q
         suKjc6JHwRhwhHuPvbU4nbuE6GZ3QVOCmPdFLNjN0LDyNl5iB3bjnySQPpHt51Is9fUY
         Qa4+S2u5uU/wkxt9WaPCbPTZvnC9HxJfqL6d3hGp6yPp/8n/kFVK1OuPXaKSyibegVpp
         EgFspv+3JX5g6YSOoIGUHGLJ04evhGOkzCom9qyxM+3160u8DTvIaRjd5JfSE0rlaPYT
         5Sfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787983532; x=1788588332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TkuG7a4t9AcWIusJS9uwYTZnKDwEZgSxcZyE1iPjyLY=;
        b=GxXFIj9zXT2LnTfVdZbWKYsXzHltI9uA+kX0P7eagLevvzJiO8mQdBSJlMy7m/VkCS
         BZKSheTmyPcDdi9P5o/EDnukuwZ1lZfK53sH3N1OK2JHW+3/V6jHUzttOIw7fk7PDAu+
         ATlMe9wZY2+R1UKHygt7PUq7V+NZircYJideum6s7rZ75t/XLVln73PBXB7/QDrQeyuk
         YGUp/vT3x4NG2M2D7waR6T0Z/kZsKuYT9dKWyhj5SBc+wX46ouiSqSS3ee2LqjxuWHK6
         ooAsoG6mjCZM3ZZhhUbX6NODxmvdFOEeJ4Ou2cwZMpA+lofqkmi8CSrr6GnKyOOelofX
         t4ow==
X-Forwarded-Encrypted: i=1; AKwUvBzuMGP38GUd5HX/rORE6/oVXYucw+vQ0/KdXnMcMHkySJ8nD50LqLwn6rYLeVgmXicquc/ImfsNUgiYp2c=@vger.kernel.org
X-Gm-Message-State: AFuF++l6dCi/imdZlEFLfhJDlXxZtV20+xR8auSB51a9PKx2ZPTeDxl9
	vQ9VsAc8c1eRs0FO/6cpSs5rrAJX2his+AZXojR2RvfHqRhLg5rM8OCj
X-Gm-Gg: AYBFou2zjtyC9EX7lmDXIlacmTepuaoLHtqmkPLVwCGrGSu/D98lpYae/3C7a/K64TZ
	gngPl7dPKyAqHA9UNajItMNcjt0oS+j87z7jGowDVQ5Jboi8A4aBezVKcmyA87tDlrIGeDZZduD
	LNU6qg/WYE0lJurpb3Ukv1hP4VbKbZTe9rMCR37Dcft6jykY/LVfakSJbj+vtDg1ZdfKeZK5ajw
	f5PhZ0s60VjZeug24BDfLdS0BhIIMw7lvM5bnsrqpXSM8PBqNP8BBHz5lkfGiYIQqoBqfCmJKm9
	D/OJmoCqPmD/2rfSGcJUf9ij/PKBOErjvDLfFeaq1kbi9n37yog7ZnL3xEnfrfXAgq1gZxRDypN
	7UvZd6uKJ2hxQA8VGwYwrDzLkduOr4ruJRW3a0Gd7ALNlxev2iE18OekhFBdSvCmPJq/m4a4bNE
	T0mEviEwNTHJHDiJ83oSkWfy399qZN1BDo+HffR9JutQswKCqqENs9RXcPbJIuQdAPGqDNiX9g/
	DiVR/NCZ4E8Yj8JsDDrmC15
X-Received: by 2002:a17:90b:50cf:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-396d0ed78e5mr21704468a91.8.1787983532176;
        Fri, 28 Aug 2026 23:05:32 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda36ed6sm5609411a91.2.2026.08.28.23.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 23:05:31 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: sunqiuyang@huawei.com,
	daeho43@gmail.com,
	daehojeong@google.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH v2 0/2] f2fs: fix online resize state
Date: Sat, 29 Aug 2026 14:05:22 +0800
Message-ID: <20260829060524.2656620-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Online filesystem shrink changes both persistent SIT state and the
in-memory geometry used by pinned allocation. Two stale-state paths can
leave old information active after the main area is reduced.

Patch 1 makes the resize checkpoint drain existing SIT journal entries
through the normal SIT-area write path even when there are no newly
dirty sentries. Patch 2 refreshes the pinned allocation boundary after
every geometry change and rejects a shrink that conflicts with the
configured resizable tail.

Changes since v1:
- Simplify the incompatible-tail condition.
- Log the main, shrink, and tail section counts on rejection.
- Validate before acquiring the mount write reference.
- Restore compact formatting in the shared boundary helper.
- Recheck after freeze to cover a concurrent remount option change.

Wenjie Qi (2):
  f2fs: flush SIT journal during filesystem resize
  f2fs: refresh pinned allocation boundary after resize

 fs/f2fs/gc.c      | 27 ++++++++++++++++++++++++---
 fs/f2fs/segment.c |  2 +-
 fs/f2fs/segment.h | 13 +++++++++++++
 fs/f2fs/super.c   | 15 ++-------------
 4 files changed, 40 insertions(+), 17 deletions(-)

-- 
2.43.0
