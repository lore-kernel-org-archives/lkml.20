Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FF641DDF0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234202; cv=none; b=YpU57L79olqKOfJ/tu0L806t2u0TrXTQBH7JFH+B8tTt74KbJ+VvzMxbsTu/ULH1NMZ9Vi/T4sVrkfOZqwsdh5OXEPa0lqdHzc2tbsIGGu4kElPdAw5rGfxZPmuABEhj9n0jyE8CQ/dcDC0h4eDIh/WopWhhT2qCPVy5/VvdUyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234202; c=relaxed/simple;
	bh=hYnJ9I+SNx7F4uX7FBbOoRj/uPSXg/C3ApDaKmBP2ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OGBxTL93/u8HU76yQzgV0drlLlv3SlX305AOBAHFyKnXFn26gW6+wdHYSaSP9R/RsntKQ0pcMWcsZkfyTjGcMdV10mACSR2gLKzdDeM3gnpf6SRrTIE8IUWU6foUZeex4YAFlj2YcXx1ee63XGrVbbQP19HpNRVCUG+ieWtB2qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjJElf+8; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjJElf+8"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so995307a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790234192; x=1790838992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IsM2VZ0IjpuwkgawgmQ1mCqOQgkHltfRpIT8ot/Ka44=;
        b=OjJElf+8SyKAZx81/sX9xCITxHIaz11/iYWorlcKfjbrYCBXXuUfNkauFixvD5goZr
         V9CZqiZixhVYTV5WxxT7WpKrpC721pdP730GgFSTsxMbF+qnDztggpAS+XQ5Qj8F/IDn
         wDpt9DWbed/AN/14wrWdhnU2ZeqNtTOYgXID4PMrghUjVmMPT8eiLT4PpuH7FmEVre2X
         5K/6gwv33djUr7KayYa0HCcB9sFmjMVmHaPC1yoOhCQjnyMsQaJlLoOC9NuLS9DMAvje
         MgUVCBWWJaLA11FG3qh4t+HEqPjpJrTN4Czg8Z57qGt44tI58HY+lgDEueN/65PbiWhP
         sOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234192; x=1790838992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IsM2VZ0IjpuwkgawgmQ1mCqOQgkHltfRpIT8ot/Ka44=;
        b=R8Z0v4mqlwSZWcAsfpSVion2PZSoI2zSeIbkzj0fganwGxJ9YYeZBxk7miQbUWHh45
         f+h7jIR/j62N2C2GvYR0JopBfGtNNmnTufRHRexQkfOjx8BdciSV1wn090GvJWFn5Zz7
         M8Ukv3Nrq+WPtkWppp/1pwcncnczvxrkiHK/ofoXEj2Xd24Z7RYHpGZ0dE7dGW9+8bpX
         kqePTF7hN6ERkyDrxjCNyyuYGNZdX61c3Kwul15sq+scdYNlSqw1N2yDI54f2ed+/0UU
         0Li8HPKrwH6UynguTwshWQMEZZRGQhVeS8mOhaf4AcwMAZyyK9VIqlEJXcw28zicJGYQ
         xl2A==
X-Forwarded-Encrypted: i=1; AKwUvBx6Ed4d5/1vUMCthWxEtYkul4DyM/5Knsr/0oyzwn/Bt+HC21x2KIDexAcqMveRo9VKsUadf1SjeV0oPEM=@vger.kernel.org
X-Gm-Message-State: AFuF++lbeHEBrvGTz5Xu0R5Ik4pvD2kgXRT6RuQoTrELPFxNzrBEbYQJ
	mH3RWKWYIrupNuqb3XcqJZv6w/Kz9vjzUS+dQu8hBAUD4EcvGQEToX6A
