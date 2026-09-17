Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1474BD377
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649834; cv=none; b=K5gPNY8mdgMUL+BvEBAtGlMoLm+M0mxq1ik6Ec4y6sH3cYwUNg73FEspIE/o402L9JKnshAgYfLjPmdoqyYw0WPLYgXjZ0jxAxZpzxjaCbhce/+qDA4erhqVDWCCzLYwnvK7oDnEEZM1S2SEIH0c8TwV0QQRM7rghcjG8HJz/wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649834; c=relaxed/simple;
	bh=afLLov8+HOFjnVpN4kyARrrj11AlwaPGQMEWRQ+A5d8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uzXeaikCsfijfmpsUp40i8rv1xn/kBgXKNwIfzwx8WevPPCwPtT993GLSDhi2hlgWL2Aj7MqvQbqUudu11laaRHqWZdzlhF91Qlw9Hkklr7rtZYs1BW65TXr176PUsSyzzkotGLq1yVwBP8pNpKQmUY0xSdVXnm5JPbEEP0bKHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=asXTqF6f; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="asXTqF6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=iB
	/ct50ZWCmIaRLVOTouf0UtbqUJgCxWBOwHAPKRSec=; b=asXTqF6f7IEwrPw45u
	ydwhNYOovPz94sLYC+SjqVycfTIZWL4b3QtQEARLmp4lZDYfW7IWRRyRGh66wFMN
	9IRDqbVgx72IZNPkusq3Gvh7okHLSu6WFLtRLrCK+B5f7O0QejSzLbCDwIyCKFnJ
	e3pEqPCpefu38vaagHGgXXNYI=
Received: from deepin (unknown [])
	by gzsmtp3 (Coremail) with UTF8SMTPA id M88vCgD3r5dQ46tqBSYYAA--.16246S3;
	Thu, 17 Sep 2026 20:55:47 +0800 (CST)
From: Ziran Zhang <zhangcoder@yeah.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jordan R Abrahams-Whitehead <ajordanr@google.com>,
	Marco Elver <elver@google.com>,
	Nilay Shroff <nilay@linux.ibm.com>,
	Edward Cree <ecree@solarflare.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	Ziran Zhang <zhangcoder@yeah.net>
Subject: [PATCH v2 1/2] list: add missing empty list check to list_cut_before()
Date: Thu, 17 Sep 2026 20:55:04 +0800
Message-ID: <20260917125505.50897-2-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260917125505.50897-1-zhangcoder@yeah.net>
References: <20260917125505.50897-1-zhangcoder@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgD3r5dQ46tqBSYYAA--.16246S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrW8Zr45tF1UCF1DtryrJFb_yoW3KFc_Z3
	4IqwsxWr48Xr4qqw4IkF97Kr1fW3yxXF12grsaqw17AFyDCan0ka48uF1DJ3y5Wws3ur98
	Aan5W3s7Wr15AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiNhOSU2qr41M3HwAA39

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
index 77fb62f79..4d2061d35 100644
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

