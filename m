Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792707454;
	b=x4n8sWejCr2XL77MOfMXpuUYxW9qvuo9zdBUn1/cSnS4o5JSsiPPBKU9169fe6cYXA0B
	 TfYGM6u98odBVgE51clpnGSqPY2qK8zR0mToW1pV8Qxa4qoQ3zhcHMiCjoUD/e9zX1kp+
	 7bSiNQDzArByK8vy8K2EGdkycjTCAMBcIv/+TkavFcCaSj0FExBAXgeKIBPMPESdux3px
	 RN7zp009Q8K4k6ZPfYFjLG9PIj7n19LNqvkKRnOTBbFixiuPoWGywQN0hllsciPk+jWwu
	 9WFRJPon2fG/JOpKQeaD6dfE9DiRvrEYmSyfdyZEqTl39jONe1Ys4UJy76+/W/dGQyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792707454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/WIkpltfnb+vy/iRWdcQeenTOR+kthNZwD1BDIJsCtY=;
	b=eF5DFtQxuk4BW2nnX0t9Na5SZ/9UXSKHxHyUJg34yaHC3GdGjp6cxy02rP7LTxNSw5RM
	 +lQvLidQpKyUAwM0duUasM/VFUzXLFU8qLQJdtjDfPGz2MAI01zH8d+EKUdqfDwq9jclN
	 aHDo5Lx2ZHLBpYDRRW6WOJG2VBP93bbIqlYZ7AoyuJBVGMZk2op4rwsqgsgIDRTE61/AN
	 fdHKmNZ2J6XxwZQCtZfB0Mjo9UOn7i35aRWnQHTgOdRA6rnQgc3nZ+piRW+vOpGpiM44Z
	 PIWPVaUvQpQzrjYYSDx8s+T1qhEbbqTK+aS9Dj+bm3xBrYQa5Lioq0qRecsOQto+msA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JFpZ94Ob;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A57606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2A57606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JFpZ94Ob
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eafa528803so130977e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792707453; x=1793312253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/WIkpltfnb+vy/iRWdcQeenTOR+kthNZwD1BDIJsCtY=;
        b=JFpZ94Ob3Fm6+qT3OvTYTxeHkpIEU9c+VZ8lDQaWmzPXF/uzU7JrLsmPMCYrUuiLQZ
         1Wtx830OvhlAppc3G4T8svioQktLUvKgcZ1KZ3v03L38/G98omE3XjY0OAmiH6DmV3ar
         iNs2BkVv9aPFu0Ck7fqp1MbCrDMvzbcrKtbLnpRYO9esYY5a0rpVfaZeST8FDrRLZ0rw
         JL3+G/uUiDflNKH7CHP3Nlk/zXwq97RxcLtFlvcXrIBOpsXfAHtyPvsF09Lqb76JVHHq
         jYyQMy7aMRjpbqqg/cZb2pE3wbP8ckVY5j9uytlgLoOjBec8ATLlTrk36iNJhhBXKKlS
         n3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792707453; x=1793312253;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WIkpltfnb+vy/iRWdcQeenTOR+kthNZwD1BDIJsCtY=;
        b=j/mCfNo2+uGxi97VZjk5yMcp8rXYYG0dnMnyCa8hiqbimEVGCZNeDjSQ52wpaF2i21
         rs8uJRZHSEfT3cnLHpfVQqf6nU4b9uHASBS635nXrOHmXjhkIlINH2vIu3OBiYlZCTUP
         NG2NgEeYHdcidCu8+iBD1VZ0Nav2TAKBiKVsleGL94KYU9vBIpooMdb9yiT6jpMXInnk
         borhgDXj6iY7BPaW5DJ34BYTfiOTwfr5YEIGOF10jLHicqxqxteWdOTyOx2Ac8jtslW8
         n+g5RcQS/nODpUi/GZcr4j7UEdAvz4yDEuv9tuSmKbFW1PRmSQqFOeOTswx8sl5+5VLb
         29Vw==
X-Forwarded-Encrypted: i=1; AKwUvBwwfibj5jXrTmJm2PVwrvKzKpA4Uk022/pLfxFwHjpsTiyS5Gid03OyoMZJJ/MMKsAkiJY/HDfDk5QbnxU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbLgbfaV4uOLt8HfkYwYJD3d40HZ8GSLeYxnk7/y0b9JZZwQlo
	rQ0vjJzJZ1VPJEZw8b1JleEQDBYHau84mwE+l1RlGTovKY+HPhW2Qv7v
