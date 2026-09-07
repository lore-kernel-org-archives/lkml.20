Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229184052C7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764037; cv=none; b=GQEfRAdJ5uZAqQWJHgc/uwFdhZ8I4CRYpE6v5znC+GYEpuF4Pwak+xdKsg3+P3FSaG6LQbpwf0dT2792rZxMz89mal52eXtneQd2rOPISbjNndRcm8kS1H2IKL2ND20sQ/oyD3HHsvKvqPtVSN0yXgsZ/Cs9YIr8CNoUbRs1h6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764037; c=relaxed/simple;
	bh=megiVGF/82dG+y9yxsVi5uTkaxEpYTjKLr+FiVn/yiE=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=t+5lAsRHyazpYChwxbkLz5jImSmnWUup+hlvANQIoxYQdVfyTgJxGUKOKeM6crCMTRqor3rLEnatWjUd7gKeIBZ2ziB63YnNIn6HzOluYnnpnO9TnOftYjIb7S4N9Co4cz3mdXCK02AC2nj0XvkcvTLaEN057wyUE9GnP1emypI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hdd8B61wkz8Xrrb;
	Mon, 07 Sep 2026 14:53:46 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 6876reX2046712;
	Mon, 7 Sep 2026 14:53:40 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 7 Sep 2026 14:53:42 +0800 (CST)
X-Zmail-TransId: 2af96a9e5f76471-521a9
X-Mailer: Zmail v1.0
Message-ID: <20260907145342529uOGtNYWTAzrSCFnghfgCb@zte.com.cn>
Date: Mon, 7 Sep 2026 14:53:42 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <akpm@linux-foundation.org>
Cc: <xu.xin16@zte.com.cn>, <xu.xin@linux.dev>, <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>
Subject: =?UTF-8?B?W1BBVENIXSBNQUlOVEFJTkVSUzogdXBkYXRlIFh1IFhpbidzIGVtYWls?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6876reX2046712
X-TLS: YES
X-ENVELOPE-SENDER: xu.xin16@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Mon, 07 Sep 2026 14:53:46 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A9E5F7A.000/4hdd8B61wkz8Xrrb

From: Xu Xin <xu.xin16@zte.com.cn>

Now I'm moving to the @linux.dev account, so map my old email addresses
and update them to my new address.

Signed-off-by: Xu Xin <xu.xin16@zte.com.cn>
---
 .mailmap    | 2 ++
 MAINTAINERS | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 5e3e1ed3228d..5c9aadfe656f 100644
--- a/.mailmap
+++ b/.mailmap
@@ -991,6 +991,8 @@ Wesley Cheng <quic_wcheng@quicinc.com> <wcheng@codeaurora.org>
 Will Deacon <will@kernel.org> <will.deacon@arm.com>
 Wolfram Sang <wsa@kernel.org> <w.sang@pengutronix.de>
 Wolfram Sang <wsa@kernel.org> <wsa@the-dreams.de>
+Xu Xin <xu.xin@linux.dev> <xu.xin16@zte.com.cn>
+Xu Xin <xu.xin@linux.dev> xu xin <cgel.zte@gmail.com>
 Yakir Yang <kuankuan.y@gmail.com> <ykk@rock-chips.com>
 Yanteng Si <si.yanteng@linux.dev> <siyanteng@loongson.cn>
 Ying Huang <huang.ying.caritas@gmail.com> <ying.huang@intel.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index dd9a3370ff31..4b5fe98ed01a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17240,7 +17240,7 @@ F:	tools/testing/selftests/mm/gup_test.c
 MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	David Hildenbrand <david@kernel.org>
-R:	Xu Xin <xu.xin16@zte.com.cn>
+R:	Xu Xin <xu.xin@linux.dev>
 R:	Chengming Zhou <chengming.zhou@linux.dev>
 L:	linux-mm@kvack.org
 S:	Maintained
-- 
2.25.1
