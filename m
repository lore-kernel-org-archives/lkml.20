Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111584;
	b=5YDBXbqqghwY5ou44h8LklX9yU9De/8d3Jw3wIb9iDE4rDU/Yh5zPKTqPj7bfCYh5YCa
	 GwzYb+Hs0dBnouwxJB0DL0aAOZExBnJizxLCGmcXmPhFvkoUXmIMciSdgiHULafjSteYy
	 +RY/emvTF1fzLe8b288fVA3XDFmeOUWFGXVvqZY8MXHvqYuAj+VHQYhm1+QfI0nlQirS2
	 a4dic+1EYr12znS2iTa8FB0yuZUHcGmQ3oX62jwOcMejB0ozP8Q8swgNnISpfPasu1usq
	 yN9Wn3Gzc3Cbnb3wLUVwtQimiwibj5ZtdA62+VtsvDHiwS2QOz2SqJLlFfBjQzwxxHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111584;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=XSWGgJ6hYI/KOiXuOcFK2XVt7Qf2W4lHd+pAlaLgxig=;
	b=1apWNrzXQWwzgx1ZIMnrW6KvWjp/AngoOICGGwln7h25ezEdHaOnsbyMUX0uJugC5Jx2
	 g6vcDNKx514ImYR4m8NM4wOax8OzVeoWSS6U6Xw3spGdG4ZJv4v9f4X+S9RYYKesk+qzH
	 gMKrqWj2V8yBReHi4+p9AF8z18ljl4XuqlMfnSWQNLeeMglYEV8zDLOxLIPNwR+lR08Xs
	 OFZH1IkO6YNnxbqF4Mg65dXQj1x7F49dWpjHJumbLA5ZCjd79yMcSdDgVE7GzJO3RmTAT
	 TW/+7To51q2mEg7cZdxwl0revGuWDcEsrNQV3JIVeGWHp9ouPM3uSScBxD+8ViMKcUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NqJKMVqP;
	arc=none smtp.remote-ip=91.218.175.159
Received: from mta0.migadu.com (out-159.mta0.migadu.com [91.218.175.159])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0565606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0565606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NqJKMVqP
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HZtfZPs1FinHHtMXJxZIdjf5srK1KUQQAXu2PZnqRrA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793111580; v=1; x=1793716380;
 b=NqJKMVqPe2MXNlAUyEtIlSdj6bMLn52gM8cV6kPPGY72V/wxYs6Ut8+GpP5ET18Th9xnULBK
 GsT7pIrQSALFrlyusRVgZrL+mHav3RnM83iT75l8csCM1/XzkhMabLbC8MPR1UYhLSk+k3aNF+E
 9wYCIHl2e74HpI2wnDyrfceU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 74b54dcf616a528b;
	Tue, 27 Oct 2026 14:33:00 +0000
X-Mizu-Trace-ID: 74b54dcf616a528b
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	Christian Brauner <brauner@kernel.org>
Cc: Meta kernel team <kernel-team@meta.com>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] kernfs: avoid READ_ONCE() on a kgid_t in kernfs_new_node()
Date: Tue, 27 Oct 2026 07:32:47 -0700
Message-ID: <20261027143247.3537239-1-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernfs_new_node() reads the parent's gid with READ_ONCE(attrs->ia_gid).
That gid is a kgid_t, which is a struct.

On SMP alpha, READ_ONCE() ends by casting the value it loaded back to
the type of its argument. Here that is a cast from a struct to the same
struct. GCC accepts that as an extension, but ISO C does not allow a
cast to or from a struct type, so sparse warns:

  fs/kernfs/dir.c:751:31: sparse: sparse: cast to non-scalar
  fs/kernfs/dir.c:751:31: sparse: sparse: cast from non-scalar

Read the gid_t inside the kgid_t instead, and wrap it back up with
KGIDT_INIT(). This is still a single marked load of the same four bytes.

There is no functional change. With GCC 12 for alpha (the config from
the report) and GCC 14 for x86-64 (with and without KCSAN),
fs/kernfs/dir.o has the same object code before and after this change.

Fixes: 81bdc85b4c08 ("kernfs: fix up the unlocked attribute reads on the creation paths")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610261608.vItiXCGW-lkp@intel.com/
Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 fs/kernfs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 324d61a00545..800af10d9511 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -750,7 +750,7 @@ struct kernfs_node *kernfs_new_node(struct kernfs_node *parent,
 		struct kernfs_iattrs *attrs = READ_ONCE(parent->iattr);
 
 		if (attrs)
-			gid = READ_ONCE(attrs->ia_gid);
+			gid = KGIDT_INIT(READ_ONCE(attrs->ia_gid.val));
 
 		if (flags & KERNFS_DIR)
 			mode |= S_ISGID;
-- 
2.53.0-Meta

