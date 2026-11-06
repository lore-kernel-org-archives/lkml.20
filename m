Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998324;
	b=KBPgZ9TRJtoEK1ZaYoLOBM5qbBi1zPOjy66Tvm1RBOxwLR60wbS3xbV6eh1zEfP7FSQy
	 xOprEjBOXn+Q18qet8M0Uw9kRHPikMXlMdSzifo5hd04Io6eI/bY42K/AfGyhg7RSfkk9
	 NPLxw8aC5ROaQvlRUaD7JBpzkTaJOdTmtJ3ebJGv9K7oYAy4WOYRxTnBAGmmibafr3VXc
	 yF7e0MHa0YhRLVnBW47jle7yCmkg1KmcI5eT+V5SHIFhd9LJfxAp0PFQm4oJPAbw5mXis
	 zUNuNrgiy2R4YWXuGkxXEBix/w3FpCswScEvMGrKRJzlQDWPWsnbU4NGg4009m7CvxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DLsTnaW3uXr9AC/QbRfpXuwiBDpvXM/nxSHrEfIP3lc=;
	b=kNCVC2Ju45qORR03a4d2tmStBGip4npAVQPMijqNZv+1dI3jHfDui8JQKlPj4lBSLNVP
	 I1dwp+68K7EfgypRsoOVEMNJgrREdkllc/J3sAycDOI21lMZpA3ih8yl9ZxCQw/qPtNCP
	 LpIzsL0uN4V7GgA9aQfMZ63XqQOxkyEoVFMRQ2by6C1UNZyatoNTySif8Fo1NUrApSXPH
	 fb4Xe6sIpWCp9Y5fRzAwccLJ9BDU5Kfm18qzC6iWGuj3DP481zPiEYCOSsQV1KbmQeQ3B
	 EQK1SBZf8MrDhLHyBWD10rG8G18dyZ/0j1qaKvBOHGwdZzyoz5vmhh6uWiEF+OghRpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kZ/9YEQt";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0155606A334
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0155606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kZ/9YEQt
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4b467581b98so8738715e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793998322; x=1794603122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLsTnaW3uXr9AC/QbRfpXuwiBDpvXM/nxSHrEfIP3lc=;
        b=kZ/9YEQt4LVDNfEOtC4RNvmA0TLiM7u1IFT/0BagujDUjsQtFTBVkcELr0nhfdxZAo
         2KbVMmDXeCuLOerWMXrDPbb/2zUzFvcvZiqj2OemKq5Ni8+DbPUnyJLVWLrKI9VjTRc4
         f+pTzfPBOA9GXoCdC0G1nnS8mqGbpXGDkxGKfEK5vkIiiYoEFqbEozVwfSy97VWZhayt
         WHRCcV44L5bOoE4Zr47y77Mdxw6rMl0lenLHTnUscKhv6ir4qyDV8KTpECIMfxmKOr4x
         Mb5MZniXHu2reTtPd8NGl1Gy1FBEw+tOX1KaQeWwL3FzZY4rU6Z8ykH+i1+nFbG5rc7s
         xB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998322; x=1794603122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DLsTnaW3uXr9AC/QbRfpXuwiBDpvXM/nxSHrEfIP3lc=;
        b=u3JK4VDcUXopveLUDMol3nExpReccM4sJQgf8PQkHalsn8U9o/36ZBRLIQ26eV4KLg
         XgBuuWaRkNtYnPSG0ZMfVlgkE6BLm2NElzmLg0UbxoxF0+HPJZkrXQJNIxKzHHAITOxb
         9V4U2B0W8IoFYMIDWSfsUDe3Iz9dLDHeaEWMnkSTK1E7qYW8rxw4HAVSEASXDgtMb07N
         xby6mKCT2Ve6kE4Ssa44P1aIbSYcaQZp+WyGOUsf8UcQUGLVMFMgmNSMeyuLHpkI2SAe
         pCV2Hn7L2dBz7pWMLw+5hLX1J18vVKj+Gbxkhs/iq4qaKfYYgPd3BEjH9FYLWxtJkfq3
         Tm+A==
X-Forwarded-Encrypted: i=1; AKwUvBwOudrUxvHZGLTY9R8yGczrQF40eFxHMHVPfBOB3QkZExIICRx4E4GIpuD2akhp4/G/4tDVs5aTq56ca3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U572tddjR0VvWUHpqvlMoQXTEwgvu/uFX8eQSI5KL2+h/fm3J
	BoTHQzPVXDFcfwhp/lyxSp8akdeQzrBSQsw6NB2Nx1HV0LWjpR3Nag4u
X-Gm-Gg: AYBFou1ns1rs6P2NM2D+Wm54derodyEG261ZQHO7HmIpJiGnzK/utkfaBrxbnmMpmX+
	mrVycSpsdxmRZv+t6M/oRco7T7rentvlXu2xJzlEnaGNkAAuHZsf/G/+rXKn9t9x8bRBqJyyVD+
	5s9907ezKEJN2nY4c9W/6M/4OTqRgvN30iTDKUNBI61wl3tSsNYOZFsjWkO8yj9GHCGBE0BrsSB
	BoZCrzoxBg0/KyJcglZyYdhMIphjXyDQApBaN56nzBxMR5gi6Dobr0nx9qI8FmYyLzRjuv6qxrM
	Jxt70kKaYURFrIkeDQy7wEYF7RcWYaSIvYxbK90qiV78P2Ki3G8ZXJEzZ7te0YSc/hg3QfZwr4C
	N48oGpipgbwwUIeij3bMCUmEk8vKCKfvJyfdnKQyI+ZEoH6WOWFhnUCRYDY3K3fm5MxmWiXKxc4
	QOzKXtuTawvctpnlF2Yk8vpUI7PcXOuCiF+JNwM8WNYodJ4rWV8AlprtIlHWxBrLWBzuSqoedfN
	riCwWMNBkzVXVam0yr4hodCUjABWOiQ+ULMgUWZV1wp7Tyo2oc6BFoSR49EhviaWEe7KLOTDUU9
	p0GO2WsbhN3s7fdI24QUanUIKxRsvSU0pM+O4lj7a6YJqGc=
X-Received: by 2002:a05:600c:3e8f:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4b6de4a6ba1mr60373025e9.13.1793998322031;
        Fri, 06 Nov 2026 12:52:02 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62edb4sm9075425e9.1.2026.11.06.12.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:52:01 -0800 (PST)
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
Subject: [PATCH v1 bpf-next 02/18] bpf: Add a btf_id_set8_entry helper
Date: Fri,  6 Nov 2026 21:02:51 +0000
Message-ID: <20261106210314.1767267-2-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: 20261106205523.1765622-1-a.s.protopopov@gmail.com
References: <20261106210314.1767267-1-a.s.protopopov@gmail.com>
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

