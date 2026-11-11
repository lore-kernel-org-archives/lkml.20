Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379638;
	b=RdobpII4h3sTIH5VxGkZ6B7kVAHltiMAMkwcUL1PCLOt/3+Y55o4clQhPTkLA6FE8PH3
	 Q6sZ0mlu+rUbIi07j9T0u95WFg+dEz1F5svOwOVbWMK1qwwKAFYi/k+piugLq1A6goCRZ
	 72ydMvw71pM/vefDV/R0EupBsCkulLq1lcvKEpFLzacl7GAy0XtGYXFGx7oGXYZP7jST8
	 C0cWdBSwILWjN7IyGDsUDhKazhnVCL7E/8rrI6bRWHQAX/08K1Th07hFW0gVuQOz7Ax4B
	 Kc7U1rEAKh3N6Y83omxrgHw8bQxEmatHMr/WSFqfEyXRwu8B2aN49b+U4O2YXLVyIqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LoLBKM4Sjqa25bXrwKOIU9y0T4xg6/+5J3Td4BlyGMY=;
	b=BaIaCKDnGdDVKZbMSbeNy4mOxDNeK0VuAFjS/qJD6HKS4CMw5gtbmw5qDHLY3yVGv1N0
	 d9J+RW0j1+sI0jDPPzPv8yfRgHQCS9JNKAEYclUimfRv9NMbHI3Gomr1JcpQNMppjuUEO
	 5R+CJaAlxBZbE/3eg6ktFgNGUDbezGK+302bM6G96TFIX3reaFFj7ekPH/kjypNO4aeJ3
	 IASsf/dYu+nah4hmCmUlTRi9OtqrJ3KEikjFU9AVp93PrJD/trsjjyW4oEg9ZptunokmH
	 Azi2TJC4vdyIH9nhESQlCyCAOR6cJ/xHTK4Tq0ReRCDrbmywnM7DicaBDahcYyVKTRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RMs0yD1B;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D92606A336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69D92606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RMs0yD1B
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so1610120a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794379638; x=1794984438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LoLBKM4Sjqa25bXrwKOIU9y0T4xg6/+5J3Td4BlyGMY=;
        b=RMs0yD1BAbRNlQCyHoYg25Frt8KVLLLZ/hDDP7KKI5L/b343Dqv4AhSj+L4oxUViu8
         xlH9SuM53RG019S6bVnt3EARx7kILuexpZh0hQSK3NAh4YieTCsdROG3uvFp28tNfF4k
         Bl5pX10oDkS50DdclVyevwlsfRxSB+zZr1reQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794379638; x=1794984438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LoLBKM4Sjqa25bXrwKOIU9y0T4xg6/+5J3Td4BlyGMY=;
        b=oyOw3qfL28406FU+N+YRJ7D4dVqM/KG+6zyaCVE49z1m76Gt9DOg1ZXLFbZ1aJNyrF
         6tPtTq4uc1UviDbrnzLBmrVIuU3uo9kCZPxndZh1kbmRXdIxYYKZ2DLcqqtdeRgWr51v
         +yiWc62ZoECDzZE7tptQJKpOSufFYoS17q+RSinZlFdTw5GjOVcqfvvDoOle2SX7w/39
         eklY1/2aY21iclAJM/5jh6cKs1yn0ab5+YujASuphir2d+t7I1W8RZgRNE1YBof0YY/v
         5bEGQXJ1ao6qC4M0NmvDqd0+pGAZtrsf2JHKhMLEKlum04oLhkr+GzicAqGgGzydAHnM
         +HGg==
X-Forwarded-Encrypted: i=1; AL+hErHn1LH4bMYTL+YqXnntOHtlq3yEAGoI8wdWnm+YQOy1jbR6e2x1BCdy37cWr4b8Bj3hdySdjZL+soEeg0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9G9iFfj4QyfU7YR7jSecAB7g8doq5/6UAHs2UBXicpNqDWVE5r
	Yi7J1SLqA3orFx4hnU3cDYtMyYM/oUef0JMJcTESIGFYfF92MJiuHwCPAkr4BXNGBw==
X-Gm-Gg: AYBFou0WEgqW+CTiusmadfNq2CZSRItaXre+/DlJ2mReU4gCM/C33ksyzMrKjQWUZqB
	5vfKQefhbD/AdmqaERm2iwANgkxkVvQJrPHpiafVK9ObN3TMnjkOdera1svyMvLKbVTssbCpBsY
	jFJe5f/fcxz8d1yg/vIGN1Na8YdM9jv33SEHGXncXTdPtAWiAWOaalTu+pXwo0LBsd/15POZj12
	4wT+UqOK+MCqq/EmYC7NqawzH7LGk5H3nf+iOvaRyaPaH5d/wP3/lsy42Dpc5sBLOCNJTkdxkiq
	yB7q7LatuP/koU6bA/vLYBFNOwiZAh0H6ne4DfHMUspyMYp/lNBb2sbxQUWqVLA+yaxjn+EMdKi
	t5kUp7xSfF0Qx0qWX5bpJEwAIcr0efL4KdMulBnEetqNEkrhhVYH66Gxvurm+gs46FwrwoUIbsj
	/l5Rj8mtEzN8q0maOA2b3vDcUkXoM9+cuIPQItURrRrFvc28iwswFMIeO4B6v/dCEmwpqHJt0jf
	g0heW+O4Dmlxia+yOSIkBMJdI5D1c4CunlpsxadPEgiKbepv8mFdz7W4871cZBhoNcbtZDB0KSP
	Vmmci/SffEty43v6sEWfWZ9mgptTG4jDm2FTpRMdqL5xqluLc7uAeb4sZooGEvsYd/kIH5n9ITW
	ZasFVIxkocUUwnsGOSn9TcwveuuHytXD2WVhJWpk=
X-Received: by 2002:a17:90b:3c06:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b182fd6335mr947201a91.43.1794379637677;
        Tue, 10 Nov 2026 22:47:17 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:ad6a:b446:df00:78dc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db85a9bsm3268666a91.14.2026.11.10.22.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:47:17 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 01/11] zram: drop stale comment in write_incompressible_page()
Date: Wed, 11 Nov 2026 15:46:24 +0900
Message-ID: <20261111064707.2568433-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
In-Reply-To: <20261111064707.2568433-1-senozhatsky@chromium.org>
References: <20261111064707.2568433-1-senozhatsky@chromium.org>
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

zram doesn't do fast/slow-path handle allocation anymore, so
the comment in write_incompressible_page() is stale.  Drop it.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 632045b65bdb..380615b73446 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -2271,11 +2271,6 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
 	unsigned long handle;
 	void *src;
 
-	/*
-	 * This function is called from preemptible context so we don't need
-	 * to do optimistic and fallback to pessimistic handle allocation,
-	 * like we do for compressible pages.
-	 */
 	handle = zs_malloc(zram->mem_pool, PAGE_SIZE,
 			   GFP_NOIO | __GFP_NOWARN |
 			   __GFP_HIGHMEM | __GFP_MOVABLE, page_to_nid(page));
-- 
2.56.0.542.g3ef89b7020-goog

