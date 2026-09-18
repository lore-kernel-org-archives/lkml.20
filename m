Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113B94A2041
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719206; cv=none; b=U4XEPp6MIXZQKcOie1GgpKbnZ6BdXkaV0uIv/LdkmNvG8/VPFkmYVU01mJZH3oZ51rq4qU1PBYQzZFurkWQWzgMbSmnCcAFsaEzVMcZMcj6cRPCHFz5k1RojfL12izbPKlyKomlhM+0AyWbni+8x0UmUlNci2b9w5q0ZmOhZqDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719206; c=relaxed/simple;
	bh=TYPo0AjC92sG4ibISh77MqvxgMsC3vuvbr4a0Ovm+IU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NT3ajZzL+IGTviH0Cqpa6fuN1VUOhJnXgEqU3no5RSMf4JMYc9skwgeNMyVkU0MPO7ZXIL/vpa/iX9H80FfmVYMr9fQkzFf2JtbufDvuIg9iZo8w7oZA3ETEa5ekrKj3HpzaQWXOUQcI2wYTe5DkSLGXBRpz30zuvZkNyPuWHnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=FwnTF1jw; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="FwnTF1jw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=xj
	8oew8uzkbXr8SWDpsY9XwnrDU4b1027og5au+USQQ=; b=FwnTF1jwk74ewJ/t/f
	eW0+yKDjYdU7ZyI7Lw3oPxJKUEABz0/9M1hjd1IDfFe+I3+bQ46E4AXx2U5QavGL
	bu6A7QvPw+j667gMUtppIbGl1yCWsIaTgzjP1wvhT0djM+BPcv7twKjA/7Dnz81t
	HIY4Zi6rwLIQNNGPQQDSznV3k=
Received: from deepin (unknown [])
	by gzsmtp3 (Coremail) with UTF8SMTPA id M88vCgD3P5cQ8qxqHkUlAA--.61508S3;
	Fri, 18 Sep 2026 16:11:03 +0800 (CST)
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
Subject: [PATCH v3 1/2] list: add missing empty list check to list_cut_before()
Date: Fri, 18 Sep 2026 16:10:25 +0800
Message-ID: <20260918081026.8050-2-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260918081026.8050-1-zhangcoder@yeah.net>
References: <20260918081026.8050-1-zhangcoder@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgD3P5cQ8qxqHkUlAA--.61508S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrW8Zr4rXryxtrW5JrWxtFb_yoWDKrX_Z3
	s7Xrs8Gr4UXrs8tr4IkFZ7KrySgw4xXFn7Wrsaqw17ZFyDGFs0va4xZ3ZrJ3yfWrZ3Wr98
	Aan5ur929r13ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiIheHSGqs8hcEbgAA3z

list_cut_before() lacks the list_empty() guard present in
list_cut_position().  With an empty head, the function falls through
to the pointer updates instead of returning early.

Both helpers share the same kernel-doc wording:

  'You should pass on @entry an element you know is on @head.'

Nevertheless, list_cut_position() returns early for an empty head,
and list_splice() also checks its source list before doing any
pointer updates.  Make list_cut_before() consistent with them for
the empty-list case.

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

