Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A954BFE90
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791838763; cv=none; b=ma+kl2upIjy3Q1vlmPKn16lCwpB56W2SiG09WUQQOjL4mA/IzwiuHdA1ZKI/NjYdBlfRD/fnXjk4VwozL8DOFb1/nQ948apT9RrumrtqV3DfsHX30fq0uR9O8UcxPSTSPiuMzv6eN3xTQlS6YU118aujb6OB8b2hnTN4ORjCitw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791838763; c=relaxed/simple;
	bh=Zt3j1Q9z/F/oX+RN5O6LNAI3VUi9Y5yxIjr5XCF+/QA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZRbYg1JrAGDLF1DYpMl2mI8WhPj/XVrEmcbj7Pd0J9xKKxD2wMoUXprC67QZjXXd6tvHxyYtyzhx3mpzb3STb2pCQZPmPnmPm4xXhKTjdYSP8XTk/+8xrzpp7o8jjWnMJ98de5ADsTkOQMKnbTIA5ZiaNUYC2uzxjTkTqmQtFkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TQ2rL2/6; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TQ2rL2/6"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e8e16d22d8so12846045ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791838761; x=1792443561; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wSC/1SbujWZTugaRFDbwSTkiFwwccAK5jmzXPGY9zpc=;
        b=TQ2rL2/6REBKZnBYsKo5CyHtwdKUTU1iP3m/dRufbiOF7SYRxqpHRHrHMQP7BJfiJj
         FDjWN4TWLJzihtU+WDuFSUfi5p9OeKgnQ60uf1cDh1SXpbciXoDzYH9fpxKwr6Z1WHsv
         amjSaBr/6LKfQ8YsIPIYH6IrT/6iyEm+BTTzeLd8siyeGxjfy/GUr6ZPTmRbPFKYEhsf
         CmsowM0ytycMGrP7vYCaVz8LbLA4Lx9iO8UZbx/wPkipI8nLwM/R3xCOhVm+qxkqITil
         MiRRzSPdG784mWqyvzfye3CMJVLKlHuMwjnVYfRIGAWl/JUu3M7OJRk6U7Qxon4cGG+a
         ibdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791838761; x=1792443561;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wSC/1SbujWZTugaRFDbwSTkiFwwccAK5jmzXPGY9zpc=;
        b=Zfn4QzP7GuzqyOYhjDZ1k1WSzKQ7xKbINRbtLe+4//GkkCaTAnWeiBtpCkRZVVPW06
         IvXHCHCfy0aaWyNdKNL8YMv5f2gl0BDDP4j8+FmEjQO7lH4l8fP+1J6MCENJ+TaNlPZj
         qzYgo109eSEIb15bpLSvP3miCv7tEtOGqB+k5J8gxdNThxGssWkD9X53dkWzRzubqpEl
         jAppOGI4cKMkcfoRiFiNgaXxChtLXfFbtzasBEEjvSVLxwIjpWUHXlrOxTwNqOqnYM5I
         iMI06PuXTSSLfqgn+yEq2I8TZcBMoZsDZi/2YxTsAVolZOGygaTzmpZRDoJ7zyxzy1n7
         T7Ow==
X-Forwarded-Encrypted: i=1; AKwUvBwxkA2tKoPOvnNF77hJIKWPBuzugifiXpNcUEkZ9FHXhmImM0NNj6NQLeYbj66RnBWu4WkmmpPVIJishk0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGgcLtFjS4Xp7osBf6idHu5uqWzcMFL7/aaThSWCdo8EfXU850
	QO+h4rrEiy0Kbhdz8Bz8KqsQsCacgF6wRPYarqfPeMFu4PoRFGO48EFO9Ozp5rly7iRVk6Q5+IP
	b
X-Received: from plfp2.prod.google.com ([2002:a17:902:e742:b0:2e8:a577:d361])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2305:b0:2e2:d26c:df9f
 with SMTP id d9443c01a7336-2e842f31f28mr93563005ad.51.1791838760700; Mon, 12
 Oct 2026 13:59:20 -0700 (PDT)
Date: Mon, 12 Oct 2026 20:59:19 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261012205919.4012405-1-morbo@google.com>
Subject: [PATCH] overflow: Match arithmetic in both parts of __builtin_choose_expr
From: Bill Wendling <morbo@google.com>
To: Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

The two parts of the '__builtin_choose_expr()' had different arithmetic
expressions. This patch correct it so that both parts calculate:

  COUNT * sizeof(*MEMBER) + __must_be_array(MEMBER)

In practice, the call to '__must_be_array' is meant to assert if
'MEMBER' isn't an array and return '0' otherwise. However, symmetry is
less prone to subtle errors (and far more satisfying).

Fixes: 230f6fa2c1db ("overflow: Provide constant expression struct_size")
Signed-off-by: Bill Wendling <morbo@google.com>
---
 include/linux/overflow.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/overflow.h b/include/linux/overflow.h
index a8cb6319b4fb..265ec265aa3e 100644
--- a/include/linux/overflow.h
+++ b/include/linux/overflow.h
@@ -418,7 +418,8 @@ static __always_inline size_t __must_check size_sub(size_t minuend, size_t subtr
 #define flex_array_size(p, member, count)				\
 	__builtin_choose_expr(__is_constexpr(count),			\
 		(count) * sizeof(*(p)->member) + __must_be_array((p)->member),	\
-		size_mul(count, sizeof(*(p)->member) + __must_be_array((p)->member)))
+		size_add(size_mul(count, sizeof(*(p)->member)),		\
+			 __must_be_array((p)->member)))
 
 /**
  * struct_size() - Calculate size of structure with trailing flexible array.
-- 
2.56.0.385.gd3acb90ef8-goog

