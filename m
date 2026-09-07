Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8307371D01
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756786; cv=none; b=s7lYw7z6jrkQ8hL3Y0coYWy4OUMnXEvSjE1Fpz8k5V+YxXj0MRSvYOI8ntqdKXO9J1oHjO2bQsrJJiQwBZsm063ZxY1zobHqI57OaOprHhVYGvAX1V1L7msIwTYva664uuRd6NUT31Rg32T9wsy+oSC7+nx9L42g8wL8p1YpOYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756786; c=relaxed/simple;
	bh=9EXCGpVfKBQS8nqmv2M5Um5dB6Qlnfw/r+giCzT8iM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bG7cizsgNF/wlE3wfMpTgpAqWhw2CIId+BePVy+RVUkoCQWQ6PYy3QhFRG4+pC6ueuk6QNpa9s81iH72gv4Krng+i8oNG2Dbi0VyluhVCJuafMGa3Kb2mKir6nludX069JHVWQIKg71qVAr44X4sjXmvBmRwgAmYQPJOTQMXens=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=piX3dBx1; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="piX3dBx1"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so3062511a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756785; x=1789361585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/DoQ4v3sOG7iCAF7e7sOxPVMm68Lco8LL3+nPKFM7Lg=;
        b=piX3dBx1CxIdvHXKLZTDwKKP7ZR+CFGe/mhS5HemZ+VVyNiw+w9ApZegLA6fnPb3ew
         NWwIRzduvlcEq/PfYFmHfDn4bw9yYwXMF6bAyLrW/Te1/98sLJIZazg4m2KIRvA8kXx/
         HBiiRBUAmtzyEWo0McTjWD8lujhQNgYFnL8ahOym07QlZfueQbfnyU9jFvz+tly/IHgn
         I5Yn7DCNQSOlGU5cgf9dnqKIPRme+IVdJSz2rJZr88mZlmryM3x7ZEmPKsTd5BCuqeJl
         mrkt7Cg9N09cKaqrxMKLqyxRv8iebgIF8b5kUpLAH1hp3R/VHgWXt4wZzgh1aZhrkoLE
         6jQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756785; x=1789361585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DoQ4v3sOG7iCAF7e7sOxPVMm68Lco8LL3+nPKFM7Lg=;
        b=LIp1QWYmUn68CyeK6VD8HJ2Rr+La+96tteXbjNO2AZwez0jnzsZuGoT4wKOCKTZHzy
         RShR8GIIZ1NrG+5sZe0QxelIB2EraYfelqg3mvgJLetxMXEI7cmpyQJ0PELxoiERAh64
         MS+j8u/pP6Hr/nOQ64a8zdOH64083WRLSK2DhV+hN8yN5/6PwoSfHb9fGDTJ7Xg2HK0N
         u51E+dsnrYuYUnZZHBO0AW4Ui/rBhSiBSomo1/RJjYfSyPyR47T3ognz3kGaoDxuFBai
         Al+C89GbZBBlRuN7CuFPI9zm4R7Bc/URmG2W8mPnfZkctCA14x3UPyfPo1M8l43TPL8Q
         XphA==
X-Forwarded-Encrypted: i=1; AKwUvBxd6kJgkkwB2+J6FFm6jZbqfC7wvWi1aLfs3q/B9FAcad8sHDDRDWvmz58YP7BlZN0NaS6yj9eOtkptFf0=@vger.kernel.org
X-Gm-Message-State: AFuF++nUBpG3SakO3v67A9GLca/Nx8uvMoQbXK/mXcvSkGhKArmbR/Uy
	QwF+sYmnrHAcOyXaNw5QzJUeRI7a02VCnO3eityoRGUTIeyu84VCvNMF
X-Gm-Gg: AYBFou3d8sUcBmJ2DSmjg09Vn51RlD06Nt7745E+ay6uaEjHpN0Q/OLY7smt2mRxej2
	1yxw/hgGtIUj53/NICnxO7jTN3PAWX/naibigX1dz3TbWCCCUv3b0q84tZ1vxRFQcdX+nUrz9iH
	ZTGGUMV6+2JYXR0h9QoKx3PmoUS5YK4CvAK8K2+i3aDlwNR2oNeERHRJ+vUMy3OhL2hdG77qsJx
	VDQ4r8O4ZEse25nQDxL7NhcqloyQ9SdyNcuF/x5/itx/jdHp4TJ5xnXyGglIx1YMar0mU7bICWC
	9drYx1Tid0Ubd027YShSTg9IexUctUtKRlpjKBarSCSLlG80Uizrv8hgTUAp2QTi3JnsFK4l4fj
	wvYhnkeDepPmAhAY2ZHlzP7kPlTfguADSGOy8FHXY/G4+04h7MWCavkusB6+1PcnUbqe3m0/qmA
	znjys4RIo4YUydKuT2sZk9pDeNKieY1HvP2XqhX11jry1FGyeUU5uLD0MRG2t1dDOtnBDfLR3FZ
	A==
X-Received: by 2002:a17:90b:4ac5:b0:398:9beb:a2ba with SMTP id 98e67ed59e1d1-39b087fb503mr29944113a91.28.1788756784912;
        Sun, 06 Sep 2026 21:53:04 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm37641639eec.15.2026.09.06.21.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:53:04 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: pbonzini@redhat.com,
	seanjc@google.com
Cc: shuah@kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nagachaithanya9911@gmail.com
Subject: [PATCH] KVM: selftests: Fix the never-true negative UFFD delay check
Date: Mon,  7 Sep 2026 04:52:46 +0000
Message-ID: <20260907045246.3783304-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

demand_paging_test parses the -d option with strtoul() and then asserts
that the result is not negative:

	p.uffd_delay = strtoul(optarg, NULL, 0);
	TEST_ASSERT(p.uffd_delay >= 0, "A negative UFFD delay is not supported.");

p.uffd_delay is a useconds_t, which is an unsigned type, so the comparison
is always true and the assertion can never fire. GCC points this out with
-Wtype-limits, which is enabled by -Wextra.

As a result, "-d -1" is accepted and converted to a very large unsigned
delay, causing each demand paging fault to sleep for an unexpectedly long
time in usleep() instead of rejecting the argument up front. The return
value of strtoul() is not validated either, so a non-numeric argument
such as "-d abc" is silently treated as a zero delay.

Use atoi_non_negative() instead. It rejects negative values, unparsable
input, and trailing garbage. It is already used a few lines below for -v,
and hexadecimal input keeps working because atoi_paranoid() also passes a
base of 0 to strtol().

Fixes: 0119cb365c93 ("KVM: selftests: Add configurable demand paging delay")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 tools/testing/selftests/kvm/demand_paging_test.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/demand_paging_test.c b/tools/testing/selftests/kvm/demand_paging_test.c
index f8b3d0b68830..619a0b2be45c 100644
--- a/tools/testing/selftests/kvm/demand_paging_test.c
+++ b/tools/testing/selftests/kvm/demand_paging_test.c
@@ -297,8 +297,7 @@ int main(int argc, char *argv[])
 			p.single_uffd = true;
 			break;
 		case 'd':
-			p.uffd_delay = strtoul(optarg, NULL, 0);
-			TEST_ASSERT(p.uffd_delay >= 0, "A negative UFFD delay is not supported.");
+			p.uffd_delay = atoi_non_negative("UFFD delay", optarg);
 			break;
 		case 'b':
 			guest_percpu_mem_size = parse_size(optarg);
-- 
2.43.0

