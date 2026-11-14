Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699238;
	b=qKJCsCukfzguo6d4htTbMYuQJyvW0TnZ6NwXM1b+xPxBEllSq0GOvV+ijQ4fBvpZzsYm
	 2ik+A5nN1S8UBNZgJI9HoFuVE3V7zm8y37TJ4ls9YrtGpEMoKq/eG8BtAGbvtAjaqCBU0
	 qLLRGArqLW4eJwN06m9VLxYd+lKJY6UtcwP4ZjXNgxnnLaM8/9vLLgk70eI9ZWparwhn4
	 /IQp1189ngNrkZQKCFhLmZItsaeYBRg6Cj6ppB6xXv3yK5w0eSwgl9p1nGSiE7yYNHalH
	 x3NFr+bY+hNL5CztZnsHYUwoe4a5P+asKAnL+J/W8iA50DS93hMLrK7a9LlsG/L2Kzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ts7qrELy4iZVhgGdLhRbHtA5AlBQL00T0NsgUzPShXI=;
	b=FZ6+UEM6mX3n5t/L9SyOH9qORa91G6AZljk5fYxK9Via/yCrDN4tVSi6Fum/EW59qAft
	 mOESuBgGJls8FrTIghpfd65WzmePMLQ9flQbs3k1KCfN3IIKGfVH93oirFQM9TTT07fRF
	 0qqg3iQEhLDW/oQSmCZSW+dSsTyl2bsk13UBkP2Bdm9NG9B2/Gg/FWiIIGJnAky3sMGqn
	 /8DXHfb3hHlHGBy7K3jxdE58dabUgj05S1K866WkLzzP3WOvuJoXVOngJWmEJ1sZAheYE
	 Bp4CKpOweCOSoFPTh+nouly8C23y9ilZ821qP5yTYLRfZ8f7EQb8PzHf1TXqEx7TBxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yNrQ060L;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F01A606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F01A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yNrQ060L
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ede7cb02daso23213025ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699237; x=1795304037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ts7qrELy4iZVhgGdLhRbHtA5AlBQL00T0NsgUzPShXI=;
        b=yNrQ060LCvvJ2iHXLqz0esFcqTn2/AKBMSZvgMGKVWx0G9/Oede/Srl3bEw84nd+n4
         Gx64Snygu4XruMrKW+KKAizuLGJelzywSVJwl83of+HG0XbTUgj3bKv6C4YU88LDy27F
         R94/LUwft+F4XktjKQ8IZ779PYzuwPyzpjEqbiGQYz0EqnJvUZqYKgDKJagvnGGybL0n
         Qz2E2zf6PCJk0UvikTD2wJVkxReIVM3PAEhfFJsmrd1mOFfBP4GTVypDjpNCxuTVqbAK
         wQsgQy4AZB+1aiJymG07eGDSqym/8k8URwJ0K8YKJDOWc2No2RHoobDRinqEF8mxE2Pn
         ITSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699237; x=1795304037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ts7qrELy4iZVhgGdLhRbHtA5AlBQL00T0NsgUzPShXI=;
        b=sOxKoTr4MYry8H2l4H3p6GTXIYCcnOX4WPTyCXrdsqaFIHYyFP/VhJm2Dj5ggliOI5
         czqAbnq9FhyFkk72k+LHjtPJRgti03fHTDJ5qdc+4xenQlbEjIvniR5NMZZf1z9bEMmZ
         Au6CasiVZiPOeOViJL9O9HKvxCdHNsKD/oSrvCyw97cziKjY8v5NO/7ZCm09hoCHVVR5
         eYwcCsmlS8jo4qoZVEjMrzRP7nGw4drBP5wuTho2tLnCfYoxJoB/YN3cakfopqP0onH+
         zfz19CjOcyKjgcHsa1Ll1/VTnZ0Rz7Tb4hRV/NImBdUeq10FEoLXDp1HWdIuITfMEt8b
         MD6w==
X-Forwarded-Encrypted: i=1; AL+hErEEIadDKhIztE0c2ad7m8LBRMTe4tK7ulw1mJh/LDau+XCNf0onTsQP50k+1/ZvklPd+pz/d7hu4flB8Vk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fKN/dN/wZoFbvhtnt/BCFqHbWo+K4kqse0i8L7XCYDP3V56cM
	noq/1JH3oNDrkFdTZrkccEv3ZGJlIIr1BxgPYu1ds9aH18bA3c26EWfC
