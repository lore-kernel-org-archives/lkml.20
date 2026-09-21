Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7866030D403
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789956027; cv=none; b=b9ZrOv7gRlMSpDBQIByRbx3Nc91fmRGTDWdALmbXi9cL8EF+np+8QTbSCquwESWAsopiB9Oy/SkukGO2UbE9qQXepEkConqxZqCxCtJeTczLehhYJuiyX1oF4GUWIXTDo2V00Y9710ZPDJm/YlVGAH7kkz429eilM6VfrqCV6Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789956027; c=relaxed/simple;
	bh=HwrVy46pwm1N9U0NvKR0Xl4rsY8ItGDn5v+sE6KvLUE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qZRx027f/cupqV7NrDzQ1vGEzpYMpwJsmJ5NZubgOrApksA1P63OcMPC2KhjeGlpWp0fVNzskmIYI5QC1MlhfXRkadgczr9kOpdHh//Evrv9solJuKkxwMjohbG+6zfnC1OSuer+781PgPxUFDGEnpU2E1N9h9ZHct22XamTV+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CoxaEpjp; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CoxaEpjp"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369d18so17622685e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789956022; x=1790560822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OijqBYKK0m6rMTpt09frMbajAxUXg2fiGkgxoIrzzPc=;
        b=CoxaEpjpxH/iFeYQcrfBhu8PWGCKfgdOuPOsxutuhuvZuD0AKdykpq7wfQJXw76plG
         bjBw5nBPqaPZWmX0piwAjorxgW0EoVlX4Cc+lu+KoPsOge67M2vsZtFpW1KQiewCPWIC
         2/oAsHE65e05BkPndzawKqIlHqKfLdEzLcznWMZxJElAo8hqdG1OLmY+2PvOmQB5no1U
         O/n+Kr/a23hM0XqdmL7Uy02ilKJYII1ia6dI7YXms/MzISluokQM1o8N5oM2v6F29Ne8
         6Co7TOdnUMyzMV49kwmujzrZZ6Sd6ZKkJ10px6SN6M+doKG+/OSeNiY2C8KuFvw+eZQr
         j7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789956022; x=1790560822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OijqBYKK0m6rMTpt09frMbajAxUXg2fiGkgxoIrzzPc=;
        b=fYr9g1wI2bxXyxEMxthjkOuWNIX8p+wGWRn5h6CgRQWTt7lgb28zaIDOTYwO11Gr1X
         rdk5inhCBtAHeOKvQ3NasLGVBZUc/L7CSKSe2jDzn2SlZuKrZELdcjtGD+mq7kFmhPVH
         louM/+/1TSwsQCzO9PrAg5GvQjYuczk+mCYOmY53SvViYaXDjvK97XlCMhnj7a0JgSm3
         IT9rn2au0B0jefxtEVIHEXT4BI+Z5MIsvN8IsBJPE2feECM+MGgEFFfOf60pQxGy9Yub
         lHPU2W5EPYdDJjobLGdQzjz/THaGO5k8fU9YEm28SbrPWZ8pZi84dlBwkC+TiyXqzDIh
         56Bg==
X-Forwarded-Encrypted: i=1; AKwUvBx4+dDzOosmYDokgd4Vxq6O/WPX0LDSDIogJpqZSqt8gBLSXl7GOaaE3PxdPU5T2XQ/6pmVc5LcmNKbshc=@vger.kernel.org
X-Gm-Message-State: AFuF++kN/d3arsvtB6FVj5FZHMEUq25hl7Gz8WJghfp7FMIuVrLQshre
	3KnbMxloHL2Tkw7V1Mub0WLcC34np9BWDyPbPdNsmbvbKser88jzdt/A
X-Gm-Gg: AYBFou0qNmbd2v/kNHL+G0iZSEpebvGb/j/LNki7iN88u2w68rNQ99WNJrMplA2fCZB
	PkNTNEj1/azpBLzV/l7Mvylqqfx4oA1FFBB7fUawUprXXIFxtUP64RmdBsFJWw5nEUKTJaLgfRm
	JXayMC9NaZqilA2yIvG/GgwIjcjjzagYuHOwsU7LZCuK0FLrgphbZK8UZnRVSztQZdZ4yR04hcm
	e+bMnF3ym24NHiIzc1ghZs40ZKwqPJfn2RmSSiTzEbISe4JeFfycdiZKoUOuhXvbyw46tJ1xmX+
	uU0UeWFh1kVAZn+pi4UfN/WOmreN72Zp64NCajGHKLH9dnZB1XEmM+4/VNegpxPHoMkGCMYFs/5
	uDr3+IYrr0kn4qoNqg53wr/u4kPIOurY3hxyZlAqx5teli2vuKDfu87Bz52XAwT+7M4cbtiDlRl
	b7mG/QKoqoObRXXCca5I2bf9y462MioW6yl2wqhRihhnMKY5GE242SPvYAn1ep0xlqbO4DScJBB
	XSZTSfD5dN66ysWB7Z9Pbvfhmt60SZmoVC6duNwBwhb1nfXEoQFfOhgwmQMcLOQD2f/KUOcnlk5
	yVBgEfITP4hM5HqPtolSPsTWG3KaCPHeFX0UbaiUQe6KWIpbB4VgK2y6FJ8kjA6jk5uQZ331XWX
	jTQ==
