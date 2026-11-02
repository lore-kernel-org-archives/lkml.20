Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648515;
	b=Y6iFVvMaOaGOLK1IPlhx1SWZf9Rk59rEnqExFKz4IKDAsgZ89v8eYvCbUWjmhlI6kPKk
	 8ZjIbIjnMpUK/1IUOuNJqO2c2xO9bhY0Dn8sNaFa8c3o278znFN4Jf0ljMHAuimFQP9DQ
	 1J/gZ2OtxycvUsTA4AtvpWLswWM+G+ghRgCl4o4SUicFEsxbKJTb6mcfPTaoUQCL+taAw
	 jr0z+OuinYbatrgErYGDehCk54CPRwZGNhVdU9zZZzzHBj5nql1AWB9wOkxJ3PXZVZ1wH
	 I/glAbMm/dolp4pxbfgqjAOL3vsz/6pkg6X0jbvnxTXNGmibow7sltSlVkjGgql907w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MlxGrO4qVY13JT+narJGH0GFq85Jy87gUAILKXGl+Ms=;
	b=o3TImVAvxBPL7qzlPIsuCS9VGLH8SOWYM6fd2qg45+gHqmssjj+lTMpg6nQJ0llw09L5
	 pRibmrGhGXgUYAlqs44V0bWHd0xMqzyT6qie43LiqBFc4zj5UHtlLMka010jCq7BCBN8t
	 1WSWTvT9zi9YI9fFzlgVm9ZoJKXmkPDfaxhEehqTEa6Ih0r76EVQJ9xUFlPznzFtO74fQ
	 X8bQ6mB4/wmNTxTa65DHvYzfWRkanmPP1zmJNpZTHQAgBDN6KhX6i4Aqz8d4Wu8qIVY+Z
	 +gb15dhNYxsSjM+g/EE3mzhoTgPsQ1m71G1OPTPHaKlTbkrCkWMCTl/WwiBmy9N1kow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QcDzCNWM;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ACF606A336
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98ACF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QcDzCNWM
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so20759025e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648513; x=1794253313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlxGrO4qVY13JT+narJGH0GFq85Jy87gUAILKXGl+Ms=;
        b=QcDzCNWMmAKVwvWckR04y20Nz6TYmmXMX2PW1oRXh4Tpc+tUqtSLgJpckrGxox0rup
         CLJYVKN8T8hcDixLwoHS0jKNBKVVF0MTwbBtxuA5sIsqNM6RuJeRKelGVY5pYVwH+4Ei
         y9JA/06g/3TS7/Fk4Pw+XAYR4TivKripWnddFnln0FoaZ1QtSlhqRcTo7CupZDm0OAEs
         RfzAxsT+B+/kS8SBeAJqGuT0ZNeRFFu0Hnt3bhOcR1FeQTWdub1qco5DPLj7TcSyhuVt
         YIzvoBOAzBj44pOPTgceTzl3aP+F8LeRDVjJoUTaF7da2uTX2Oycb9rKGO6SSoageuW6
         cgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648513; x=1794253313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MlxGrO4qVY13JT+narJGH0GFq85Jy87gUAILKXGl+Ms=;
        b=IQSyUYA0+/6StIJXCpFOcNHP4rI/aUFK0DVq/9B7p5Ij/WsLjhE75Y2UOM9+GD4Xyh
         xsCXOO1XgX5NfkaJomzUSu2T9mEx8XEu1OYXU2yxF+2bfuQmWL+7VG06rgxXyWKEgxIY
         V1MoVNKZaalRMqn+jPRlYFGNYp91DNxemJySl+ytZlFNVLFR14f0w+y/1YdrWwr9nwZ2
         p+GzDlEkIfM2PZ4gieBOpEkZw2WFXc/gCct/S4FvimHGOjVPt6MzECeqs/2uQtR7vDCT
         lSYy11FLjBMmPw84AfIfbRlNxRLOIo1u3h9LKBJ47KtaUta+cbYM5163ctAyb6hL0648
         lJEg==
X-Forwarded-Encrypted: i=1; AKwUvBzjg4SAj/cLa4Of+2tjwKMSIcv/cGZ6LUJEwsIyEwdd7fHpUuBZv1WOh0HbiIfmep8yfMCTSylxEKK4bJQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKh6eLdiyRC28syCrEQYVzzmFqJDStBqBa1XP/PxWgle9MIbq2N
	5YYG/cKsjhsnQdwnkuQ8Bq/IwrwB7hlWHH8akpNxPyOxVgJkc82NAwb+
