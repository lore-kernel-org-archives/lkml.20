Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792634242;
	b=JsDeCHqvG43MRqk5TxBLbAcVHhYR8JPoQ2gmTO9lJsRxV0NxILpK3RTPzjROZ05sFmAT
	 b+AiJB48A0Hk62tE7rLg9ESVbVRpO2VqXVHeFo0jfEZP+z1SftmRAHkwetQy86ixBg2FA
	 yN8ydOfYxtEpQ0Z771WiHrarJSxY7m6lzjEJubDJxJzJmhQYE0KuHO3+pUTHagLdSnK1J
	 ZrNwRHG6N5Rcfi6SjAqBVOiUZLG1UlLQGRtPfpivIQFVSd9Za2U0+rOooeKiDmNqrCKWJ
	 rcS/yzc0NOXcE5f0TMz/3sZ2kj8kS/9Vk1h7dKZwzXWCF6/RVzG1kypKuz/lRUX4Zxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792634242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Rrt07MWuBvKNxCUpcIHeF6DdyBR4Zz5NXlnZyJVxMUY=;
	b=UpWc9W99w1c3QXQtVZNVB3Ohbj6iV4O9QumSOuSOr8Xrjz9Cr2wTgTsOwA4R6ks2BasW
	 H+bNXHdPz9DOq8blzKL9ZPYzcyYGAhrQgnltDpxHPrnLvw3FCSXSOCwx59qt7ZLy9L0Iw
	 2otndWrxzCx5beDhvj0V4zTbE3Yt97R7PSkkmFvLRAM/aw4/U7Ox2g3FY1wihfnHXvfkt
	 nRtM0b8T2UQApqzPl2JN4PqNi44oDxHbEeYlxAr8uJUhXc8pLtIqqhX0mcWYWLCHchk0f
	 jhuE9VnT/JQ5H/9JjdOuvSxfiGc3vWUlF40z1RRzkZ4rYh3xtKU+jC/RKmN7hPeTuRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LVXHlWxb;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA33606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BA33606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LVXHlWxb
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so721448a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792634241; x=1793239041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rrt07MWuBvKNxCUpcIHeF6DdyBR4Zz5NXlnZyJVxMUY=;
        b=LVXHlWxbt7zTnrfwpRAAKArh0anXhoxyz4LkMwz+U6FjFY5B2RWTV8bC+BeBzModcy
         MK+4H4Ae3Ve+k1MNf0Zf014GvM6J9em3f4qVG+we0Q8zEPfVLgdcaB649f2cQS7nA1XH
         vaosoMUbUzorV4pFiZQNrT1hM//xValQyBYVoQU8m1NDBEK6BIFUexceMPryTDME+2OW
         hpW6xARLpcKaJAY00VViOSCIHdKgEO2VvSCBhgLVvBFgbN1zVf+TeOIHJoBJHkkUbMXZ
         vX7h6qcfbyRFwm9W3KL1J3qhzniEtgZJEwAiSK0p0xosjCrYNJJ2ULGUrUSOtulbnxCy
         3N+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792634241; x=1793239041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rrt07MWuBvKNxCUpcIHeF6DdyBR4Zz5NXlnZyJVxMUY=;
        b=oF0IJTX5+rLahh0N5qKhtmCiu+bmu4AfDT0HpZ4AQGekeNBQ2LPQBKfTcbSgq/Y40S
         leE/7jRKp3s14kOMw4d77eGuZ7m1szu1ExWoC7eJjf4KbAWmogPWpvq7aM13HZcKDFr1
         abQ6Ys0TyOOB2LK+IohNa0B7MsQ+DC2h/du5B+5MAn/QfBgOVnaXlHuOIQyMMrr791yz
         srV5ibDB6+jwC9RiIk9wog7dN1mMGgIEYBc3gkX9FpJYfGZXrVd4+nQClXSiHecJpGzJ
         EgVsgvlBLPOXj4fkaZsdnRWtQT/wPQU+wMDY0eKiag8lD2BXWpy/Glr0uFyNONyXoDjV
         5+qQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTmNpdnvtdg9r13Nw+7SXU17Stx1HDDffHc9zRuHwUp4Ubxn3D0ZtFGdlvvhYvKdNsD6TJADegOHyhVVQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHAjWBkVnwMJ1ng/IloR0Nl8wQRE+DRHHDBPjRbjcg9vEJ8w+Y
	qyeMJ47l1oon+gMD1bAViWNIItu8dIAWPr9Z9uMhMOrmkO2/BIyU1p62
