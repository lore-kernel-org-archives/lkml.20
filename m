Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D2848E0F0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331806; cv=none; b=Na9Q4/ZVjiKJM2YKJsRluq7aJwLVe/IaajGxdcddOQuJyaerj1bz0x1giRQ7NnvRdPbZCRsC8PAeaaMgjfjt0tr6hMRXIH8iSFt+mkr+qB+nyTUME7BNyKw00Jv9oPD36nk+Z9iU8EsCOARuBDKUSk2J7WE1MNlgYH211s/7u8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331806; c=relaxed/simple;
	bh=SQzTgiVtttmyOCO2fLDKEQhbmVxEKtrXmxGjI93M9yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LtQYKx+N19NMyLxpKwHMdITV1toVa3u2AKi66K6tY38nBTtwg/VBIaPPcXXQvHjtNVar0diHuA9XBNL19uDeZ7UzqM7Yyj+wsUO/fwSQxbXF9lZ3jZyPLmk9lzo+dh7gQ4IzwZB4RdILvjkGCEP2tVx+cSImm7tDGKVac7J1mUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6PlGQEa; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6PlGQEa"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664dbe2dso341641eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790331803; x=1790936603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYY7BrLnAOXleleF/JDNFqJQV2tSn16mASqy3TDjOag=;
        b=W6PlGQEavW7WmnEy/2P/0mz+4X2H3cfG6Lxt+qa8LbKnOd/XuAN16hrxUcGYpqV3wh
         omGyI3wrepFOv+y+vC24UEuum8ue1Vwyo6GqZhyQFhHjvcXxGv2IsSFxtzjIyxfz2vHS
         n1Zr9KCM3VdStppnGZmrFw41yaujIKAdHJ4pgrxIAxTKUD8NF65y8o3sy0LFuH9w6DCI
         6qH3twLITLuTWpbBdq/Gc0S6bAnEzhr+qeuCTn80g1L6mygpXV27v72EzzyX344EtB1m
         rFJpLva5Akw9FtGKBUGmIA3EyJnHxYLJxoAAfDQvTB5mFOKv862m0l+WUn7qRUrS+DKU
         M9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331803; x=1790936603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LYY7BrLnAOXleleF/JDNFqJQV2tSn16mASqy3TDjOag=;
        b=OrqjGY29phpU8CflaNzbA2HhfsRsADWFAbt92q7w9UeTZi7dJtxfugJkAY+G+hM/s/
         pH0tAixBoH8alSGH8iXpK6ZTk1GHwzvqo2IBW1y3WOoXuc7vCE+hqrlO7xXTidH/CH4y
         OeOT7isCYOPndhhlpFDNEx9XWiw0bndPskVg8JR6XQ7ZPkhz4oluQ8EfUxmyGX/7pO6f
         MT63fKXk+cSXK9gLYRIGMWJwXU/tt4lYbtP/AOB9QSsWXy3tlEjJAhoBY1by1aXQb3ih
         ESTXQqEYzIIQt9bIY+gPr98LiHhusudN4lo53beeJrY7bXT5Hyn3pC7RNHGKujtVZCEI
         gqjw==
X-Forwarded-Encrypted: i=1; AKwUvBxubp6pY6368DeQi+whwniix4cU19INnPKGHowsmDVJiD7F102lxaeU/KPSa7WvQu/JvwSas6XpBKWcVP0=@vger.kernel.org
X-Gm-Message-State: AFuF++kD+g3kv1aSzksKjAFRfLhH/Dh1pE8tQwUnwGPlTHRC1e/XChzR
	tYTRTA9rsDAk/jU93CCQGvV93nicGHmV0TPTxH5pvWWgBvWaJPQRtpWE
X-Gm-Gg: AYBFou0lDGuaS9JmAvGeiBvZ+5H5sT7T/BOX5eP+ywM7QyLNFUDUtGkvurZw5YU9FRV
	BeEmO5TPQIOGvQU5EG56dL2t6QWjlBXU+sgTJy6aZGXZLN7uZ3OOG/6oRtvEzNErdb9au6As+gL
	kk7yC7DH/i380WYCf8wJOnR4taqOMqkNOOUIonAxrw0QoVgVSbmzX6f/wvQ8WvlvOk2norJlsMf
	jqgywABW3WlFH29Kv3XZzwc6pgDiaQ9iGbFLRKbsCtRqWnA3yFQPn8F3vS5R7foPvn69NVYF/Qe
	qBS70P1iuT6Q9t/GUqxKu26v8WH79XbWGQ7/lBh/ZVKnuJ/F50w+y84siwU6advYgxJP12NM9Co
	dcoCL/lZuBsW6Yy4XHxLrRDkNKVugZPyVlG43g0VKt7igdj5wtKXUymJBc2fzeoZAnCUBSje6hh
	xA6qbQhmAzSdpwSXfdEAH6hfLrVpQ+zxfVH5TsOGwmu5OK+4YcSK6o+21RXLryUPnHWJ4QFCSU0
	sKWScec1ODAEEGVFclyFMg+D8iYGvC/XqO7VVyDelg4B6uAYZVInqcKjEpf7+wmyaicHI41lgZj
	Gbp70eW2Ocv5RdMR/y/GvED1J0YjZgejtw/dYHeFD+I6kzJBddVHGqSDtuiRycgybwxAx2XOpn1
	VTm4N1sZG
X-Received: by 2002:a05:693c:87dc:10b0:33e:aa3d:ebe9 with SMTP id 5a478bee46e88-34004f83f17mr4047146eec.12.1790331798506;
        Fri, 25 Sep 2026 03:23:18 -0700 (PDT)
Received: from FT6N242TWK ([223.181.117.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341463ec3ecsm5927610eec.31.2026.09.25.03.23.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 03:23:17 -0700 (PDT)
From: shashank <jain.sm@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] bitmap: test bitmap_parse() with an illegal character before 8 hex digits
Date: Fri, 25 Sep 2026 15:53:03 +0530
Message-ID: <20260925102307.49513-3-jain.sm@gmail.com>
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

Add bitmap_parse() cases where an illegal character directly precedes a
chunk of eight hex digits.  These were accepted before the previous
patch and must return -EINVAL.

Assisted-by: LLM
Signed-off-by: shashank <jain.sm@gmail.com>
---
 lib/test_bitmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index 56bd23059b26..35bb18f6e326 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -643,6 +643,10 @@ static const struct test_bitmap_parselist parse_tests[] __initconst = {
 	{-EOVERFLOW, "badf00d,deadbeef,1,0",	NULL, 90, 0},
 	{-EOVERFLOW, "fbadf00d,deadbeef,1,0",	NULL, 95, 0},
 	{-EOVERFLOW, "badf00d,deadbeef,1,0",	NULL, 100, 0},
+
+	{-EINVAL,    "x12345678",		NULL, 32, 0},
+	{-EINVAL,    "1g12345678",		NULL, 64, 0},
+	{-EINVAL,    "0x0000000f",		NULL, 64, 0},
 #undef step
 };
 
-- 
2.43.0

