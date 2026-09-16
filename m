Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580354BE449
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552961; cv=none; b=pZop5LjnXTwnBuHwTlLHJ8rTMG51HGjSKv9x46+tkDfqCAP0hKNGAmjs7PyNogmJDu9anZ+0gCoAfOh5rkyNsVJCuVC/Ju9JhnC3K9tROs8K8K/04ysGg3NIfHK2acLv47YNVe59T+vuDrfpMf5YD0iRwbZNxZ6zNdI+XwxYN9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552961; c=relaxed/simple;
	bh=5oAnC5XxQbFxjHQ9Le/C4SQg17Wje6wO65PaTRMuQhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e8TVv4AoCFPy8ZK+kT8Y5W5T/sDruvAK567GMCFISYZL4smGNevgp1JnQ3x7o/nWf2bn8bvJPHuvvGpGLEnAiYT/D6TIZc/FSe/5BmXz0LSWw7CbG5bi+Sm0sLa4cyimpNbsVvlOW0VCF9EwnLZq6A3bnzc1d1T6P8/wHtuF40k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=CqQe5yOg; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="CqQe5yOg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=i7
	cCagWB/F1nT5qErBYmltBL3lbKiu4u8+t1y4kWsh4=; b=CqQe5yOgYhPzCiGZAX
	atY6KqF9CMw9FouSNI/Wi4CdEDOGnQkWpkuPAM0DK22CGS9+lVbpGawqcERZ0HUo
	9Bwatd42SOJf9G7skCv1G8EILkG5yNqkSI5Kh+jAVYN7pr5dTflYT/4iVVQ6wtBj
	OM8gel3806lLs4bTcBTyJiJjg=
Received: from deepin (unknown [])
	by gzsmtp2 (Coremail) with UTF8SMTPA id Ms8vCgD3d9PiaKpqcJkGAA--.29177S2;
	Wed, 16 Sep 2026 18:01:07 +0800 (CST)
From: Ziran Zhang <zhangcoder@yeah.net>
To: "Paul E . McKenney" <paulmck@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jordan R Abrahams-Whitehead <ajordanr@google.com>,
	Marco Elver <elver@google.com>,
	Nilay Shroff <nilay@linux.ibm.com>,
	Edward Cree <ecree@solarflare.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-kernel@vger.kernel.org,
	Ziran Zhang <zhangcoder@yeah.net>
Subject: [PATCH] list: add missing empty list check to list_cut_before()
Date: Wed, 16 Sep 2026 18:00:01 +0800
Message-ID: <20260916100001.10634-1-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgD3d9PiaKpqcJkGAA--.29177S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrW8Zr45tF1UCF1DtryrJFb_yoWfJrc_Z3
	4IqwsxWr48XrWqqw4IkF97Kr1fX3yxXF12qrsaqw17AFyDGan0ka48uF1DJw45Wws3ur98
	Aan5W3s7Wrn8AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiNAOXWGqqaONl7QAA37

list_cut_before() lacks the list_empty() guard present
in list_cut_position().

With an empty head and an entry not on the list, it
corrupts the list.

Add the missing check.  When head is empty, initialize
@list as empty, consistent with the existing
head->next == entry case.

Signed-off-by: Ziran Zhang <zhangcoder@yeah.net>
---
 include/linux/list.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/list.h b/include/linux/list.h
index 77fb62f79928..4d2061d35beb 100644
--- a/include/linux/list.h
+++ b/include/linux/list.h
@@ -555,6 +555,11 @@ static inline void list_cut_before(struct list_head *list,
 				   struct list_head *head,
 				   struct list_head *entry)
 {
+	if (list_empty(head)) {
+		INIT_LIST_HEAD(list);
+		return;
+	}
+
 	if (head->next == entry) {
 		INIT_LIST_HEAD(list);
 		return;
-- 
2.51.0

