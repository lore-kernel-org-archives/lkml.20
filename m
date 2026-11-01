Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793491858;
	b=lqjVoRt4Mw2Yu5e6DH+68VJx2D75+imBTgovMAzpMchy6jaEOwQqdoI3sCU/LxEwDwxs
	 Jev/t/cCeEfl5nh05giWhGS0NCNCZ532vrM1Yfef6d/L+czIOynWiBbQlpoE9EcnHA2wz
	 3eqG3BkJ8fEaKya/JhfxYQQ4LZIsRKao3J+WZeh71p7DUL9MCXKOIRl5Et8n6tnhjUu5M
	 85m7zhpDarh/I+CQIovhDYzAe3MDPyL6zt80XICDkuzt1JxBxyCyRy4KEGn3E8dgAZUE9
	 obCJIFSutZn1IeBqVZf4uXq1tjaYy8Ngdcqy+JWVtqxiAW+/jvS1u2XDVpK7FT2yR0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793491858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=onQ2T2Et4gZdcv3wTOM5R4NU3ERMzCKIhrlLawaSYE4=;
	b=uchJNkMqoXH9OUrytnFxEjpPHVtMNUbGszGuXQI00SMFqRjIHQG/pQgzVJrZmZNHRUrv
	 eqZB1IdLLNv4aOVFIOrM5QSf13D+zTKcSQdHPzfQOzEBJnkIX2tHwaWUnSx9GV221Mio6
	 N6wswZ45JMo2+GlvtbIPHQretnQCFzqgb3Re9tfwWmGoczLyf0fDyfO4aCdeAMdkRjq6Y
	 gonKM/Dvevq8xJlGshszoI3Q9XvkZjOMQIqfwj5FFKuXEUjj8AyxVtgFgiijh/W6fqUrD
	 pqY7qwEY3TwFhvtk2qzr13tZbvy/6gRNAy+HORlgwcBKO8LK44+fE09HxKt7eBDscaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nv24we0S;
	arc=none smtp.remote-ip=74.125.229.138
