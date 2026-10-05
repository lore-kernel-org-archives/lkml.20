Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C63478E25
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196950; cv=none; b=GffSpuQJKtnpxEYVpMJ5FrIMmMiL+AA5a44xC5RlpkpSn2teJ8ORVHZjUf49D/oC50//t/JjYzPJJbOhk3YtKDkg/4zYd4FBmwa+Q2Xc3JuM/svpX9XOqIYZBLBUadIrP87uEWP7TWESGJiyswW9cnJI2YjeuujIa6LLwD+XW80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196950; c=relaxed/simple;
	bh=g3WAI0eivk5jo8bQtBDps6JicY1tctt8M31bkXXsQ4M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ERIhMExH3YfdCLnHx68kmZrkS/vDECnv4St7iwss0XgQJcL4qFdfApMMXxVrz3Z4FeXiZGk0vRZ6YImm7qovYz4yP3lIXxgtvD9lwdmtMGz8DInryEdaMyk5K6Jk/RVu6OpcA2bw9UhHz06FmH0mc5K75ozSK2rWB+wyIaq9f1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akdQVgWx; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akdQVgWx"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6c1983dfaffso1664058eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196947; x=1791801747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2kHfNSeYaeYMrgsze1G9NeSnG7fHB8VySZBNT3TbR4=;
        b=akdQVgWx/CJ0AU79VgOTv6VmPHyQR+iVp5BxmzPanpnUgltYlP1xorXw41bPrmEfEU
         515KVkmpk524ZgqfwdLzJkRPNZ/gsjj+deS65Lk3kCGVHTbd81w0hlpOXKFj6aAFUKIJ
         O/4D4u2EyEgYr2Ja9NCYDhwrcQTWvFFRs73ol1y5imy+yVXleAvSsmpiQgasrBzVWmwl
         +IFm6cYugGsIXAadK82hNCs1finHfWOt23YCPXyhQ9HWb32V5NG3duzkYYd5R07lX+AR
         aaIHsBCAek+kgxgF7oM+A6UbiQt+HyM+n0y63EFgaP1gRi39laa/fv4+7NZa8HlmGL+I
         2ePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196947; x=1791801747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2kHfNSeYaeYMrgsze1G9NeSnG7fHB8VySZBNT3TbR4=;
        b=xi/VoH11EOPt84bVv+2j0br/7qoW5EmOfZAvpr+Qe0tkT87+T9uTbvpx0F28r1EiRD
         XslwFQKuYwe5kvawmvzRqlI+6bLT+b9QlO2/V+99fXQh4rU4hLBPnRBzcxWzkiw3THaN
         D9bePl1kvQK7scHk/3lYULLXHcRCH5PXzJ3pcXx+QORnoGdZPtUMfvQmDmXVyXxFE29l
         gGLqP0y+1TmhrJPMyoD4KOVFv6iaUUpsfGzvP+sxODxy586gCyXnx6CiAlrGQggfw5eB
         rDK8/TWDAU9/gP9NRsmr6sYPQzxUyrvkvGqcvUK6E2ja7wdJ6FbxIAvqAW2Wk5RGRJ7o
         Ytzw==
X-Forwarded-Encrypted: i=1; AKwUvBxrZuLv9OvWgDaBYeIDgq4z0rfzbQ8fGnZ0CX/T+xG7uu5qJVXQuXrxB/Q5zQEOpw3H9qyBrSIpdaatalY=@vger.kernel.org
X-Gm-Message-State: AFuF++kMCh6TPOiz0z3DwqbgDiXu7gkMMPF7UM5q2ZqICE+41JZmXFM+
	XyD7R4oXh0qyWXWBxwIOkPkL+DV+QgL+3h6pyZ1Zr7Mp1cqdCQIrNiF+MfUkf7fD
X-Gm-Gg: AYBFou0zgHX1xGFqtAjSDczNBIdeDczsLiSqC+y0fQdbfQ0a+5hENM9GfV1RYwqlMV4
	kKx1nNUA5KRnw3XXjm5T5OQFcHg0HIC3wtgNA8C0IPBQJ5jVOhlWYn1zealGLQ8JXlSRa8rwizB
	zr5xBZbUivRbR6XvUBD4e60VHvrRGZ8U9j1cU8LpCXam/JpSJSq0GmJvlbLeKzXLuhwY9/L7sb0
	fUju/WTd9hJjzwNDB7BHY3FBV+ZAuMzZnFC1XoAMS9twNAWwRY+H1hnhgaynrQ1Ebg5rLn+HVN2
	taKse/wSQ1hBqIupudnpXi9jnUXEJuD7rTqqi18f3o7lOeuwe+NKfjQ4NLS8fPlCHxVPp5YMXzc
	MpvhO84ucql7sc5RkMIhtijIpl3icUs3xOL+2Y+azWAfVDiCuQvJnJOMRQHnf0lX5x5awX/1/6A
	IfntQzm0I17jy4G3V7XIFQJmC07jQKCptZxHaMAz6oueOXtjLFNk8P/qYsXBJ5St7fprBsTwQTp
	CU0n3O1AAit
X-Received: by 2002:a05:6820:2204:b0:6c1:ad08:a4d2 with SMTP id 006d021491bc7-6e09f2322eamr5598948eaf.67.1791196947700;
        Mon, 05 Oct 2026 03:42:27 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8227a16aaadsm11375915a34.18.2026.10.05.03.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:42:26 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: dhowells@redhat.com,
	dwmw2@infradead.org
Cc: keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] insert-sys-cert: fix use of uninitialized pointer with an empty System.map
Date: Mon,  5 Oct 2026 05:42:17 -0500
Message-Id: <20261005104217.1788155-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

get_symbol_from_map() only assigns n inside the loop that reads the
System.map file. If the file is empty, the loop body never runs and n is
then tested while uninitialized, as reported by MemorySanitizer.

Initialize n to NULL.

Fixes: c4c361059585 ("KEYS: Reserve an extra certificate symbol for inserting without recompiling")
Assisted-by: Claude:claude-opus-5-5 MSan
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/insert-sys-cert.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/insert-sys-cert.c b/scripts/insert-sys-cert.c
index 8902836c2..e0bf0afc1 100644
--- a/scripts/insert-sys-cert.c
+++ b/scripts/insert-sys-cert.c
@@ -94,7 +94,7 @@ static void get_symbol_from_map(Elf_Ehdr *hdr, FILE *f, char *name,
 				struct sym *s)
 {
 	char l[LINE_SIZE];
-	char *w, *p, *n;
+	char *w, *p, *n = NULL;
 
 	s->size = 0;
 	s->address = 0;
-- 
2.34.1