X-Gm-Gg: AYBFou3qKLmzjUBzjDjGQk7yG02qSzqNC62kd2x40N0zW4LrAc6kOZdk0Z1OfSs0T/b
	883+GihBz8jFH8OOPWH2yRSI7mSbJiG5odBj1jqzK5dmPzJN1mFryZtqec13fjLSHLds5O8kYne
	O68NZuHUPka0Sfr7bZbQlChHrvzESq9vDrfsF2Ph/6G7O1G7x4HfSgLFlwKTJ81g0XVvhYJS8gJ
	TbvVndwCarUcV37FcXePMrZvmtQrpbzxnIIcWYhbbFbpqK5epOxYtKehIcruDLUojB7buYhvSF/
	pMk5yUIGlsjCTHYfjfRWFaW2cs1Vkw+THREZPTtOBvYYjm7Rt3Dyj7qVGW5Anql2HCLWoQ7+Sbv
	N2lX/AJqqXlHzpoVQIzyAHc21D9LRmZSlLW2BF2TGfwNVKj0ufdQLhARPpWIeMllq2IYX9eysIK
	XNgawWt0MTNUgUoiLrZmXKEyJxoss4BcylbT9lLMZBGKJRewxI52WWEuFG+7yiBaSgwpF5Oezk+
	KMpW3URqjzFSAa8K16GYkr8njFnNRFiQybinTE0IgW1IfWeclmof9Qr62n9T+/unteQWGE/gt3p
	ijcWuVwlbg==
X-Received: by 2002:a17:90b:4c0b:b0:39e:6a81:5a96 with SMTP id 98e67ed59e1d1-3a098e37bbamr1320905a91.42.1790234191488;
        Thu, 24 Sep 2026 00:16:31 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972efa00sm4003402a91.5.2026.09.24.00.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:16:31 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: kuniyu@amazon.com,
	edumazet@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH net v2 1/2] af_unix: decrement u->inq_len when skipping unread OOB skb in manage_oob()
Date: Thu, 24 Sep 2026 07:16:28 +0000
Message-ID: <20260924071629.2683160-2-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260924071629.2683160-1-benquike@gmail.com>
References: <20260924071629.2683160-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a normal in-band read on an AF_UNIX stream socket (without MSG_PEEK
and without SO_OOBINLINE) encounters an unread u->oob_skb in manage_oob(),
manage_oob() clears u->oob_skb, unlinks the 1-byte skb from
sk->sk_receive_queue, and drops it with SKB_DROP_REASON_UNIX_SKIP_OOB
without decrementing u->inq_len. Because queue_oob() incremented
u->inq_len by 1 when queuing the OOB skb, u->inq_len remains permanently
inflated by 1 byte for each skipped unread OOB skb, causing SIOCINQ /
FIONREAD to report a stale positive byte count on an empty socket.

Decrement u->inq_len by 1 when unlinking the unread OOB skb in
manage_oob().

Tested in QEMU against Linux 7.3.0-rc3 by sending three 1-byte MSG_OOB
packets interleaved with normal stream data on an AF_UNIX SOCK_STREAM
socketpair and draining all in-band data via recv(): on the unfixed
kernel, ioctl(SIOCINQ) reports 3 on the empty socket; with this patch
applied, ioctl(SIOCINQ) reports 0.

Fixes: f4e1fb04c123 ("af_unix: Use cached value for SOCK_STREAM in unix_inq_len().")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Split the manage_oob() and unix_stream_read_skb() fixes into a 2-patch
  series as requested by Kuniyuki Iwashima.
- Update Fixes: tag to f4e1fb04c123 ("af_unix: Use cached value for
  SOCK_STREAM in unix_inq_len().") and clarify the commit message as
  noted by Sashiko.

 net/unix/af_unix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 42cffeafc8c1..1770af3c2684 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -2849,6 +2849,7 @@ static struct sk_buff *manage_oob(struct sk_buff *skb, struct sk_buff **last,
 		WRITE_ONCE(u->oob_skb, NULL);
 
 		if (!sock_flag(sk, SOCK_URGINLINE)) {
+			WRITE_ONCE(u->inq_len, u->inq_len - 1);
 			__skb_unlink(skb, &sk->sk_receive_queue);
 			unread_skb = skb;
 			skb = skb_peek(&sk->sk_receive_queue);
-- 
2.55.0.1082.g2b9226bbc0-goog
