Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794799569;
	b=ghtcVrsDfxjXDmckcB4qZeFECxwpbIdLyBcqihObDNNm1XR09WJxSwO4ZNb0Dx/5wnTy
	 D1dljZcYktLsmgqftGDR+uTnQ1pezVKQ1d72wCum6IP5+PEgiqFIqXSJ2W4fUisn2Bya/
	 doNJOibIVF55SZ6bO+mPTsJw8Nx6jcfJYA+uXPihpiI8wihgT37QXwQnvx9ukOF65cRD9
	 /Fz/CtQZbj0jbTK7lf3qtDJK/E1dXpgcPLkrYrd0ktlXLb8tqTfp0M2oOmmXChpGHS85J
	 L2UitsBpK6SXwjmCUBxq0y8NZ2aP/CL2HJFzL8QDsMV83cUhwDw9xbngIX6OFO2cyAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pKCQB/Fkd7oKivhdMJjaV0uk7dFPCE0pzO3P5Iy4dPU=;
	b=OXf+pejQvBZSaxcBasOZohAhOw1JLg0kxrnDFQhcSupRtbolI2Mlk040Zc0SNQaSp87V
	 W9lBaxomySYjeSE0XLG9awLlwtc31GOsjegj1qxkYyaUs3IhzlUvGH+wj2bcHzD944Vr6
	 6FA0n8RKIzjL7FvIBx4R/4UJiuXRjexEPzdpCfWrnuisb8aaiSLzUR+4NkfwEJbUKKLWV
	 Ygqum6jDQxGSPZ/oa9CXwxj56orK97XngbxzxqWv0g7MPo1swtLADLTzcvb9/UAZXeGOh
	 kADyJWpR9Lfy1vBsE+tKkIQbMQ6ZrzZQuAYQcNK/g4Jzc+hNybOJ6z0DBAjJ248imPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=fWFgHW5Q;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5BB606A882
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB5BB606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=fWFgHW5Q
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37000e7234bso2208615eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794799567; x=1795404367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pKCQB/Fkd7oKivhdMJjaV0uk7dFPCE0pzO3P5Iy4dPU=;
        b=fWFgHW5QPqCgQxW1W3loSFtAXIDxX1l2HvI5HarV0IJKKZEq+aNSrhGqiqixupuQVI
         YdfonOMCWkI4fgm9GcPEe6FBy96+90WuNaLdZlH/r5G84Addswwp1z7bihKya0XGybx3
         HoxEyBrmButDZ4H+ZOdmCoRjYCvPzCoQY14wCMDPDHHOu00SDmn5e+cPBhXHewHSJA9w
         ddh2Mt/WR4uuBdeD/w9ZN8Eyy36BM4bUvhHdjSIqRYCDhmKNQWQURofL4dWCDeZkd+ln
         wv8dObp76uwNd5fo+NJWTLKifJWKKOlGCL6CUgc3QR2C8yUeKwiLz5PR2mU7BM0l8eQy
         R2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794799567; x=1795404367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKCQB/Fkd7oKivhdMJjaV0uk7dFPCE0pzO3P5Iy4dPU=;
        b=fRpuQx26rk8pEGjdDQnkpgkCHUz78qlj+/lptG3sMmSP1OcVW16JW9h4P83fPpIMj3
         nsTbh62ofGOOJuHOy4FaH/WbfmzRzZMQOqf7kSda7FpyV/HwE86v6yTy/IxyGX3qR7Ve
         zcP1v7CjRWqMxiIXDytOTVXktPU2BhNBjj4oj6ZSmf2Kd/97S/J3XHVRqFF+UyPKDM8G
         1z1ayGNsuVEGL47sN1cHUFgZiaKBZRmHVlfu1fkQWI867aH2PzGIXr5wON34ZiRaZ4cm
         N9CoZ/SkQdlwuiFpgm/wl7LY4QloAcm3SH96pftcu4xWMOE22OO+DTrA92r+7g7FFWbj
         1bvg==
