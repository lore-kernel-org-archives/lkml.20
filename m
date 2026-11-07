Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017257;
	b=eoncQZUL1n5lSFUkF6pbTmSSawWOk6I2kE+jaV0V+RGJ/tvqGWfPK2PNWMdrEn3ABut6
	 zWeVvX8gMuXO/Kz6kRfQjkR9SPy1srPlMQgRoaWSggzSVVcS/1tQN/BlxYQe3U0024I8+
	 FmjlCACgccnTgfLWJWHKiWDZ0XAQ4ULWl7/YibgNkZiIn8HbaYfO1x5WjeMQ0TnbhJT81
	 sWpsvGj2mV1ZvM6+fKF67QMrBWX6oYYW4/mXF+ln2ZGa5d6GhW5cwdTLBqv3LoNjjTfts
	 xHC7q1DKZ+QC6GZo0KRoN016FaqNavNHqy2KYjN25CBndoZmf8WtNbOwdaAycx4i/cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mvQm2BwFx3voJ/6Hs8R+Bsn0Le0ol9eYlfwfURLYyx0=;
	b=ZRHKJTXi1bNNeZIV00XK1rg0+Qio0cqDL4wX3bvO5LYuh9iOXhqauevZxFRtRRVGJi8k
	 Ag8eZ51iRgOtdVprg1Jh+3U/J/mrTasafFrp1Dx2B3kJx+Goy+nrjfxhXTbVnJdI3tnhi
	 DfhbEKj0wVcMG1dWUOd7j6z7GgeVFPy3RoJ5WMw9lqTuIUBJ17C07aR9dj8Hjf6H/Nh1P
	 S4azdqBiPgni8MWR95MllIp9pN6kNbP4x6j1jq7Q8GAs6ISXg30Uw5/Ntvl5jl+vFNJLS
	 Z24OhSefE7Ty3liGVAZ1yPxZXwdOAG+QxcTbxG4crs+tec4K05zUkUMxGyAIM2gylAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbLGNDZt;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930AB606A33D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 930AB606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbLGNDZt
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-139b659a45eso223154c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017256; x=1794622056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvQm2BwFx3voJ/6Hs8R+Bsn0Le0ol9eYlfwfURLYyx0=;
        b=TbLGNDZtVU7LVHrq4j6stu29IcLKbMv+plX08ZPQ3InY1/vq7m6W/HaWNtJoZMDZzU
         G6HLIx7nQ/gyTiGA6sg2z925N+pN2qC1zLm1cJOJB77igLw77VQHotNrmCBawfbBDI4W
         vAVm27rT/VoDieT20VKetRT6NYXz7GBWgSAqb3zcdxwmZnaQ+619h+19JyIe794n0Uvu
         Is/l0Wr7vPV6bmP42WIi0L0WKXnEOvhe+vhl6e1wT/BbXjn9VttFqjQDVnyBQNk8fcT2
         a9sYoacznRQLQmIYJjwuzP4T3/tu90CUQ4aR4Sm8kvgQFJoKjOMLTALHQuHEf61M72e2
         rnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017256; x=1794622056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mvQm2BwFx3voJ/6Hs8R+Bsn0Le0ol9eYlfwfURLYyx0=;
        b=XdWeER29q0ccuuZy7+XAaO71z0joyJ+pqckd3QJ35+T/Ku9O/sDllWCVAoIMjOiCXe
         hbPrt3RF9aThorNGM3X/vQcFK8Qgkx8adqLeIJoFlZlSfhEqxI1zucUDAXbaPF7ktSms
         K0ghUVTo6dtsnP+OZ/+5EzOXl6cCNcRv5aMrKHSAyW0E0eTMjhQgHzuhYg6drq750OAe
         UMqM7ELXC0371pVCV2oir/AL+nkAJgFq1MJuG51Oe9a/0yXmo3+3hWpFLZchPcVaqRou
         aHF3V52D0uAjGghF1fuOp6HlP7XiU+cIj/aqmRr8IfFXOZixtTrBD0+RJi98j1lEQTAq
         FiLg==
X-Forwarded-Encrypted: i=1; AKwUvBz1DJXA+xr1mEHeRT5QQs4lZs6qoZghIUl2WbvWq0cLIMWnZUq5oZW1775BjuUkeaNDB0TeV0CQ22enOxQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8grjibttcnuD9a0emKugetD5h3YC5mK+edw8gACpE2mdp+hwcQ
	rNs3vB4AjUVbUxH0KzqHjACuux3kBBBzkmA80fqGfYe8mn6QOMOuvdSk
