Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793529161;
	b=LbMv1mMIvh3NZHyU/Mj0WCSlI79s/T6MGBO0NUcI6FYghLY4Xt75L7A8rJepY7xxcg9z
	 WLohuqrLbbCCykYSyAd5UAqjXDBJ2zkTOp8Wcwh8JcyWV75NbgZ2McjFzT5Tq2GiVB37a
	 t/UgzfPddPvw9aPR7UpcSFVBcNAM2zqA+8VUlO70dL39ghhj8I0MLslMxjhKirDcWx/zM
	 aNmVZp7/apFMi5P2zkBUG8+UNeJBavrAGeHLHVQ5HKB6n9Uee3W8ovrU94j7LkE9XatiD
	 v27MacDcokBVa03VFuRd/QCwtuOXwt2NUJwDEyB4h9zpcPcJl4Q8KHzGCDkMYT8Q98g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793529161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7kAjnp/vmDsZxQUJrdxKe9E85NB+pqCNBKSp0Z5xRdI=;
	b=G1TYNd/mY9onLpOIl5J9MCZ+DFWpbBWvjFONmv2xuw/wTfnQKzrDrDSJkgCN6OGlznK2
	 0G62wjfLXAutCywMl1eUxaAcMBsMxElsVMhj5foQNyirwUaWeCJEh6YvOoYWwaboraZPh
	 o7ovOWjptbBWoI/PkAeae7hYZfhofUBAP0iVlY6dGRwblxY9pmdIIGkqID5m9b6LUvpks
	 ePS5XbEo+b+FpY05CVgEbC9IMnwyXJAPf8I8gxpNRofaB4iT2AjT2gBTU9eMx0HBqJG1R
	 v/OdxEnW64C9Wc1VZv8KTHTZxX3BIovlO0rK+krtQJz40T2kAFhzMY6N4uHn3hqPPwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IlK5FzPs;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF2A606A329
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAF2A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IlK5FzPs
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a24f47293so1359351eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793529160; x=1794133960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7kAjnp/vmDsZxQUJrdxKe9E85NB+pqCNBKSp0Z5xRdI=;
        b=IlK5FzPsixSL1Byca9cU74Jo7bZ13QHBvu94n4troRBKOi+zd6mAy1WvG91PIHtTY1
         853qGyjb1FedxyVqC2CEBq+iVTKO6mcT0QfNScXTKVs1G49DUhcHmxXaydmGyCoJFEr7
         XwQ8deS7fCd/zKD+pJCgnzOnFrsjf98Z9BVoNJ1yrIGcjhudMuvWFqBTDK7Vn5WNU583
         bZyPxwVqZI9t9Z0nMmQzzj2lPVdUOV/crbyOLuVw9g0n5SAGiVwQEVUr42Ws4HHYiZb1
         XGe85GajBmbSO7/aMwzj3tQvMvbXNAGLI/IpfNqtr4IX+fVtqAFcNtBCtOFnNpfoiWSw
         c1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793529160; x=1794133960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7kAjnp/vmDsZxQUJrdxKe9E85NB+pqCNBKSp0Z5xRdI=;
        b=cjwftwzsV1mXkmBNKzcejsQSqmX/STgPKZ8QCfXdE7t3lehvNl2i/0xEKJkKxGkcdO
         odRfucuYVPx6sU4l2OZq1y2Fz/YdtI3PzYYWz9myzuVjZLID+SVfjxej8P3vladgrsHl
         QHZLwtU9tdRwmb+9In1CjELpi+y1ByaB6qmfW9UJtZXpnsxGWjMR3g4kEdl7K7xzRsfj
         3ZHTpoZsGT7HXVlAfV5ItvxeT6Jow3g6FS/RfcRpCP+T+A2zEZrJnNLyB2k9cx0QmoO+
         6kszwdIMFoQp7Hu0mmYvCloEhuCn6HCN2fQRRWLcUTQcn8389y7jtjY0i32oC0eFquiA
         brrg==
X-Forwarded-Encrypted: i=1; AKwUvBwTmOIz8LgdclP5Bml9UNMVdOiVvQsoBsOLfBkIxpsvS+ymK9i7AdA0iVP/v3LBXH8LkJ/ecnC0zLdvyVE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8I/ThjPc3Mb6GOtXW2NUsqhg3DQmO9mvNN5LlCsAZ24oz8JfhF
	dqEjJGmgwlSDjCX0u97/l+BK+UMKldkXwUCLLuhmfBNjKb1rz9bkztn7
X-Gm-Gg: AYBFou2/mo4hSZCv5GN0lMjD6QB1uSr8YrTMdde/BfVMeE8V1Hg/O0cGFnWLOgTYJ8B
	mkh/ZW85zkvEueAglD8GecyPfwZnDZ86k3wShlBvZzutJ1pdyfu1OO1doeOqzRS+5mOknf+oFLB
	tq5pntqFfs5hoPNG0XorpprBaW9a5BNSWC4sNEh0m78JvOuSA+fNsUNoVQKeX1AIaBgUkmrr/C5
	8mULkzoIz3a0k4QpBFT0BW3j+KH573LXd5/nl0efYp2wXb9Qeu39/7XRkX40pPUcnkk7SZAUYhh
	4mSQKAtWRA8r4TjIoOA7ZOszdpAenaQZJ8qosR0ah8pQmMkVubfNl54fyWRe8gKf9AkkltmYoHI
	40YMJOMp4VIwQ/tvCX8bd1I8232d0MUHVkKJN7ggi91WGlytpnKLAXp9baZ3M1MFKsyemGZ8n4+
	Kuouw5vcIIc7rw+qdsr3aoulbST89XEX9YlokOAYHbCWqc4bOm6cAPEVTysLk1jdWC/1cxdeVAq
	3E+kJv1zRM91ko8QVBN83bUQkw5p6V2gLqYu29Z085ahr0qbCFVCzUsh6c+WnGq+I/QJce9YEqP
	dN+3wP+JSIW5rhybyAubSDwp6RoO4v81F7EJlgS3/TY5A7S/ty8rtGOL