X-Received: by 2002:a05:600c:1f95:b0:49e:7862:c09e with SMTP id 5b1f17b1804b1-49fc57238b8mr117988965e9.14.1789956022582;
        Sun, 20 Sep 2026 19:00:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8e9-c501-2c36-515f-49b6-c492.310.pool.telefonica.de. [2a02:3100:a8e9:c501:2c36:515f:49b6:c492])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd10273fsm193284995e9.7.2026.09.20.19.00.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 20 Sep 2026 19:00:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lian Wang <lianux.mm@gmail.com>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mm/damon/tests/core-kunit: test PSI goal values with explicit samples
Date: Mon, 21 Sep 2026 04:00:13 +0200
Message-Id: <20260921020013.33105-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921020013.33105-1-kmehltretter@gmail.com>
References: <20260921020013.33105-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Test the PSI current-value helper with explicit totals so the result does
not depend on the test system's memory pressure. Cover an unmeasured
consist goal, unmeasured temporal goals with zero and nonzero effective
quotas, and measured rounds for both tuners. Check last_psi_total after
each call.

With the old unmeasured-round behavior retained in the helper, the
temporal check with a nonzero effective quota fails.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 mm/damon/tests/core-kunit.h | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
index 5ff0436c58441..a30040826874e 100644
--- a/mm/damon/tests/core-kunit.h
+++ b/mm/damon/tests/core-kunit.h
@@ -910,6 +910,48 @@ static void damos_test_commit_quota_goal(struct kunit *test)
 			});
 }
 
+static void damos_test_set_psi_current_val(struct kunit *test)
+{
+	struct damos s = {
+		.quota.goal_tuner = DAMOS_QUOTA_GOAL_TUNER_CONSIST,
+	};
+	struct damos_quota_goal goal = {
+		.metric = DAMOS_QUOTA_SOME_MEM_PSI_US,
+		.target_value = 100,
+		.last_psi_total = U64_MAX,
+	};
+
+	/* uninitialized last_psi_total keeps the consist tuner quota */
+	damos_set_psi_current_val(1000, &goal, &s);
+	KUNIT_EXPECT_EQ(test, goal.current_value, 100ul);
+	KUNIT_EXPECT_EQ(test, goal.last_psi_total, 1000ull);
+
+	/* initialized last_psi_total gives the delta */
+	damos_set_psi_current_val(1030, &goal, &s);
+	KUNIT_EXPECT_EQ(test, goal.current_value, 30ul);
+	KUNIT_EXPECT_EQ(test, goal.last_psi_total, 1030ull);
+
+	/* temporal tuner keeps a zero quota */
+	s.quota.goal_tuner = DAMOS_QUOTA_GOAL_TUNER_TEMPORAL;
+	s.quota.esz = 0;
+	goal.last_psi_total = U64_MAX;
+	damos_set_psi_current_val(2000, &goal, &s);
+	KUNIT_EXPECT_EQ(test, goal.current_value, 100ul);
+	KUNIT_EXPECT_EQ(test, goal.last_psi_total, 2000ull);
+
+	/* temporal tuner keeps a non-zero quota */
+	s.quota.esz = SZ_64K;
+	goal.last_psi_total = U64_MAX;
+	damos_set_psi_current_val(3000, &goal, &s);
+	KUNIT_EXPECT_EQ(test, goal.current_value, 0ul);
+	KUNIT_EXPECT_EQ(test, goal.last_psi_total, 3000ull);
+
+	/* temporal tuner uses the measured PSI delta */
+	damos_set_psi_current_val(3250, &goal, &s);
+	KUNIT_EXPECT_EQ(test, goal.current_value, 250ul);
+	KUNIT_EXPECT_EQ(test, goal.last_psi_total, 3250ull);
+}
+
 static void damos_test_commit_quota_goals_for(struct kunit *test,
 		struct damos_quota_goal *dst_goals, int nr_dst_goals,
 		struct damos_quota_goal *src_goals, int nr_src_goals)
@@ -1947,6 +1989,7 @@ static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_nr_accesses_mvsum),
 	KUNIT_CASE(damos_test_new_filter),
 	KUNIT_CASE(damos_test_commit_quota_goal),
+	KUNIT_CASE(damos_test_set_psi_current_val),
 	KUNIT_CASE(damos_test_commit_quota_goals),
 	KUNIT_CASE(damos_test_commit_quota),
 	KUNIT_CASE(damos_test_commit_dests),
-- 
2.53.0

