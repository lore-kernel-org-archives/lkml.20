Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8373D6664
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 05:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788499255; cv=none; b=F5aFB9ac73yM4tq6Q5qzDfhXbMfGUUbiVB6E3CZuS5EoY2oQ79VOhfJaE+kIWVMgBMNVVdAhrWZsceFQ6SrqFNXPZaafIuTw3ZcS7PLoX3sWNwgcsPRAeGPpc3OtJHXiHv9YzoA9gNANLZsANOtUWUVFGHHzkqogz8mHZ0bSFn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788499255; c=relaxed/simple;
	bh=1efYk6YAdTzdJ9YjN9WoZ1h5m8a3Ae6k8ZyGafuKg7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J0ZbLXeBXYPWrqIaN3rWcnzaweNozeJ5DZTxrhOb/RiHzppOI7bgZA6Icgy/8M+x5hh9OiRqRYk0UaKzWWOaGDU2AMk19HILmLOgBXgpydhT0UHmbHsSKtSoIisTKGIxtSS+bLRxJhnmhjzbPU9AFBd3OrJoIT31Oivy9f50/PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXiGgXWc; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXiGgXWc"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38759bcd877so595840a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 22:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788499253; x=1789104053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N8nhx59l8O2wS9fd/hyLR2KGFd79BQ0LWN0fdxxg7Fc=;
        b=cXiGgXWcimrbc1bTpiRxfsx0ny0B3yblBCXXHNuRZRnnxTQ1JFEny78Fd0y2EMTWKn
         TL/oh88LPszb+A2IFDIafKss9GxKvRjxOMqXkD9vU9xbjcF7pZCHitz1rucTIrtiyqzb
         LM6vlrGuJDuNsdvozd6xsFs/UQMKs6SUUhTBmI0u0GUux7yCACuGJcWxu631oEzvABH3
         mUR43MawoezdMyeEnOdYoFdtXmuN1kdi2QfpD6ulbsQzoM+IYq2kz5SVhRgTyrstPs7P
         dF+NBUBuq2UuPFfqaTFrKXpUcLqatcqTbibwEpwWfHzgIOY1gMCiJ/UJ1i1GkRVhZy7J
         CQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788499253; x=1789104053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8nhx59l8O2wS9fd/hyLR2KGFd79BQ0LWN0fdxxg7Fc=;
        b=b7oGycus8KX21UvfuBreUX89g1cW8jJJp0PDOCSXaoV8rWW2sOERV/xzU01gfVrbDv
         RNdtYE45ziyreX8yKT8E33XO7vawgQ9EMpxzQDzH1hX+j1clwfRYlLV2UH4Ofr2flPZq
         AwAJOCktf5e+LipeBKHDfa57kxoUNVjr1fKKzdOCquWUXCx9hqhmzHfurAj7V92rbVeW
         DPXFyr/4k+FfDBL4Yu16wExia2Z8FWU3VOpNhHIO4k4VB1jUzj5HfZzlvkb0935/Atz3
         bQcWAoK21JicimyblUV2eUuZ0XWNUwM9fYIR8eGBWEvTdtpNgqpGfwPclJT5MBaZVk+z
         PezQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVCDxsd6TJuF4iU/sSXidmKSc+YPsBtlzjIKCcz3PD99LKubN1qt/zt0LgKnbMF2/TXlQX8uAwsId3oAc=@vger.kernel.org
X-Gm-Message-State: AFuF++m3pjCWZ3KhOVorgFj6pJ3P2Y91Zx5WGoOrhrb9uspBGv35hKqc
	ntAgHpTa4HiUnasDCGIi8FMmNpHRV14wgCjoLRS9ViW0SxJOSbPibAsHmTj+UA==
X-Gm-Gg: AYBFou1YZIJoio2uEN1uli3QEltaf7bZ3D6+PVWgnAIyISXf9f9olVxKfa01i+SIrmZ
	PZM/BHAPzUou2y/do2HQK6sJKCMVV6mtSsKaaMA37EY0awIMOpNI6ZylD1kQDfcxcHY0nL0iHGO
	k5M0qV4ErSlqsUDJRRdC5WUgTwWh+aRrekwsNe+b5ZAjbQWnMkDlIfnpbrs+2uKKIHPZQqlR+BL
	DJGfVaXK1OJT1qGFQd+pZI9cDjyAfAufb1roezAudE3eZjQUok3lHI0r+0MqAXr2H3Sdao///i9
	Uqyltr0hqrPs9fbH2o01YpHnyl3NZ6thuqBb55XlxVT+aI42LmtIW3MY2sn7svPNcCbgukUPSo4
	TOiNr0AW4nxffHjjZUG8exY3vFqnZMbJOMdXbNObc3Lb1qW/SafZAT+3dZLA4/bJpjUOp5MGhGs
	mxRQgmJIaqXkyiaAaZJEaQFBErx4cYP8sXmaSI0+2YQrbzCn2KPSTUFr2eXcSl1o6OvUpekJy0Y
	A==
X-Received: by 2002:a17:90b:3b52:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-39b26101d25mr5197743a91.8.1788499253348;
        Thu, 03 Sep 2026 22:20:53 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm5952481c88.4.2026.09.03.22.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 22:20:53 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: pbonzini@redhat.com,
	seanjc@google.com
Cc: shuah@kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nagachaithanya9911@gmail.com
Subject: [PATCH] selftests: kvm: Fix transposed calloc() arguments in the uffd helper
Date: Fri,  4 Sep 2026 05:20:33 +0000
Message-ID: <20260904052033.3648259-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uffd_setup_demand_paging() passes the element size as the first argument
to calloc() and the element count as the second:

	uffd_desc->pipefds = calloc(sizeof(int), num_readers);

calloc() expects the number of elements first and the size of each element
second. The product, and therefore the allocation size, is the same either
way, so this is not a functional change, but the arguments are misleading
and GCC 14 diagnoses them with -Wcalloc-transposed-args, which is enabled
by -Wextra.

Swap the arguments to match the calloc() prototype.

Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 tools/testing/selftests/kvm/lib/userfaultfd_util.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/userfaultfd_util.c b/tools/testing/selftests/kvm/lib/userfaultfd_util.c
index f7ce5a6ddcc2..49eff05b7d39 100644
--- a/tools/testing/selftests/kvm/lib/userfaultfd_util.c
+++ b/tools/testing/selftests/kvm/lib/userfaultfd_util.c
@@ -119,13 +119,13 @@ struct uffd_desc *uffd_setup_demand_paging(int uffd_mode, useconds_t delay,
 	uffd_desc = malloc(sizeof(struct uffd_desc));
 	TEST_ASSERT(uffd_desc, "Failed to malloc uffd descriptor");
 
-	uffd_desc->pipefds = calloc(sizeof(int), num_readers);
+	uffd_desc->pipefds = calloc(num_readers, sizeof(int));
 	TEST_ASSERT(uffd_desc->pipefds, "Failed to alloc pipes");
 
-	uffd_desc->readers = calloc(sizeof(pthread_t), num_readers);
+	uffd_desc->readers = calloc(num_readers, sizeof(pthread_t));
 	TEST_ASSERT(uffd_desc->readers, "Failed to alloc reader threads");
 
-	uffd_desc->reader_args = calloc(sizeof(struct uffd_reader_args), num_readers);
+	uffd_desc->reader_args = calloc(num_readers, sizeof(struct uffd_reader_args));
 	TEST_ASSERT(uffd_desc->reader_args, "Failed to alloc reader_args");
 
 	uffd_desc->num_readers = num_readers;
-- 
2.43.0

