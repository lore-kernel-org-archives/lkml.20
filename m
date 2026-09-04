Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B88C470456
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519085; cv=none; b=is0tJPr1t/R+6GS7NNBqQ3kZvyqxgefQ+M83bqcrFds9vQ+tM21fqZWEvafPW/x3lCrgsv6CH0wgetQ9qJ/Svi+w4H5W4Hy0nKMcKk9S1AIOLuCACxzz83M82yTOdWGYWUbv9xSF7ZFCC2JKj3+9lFM5g4NChnyE7E4vRIXTBto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519085; c=relaxed/simple;
	bh=feksAreTs+RnNAhgntYRHeIi6G7ugiPQR09TgoYF87w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bz7kOSJOIKZA/cbwoxLTDIGM5DEXHvMjWQr4IKK06vabxuIZYHbaOm0c6aRapyAgdTi8uM1D46aRp7wleRpuhibUQyBaKgDP4kxqwo9+cDY/lJ6AFbtwvpNBVU2D/2qdoY/KodHwlFjq60ZJ7E9kn6QZq857Bdk9v9Y4l0qO+qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2RM+Vt1; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2RM+Vt1"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc439bfb2d8so672608a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519083; x=1789123883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9N98bRx6q7lXxVKSULoDokbYLr/zTNPxFyy1davZZZA=;
        b=B2RM+Vt1VlH0HlEE7TYPosVpqolVbYwzFkB6wSbO+8NR2T1vov6miw1NNbVK3xpxCf
         bKV0UyAjYKXKyBh5U5efZmwanbDHPj3mO38MjJGWlpBa0vOnNTT0mDVFkur/CiZeIJea
         PPTurbbfRPJ0lOKGuVEr8Oi4VdsjqXnCitHWb1oibWvxQlW0yp7Fz3i48Wez0lyag9ui
         rnyNO6oXxjcaqcGzjKzpvRwZbeGo7oZ7jYBiH31yE0LS3Sw9KSy0dAHRtghv+LkxwTSS
         H/FurSCAl1k5lOI/2LGfqJIm8BdI6cgPjdJwZHRBgQcobuELptSLqDAE19MNMyrai60D
         kMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519083; x=1789123883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9N98bRx6q7lXxVKSULoDokbYLr/zTNPxFyy1davZZZA=;
        b=mGjP2n2Nd3gRJc9Q4gt3wOJrFWdqF6qrnnpf3EzXS5xQKd0exKn5MwJg2oTaJ8OoHa
         IE3E/uHLzFpQAPW2HretYMmCwxSXILRK9WU1JC/6G1cl1/HQl2w/hwsdRT5No4jcK9pa
         dPC4Z06Ca4dnkHrmEi6CGAx9cRAXbtwm5RxoGmTzUTbZ9Fe+wFoJHVqmGxOpuFrNq7F1
         BprSUOLIi9ZN3nJas78qyYLRSB0NeELGcfoanax3A6Hx+plf5Ql6GHGF9v9po9Y4qGEL
         oqg563A26gnAwoDUum1wKhE4fAqEVy5SdF2pQdWkqHSqzdQnsMdsFoVLOT3dkmdpHIh8
         pBew==
X-Gm-Message-State: AFuF++mtDT1qKKQZFvtUzWWofdPIGyNsrbmbj3+ot1zN6SoxfMzfHzJ7
	XkzFYBcqNVOlU497xJ2myBTtnL6rybQZP0ohP9Wm1dQhNP6rnru27fb0
X-Gm-Gg: AYBFou2GSe6RpGepCiSuW8RbOTrgq90H1NmoGygogTlpx5XTbs7Wy11dG3DGpN0zDS2
	uaxxV719+ZiRUwhcD88Bsb58VuWqEGo37mRhY+ghzDCtpMSDN2T0a8v8aW20ulwgIOwsQr+jIrW
	8UZ2KEJQ0LnvNk3yCIESlUg4hZ8nGShzrvlUT4C7pvLuL+qyLZqgRaTl5ytEmb1QEHd89oM5YSE
	oRgjEYgu3GxD09uRA3j+zHAKgCW898GwLkNIsLTOgUscv1Qzv0+RUMHhv+MZKqeFeeJm0aMBvQA
	V/g1ZYcgB8wMgx5u8DNLB1aehIkmutBXDV8jP+2DwwBPz3PO94M0kp5FQRZoEefULzFfSFjCMBi
	8Pz6nINYcKx7Co53jYcUBilaf3TI5l8Q0f4N36T8lk6D+lT2U7DCwRz0PppvwD53f8jF1wZo6Ck
	ee4/shhkm/zMQ1frzLODsI8ohVyhXiFbofLwl/3vBUU407WEERXlZAUkZJdSQk1HvUhtQEwKE35
	P3UbZAMa4le89c=
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr8131337a91.16.1788519083168;
        Fri, 04 Sep 2026 03:51:23 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befdefcsm5031484eec.29.2026.09.04.03.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:51:22 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/4] Documentation/arch: fix typo "initalised" in comment
Date: Fri,  4 Sep 2026 16:21:07 +0530
Message-ID: <20260904105114.29474-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904105114.29474-1-hemanth.selam@gmail.com>
References: <20260904105114.29474-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "initalised" to "initialized", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 Documentation/arch/arm64/booting.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 13ef311dace8..0d5f8709a5f5 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -588,7 +588,7 @@ following manner:
 
 - CPUs with a "spin-table" enable-method must have a 'cpu-release-addr'
   property in their cpu node.  This property identifies a
-  naturally-aligned 64-bit zero-initalised memory location.
+  naturally-aligned 64-bit zero-initialized memory location.
 
   These CPUs should spin outside of the kernel in a reserved area of
   memory (communicated to the kernel by a /memreserve/ region in the
-- 
2.48.1

