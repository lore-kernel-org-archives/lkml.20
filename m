Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361167;
	b=bNDwYocnJZEzwP5HcJL7mAibq633BKSoGOdMOdfmkiNnlgNobl7WHjnVlxXGzA1uMAxY
	 aS+1rTCW7poOgIPChY93496sHtUY4noH6Un+IxfC0oz1msZvXnYw4HwhU81Oqf3ustgxi
	 W4pCKTNCR4mhiKisI4LDcUJrnCCRDlxFV6GgM3xisoOte8knuD1U5yPU6q51lJ5St+FYD
	 vshvh5++GH/wIzpNE8thSRt2nr6hy4A1hQEUi0bU/RwsTwFe/JMCGbFyLfhbj2Ncre15C
	 1I07riS9iycP07fdGYlN4ph3PgTQCfBkJEJuo7GH9spLw7gPLHYx11BczVcbXAPvfhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=MLCHeRLnz6TqJOVgI/l/YrG6flGSfAttWQ6QR1FofSE=;
	b=EENDfo+DtZ2eTxthMRQtQ27rb6l+WtyOKW6fMTF1Rdr1CtjQVm3cARqYDIgCJbvpAx9z
	 95Jy6AVBEbO6lqdnRxkm2yHOcrE9XUFa80eBnlDkCam7oz1+6uM3BQxfKGa8TJRNT6dpF
	 XKybK4yTAVcQ+m6ilZJEkpVTY2PA7RFzPuuUS60DES831Ymq9jBlxxgAgCdglkRggxBXt
	 uJZV9tPbDGoaEL6tIcxS9y8foz17GUH2FD2qBGeoK+ucDOL7DBpKDOz9upHjG27PfIb3E
	 whXJYKxLlH4WuFvYuSI9bbNmdi3bJ1cpmnlemqhbC3ag+OZ/z647rrNKFoyh2wlWM0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPDkh6m+;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D81606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D81606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPDkh6m+
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-18cdcfc05ffso750700c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361166; x=1793965966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLCHeRLnz6TqJOVgI/l/YrG6flGSfAttWQ6QR1FofSE=;
        b=YPDkh6m+oAJvbeTzt33kgmOmHciaaeSywRmJEgVL4G/ARJI6ESMCQhZmyforfI0eLE
         XmnBGIkk0YINe7wGPQ6GjT6IZ0kFw8P9s0fd3abtkw+Na1/ly6jyaNRIwKoriQ1/UnnX
         xnUaAilxXi/DMTuTL6NjRLMT4qGXZsnCpAfVZ1gl3LpHj8el4Uua6MKD1q72uVT40xNK
         JgOmVC0sADYusRbRcsZ3TL7hNlGOH/mtQJlA0SSI7+a+hNqzAyGtC20dUdX4J+sEi09u
         0CshUJo2fmklnIiSBFGsbI7erDAWWq/HeUv83aCBrXCrL/2IEvwiKxGyMmosWUHrwG7Q
         Ndyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361166; x=1793965966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLCHeRLnz6TqJOVgI/l/YrG6flGSfAttWQ6QR1FofSE=;
        b=o42YBQbm0h/snFnSr7ljjP6HibHN4Q1n9bpYgybAlQqvE4sM0O46L9jTE2qq3rm+jj
         5W7klyZLruMZbgqZqBgXiaYOszygRRlK1Fpbf444VAEr35/qCT80uVot0Mktf4lWo97h
         /UcT1J+6nCpluucjEtSTMA6F5NwLJ+Ha8A2AlGFbd5Aj+OsqUZ40z1QRO0OqfnXfgAR8
         bjpUa6ZlLdLAwdz8A7avw5P2AvCRxaBvp3XdJJ47Un/nCAv6QRsX6Tz3gWECcAKOLFaz
         Dq4Q4lm3rRp4iZwBvetH2ohcNO2CSrCHn9pbboNatnCbwOFijbRf/jd0HICKcukTPZNx
         r9Ug==
