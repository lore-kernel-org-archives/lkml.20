Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017256;
	b=qn70txQBf/qlKqGpsGuU9hr4M56tDrBj8Qdql6SZRa4E63Bf0xPB5LBHAfgbVTDvshzY
	 StoFkuz7VWg2/+4FWoKvCOJB+qvNFWcAsrESWUZkRQSo9ekYtgZz9YB3AhFnsut4RXOgp
	 7iEngnrw9BiwZNKAPZzmeBCuwkbnNwvtN3Wv34v20vZNtsig7ZQMU4huVm83injIovxOI
	 6fZq7u0+3f3b8GtANki31rwYWMpJ1wNeMybQnuptXl1MxWYgKMGMvBvx+f3J4sC56jQhG
	 78v5fnKbMqVh13NgcJm1P9p47dRYoGwXQjZGJmQDY09J+GXoszAaWz/bnZcXMGwuCFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Nm1koDck7vzbeNbMewmGKmgBZQOKfI/JO390sHTU+p8=;
	b=ge1ZHA5SHOTpDEL5zlUj9Zhg4btwsO7NiNUsT58IPSyZm9Owwh8Bp2orN6369OEkC75r
	 qljzGWQLl70sTq3xX9o6UIzAPfWiwHVzvIUokFpvXuwuI/VzKcZFASLUluEtT7eeFt74h
	 wMjU1iwpw2VLEqqO6G+1KXA4KkZQgp7OrnJvD8ukKQ6Heflmwzd9GuSw95IZLHo5P1+kn
	 pr7MsJYJdhrZl21FZh9HSTRJvgzJMh+o7QIhwju8IHlSt2HOzB9SGwhBaCA/rnYf49w8N
	 usKZ9M4aF8eRbaMeZG3tYhUnesMZqbKkZ8t49DWQY/Fw3LBB3H/5/I/CN6ua4Fg2EnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpfecCtS;
	arc=none smtp.remote-ip=74.125.229.2
Received: from mail-dy2-f2.google.com (mail-dy2-f2.google.com [74.125.229.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B0C606A337
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07B0C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpfecCtS
Received: by mail-dy2-f2.google.com with SMTP id 5a478bee46e88-370ebdde89eso301519eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017255; x=1794622055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nm1koDck7vzbeNbMewmGKmgBZQOKfI/JO390sHTU+p8=;
        b=BpfecCtSDVjmiLe9zkEbkzm6VdmcxgPSse1IwEMGRMsEjQMdPYtthaX4/MyA+qKWwT
         M7tj+0bng2BwVrdRV6RpvSTupEZl+wTRhbkgG0PKEMV2QmiM0fXOMRM6QKKZJknR9CL3
         H5JumNa13GsIK5Wuhn8ZldNTmgZ54gac0w03AY3TPNH+S51EDG5u/wOmT3lDeJrdfQQp
         J6pDodqdXoCmKEcjMBM30MWe9Hi3ImDE7Ftnwj+JAfc1DbjsDpdj8TzvurU3/zIJLMiY
         Q8LdwBt1gX6RO1Usf9T3uwzz1mY7gGNzpFVS2fshDs5mGXy1vGUA0nQNjuqiUkKmUlHw
         Bmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017255; x=1794622055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nm1koDck7vzbeNbMewmGKmgBZQOKfI/JO390sHTU+p8=;
        b=knnXBYKzYmGuqZZD6q8sWv5Fvonhkyz0MeMWfcbKuesMHS46pkyT8JVLpsRBAOVrxn
         co+4Qg/x2scWG4/DRZHzbSrAUMIjJjey26OVxPioos6NAOs+bb2T/LLG64c9TGNB2FYJ
         ATC8jFkYv24iwusf8dxptyTKyV+kO9v9RQDkImGL8l7olzdcjExYBTBlK4/eOwAi9YaT
         Z6LcjojmvJ4AyFW3Wu6/iuqUiX03gnEIU19iDGkHb2C9F9m3ggopfoCUh9m23CBqJFNo
         8Xy27Z4/Q9w3b9fshHpfTum8E+8zjnjA0ke7O1fqsuKVsnUJRb8JWz9hp1n1OOL8TlrZ
         49Dw==
X-Forwarded-Encrypted: i=1; AKwUvBzYnMNmHb2kalvLa6Z/L6LHECyghf/x1pPfJ8w/rLSDyN6lygQu5d8pIIHbXaabBraOERitYGdtFao3vJQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZcMFW7jnep5IJuOeva79KxTPn+1NDd6zK9GWKxJHQ2cciwGic
	ILerM9d9bMyO1x+BjNciJBhNvUuUFfL/gdug7/DRT4c4rbB5Xj+Onnro
X-Gm-Gg: AYBFou0wlEO61tdB1d5p0W5BbbNnr/M35g+rY9RqZssYbGMEInPHEJU/UdPsUNXkSBi
	X+PcGbSt410NaS82nR5o0xWIV0m4B5HfyA6EpegsoFNwFMYvyBNVz9OXQgZjDhZKyc787EIh4b5
	xXrl05lnP03MZ0IaJjV/YkZl5pfhPSX9v3qqDSAmGlFlLESv8Z+i0I/mrz0CU+wh7/obfZhT6U1
	EMVcVBibjDcuLdc/Dyru5i3w0XsfYINA5Ps51ADts3DnmmDcduSuLQgX9x8MGIe9G8XBkXWLgA/
	krv7Z+Wu0ouMLWpDKT29tuONSLoA3qN/dUnJzIHemBor9zWCkfXjioCo3S4jKVRTh5b3CW4qaf9
	XCku1nYPatoqr+xFzW79XEnfunh4N37gfK8MzhYTIgKyL1BWR2MWHMWcu3iHmt1002mlNH0hOqS
	DdMuX8341V2ZBSKXHu1GNjBsXQL5D4d5BwfJC+8uIY89BeUBKeX1zwJbTSsFiYraoldjM7akpZ2
	IjNZEE8U3LvpV9noptMNiNZO0lKmDlMiuaQDsmkYn6PHkRUtiD5JxTyLQcaVUv8goopptVpJFeT
	rLPaIvYy+0Ht9/laDYLYI0la2qtgukq2iwKKVJxxXo2yb8TbgEqovb07blDrqsRHFyRaFhBr4d7
	5AxiSNoRHo1RdYuwupnJvyRsQVNyckUCrk6t4QCBgDtAywe9J4TmsflnIZSk=
X-Received: by 2002:a05:701b:270d:b0:1a5:9abb:fdd7 with SMTP id a92af1059eb24-1b25d30b02dmr5788693c88.9.1794017254824;
        Fri, 06 Nov 2026 18:07:34 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e485ce2sm9338497c88.7.2026.11.06.18.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:07:34 -0800 (PST)
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
Subject: [PATCH bpf-next v4 1/3] libbpf: Normalize enum values according to signedness
Date: Sat,  7 Nov 2026 02:07:23 +0000
Message-ID: <20261107020725.36675-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107020725.36675-1-dennylin0707@gmail.com>
References: <20261107020725.36675-1-dennylin0707@gmail.com>
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
Changes in v4:
- Return __u64 from the shared helper and compare normalized values.
- Drop the legacy comparison and rely on kflag, as requested by Andrii.

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

