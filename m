Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EF9417366
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763674; cv=none; b=UW0vP9TTdji2PCKadX/i2yl0EWNM584sA3uPISvbVb8EnJT+YrCbJgmJEGnF/X1rvfLmZ5Ome3Q2F3CbplSxNz1fbb/QNXH35iotpQfWsqH4+k+NWoSPIqIiPXJ7CHKj5EGMlIKhx/w+6BYlrm+5EI1iUIUMv9iCpSMArAINdNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763674; c=relaxed/simple;
	bh=p91ao2AKO1u40gx02a/XDSpFyO2CsKWUxeRtlMlap68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I52erbhUfqQd7yGHSjZnbL8Ee+l1YlIiKyCgsd0K/AVgV7xTnnTbsU+17C48jwhhykpXGKG0Xnc6489//0VdkbgaeAtBChOw0A5RwpOYQurNuQ4trxgOqdGWNcpEderu0Bij3OMDQzMBA6gccKIxUloJyQ+RBoJ2FCblKwjEFuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEjHzrbw; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEjHzrbw"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398b3c37877so2903216a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763672; x=1789368472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIBBvWrmpup+w6AcHGzaJw3qF8lt2RTeR72Ssm270eo=;
        b=kEjHzrbwtRg1hg4bzJm7knqJe2KFnNf1OSbeA8WSAnrjQM2zPStzHl92eMayZ67S2f
         Rh3Qb/Cwmct/oY3uD10q1HnmJ4CIXqOTZqyf4nuPfpS0AL4ozel78IbL0krJo4eFKhGR
         QT5VibDE5/FrGVkkHOgobYfuNQ4R8+vk5F+HNgP8mvDBg880XowBvwtu7uzvGzP188qn
         zNCTOT2hqZSE2Lftix4aIHtVV+WxDT9oI1uKe9T7x54funPrKbh+50+pMZD8SnvUo/i3
         dbCR//vBRDmMpMSaPvaWvkCTWpkaJxCqhJDUqjOOE7c69mjWG1kIqATi6JwhadcZ9OUA
         xMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763672; x=1789368472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIBBvWrmpup+w6AcHGzaJw3qF8lt2RTeR72Ssm270eo=;
        b=gNWt+ucx6ytCDgt52mz02AuzvBpkiS+jigWO/mdMI0O51kerbyqSt/towbCFbgZa9d
         OidAeLSoUcrfJ3Isb1BhbXPRP38mcNmkUnhcKKvmnxLEmjtGMMrt1hZ22B6HyQ4i50v5
         fIH3jR4Cv3WGMwaoABxPHv7zhB3OITEaqgbyI5ZiVKHGVfYTeOSKUItTUjltj3O0gqNZ
         BGslTFSjxdt8BluYnhT4783NiSFb7mob2JsB6Jt9Obnc0udd5PBck9mUr7kUbOqL/Yfa
         WJ6w39Ltw+VzBFnV+LfPOCPOOyZpvnjmO/TqrEpPkovFGPjq6GUHOIxyAPqWyr3+PWqj
         JU0w==
X-Forwarded-Encrypted: i=1; AKwUvByTghzER3dt+8Q3mJMgfk3jkuF1Fo1IQ4zFuwQcJqS0I1jCAtY1pm+bfvn8JghS4mXO8/tnmfn8Fvjx05g=@vger.kernel.org
X-Gm-Message-State: AFuF++nKwNMrg2iXEONnk0AqrBJ7MCi5tPE1vNNRHjp4ym/6KUIP+7id
	CSU+pmsjU9N410fSjNXtl1UlOvXC6SHpNGxtFGmRsInWLJ4pmFZ5EXfQhphkbQez
