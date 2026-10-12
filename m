Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BD0476CC5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798578; cv=none; b=L9BSxDzwWZxRKoxYxGfPw1dG0n43jOSjseFO6Z69Ulp5NahEDfiHHEpWKuh/rJovMrGmFzNjJdfZW0UXM2KGgtV2mpRlnvXKMyZM4RKNbza24uvOkuAqstzFsYH/6BRdQDzrVkQTVcIMloDIpOs91ahsxnq/dRDXJXXkvPLKWH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798578; c=relaxed/simple;
	bh=/o8DbhUa8w3SHvoeC4yYCFodh4VMe2LhHW/nE5IhWpo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QoDXUMnPR9vc04zOqGi6aMSMjkjCkZANi8uGos4RzFccTCfUwK/AkKATVVhyB5IolY8+r+Wzav172/qUkg2IOacOjOWLYshxaZkffYxywiCoWxbBwH1IkVcs1EaORyWMZ5+81rFbvaL7+brmU87hXLimiO2HkHU8YBz3GHdiWvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3yHXy3W; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3yHXy3W"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-885cd98d226so718491b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791798573; x=1792403373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AcV0tDx3s3vnrx2NYfd9pGnewnwOmP1EvF1UHeoFl6M=;
        b=h3yHXy3WqBIsTWGFXaXvjLfPOLmgJc5jA6yC66ZStJEXLloEjh1TyG4VKjACsLKrlI
         UbHq7w/fbszNbGAYthU6AFm2Z/U3xRlz+2kla68tlgWeZj0IHCzVpgD8Zkdc3dJrIbPd
         7w3MdyTHBv+KFrxouDT+6+sKhdSRUjLbdi3YzcfzynIbn1MaZti9DAaYxnyreInqcwog
         2DL9S79jrkK3qm++n6pfGfFLRNf3nhpOnfmwNi6vzc4JVzaJRfq0EyHhTzWyTWbKHuKZ
         AEsHs+s3GN6sKcu+Zs4jzllRqof5rNSM/6s9yrtL9FsHhq+IFhgKHnabBYWBq5WMIsb+
         5yDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798573; x=1792403373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcV0tDx3s3vnrx2NYfd9pGnewnwOmP1EvF1UHeoFl6M=;
        b=dB3f+W54/6HEjSGdvenQJTwila6cXbK2Y0VOHk73wb+KbDjYMDOA7xjNNxkA13IfW5
         wpeZp+m8myhVdGF8pCaJcqTe4pRJ+/7/IB8uoHhkhM/haUqrgcPLA6KhVFB1ARQWcOD8
         H0odmNgj1HYkahXeA0ZzqEinuTpWAik7ZD7J/pX/uvvem2rx4ofNgEpO98qbCop6gbfF
         b4T5BniOHoXqJ2NeqSsxHl9zzIVH+cz4TEIH//w0FPG7SpH8rxxu3iMGriGvoAHhPlzB
         aqMjxZqrV7/z5y8/uP+44Fqx7lOTkvz0XYhIqSi6G7QGo4Dl4XhQH3/ml7tYq5xg432M
         UeJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKxjOk3NY1h6L13h2MyvJpJUThLWWz4VB6tpzxNEyuhaomalgW0zT6y5/Mx0kmu1B8Q2VxwTKkLSr+CH0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMblmM8B7LY13h8ozdKcua0P3OpYzY33Ye1KxWifZsBJ6KQz1L
	h/jrgZoWP79NlPV1JJT4noeo1CfKs1TvW0jsd9IRLs5X+lv52v7/EFo8SmbmZmwC
X-Gm-Gg: AYBFou2s580TcbnVkDZ9Dpo6XW0rqmwxn6thtfpTX+VWnWo7qP1FoWTZrBSZl4b0BAv
	H7qroeTb+JRE6Yqc6AEHb5/d2P1mqeexCvQap5QmzCcVzIV544s6gWjygvi5J7UseZ2KoR8Esfe
	pR9BSqF5h0C7zUHn0gioGhp/4+eeVBYOp/nUG1KD0vjAutTyNOqzQyWhCapQcPkK5fXW6palssC
	mOoZeBuFdYb9JjL+JKZbiWJdc9/PtSxeDWVSrkL8l+enPySGsoWMI5DbatVrIxdeR8qRmK6HTba
	NEM7ip83QINOY3+qWWfhJ1nVofl5/itAHoh/5mxhP8fj99jOE2dT2qD20qPYALvvM7VsucUfkoa
	FpuszyeMHfG2b/fLXxNdXjOo2mQpL2ko3ims7xHQTybK6dYuQZhYIoPjYDsKnJ7hcO7yXMiua8k
	yboQlMcM0S0KsyQavK4QcLPEs1GwU5fVWA8wpUXXrKCEUxZMfnz1x7+JpuNl1OnqZxEDSEiMTEJ
	tJZ6vLa6JEY5ts1J4FxoRKNNA/mjSaFgJ4xpEVE
X-Received: by 2002:aa7:9308:0:b0:878:3705:571d with SMTP id d2e1a72fcca58-896a47e04b0mr5886470b3a.41.1791798573142;
        Mon, 12 Oct 2026 02:49:33 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([136.226.232.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c4996be6sm3974435b3a.58.2026.10.12.02.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:49:32 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org
Cc: cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] selftests/cgroup: test pids.events notification
Date: Mon, 12 Oct 2026 15:20:11 +0530
Message-ID: <20261012095011.3188830-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handle a failed read of the inotify event before comparing its signed ssize_t result with sizeof(struct inotify_event). This avoids treating -1 as a large unsigned length and inspecting the uninitialized event buffer.

Link: https://lore.kernel.org/r/20261007063516.1192279-1-sahaj123.sc@gmail.com
Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
 tools/testing/selftests/cgroup/test_pids_local_events.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cgroup/test_pids_local_events.c b/tools/testing/selftests/cgroup/test_pids_local_events.c
index fa501e209187..59885901fbf5 100644
--- a/tools/testing/selftests/cgroup/test_pids_local_events.c
+++ b/tools/testing/selftests/cgroup/test_pids_local_events.c
@@ -90,7 +90,11 @@ static int test_pids_events_notify(const char *root)
 		goto cleanup;
 	}
 	n = read(inotify_fd, event_buf.bytes, sizeof(event_buf.bytes));
-	if (n < sizeof(struct inotify_event) ||
+	if (n < 0) {
+		reason = "failed to read pids.events notification";
+		goto cleanup;
+	}
+	if ((size_t)n < sizeof(struct inotify_event) ||
 	    !(event_buf.align.mask & IN_MODIFY)) {
 		reason = "received no pids.events modify notification";
 		goto cleanup;
-- 
2.43.0

