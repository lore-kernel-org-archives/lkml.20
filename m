Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591127;
	b=ew4Jmu7AJ9HZVjJnnuzX+fmOT18ZvV5RXvQTjrsfyhE7n6cNx80VyHbyhTKOZLRcqAXN
	 XyZfZYxMOV4mLpGeiRisxHMarWSA2NqdG9k+G37PVtxQhXQ2IYCcC7xG7dq/GY6LnwMcA
	 RpkQD+3yQ1RstaZltT4mZjDcMzAflaoRCwI7KKl2q6Uwx5rvWFfjIwAUohDLxZEFd8Wih
	 hFEevn09/B9FyVtBm00H7+cgVkn4Ejh56xRFyOgOOx+Knri9c6AmBBQaHAE5C0GWAI+Dm
	 2WHQdAlCo4mB6ZefObG/iBNRBo6SLqWySO6of2YSxlv8mVZGlLIXmmiSZGxWsLHNlyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4zg/LYuc5EVJgXpf2aLA4/NF2gq/+rC0L8/4lGLzGqE=;
	b=TmgjSMGm5dVV0Ao56zgKjiuz4bxbvTcT9j3ihNEkGiF6mebGuxgKmts6PMjEw1RMb3+5
	 JHVzSolL6TxLrFTyh0yKVAEX1ZzqWLdI+Emk6dG5nXeofqrKdXInKWMD/VYC0x86HQoYj
	 HhL6dBuCAXaGj6AOsZat4R6vsVC7pa2zC0bAA4fuXXUtKEsi+mX0b8uBu3fo0R/FDt7Za
	 L985Grf9xF8VFC3PlAoDmhHDpiCiDb/DjjAwJAs3RtNFEJNJXhfIGhQJR1XW7srrwbTgz
	 pDW4wvjurdy3FqTXYX6dp3bKLI28KFp4aJ93Bqau5c46XNBVNlu5Su+ucgWcvaBaYOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NBvJApti;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D98C606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D98C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NBvJApti
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac6971aaebso94234a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792591126; x=1793195926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zg/LYuc5EVJgXpf2aLA4/NF2gq/+rC0L8/4lGLzGqE=;
        b=NBvJAptiWLVWyTnnDIdNkW7PRUv0hDRVi2HNyBXHSlHsNGSpubjArczgoe0F+uKrMf
         E+TJ8OztoOv9h/IJm4b/4EAZqNxBOBnIF1mGWTYmCQ3MQspieCzuaqEzKawhWldsa4zW
         sh4CjX9QwoDkE94aoj52vZjOOsw4bDwxE1LfzJ1IeB30CJ5J31mexy8lFtzvGsQzIyNW
         Tp2G9ygrE9dqZ9qaQKkLvuUwIkf+CAA55ssWS7p8jbdsSz/ttTzB6I8W5sG3IZcrcUxi
         I2LSW/P7P58yNoQxLATR0eC9kIUd2e/hMXwI+2/TRGKFMPDBeCwMH4BJ9Qm8dvri68Z3
         7ZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591126; x=1793195926;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4zg/LYuc5EVJgXpf2aLA4/NF2gq/+rC0L8/4lGLzGqE=;
        b=1heCpFa9WCQsBiAoRrJCZm4dRf8pNWxAr9qJK2eH+9VAt3bgStZHAiDlOoWMlq/feM
         yjgRvksJGE/BF85+WOY8yFAAMW/ZbyTFe94/FOLMOhDTnq6FOuVPq1Dm4iqd02QMt33c
         SCNUA+f3MKPmRKTH/kNWjLFuxv/htzEwlh2W+cFVFf5hXKvZV+DNV6AVLh1ahwZjIhyH
         hrBcz1it4fvtYgI5rm3KjDH8msziQJ2m8sb3nGbEi35xQJLLVSMbYJdQnjyQoo0+LUmH
         ZHBwUcuCcHWFIbpKEBPHfKAqx3g066mNP4iT7gF/J7eNgbLCwZfGdHdYBybljGfhdES+
         hUNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbfUfWKA+OwwD8zrY3wJMsnCbZVfZdvIgY60jDuKU8veERgAKv1abBvNHBrkpf5mtHKIIGsSHobrCLBUA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJ5k/r48ooWy11epjOH+EVMz+WOnkpflZBcyDcHthKSBgRBmZ1
	mnsYLnpesNlrg87mYrJu/zkZChpymbncfxRI1w+Oa3zx3Xz8N/jJzgNAyYLIL4RkQEQ=
