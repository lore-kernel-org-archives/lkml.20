Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364505;
	b=naFVj/tI4KSvDvcYjYYS2f6mbCkNDLc9ztl2rFgddrIK/AEK8zDLdvnU0yRHFfqVDg3L
	 ZgvXF9TLlpvGZROQgA3nqgpgXm3S9h+f9QROwCbc8Y762gRf3pt6wZqxkSG13jsUprZFy
	 UC64u4lBf/JmHdI3SM8i3p/32jhN1fVH55mKUeKb10CDXfHmNxWT/rMKQin1BU/L+EkH8
	 dp+PRMmxWGl0KiUJIUU6tnbMmP8EDj8HLbqhhOcTyakQnLBrC22ThrGBmN6MRFnE7k6cq
	 MNLi6wtUqBBx3/1chLKwP0avbci3FK4B4F/kWJpCNonR4lmUSRuvRPY+vl/maeuM5vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=V75Giv+e07vuq5RNj3c4MeVDXR/UQ6y5MO2wUYYunZo=;
	b=Bq1nGD15XC5jh/0QDhDxwc3CFbhglwnLagsvEJMUU1R4nweAg9Mc3SKyL/SVgG5r4aLJ
	 EDR99lr55rsyX6qwUyAN6TcqJi6g0edEgZuNAwhSEchPatdn7EP+64WU5DytPuSpIHzfJ
	 8d4nTpKXwph70VXphkXWnHd13fjOwYbP3FA6ddZFhhKb2IHTyhieGRFUG0IKIvFk7CxKm
	 p97RCqohCJbHdvmiNeKgPFMcltzsVip1BT2xAYOXo2Sgx/1Tb0S4j0jcAQpN3p1FBPAKZ
	 4Ojxn8hQGiTSM5sIqjXA4pQNGMQ2lqkIcXq5PCDPUoGqt3vi086lscKVUlFW9OFbxuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zTcyhR1o;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256F1606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 256F1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zTcyhR1o
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4f55a53898cso1282079b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364504; x=1794969304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V75Giv+e07vuq5RNj3c4MeVDXR/UQ6y5MO2wUYYunZo=;
        b=zTcyhR1o6wGRLJcDfRc0m0+EDyM7DnkJclPUy1kQ1UdAbkc5R5ekQ3A273YJX/P7M+
         IKxQ04A4hYzWjYMM3+Rt+ip24qYSf5Jb/lKkKiSXc2Lxt6EHVwAKuU7SFbzpw99Zw3kP
         MYXO2f8o2JRiIhQGaw/hvWZUGWc0D4chBG9dnmJC8+LDLbmpdE+yK+6fVW5XPiMvFGaB
         tyRwQUNh621WjAa4h8mMYohiKKOSvsQjcuqoZil+EvbgTXeZxKiHMbw14HBGX5DjtMNs
         FTYJ3dxN76wxrICcSFOyK+MQZ3Y64ZL0O6avgfvb1cIxOyaXYVac78FPqZF9DMWNig3O
         w5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364504; x=1794969304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V75Giv+e07vuq5RNj3c4MeVDXR/UQ6y5MO2wUYYunZo=;
        b=zwryVDOQ6IIqPhLzUyrt3fhDkiL88h7PAxnGVcrlSgj3nzNKhhIBF/KbgGlzfm9bLG
         Q2cbhhm1o+dabqXxIZPZbLM5sKX/vh5gCe77Hs8MpOi1bNwxIes2CyHisLzcEQnE/ILI
         VPA6LTgEyVhwXY4S0fIZjpWdxpGOoSUMuL2/GtvhrB29+p/VuRBJ/KaAYE/Y9TQLpcbo
         zLjbJaLJ2OnJj2q7EsY1SwLOXjfvp+KY06cqo9WTWr6n8ZPWHU8fvuptxhsiOoGEd1+Q
         WYXH0q/8LRaW54wknMDOgNjf5eDNNMyIIwjdiHcPOmEsY2Eeo5IXsqadvV9yR1rbCef3
         rljA==
X-Gm-Message-State: APuU4Z/DaforXGW+aRX5bckSLIsMsb4+MVxzaultGOmBhsr45zLgRRJd
	LYcb3B0iWrhfnpvgqRLEqXsjZPCTgnMAojShvHpIhhMaoUpw+4vjQbc77wT1fDN+
X-Gm-Gg: AYBFou1DVX0uYKInoC2AnKwibZ5QlKDfEaTqwGVd69FKYt/0cWwk2Yk0IYFVtZi8lDE
	1ivnhQzMEWMlsygP2onVopE+vs+rbt+1JzuxDdIEI3dAQJbwfNjMahie9fyQpXfX4NdQrbUkeGk
	QmEbFM3VBB4kvEqkfFUyBlFMtCnwI/MZdqEvY0zjKGrsNgTvTKZ4wf1HEqlfezlUyIHyM0mbg65
	1uuJkm9AesIAlzj4XkAX3aEP4N46owe/D2BTOUar5zmWT/o67vhLojx9mPQAjKjH3pzmweVp55E
	cnbiRPPfyM2Yp25fZ07SvmVRKMfPGdm/7Rb2ZxuKgtfx8RuRMxAsOEAVCHkBaUKTe3WYSZbVrbK
	PxMBgU4VBzPGbUbZ9CTduzc37Ki0BDQshSX0AxpZLpVliq2/qZUFagiB5VB3sD0YTGpgDpg7omu
	rm2q9tKhZpzvE13sJHJcQaMYfE1IGCXyKDOCIchs3qyoiPEV1N+FjlYMyrt5vIgYxaF2RInodR1
	FuDOcL6ROmlju9o99NPK9hG+WomyjxOCZeDaGJnJl5oSh+CYFFC9j/Jc5G3QOoZ3ctJCTyPv/BK
	dYsRY6eJG2AP5CzQcbGe3L7oteShw63gxbmgfCGzKnNd198IKN6nL7/5pi6xS+wXg2AMfHsKX/K
	XLayg7XGr7COia+30xKfXCebzhKXYSdvl8P+qty2qFHG28ES6iSEUEiO9rUjAWoUK0I2Rb3fdbG
	dIpzk=
X-Received: by 2002:a05:6808:4fd2:b0:4f4:73a9:f831 with SMTP id 5614622812f47-56b96bd1a1fmr820292b6e.19.1794364504066;
        Tue, 10 Nov 2026 18:35:04 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56906330dc0sm3873864b6e.16.2026.11.10.18.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:35:02 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] lib/bch: use flexible array member for xi_tab
Date: Tue, 10 Nov 2026 18:34:58 -0800
Message-ID: <20261111023458.72092-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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
2.56.0

