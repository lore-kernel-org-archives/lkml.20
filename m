Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328165;
	b=D3v+BkyC0/OL/UMbPfE76cSvolo6pd5VAlh4NGFgRe9ynNGlX8adxx2l6uIxnOTskcII
	 T5vh30ca9VlfYi36DVfuRDBQQaOm/Fob2ThqC+nrTzA2LOeA1NUmCca4an/XjwVdNDH6P
	 VuuBbFifX2xwfNX1iwpgaXxWuouM9OayKmkTx0U66UD2vZWwMb/zA6APvGTOkN4tUqDZd
	 BWjPrneSqsnzZrkc9RUTJkkfK6NIZijzq74jR/93fTxU9o1bbcbZf3iMQjIlJwo4rbYMc
	 Qsq8ye7DA5BdOckAxYd22GVwkHG/bVq5GLE5YxSm1tCBzmkAojRL0RPbE85iIx+XCaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DLsTnaW3uXr9AC/QbRfpXuwiBDpvXM/nxSHrEfIP3lc=;
	b=QmpxCURmNmblcmu5AAbaKmKpNIX1CgW0A9n85QFY0FBl649H7PaUeuLd3dIqOnccnXhc
	 mQZ7aiM7Ji3vPHSfQlw7XvcX6dlJhSD367WfcP2p/4vuYL9DzbqNNhQWEkaSLE0wul3rL
	 1c6ZBb58sBxkB1SBJezGLKX0p6toLlZXoeis7UMIAshg9I4iplQcHAVKtRsFISlz43lB8
	 Z7Y6OUAc2A8GhQuj3J8S4NVQZE1JFKTHvmR2ln5dv0dMHHwkUxq2WyL19IL3kHoWScFu+
	 6SIRYUAgbh2nh7F5U/PTAykd8eeTqHqqGtq2Mx0kUWT1w33w725bUrZJqk9FKBziWaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vZ1RReU+;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEEF606A233
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FEEF606A233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vZ1RReU+
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso16282425e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794328163; x=1794932963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLsTnaW3uXr9AC/QbRfpXuwiBDpvXM/nxSHrEfIP3lc=;
        b=vZ1RReU+7oUC/2FVAIkerBd9DuaXp0BA8s+XGa4zggwl50JQDETD+PipCAaWdCw0VO
         Am1mOIOa+zlEUvGLPFtUoD7MBJph9LFhog3NJlUfCnf70GkgDacTqNYrDGIEXW6Q0NS8
         QLCayZijcVItUK/6VVJuZS+wiZ9eU7d93b8/ER/kDjZK5c38Vz1RruWu4BDvdhX2Ux6s
         FzTX193Qr07gQoGI/QLlorYuLYW2btDvgElTBByQCTQXP5Y4dLjDGQ5oSlzwUE1PeJlw
         z7uGzptU8YpfeXanWgR8sRiTmq7s22fqCO9GwfFomxrridjp5AFv4QrOKZxLn8UwNN/t
         7XgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328163; x=1794932963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DLsTnaW3uXr9AC/QbRfpXuwiBDpvXM/nxSHrEfIP3lc=;
        b=pNsUTLs85jOe3oK4bgKTY2R3hXNaK9LXPY/RU+bL25YtEq6v9pzn8AioElMgebnKlL
         YKmO+7MxCHI6M5h+w/gUtqrdfNt4RCiVIYF8AF9aAQ9/NsrlIHfGFdZ4RGcfU0gpO3Jq
         +W8QQrjj+TdIu23pH2ru/9nfFT7cqWOV87/xKMRlIdcnzx4EtUuCd3cWZIvUvCSqGyFs
         nuNKg3Ptju0DgiqRRtomWwWp9gQLedrO9vKMQ7n/1GFb8xhVWguhqK5wOXzu8klo0u/6
         xCKUaZMPYcciHAJM1BY0fHlldS4VeZ0vPEYjtX6+Yq+zcQG2z9OzdVz7j+P8QaJ2X3nc
         uYNQ==
X-Forwarded-Encrypted: i=1; AL+hErGe5TBlfz4UefpDCOnOvxevwXTDih9zfNB8l4mn890rxTICURJK15nkpc5gh/KQGaX31qA73LFyiAG53W4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UWUfhlqwE62aKO7BQdIUnbrZ0IPgZEC3yYesYozOjoxkitOW+
	JPSno3I4XN+tL1vlxemQmeV4G9AEyKcJ/VxWExY7091g6hRYSXmpFZDn
X-Gm-Gg: AYBFou3GTrh0xWeuysY2WkDr14TzCrdFYrPRifQrR1ozFmjMpcu/iwPZt10X2/Wv8Wa
	jq8MWIllXLqsOEvTjmle5MluuT5m18hCXS1W04a3W8c5QFQS4YXpCBe3AOf04V1U7XVi48jvvQ4
	vDzpSd3N/R7TDqJtPZvXPu0NKmQWWHI+G6ljFnPE/viPGdvlQsZmnTBBwGzoq33qRYuZG8W3hQU
	gbsFN+KvHP7m3y0RLCDiMNpffLTRH5O6qiU0/HF3wgMC+YJBTLVSR8bWUTvHVa43/N2zuh4Kz/q
	MU8b1hPfZ+UaXUNIPWqn3fWVGqf0NzJaf0zHh0ee2EyLQKZh4fbf45ngR6iASgLMxBVXxmIF/q5
	KfyZuqfnN5hANuPAgnE6toRNfhMsF6PDvhjVzqiZxcbtR0iF/T0tWrorMeY9rS7NuUOxhDWCsEG
	V98jMpFnfxBiiW28SiZgPiXVFFLs4/lppDdzSpFA78jwuzbYKiwTLs1w6+l0xSWzFsUCWjcxpDV
	mSODpTYds9gUNosvwKmauEGGXpDFp1/quRI4qHnUgaWup60uGX2+Xuvc2O2Sm5DBi0j5zNLiDf/
	PvMKAXbeeV14QrZXYbdmbsn6lKAW/6tTJyYO/LJlkuhVY24=
