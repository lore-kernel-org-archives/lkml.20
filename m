Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793046226;
	b=04CsRFbFKQTdDAUL6yOTB9Xcv9cOT9OOgv0n991SlJLxpa8MGUjEAlVYgQUlEH+Jw7fc
	 TFhXJfFeJ4tiWUFuCinGwDardTFLXVFI0l0sKWxW+m7OL52KpJuhPasaLLqo5c0OIRcff
	 NdiyQrIpCXFHI0W1G9EIDonl1E3znzgPCVHLbf+Wm9dMUTXNYhUVhOdOzwij0E2y8FGVG
	 XvvFmn94pr0DlTt7pNGaqMnjWNU1Pqhhg94Bc2VuBcbXm9P24auFuBxuvQrsL1Y8EBRff
	 U3a+h4mf7hvzN3PBIXXalOzADU/ZFmLQb3ek2oPtEmAnwVZO/1yugbLHMRQ92oMHhig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4SfCadshulzmWwMSEHX3O0JUS5+ZbgbXXvQmUot4Mpc=;
	b=PXheqhrB9b7/aPu+m1+U65EFqpXJwL4FsgRhMz3NU0LWfKT9E6yQ0VN86GVSIBXPti4f
	 qozjMoqBlHADl9Rph5lS22Nrvoj9BlX/8bN3q2LO6SsMCwiKIATFYI1CqlLSDK/9JPcm3
	 vvDUR3zLJfqrM/IdikG3iuoTvVmtAL846FcMmnUS4/Tgtd4F7V9nXdrZypBzBCMrShecW
	 PWXs3/fGgjENwrVohReKzS2WefYF+/FeJJlxd5SuOvvC0L+PCax/Rr2VbDRS1WIyEczWr
	 1mSjNQ+vSJb2zxkk7FZS5fJXFUYON1W/dMxnl5IYmlD1uGG30vzDhrQdi0/GF9mka9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gRs2vEYA;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F868606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F868606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gRs2vEYA
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a594d313a3so764763b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793046225; x=1793651025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4SfCadshulzmWwMSEHX3O0JUS5+ZbgbXXvQmUot4Mpc=;
        b=gRs2vEYADujusp6D/93lBU2g9PxuUESAk8hSeHrtxGDHf+0C7zYQ54MyB9nThyeifH
         tOehaUOjzVY6b++IlRYoz+mYwfzeHFduhgBr+egKsQhR+F8i6+1qmOFneSG6m71wH5kp
         EjqgZeoSNtQzwQKrq+e74X5w05HokVUCVd9BDMDa5ovBYOaAPhT/eAPrb5ml/XHtRKRX
         544xtpABX1uJ3qdLiLMQXpz2zAFvVg/uUmhk8IOWV7FR8FAHxxF/fj23LARvON0shW/E
         KIi6A/qtYvV0SWct517t+ahf0pZU3ru9dwvVjeRa0VSOKZQVsW2vscjcrRuZJkz7/IWE
         UQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046225; x=1793651025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4SfCadshulzmWwMSEHX3O0JUS5+ZbgbXXvQmUot4Mpc=;
        b=kzS/ooJj1vCjtCM3q4voS4Br47xM3qcfMSwSi8y3FUDBrAjzHC1ba5dDWJuiNQ0lmG
         BGOh2M0l1HAWlRjqEbKomQ+I6LB9Qrq0Umj1WjuVLE6yCR2NMQXw6xShABtydsQoO7uN
         I4wgrDMqUkUQT26MUmenKbHH3zg5Xnkdn5T3I0tMqTyC4ZFFdE/fEejFlsugFdb0+SAR
         D3j0m/YK5u/8gd03BV9c3BoPhv8HNWwKau1JhsvxfMqu98/Cc7RA7lvLAs90jmL1lpDx
         MstxKa53vTg3+m92NW3MTD6XtWXBL/dNTAStVIGyQUcXVu/mtKX/i0TCXqkXj1Yeuy+Y
         WIvg==
X-Forwarded-Encrypted: i=1; AKwUvBz4MK/JlWbdnryjDF3TJx02H47XFQLw01EVvaWPiVdnFjoX8zA8LckrNXpUc3IXkjwMAaWcWqi8tPGrhw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkdwYLPF9JEq1eMPNdVZ8XHsS83vHo9ksoGGxm4tHGqjBgCHed
	MZkSEQLDqBaKA8BMIgMIoGhHkHxGNENz3b/ICHIDkLmDKuKhtHXV9T18