Received: from mail-dl2-f10.google.com (mail-dl2-f10.google.com [74.125.229.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59588606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 00:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59588606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nv24we0S
Received: by mail-dl2-f10.google.com with SMTP id a92af1059eb24-143601f9f98so499725c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793491857; x=1794096657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=onQ2T2Et4gZdcv3wTOM5R4NU3ERMzCKIhrlLawaSYE4=;
        b=nv24we0S4qdFZ9EFpZBpIMVq4ISXOZs3uSIB/EqLLd5ew0qL2pICufP7osqeJf6be8
         XE9qLD8vOVQrgjeDCfOUZK6gS1KtLwfliA6XYE9FijQ8C+XlOniJbCpoxXqnHFhrHjkI
         hYn6AvJUSshnMbqRyxEt5dBvxBueUz9dySS0l5hnydmu28e5v1gf1wkQ1o38GZ3rJZFh
         +YytmPzdDIut36WCzGt+nwjOD9Zxy3d7G3c56TGrbnRn5Bvc86bJyunALl9Vj7wJNhsu
         2o5y7/ic1jaQaG5u1U4oX+ZXKP6GX6f4wTTAb+9ExhGvgbSeex8VAK6cjdloLeWxSF9N
         cXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793491857; x=1794096657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=onQ2T2Et4gZdcv3wTOM5R4NU3ERMzCKIhrlLawaSYE4=;
        b=ummqd5VsSq4CHMjHxn4tmufHrPGGtN7CMAdK2uYhs/EoBtiFzgx9PiKr8iz7YlTLDq
         6VpgT+SAy0jrqFqATinjrNLtZqg3qc+ZnpdVsX0XZY2hKTDujfbt1Rtcd8+usouX01/w
         fbCaPM4xUn4bcmgDrzKO9bIHnTzbjy+JPT3fbqQz9yqabwOWI99MLZhfpV/vYqtz1PAJ
         xSFx9kabeaQYFyeZQ297xkUW26dOWgxuZYCEf69Tx4p1O5Wc6uUw/saUtGDkjWSXaM/A
         FVbVU8Z0rY6a/Mv74U5dEjVZ53c1T1xpWPsXaIVdWO/Noon9arbbld5JyNjVQxJ+aO6t
         iD/g==
X-Forwarded-Encrypted: i=1; AKwUvByCu5s0pOSoSvg8Zh2UtX9mKoIA8JRDMfz8/tH7ipnOGOvCL8nXmha6uDRKyz/fDyo+cwIWo1uVeS+0REA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgs8HW9Lj36KHJj4wFX1DOHQ6u0YDR6Po2A72uJh9KfRxBUUOW
	bOivlZs4J6M2vsyYHPdkyAR7zTJ//I15ltobGsAyxFrm93WSA7/6ynyk
X-Gm-Gg: AYBFou2npItgC8lkm5SgIBTlOUtCn9PUWkcy9bcBfyZZ3OGt7B6TnRQ7xtaSEo6/MEv
	pfSPdjwjdDwpXrwFtqfB5EWFjUELtpqUu9o66wC4BlN91cHB8AkNiBK/cMVsbV4XNiWSxlgeLFE
	uGPmOMIxiXPM3gT1eT0m0CflEC8fOWnQ+P5PTtKi+TG84fOHGOTbpgCILImB/iAoA+viGvVxxu1
	6WXBsAz3QKcITeGy/B52L11F0BKKWYAbRj46FDXQfpJYV7rwCeixAe8/DbGhUnY+ry3GBohZ4Kt
	ASnLJzZtZ76INnSwjB97eJripW8jOn77qvSxVJtdGplBQM33o2iyvhUJxRfAe9yD89JjbV9VE0T
	juNtvumPXBM8VSAiv3RQ5lJSCLmJheKGB+2PzIwep9vA7AI7oZuI78BNCnCInsiAiITxx7+IEb6
	enDq0Ks19TUwYPzhMppkqnBsvoLP9Knl4ElyjCfwJqKiDS2fEb1uagIaDA2HD+ffd/PhxbZnm13
	FEICqoGYOC7ZF4NBnFEgvQPV9XbamPmb9bVoAqsWceEoSoPSa0N0WZoMP59fnsvVs04y9cqYPSy
	XeOfm4G+GgIMo7Og9zke6ntY3WUfsN8uiEKlZXGeCeiZndjYTXgOyDuD
X-Received: by 2002:a05:701b:2706:b0:194:3a84:e67d with SMTP id a92af1059eb24-1ac5cfe50dbmr9172106c88.44.1793491857357;
        Sat, 31 Oct 2026 17:10:57 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm18881921c88.8.2026.10.31.17.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 17:10:56 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: qmo@kernel.org,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	yonghong.song@linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH bpf-next v2] bpftool: Preserve unsigned enum values in data dumps
Date: Sun,  1 Nov 2026 00:10:24 +0000
Message-ID: <20261101001024.9994-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

btf_dumper_enum() always loads enum data as signed, compares it with
the signed enumerator field, and uses signed numeric output. Unsigned
values with the high bit set can therefore be printed as negative
numbers. Narrow unsigned values also fail to match their named
enumerators: an 8-bit value of 0xff is loaded as -1, while its
enumerator is stored as 255.

btf_dumper_enum64() likewise uses signed numeric output when no named
enumerator matches. For example, 0x8000000000000001 is printed as
-9223372036854775807 instead of 9223372036854775809.

Respect the enum's signedness when loading ordinary enum data,
comparing it with enumerators, and choosing the numeric writer for
both enum kinds. Keep the signed arm of the 32-bit conversions at
64 bits to avoid unsigned promotion of negative values.

Fixes: ca7e6e45d108 ("bpftool: Print the enum's name instead of value")
Fixes: 58a53978fdf6 ("bpftool: Add btf enum64 support")
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Link: https://lore.kernel.org/bpf/DMJE4YGAEGPX.2PIN4TJJ0AV0N@gmail.com/
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Handle ordinary enum signedness in data loads, name matching and numeric
  output, as suggested by Alexei.
- Add the Fixes tag for the ordinary enum name lookup.

For legacy BTF that predates enum signedness, kflag is always 0,
including for signed enums. A one-byte enum with NEG = -1 holding
0xff now prints 255 instead of "NEG", while U255 = 255 now prints
"U255" instead of -1. This change follows the current BTF kflag
semantics, consistent with libbpf's data dumper.

 tools/bpf/bpftool/btf_dumper.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/tools/bpf/bpftool/btf_dumper.c b/tools/bpf/bpftool/btf_dumper.c
index 3267163119dc..09dd428aa12d 100644
--- a/tools/bpf/bpftool/btf_dumper.c
+++ b/tools/bpf/bpftool/btf_dumper.c
@@ -149,7 +149,8 @@ static int btf_dumper_enum(const struct btf_dumper *d,
 			    const void *data)
 {
 	const struct btf_enum *enums = btf_enum(t);
-	__s64 value;
+	bool is_signed = btf_kflag(t);
+	__s64 value, val;
 	__u32 i;
 
 	switch (t->size) {
@@ -157,20 +158,21 @@ static int btf_dumper_enum(const struct btf_dumper *d,
 		value = *(__s64 *)data;
 		break;
 	case 4:
-		value = *(__s32 *)data;
+		value = is_signed ? (__s64)*(__s32 *)data : *(__u32 *)data;
 		break;
 	case 2:
-		value = *(__s16 *)data;
+		value = is_signed ? *(__s16 *)data : *(__u16 *)data;
 		break;
 	case 1:
-		value = *(__s8 *)data;
+		value = is_signed ? *(__s8 *)data : *(__u8 *)data;
 		break;
 	default:
 		return -EINVAL;
 	}
 
 	for (i = 0; i < btf_vlen(t); i++) {
-		if (value == enums[i].val) {
+		val = is_signed ? (__s64)enums[i].val : (__u32)enums[i].val;
+		if (value == val) {
 			jsonw_string(d->jw,
 				     btf__name_by_offset(d->btf,
 							 enums[i].name_off));
@@ -178,7 +180,10 @@ static int btf_dumper_enum(const struct btf_dumper *d,
 		}
 	}
 
-	jsonw_int(d->jw, value);
+	if (is_signed)
+		jsonw_int(d->jw, value);
+	else
+		jsonw_uint(d->jw, value);
 	return 0;
 }
 
@@ -204,7 +209,10 @@ static int btf_dumper_enum64(const struct btf_dumper *d,
 		}
 	}
 
-	jsonw_int(d->jw, value);
+	if (btf_kflag(t))
+		jsonw_int(d->jw, value);
+	else
+		jsonw_uint(d->jw, value);
 	return 0;
 }
 

base-commit: eaae576c34d7e001767b6845a5950b0b8db3e68a
-- 
2.43.0

