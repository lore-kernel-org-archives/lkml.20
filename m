Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134753D3D10
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791579918; cv=none; b=g+K8wFJNSfFoKnqYR8myieBbRaqFKFeYXao2dtzNyc+RwnLaEctP/n8Rak4JpTp36u4CngaDbzszWCr2Rh2rFtuz2UeI/MU0n+ne7RO94XelJ486E5KsHx7XXabKEvDUA2kGIEn3TFsWvq8u8h10UESnJ32rejswqoOfhk/lQuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791579918; c=relaxed/simple;
	bh=bhQCTZ59FiryGzv3D1sOSpNJHyq8P/Yq23VYtggOCzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOWDFVcg4ccj+3YQ5tiV8ggI47XCBsERU9HF9lgOmHtxM2Bnpe76igSuf1oSrcf+o+vNaRAtTwDAqTh/N2Mxv9lANEY0To+Sch8JKPqrbk+ki5HiDi2S+lxBQvofwxFgljrFR3Bl6cGyg/EYrV0yMjk3H9d8OaUxWfYu25ydMxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHv7gey1; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHv7gey1"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c29c6a3930bso34216666b.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791579910; x=1792184710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wz0G6EIJ9jHYf1DY2TM/zttSc2Bnn/rBBqINkszU/6M=;
        b=LHv7gey1K7d6dcBiEVBwPaJb/IInzcQqGE6LZ/Iyb9urVy9FAsgUr2SP09qeIEczrV
         c6TsmyBe/qTp62sDWB4F0pcSADsegZ7rsLdqRz725kApesSgt2GB0SahbPvgxZ7BSHHA
         LP3GvkOU/Zpvhl+579ojxLFU/GYwnehpC5tKiIy+YIdNb/NlB7Pg0Y1r/hbwL0XVVFIw
         AOloDh4ldlFvUAGlidIWANnx1w5FzIR4nWeETncZJsu7K+kePq9Yxwhc4Aj+sgsIGnZ2
         TuAMvTKrcwIIXeIOz8TWFaoohszeUGgvpxc/G8IFOr/wKWga1ScKAxrK/fKq3h4ljCIS
         qp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791579910; x=1792184710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wz0G6EIJ9jHYf1DY2TM/zttSc2Bnn/rBBqINkszU/6M=;
        b=e4Azq946PYEzNqvxXE4X4Otue//N/2lvfw0vDnK9tp3+zMqSvMTXya6TzUyIaBra+H
         HVbr3wFaLgWVya96oT+AUufGCCgYHLTWbgbmULfJmkX23XICvFOIvEuz8qjUeLLcxIRO
         Y1q2h0cFqcNFZm1Z/9MzPVKe/xTvPC61UixaPybpTm4142lovwJNfhMzBPl8Xbgjuo/q
         75mDe6i+881/tvSEupUoLBL4vWsI//z+yVdVsYA+j5bsqRXhgWjsf9ToBOBdivfMTl4Y
         /oOEmuXawHOiVQPqo9dSk43oxTxe1Nyie0v2gsyWqIWDChYyA1jVeuarkJfU20sELI3K
         exmA==
X-Forwarded-Encrypted: i=1; AKwUvBwbcasNxCv6gc0plUKx2ZLpgOVoXHxVXh1IjZvKSy0tf7/V2kHE9zjNK9iEjdHBElOF7KspSMCLV4ycT4M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrNsfgu2N1njdn3EOQOIkX3zNQL7LC03FYHYgPHmVsBSuLp5wi
	XiwPa1hASPvOCjIB0Fg6qATg1X3A5AOQ5cUJzzn9RBaOQF+nUEyLWJidlEwrmtP+
X-Gm-Gg: AYBFou3YW+ePl/B0pSqKyhDVlvkklcJn6f/9OUQEPCDQvFno7FQf6JZZIgDbrvTRPWx
	rfGmk55VXbs1wHMoKbUiMJ3uuOoVTsZ66++PE4JqR6eKh2dGaw8pr9bt/NP1wzi4TiGt+axM2gS
	I9ZC/a4cUaH0Ie/axohak09CwkY8DmWXZSRVZUPoVncDVRTxBlkE9uDxirue0q2dyJSNS40KBP/
	zUchlfcnnibOxiCMg2S9dpD41BJ2gIFKtEovRYUx4qlpvfRJN7c/5D6/vpVAnJG2uD0V7BbSVo9
	JcKsMrtjLrig/sTO6YSmLlwM5J6B8X78kQZec97BRqw8yF44iSPKU+P7H1bWLIiDhOrem9PxJjz
	dQFg5VbiU3wAOIvnwswc575a+ICUE149Ki7kJKsZHMLHg3Fv4TQYjJssHFFkOx4JGWmDu2/dFjC
	l+SYQ0SYP2CQTIHpTaH1HaOSfX6DLIbngqBNHKDaTT6Q2WshlBpSJFSBQSUw+lMlZj03hx2Rc/E
	zE9doc1C+209ppRRLOXR0JvoByINsZO6CWWyClq
X-Received: by 2002:a17:907:1ca0:b0:c26:22ec:db92 with SMTP id a640c23a62f3a-c31aa02c51amr323343466b.47.1791579910016;
        Fri, 09 Oct 2026 14:05:10 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9765d1asm142141266b.8.2026.10.09.14.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:05:09 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4 8/8] alpha: invalidate the local context in flush_icache_user_page()
Date: Fri,  9 Oct 2026 23:03:53 +0200
Message-ID: <20261009210449.971057-9-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009210449.971057-1-linmag7@gmail.com>
References: <20261009210449.971057-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

flush_icache_user_page() has the same caller-CPU omission that the
previous patch fixed in flush_tlb_mm(): when the target mm is not the
calling CPU's active_mm nothing happens locally, and smp_call_function()
handles only the other CPUs, so this CPU may later reuse the old ASN
together with the translations it still holds.

This matters here in particular because the function exists for
operating on another process's mappings: the comment above it describes
setting breakpoints through ptrace, and access_remote_vm() reaches it
through copy_to_user_page(). The calling CPU is therefore often running
something other than the target mm.

As in flush_tlb_mm(), the uniprocessor implementation in
asm/cacheflush.h already has the missing case.

No imb() is needed, here or in ipi_flush_icache_page(). Alpha's
user-space I-cache flush works by allocating a new ASN rather than by
invalidating the I-cache: the entries stay, but they are tagged with the
old ASN and can no longer match. An imb() is only required when the ASN
space wraps and numbers are reused, and __get_new_mm_context() already
does one in that case.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reviewed-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Message-ID: <20260923074903.862898-8-linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 988e397b0b8a..e21bc3920bec 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -758,6 +758,9 @@ flush_icache_user_page(struct vm_area_struct *vma, struct page *page,
 			preempt_enable();
 			return;
 		}
+	} else {
+		/* smp_call_function() does not call back into this CPU.  */
+		flush_tlb_other(mm);
 	}
 
 	smp_call_function(ipi_flush_icache_page, mm, 1);
-- 
2.43.0