X-Gm-Gg: AYBFou2/RymjlOHKRRX1Q/VL2U04kTtAfaGkgnNj1ZY6BJJOkmNAgV2u2qEpWuUxAvw
	fY6QcXSpho/kkLVdoO/nD0VReaYhNrs/0RhiadVv5VDrN5x8veTR0ap+6pbH72BG1O+9HWgJ3YB
	gYEBdZd41rS+jA+qyMe051jMdguQV6ndFwxleRFFv9cI4CdVSysH8gpSLaTneeUWLj5Djlfw5l1
	Lwuuxt5hFmhQ71zC/oTh6efNwsRkx3xK+SCPhLXSjk4T+m8TwgavtlpnhVcOclwEqRKadkeAXYu
	eo9mwLHSQCweOIrvDwFqqIpuyBG/6wu5BUHIdl0LSEpw0U0E4HFIY1L/uQarLhDKp3kaP1vWfhZ
	mu//agNG9SnnQcFAd9xJqMd00QP5WQpR5UwKExxrsT2GftVqAgbdVf18+HywKs7EPEZb6ENvrkj
	Y85Wj+x1ipsS4dcv1a7RLSm3LOIuS0tcTTygUTCK38+bOB3ivfqkRCEtyrmU6Vo0xUjpSK9yi1j
	S3RpOw0NmZvRvhhknfCbjki1AKxSiODYKFD/Wyld77j4Be+oA==
X-Received: by 2002:a05:6122:178c:b0:5ea:ae99:9b2c with SMTP id 71dfb90a1353d-5ec14ab087cmr87153e0c.14.1792707452787;
        Thu, 22 Oct 2026 15:17:32 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13f2cfe0sm456271e0c.14.2026.10.22.15.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:17:32 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] x86/shstk: free shadow stack when copy_thread() fails
Date: Thu, 22 Oct 2026 19:17:20 -0300
Message-ID: <20261022221722.619233-2-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022221722.619233-1-ivanrwcm25@gmail.com>
References: <20261015023147.519257-1-ivanrwcm25@gmail.com>
 <20261022221722.619233-1-ivanrwcm25@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

copy_thread() maps a shadow stack for a CLONE_VM child and can still
fail in set_new_tls(). That error returns through bad_fork_cleanup_io,
which does not call exit_thread(). bad_fork_cleanup_thread does, but
only after copy_thread() has returned 0.

commit 748c90c69336 ("x86/shstk: Remove useless clone error handling")
removed the shstk_free() on this path, assuming exit_thread() would
run. It does not. Each rejected clone leaves one shadow-stack VMA in
the parent's mm until the mm dies: one map_count slot, pages not
populated. The size follows the clone stack, or RLIMIT_STACK when
that size is zero.

Free only after set_new_tls() fails, via a dedicated cleanup label.
Nest the TLS error check under CLONE_SETTLS so the successful path
returns 0 explicitly. The allocation error returns earlier, while
the child's base still aliases the parent. shstk_free() ignores a
cleared base and a different mm, so CLONE_VFORK and !CLONE_VM stay
no-ops. The exit_thread() path is left alone, so the double unmap
that commit avoided does not come back. The io bitmap is still
shared only when TLS setup succeeds.

Tested with user shadow stack enabled, on one config with and without
this change. Sixteen clone3() calls with CLONE_VM|CLONE_SETTLS and an
out-of-range TLS leaked 16 shadow-stack VMAs without the fix. With it,
the VMA count was unchanged and call/return on the parent still used
the original shadow stack.

Fixes: 748c90c69336 ("x86/shstk: Remove useless clone error handling")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 arch/x86/kernel/process.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 346c438ac880..451594fa5481 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -176,7 +176,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	struct fork_frame *fork_frame;
 	struct pt_regs *childregs;
 	unsigned long new_ssp;
-	int ret = 0;
+	int ret;
 
 	childregs = task_pt_regs(p);
 	fork_frame = container_of(childregs, struct fork_frame, regs);
@@ -263,12 +263,19 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	}
 
 	/* Set a new TLS for the child thread? */
-	if (clone_flags & CLONE_SETTLS)
+	if (clone_flags & CLONE_SETTLS) {
 		ret = set_new_tls(p, tls);
+		if (ret)
+			goto shstk_free;
+	}
 
-	if (!ret && unlikely(test_tsk_thread_flag(current, TIF_IO_BITMAP)))
+	if (unlikely(test_tsk_thread_flag(current, TIF_IO_BITMAP)))
 		io_bitmap_share(p);
 
+	return 0;
+
+shstk_free:
+	shstk_free(p);
 	return ret;
 }
 
-- 
2.43.0

