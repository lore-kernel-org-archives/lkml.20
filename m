Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480871;
	b=Gcn4eUKmgwywP3Jx3S6rBK96pfkKnnF3CuWlCWYtloEN2NSrjpl2EIooyKLLs1nwgN5B
	 Vc5sYhpdwFgllVwKbfYPFi8ok382L+o5mD4T5NrFc584clBYREwmYPUI016xxjBb87cfb
	 trsHcI9cHP0X9/rImoIP1BhkDJz8/ml+EgFouZ8Yg5UWxowb4Ibh6WUmHgEUrLrQmdQqG
	 1CPa0jf7Bdgs8kcTf81glXRHRvkUOm++/bwyFCU1vz+a5GR4pKnuBvYa5A/vCQ6idLqjT
	 F6T2gG4ZY1HZx1uOabLMbYXNbXUa+O9dpwq6ha3yGoSPbO+XM2Zr3zmVu+lAhmvk1Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mnqWj0L2iKBatloG5NRziYL1v5hJ5rWUbOHkD7Qml8o=;
	b=CsNVvZrAsJND0+WmEXU1HWlQme1b6hsaQEcBQXJQfqbcF8VgtoyF34+fcoFj0J/48T6J
	 CRZ0bkLv59UZvOVYmq91XR55vakiuQ4WP0fjhdd2TDXEb2YT323NnjTIzJpeKAoIRAo3e
	 AC52xd4uVYoSrZJqfnw6+UB448oy8Zdwy0Had+U4jq7QxY0N1SPZneLyW19LWLNK0hQ9D
	 noQ00S4mm3XfnzsqDW1C5JvEHuRB5v2jTzKLHJm/HbpYZhqn0UCyxPmvFXdGe3eofxWUD
	 345vQAOr0drdKJoB90bIJEe+0U7r4LEuu4qp5mWDEUMh+BounxsriAeKQBY6xD87Yug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="g9sn3u3/";
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA99606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CA99606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g9sn3u3/
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-33baa8eb238so2073636eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792480870; x=1793085670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mnqWj0L2iKBatloG5NRziYL1v5hJ5rWUbOHkD7Qml8o=;
        b=g9sn3u3/Jces8Xe6tEvj1K00QiQiNW+pIFtyLVRDhg8f60C5rVwwJP/NudxcYE6WZp
         YrB9djnf8Tyh09tJWvgTfU88oyWi65oKO/er5GDz1g6HqxTt5zvqu0LtV6N83/opgnfM
         5eoND+DaR1Bb/5jslTMJ59wjDgigyVqTpZlkP7J3IcZ9ObG3k+BcqxRPdnMmBA1pDYcI
         xw82UgHjLfSP4k0m2cS7Kgm2SE4kBCJmXJEE0ur0imkyEfEmBOqXMg+ksALYHg6skM5h
         mdQ4o5d7nRiItgOly7xR8K2Cuzj13QLDbP1B7GkOYUXxZdUHem1f2i5sp5Imn3vQ/zGL
         3qdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480870; x=1793085670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mnqWj0L2iKBatloG5NRziYL1v5hJ5rWUbOHkD7Qml8o=;
        b=OnTWWuWe4MaDcjM2LX1aqVsTTTt/Coo8Fj7Yb4N9ncKEIQyJcPzM18J01cF4F9jFdw
         nofIaSL9X48ISEs+Xj39Ish7FJRrW4IZlPebm9cCOZUnYlNSy9VgezopSQjEoiB1cP5X
         XozErzVtZDyWpiwaYAcFwGsJO9Xd950LnT0Qq/bgP39TWWvstdHLlPQGZYOUZR8jYvQA
         hxG2jopWK7jClHuG+d/MvtrVJLCjiyd0EHGHbCaxDSX1YqYk6e4tkQkF1yUImjlnN2/H
         iRQpyr0Pc6l0fMX9pNUzyDCRnoEK3eimblxe9yOx1UFsO2BgjlSiep8BKOWacods4v79
         SAUA==
X-Forwarded-Encrypted: i=1; AKwUvBxccSewFB8GnxbNrFpJXyFhUWshQDoSv3Xo/4kUP2hCWslOB/JQczCgnBi2jdFT4tDFNkZv0bjuuwLB7JQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9+oYcA4JJYCsXzZY21lTL9kLTNwF812ZzmeFG7bOUMBl+R8zB
	1FV401d31hGbz+BkLrFEWtwHE4L95UCJk+Mbgcu/72agDmzrB8oBuqLi
X-Gm-Gg: AYBFou3qhlafcA9YqKb5ZR2QrezPFtDZ2NBuWr6/JDHwa+KJeq24yzFRJ9qvl7SldJR
	5pyT0vMUR9D8Ve5z8YJQGWe0ee2gqEb+K+RzJWVDD2BLDIGSNt+SVxGTAZtdBlpRQ/+M4xkrDbv
	kwT/mBkbOH0qZNJNN5aZudVALnA6fp0IXc8HwUe4SXAs4ZIwtYhcHkzwWWkVgcJ/Zxenn/RXsKf
	vPqUwD5tvBdOpflBTamIgonxpyixloyDflFXoRP77zD4u7rOTgmIxzvD3yhyXj0NR7w62owqJFI
	st/gyI08TxGNTAcvbMXemW7+xpKTc1SmezqVt/PFCKixgafP+gGXQB1ztVv0M7LDV8cT9UohBgL
	QlTJmh54Qy1xWw6KBBgomztoRbKJIb/F6JYWlw0pJpmXeuWaYpr9qnES0UP1V59B3FUeOs+NQ44
	O93qmtPs3EGYqJBviLe46O8pMexwttCDzl5OJ5lcdrG3utgxIfKP7tDkCWRG27P0vvGNkMnia0K
	IlU6mKkSPCIpJZ42BrLVqP0IQ==
X-Received: by 2002:a05:7300:a98f:b0:35a:3c46:80d5 with SMTP id 5a478bee46e88-3619b7ff05fmr19032434eec.0.1792480870323;
        Tue, 20 Oct 2026 00:21:10 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cc23sm43988998eec.2.2026.10.20.00.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:21:09 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] um: vector: use kmalloc_objs() for the message vector
Date: Tue, 20 Oct 2026 07:20:35 +0000
Message-ID: <20261020072035.8980-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Allocate mmsg_vector with kmalloc_objs() so the element size is derived
from the destination type and the allocation helper handles multiplication
overflow. The default allocation flags remain GFP_KERNEL.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 arch/um/drivers/vector_kern.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
index e902e78c5ff6..d6127944b202 100644
--- a/arch/um/drivers/vector_kern.c
+++ b/arch/um/drivers/vector_kern.c
@@ -528,8 +528,7 @@ static struct vector_queue *create_queue(
 		return NULL;
 	result->max_depth = max_size;
 	result->dev = vp->dev;
-	result->mmsg_vector = kmalloc(
-		(sizeof(struct mmsghdr) * max_size), GFP_KERNEL);
+	result->mmsg_vector = kmalloc_objs(*result->mmsg_vector, max_size);
 	if (result->mmsg_vector == NULL)
 		goto out_mmsg_fail;
 	result->skbuff_vector = kmalloc(

base-commit: 4ad423aa2108485f8bc5dde51fdf9c1ed979ee4b
