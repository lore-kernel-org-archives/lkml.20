Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794609308;
	b=AuAW0wv+Cz6yJMIOyZANL8/lLSERzenhl53MdQ87WfWZhB8aOsNy0im3Xno6T1NacYx2
	 btoVmgQCajIOn1Gx3dPYpcIk1hllu+PMksKBRCF7zJl6plEx6r2yEy6mHV46GUeY6qRI3
	 z42TrWEHjwJ7/qEudIa0H5+toGULMn8vF0owI9n4qsrxgnvuJTZMX+Nv+vjuMAXYsWHZm
	 qe0XvsrEw8+kTnyGbH+69tWVAQ5RCJlqFQKYmPbd74wjjNsjF2RKFFTdKR4Q5DmyGKLvg
	 jN0gp2BSCvgbAUNb+CSa9ZstFNyyP7DjMUi/CEqm368QVoR3YWpIq4Nqbkl3oz+iuHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794609308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0hvWQVj0nsGSKlzOns7G+ymeg0cenh8W4XpJvdH6lPY=;
	b=QYB9VulEoELEkhM9iGcbypAYot4ccWywRADJz5RtAUOGK+u6TpM6oU5FwMQ5FiMA9aB0
	 MyWrNTh0FqkvDXO8uWe64q6gK+z2PU9hVKCpMVWai20j2MlpVK9/EHMWhDXonfxvY741m
	 yHaB+p8Eg/aDGXRnbfpvMpPNWjsMpZchZtJoH3yVsLtF7MSZAW7s/tThyd8YOYq3tUW9f
	 2KV2FNosBbv6p+8v5ryAYC7La5o84riXXsJqAH+2QO680i/emH8YX9Cc+ENbLDqh8p/aa
	 ih4FQWWtnt1dwbI+yNuULV9gHnMHnwcy6D7ugcIWmeRcUuV4b44vRsFDUu1mtFk+acw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="X3dA/KZQ";
	arc=none smtp.remote-ip=74.125.229.131
