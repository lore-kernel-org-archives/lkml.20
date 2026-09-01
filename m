Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5318947ECDE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277886; cv=none; b=VxNswSdY2IVV8a0oLMA9SWMT1r10GSOIsp+6U0+MAVFQWavvpIcHVtgjUkdS4IaSMku17BLhqz3LXVSVJ0RsQPgLJ387D/QgSRKV2Rfx426+0T0j9u2i3ybvONIklw3faKUvf1bIHADfT8KvAX4Gse7NnzOqE084rhWa8Noxwog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277886; c=relaxed/simple;
	bh=bveTyMIdx8hevGL+vbU8TCdQSmPrIN9BXqaCmYgPk0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ld2d0z0/YghiSAJQ8K8++WSLX+zTyiYEqcVZkXclQMWTl/rPop1hjocXV4eHDDVSqqBEOq3jGd+aR/tADlVmWkwe4TOZVTzINGoeF2q653emeziCGHqddt7Bhuhslm7DIMFDBjgJA8RHSsv844TrVNsAPqCYEjuBg2LFx07poSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejKbfQfG; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejKbfQfG"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66e63c2c9e1so1443117d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277883; x=1788882683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2l9iaFXdllUQXET9h1jEc0Od9yMpy8JbC7vsQmQuuXI=;
        b=ejKbfQfGvbF0l8Bu6Bb+c2e6y2L35IGXmpRHZwIh4+dg7Avq+kokFv42lrjfSFJFbD
         1qpl36ynEMj68DCVv2j3mdH135kNSRjiyjTguBmthZq7i7ZYlTjXNfhDe1BFCcFkNExl
         sptVtrgJq1i7swhNN+AzKDGMTcYwPOypRCy7W+qez13OupZFkYK6fnu2AV4rTaWeVlOU
         HyvYqQvgRC89uMogymBt+x07TYUgLnypMjZJ/7StV4b9nafR8pVPgEakjps7hwVJXTeh
         3kV4DtzOgLciEdKzS0mD2N2Ll/u0Zz0ghg3u+ei81M12c2DwIFBxmHwHkCM7Mzzxb7U9
         qLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277883; x=1788882683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2l9iaFXdllUQXET9h1jEc0Od9yMpy8JbC7vsQmQuuXI=;
        b=hZ5xxEHSeMYzdPPKMHbxqEpjfL10eYnHu6rpbT3K5S7eXntB6+Xbq7jSxCo+2s/TBA
         iYnF1ppwFK42cc1dab3B+NL3AS7bJbVDArC3+p0bH5xSgrnNcKNA5w18ZT5w23lhVdRy
         vljMg4O0qOINN/DLCP4gn+zw0EinLwcaMIdXvvu0TM1d2YLtYk/445vISyEUBJJEeVEQ
         9bPQLFS8/xpOtx8k+d0cG3JjZMGhtFBFfagV5ENdhgs5tUewIFedDU263E8LAGT1cs3A
         NNR6m8kfUiBtuHxcp7ZxpI/p99YgjGhQ2fxD8XWeSXprG39AkRIwyVAJZOX4iqJ+JR11
         pN4g==
X-Forwarded-Encrypted: i=1; AKwUvBzzRh7+EL2h2a5eKzE0lCcLFMwX7M2oCMWZoCbhqqwB3EOueVqgYTMHcXwoACboQ5v9gQ/D167LxqbjRkg=@vger.kernel.org
X-Gm-Message-State: AFuF++km4DB4tFGPGbAaRgI5rNbBzZ/V3myt2NwW3lq7Nmu1Ms0psWtK
	A8ADc149/25fTYSBZRtv6IlVHgs9PAkgxIyOXI7PT/eoFGjCvskQ1laT1z25LQ==
X-Gm-Gg: AYBFou3UzYGGkP70oeYGkG0jzrqA7FQtR+TxS5FN2yKbCJcmvwyP6ua1MGHl2LuyVlZ
	5AP3LlSIUu7awKZm/VqbCw5t8y8LcVWOD836wuNrEgugViIN/Oke+l4uaJ+moHchhSJlmkFQy19
	2NoTqcbct+AOqTWKL6SlncGE+Iv4zxRHTJfXtBELZdX+edFPOYgk3zb8KIZSxVBw1Es8S5qjRos
	c/4N+xjzXJ/1iC7b540srLTfd/kTFFIEsCD078oANNjbePx3FmnBeedm2g4Y/uzyZLwMjQxs+At
	0Vrh0K+sI6YqIQVselOrZ980dm/0C5vFrW8PNTtgnOWfzMmRCg6QtiPgD+bVEhlS1UGbain1rlS
	uH/8sysqbLs2b19Wxd3HkInkr5uG8TzSE3qbDDYigOibsAn4auKostuVggUTIlj6HWICHHGCxd3
	+t/DgCm9jJY0YO3YAihZmAYZenNRsw5EoX8vFnxybNrT0LiXEvv8Uw72zXvhj0UX7i4oX8hNdoI
	cxkvs7j4O3aaWwEyqsR+IHgihGV5h0R2uh5siJg
X-Received: by 2002:a53:b6ca:0:b0:66f:86b1:4612 with SMTP id 956f58d0204a3-66f8a45fbe6mr1535393d50.7.1788277883089;
        Tue, 01 Sep 2026 08:51:23 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ecf1d87sm8521827d50.12.2026.09.01.08.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:21 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/24] alpha: add HAVE_ARCH_THREAD_STRUCT_WHITELIST support
Date: Tue,  1 Sep 2026 11:50:25 -0400
Message-ID: <4524c04f1bc23f244650c7054ee449b6af054b86.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alpha's thread_struct is empty (all per-thread state lives in
thread_info), so the whitelist is trivially empty. This is more
explicit than the generic fallback, which computes the full
thread_struct size as copyable.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig                 | 1 +
 arch/alpha/include/asm/processor.h | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 2ae514bea4cf..e6fa8da0abff 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -42,6 +42,7 @@ config ALPHA
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_SECCOMP
 	select HAVE_ARCH_SECCOMP_FILTER
+	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_MOD_ARCH_SPECIFIC
 	select LOCK_MM_AND_FIND_VMA
diff --git ./arch/alpha/include/asm/processor.h ./arch/alpha/include/asm/processor.h
index 5dce5518a211..c461a26d47b3 100644
--- ./arch/alpha/include/asm/processor.h
+++ ./arch/alpha/include/asm/processor.h
@@ -26,6 +26,13 @@
 struct thread_struct { };
 #define INIT_THREAD  { }
 
+static inline void arch_thread_struct_whitelist(unsigned long *offset,
+						unsigned long *size)
+{
+	*offset = 0;
+	*size = 0;
+}
+
 /* Do necessary setup to start up a newly executed thread.  */
 struct pt_regs;
 extern void start_thread(struct pt_regs *, unsigned long, unsigned long);
-- 
2.54.0

