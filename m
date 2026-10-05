Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA92E47AF57
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205585; cv=none; b=FBBix9DqZvFNyPxALajwj4yZ1bE17JlZNjLPiSdyXerpsEXo4aMUUhhLOiEywp1wQMNfIZ2R9ScIppo4LtAuvypiCrWYOzDfqBw/1Tn3vjJhY0c9QMojcOLsvMbwVMmd6I1Si9jN/vOevBct0Q3VS9Q91KBR0WvvEbtdh51ajIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205585; c=relaxed/simple;
	bh=lWjHP6alA8c9bfJKDwOOPP5dbXqNnIjRZYB6Isxoog8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KeX+lznfElYCxd2uMbI/DmbjzjFxwJhi609rRx92NR9hZaqqinWKHyV6lrm6+n+wtG3SCe13tgs0oh5AZcWPllmz100jaxSzLYXOZS4VlpsPCQu+tWIQ/uvTqmIEdJXOwc3NyT6nJ/U/v+VKtf2nW1SHwoatOyLqEqOpGRceFNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lv6XDB4J; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lv6XDB4J"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaf8415866so2376044a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791205582; x=1791810382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BjL2pXlHfuAQFc/3GOIX7IQe1y00mLqM+xdgaQa2Gmw=;
        b=lv6XDB4JcMjNcKWP1RwcCUGeHU+CuXynbx2p4HBMTgPlh1iC4zsxy/QVjpaDhuVDfM
         jdo8cuRm7f2OiqPGdMS/pEmn4mSGo2bIMEf1IcNX/T5FLHXh8nCg/MaTZmpMmWFfu9Rj
         +Ldonim7hAl8m+eeOLxLB8gEsIfsPlk4suff7oOPlqt/nJngHJo5V59v6j6Cd0hEr30e
         tIMLCaFaxgY9bFXWmW0NUqEb36xKvNwG/GKIdc3v0m9yo9edrQz2MjoJxoc8SCeMazzw
         EhoDjGEl7gq1AyLIyTLcMxf6Icw9ufNowWr0bMSOIIuEH9rYaUOcDh/lD67ifnlFanV9
         HkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791205582; x=1791810382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BjL2pXlHfuAQFc/3GOIX7IQe1y00mLqM+xdgaQa2Gmw=;
        b=jatnBGaAE3SEqE0I0+waugJ4oRV+RRtEKkvw5jgCQcc69BDKHdGND+ciZFiJATV1Qj
         RDsa3Qd2TgkUXgHd0O4uiW9tPGIkqMfgGtU6oMFprQFAZFkKnt1HMNZE0TxXrA097f/v
         AyZrFUr8acwHV/1xhiPVQvsJTgfce46RG+qVb6sy0KBZCXHWbu+3KV+KPXL6TUrj0xV1
         wbAdLTZ8xDL9RIDw4FihlBwkOUSSxPVWLhLCwyuQHgfR3CMqHJM1/t1DPibLj6JXRnHH
         y+aYgEIiCaMBD9WGuURGSm1wn8KqNqwB+KogmypS8eqMpTNiyEff56ls2mpzUYjDuNp7
         +GWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEbwXP1Yk6i2IeQGZI+3+taLraCbkfv6fBN9oE+FdEbGRxpaHks26QaK/ASwwpJ1vRNmJWhoWpWWRnRZk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeeI/7ryoJScSh77BY5ZbP+uijbCU+bU/Pb0JzJgpPBjqQrejE
	sAdCn5iSzpXZ9YN0weqZsHhagxulBKEoX+xa6mvd0m09Z1eYhhfT9pvO
X-Gm-Gg: AYBFou3dPeQatMCCh1X5R9bHOrhYsCV/8d9nS1H5cujP93c98uPeq7vOm0EjJU47g4X
	FjGtSfb4J+18ZjN4tBZhmw6YTyB1y6gHFRe9Q6RUey2jLVdLnpxR5uXzeirCpGguHX9LfUftXiL
	GlEDS3NH1AAN4OXngzf/0h6mDysLWUHylp+YK2DloqmE6hgtSm8+gU7OifeTl/lU7K0iiJ9ft9k
	5JfjW92VrRfQKrrLE1vyRN9r27bwmyt75plvhBWkOczs6n0cM6a5wZ0/SqZZE0SpKun8mjdBvnh
	HJJVH2R9C3X5b81v0a2xnHTz/f9FDRWN4QHVFzHVlKd3I9uQwdaS84WXRa2m8/ZoyB2SXh7w1t0
	q5mtRjNTTW5iaikeDUNBIIEbwUESvKfXIsdBYwqh/kjOJyEZmhiWX47y/11DZpmEuRz20UbPu9E
	BtCATclSASZPtGlgZKX1C1Hsfh93vB4y8LmgOVPC2oDQSMzDMY6vi4mQg5O0C78XMXEp5TNjxdA
	z/SBueesg==
X-Received: by 2002:a05:6402:378e:b0:6ac:934e:a9d6 with SMTP id 4fb4d7f45d1cf-6af9e022bcamr9401777a12.5.1791205581824;
        Mon, 05 Oct 2026 06:06:21 -0700 (PDT)
Received: from fedora ([51.37.100.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb005a424sm3390647a12.0.2026.10.05.06.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 06:06:20 -0700 (PDT)
From: Paul Dolan <paul.dolan.dev@gmail.com>
To: keescook@chromium.org,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Dolan <paul.dolan.dev@gmail.com>
Subject: [PATCH RESEND] selftests/exec: reject zero as power-of-two alignment
Date: Mon,  5 Oct 2026 14:06:12 +0100
Message-ID: <20261005130612.162824-1-paul.dolan.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The load_address test reports whether an alignment was found separately
from whether that alignment is a power of two. However, the usual
x & (x - 1) check also evaluates to zero when x is zero, causing a
missing alignment to be reported as a power of two.

Require the alignment to be non-zero when reporting the power-of-two
result.

Fixes: b57a2907c9d9 ("selftests/exec: Build both static and non-static load_address tests")
Signed-off-by: Paul Dolan <paul.dolan.dev@gmail.com>
---
 tools/testing/selftests/exec/load_address.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/exec/load_address.c b/tools/testing/selftests/exec/load_address.c
index 55fd3732f029..e279d85e8f19 100644
--- a/tools/testing/selftests/exec/load_address.c
+++ b/tools/testing/selftests/exec/load_address.c
@@ -92,9 +92,10 @@ int main(int argc, char **argv)
 
 	/* Is the alignment sane? */
 	pow2 = extracted.alignment & (extracted.alignment - 1);
-	ksft_test_result(pow2 == 0,
-			 "Alignment is%s a power of 2: %#llx\n",
-			 pow2 == 0 ? "" : " NOT", extracted.alignment);
+	ksft_test_result(extracted.alignment != 0 && pow2 == 0,
+		"Alignment is%s a power of 2: %#llx\n",
+		extracted.alignment != 0 && pow2 == 0 ? "" : " NOT",
+		extracted.alignment);
 
 	/* Is the load address aligned? */
 	misalign = extracted.load_address & (extracted.alignment - 1);
-- 
2.55.0