X-Gm-Gg: AYBFou0V1pIQSbL6VTGd5NKMgMhEhOSmJnkSqEt497A/Poa26KpLDSW0GGjSjGllK8e
	GZXsX5Y25hvVVknbqxZAmOJJvnUGhzdsmfOs2nnmmcFrRrPP+A6eCRe1TJaRLTm+34elZ8tOV8D
	NZOCCcrCL0QMoO9z4qy91uArF3P1Tw4bRyMGnEwso00gakTiONggGOtOEDVIUXoa3FxaEXIHmtE
	PecHOZflyzaGpVMMKXVQzvpPA3UFC+r1nQ4AkiNWLFwL/owdmfRgF9rXgVjH0bzRGb3Y9g6Ma6j
	GLuPBdG6ngR92MXVB8qeYeC3ZyxTR6C7wsQmwS5VHs/1BOA0Es9kbQpR2zmKzTK/XUZaVqudEe7
	fbX/lYNhESwEi7NtKact/JwpZKG47Jb80Bh9ZfmX9X7LOgFYBWxIZjJx5Rb1GOPXlMzTCjjdyte
	my3IQoX7059Hbf3DsnI+ITFPNgdLlZjcI5LJTcTtemfuPPeZ413nAdlpS1uA2QCmGR3FMrsZTC9
	GRIlk2X3e9JQ1fpTGI5Sy/AK0f/d0zPkLa5ql3JTo9Kn9FPQmbO7kKmx8aNz072O2Ox8NuJQ1JM
	r4bZlQ0=
X-Received: by 2002:a17:90b:5249:b0:3ac:e6a:1af5 with SMTP id 98e67ed59e1d1-3ad86de0976mr3286305a91.2.1792591126388;
        Wed, 21 Oct 2026 06:58:46 -0700 (PDT)
Received: from [192.168.31.234] ([183.193.19.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f38df2sm2209811a91.2.2026.10.21.06.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:58:45 -0700 (PDT)
From: Anfernee Cao <anferneemelokc5@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] pmdomain: core: clear states after freeing them
Date: Wed, 21 Oct 2026 21:58:39 +0800
Message-ID: <179259111932.19580.13027750156272888992@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

genpd_free_data() frees the genpd power states through the ->free_states()
callback, but leaves genpd->states and genpd->state_count pointing at the
freed memory.

Providers that allocate the states themselves hand them over to genpd by
setting ->free_states().  When they fail after genpd has taken over, they
still run their own free helper, as psci_pd_init() and the RISC-V SBI idle
driver do:

    remove_pd:
            pm_genpd_remove(pd);  /* frees states via ->free_states() */
    ...
            dt_idle_pd_free(pd);  /* frees them again */

The second call dereferences the freed states array and frees it again,
causing a use-after-free and a double free.

Clear genpd->states and genpd->state_count once the states have been
freed, so that a later free helper becomes a no-op.

This issue was found by manual code inspection.

Fixes: 9d976d6721df ("cpuidle: Factor-out power domain related code from PSCI domain driver")
Cc: stable@vger.kernel.org # v5.18+
Signed-off-by: Anfernee Cao <anferneemelokc5@gmail.com>
---
 drivers/pmdomain/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 052ec478dfcc..12db69f53aee 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2353,8 +2353,11 @@ static void genpd_free_data(struct generic_pm_domain *genpd)
 		ida_free(&genpd_ida, genpd->device_id);
 	if (genpd_is_cpu_domain(genpd))
 		free_cpumask_var(genpd->cpus);
-	if (genpd->free_states)
+	if (genpd->free_states) {
 		genpd->free_states(genpd->states, genpd->state_count);
+		genpd->states = NULL;
+		genpd->state_count = 0;
+	}
 	kfree(genpd->gd);
 }
 
-- 
2.54.0.windows.1