X-Gm-Gg: AYBFou38IGgBndnDIVAvD47t6nWVWoP15R6vIwWbUzABCz88fED+bkHsRt/QmhqGY76
	J0PQP1dAEU24FKAV7BKrtpWzz/5hdnwJgSbnyLYUYJGmCOehgcxXURF/k6FcnRurNI+tSs1ZySS
	yyiZg4aEVfUxhhcww71ZnmjPUwYJaaB+2EX7aagFgjhkiViqHjDWUAPqx5G1+uP9aqTIHQuCidy
	ntd8QWiBGzgIIfjBOqpsrt68L4gSJxCYdalA+iEFE+Ia7IR5QmYrYpOIHdYSvYpFoN5PW6NvFIM
	AqAJGAwfIBATGh0dnQugV4vWu7TO8OZp8qspwdjGh9FKeNOsUAg1FhTr2D6sZ5ZYYbrJlHF5sbB
	zuMVWnIEO3+Edh4lX40F3r3UrI80lHbsRqT4HqvhCPdU2/WzoGIQk4NFvFSUp0Pcf0hVk/KcBog
	O5KV8W3MOneepSyQ04yRw0U12fD//7kwNhbmgB/fLMGn2kalgKdtHq69e+hrvXgjNBYggYkCpk/
	E1bjNzEZGER8Q==
X-Received: by 2002:a17:90a:d2c6:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-39b260d2f07mr32517136a91.3.1788763672025;
        Sun, 06 Sep 2026 23:47:52 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm24811158eec.9.2026.09.06.23.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:51 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Keerthy <j-keerthy@ti.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH 3/5] tools/thermal: fix typo "binded" in comments
Date: Mon,  7 Sep 2026 12:17:23 +0530
Message-ID: <20260907064725.10686-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907064725.10686-1-hemanth.selam@gmail.com>
References: <20260907064725.10686-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "binded" to "bound", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/thermal/tmon/sysfs.c | 2 +-
 tools/thermal/tmon/tmon.h  | 2 +-
 tools/thermal/tmon/tui.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/thermal/tmon/sysfs.c b/tools/thermal/tmon/sysfs.c
index cb1108bc9249..5d64aff12a86 100644
--- a/tools/thermal/tmon/sysfs.c
+++ b/tools/thermal/tmon/sysfs.c
@@ -225,7 +225,7 @@ static int find_tzone_cdev(struct dirent *nl, char *tz_name,
 				cdev_name, cdev_name_linked, cdev_id);
 			tzi->cdev_binding |= (1 << cdev_id);
 
-			/* find the trip point in which the cdev is binded to
+			/* find the trip point in which the cdev is bound to
 			 * in this tzone
 			 */
 			snprintf(cdev_trip_name, sizeof(cdev_trip_name) - 1,
diff --git a/tools/thermal/tmon/tmon.h b/tools/thermal/tmon/tmon.h
index 44d16d778f04..f347efb47c96 100644
--- a/tools/thermal/tmon/tmon.h
+++ b/tools/thermal/tmon/tmon.h
@@ -77,7 +77,7 @@ struct tz_info {
 	char type[256]; /* e.g. acpitz */
 	int instance;
 	int passive; /* active zone has passive node to force passive mode */
-	int nr_cdev; /* number of cooling device binded */
+	int nr_cdev; /* number of cooling device bound */
 	int nr_trip_pts;
 	struct trip_point tp[MAX_NR_TRIP];
 	unsigned long cdev_binding; /* bitmap for attached cdevs */
diff --git a/tools/thermal/tmon/tui.c b/tools/thermal/tmon/tui.c
index 7f5dd2b87f15..b982c1d77402 100644
--- a/tools/thermal/tmon/tui.c
+++ b/tools/thermal/tmon/tui.c
@@ -238,7 +238,7 @@ void show_cooling_device(void)
 				unsigned long trip_binding =
 					ptdata.tzi[i].trip_binding[cdev_inst];
 				int k = 0; /* per zone trip point id that
-					    * binded to this cdev, one to
+					    * bound to this cdev, one to
 					    * many possible based on the
 					    * binding bitmask.
 					    */
-- 
2.48.1

