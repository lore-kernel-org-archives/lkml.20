Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794106620;
	b=nwzxEFkrTp3amBzLgoYBiZs4dJ9qHwT0iIUAI0I7Qo1M8G9RpT2pk+GCF3ThIshdoP0o
	 SFEEPsN/c8UMj+M7HSTP0/6qEBJg9kE2hbuNoENslyNtwxCsuexIApMFCRcyYAyepxy3l
	 3oJi4uFKKLV5wm984GRRbkqSDlpyGFLfv+ydw0DPcrHJxXjbJukEKWyp115b0u47cW/T4
	 /pWLZ4+XEa2cF0nB9F42FdoRwEqUB7ugVZRrfCbkSjddRVz/wu0Y918sRRuEP1tbPjQEb
	 xWOdJVTs5ytHQyHK0kVLrUqWShxdnGx/ua6Lm51dJOQQIhiIteWVyQ2aSeXBz0J/AQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794106620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pjn5VIMCFWufAxXtNYcmmnWxYvHuss7ZMRE7XKvTOQo=;
	b=nmw1FqpVwHZvuqkyhvjvDBGlGtiCq0yGctb0vHjBjZFSfQt4MkDnT6GaanahO2kfUHbi
	 1ePBlX5jIiohYCSooLLXQZiHmrbPmsWZusCIcNpj88Co5ComWPcEpz33TwelEEuq3mwgN
	 /tA46znylOUxu3GK4/Wy4VzAjZ5pMuBtL5aLTQAKBZQRUpNq5CjNlQG4ca1WRQgF9cWD4
	 RbeKJDI1bmzsVM4hlP36YF7u1OAxS+Jme+V2FyamFtwAGH5VChUtjwcV6ZASSRx0cyfTa
	 yn5yDN0+rcI5W3hSyf71lmyXW5bf7/wpy2XNGTb5mFJjavgJV6KwEU+QIbZtBO39Grg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ts3CtS9P;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4AC606A323
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A4AC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ts3CtS9P
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36f936424f2so67985eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 18:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794106619; x=1794711419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjn5VIMCFWufAxXtNYcmmnWxYvHuss7ZMRE7XKvTOQo=;
        b=ts3CtS9PlhQRfFLFBrWZ4AbDJ2+9pAmiH5jjKn9Mr9J0dyFcdq+L6NQhxNuTnHVzEG
         ijy9wccedyKDyFylAFcGuGaVoRB11AaBbzq0DbsDy/WY2Flel4h3MGiwRDpc/twLDBwP
         lpv6m9Dech9P5eMb1D4SpkwdeH3HPd3W8UFemWPEgnJ3UKF9FnhHVlxSjSEpXIBNcP11
         aj/ipWTwlq9e09AWZMj5+z4KMOHsss+nJI/tbQJuwmnNAVHXRFwW1TLPRzKkuvcSqq9A
         oaXgJnz/0ujZ1FlyqRRQrNzsVidVdnn8XqpTWm4WLd9THMavAibS2UQQi/7kltYUNEno
         WDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794106619; x=1794711419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjn5VIMCFWufAxXtNYcmmnWxYvHuss7ZMRE7XKvTOQo=;
        b=rT/9YZvNzKUcOHb5OawK9uEN91FL3scDDMGjJSn6zftptf3wSwBGmfrLSxECWp8ITT
         YFcAmuRev8kpZLVdhLMqjB7yIW+QxnYHaWMkdMILz+278aJoyBBJ4K5x3ppyNm3gH+f1
         Ur1iCl9kgUDm2oOFUGU2jL6fWYa2tuky8phIF5MFQVYPEdvEYVJ2HdhO0kzSsYsiYDbQ
         1VwZSHizGPVvxAV0DIVYSkhBOEfHY15BUtnNNugJEnSByIgfYqadq7wjT3oRaYpfKMdq
         /4SZUEfCPuf2kKFrOgl62CiMQlwlm4i2GJdPh8syL6hvJxkqewJ6WZarTsHh+OPfiEzC
         JCDw==
X-Forwarded-Encrypted: i=1; AKwUvBzlfjogrRZhH4chJwKP/Xyj93P5zEwNhFdCBurNnBWjDxiC0PwEUfURX3qofHyh6DA3++430/8wvLzVIJk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/MjjbKUdPULRkvDy/DnkKDXF3E5Lp7B26xB54aqG21jNTE2HO
	YP6wYI9jfpcCydtMzEv/OWrx8m5Ax3EvNJ3tErS8dapHwTM4UGkZzGXO
