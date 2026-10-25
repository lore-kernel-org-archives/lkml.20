Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950026;
	b=QElUl3luZYcNqp6i00EbH7xwLbgChqioIy9yL9apmE3v/pY8zzXvTuvUX7p6QW6t7tKZ
	 kynb75GZ5ba19QWF/Dpp7ju/GS7XoA3UnQBDoVM35CNRowJnLvbWNBEgTXVyk98t/l331
	 NJzR5x/K53iXCsYxW5WrdNQXVOGDXMjo6xVcC/YN1NYF7jOF9ieGMb7u40ar+Wnye1q7e
	 JSG9ld/Ez1yynr0eyn0N/74+dLUYEnydWTgfMk3atZhn3Ev03OyY43UMX+AqNxdOGMsCc
	 sWVkma4BZ1hcbp7nkQH72RaUnWsIoWpyJsRLkw3DO2WCd/konGxw22BHD3uQzyarcZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z1nKV9RROXIYz6IEYr9bUViL602rE2TVHzP14wnkAeE=;
	b=Pa9f8Pee5/uSMeLYqX8zDM06MRaOIh0WGnH2/bpEUbWkdOQ2hqJnWz7UCLMJvQR8cEwg
	 kQ9evY/DRdgm8zHiuWlWDw0M7UPZELHP3kqgH1783QwKTF9oPhO5bFA4Zto3SXijXLdQO
	 JzMt9kqZL5CFeuE10fV60mZgt7j3zUKnZyxCHTAnKYsyShiLPx8JZNPmqVUebde3ukqny
	 b1F6xE4JSToA9owwgypounj5F1dNnpGoL49CDD5kaoVMXn8BnQ+HwuwrUwhldL7GPGNYE
	 WoMuTZVO2iUMFf7hCruci+vuo9U7YPscLmkt/v6vWxjoZatPKz7y/viMAQhI44LJLfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=DctjwVz+;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CFE606A327
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76CFE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=DctjwVz+
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eafa528803so830968e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792950025; x=1793554825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z1nKV9RROXIYz6IEYr9bUViL602rE2TVHzP14wnkAeE=;
        b=DctjwVz+9328llN8524p+Cmds/Q+140TdZ6g7BvRcUzBT+WE6FsC0MGdxSUJJONf3L
         JzYBygsyhxXZIUqBri5ZQbsJn1fxnKYmhZr9R6WDH0QceOPsk5VnfbFCG+jZpal6U7L4
         njmvCvamubQ0hOIMW24r7QhKqNBczi6DAV27yhHPnArpdhRPlUkeSV9UCJlDrNYp8pc8
         Ywd93CR+ptwXQY7Ck2Xca5L3oD2bXvekKoIaz09/rFTR/yoI7n1VXvVRDfKN+f/Nzonf
         9WpyxKr/YRx/PtrWLwG8+q5AmVbj1tuX9xcFnPxOwALjB8mSjVLBsSMsCnrEeUw82W1P
         M/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950025; x=1793554825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Z1nKV9RROXIYz6IEYr9bUViL602rE2TVHzP14wnkAeE=;
        b=2XkYotWkyeg6yr1nQJHz5gsPP4axojyooxMefxG3gYTWLXV/qFA9QSv1sduavSr7Uv
         PfcOiOR4iIv8T/Q+KbcgB1dMGDUSXWbx/J7KT5eKjJMEDyk0sCZE3rA0DmwvmXmtPlRB
         LI5/HXQn0rQ7K97Qa/0a5Jp0gYj5BqPk5gECYJkQa4Eed6yH4G5D54yGn66mpXrpdIE4
         Z9OPY62trxt5JVK2fQe6B7Wm3GvpX2hLrB0+hYmF43DLCP9k8ls9Cw9Y9GmIMl3i1MCF
         W93Zx1EB8aHUvrl7r/aTLQJKEeL6VhZhSp0PsAmZ22RBd4aeWn6fj0FmtB94dnDprekt
         IYQw==
X-Forwarded-Encrypted: i=1; AKwUvByJG45WSycd35kW+OlIf48PeAMw3d67pDpzAtrZ4SyvfclJNvyBlE9fx/fYXiyrrr2WSDiaZKo/XkNjidQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK11gLmWgaVc/KeF2fFzdIerTMAoXHFVesh7VXl8sJR/Qjy2uQf
	FN1rTl50R5kBVjLZfhEOvxS7AKq49/WY/g5NLamGdxtBz4C7kLA89y8KP/tNZKd5qEc=
