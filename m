Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1652E54B6
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787989344; cv=none; b=lky8feiIBARm+yEjWhLdO4+125/IV1DGyWoCu/BBPyhcpAx5WYrvelcgW3Fsl/xykAX5qMG3uXe+8yiUww+kZV2DR6TTlAETjHtIjmWXInzLeWWFjggTrnAc4YZitvgU7ZxsFLI7GMp6O1qtaB1WFqb+vtPi7jE1dbeaIPx8kIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787989344; c=relaxed/simple;
	bh=nwFy8kCYzz8DtISgfMT58KJmiasHFztc+vuXUAB7SPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HGNVfTWJyo2ot6CwuDDZw5OBvktWdjKl1fBYtTfd14mJMj3gm+EkD7ChIkgyYvsjRfEI++GIsY7zrslNvrICWR3W/J8tD6x0ssXzdJd6WBVXWxDoAI8KszIHDKGq32F7x+tbWmHyZwX00d0elBZd2L6XpzAjOqT9vE6T3oINteY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UdOdwJ4L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UdOdwJ4L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66ACF1F000E9;
	Sat, 29 Aug 2026 07:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787989342;
	bh=E2pnQ2VYIoa3WiugIYl7Jp3rxV5b0Mqm4HU5w5Xg4uo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UdOdwJ4L1EiMt94CheIbvvTHNp40JARJbaPYbLKdR8O16tMBHur/IaGOamJRA1IQr
	 Anbh5gB1YSRpAMeAGR8+BdMgXvvym5h8Lnc0DZCccOelPrSrVAjfkU4KCbhEEO1E62
	 LcLQ9GpnPEEJ0qAHuSwPowzHwy3hiIpHyaUM4JQAHUjcLWj9n2OPKES+hXvVwdgz8Q
	 BN4XJyxv9v69l7FveED4v8uH6UAAYTEyDzCs751U8H8gWGYHo+U+3M/83eC98MQKTH
	 ngSNvLH6KEqw7Ksl0hQ4DSnRAE1SDyWGY9sclcESg50ZZf7IJDzUJdGBQfOvT9ecHj
	 t7ohmgZveEDQg==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	lianux.mm@gmail.com,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	stevensd@chromium.org,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>
Subject: [PATCH v2 2/2] mm/mglru: make retry logic explicit in isolate_folios()
Date: Sat, 29 Aug 2026 15:42:04 +0800
Message-Id: <20260829074204.45304-3-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260829074204.45304-1-baohua@kernel.org>
References: <20260829074204.45304-1-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing mainline code retries the same type once in a rather
subtle way. `for_each_evictable_type()` may provide one more iteration,
allowing the same type to be retried if we scanned some folios but
failed to isolate any due to protections, promotions, or races. This
patch makes the retry behavior explicit.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 35a233623368..718f59ffc688 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4852,6 +4852,7 @@ static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 	bool type_fallback_allowed = !is_single_type_reclaim(swappiness);
 	int type = get_type_to_scan(lruvec, swappiness);
 	int total_scanned = 0, scanned, tier;
+	bool tried = false;
 
 retry:
 	tier = get_tier_idx(lruvec, type);
@@ -4871,9 +4872,18 @@ static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 	 */
 	if (!scanned && type_fallback_allowed) {
 		type = !type;
+		tried = true;
 		type_fallback_allowed = false;
 		goto retry;
 	}
+	/*
+	 * We scanned some folios but failed to isolate any due to promotions,
+	 * protections, or races. Retry once to avoid a larger loop.
+	 */
+	if (scanned && !tried) {
+		tried = true;
+		goto retry;
+	}
 
 	return total_scanned;
 }
-- 
2.34.1

