Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1661A54705E
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642354; cv=none; b=djXZc1o8y8h3wtNwdbsOYN5u75hKUSviuCPOqkqiwloJMrhW5TCLNtfv3n7SrWIZyIMySSR4WNCNWUNeHxaBlb2uI6XOYSwkBxqGoO2obKIhAfvTux4muCxIob7vdvNkQwes/U3kRbPaAtcMq+Ox7JF8P17onnNaKoFPy+ORuzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642354; c=relaxed/simple;
	bh=BqrIIerMCSzPlCiKASkxxbCEjoy29np5YGXs3jbWfmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P4dyWUmQkBerRnMLmZ/X+GDpogceaBd//b3TN68EjQon23JauFCf5DBaSRAAy23ijjWnzh1QhKBrarou/hglaHhyee2jdM+2PAgkUiA88fiiVNv8JwlCENhYN1ygHkUQ2k0pZouVxMWQuM6Qv7PT9y5rGLGwrYYFih7cdEwD4Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SW4V3Bhx; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SW4V3Bhx"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso956524a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791642351; x=1792247151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7sU+GyiWKytsNfxYTotZ4BHP/F79d3LoL+yzE1mHYA=;
        b=SW4V3Bhxne+rf842isLI2jTeasmivGMwL4cGYxuuy3J5OsaQcR0LTefQeGpIZo+7LO
         DvNjxcjy509FqMYY2ja6lQB3u3SplmSpMR+gT7tPTCyEcrOYoxnD9HV87TuxYEkcwH7g
         OH1RXdy++DzlU/YS2DLsMulPzNflsi5ni2dtxedlhFXS0+9JUaBLzobbDmFCbnQ8UPwf
         Z6LgZ7+BAQX6Er4Ga/GS1zGtibWghgDriAiaxwvZvk1znJbFF/ZWuv3JgJlGT6lWZAvg
         IxORt3JJoYNVIlko+hCmwKM/SRpBhzpHpNXM9r6zPhLGdl1Ffupfs0iHkF8mOR6a50/h
         Tn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791642351; x=1792247151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z7sU+GyiWKytsNfxYTotZ4BHP/F79d3LoL+yzE1mHYA=;
        b=u+jO3Q21Bw5gZEdQ7OZyPL3YFa2ZEFZyrVKMEGXSCFreQU/g+i4PO0cT2CWyKtN+4b
         QBPRU0UA0R00SjEt/h0OKi+kbjV0BWDVzzvt5KaH0aJLEf0vX2YCJu2BfLzHSSmDftnw
         +IIt98uzhwRJIxNTsvct1QaWjBneu5UTSK8DieYMbIYgtgzU++GKZzIFFJQaGIFjPBPZ
         HczW12bRe6ry5X5+ZUIzth1FfMqbHlltJ6kqL4tVnzKW7uZEcoMjqVVrtuY6Q+uyOV3P
         F9b/YG34VtrfefqMLejc+Wn6XyJVPt1Ej99sQq7zwjldFVSOzk9pCQKy3SADwVz9FKro
         0xqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgJK7dS/uU5UH+odl9MYyBS484hkwDyXJXdaZvBgwNstly3js870Ef3d29I2gE2CaZibl9QahOZkFcKAA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK69uLxMhdK+nf7vEphriUfVE2Gso8ZJK7gol/Yhw3TdJRCsKSE
	p1fZupRUfOrzgdqQkQGTa0HWRXC+szHLAog66YmtO1ccb2D82z3p/bXd
X-Gm-Gg: AYBFou1hAk+1aaqN9QKZk1x5S3z4htkSLuiNRsp7vtCjp1d+vEAf9CJlatbmiG5wvXH
	qMfDtsNJO6oJ8cTrQ3D3xk9WTMOJqqe31yzrLWWszcoDqjlpE9E94/tKBCbi7aH6hqZxJgEsDcQ
	fF7WnAgItZb84m6e/NG1M1GmcBrtvG9hLhokdcVEmg2biww/VU7KJ/0hF1bSnzGAuHU/p5kd48L
	ORhLa8NQlZd40y52m5YJpEqdTDDqJF2ikvYkg0ylJihB+J1SAPRgKn1LnO1Oj8TaeLE4XCB3LOm
	H0pPU8MZrBMQM2VNH4GsasXmXsaSr2N32/mG1qrVFLzcLE0aOjF9AYLy1JxnqHackSEi+iXq+w9
	/9UQ9U03JfaaY2s3qz68qz7d/AGI7WS+MqMxVLmlagzfLqJmmMmOEUBmLivY/xFagCRLmt0yOWg
	096SquYtV4BoJ1vAuFrZHVrLjZEVwOOSMWPaAaBSfeTfizNHB8NhYFWPlTL7auh9I2JeJAt3mUP
	W3/uXOV3kyFyCpzzamTw9W7wCwY8Iotpt0idBqESaTwot+Bao97
X-Received: by 2002:a05:6402:a25a:20b0:6b1:a544:da83 with SMTP id 4fb4d7f45d1cf-6b1a544df95mr225535a12.22.1791642351187;
        Sat, 10 Oct 2026 07:25:51 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dfff40sm2635586a12.34.2026.10.10.07.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:25:49 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v5 4/8] alpha: invalidate the local context in flush_tlb_page()
Date: Sat, 10 Oct 2026 16:24:30 +0200
Message-ID: <20261010142533.974797-5-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010142533.974797-1-linmag7@gmail.com>
References: <20261010142533.974797-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the target mm is not the calling CPU's active_mm, flush_tlb_page()
does nothing locally, and smp_call_function() reaches only the other CPUs.
This CPU may still hold translations for the mm and can later reuse the
old ASN together with them.

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