X-Gm-Gg: AYBFou0x9lVIXswOlKB/vByg3s1iRYtTMWzBGHbpKsErVdNHJtQj8B2xXyFXcS5eDuH
	JlwmTYj8oO8u+Kn+xf+TYrok5u7PnZxK0MSqcpk+8PGK3WF57VzAtqrqC0N0LEBBySLk87/rgGr
	jNm33xieZjoMF885UR/6CIUwqJLQ4A/t+LL0QyC8LhxXbfsRdoMxdUraiWrVkALYoLxWThcEwwh
	+7lnPpY+uuvxDZ/kKd/3lSClbfNMXENNForLECJBq4/8gd/lw9/QVIRnKAZJo2VaQKoTw0t5Z5C
	+2wM9XxvHYmozBoxzjOcZivIQDlH4JKu/YotszVaTf6JCbyvv+F6QUponiKd5THDOJDNIDyPulk
	wveCRxJ8OdUz9l2TGx2gzAHn2wriVRtX5U+6nkfeYElbG5o/XXPAZchOZ6aJFcpLkSlEg2i/0+Z
	o6ngVQzIws8vMM9/1LkrgPqDSEv9/PArwucnm7nkfJn/5mdRqzQey6np0RNh63seuxiIBHPnEa4
	bdyG6U+MRfbc7eEpqWDUL9wjB+EkreM1v04baA0Mvl3thxB+MCIRVbne6MZVzbvsXesUN4W5O6b
	rtgHMFPjGyKAC/PrgPrNENxe2AjwsFauAqkx1husS1OvEO6EJ7HXWbjwdPI/aAQwppffLVR4Q/U
	X
X-Received: by 2002:a05:6122:83c3:b0:5ea:d1c4:7cbe with SMTP id 71dfb90a1353d-5ec2332c72bmr1427722e0c.23.1792950025414;
        Sun, 25 Oct 2026 10:40:25 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234673ebsm5783333e0c.13.2026.10.25.10.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:40:25 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	kuba@kernel.org,
	enelsonmoore@gmail.com,
	bp@alien8.de,
	shuah@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vbabka@kernel.org,
	dapeng1.mi@linux.intel.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	elver@google.com,
	graf@amazon.com,
	lirongqing@baidu.com,
	liam@infradead.org,
	jlayton@kernel.org
Subject: [PATCH v2 4/9] kho: do not modify incoming serialized blocks
Date: Sun, 25 Oct 2026 13:40:11 -0400
Message-ID: <20261025174017.3870481-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
References: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
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

When restoring an incoming block set via kho_block_set_restore(), the
physical chain of blocks is already linked and bs->head_pa is already
set. However, kho_block_add() unconditionally rewrites last->ser->next
and bs->head_pa, and kho_block_set_shrink_one() clears
new_last->ser->next even when operating on an incoming block set.

In the upcoming KHO read-only mode, incoming serialized blocks are
mapped read-only and must not be modified. Guard the ser->next and
bs->head_pa updates in kho_block_add() and kho_block_set_shrink_one()
with !bs->incoming.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/kho_block.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block.c
index 0d2a342ef422..a4e945f28fad 100644
--- a/kernel/liveupdate/kho_block.c
+++ b/kernel/liveupdate/kho_block.c
@@ -93,10 +93,12 @@ static int kho_block_add(struct kho_block_set *bs,
 	list_add_tail(&block->list, &bs->blocks);
 	bs->nblocks++;
 
-	if (last)
-		last->ser->next = virt_to_phys(ser);
-	else
-		bs->head_pa = virt_to_phys(ser);
+	if (!bs->incoming) {
+		if (last)
+			last->ser->next = virt_to_phys(ser);
+		else
+			bs->head_pa = virt_to_phys(ser);
+	}
 
 	return 0;
 }
@@ -133,10 +135,10 @@ static void kho_block_set_shrink_one(struct kho_block_set *bs)
 	kfree(last);
 
 	new_last = list_last_entry_or_null(&bs->blocks, struct kho_block, list);
-	if (new_last)
-		new_last->ser->next = 0;
-	else
+	if (!new_last)
 		bs->head_pa = 0;
+	else if (!bs->incoming)
+		new_last->ser->next = 0;
 }
 
 /**
-- 
2.56.0.307.g5fe7bd680c-goog

