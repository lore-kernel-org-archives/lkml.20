Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A054E4E50B6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923510; cv=none; b=DBGfY2tSAtOcpt17IIH2yw+ci9VulTWJjSJQjERb1+fOETTtM/Sm6lEH+mwdr7x2H4FisrfabBDGlFNfB278Nru158rMwfKtTPOgri772FjTlCMRHzIdOa8GIOdXcjp0Us5vYqDBuhW7rDL11SOaGiRzL3BL6LsgkGwYGnErl+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923510; c=relaxed/simple;
	bh=CLcT2P8mvrfGWBSCWhOtFke8LNjfByo/2lto2OrhPXk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MH99pOCXXRiBm7CeHAiFI6Q/m8xKAv95BlZhQA4scRpMK4euqr4M07XyMWKqbm1oIOO50SE3vgWtlmTBVRJb7tTGH9ARcb9vx7Zuyj/nO7D33vbQHcB4ZehdDd0HGyBGtGhcTRlL3vdda4fv/mlXEmIC6FfUCZvZx01Oqb+n4ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XQrn9Dul; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XQrn9Dul"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-887e45c7063so2711481b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791923509; x=1792528309; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mq5q1jaAtxtVtunWf71RDSHZ/xhARAeKAsNXai1vmEk=;
        b=XQrn9DulQfiUH5nNsVSjlyVqQB/w90Mbf4W9dkHsMhT7MlDmaAHV3r6uS2jWZGDzE3
         sEVxL2XgKF7CTwE3AMtmdjgo0HjncBSMygku+QnQZkhZpWVUqzmTL4mld/luLFTAYgkD
         WYdWq6f5PjFi+Aznag2/bCoNh0o9MN1fVZgkC43zwXdijzg6vmtAmITxb+OlGm7Xuhqe
         yeGMV5KKgH7p8au1xCF92E7/e5+MskYNKUTDC1sdzclrFOdng2RWvUL4wBXZS7uUZC6N
         8RY1d8bk93zHTJskQ00p2FZ3QuaRBDMW//QjQXfU0SqaR2hLAml2eZGl6RR4GJJCk9Vp
         CQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923509; x=1792528309;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mq5q1jaAtxtVtunWf71RDSHZ/xhARAeKAsNXai1vmEk=;
        b=p3SZxIZUKSCQcKSxJD8KhsHpCbHdW0ml8TXrbHauOfhWmwM7NLaVCh63iJQITxy52c
         QbviPAno5KwEkykWnwuDUEgd1smdo+lUx24l3dTD6w5yzQQhxA0KXBq43kSKPlppvHRj
         5h69CmDJPPsR8wtImJVcT1ADNg+2SlXkItdn/DdiAHj/lT39r+pWG0JzUgYKTNFMnU6Q
         PZp/Mn9vR0JRXeVPyF4q3z0vomo3v2IZtWiMOEYrPfowO6rxpkn/QS6VIA34Uz0EP0zw
         gl1mxTL5zeO8OU4LXhDBV4eYF1u+xmO9prX0WjPkohrs4YoGJEVk7sANVsCaMfj4WuxS
         8pIQ==
X-Forwarded-Encrypted: i=1; AKwUvByxYP/h9L2AutzbRUp6Z7VViNPwJ8EdYjO3eOPtnv8Szi7YrXoqGoEFDD4nooTTKo+JVYZuAAd2xQaFe7w=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+rjRvhiuQNFbrVHBB71BS8GqbM0ngRMPRuZzWVIbGI5rVkpTw
	q6rOzVBGp6HciH9Itbzrm5EL5CC7/mDSEKqCcrFECJwiy8wqYmk5Jh7fm7TZwrt7HeifWx9p+TJ
	e
X-Received: from pfdf24.prod.google.com ([2002:aa7:8b18:0:b0:89a:751f:708f])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9087:b0:892:8a3f:4515
 with SMTP id d2e1a72fcca58-897c653fe48mr11646582b3a.13.1791923508682; Tue, 13
 Oct 2026 13:31:48 -0700 (PDT)
Date: Tue, 13 Oct 2026 20:31:46 +0000
In-Reply-To: <20261012205919.4012405-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261012205919.4012405-1-morbo@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013203146.387344-1-morbo@google.com>
Subject: [PATCH v2] overflow: Match arithmetic in both parts of __builtin_choose_expr
From: Bill Wendling <morbo@google.com>
To: Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

The two parts of '__builtin_choose_expr()' had different arithmetic
expressions. This patch corrects it so that both parts calculate:

  COUNT * sizeof(*MEMBER) + __must_be_array(MEMBER)

In practice, '__must_be_array' is meant to assert if 'MEMBER' isn't an
array and return '0' otherwise. However, symmetry is less prone to
subtle errors (and far more satisfying).

Signed-off-by: Bill Wendling <morbo@google.com>
---
v2: Don't use 'size_add', which just adds more complicated macro cruft to the
    expression. Instead, just adjust the parentheses.
---
 include/linux/overflow.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/overflow.h b/include/linux/overflow.h
index a8cb6319b4fb..d0f04436343e 100644
--- a/include/linux/overflow.h
+++ b/include/linux/overflow.h
@@ -418,7 +418,7 @@ static __always_inline size_t __must_check size_sub(size_t minuend, size_t subtr
 #define flex_array_size(p, member, count)				\
 	__builtin_choose_expr(__is_constexpr(count),			\
 		(count) * sizeof(*(p)->member) + __must_be_array((p)->member),	\
-		size_mul(count, sizeof(*(p)->member) + __must_be_array((p)->member)))
+		size_mul(count, sizeof(*(p)->member)) + __must_be_array((p)->member))
 
 /**
  * struct_size() - Calculate size of structure with trailing flexible array.
-- 
2.56.0.385.gd3acb90ef8-goog