Received: from mail-dl2-f3.google.com (mail-dl2-f3.google.com [74.125.229.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67033606A57C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67033606A57C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X3dA/KZQ
Received: by mail-dl2-f3.google.com with SMTP id a92af1059eb24-1521c45a248so1055796c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794609306; x=1795214106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0hvWQVj0nsGSKlzOns7G+ymeg0cenh8W4XpJvdH6lPY=;
        b=X3dA/KZQNcNBuGauOycccpriWdEWOwWQrH/qnEHKx96CzctrISCN02mgbMS4Ensak6
         u05zcItt/ifqRYISa+yOKWvn1JDDqur+BP6PGwuS2wplACDKTABC9moZ3Qfs9Do3jFDo
         H61qHNcoaqcssq2t73QP/KpW40BD4URfDWcbxPi7Li62+O3QMiCvQ2xAvrZlMiV1tW47
         yHd62vwkDAiwXMBUGcTL7hrx8KZpBv3EfkeW3cTznh3qxAnx0GHtGbCfPSwLe/7NwH9f
         cE0J0rREW9D/tVg1MYL8ZJ0DkMO3BCYMytV3M4qkwD8cuJgyVC5KTSC5ao0E61wpUqOh
         L2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794609306; x=1795214106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0hvWQVj0nsGSKlzOns7G+ymeg0cenh8W4XpJvdH6lPY=;
        b=a8Y34vENbTonhrdNQBwE1a85IEo9Yu4sGok0PriiclhK9PDQNLUAYgkKnoKw4tMy3o
         ictSpcHAXH8Dc9lBCOmSGCmqDixQidbUHPolkzQjlq4Ld82SHtyfEd6w1Abu9Yrza3ln
         nTF6g6ULXHvKBzAgxtNYDSIAO3+81ZibIkeNyC/jZnJQtfBFpEwsa2vLBrP8SbusLOIb
         F9yyJdBzhv6f89ptLARTHvSiGgPu3lZH5fSm0kf4JExUMNAeb5VPtIkBa57Wb7MAAM8G
         IhAY9SCDeHwGIuOyPBZOFYQBgvvNoJRiVO1fSVJdxIlnRVfcr9zjP6noyZO2JrlaDVF6
         8tTQ==
X-Forwarded-Encrypted: i=1; AL+hErHAEPBTlUrV4GXfvCM98esMRWueQekwA6JV7f1PfMVBPM3/2fJbofuDtvYvOp14O7R6jj/5ZhEswaKOj1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fqMVohMu5QRjX9sJrMYhhplGwR1Ifvqhep18EE4llRZzjM1hc
	ijLYB5AzSvamvU2W7wP2A7PJP7m8SLE5b2gQuhNUTvQpxVBa40XOQmtB
X-Gm-Gg: AYBFou3RmszAKtFe/b9oEsSBivE0w4MjhVoQjArRJJfAF/fRr9X8M+xZkhLmHnOPsri
	4sPBImAD+BmUt02k39YiLRENiebU6EQF9La3kfuPdOQTbCWJUXY3DvWYLpZd01qNWjQLoVhILbA
	Z41h68eCNA+oXCy0Ra2Oc86fwkUlzq/6s/CEmCbhaDeCNYlBg1dLHLJIMEMEvq1ZorTnmnFmncL
	/DKg29aodDECelYeKbo9VZmlJ19Ex79TokDPD05ULLHXv5uPk+l+Ljuejeh+DoMFvAeyk0MEJGJ
	KE0Ur5Pen6my3WzpcGlJMD+n9xpJ+5MAdYKh7hOVXRrqXumpMpgLe8spW47X+f14Yth2LmGX3ro
	LllVh/4vZzHNFelgO09BQXZ8cbS3SQv31GQW/+ecyY9NJaiZR7YYAl7u9YYIwe9FgKUypjC6T6N
	gKefbhJ0GT4CEfqeCU4RRil+mJIKrndcm/CBYZfqclwMTjay80f/Y0kidLM5abfvQtPUTwGKJXU
	6pfuk/i30LjhJf2AZStFoxUI5vBhjASVBISwbYmKxEHSTpJ7/VLroJl2UNaVUXeE5QI4b3M485/
	QPJkCQqUoRHrrhmjrPIDGoXFmqMdNtXxQe8XOzeaJu6ooSBm2ArOw1kiIN+9cgWh/OAJQjTxAvw
	CYlTm3T02TmUZPlIfJYuXBQbbbvYyAsxZU2yguQ==
X-Received: by 2002:a05:701b:2706:b0:196:e254:db24 with SMTP id a92af1059eb24-1b50312f0abmr3427329c88.21.1794609306455;
        Fri, 13 Nov 2026 14:35:06 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm12003501c88.5.2026.11.13.14.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:35:06 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: andrii@kernel.org,
	bpf@vger.kernel.org
Cc: eddyz87@gmail.com,
	ihor.solodrai@linux.dev,
	ast@kernel.org,
	daniel@iogearbox.net,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	alan.maguire@oracle.com,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH bpf-next] libbpf: Fix sign extension of unaligned enums in btf_dump_get_enum_value()
Date: Fri, 13 Nov 2026 22:34:49 +0000
Message-ID: <20261113223449.97604-1-dennylin0707@gmail.com>
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

btf_dump_get_enum_value() reads unaligned enum values through
btf_dump_get_bitfield_value() with a zero bit size. That path
zero-extends the value instead of using the signed loads that are used
for aligned data, so a negative value of a signed enum loses its
enumerator name when the data is unaligned.

Fix this by copying unaligned enum data into an aligned buffer, after
checking that the whole value is within the data, and reading it with
the same loads as aligned data.

Fixes: 920d16af9b42 ("libbpf: BTF dumper support for typed data")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 tools/lib/bpf/btf_dump.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/tools/lib/bpf/btf_dump.c b/tools/lib/bpf/btf_dump.c
index bbe86928b3ec..30fe3bb48df6 100644
--- a/tools/lib/bpf/btf_dump.c
+++ b/tools/lib/bpf/btf_dump.c
@@ -2329,16 +2329,13 @@ static int btf_dump_get_enum_value(struct btf_dump *d,
 				   __s64 *value)
 {
 	bool is_signed = btf_kflag(t);
+	char buf[8] __attribute__((aligned(8)));
 
-	if (!ptr_is_aligned(d->btf, id, data)) {
-		__u64 val;
-		int err;
-
-		err = btf_dump_get_bitfield_value(d, t, data, 0, 0, &val);
-		if (err)
-			return err;
-		*value = (__s64)val;
-		return 0;
+	if (t->size <= sizeof(buf) && !ptr_is_aligned(d->btf, id, data)) {
+		if (data + t->size > d->typed_dump->data_end)
+			return -E2BIG;
+		memcpy(buf, data, t->size);
+		data = buf;
 	}
 
 	switch (t->size) {

base-commit: 0021f17128de5dc0b19f1a523f448df2440d8088
-- 
2.43.0

