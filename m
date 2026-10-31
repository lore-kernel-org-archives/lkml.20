Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793486198;
	b=OiIoyd2Hk8dXnQshazf7VF2FwZfJws67KlOzU/9HtC+lU/Lq9wc3WvSEpSzveW1rEM44
	 OXH+sbWXDiVW+dzGSHbBwf5sPu4d3zi53JF9UilE4+ZfhywwX4DxT/psggod7KYTCZhk5
	 vC7DtZtP+CWKz4oVGHKI4KF0M0e8ol4B6AxyGzsTZevIxVzGv8qQ59lAlK/kuGliKfFBd
	 q34rZNgpGV22ONXMnN/7SlHiJX1K84og/mNkCHP9cvtUXzt2nAtNFQPOoOfs6+7cRhJNq
	 uP9ymfC2hV/NEDtHNh2l8hwcJJKgE8kXEAPEs2XaYxZtzZRWz+ys9zTa5+eYalfpq6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793486198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bkpWIEHziPjnT8rJEJwToENhjzu687upk8/9/pEsB7M=;
	b=yiibOdoH5K16XZ2hgfNTg+475XDALAJJfGd+YybxZ0NGQg/8XAFVPTgCmZRXrYZngc3t
	 PbdUq3XLny6WY5lgSZoJWtahdA5ywo+usosOcNrpDDnJtLfPDijGt/uXyAuzkIeDm8c/h
	 dizhbS5zqrTMMG3irHCbdwZSP4CfwdpQVHIjCLWLcBa0qjwCjXNtNwC9st5nVEMwoH14t
	 NLYUFJa5amqKoLHWXrM4yUzI5CJs6NlSXBD/i0XzY5tRByT8AFuiaNhI7hUU/pAUH2Ez6
	 B/JII5mBKMr2jsRhqmI0C2cUz4HXZEMxgj2W57kCFxYf4/IFuaupP8I07z+aI3Fo27g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z9N1huY7;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064DC606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 22:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 064DC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z9N1huY7
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-13985f8229aso2165231c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793486196; x=1794090996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bkpWIEHziPjnT8rJEJwToENhjzu687upk8/9/pEsB7M=;
        b=Z9N1huY7qFESMQyI5LNoW0gz2mla2DzjhJYIRSqot1aSHjD6tHBCrXorjvGTlGYNaG
         i7kqfy3So8cJxayW/LGjK4NV1/5D6wimZBSddgyiKKQXdf4QCn9LDt8lIqrCkVbgB2lk
         Nqgct6jsUWotIAI9U5HBZTNtkUGykMehFtNcrI34/b3d0QQLCQknUj79fMNgiyJ2sbBd
         ZgU/jUlnQHHXwjoZjBq//Bqcjf41eTvCoWjPgj0670NXLgrYGsh2Fy1N9y9JW7O8nT+M
         01EBMJ34bjcejSuMNmEj6q8v4z+AuZZ4QALv/jFtW2q9teW+6TwUU7TWLQo9Q6WHkDBb
         mwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793486196; x=1794090996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bkpWIEHziPjnT8rJEJwToENhjzu687upk8/9/pEsB7M=;
        b=Cb7kyezs4A6eGDbQVkAfhA1ZrezUDhFHdjWBQGQvV3iT3MjwT8SE5356ULytzJB6AV
         kpeOx4cv0fgrV6fo+b3sPkJ1fdfPQRDad+UsANOA8wvy07FBphOaFQi2b/TEF41+Sjs4
         fST68A+nXIAi0EyfBjxCw0ElZ5SbZRe/LnLlrTziAtWtDFJdpqEj0brbWUrqLiNJE8ZA
         +SJuF7xr4HgovYyD2ky1ZrfS6H9imznD74JzXcCzM9TK9jGQr1YBhCl0Gz9QQ/RAtYJ9
         IKR5WGbMgfqB9R6Vt1B8nA/YBSdem4elUYCbzzfpgFZpc44zsI6dIamjBq0MfR9Jm8wk
         pgDA==
X-Forwarded-Encrypted: i=1; AKwUvBwg3rM/WTYbyN1e+b3ZkLlPlUigMUHgyrGkMvIqP4c6PiNwPWB7HvrUjAkfS3pkDJrTCucTx5r0iqI0fY4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9RUAC18dSZgG3ibnu2tsBvCvG5r+JDAxagQw9ZTfbZBw4+mpB
	PliEusgf0+zKm0A4II0mg8wMDUOAPVXdeJZ87M8te1dP1DYMuX2YRGQV
X-Gm-Gg: AYBFou2anLY6M71BLEFOXJybRFa876I4ygXwwCul//sRUhfv37cM254kcE1tFHx73th
	OXe2hNRmbDRB4tRFi10gg60Jx9XZfMOCiZihyf06NdYHnmCLkadG66p4fioL/h7+9Oln3esUtj9
	O2Wb6eHFMDNQNJBbB6cIfDHM8SOMykNS92ATwhguSbr5qJxT9xekqJ4tCoStRWUealAILtZnniB
	kdUrWZaL7ds8qNVubS4YUeTxy8VM5lJKPFX4UAxudvdTWXiqlXpNVEU4Nl3zyzNxDZmo5TaYI0g
	nA8+HuKhlhfcbSQkyxsol8vaL6TJYjrfkGEFepwb1pY0CG/YqBi8vl0OfXxL4879iKtMOH4zeUe
	ZmrMWnaDxGlUD7CklHuvBVeMvO2d8IhJyzXMjLBDJFPnDDPKNmhfDkBw5C++3ogb19FK2Pd/0uf
	E3v8/74Fbqw05M9ZLLvkUhDoyQh5U7yEt4QGhSZ7tGV3wWgxsYyE6YurTvz8/sLrY/V9SmlIYtn
	uyDUBzmttrEigls2Qu87JdRfoYRq6FyRQgY3CbZPYm+KLNlZe3Fvk3mLjUdL/sDF9YLcmCxa5wJ
	S6YOD4UbcOOH+UbANZQKLdXl7Yu3xtdlqAzGBsfF0/oOc31WKADSaYWf
X-Received: by 2002:a05:693c:65d1:b0:36a:3407:26ed with SMTP id 5a478bee46e88-36a4243cd68mr9092660eec.34.1793486196026;
        Sat, 31 Oct 2026 15:36:36 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca82sm19959967eec.0.2026.10.31.15.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 15:36:35 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: qmo@kernel.org,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	yonghong.song@linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH bpf-next] bpftool: Preserve unsigned enum64 values in data dumps
Date: Sat, 31 Oct 2026 22:36:16 +0000
Message-ID: <20261031223617.367-1-dennylin0707@gmail.com>
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

When an enum64 data value does not match a named enumerator,
btf_dumper_enum64() always prints it as signed. Unsigned values with
bit 63 set therefore appear negative in BTF-formatted map dump and
lookup output, in both plain and JSON modes. For example,
0x8000000000000001 is printed as -9223372036854775807 instead of
9223372036854775809.

Choose the numeric writer according to the enum's signedness. Keep
signed values and named enumerators unchanged.

Fixes: 58a53978fdf6 ("bpftool: Add btf enum64 support")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 tools/bpf/bpftool/btf_dumper.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/bpf/bpftool/btf_dumper.c b/tools/bpf/bpftool/btf_dumper.c
index 3267163119dc..88c0da29f246 100644
--- a/tools/bpf/bpftool/btf_dumper.c
+++ b/tools/bpf/bpftool/btf_dumper.c
@@ -204,7 +204,10 @@ static int btf_dumper_enum64(const struct btf_dumper *d,
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