X-Gm-Gg: AYBFou30YBMjK37qBaP+sjJ9GWv2QYZ4137hKzajhGa1HyizxdDKvyvZLJuG8PTTCpq
	7VK9Vf1LDpCY5PLX4awxa67iXAW2xGN78e+5S8zY8o6ypwACUzpT3rcCL6L1VaRxuHAANev2W1/
	2wkb2EUGICOj0GRboV84mxdScXBAd1H5kN6w4CcoS601wmQ32tgZsVPQKrcMGt8begaOZTjD5CD
	eBxsB/tQpU+MExrX850wxrRZOj9kXBXaBaBFsluMIEy1Vmwb71dkecBlQx8fwtp7b8mCrLrroTf
	2B96J9K6wGw72tSiz5pkeMKF7krBPtkxRROg8Nuxfui+eMTceR6ihrmSqRMtyKp1zjXGNriWTB4
	qRPdWw6m+PXO+DnWVjRHG7aMkux9Kg+Dxq2PiQOPmegWkAj3qYWYbcRufXr5Ulz3EkgDrJoGVdP
	rTKIxjGFV1MM84cIiam3jRl3N/BkC8Pz1cdyg+IVp3anKgxjQDkgxRZsoTZS+8ktg31ayeW0m4e
	w6WKCJMTELyqt7Jk7bNS1sYnPLSuZNk66X7Tkjr28bnWxqK4P8sYR6CSEs5mlkq0bUN5xH60pRR
	WyjHlQJIS8T/xEzDNDZihdC2hMU4kt6ojuQh98bIyQltAtnMpqBvYcmf9C3jngYPy562ZiEKlt4
	p6PJ8mscMxuJHGao7Ab5ZPJIfSpJF8IntgtR50Wi7GoDTBlUhjceA1uBdr4I=
X-Received: by 2002:a05:701b:2512:b0:156:6676:d0e2 with SMTP id a92af1059eb24-1b39fec213dmr572791c88.10.1794106619341;
        Sat, 07 Nov 2026 18:56:59 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3773ea50asm2241202c88.23.2026.11.07.18.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 18:56:59 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: ast@kernel.org,
	bpf@vger.kernel.org
Cc: andrii@kernel.org,
	qmo@kernel.org,
	daniel@iogearbox.net,
	yonghong.song@linux.dev,
	eddyz87@gmail.com,
	ihor.solodrai@linux.dev,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH bpf-next v5 1/3] libbpf: Normalize enum values according to signedness
Date: Sun,  8 Nov 2026 02:56:30 +0000
Message-ID: <20261108025632.10799-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108025632.10799-1-dennylin0707@gmail.com>
References: <20261108025632.10799-1-dennylin0707@gmail.com>
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

BTF_KIND_ENUM stores enumerators in a signed 32-bit field even for
unsigned enums. btf_dump_enum_data() compares unsigned data against that
signed field, so values with bit 31 set fail to match their names.
get_map_field_long() also sign-extends the field: for example,
__ulong(map_extra, 0x80000000) becomes 0xffffffff80000000 instead of the
requested arena mapping address.

Add btf_enum_value() to extend an enumerator according to kflag and use
it for data-name matching and enum-backed map fields. Return __u64,
consistent with btf_enum64_value(), while sign-extending signed values.

Fixes: d90ec262b35b ("libbpf: Add enum64 support for btf_dump")
Fixes: d147357e2e59 ("libbpf: Allow specifying 64-bit integers in map BTF.")
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Link: https://lore.kernel.org/bpf/DMJG1R2YIJRK.16CZLV9S5U7Z7@gmail.com/
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 tools/lib/bpf/btf.h      | 6 ++++++
 tools/lib/bpf/btf_dump.c | 2 +-
 tools/lib/bpf/libbpf.c   | 2 +-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/lib/bpf/btf.h b/tools/lib/bpf/btf.h
index 57f12630c5d1..d74c92056f0f 100644
--- a/tools/lib/bpf/btf.h
+++ b/tools/lib/bpf/btf.h
@@ -636,6 +636,12 @@ static inline struct btf_enum *btf_enum(const struct btf_type *t)
 	return (struct btf_enum *)(t + 1);
 }
 
+/* btf_enum->val is signed even for unsigned enums; kflag records the sign. */
+static inline __u64 btf_enum_value(const struct btf_type *t, const struct btf_enum *e)
+{
+	return btf_kflag(t) ? (__s64)e->val : (__u32)e->val;
+}
+
 struct btf_enum64;
 
 static inline struct btf_enum64 *btf_enum64(const struct btf_type *t)
diff --git a/tools/lib/bpf/btf_dump.c b/tools/lib/bpf/btf_dump.c
index fcd97aa90589..602664a6adef 100644
--- a/tools/lib/bpf/btf_dump.c
+++ b/tools/lib/bpf/btf_dump.c
@@ -2378,7 +2378,7 @@ static int btf_dump_enum_data(struct btf_dump *d,
 		const struct btf_enum *e;
 
 		for (i = 0, e = btf_enum(t); i < btf_vlen(t); i++, e++) {
-			if (value != e->val)
+			if ((__u64)value != btf_enum_value(t, e))
 				continue;
 			btf_dump_type_values(d, "%s", btf_name_of(d, e->name_off));
 			return 0;
diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 0e2a93a42908..44134421bd7d 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -2650,7 +2650,7 @@ static bool get_map_field_long(const char *map_name, const struct btf *btf,
 	if (btf_is_enum(t)) {
 		const struct btf_enum *e = btf_enum(t);
 
-		*res = e->val;
+		*res = btf_enum_value(t, e);
 	} else {
 		const struct btf_enum64 *e = btf_enum64(t);
 
-- 
2.43.0

