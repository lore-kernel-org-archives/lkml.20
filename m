Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DDB46A5E8
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842502; cv=none; b=jxcaIhJ1KlTDv1P/yhTnAQaN/bLWs2D22eK22tYjTg8cTv8hD5/IW2uz2NOF+vecmU5Ep8tojhwXoZuTM5OEfR9mOz+hi1CwG/KUdr+MBs/4loV5bX9RCxd5PegdAKFlAjba6lVDAeTlazDIfGyptuRJ6LZUt4m6w9s1vwiTCZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842502; c=relaxed/simple;
	bh=G2x9ITkmgaQ7ftG3op1tzZ7VUpu181fs0yW5zmt0d0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PgSJIlquwNhZ0g1pDF8C/d+6+5lfDtg3o4fXXlrUM2r4laXj8Lg3oXpNIfNmPe636PyRNLRRZpMHRu1UP//Q4cndWLFTzaZVhj/9tnxmzZnYwFuzEi4wSzLK7zvbrwTjii5z42Nmnge2XLQkOIEmZgjE71ZfaJ/YOOQDjYb5/Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WU7BQQ8G; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WU7BQQ8G"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d72ae08fa1so7237265ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787842492; x=1788447292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZoOxuIaHS7V5bxkfafbNTQhPHSEQfYqrvpRkI+Xt/E=;
        b=WU7BQQ8GPo1LaYDzHq/pzr5cQ4u1zDvqQrala49hVaCz9HJojOQ0b1IRLGaIg7MHiF
         YJcZ/DffJe73xfq8w4Myg9a+pnZJdLYzilV5Uwumg6kdJpfHGe+P5til/2wzxTUreorD
         JNXvicJh/1bx4beCq7EnrPOxPI5ltswaZX88OdcxTd+/RDIg5G69Cr//x7Jk4VviTTev
         Pz9+YUU3JmJT3XyTOdTyV/7wKYZbIREP7LKAVXhSDk+Cl7VcYlVayhPfGTHYQ2ALLB4y
         Fuq8Vf3Kee5hvPXK0ktQEXlDO55jqguyD/7PGM3t79xGr/KxsYuVUv9A5OLCm2avJCnP
         Jx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842492; x=1788447292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZoOxuIaHS7V5bxkfafbNTQhPHSEQfYqrvpRkI+Xt/E=;
        b=gBkrw6ulIK1M/e7irFW/d5t2z+s+4An/jXCCbVs7v327tr/hj5PvMmeN3djIgxPUNW
         65MiZO4M8zuNK/WXq5OJoYirwWX9Ow6JN0OCB6uDSk9dnLvUbfPz6PloNN+mhBmMIwA9
         qwqFHfaz06dpIDQj3vu/9PRYzp/VoAAQB1WX4+UxgxV+JVVUSrnoVbI9+THIRscFY0z6
         m0gexiS/Y8j68V0kmZOfFuYCZgr+NL/uH7dBuccd3SkC2qjcwFim67TIm+Hq4zJihlCa
         O/OX7Dlg5sXA1PjJaozbSt65wpQ85pCjPWjJzs+epArYMlGaOIs4ncTrsHcTay6NQrCp
         meqg==
X-Gm-Message-State: AFuF++nP+bTVybKSnIn9OA0BlpZvkrwq0elCFK4s+Xy5iLrVcbvaOL4h
	odopKqczL2aAvKBk85k6JrGJxtmViZKzNqJX/jy4TFtXSZIIxN5pgQhBkT50sw==
X-Gm-Gg: AR+sD11jLeAf6kHAV3NM9ryCCvd5H/6KVklgLr2mc/elQODg+yi+u3JsyFEeu51+jHy
	svFf5iYDouyJrQp5lPOz1ULnxgGCX8NUlrjT0V2oBcSGkLJMulknpLLRqrcbtZW9dLBe+9eUH8o
	DXg1D9y7bUrb3luHsvvCdIU8/qDSzzzM7paf23Pewa7vSzKDUh+5CdawQ6pYEoVRU28jAucz3QF
	jrXaHPT9Qaf76agTY9pYv7Zf+B0xy747YO2auFnvn44+kjjPNei0EeBiREVBnVN8Pwo+xPZCWuh
	rItkSY+zzGNpFXkDXWliyC8kwwVTFks7LC8QpyV9WdR+yfNtp4cPZpMKQVb5pz1Tnx2yhmhj+Bq
	Ljs8SW6JWS7Wl38wY3w5DS4wxBB9HUBotuIlSGt/9EnYTurNQUYyOE6EBLFW7axY3/4zuJAV73x
	EcKmIsKP933yfEPadCA3QkMV4CIWkvH81z5sO0h9ynn4Gl7YLtK9Tr5UE=
X-Received: by 2002:a17:903:46c5:b0:2cc:9179:335 with SMTP id d9443c01a7336-2d707a5d142mr295443945ad.8.1787842491290;
        Thu, 27 Aug 2026 07:54:51 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704b9f555sm18725405ad.40.2026.08.27.07.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 07:54:50 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH 1/2] sparc32: remove redundant memset in arch_mm_preinit()
Date: Thu, 27 Aug 2026 23:54:33 +0900
Message-ID: <20260827145437.490605-2-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827145437.490605-1-ekffu200098@gmail.com>
References: <20260827145437.490605-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

memblock_alloc() returns zeroed memory, so the memset after the
allocation is redundant.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/sparc/mm/init_32.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/sparc/mm/init_32.c b/arch/sparc/mm/init_32.c
index e0e66f91ceeb..b4f31d41d665 100644
--- a/arch/sparc/mm/init_32.c
+++ b/arch/sparc/mm/init_32.c
@@ -255,7 +255,6 @@ void __init arch_mm_preinit(void)
 		prom_printf("mem_init: Cannot alloc valid_addr_bitmap.\n");
 		prom_halt();
 	}
-	memset(sparc_valid_addr_bitmap, 0, i << 2);
 
 	taint_real_pages();
 }
-- 
2.43.0