X-Gm-Gg: AYBFou2y2m2YFdssqESiYzJw34c1G41sD70Nko1XHIU4c48otQYajSilpJ7YJ56qEHX
	bIxqNIIJ08/inGygZsxA4ldjyolJSdkDZDRa8F4BOC7on9MGWPVNF7UFbpR+9tR2l+c+IIWunrn
	u4pCCY1UBsCCP49LY00q8QQzXW5AuacvRunTZU2wweP4hg/Eckna5nXtAWX9ROF//gDRhx+EuV8
	eKMUitZFZZmy+na87ukJ5abJFv7MolzSrfQAGUFWsiCYfMMFMhZ4ho5UbKvZyKjdIu0uVO92uSI
	XKRuJNJXMfjLmktJTV6qSGimH4fxYLh4A7nVtVrzMSOn7WuzLQwwfJOpt8DsXN4aoTPchcfuS3B
	ZGFF0qhrLKggtUnhzkXQJ9I11dirKrx2NbaR4G0QtODnMXORtA/9O0qZG3Wv8c82AElkmnu2dt0
	57/LmIi08zEEtkJUX7s0Z6qcHWPu4n+dozOfaXT7MSQjnxg5XnYWoYXTgFRZamyMTIBInCBBRF5
	H/mQeY+KkK0Vh4DXUh98LDhuuz4rvCgsT+lDKwn8eDf/4ZOcyf/mVRzjPT4bVDee4lh4h5OV1No
	N5hzY/gensgt++TmNWdi/9J4h7CIjPjqDRBPY7a8vG1dcZXugmvdKeceboOfaaUC0sDcqpdFKlG
	Qr9Ev1O3qveeHI6yyZKiYIDGmMAhyFjgdDGxYkTfYtimJUocPVjnSO/TzChtO1bB8aWQv+hiyM5
	/yWQ==
X-Received: by 2002:a17:90a:fc4f:b0:3ae:8983:4ef8 with SMTP id 98e67ed59e1d1-3b1b0b5c008mr3971105a91.9.1794699237483;
        Sat, 14 Nov 2026 15:33:57 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm15393908a91.16.2026.11.14.15.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:33:56 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] lib/bch: use flexible array member for xi_tab
Date: Sat, 14 Nov 2026 15:33:54 -0800
Message-ID: <20261114233354.84841-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Convert xi_tab in struct bch_control from a separately allocated
pointer to a flexible array member trailing the struct. This co-locates
the xi_tab data with the struct allocation, reducing the number of
individual heap allocations and simplifying cleanup.

The xi_tab member is moved to the end of the struct and changed from
'unsigned int *' to 'unsigned int []'. The allocation in bch_init()
switches from kzalloc_obj + bch_alloc to kzalloc_flex, and the
corresponding kfree in bch_free() is removed.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: resend
 include/linux/bch.h | 2 +-
 lib/bch.c           | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/bch.h b/include/linux/bch.h
index 85fdce83d4e2..e736b3a46e96 100644
--- a/include/linux/bch.h
+++ b/include/linux/bch.h
@@ -47,12 +47,12 @@ struct bch_control {
 	uint32_t       *mod8_tab;
 	uint32_t       *ecc_buf;
 	uint32_t       *ecc_buf2;
-	unsigned int   *xi_tab;
 	unsigned int   *syn;
 	int            *cache;
 	struct gf_poly *elp;
 	struct gf_poly *poly_2t[4];
 	bool		swap_bits;
+	unsigned int    xi_tab[];
 };
 
 struct bch_control *bch_init(int m, int t, unsigned int prim_poly,
diff --git a/lib/bch.c b/lib/bch.c
index c991c71c4cbd..f003965a21b9 100644
--- a/lib/bch.c
+++ b/lib/bch.c
@@ -1320,7 +1320,7 @@ struct bch_control *bch_init(int m, int t, unsigned int prim_poly,
 	if (prim_poly == 0)
 		prim_poly = prim_poly_tab[m-min_m];
 
-	bch = kzalloc_obj(*bch);
+	bch = kzalloc_flex(*bch, xi_tab, m);
 	if (bch == NULL)
 		goto fail;
 
@@ -1334,7 +1334,6 @@ struct bch_control *bch_init(int m, int t, unsigned int prim_poly,
 	bch->mod8_tab  = bch_alloc(words*1024*sizeof(*bch->mod8_tab), &err);
 	bch->ecc_buf   = bch_alloc(words*sizeof(*bch->ecc_buf), &err);
 	bch->ecc_buf2  = bch_alloc(words*sizeof(*bch->ecc_buf2), &err);
-	bch->xi_tab    = bch_alloc(m*sizeof(*bch->xi_tab), &err);
 	bch->syn       = bch_alloc(2*t*sizeof(*bch->syn), &err);
 	bch->cache     = bch_alloc(2*t*sizeof(*bch->cache), &err);
 	bch->elp       = bch_alloc((t+1)*sizeof(struct gf_poly_deg1), &err);
@@ -1384,7 +1383,6 @@ void bch_free(struct bch_control *bch)
 		kfree(bch->mod8_tab);
 		kfree(bch->ecc_buf);
 		kfree(bch->ecc_buf2);
-		kfree(bch->xi_tab);
 		kfree(bch->syn);
 		kfree(bch->cache);
 		kfree(bch->elp);
-- 
2.56.1

