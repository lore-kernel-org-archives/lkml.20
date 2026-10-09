Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5469E3D9674
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791579912; cv=none; b=JCHzdBf8ISejYFxuj19VFmm3PsEtIFnSDGbQ2HiYwl/YwJYwvDubMhMtu4NQFN+CcNseLZeoBMBSjN8XfMqldhxYTPNQKjbW+ScKSZNkMdFRdYMzTF56BmkYRzZNcer+yJ2GBEBG2zYXJIh3P3uRj+AmySVrjNwOVCEjouTxgSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791579912; c=relaxed/simple;
	bh=nHn0HkfqTbiMd61zpNP0ycTKcDNOwfgaeRH9NwPUJCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uCyeGvqK7KlQ9LBXKmZE2QEqpQipPzlFw4e6MsBSP2bocCYNkgSzSyiLw+788FBsqS1nMROvAotUM3wrWRwzYQjub2obFH9+kYfoS3WBenebk5MDS/NvptyqQtAWD+NaYJEjJUP2ZeWczVKIb3IK3C+z+VbVjk369iaqTlC+3+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbcM5VG1; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbcM5VG1"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c247f6687dcso44124666b.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791579905; x=1792184705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJkUJzSF2t27pvsqhrx6jHTfwNy+aaqYO7t+PVIi7Ik=;
        b=dbcM5VG1xC0eIV5BMnnW6s6qm+93GfAEZYAru6BfhE3by5vqRAZg1hWiRZv6dYBXqf
         mbuK2/+E6f6JYZ4LUjeI2xCmRjOLJw6Qb+KvvsS/VNyTsmfGn/hhuMjDgyKYhtRIcQCN
         xZfiGGZ+rqCgTQ92H0deEPPeykY4uNb0CgpYxmXplrysm+1MQCHuXMluI5D6QValFxmp
         puz2rlU6Lq1CVIpbVMFo5zVlTj0pSVFO5WOg/zGs8NNOVPLkKkV64VZ36ycVLiCof+De
         9vpiLockrLI++GdWSY/oT6i8EH0QO7PmbIw1xWSs3Z0L/nXBa+eZP3f6QaZnSU1t5sCw
         k9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791579905; x=1792184705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YJkUJzSF2t27pvsqhrx6jHTfwNy+aaqYO7t+PVIi7Ik=;
        b=xDMDdjxHcuYZCIp0stwz/CG/E+m8FxLnQRYSQ5KSdbbOCe/zNI2hbxcX11iEWj8XaI
         XctwPVzviJcuD88nwpGaKbCNHU83rzQJWIX+ebBB9Ko9jXYFmyESIe9WbxrLcippjylC
         jeh4XYIY2Env1ODAjkgXblWT8yNSHKrOGA4SHrFUizur+hhmGZD745/ZutQatYWCw4da
         X55T59hroxOBaeVVlwzz+wOMpBl4mTm5TgCfUypuKFrvXXAOBel6OUaKRcmDysXHsV18
         ZR/Qi5Az3eDOdbwEqZ5c07BpBqrSLlyd8AESylb8L38X4vEyqB/4ReP6MUaF99NHL2cE
         PJJA==
X-Forwarded-Encrypted: i=1; AKwUvBwVj9fw9dwQHcWBNdG3ijXv/VFJOTy3uSz/fqBj+war2ESUN9IbP+EtnLonokPtJKIt4Ea6s2Xy8SAfXpA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdkUtISV6xS1gqJLvujUy6736SJYbmZVig8Ze7FKfRsigD4wE7
	BViP9FWQkZiGJProvYwAhJiyOON4H4nCOnvM9oiVstlc7cJjYeYZxjNw
X-Gm-Gg: AYBFou3Uu6d8+x3Ilg+9F5EqhxUdo4WIbJ8LjUj8wAiGr4DI97Vm1jhtbUl/uwL/ati
	U6lNJ8IcoFA5upG6KhqV1GIQ0AMH1w++G+SuBG3/wom9q3UJKzlIT3OWrQoKo3AjHX7riiFwgUM
	sR8DpyrReYeSQd7rKWhnQi6fO1ICYK/QmQYLGqZho9PNge+ygBRfL7HX6WfWqmmRxhk4bdmmkVO
	gG6QBGQHGByi/pEy7kYevWZlrMn6qkNSqfUgBQfMXoObSeMHeXabC9t++wIUYx/MCrGBxNk9LMJ
	tuGOxByQiEi2W2nOsstySw8Pq9Zvzn8ZI5VDmXqZgUAt9wg9UmjW+ciKcjoBW1jl57KHFXb3KJ1
	KsR49RmcUG7jXe6N39v9yl8Xqc12n6/GFVCUyoKbGkjvwZ98BwtG4zkKjDuqovaHfI9OKKIXXv5
	Y1xzqBCc5UB3x2P8F7Vdk+mH739Gc2nWBA1E3+rxkJXPr5qCDk1t2Ji0Zm/z9RhrIMrWDXNeNK4
	jBgcdIoNtQ4lXsiGZHLUT3J1qP/o82N2kM0tOFxcEsfnob/VHA=
X-Received: by 2002:a17:906:f586:b0:c29:6de8:d143 with SMTP id a640c23a62f3a-c31aa00dd05mr330212566b.19.1791579905479;
        Fri, 09 Oct 2026 14:05:05 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9765d1asm142141266b.8.2026.10.09.14.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:05:05 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4 4/8] alpha: invalidate the local context in flush_tlb_page()
Date: Fri,  9 Oct 2026 23:03:49 +0200
Message-ID: <20261009210449.971057-5-linmag7@gmail.com>
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

When the target mm is not the calling CPU's active_mm, flush_tlb_page()
does nothing locally, and smp_call_function() reaches only the other CPUs.
This CPU may still
hold translations for the mm and can later reuse the old ASN together with
them.

Add the missing else branch. flush_tlb_other() clears mm->context[cpu] so
a fresh ASN is taken at the next switch. Add this before changing the
current->active_mm test to current->mm: that change will also send lazy
callers here, so their local invalidate must already be in place.

The uniprocessor implementations of flush_tlb_mm() and
flush_icache_user_page() in asm/tlbflush.h and asm/cacheflush.h already
contain exactly this branch.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reviewed-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Message-ID: <20260923074903.862898-5-linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 1ad448105201..e4ba0aab8a66 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -697,6 +697,9 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 			preempt_enable();
 			return;
 		}
+	} else {
+		/* smp_call_function() does not call back into this CPU.  */
+		flush_tlb_other(mm);
 	}
 
 	data.vma = vma;
-- 
2.43.0