X-Forwarded-Encrypted: i=1; AKwUvByelpTS5h2z5rBZnWy5AXkYIL0OxWqGx7SbMC11UHeNKkKeYWWXF5rFYSBhWh+BOB3Y5vNKiljCHhSFCwo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjFPS5Yi9VOpCgYQWoZ6UTNkrXAOf1gIJgzNlVBR2R3vGilenK
	aho1tLgiRBe0ShXBv4keXe2UCv54skseKPVRls1iDNBF9ybKJfhUPkWFg5JdW6u1
X-Gm-Gg: AYBFou3D0FrzhhqDpJ4F4Om6y78tohqi1xTigB5d05oN4xhf3JFi0KS9IyXu7sQk/06
	aNfaoIvziJBGC98s4Q1VGaEjvKACafp6YsGGDBP0yunK6UBJs5NOwud9b2YEb40qpT9OeTAD1d0
	0jYzMYEFzEchFesu3rMfF2JDxTnUA9mV3K2FTVCc0oRTiBwPNuAIqtc9JWrZflaVxi6tMj1jIfF
	iTivLh0LxIyJfwE3T5sg8UxdtneAH9tO4U8n1s/a9ueYr2oLAEuXdbxQJeN99C7pIADCXbPWKm3
	otUGVdRIXy0dRu/DQHe7Yjt8rSp7HlwxpJy9FF5OA5Hqt2juhZwSuHGQEk20moyrkos8BgRDFUL
	3D1pWhtr25y1adIhsoqyR+5EYCB6GSckqBQXGXVD6HXkcfu6SMBUhQPrZzWJURIpHgAdrTJ5KYQ
	xPOjUx3EspkDq02MFWoN7wqlqZRj4sMJ5FlD31ssTgLvRzbZhqDeaIBuFkI0eQfW+FhMTUseJSu
	zxJqx55h7RLimwk800bt8D0MCj7t6mwHfyAY/2uqSay3BwvJGA+qM9mA/07JGqD5PpeZALNZtG2
	EOTYrE/Jjd5flIekJRVDl8oQ
X-Received: by 2002:a05:7022:3f04:b0:19f:527d:96da with SMTP id a92af1059eb24-1ac5da7b145mr2871629c88.33.1793361166266;
        Fri, 30 Oct 2026 04:52:46 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:52:45 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:51:53 -0400
Subject: [PATCH bpf-next v2 08/22] bpf: Remove dead code through the patch
 list
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-bpf-verifier-patch-batch-v2-8-55cd43439f7c@gmail.com>
References: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
In-Reply-To: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

bpf_opt_remove_dead_code() removes every range of instructions that the
verifier never reached with verifier_remove_insns().

Each removal moves the tail of the program and of its aux data and
walks all of it, so a program with many unreached ranges pays
O(prog->len) for each of them.

Queue the removal of each unreached instruction with
bpf_patch_list_del() and commit them once.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/fixups.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index 1a1a374a076b1..95f4fe5d607e6 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -1018,21 +1018,14 @@ int bpf_opt_remove_dead_code(struct bpf_verifier_env *env)
 	keep_funcs_with_addr_taken(env);
 
 	for (i = 0; i < insn_cnt; i++) {
-		int j;
-
-		j = 0;
-		while (i + j < insn_cnt && !aux_data[i + j].seen)
-			j++;
-		if (!j)
+		if (aux_data[i].seen)
 			continue;
-
-		err = verifier_remove_insns(env, i, j);
+		err = bpf_patch_list_del(env, i);
 		if (err)
 			return err;
-		insn_cnt = env->prog->len;
 	}
 
-	return 0;
+	return bpf_patch_list_commit(env);
 }
 
 int bpf_opt_remove_nops(struct bpf_verifier_env *env)

-- 
2.43.0

