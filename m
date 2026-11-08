Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794106621;
	b=F/9W+us6r9wBJ2U3DqJIDGpmSnSJg2Wwe6B6RQxfPUDlAZA+7v4Sx++gskvS6CdQa+ZB
	 2EP+Jy+x9PEWWAayTdEW/6JZQ9MUIUvshPr15hnREAxzIj+d0iij5PE58Dor83ahz6lrw
	 x2sLnO/Ty7FPcrdVGTj3IYqmVQt+pxDo9iF0cn5tq2lBNlfQegL8LgXBqtZ2cTjrenQyW
	 12SzuJs3Taw7gPnGVpoOU2WKOkudsZhn0lwiAmxz6N5LFXl3L7C38ZAuai7/PR6WYv3XB
	 FOTp7W2c0natHhxyc09jDpDuuPQs4DOdGtaLC3shvOvvPh+963ZB8IjAILgI8K/QRxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794106621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bvSsXHgLF6kuuQ4pQY0Lp4DI1Bm9QjjpbUjDZ0uTeZo=;
	b=ELW59zFTVcihbXFISDzRi/oskJIJs0zC6ybs1OaZkrtLO7vBl4fzafnaOKhGMmAXONVC
	 2/UETQRfGwqOiTEiGscnDEWI5JMj1K6NtjFfW1y3wgc/maA4xk2i5SP7ho/pZui6gBzgT
	 W1AMLhT9MFzjUleOQzDgthKCGe+bhTbgZXoFO1ECDDKm4rp3tMAwwa3PRrCazJvmNtP+2
	 tRpVXe/l5Tndw/bU7T5gczVH59SdWA/uV2GVB/Gqw8BUmVv6TAqLD9/eep28UFEZtE1gk
	 qWWATebon8Ob0IFuEaSbtgza+Pezn2/PGkZWPNkrnJch2N/ydnX8CKTg78XluMZDvbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aZGS8xjZ;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E47606A33E
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60E47606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aZGS8xjZ
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-33e48934fa8so71290eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 18:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794106620; x=1794711420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bvSsXHgLF6kuuQ4pQY0Lp4DI1Bm9QjjpbUjDZ0uTeZo=;
        b=aZGS8xjZJksfJYKzfZs4giH+2hZiPcHfLatACHE0VeFsbi72N5654l/TzjxjuF1IuW
         jT4boYASs/6eFcQ4drsiXGbcTeM51/hAA7JbwGAbIcAn9HzZwLwtdkz5qLszK/I84IwZ
         tvN9b3lboPm2RwG1i8d9BSTPcUmh3b3F/OX3ovK8jBFUMdSMiqQoRGJPY/r+lKKLK4cU
         sukynaT3VDLtEuBwlXWKHTDc0APElDlqhBuIqBHO7xyKPmQ2rKYhRB8IO49ICF0XBsiM
         7C2kMpkV8I37G4xTB0GCbCOpBF2Ah2OeGVWX/3tbO5NmYevkoD0dbQLjHyvvrt4rZ3un
         gu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794106620; x=1794711420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bvSsXHgLF6kuuQ4pQY0Lp4DI1Bm9QjjpbUjDZ0uTeZo=;
        b=tDMLPBBNijB9QRXbuw3nmx298DKM5o2qyOrYoQRFvF2qYvDJnaQD0upLiA/1IdfaB6
         P+BcGHGX/PQs1EZ9f5+jCZki3JNWY60m3jZotYp5Si/o7MfFIKa9V4WlV3KN2zM+6qNk
         FjmYDVKqrXDv9vCksKaitIPwuxKqrO0tYQaEfu/PdOqrZfotJmVoioud5aVz6Pmor4Gj
         X0CuIo+IBWuHprIb0udfr8lm9w5xbgW2uXepj+2Jp9WrMT6hf8tMyMjwV/8VUMLWfvwU
         8Sg5S5AbnL+bLj0uN/Elw3QavZ5tt2g4LODG7Y4wfzkQcl7quIrYgUr6II+D+lBgJNYy
         zmxg==
X-Forwarded-Encrypted: i=1; AKwUvBwiYrePeJyEhcp1ioWJCbrH4dW24NzHjepWcS7z4DTFe4rMpCw8jfAf+ufzDZEZUYzUXjjuhiOQKhZWLpM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+92MYYPfrj5seXhsJFa3lKhFWKg2AuYS94A1smGVFMeGih5+AI
	c7X8pQwUZswZGsfJ/DpMoXwcU0oyqw0H7/dEKlCyqgTAnFp/T42dlObE
X-Gm-Gg: AYBFou34Ic5wGrqVv4j1X2O+eDnNSQetaH0kUvd6Dbr1KbwPJyT8rbdI81ABbDK6o7L
	sTi+200T1IokszGmfp2rgqlBYsFCYkQ0JOJYXIpIydyRKRQ43WAJ3qmdO3CYNU8j+5z3Sbp6gqq
	JY+4LgisXGvihaQYG3kCbViuMS1gul2wLm8GDJeaXY126WFaNbCDgL9jnv0Bw6R5oSBgW3hjEG7
	Y0ngo7UgMF0XJ5tE1bpVyeVHrzfMRM5vgTIrTuwgZfW+Kl37qDZArg0m+XPREKWWDAY9vKuPdsa
	jI+Xq+FyPZt3HGjUO6ThnP9R/rEY0euXO2pMsu7gnwkSl+tUBeUFgn1ZDsLqZRLAVaNYTlfGrxH
	IHmHgjaiFlD+OVxBd/XGeABiYCXV+3LosIlhnJl3r2p2qDbl+Vyoi+yIed/bfHmFdSePnZckzr1
	rPnAFG0yEgO9a4HC25Ydn0YvnspTGjgtdAUY3JeSBB5Q02pcZymRDGdRLR45laefX0nPhmb2Brf
	ixOKHN0fL646CUqfp2CPnAWJSkwHfwF68xFnlUcCCOvNeqhp2niNHaAvIRYKX32Ti7shdyoHOFF
	1m/mTc/BdrDKP/bDt4eJ7NpBR9AdEpWm4vbp8leRDJ2sty9xCbX2FMJkJWaPdIqFFLIDYsfMVKs
	EK5/605U1GMnrd49/trt62M42hL8zb5ufuswuDA==
X-Received: by 2002:a05:7022:140e:b0:15a:4155:3d9a with SMTP id a92af1059eb24-1b39fedf712mr599512c88.47.1794106620308;
        Sat, 07 Nov 2026 18:57:00 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3773ea50asm2241202c88.23.2026.11.07.18.56.59
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
Subject: [PATCH bpf-next v5 2/3] bpftool: Preserve unsigned enum values in data dumps
Date: Sun,  8 Nov 2026 02:56:31 +0000
Message-ID: <20261108025632.10799-3-dennylin0707@gmail.com>
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