X-Gm-Gg: AYBFou1tjcbxS7loHcsKIY3bRbwmEWlHp9klbSX0bf9uZhPOHC6OM9qJgOodBRJ7QiW
	uidG2+E4ezlWmrCHX104tScckESzHyDlAMvub4qdFYy9E2nBs14wHYq8SPE5Byd1iUN0C2+hQ1a
	dwSM8sZn8z7ilAODxiMvjalJMLHn1zxiPS/+N3HOc+23pNpgqDYS89VSnlK0RjndD8xAT+zj4tV
	auAfDLklPrYfaaZ1oj5OwB7FX9IDdFySXohDU23VEoMRm9cgFSHtP4hxFGzqzI8Dr3x27SfP9JK
	XvFoW26Eht2AIvL/ASfn63UQRTNt3Av289tEa8UEBYP1Pg5AL0wxOiK1wQWb3OYnScxIsl6suI3
	V75Jf96rAyZbwbuURyVzDRT1hqFb06ZHnKIVeVZFYeaXK+J6bUTQAVpH/+mBv6uwMnEBddXQAj6
	lqBbGdTyTaNc9ZUrapgA91fNbEq2nAz8fcQvcN9c6CVtOGgvBZjNCSkqu2cwCdIKHA7DztAsl9S
	stVkqaaPkXSIoS7qcNmQI9z5AB+951FE5to9Jav6mpi8FAV7qdKDi5Mv5/ixuuVRuTZak4Csrdz
	+m5MI1AudNMNEuwhp4JnvWs5cCsDYD1V8Qjl6ow86cLJRDqSW8zmpMazGQeiumf5BHkE+HNOKcV
	ZnefuJnlVGjV8BOBTpaH0c9CT
X-Received: by 2002:a17:90b:1801:b0:3a4:b74a:795c with SMTP id 98e67ed59e1d1-3ad86c79098mr3189121a91.16.1792634241278;
        Wed, 21 Oct 2026 18:57:21 -0700 (PDT)
Received: from coder-ast-ast-dev-ml-0.tail2dda0.ts.net ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48ed70dsm1701803a91.4.2026.10.21.18.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 18:57:20 -0700 (PDT)
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: bpf@vger.kernel.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	oleg@redhat.com,
	peterz@infradead.org,
	mhiramat@kernel.org,
	jolsa@kernel.org,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	surenb@google.com,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	hughd@google.com,
	kees@kernel.org,
	mingo@redhat.com,
	tglx@kernel.org,
	x86@kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 1/9] mm: Bring back mmap_write_trylock()
Date: Thu, 22 Oct 2026 01:57:04 +0000
Message-ID: <20261022015712.1297331-2-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022015712.1297331-1-alexei.starovoitov@gmail.com>
References: <20261022015712.1297331-1-alexei.starovoitov@gmail.com>
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

From: Alexei Starovoitov <ast@kernel.org>

Commit cf95e337cb63 ("mm: delete mmap_write_trylock() and
vma_try_start_write()") removed it when khugepaged stopped using it.
uprobes and dup_mmap() are going to use it.

Signed-off-by: Alexei Starovoitov <ast@kernel.org>
---
 include/linux/mmap_lock.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
index b8a13b8d36a4..e5420b0ce61b 100644
--- a/include/linux/mmap_lock.h
+++ b/include/linux/mmap_lock.h
@@ -566,6 +566,18 @@ static inline int __must_check mmap_write_lock_killable(struct mm_struct *mm)
 	return ret;
 }
 
+static inline bool __must_check mmap_write_trylock(struct mm_struct *mm)
+{
+	bool ret;
+
+	__mmap_lock_trace_start_locking(mm, true);
+	ret = down_write_trylock(&mm->mmap_lock) != 0;
+	if (ret)
+		mm_lock_seqcount_begin(mm);
+	__mmap_lock_trace_acquire_returned(mm, true, ret);
+	return ret;
+}
+
 /*
  * Drop all currently-held per-VMA locks.
  * This is called from the mmap_lock implementation directly before releasing
-- 
2.55.0