X-Gm-Gg: AYBFou2XKl7wMzQO03mAxw7Qg4ay05FH13hCynm98rLsLHzfsakpcERIU2LK1MGp6/6
	Q4HR2A1uNrUkTWH2z1mmgbo+KBBcO/FXO7kK75Rm7JaQ8mGbTfxVI//xR0nNC+1Vz9FcFe/j7C4
	a6wSAXf3lJAXzk/YMSb8YCtltj+776r9RZBCSIFmDg76/gnmPm2ExsJdVVePP2HARHZM6jYjbpt
	Olh79/KGo5BochhdOPbmpEU3OSgL8HUJX2XzrwEJdTuY1tKCgekIN3JFH/xxw+EE1acV4108hG2
	gOtAdsQAgmeK0BBJtVa2xjmW+BAkJPoCL8hLmtUkNOfiL+fdlVIbqVEu42bj2IQuZYQgkZRNRTY
	jYlWZalVUAAZIJo2k2Wjk4T00mLQK2bxDshijgGaRtUv42EJ1/pWCy9qOmlikcIiO7y3MqwkIdo
	QjYfhDZLu1Jw4Zekcc4vXFuDz5n1ZQkhwSC90Y/Lvbb/iGgkfn4Mvv+ecLV0dVyGYsNusYjemyt
	Im6MYspLhDcshiTqXDBQUEfH44eDuTu9fKRXoG5inQ3yvlAnMyxhXByCFt8gbmGEBKwtbOzNb5L
	6r1BkV+FbnTaM5jFZ8YjVahb56OcfQZkpl1bGXfsiA6JWFoCSYMvt8Q4snfodB51MPNo+yx3cTd
	au8dq8Jc1NZz8NHcf9uiHGWrOEp08jDA/zmCBOQ==
X-Received: by 2002:a05:701b:2318:b0:15b:afce:62c2 with SMTP id a92af1059eb24-1b25d359e6cmr6341135c88.41.1794017255593;
        Fri, 06 Nov 2026 18:07:35 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e485ce2sm9338497c88.7.2026.11.06.18.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:07:35 -0800 (PST)
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
Subject: [PATCH bpf-next v4 2/3] bpftool: Preserve unsigned enum values in data dumps
Date: Sat,  7 Nov 2026 02:07:24 +0000
Message-ID: <20261107020725.36675-3-dennylin0707@gmail.com>
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

btf_dumper_enum() loads ordinary enum data as signed and uses signed
numeric output. Unsigned values with the high bit set can therefore be
printed as negative numbers. Narrow unsigned values also fail to match
their enumerators: an eight-bit 0xff is loaded as -1, while its named
value is stored as 255.

btf_dumper_enum64() likewise uses signed numeric output for unmatched
values. For example, 0x8000000000000001 is printed as
-9223372036854775807 instead of 9223372036854775809.

Load ordinary enum data according to kflag and use btf_enum_value() for
name matching. Select the numeric writer according to kflag for both
enum kinds, casting the value to __s64 for signed output.

Fixes: ca7e6e45d108 ("bpftool: Print the enum's name instead of value")
Fixes: 58a53978fdf6 ("bpftool: Add btf enum64 support")
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Acked-by: Quentin Monnet <qmo@kernel.org>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v4:
- Keep the normalized value unsigned; cast explicitly for signed output.
- Remove the signed-width compatibility comparison and match-priority
  logic, as requested by Andrii.

 tools/bpf/bpftool/btf_dumper.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/tools/bpf/bpftool/btf_dumper.c b/tools/bpf/bpftool/btf_dumper.c
index 3267163119dc..a7171622ce57 100644
--- a/tools/bpf/bpftool/btf_dumper.c
+++ b/tools/bpf/bpftool/btf_dumper.c
@@ -149,28 +149,29 @@ static int btf_dumper_enum(const struct btf_dumper *d,
 			    const void *data)
 {
 	const struct btf_enum *enums = btf_enum(t);
-	__s64 value;
+	bool is_signed = btf_kflag(t);
+	__u64 value;
 	__u32 i;
 
 	switch (t->size) {
 	case 8:
-		value = *(__s64 *)data;
+		value = *(__u64 *)data;
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
+		if (value == btf_enum_value(t, &enums[i])) {
 			jsonw_string(d->jw,
 				     btf__name_by_offset(d->btf,
 							 enums[i].name_off));
@@ -178,7 +179,10 @@ static int btf_dumper_enum(const struct btf_dumper *d,
 		}
 	}
 
-	jsonw_int(d->jw, value);
+	if (is_signed)
+		jsonw_int(d->jw, (__s64)value);
+	else
+		jsonw_uint(d->jw, value);
 	return 0;
 }
 
@@ -204,7 +208,10 @@ static int btf_dumper_enum64(const struct btf_dumper *d,
 		}
 	}
 
-	jsonw_int(d->jw, value);
+	if (btf_kflag(t))
+		jsonw_int(d->jw, (__s64)value);
+	else
+		jsonw_uint(d->jw, value);
 	return 0;
 }
 
-- 
2.43.0