X-Received: by 2002:a05:7300:cd90:b0:34b:4b99:24ab with SMTP id 5a478bee46e88-36a42454b8emr16281293eec.22.1793529159911;
        Sun, 01 Nov 2026 02:32:39 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm25242506eec.6.2026.11.01.02.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:32:38 -0800 (PST)
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
Subject: [PATCH bpf-next v3 2/3] bpftool: Preserve unsigned enum values in data dumps
Date: Sun,  1 Nov 2026 10:32:20 +0000
Message-ID: <20261101103221.51534-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101103221.51534-1-dennylin0707@gmail.com>
References: <20261101103221.51534-1-dennylin0707@gmail.com>
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

btf_dumper_enum() loads ordinary enum data as signed and uses signed
numeric output. Unsigned values with the high bit set can therefore be
printed as negative numbers. Narrow unsigned values also fail to match
their enumerators: an eight-bit 0xff is loaded as -1, while its named
value is stored as 255.

btf_dumper_enum64() likewise uses signed numeric output for unmatched
values. For example, 0x8000000000000001 is printed as
-9223372036854775807 instead of 9223372036854775809.

Load the data according to the enum's signedness, use btf_enum_value()
for name matching, and select the numeric writer according to kflag.

Retain the original signed-width comparison and give it priority over
new matches. This preserves names from older BTF without signedness,
including eight-byte ordinary enums, and keeps the selected name when
multiple enumerators could match. Remember the first normalized match
while looking for an original match so only one scan is needed.

For an eight-byte BTF_KIND_ENUM with kflag clear, a negative stored
enumerator can therefore match both its sign- and zero-extended values.
The record cannot distinguish legacy signed metadata from unsigned
metadata with the same bits.

Unmatched values are printed as unsigned when kflag is clear. This
includes BTF read back from kernels without enum64 support, where libbpf
clears kflag before loading. The original signedness cannot be recovered
from that flag.

Fixes: ca7e6e45d108 ("bpftool: Print the enum's name instead of value")
Fixes: 58a53978fdf6 ("bpftool: Add btf enum64 support")
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 tools/bpf/bpftool/btf_dumper.c | 42 +++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/tools/bpf/bpftool/btf_dumper.c b/tools/bpf/bpftool/btf_dumper.c
index 3267163119dc..792e210cb503 100644
--- a/tools/bpf/bpftool/btf_dumper.c
+++ b/tools/bpf/bpftool/btf_dumper.c
@@ -148,37 +148,50 @@ static int btf_dumper_enum(const struct btf_dumper *d,
 			    const struct btf_type *t,
 			    const void *data)
 {
-	const struct btf_enum *enums = btf_enum(t);
-	__s64 value;
+	const struct btf_enum *enums = btf_enum(t), *match = NULL;
+	bool is_signed = btf_kflag(t);
+	__s64 value, legacy_value;
 	__u32 i;
 
 	switch (t->size) {
 	case 8:
-		value = *(__s64 *)data;
+		legacy_value = *(__s64 *)data;
+		value = legacy_value;
 		break;
 	case 4:
-		value = *(__s32 *)data;
+		legacy_value = *(__s32 *)data;
+		value = is_signed ? legacy_value : *(__u32 *)data;
 		break;
 	case 2:
-		value = *(__s16 *)data;
+		legacy_value = *(__s16 *)data;
+		value = is_signed ? legacy_value : *(__u16 *)data;
 		break;
 	case 1:
-		value = *(__s8 *)data;
+		legacy_value = *(__s8 *)data;
+		value = is_signed ? legacy_value : *(__u8 *)data;
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	/* Prefer existing name matches, including signed enums without kflag. */
 	for (i = 0; i < btf_vlen(t); i++) {
-		if (value == enums[i].val) {
-			jsonw_string(d->jw,
-				     btf__name_by_offset(d->btf,
-							 enums[i].name_off));
-			return 0;
+		if (legacy_value == enums[i].val) {
+			match = &enums[i];
+			break;
 		}
+		if (!match && value == btf_enum_value(t, &enums[i]))
+			match = &enums[i];
+	}
+	if (match) {
+		jsonw_string(d->jw, btf__name_by_offset(d->btf, match->name_off));
+		return 0;
 	}
 
-	jsonw_int(d->jw, value);
+	if (is_signed)
+		jsonw_int(d->jw, value);
+	else
+		jsonw_uint(d->jw, value);
 	return 0;
 }
 
@@ -204,7 +217,10 @@ static int btf_dumper_enum64(const struct btf_dumper *d,
 		}
 	}
 
-	jsonw_int(d->jw, value);
+	if (btf_kflag(t))
+		jsonw_int(d->jw, value);
+	else
+		jsonw_uint(d->jw, value);
 	return 0;
 }
 
-- 
2.43.0

