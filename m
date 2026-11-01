Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793499236;
	b=tTnlvUk8qqm6IrISwErWrIMwu7lYfADNHjrx/eaTmD2Fc/6hXG3rzIvN8PC7kn5nzIg+
	 /NhqRQRWnqBGMRsOGZghDDGW99Hj2w1PVidpnJoaasOZznPKI927SWHmYyQGAMrlfmC1V
	 Xr+YeYGNF/zYIUol6medIE7qsrQH4+flPSIfXqPPZR8YyWckMdQOpaauqyl30JWHOB/gY
	 doJ+MXek98GN5X8/Seh0hcZcevpFcNuX+BX2vMapxmpIRq54az3CZSQSBQDTLjS2BZU+o
	 eg+s4GKVm47nZKoyILlP+E6AiDcC8PXVrgRfU0//2aQ4hdASGR8yhEPgKUmHzjR0D8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793499236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Eix5k5b+jwvTTGRDCXBmAoEN+puq/mJ3KZwbyS9PKSk=;
	b=hNDJVTdrS0ngRXdXaHY/x5TisuU43CnyE0VCF/S7+aNl4HwEJukWVskIH2HYKHOQFf8G
	 h0B2pnAYWjK3e8+8iamUuTNV7irKHMbMhM6b+uKW268Ot5lrzb8E5mPJZOiKoIgV/wiLe
	 uF16Sq5z5b73iDHfAAVglXp9cyfkMpVwHwqvgsh4MhrWwIzJVrH2+mvB06Rg8nQxSjmNl
	 OCpaWk4+eWZAigo+5YidCwfdORInouqYqnY/Ktb8w/bsIDr1q4fWnfH4FEBKtoFeD9c5U
	 vVp9wXSHuspm+0XKRUjq9xASJjDjgT1P8QEwaBES6bHDQw8NcWoqeIr1zYvHJ0ZSFCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TpVI1F15;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACA6606A329
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 02:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BACA6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TpVI1F15
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93f1ca4132bso181922185a.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793499235; x=1794104035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eix5k5b+jwvTTGRDCXBmAoEN+puq/mJ3KZwbyS9PKSk=;
        b=TpVI1F15EqWq+9Dt7LnuohChw9c1xQWLhpz+mP0apOhCRXWYe2F1ZJ1JkwKCTkdS4a
         C6LjtMChI0Gg5j5QbVZ1rteVHi/71GkW5i5xIE/y65dDvDtea1kq0uFea+ZbEik4iL43
         wKlIkGAdaWTjJhEDGdcKDK3DdjFn8W8126Si5zWOgrQojds8AtCC4e3a0xtnQXohbSlZ
         +WRlCX4awxDeV4qV8hRB6+BdbCjWINKo43CmjvBIxq/rLp/MoAxJaZKeGzzwPbpZGwSO
         xOP9eM2PHPHHeAt8D1yunZzFxvJqhnyKFt3kXmJKMwwHS37kopOVP/Z3BzWWHfCpRRST
         aqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793499235; x=1794104035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Eix5k5b+jwvTTGRDCXBmAoEN+puq/mJ3KZwbyS9PKSk=;
        b=MOzzknUZhTjCWyjHbyx41BnPS82MpkEyeZ+zyUYVfr43ApBpJsaoe1Ce93wp3pj28q
         RGe/j1t01HCIAdO3kY4KkwgeJpu3Yhzvqz/DzxA3E08Y4fdmkm8T7WdeeX9eD34DxsWX
         jfsdMNs0LuirDCzKGntkwf6qxSIsVzXVq4byrO1k0vOazygX+AFC6OoNU4FzpborJKIJ
         AI0GuV87jQ3/XLlWEDa7fXXiS7B4Wec9VyaKqNKBsMvnt4T+MX1Y8Vi8H7knUxCDxk51
         wvwASHv4G8p1200vndr+sK7E8TvEBrVMCi7jPdvNDksm8bBkHhJpbrGFcneoAKEorDcS
         mkHg==