X-Gm-Gg: AYBFou0FGbAyFGPFSXbQMaPbfOMLuv/KpfBYUY7ZJEs27ZylEv1tZFkh/rNYsAtCY2K
	1aZsMaAVIrh+H49kMKa4WDzWU9/qMUOQk7+PQxiW33xy8lYEZFu/4zTyDeTwlQO71O56Y3Prndq
	eUQKuqWggnU8WOmELSCnRQn8Uo9FB11SnZDXLAU+8moCFBQ2rZheutMsltH3RrXFRjDsX4Em6qf
	EbMXqBURUVBPX+ol1PfuSIQrXG3+MKSvW6f9pShcLxIsZWIQLRyhK40AJPEn22CDSBdOhAO05Xf
	RrxllGM+5ewi4hRhBKPC4AJk467uq4UnHF81ujrMNG/t+H6jWKSRSKy5TjeWMv2qUfdAfLu4UEf
	D/fMYaKC9em4Yq0vcHKaFNmZn+om8caNb3bMox4Q3h/KRuP5QXpcSzu1PrZRxnN4BJw674PqFCk
	g4rgY4/IJYBWeE+oemlqv11M3oMxkzsF2ZE7P2nBd2COYW33qtjmY61gSFityL1o/2nM9hjI2YQ
	jbqUc3coUdyDHiqku8MPAAyy5KKhebDbTVMr83amWlDIhKvUXGzSyBobr5t3w51lk+oKssLgW50
	Gz5gpjZT4YuF89sd4h/AufP6UDZ4SThpglmWdJMJJwsID/IPrww7U9z04y6NApi9u0RfuiJunX3
	/t4qJwJg0KG8csHfVLng/9a0WBvug4DlQvPNQq483BLWOMJ79oGlrpjyBFsvM47kyH3lcER1EpJ
	xxqFJGJqpu56BJqt0cYxsw2rSDScxN4nTV/FtgI++S
X-Received: by 2002:a05:6a00:4b0b:b0:880:ee58:2768 with SMTP id d2e1a72fcca58-8a367a39859mr6737619b3a.56.1793046225106;
        Mon, 26 Oct 2026 13:23:45 -0700 (PDT)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bb29546sm1627846b3a.33.2026.10.26.13.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:23:43 -0700 (PDT)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: akpm@linux-foundation.org,
	hannes@cmpxchg.org
Cc: david@kernel.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	ljs@kernel.org,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	yuzhao@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	apais@microsoft.com,
	rlmenge@gmail.com,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
	Hardik Garg <hargar@linux.microsoft.com>
Subject: [PATCH v2 1/2] mm: multi-gen LRU: use mem_cgroup_lruvec() in get_lruvec()
Date: Mon, 26 Oct 2026 20:23:12 +0000
Message-ID: <20261026202313.63122-2-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026202313.63122-1-sidchintamaneni@gmail.com>
References: <20261026202313.63122-1-sidchintamaneni@gmail.com>
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

Andrew Morton noted that get_lruvec() has the same pattern as
lru_gen_shrink_node(): when memcg is disabled on the command line
(cgroup_disable=memory), it returns &pgdat->__lruvec directly instead of
going through mem_cgroup_lruvec(), which initializes lruvec->pgdat.

In practice all callers of get_lruvec() run after kswapd_init() has
already initialized pgdat->__lruvec.pgdat on every N_MEMORY node, so
this is not a runtime bug. Have get_lruvec() delegate to
mem_cgroup_lruvec() directly.

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Signed-off-by: Hardik Garg <hargar@linux.microsoft.com>
---
 mm/vmscan.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 0c57e4f1eb15..99e9f07fa2e1 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2745,20 +2745,9 @@ static struct lruvec *get_lruvec(struct mem_cgroup *memcg, int nid)
 {
 	struct pglist_data *pgdat = NODE_DATA(nid);
 
-#ifdef CONFIG_MEMCG
-	if (memcg) {
-		struct lruvec *lruvec = &memcg->nodeinfo[nid]->lruvec;
-
-		/* see the comment in mem_cgroup_lruvec() */
-		if (!lruvec->pgdat)
-			lruvec->pgdat = pgdat;
-
-		return lruvec;
-	}
-#endif
-	VM_WARN_ON_ONCE(!mem_cgroup_disabled());
+	VM_WARN_ON_ONCE(!memcg && !mem_cgroup_disabled());
 
-	return &pgdat->__lruvec;
+	return mem_cgroup_lruvec(memcg, pgdat);
 }
 
 static int get_swappiness(struct lruvec *lruvec, struct scan_control *sc)
-- 
2.45.4

