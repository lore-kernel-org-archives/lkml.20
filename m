Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792439967;
	b=Q52b+S2L7rCOnnn9wgcDHkPdT0WoGfJpQ5sMIDRqPCB7ost8LbWHLGi6pXFap1z/FK0I
	 SjA4FpoRyDS1ulavH9KncaAoZIK/IHG5m5UQu2zqDvjkhzJLatYBBlxXRH1ZKwOUW2P5H
	 gAGDCt7dpU8F7f3PD1JJGxZqmRUHSKGI3r7qHEuS1++uDYIysLMx4VMCPCOQGo7Gp1nBc
	 jCyz/Su1Cat40KL1iWPv1fIvHqQddOGY0fnmEZAw/pyZWXh+Cn6aZhUD4NPUW2OE6+8yf
	 rw6pUjhWQWQkknP3rBGSlViPfqOC/AmbZylgX1l213M3a92UqT3JfXJQ1eGg16ygzIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792439967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dTBafA1HBU6e1TqYuvQux9YV24HUZp1NWVg5MWo+jd8=;
	b=lmlKys8r7MuKPJLvvLKlX5edaFiBDTAYmvSjJjkeDaddcDQyuc2PUTnBJIEihr1PlR+8
	 r+3wkn3bnMSq0A6cUVVLTcgm28FbL2w2T9259bRrQekUiPX5oGAJJ+EEY7oxPbmcBMI+E
	 +SfXj8qUX0Tdv6M8ntAQMb3DQeCymP+retN2quQPIL1eQpsAABhDCvAj+sjxzMCN8B4oT
	 eqN53pc2L871kvn7HibKcaNEjL7qsb59FxqFv+rC0dMtli59jqYD27T7DZS6r1mf0mNum
	 q4L0ol8+vyez1/vuscc0vrM3bFAMfjOuHkw9H+ozprHXg0sjaMzAlFf+EwYbJnZcsjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YfEkR3lZ;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22565606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22565606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YfEkR3lZ
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e04773687so664836f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792439965; x=1793044765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTBafA1HBU6e1TqYuvQux9YV24HUZp1NWVg5MWo+jd8=;
        b=YfEkR3lZ8U3Gllaj+ZiNbnRUyAKxNyhzqduUGbPQAH37lJcQId1iTnGRtbudgCuNnV
         FIC5HPiV5zE87N0ctGaKlqfaoe++UhyLF7TwDHZhn8rBzn2jtO0U/SzcCEd/JtvGQhKn
         Cd+3gsrA3O54n0pQSOjn3EAtMRJxlHedIfCbv5Lj7DZY+vU+1Xhy12JAJO8x2kgOfISf
         S0qb06JX5/xlBwdqz1Ut382V+gVFeySubvQtXAjn+/YYm1YvzD3tDRJrynx/2vawrCcf
         Cl57k5Lq5D3N1iZN8MAdJqKHKZs5ZlSNzOSYP+QBXvuKP3TTwQCq9+FwM2CBXBIbmPhp
         PSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792439965; x=1793044765;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dTBafA1HBU6e1TqYuvQux9YV24HUZp1NWVg5MWo+jd8=;
        b=1hvA0cV5nwxeV4M4BfCh8WQ8gttORKp6to2eZ9wQCM+kf4nBWl2PZkzCN9K9dqljSz
         nQTGcoStI8MTSUwc6hN87NWz0FVt1PMGyfIeC2x/O2gN2GkFAYRdxmtg0O4TbVtbWoD/
         qJYTJmBKoCKZ1/qLP2YqD3r61wg0L3yXYceqhXrSwmZqK81g7Z5nwpFNWcNK2C94BQOt
         2BdNU0NER8HPzcPpj58mGoCl8dXWdhamWkMjjrRIcidFTyChPAh8CvMtFgRfIVwPMtbX
         yKgdR+U41OEJcysWHZyRaS9q5s4vRTqcR6wkXV2EIJQNj+j6nX5Ag7Mwd5DwowDtlhsE
         pejQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEapN3o5wHxMPcOvXAmktVbJr8+hIbVI6XY3nT+bIQlYuxQuBF8W/cnfIwq5jCBWADT4UBK++4I5Mrymo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKw7npAPGYchaZDY0CNvSXNeW7cg8eT2qIN82Nhjk0J771jAqyb
	LeUyeCpY9d1IYA6y7y3aTUBTLZcB1vmU9TR/bLk4uHnqXhDMYH67P3ui
X-Gm-Gg: AYBFou1i000H6ex+9Rp4kgFFytDBlcsHf0kDRQzAdTnZLISur/lBi4CB/r+ih5v/9I6
	HCUeIMmfmG5q9qv8HBgj1D3Vv/SaNBCT93M9DSFmjslZQjQZebSUJcWPA+qeLFgWeclYRcT/dnK
	ZtGfufchQIIV3xgk2+jCRjh+EkGQJpfGKq+9pYKVkxkFgVhoALfjmdNg5XarGleiPk1dF5OM2Fc
	7iX+ya5SRcQ+XzlICuk+g39UiWrszbAGqRO5Wi0RB2Q5zO3nbI7ZFqZsfSSIG5LwCvU5w9nzf3h
	6tFAXNHJ+e0l5W7251iJtnxIrSR6Lv+Kupbx/LZsRD6yCmb1dA9kG3XZJUNDrxd5yWgcxsdMRgd
	/9a8D2KwRWkmiPDds8cZ46jgGWgQOebXO+Gkf7lcvsZ44Ens0shNNh79Dn3hh4BIslX0+cjpSLE
	ogEzS4o5phKCRDfQfSS22/1k2kxLBhe3rNMMpzp0mQhMVf33bAYhvQVd//zWOysYtupQnfxgq1p
	8Xnkh8eikY=
X-Received: by 2002:a5d:5a48:0:b0:487:169f:d339 with SMTP id ffacd0b85a97d-48e07fb8f86mr12588654f8f.54.1792439965195;
        Mon, 19 Oct 2026 12:59:25 -0700 (PDT)
Received: from ADRIAN-PC.lan ([171.22.87.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d823ca7sm875448f8f.38.2026.10.19.12.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:59:23 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: [PATCH bpf-next] bpf: Add __printf attribute to bpf_diag_source()
Date: Mon, 19 Oct 2026 21:59:16 +0200
Message-Id: <20261019195916.186225-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Building kernel/bpf/diagnostics.o with W=1 triggers the following
compiler warning:

  kernel/bpf/diagnostics.c:828:9: warning: function 'bpf_diag_source'
  might be a candidate for 'gnu_printf' format attribute
  [-Wsuggest-attribute=format]

bpf_diag_source() forwards its format string and variadic arguments to
bpf_diag_vfmt(), which is annotated with __printf(2, 0).

Add the missing __printf(4, 5) attribute to bpf_diag_source() to silence
the W=1 warning and enable compile-time format string checking for its
callers.

Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
---
 kernel/bpf/diagnostics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/bpf/diagnostics.c b/kernel/bpf/diagnostics.c
index 0abbbe177e..2421f52eec 100644
--- a/kernel/bpf/diagnostics.c
+++ b/kernel/bpf/diagnostics.c
@@ -794,6 +794,7 @@ static void diag_print_insn_context(struct bpf_verifier_env *env, u32 insn_idx,
 	}
 }
 
+__printf(4, 5)
 static void bpf_diag_source(struct bpf_verifier_env *env, u32 insn_idx, const char *label,
 			    const char *fmt, ...)
 {
-- 
2.39.5