X-Received: by 2002:a05:600c:6306:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4ba0234eddcmr57289025e9.24.1794328162866;
        Tue, 10 Nov 2026 08:29:22 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm71287485e9.10.2026.11.10.08.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:29:21 -0800 (PST)
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alan Maguire <almagui@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Quentin Monnet <qmo@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Sasha Levin <sashal@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH v3 bpf-next 02/18] bpf: Add a btf_id_set8_entry helper
Date: Tue, 10 Nov 2026 16:40:22 +0000
Message-ID: <20261110164046.454431-3-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110164046.454431-1-a.s.protopopov@gmail.com>
References: <20261110164046.454431-1-a.s.protopopov@gmail.com>
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

The pairs of a struct btf_id_set8 have an anonymous type, and the
btf_id_set8_contains() helper returns a void pointer to the pair it
finds. All its users but one only check if a set contains an ID. The
one which needs the flags, btf_kfunc_id_set_contains(), finds them as
the word next to the ID.

Name the type struct btf_id_set8_pair, and add a btf_id_set8_entry()
helper which returns a pointer to it. Make btf_id_set8_contains()
return bool, like btf_id_set_contains() does, and use the new helper
in btf_kfunc_id_set_contains().

The layout of the set doesn't change. Update the tools copy of
btf_ids.h as well. A later patch uses the new helper to set the flags
of a pair.

Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---
 include/linux/btf.h           |  8 +++++++-
 include/linux/btf_ids.h       | 10 ++++++----
 kernel/bpf/btf.c              |  9 ++++-----
 tools/include/linux/btf_ids.h | 10 ++++++----
 4 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/include/linux/btf.h b/include/linux/btf.h
index 87fad4076f0e..00495e7833b6 100644
--- a/include/linux/btf.h
+++ b/include/linux/btf.h
@@ -558,11 +558,17 @@ static inline bool btf_id_set_contains(const struct btf_id_set *set, u32 id)
 	return bsearch(&id, set->ids, set->cnt, sizeof(u32), btf_id_cmp_func) != NULL;
 }
 
-static inline void *btf_id_set8_contains(const struct btf_id_set8 *set, u32 id)
+static inline struct btf_id_set8_pair *
+btf_id_set8_entry(const struct btf_id_set8 *set, u32 id)
 {
 	return bsearch(&id, set->pairs, set->cnt, sizeof(set->pairs[0]), btf_id_cmp_func);
 }
 
+static inline bool btf_id_set8_contains(const struct btf_id_set8 *set, u32 id)
+{
+	return btf_id_set8_entry(set, id) != NULL;
+}
+
 bool btf_param_match_suffix(const struct btf *btf,
 			    const struct btf_param *arg,
 			    const char *suffix);
diff --git a/include/linux/btf_ids.h b/include/linux/btf_ids.h
index f27b7db81100..f5985acf661b 100644
--- a/include/linux/btf_ids.h
+++ b/include/linux/btf_ids.h
@@ -19,13 +19,15 @@ struct btf_id_set {
  */
 #define BTF_SET8_FMODRET	(1 << 1)
 
+struct btf_id_set8_pair {
+	u32 id;
+	u32 flags;
+};
+
 struct btf_id_set8 {
 	u32 cnt;
 	u32 flags;
-	struct {
-		u32 id;
-		u32 flags;
-	} pairs[];
+	struct btf_id_set8_pair pairs[];
 };
 
 #ifdef CONFIG_DEBUG_INFO_BTF
diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index 228b93d4f8c9..61d2df6776a9 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -9973,8 +9973,8 @@ static u32 *btf_kfunc_id_set_contains(const struct btf *btf,
 				      enum btf_kfunc_hook hook,
 				      u32 kfunc_btf_id)
 {
+	struct btf_id_set8_pair *pair;
 	struct btf_id_set8 *set;
-	u32 *id;
 
 	if (hook >= BTF_KFUNC_HOOK_MAX)
 		return NULL;
@@ -9983,11 +9983,10 @@ static u32 *btf_kfunc_id_set_contains(const struct btf *btf,
 	set = btf->kfunc_set_tab->sets[hook];
 	if (!set)
 		return NULL;
-	id = btf_id_set8_contains(set, kfunc_btf_id);
-	if (!id)
+	pair = btf_id_set8_entry(set, kfunc_btf_id);
+	if (!pair)
 		return NULL;
-	/* The flags for BTF ID are located next to it */
-	return id + 1;
+	return &pair->flags;
 }
 
 static bool __btf_kfunc_is_allowed(const struct btf *btf,
diff --git a/tools/include/linux/btf_ids.h b/tools/include/linux/btf_ids.h
index b371ef7241b9..3b5b2856c628 100644
--- a/tools/include/linux/btf_ids.h
+++ b/tools/include/linux/btf_ids.h
@@ -19,13 +19,15 @@ struct btf_id_set {
  */
 #define BTF_SET8_FMODRET	(1 << 1)
 
+struct btf_id_set8_pair {
+	u32 id;
+	u32 flags;
+};
+
 struct btf_id_set8 {
 	u32 cnt;
 	u32 flags;
-	struct {
-		u32 id;
-		u32 flags;
-	} pairs[];
+	struct btf_id_set8_pair pairs[];
 };
 
 #ifdef CONFIG_DEBUG_INFO_BTF
-- 
2.43.0