X-Forwarded-Encrypted: i=1; AKwUvBy+6jlcmxJZLF5rHgvXeAQZog3W1jCBx6tHsPwPDPsJPxPTq+Af2S3Wal6acNPxMaQxFz7orFRCaHXptyE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYMgGR5BIy6s+chpksXr5IAymOKngTNi+lBQFJUM94tHt9WNPA
	l3Z/NpbSLQFT1Yvk+2ChrLR1LAlWRklQ81dAA11SKG+GmHQquAZFnW/d+gFKkaAk9qk=
X-Gm-Gg: AYBFou2AN7OsJhe+ZiCzQ4B8U7nogUrQvtsFlhr+WeVsezHsljeG8i3u4svbqmeEa0q
	j0nAt/mhBMdQcsZclb18OEG73eaIqkkHobCsjVJseYbnQVJKpOkE0HDbibHehea1ct8uazdy7HC
	BFrBAkl9a4KQ7YEkljlj2f+Xanf+2nAl9XGEMSqEv6K0Trh96AwfMSHMRh5oQ5tQNLumkyt3GLP
	nsxx8OIHCOKuERRvWo9V555+OlEbsjM09/ioSN34zKcuhMxoDWeyhyduoZL0o/tRAuN76b2OD73
	cnC8iep/JWj3DVqCG0E5TE8tLGnaH6G5F0sVFD70BEMCLkHc9YVm/By5R9dkvsHM5TrKj/YM8tZ
	AkOpGOEsWWgWMxKp9VgAsffdtK/Te5X8hTbUxwgBi1Y7N40xeuRQS/nfK7cOFdzGQOvQlWd5IyU
	NaUGJlavLhNZZjYla+VHrV4t/g/QZ6Bhbu9BKnM8UIS+980X8c+CG4MVTKTxP4hJwVpSDIrySuX
	9+b5bS2Q7Q0hK3G3ujzOfAkBzaPeZZlUJe6kTS+7IkdMNHtTcP6TP970/AJyXKVS/PpERwB+Rbz
	a3P06fm9DiVj03VJi4Do/irGOdD9cPmOYBxSYm/jlC0K3n0Yqv0zz+N3yy+FpGvmzW4k6SP4aX1
	nC4obpFs8+Q==
X-Received: by 2002:a05:620a:17a3:b0:93e:6a4b:3ea6 with SMTP id af79cd13be357-94421659b40mr1079691685a.24.1793499234785;
        Sat, 31 Oct 2026 19:13:54 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425858552sm498131985a.18.2026.10.31.19.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 19:13:54 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	rientjes@google.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	Bessel.Wang@huawei.com,
	jiang.liu@huawei.com,
	mgorman@techsingularity.net,
	anshuman.khandual@arm.com,
	stable@vger.kernel.org
Subject: [PATCH v5 05/12] mm/mmzone: read the zoneref slot once in zonelist_zone()
Date: Sat, 31 Oct 2026 22:13:33 -0400
Message-ID: <20261101021340.2251928-6-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101021340.2251928-1-gourry@gourry.net>
References: <20261101021340.2251928-1-gourry@gourry.net>
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

Memory hotplug rebuilds zonelists in place while allocations walk them,
so a zoneref slot can change between two loads of it.

zonelist_zone() loads the slot with a plain access.  The compiler may
load it again later instead of keeping the zone it already read, so a
caller can check one zone and then use another, or the NULL terminator.

Use READ_ONCE().  Callers that take a zone from a slot and keep using
it, such as get_page_from_freelist() with ac->preferred_zoneref, need
that single load.

Fixes: 11cd8638c37f ("mm, page_alloc: remove stop_machine from build_all_zonelists")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 include/linux/mmzone.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index ecd1ebd49756..4bc2318ac37f 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1855,7 +1855,8 @@ extern struct zone *next_zone(struct zone *zone);
 
 static inline struct zone *zonelist_zone(struct zoneref *zoneref)
 {
-	return zoneref->zone;
+	/* Memory hotplug rewrites zonelists in place. */
+	return READ_ONCE(zoneref->zone);
 }
 
 static inline int zonelist_zone_idx(const struct zoneref *zoneref)
-- 
2.56.0

