Received: from mail-dy2-f22.google.com (mail-dy2-f22.google.com [74.125.229.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3543D9DB1
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331798; cv=none; b=YCfsWOX31e7rk4+VqY0XF403uCs8NtdNNuVS+0RZrAKsH0uj4qX8pKyDDbizRhIT6mN852CBRLiuI1ZuMqYipJHRFeElado/0YWchdYgk0TIU+7rrImQO6ShTtOFhC8XnDTSuL2k7JeF3T0XJ7E84rUz2RGCAdsyn00WO5FZpVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331798; c=relaxed/simple;
	bh=mDdyMt4mBSW5dZoc1QnhsOw+/jXsk9ugPdpqXkaOaSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IYy3yzqlfegw5QxNbjd+croiyH7xJ6r7Ha76468RL7Qlkux7G5llyO10tfGugNr69jk52w2J0GV3tQzp8WM01G3M7tMVY0cZ2h1rkDSyDPnlKUahIpT0tG1X1M70cuLyuXJebvfIdsPHnOR7QmHTf+Qz4NvY3H/U78+Oyaw+FrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okpoLDjV; arc=none smtp.client-ip=74.125.229.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okpoLDjV"
Received: by mail-dy2-f22.google.com with SMTP id 5a478bee46e88-33bf5a1c4d9so705319eec.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790331796; x=1790936596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=12Fh6BMJIooO0/2QE68C+wpNaed+kt2rWF3HqIokZ3w=;
        b=okpoLDjVLtPs7hK51Wamal3hTnH4+MCbuSEBUc1Fmz1IIANm1qbzfT5mNcTQRB4a8B
         v7t9zqNgIIqZlGsJEarO/kc1LT8oCp8ZUFZ5GH934a/wj+BULG0NvcqtDrAxw1D26kxp
         nOpeYXXLSw43Igdypj3sRx4TTUpLPftLm407pu9jNDyoGjHqBzkx1Hsn+N90Alu2uJw8
         oYpNM2dcsZqNtHqVkzvWNhX2HGUV8dKSKvWVdQc6/B+aB7QEFO6Gkl5XxbhRXT04S/PS
         WWL7pZpVvXCP4QBKNe5KscxVoh9eHtY8GSbOUTP8bZ+fCBG5dA82l7tBIpDEXus/ZE5y
         e/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331796; x=1790936596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=12Fh6BMJIooO0/2QE68C+wpNaed+kt2rWF3HqIokZ3w=;
        b=GLZPp7DcGUX3g326pZpsY0p/NkHpV7PHBclTNsUP/jr6M3gpof/88EY5ZtvGRwOwVg
         5MjGu98Wkri2WpfvYfjhCitzrbSCK705ZfFQWcHTlhaOOtgt6UZ2MvWF0XC6Js+GVDb3
         x4FBSKwy/gfY+9rput9lk4CI4lIUv+I8aIKCW0ejVdFZKts0vnGvKLudx2X8UlolXU2p
         klqcYzKIwcrPeecovgyNzUCJsBvKzmh02ulJf0rlEXfFgu4VQddI6vGL0kDSwsJ/m7Mf
         3G5t84W+aRPzCFx+pjZNFK0RyZdid/VWvNdgSMfbNs1usdxRoQDuD2dssRT9+4JlMjzC
         /FzA==
X-Forwarded-Encrypted: i=1; AKwUvBwQ7LEMKlaZR1n7J09DoNahSBvexy9O3dbjWgvYMthCZyJ/MjHX+q1VLhEeP4ReYY8hd7ztVDODldNsBxQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mv2CRqiLfNUOdgn11dVY7S30JgqIutcxMbmfuT1aDKFnL6TlqX
	PViy4C65duxzZAfsMN0g70jx4Fiv5B/TbzQt/Qj506BccY32WEGtv9+NddXhhOaG
X-Gm-Gg: AYBFou2/Oy8FBdr9RKa2WoSj7u7XIRwsAy8tvrovIgNMmNVre50eUg87QmcwAVLB/Px
	XZDWCo0vTXZB/LeTzbUjMsYzGcWi0P2nM4n4fBC87XX9Voig+WWXQyrHYWfR21DIGpkP+TK2+S8
	kz0TPnp9ICvs/fm58cUqrjg7Lgt/TVD24ltMg3fREHsBoTAcI9O+IVlv/bNzTfiB/KR8bdRwBfu
	4DH6hLylHhASGVZB59Ofi6rxDBoxSNhl79ZgVqSgPMQf+7DYzAfF+VLqrOae2V6szWcjVQNboYw
	AGjD4yFyztAMDWccJDzD6813qv559e4OdFqFdv0bbB+J0sA1oalO3yrqfTW1gXMOIDATSoxdJ3W
	e31geSA/6dWhIqf12kB/1scswvThUvlE5a35uVHkw73dyftfC5BFiKZ1n1UoHiev7FzTERqLLPt
	txx3t+Q+tbNBVbRg8qCNE0b/4spze9EZW7fIF11GUb3pXzbyoD2tugSlwzsNtqoZdSXPBIu6u5g
	K/qgX2BkQhtNIds0C7uFhcHf1QTUVPQNQansK2cKsuakV77sklDBlbEUSLojRKphr2uVfVZK/tp
	9Jj24jKx/9nf8jc3QCJTw1DVMgUYNyEl/Y5V4RklcGt9k/rtdBO1pTZDqoGDc5iNSLDClfSVTw=
	=
X-Received: by 2002:a05:7300:818e:b0:327:affc:b506 with SMTP id 5a478bee46e88-34004e839e1mr6349848eec.15.1790331795788;
        Fri, 25 Sep 2026 03:23:15 -0700 (PDT)
Received: from FT6N242TWK ([223.181.117.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341463ec3ecsm5927610eec.31.2026.09.25.03.23.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 03:23:15 -0700 (PDT)
From: shashank <jain.sm@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] bitmap: bitmap_parse(): reject non-hex character before 8 digits
Date: Fri, 25 Sep 2026 15:53:02 +0530
Message-ID: <20260925102307.49513-2-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925102307.49513-1-jain.sm@gmail.com>
References: <20260925102307.49513-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bitmap_parse() is documented to return -EINVAL for illegal characters,
and it does so everywhere except when the illegal character directly
precedes a chunk of exactly eight hex digits.

bitmap_get_x32_reverse() parses a chunk from right to left.  After it
has consumed eight digits it looks at one more character: a hex digit
means the chunk is wider than 32 bits and -EOVERFLOW is returned.  Any
other character is silently consumed as if it were a separator, and the
remaining input is parsed as the next chunk.  As a result:

  "x12345678"   -> 0x12345678, returns 0 (expected -EINVAL)
  "1g12345678"  -> 0x1_12345678, returns 0 (expected -EINVAL)
  "0x0000000f"  -> 0xf, returns 0, while "0xf" returns -EINVAL

bitmap_parse() backs cpumask_parse() and cpumask_parse_user(), so the
same inconsistency is visible when writing masks such as
/proc/irq/*/smp_affinity or the network queue rps_cpus/xps_cpus files.

__bitmap_parse(), which this function replaced in commit 2d6261583be0
("lib: rework bitmap_parse()"), rejected all three strings with -EINVAL,
and a "0x" prefix is accepted today only when exactly eight digits
follow it, so no reliably working input is lost.

When the loop falls through, *end is known to be a non-separator
character inside the buffer, so return -EOVERFLOW if it is a hex digit
and -EINVAL otherwise.

Fixes: 2d6261583be0 ("lib: rework bitmap_parse()")
Assisted-by: LLM
Signed-off-by: shashank <jain.sm@gmail.com>
---
 lib/bitmap-str.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/bitmap-str.c b/lib/bitmap-str.c
index dd9aa0635fa5..e02c5bc80951 100644
--- a/lib/bitmap-str.c
+++ b/lib/bitmap-str.c
@@ -414,8 +414,12 @@ static const char *bitmap_get_x32_reverse(const char *start,
 			goto out;
 	}
 
-	if (hex_to_bin(*end--) >= 0)
-		return ERR_PTR(-EOVERFLOW);
+	/*
+	 * Eight digits have been consumed and the next character is not a
+	 * separator: another hex digit means the chunk does not fit in 32
+	 * bits, anything else is an illegal character.
+	 */
+	return ERR_PTR(hex_to_bin(*end) >= 0 ? -EOVERFLOW : -EINVAL);
 out:
 	*num = ret;
 	return end;
-- 
2.43.0

