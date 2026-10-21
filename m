Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792560196;
	b=IxLkdnT2tcZ+Sug1n608jh/9coIjtZc5QJAD0zG/zEXpFdQx/Z1wUkL/osSyhAb5QULb
	 8zpSdLINKDS+DKgdfGkVusCSQzJDNd5masep25pLP2LwMPEONm3krnk64ex1+1Ft33nhK
	 IJoySLwAMd5Qd2aOdbcq9SYt1MFRnf4s6SEZQIpTDehk3MFqZ3kNZNxVDfiJxwtJwID21
	 Mv1S01nKLBv2g6yJoKX/7f2pXtikibgyvpQJiJsHIx+PBPz7TYbJv5GGkqhpxXKMks3qh
	 +FnRTYl0nIeSqWjGMh3CR6ws55EQpL/JmoWj2Fz8V7y5s2TSkPuc/uo2URbkSCDp8cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792560196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1Q1/k6vzq7T3yTDQGCOhc2IrI0vlleD3GfRsPpGNPho=;
	b=jt7iBcSxe20UmZWqTzlh/Zvx277V3yTRQGyF6KM+ET8ZCwDV5WwaM8bW/Yt6rN9QYlqh
	 z4pZZ+pwhoqIhIRLsnpVr5gvtbXpZg1cesV+tLm/zd/1EW3ROd/dRUTE5/V/TcROWdZnf
	 3F88sHVG9szXTGYNJywF8W43UZTuqoKEaGNAvBl61D7BJh2MyKqtHWdGnxkmmlVFn0BRD
	 aNTY3ScPKHQgwChzL0YjwANEH2ktk68YElRVjaQR+xCnNsCTDfI7Z6DCbi/nhJJtW3E8Y
	 yxw4Pl+C75v2BymR8jo3Q+ETv9zaSC/4oNtrtmfX/3CDA4pI+wglJqgvHRi6kuW6MeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J4tclpqr;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDC5606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BDC5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J4tclpqr
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd67cc518a6so177446a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792560195; x=1793164995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Q1/k6vzq7T3yTDQGCOhc2IrI0vlleD3GfRsPpGNPho=;
        b=J4tclpqr0xgFbanThYLTYl1Z5NTO9D4NTSoX454ozWEh/pWS8g/b4nohrXAMmYKmU7
         P5tTCbWuwZm2i9F4R87yOZF/PFzjWupS/SAX9fiQyPsxAQk5wbZNiaRAQ+vRauQAorot
         pPc/1GtKP53XIrvL9uLOKkCkDjpZVpznnjnW/ZpGyQyCl9zbD5oReuAy+n2O8W3KPltE
         9Ay/ZyDD3X6TljoGDoPQCwZLdywpRL2sxLcFPPfHzDA7ih/Dbz6bfu5to+hDbKWRvR04
         uOQ8VFpWsQSQaNElqmtXKKowulp4KTrWk2nTL1Rv8BdnuUHSHwO/NbYRQCbdptimUW2q
         gpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792560195; x=1793164995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Q1/k6vzq7T3yTDQGCOhc2IrI0vlleD3GfRsPpGNPho=;
        b=nb7parhMqxDaP7Me+6qfrjTpQv/aVhNMEqi9Ch4DvG7bryiAbN3c3yj9gmKlG1whRh
         ZokhVScwCFrXfoMyY/FgtDJE8QGhOgb9nUzf69N++HhBgRQD6XvqJ94QcgA6jkz2wnWQ
         OVGoEpz1OSdElmLLQtqOQ+bzryKfn4IroGL2mE0SEXnjFe7xVev6ka373sXu/5OLFedR
         F4zFPzCbrJYYYXHc/LG0tMPxxPd6tf6j/901QAq4opIn85XIMNrDYys8TeVZGaPBj0Ou
         sFndbPmGwbdQtuwHkqgvncLHnwKmpZJ/OPPNaxgaMWUHE3ovVvvHdQCoLbpfIb3nrogT
         +asg==
X-Forwarded-Encrypted: i=1; AKwUvByYt5H5R/mu91Cbzv8OcErKFEPVMnWny5es54R+9vMKSrJ/P8FTYpdjXzthGKVGgiuYC8/CMmzsRouMTwA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkPEf22tSYKNL+uoTliy981kwH+qvXOi7bM7Q59XjcQw0vibRZ
	47Atu+nYkoHiC8SjqhsIPbjmj3nemX6Nu3dqS4cyvBsCHzQcxO1klOWh
