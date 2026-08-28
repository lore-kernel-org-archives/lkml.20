Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DDF3E832B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906474; cv=none; b=XZs+6etOYiia0g+YALBkSYA/Djn7uYWTtnACsPhQJn/U63R31uCDslV9hOHlwx/MxkDHjsu/2TyuhdlJSePmsro1ryJ9qE9djpsvS2kOJ3oJfnTU+A0z1PxDKKO4O1kwrzFIqe/FJ5sqi8MFNisHxLZUyFmmvaaJ4+4GffBEKfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906474; c=relaxed/simple;
	bh=WYXpX+qWSAWj0kY5DKGlXMnjOmiSzzu87BBBBnxM78c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l/ETc06/2PJYvsE2KtkN/+B1DXDDcKx9C69wCQdmK9Wxd0bc77R30MlM47mnfC6QJzy1neqRVx939XrpM6n0sE4pd5gOrQ4osPrpLC8yxfjTGSGgYIOQL2NL9Ob3CwFEdZkjoKLd8TpfsZ8rvuKNGJuW51gW7ugV2/O6QG+v5SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmhXxchF; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmhXxchF"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d5335cf904so7149175ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906472; x=1788511272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9+H+kJF3nctVPFhDnRcCPkspdAuDPHQiHYd5tpQRVVQ=;
        b=jmhXxchFIzshzpUWqA8G/G8XGBX6rSFl+h5CWpQFIR0EGRzZMXvR0XP76GVMPLrA/r
         AJLeiJ/aUf8GiJUtXsU8188RUsjpeZJ/FYwZqLOMi5L6K/oixjq0MGLqB2lIxZX1ZATt
         cORjxZyoVSAHCAiwpqUQqkyTQwsjhsHtyB2U2tIXPTmNnemsAh2tIMMwzHk8Cavl1HTJ
         uGZgOooidvw5MgwL4QwU1cTzlS2AUAIGJRUMvoBY7CW48XNQFdIHAhXS7sbspGUAG8CI
         7wcGuy8TwhKbqxxacWLVr8NgXb3fge1jQi+Wuc6grRoBvkKfxAqACDUJ+dtItETagByB
         NP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906472; x=1788511272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9+H+kJF3nctVPFhDnRcCPkspdAuDPHQiHYd5tpQRVVQ=;
        b=FpQo3vizKsk6h4bsLsNVgSXi+P3NJmmdjICiOY+/DyAHsirkh0wihyEUwjP9lWyRTg
         shg0dFxu6tSUw5J1N1DIFOADIMvciltQmBHeHA6sUzK4U5KmyszTIe2ja4MXrswEFLfM
         64jukvsVHpsXKDQh78if/72+ynbcrXirXC/Ag0G96wq2gReyttNYH10EK2nls3JPThS8
         D6QIxCKN+BnBQPGnpaUW3QKQFZnuR2MlLmcliCNj/Tt6wB16mWrkcmO3wEsnCCJgvF8w
         +f/IjaYmxlNrSyuOTTJh0OMTk7xkTTvbovpXNxL3iQdOTgYPipaibCGS0/R74DvslWqV
         Q62g==
X-Gm-Message-State: AFuF++ljIQf9DDyFvF0/3QdmH3beW5FYUQirmEXBsABysryUNnPhIWBQ
	TLRY1QbmS+ag1vA+CNwIlAVmLjcZrGqygUohPddQ5BCzPSk4+mpzstJV
X-Gm-Gg: AR+sD12MqOfmWoRREQgQrDe9xhTGKmTVSNxVH/rIQ9WCo6cCfLsKvWCavrrXlRfoD6l
	cX2mKwKFFAhXLjrvPue2Rj3klexKIoPc3AC0EfQJGHdNDikP+hWvwLwt+YA2hjzZwlp6cw7lDZx
	wvO1F6HmJtfSC+s3RwW+KEN2W8lgufFnkZNwJUowhS6awcWlIrNobxpywc4NCsUizOjv4D47xxS
	j8WwTsCtz03VxPj5f5jy+bft0zK7S5blFhPqA2TMXCkBFYFe0cG+twudmWiOcKN93GZ4x+DnmAM
	Ym9vvfqzubWbedcL4mmMeUaT419LdLNor0vBrtRJbhDCIcT9IpMdrS7Ms9xdZbO9Z9L0+AVeU6e
	iSFhaoHN7VjPu8sXsrvU/fbDDSpjw6PaOP/WNKBcHmTdsgIk7dj8vrTp9i4abNsswVTCtY5bOW/
	D3vP9d+PPEMEG9qUbFkh1CGGEnGyUZ8COuYnFWNF1z7U/ssCMaYmH00qI=
X-Received: by 2002:a17:903:3a8b:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2d74dee96b5mr101451785ad.9.1787906471886;
        Fri, 28 Aug 2026 01:41:11 -0700 (PDT)
Received: from localhost ([45.112.46.228])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988ac7asm3171035ad.57.2026.08.28.01.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:41:11 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mailmap: map Coiby Xu's address
Date: Fri, 28 Aug 2026 16:41:06 +0800
Message-ID: <20260828084106.1494733-1-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Point to my gmail address as I've left Red Hat.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 8fb9f3898d7a..1b3483e7c83c 100644
--- a/.mailmap
+++ b/.mailmap
@@ -221,6 +221,7 @@ Chuck Lever <cel@kernel.org> <chuck.lever@oracle.com>
 Chuck Lever <cel@kernel.org> <cel@netapp.com>
 Chuck Lever <cel@kernel.org> <cel@citi.umich.edu>
 Claudiu Beznea <claudiu.beznea@tuxon.dev> <claudiu.beznea@microchip.com>
+Coiby Xu <coiby.xu@gmail.com> <coxu@redhat.com>
 Colin Ian King <colin.i.king@gmail.com> <colin.king@canonical.com>
 Corey Minyard <minyard@acm.org>
 Damian Hobson-Garcia <dhobsong@igel.co.jp>

base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
-- 
2.55.0