X-Gm-Gg: AYBFou1B/j99yLsa1pb5xL/Lgk73dgtQg4EEb5Hfjl0iiskM09OiDD5GOPNWPxrHQQ4
	IOYnIkicyTXuF4e4v0gxA3363RAGpqmwpxuIvrxW7ia8Qt6SMiI1m9HiTNHapLyQLOn0ibFvg5w
	NaN+m3l7UdCO1EtvoBL0O52PhfHmGl4GVM4iaOnyIDxuAq4qiwbmBrK+PEVhD1x42Jth9qGnQKQ
	Zn7LF8S0J6yyBTcJHCF4j6WNWwScf83iVr5Qx9hS8IVcLQHzy7aLRLE2pekID2FRlJirqCF/+bK
	w5irbQX5nLcFTsp0svyYwRQnBnu2A0K0rSbpdfG6gt0yoxxLUdeSZebX91ilUYY4lPzORZB7J/b
	Gi4YCLoqAaVDDnxtvhYwUMd4frgRtKE5qEPwo89xr62zmwBVboguA3ESYAu1rjfa5F82tgVr9hc
	gaO1HemPs0sgND4iolOzROmIPQg7LMl1gRLdiLZqY1HaGTEFa+QwaR3NEdfkHOfG6pWpYa60wfJ
	/ViqBac5gphDzBCFWbKfqKCYlZgTxjWoMfVccNBnO/V9ph3ObfPLtWMTk2cVnJTIe2i2DgVceNW
	W4nvosC+uznxRl0Dp9Ma/UP3/g6r/m5JgniOg7tcDUu6zEXrss+zhn24PZv8atYn42pWrZwJO4p
	w
X-Received: by 2002:a05:600c:8116:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4ac17e10724mr259459885e9.16.1793648512913;
        Mon, 02 Nov 2026 11:41:52 -0800 (PST)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4ac0a0a3495sm231386345e9.4.2026.11.02.11.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:41:52 -0800 (PST)
From: Mahe Tardy <mahe.tardy@gmail.com>
To: bpf@vger.kernel.org
Cc: Quentin Monnet <qmo@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Mahe Tardy <mahe.tardy@gmail.com>,
	Tianyi Chen <hi@tychen.cc>,
	Gyutae Bae <gyutae.bae@navercorp.com>,
	Hui Su <sh_def@163.com>,
	Josef Bacik <josef@toxicpanda.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v2 1/5] libbpf: Count entry programs for bpf_gen__init()
Date: Mon,  2 Nov 2026 19:41:40 +0000
Message-ID: <20261102194145.620210-2-mahe.tardy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102194145.620210-1-mahe.tardy@gmail.com>
References: <20261102194145.620210-1-mahe.tardy@gmail.com>
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

Commit '259172bb6514 ("libbpf: Fix gen_loader assumption on number of
programs.")' explicitly mention that we may pass a higher number of
progs because we include subprogs and autoload=false to bpf_gen__init()
generating a bigger cleanup section which is harmless.

This is in preparation for the next commits that will introduce cleanup
of the link_fds to bpf_gen__init(). We don't want to overallocate but
have the correct count of progs in this situation so that the
program-slot count matches the programs exposed by the skeleton.

Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 tools/lib/bpf/libbpf.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 02e75b183ed0..a7cbe7204043 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -9800,7 +9800,7 @@ static int bpf_object_load(struct bpf_object *obj, int extra_log_level, const ch
 	 * permit cross-endian creation of "light skeleton".
 	 */
 	if (obj->gen_loader) {
-		int nr_func_ptr_maps = 0, nr_progs = 0, i;
+		int nr_func_ptr_maps = 0, nr_progs = 0, nr_obj_progs = 0, i;
 		bool text_has_callx = false;

 		/*
@@ -9815,13 +9815,16 @@ static int bpf_object_load(struct bpf_object *obj, int extra_log_level, const ch
 			if (prog_is_subprog(obj, &obj->programs[i]) &&
 			    prog_has_callx(&obj->programs[i]))
 				text_has_callx = true;
-		for (i = 0; i < obj->nr_programs; i++)
+		for (i = 0; i < obj->nr_programs; i++) {
+			if (prog_is_subprog(obj, &obj->programs[i]))
+				continue;
+			nr_obj_progs++;
 			if (obj->programs[i].load_strategy != BPF_PROG_LOAD_STRATEGY_DISABLED &&
-			    !prog_is_subprog(obj, &obj->programs[i]) &&
 			    (text_has_callx || prog_has_callx(&obj->programs[i])))
 				nr_progs++;
+		}
 		bpf_gen__init(obj->gen_loader, obj->log_level | extra_log_level,
-			      obj->nr_programs, obj->nr_maps, nr_func_ptr_maps * nr_progs);
+			      nr_obj_progs, obj->nr_maps, nr_func_ptr_maps * nr_progs);
 	} else if (!is_native_endianness(obj)) {
 		pr_warn("object '%s': loading non-native endianness is unsupported\n", obj->name);
 		return libbpf_err(-LIBBPF_ERRNO__ENDIAN);
--
2.43.0