X-Gm-Gg: AYBFou3ugg5mYq6wybcleGEnwEwKlUaxu+fYlE0ck74IDiUkPggOLTy/Pzj4wMbmBaF
	+8guIOUWxgXpBEk1Q5bvyjflWzr0D4MwRXOKjVWlnFrLWTVuAK9W6b5TmVvbiSF4teQ32VU035b
	8n+oNFJXFvP7DGg0xgAAgJ/pi2Mj6qDTRUlM7+C1+UIcyCLCJL0SVd6p0Bi3ITc31yqtwozYUU1
	REn/z3Znw1er1ZKgrLHQYJK1vuOKSSTt1ZLFDiJtOW10RXQpyTkQ98aNk350hrk7qTB81jJkKwh
	6ajozM5WXAUxkab/HOK845sN+scIw8Q3tw/wcw7KErJKxpkpLYbwf8LmW8o1jjT7Qu9468kUcBR
	Skdvv8B4clN6rJsHINDdDRbbut6ZSmcwwhMZ09Rx424b49zez4nnsc1QTL0nt1e28E6XInm8dns
	M6dBUWE8effa1f+oLI5xe9qfZahUgydzloxZZdagBL3YVT/0Q+7NXnjHDGLuyX5Wi4pXID4DGt9
	vU4c4GUY00PySjR2C5FWUdDG4jH2g92wjxmObTf8Tunb0vc9rLUZC4euTBXdursZeS3dSZlUgyN
X-Received: by 2002:a17:90a:d883:b0:3ac:3588:b548 with SMTP id 98e67ed59e1d1-3ad86f1bd4emr839694a91.13.1792560195352;
        Tue, 20 Oct 2026 22:23:15 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80912f26sm2419135a91.1.2026.10.20.22.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 22:23:15 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Wang Haoran <haoranwangsec@gmail.com>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] scsi: ufs: Fix wild pointer dereference in ufshcd_clkscale_enable_store()
Date: Wed, 21 Oct 2026 13:20:42 +0800
Message-Id: <20261021052042.3441449-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

ufshcd_clkscale_enable_store() calls
list_first_entry(&hba->clk_list_head, ...) and immediately dereferences
the result with clki->max_freq, without checking whether the clock list
is empty. list_first_entry() does not return NULL on an empty list: it
returns container_of() applied to the list head, i.e. a non-NULL wild
pointer pointing at &hba->clk_list_head itself, so the ->max_freq read
lands on adjacent fields of struct ufs_hba and yields a garbage value /
out-of-bounds access. The clock list can legitimately be empty on this
path: it starts out empty (INIT_LIST_HEAD() in ufshcd_alloc_host()) and
ufshcd_parse_clock_info() returns success leaving it empty when the
device tree has no clock-names property, while UFSHCD_CAP_CLK_SCALING is
a software capability bit set independently by vendor/platform code, so
a "cap set but no clocks" configuration is possible. In that state
ufshcd_devfreq_init() explicitly returns success for an empty list and
ufshcd_async_scan() still creates the clkscale_enable sysfs attribute
with is_enabled = true, so a simple "echo 0 > .../clkscale_enable"
reaches the unguarded list_first_entry() and dereferences the wild
pointer. Notably, all five sibling functions in this file that access
clk_list_head (ufshcd_print_clk_freqs(), ufshcd_setup_clocks(),
ufshcd_init_clocks(), ufshcd_devfreq_init(), ufshcd_devfreq_scale())
guard with list_empty() first - only this one was missed, which suggests
an oversight rather than a deliberate design. This potential issue was
found during a code audit.

Fix this by adding a list_empty() guard before the list_first_entry()
call, returning -EINVAL via the existing out_rel error path when the
clock list is empty, exactly matching how the sibling functions handle
the same condition. Behaviour with a non-empty clock list is unchanged.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/ufs/core/ufshcd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index bc33da89a..ed3c1bd9d 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1840,6 +1840,11 @@ static ssize_t ufshcd_clkscale_enable_store(struct device *dev,
 		goto out_rel;
 	}
 
+	if (list_empty(&hba->clk_list_head)) {
+		err = -EINVAL;
+		goto out_rel;
+	}
+
 	clki = list_first_entry(&hba->clk_list_head, struct ufs_clk_info, list);
 	freq = clki->max_freq;
 
-- 
2.30.2

