Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790913CF1E5
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791579908; cv=none; b=e+2Q4cjovrWh5UvzC6NfmB00xWrhgJTD2Wrz0LfvBg2aEhaaKDGROoAe9raDXdiHUGGJBJiIhkVyHWPgfB0Bqc08+7YHjKvKW5vz3oPywrfEC/vOzjUPLuz+w1cof+VMQgQbHEkGfVwUFlqp4iOn+9YDqKGBQVVducBKZyxlk3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791579908; c=relaxed/simple;
	bh=lv4U2JoYCAddpO2oEpUCrNtOq6iSFh+gZ2nPJ8zjVKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cdbaXWO6K9UrJFAbG8GOmG/YPrxuBr4cKDJaS8c9yR9JU6MN4pwAkpZWFkibnotYvmN7DifWYDd+jbiSBGRG7bI24VeIFf1R4y33m/XN5v7GNxxEMbiNRkGFQFZKsDUP35+TVptfkQ81j9b/wlTtZTn2sVBcbgFfwRB/bXipiRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGBOdr34; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGBOdr34"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2e5e801487so42210366b.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791579905; x=1792184705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FMJNXVDBr1Y/oZTvHICO1h8qIMsaNHo5+E377B7YCuQ=;
        b=YGBOdr34B3OKPh6yNO677V4lRh80sYTMS+vsChsfzcqAWGhkMT97jebZUMfxpYCyd+
         FOzZCCiOrI/Zo+9RL6uN9UsTxjaK/jI3/L8v7cCxGmtTVUkCSmp51FdmuF4yZRO5uXeM
         2MedQXNZNAv8wqu3hyNfspwS1ct7iLsppzIgINNOzr6kQo+n2EYBLgR1qkXjPu2DXA1A
         x2b3prf1loaNeRzZrsmtEihuE0XIda0HHJGazoeMIGyTdea6t5guyuK3rjGhxXNherSV
         xX0uEzx2McRt6gD1jwnvaY7EP2uAqB9RiJKs7uFv3HQ7ervR36njCEBdimtZglPxqhBp
         Kh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791579905; x=1792184705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FMJNXVDBr1Y/oZTvHICO1h8qIMsaNHo5+E377B7YCuQ=;
        b=hfofBDH0onD4/5a2zo8oeIIWv8Iwuc1EA87qqZQOXiRQJJz1O9XGef86ar67UazQ6N
         SzJGsdKpcnJFV4g4KWcFB6r5hp2pOuJKuOHqFjV0PSSrKtrqCvd/TFlK23ZeAYI3wL+Z
         chSRLZDPRqIaOyNTIK+wBBwdgJlK+LEbgeXadntV8j1CVMpB0N8KPHw6BI5+RzOV0meQ
         94XulSMKQq+a47SVsmjifT9AKHBsmUu1ZhFFJavGV185XhGs2X50uB2LVPWI/5WEMUBG
         2mss7HD2+hKfBPa5JzTe6c1WPAFpVtRq99tdLyMlQS0rjEVTd3e4a4ZkJPvjWvp8Z39G
         FKlw==
X-Forwarded-Encrypted: i=1; AKwUvByLXppBAdAq/OTsVloCx66RzzvAH6vf+uQ0diYp+LS2qqxX9gizTGCUchVoNQP2Pcm/oodo3VyhnNQSaGM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWR14OjdxVKht+u/8U2qyVfKyQEa4VbmjROmb9tGxt5LZ5oqvj
	cXvXyJSze15mb4Nm643c8qUEPLsipYzMx6Yy/TYQ47QSQxSYRcDh2clR
X-Gm-Gg: AYBFou2LLfs60CCkMClZiyustW8XrhJtlxBL1LeA1sqMk0jh5/dMoYV9TMbSawpNMMT
	vn9PIyo4qrOOKuz2zlD3epcCxle4mCDawG/mwTjlaoyvergdyyFU+ZdZVfnK15m0hImXmOqelMm
	Yqf7PjrDZw2eeH8Wh4kClbyXIljONqZXY7NPfryaOSO8Lnrn8NSzfHawQ48L4Gr7abCdaOvF1G6
	Lssqk2DoSzfeyTPpSbrJJCxQQof9IAl7l74xQQg9Edd3p4iCZQe3Xxqn+9/bixUdJiGGOGYPXav
	k+iD4kcLZ64OnHedlSs57m5XeDKDjKLEU/vPHkbE1XP2dbWZ9Ofxc/UxD2Tn70Xlqw5+m70FfOk
	H5lDbYvTlxjTfFi9TQcMFcWUdTaErraUvoZ3E7lstVWk84xpIT5lPqwgHkV/tqvgN8kNXZmm+3n
	kLmDX4U0OhhsG17I5VZd+D7DepVAj3CjcMdK4n+V7+6+4qLOD0+IICBDc672xMkbRGJW13Rn4xD
	jaVat+LfKjQrGnkrJFPlm8sn/zKAmZ+H3JNAioULw==
X-Received: by 2002:a17:907:724b:b0:c2e:1d6a:6b78 with SMTP id a640c23a62f3a-c31aa0e0cb8mr335909666b.47.1791579904459;
        Fri, 09 Oct 2026 14:05:04 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9765d1asm142141266b.8.2026.10.09.14.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:05:03 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4 3/8] alpha: only use a targeted tbi() when the target mm is really current
Date: Fri,  9 Oct 2026 23:03:48 +0200
Message-ID: <20261009210449.971057-4-linmag7@gmail.com>
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

ipi_flush_tlb_page() gates a targeted tbi() on current->active_mm.
tbi() acts on the address space context currently loaded on the CPU, so
it is only guaranteed to reach an mm's translations when a thread of
that mm is running there. current->active_mm is not sufficient: under
lazy TLB an idle or kernel task keeps an mm as its active_mm while a
different ASN is loaded, so the invalidate is issued against the wrong
context and the stale entry can survive. Nothing retires the old ASN
afterwards either, mm->context[cpu] still being valid, so the resuming
thread can reuse it.

Test current->mm instead and otherwise fall back to flush_tlb_other(),
which clears mm->context[cpu] and forces a fresh ASN at the next switch
whatever is loaded now.

For an mm borrowed through kthread_use_mm(), the prerequisite direct-switch
fix installs the context before the task can take a shootdown IPI. The
current->mm test therefore covers that case as well.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reviewed-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Message-ID: <20260923074903.862898-3-linmag7@gmail.com>
---
 arch/alpha/kernel/smp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index ed06367ece57..1ad448105201 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -669,7 +669,8 @@ ipi_flush_tlb_page(void *x)
 	struct flush_tlb_page_struct *data = x;
 	struct mm_struct * mm = data->mm;
 
-	if (mm == current->active_mm && !asn_locked())
+	/* A targeted tbi() needs a thread of MM to be current.  */
+	if (mm == current->mm && !asn_locked())
 		flush_tlb_current_page(mm, data->vma, data->addr);
 	else
 		flush_tlb_other(mm);
-- 
2.43.0