X-Forwarded-Encrypted: i=1; AL+hErFrxBxTL1WA9kxVvctvyRDhMn/xKU8B4ox9uXkSY2prpwS4YfQA060AL7AJm6d4XHQNl1WaNTkXNka+aTk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Id3qNGdDVm9My69ooHMhviRgErYV0QhUdj6bbnxMRaKirAxVg
	F25SjH+nduU1oo27wSwNrJZoQVZi4eFqnMZACDI0TGy0anW7tzsNnQnS35/qq6D5DHw=
X-Gm-Gg: AYBFou1hUhvtlANheqi+nhvKPwOYRzanrLkLSDIHnUu2vIifNt5QXFUdPlIH4zghMBp
	63C9gFKkoNylQ9tzL3y6GX1eA2IJaQFXJ/5rw0n+gmIONR9Y6VlvxSlqhNb3Eq0ohFqFXX0TZap
	kNa44IgF27K3spOQpJ9Qb4T5AVlHOlh7omFAd02kxRGAchRZzuQmKQC1XR0OZZvX3hEYciEoZX7
	ELA3xKsSipI4UO1IhvHRfMi6UgRWlh+/f5RrJ/ZbYXIVQ2IeEfqBbKt3snw38w+c9XYS09daNHL
	57uuoH8KRUeO6jxmWM5qitA47Hp8KjUT77v/9xlBBVlr1vHlGqle/9Hpu5DEBUkuwh704B5jFtg
	Cwx0h5n1vC/m5bh2q3CqBE+cI5JByh3F+CxT519yhXpgyAVyMwTORVM6LPT+Ef5kLxlHWlpige5
	K3fB7AV/xivObWzmcwNVwIpAi/yz7wv9le3+4egJxopNIo1CjutjNH5KTBmptF0Yt6Ubq07bVj9
	7IpOa48wa9srXKcI7CyVWkr0AuEgfdU/fXEB6Vq/xkbE7b6BjENsKfdHwk0b+Sy6XwomrwovEqc
	bIYpKgmZUvLXVz6JwxmN4HpRg+pU7DwYjtsEN4T1gw==
X-Received: by 2002:a05:7300:d18b:b0:36d:37c4:3759 with SMTP id 5a478bee46e88-37965f9d24cmr9318940eec.18.1794799566676;
        Sun, 15 Nov 2026 19:26:06 -0800 (PST)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm53117337eec.21.2026.11.15.19.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:26:06 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	debug@rivosinc.com,
	samuel.holland@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>
Subject: [PATCH] riscv: usercfi: Don't inherit parent shadow stack for user workers
Date: Sun, 15 Nov 2026 19:25:58 -0800
Message-ID: <20261116032558.130928-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

User-space background workers created through the copy_thread() args->fn
path (such as io_uring io-wq/SQPOLL threads and vhost workers) share the
parent's memory space (CLONE_VM) but never return to userspace.

Currently, these workers inherit the parent's user_cfi_state bookkeeping
via dup_task_struct() (e.g., enabling shadow stack and pointing to the
parent's live shadow stack base). When such a worker exits, mm_release()
invokes shstk_release(), which incorrectly executes vm_munmap() on the
parent's active user shadow stack. This triggers a fatal SIGSEGV
(SEGV_MAPERR followed by SI_KERNEL) in the parent process during its next
function return check (sspopchk).

Fix this by explicitly clearing the inherited shadow stack bookkeeping
(setting base and active state to 0) in the user worker branch of
copy_thread().

Fixes: 61a0200211d3 ("riscv: Implement arch-agnostic shadow stack prctls")

Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/kernel/process.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 34c1d498d1ca..4bc95acc5462 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -261,6 +261,15 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		p->thread.s[0] = (unsigned long)args->fn;
 		p->thread.s[1] = (unsigned long)args->fn_arg;
 		p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
+
+		/*
+		 * User workers (io_uring io-wq/SQPOLL, vhost) share the parent's mm
+		 * but never return to userspace. Don't inherit the parent's shadow
+		 * stack bookkeeping, otherwise shstk_release() on their exit would
+		 * vm_munmap() the parent's live shadow stack.
+		 */
+		set_shstk_base(p, 0, 0);
+		set_active_shstk(p, 0);
 	} else {
 		/* allocate new shadow stack if needed. In case of CLONE_VM we have to */
 		ssp = shstk_alloc_thread_stack(p, args);
-- 
2.43.7

