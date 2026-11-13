Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.126
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606009;
	b=XVIzsxXgpp6ebfuQLa76vppCkU4bu27OU9VoGUEV1PLNPNrDamMFjHi9lWh/J6sinEw7
	 Gf3QqWq+EUOxzv5Vs08sMckPoH+cRwLc5ezjjNzBByXoLe/mVKEyGwM0VLH02luRiAnwo
	 N+b8NCXMMEb2HA5gRqLgaPlvegtW7egAxCWNhgCy1f/jsfPag5IzRqMKh4D2T3tX+ugDD
	 GgVoRU3Qt1DmJoiEwThM/6saZkk/IIMtq4/5YlLdcjss/5T+fHAFbVlpB3uabY7K1byLQ
	 bNGaRZsoBDdyaibGfaRYr4rVoUtU57V+0lJbQsxJIuKqj+ebspkUVQ07I6Y3HjiIJdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606009;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LCQc9kOni4SWH9/sppw3ilCo5DL7FdPQXQxmUFpEAF8=;
	b=u8gdQUnZUeEnBaCDCT90bGark7X4qdG8AZXhLvJx0XtAJG8/z9JhiD+050TGOXA2hObw
	 v2o49/HlRsQNUch5DM8T+jcOWLQZsX+Y8tJjqELHPWt+E8JRwwWJRjxoutdSpQCZQkgA+
	 21WSfxSmmOu0X6p53SiYdUpKujxwwBHwwL9jxye/EmUxpAdiw13iBcoLfjucFuY2Dreh6
	 K8GCk0JHNTMc4oEY0k70yJqIFn1HaNZPrH6DAcqcW7IWYg2R8CUCS7nC3F5JS/rg/8nOf
	 KBF2TPD1QmQ+0kfb/9uItGgDIByZEa196jUPICZVNasRbJBz59DoRp97MrC0fykslsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CLoRCelY;
	arc=none smtp.remote-ip=95.215.58.126
Received: from mta1.migadu.com (out-126.mta1.migadu.com [95.215.58.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E257160A3820
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E257160A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CLoRCelY
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zEMZrhKbiE7PjxVtAluBP/MvIVAz42s7MtM09a7r768=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794606007; v=1; x=1795210807;
 b=CLoRCelYpGI7+ew1M0LuvS3HLS6eHuHkdk1hvi7EQtBkgSrq/cmR55U71cGcWymz8nUKbjEi
 FmgI8fDq8YrHlIQsgiiJDOYlUFIcxBQj176j8HW/BdTXR5Ui9uol9yWh/8ay+al0jRIAWHGjfig
 WAOEwcKPxhiTB0uq2+O0MZEw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 1cbded36f2dc424a;
	Fri, 13 Nov 2026 21:40:04 +0000
X-Mizu-Trace-ID: 1cbded36f2dc424a
X-Migadu-Flow: FLOW_OUT
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Amery Hung <ameryhung@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Nicholas Carlini <npc@anthropic.com>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH bpf-next v4 6/6] selftests/bpf: Cover callback-frame map key lifetime
Date: Fri, 13 Nov 2026 14:39:21 -0700
Message-ID: <20261113213921.1646681-7-ihor.solodrai@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113213921.1646681-1-ihor.solodrai@linux.dev>
References: <20261113213921.1646681-1-ihor.solodrai@linux.dev>
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

Array and per-CPU array callbacks to bpf_for_each_map_elem() receive
a key on the helper's stack.

Check that saving this key in the callback context and dereferencing
it after iteration is rejected.

Also require the same pattern to keep verifying for a hash key and
an array value, whose storage outlives the callback. These controls
guard the array-only and key-only scope of the lifetime restriction.

Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
 .../bpf/progs/verifier_iterating_callbacks.c  | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_iterating_callbacks.c b/tools/testing/selftests/bpf/progs/verifier_iterating_callbacks.c
index e30f7676081f..1dfeb13b4382 100644
--- a/tools/testing/selftests/bpf/progs/verifier_iterating_callbacks.c
+++ b/tools/testing/selftests/bpf/progs/verifier_iterating_callbacks.c
@@ -9,6 +9,20 @@ struct {
 	__type(value, __u64);
 } map SEC(".maps");
 
+struct {
+	__uint(type, BPF_MAP_TYPE_PERCPU_ARRAY);
+	__uint(max_entries, 8);
+	__type(key, __u32);
+	__type(value, __u64);
+} percpu_map SEC(".maps");
+
+struct {
+	__uint(type, BPF_MAP_TYPE_HASH);
+	__uint(max_entries, 8);
+	__type(key, __u32);
+	__type(value, __u64);
+} hash_map SEC(".maps");
+
 struct {
 	__uint(type, BPF_MAP_TYPE_USER_RINGBUF);
 	__uint(max_entries, 8);
@@ -860,4 +874,81 @@ __naked void check_add_const_regsafe_off(void)
 	: __clobber_common);
 }
 
+struct key_ctx {
+	__u32 *key;
+};
+
+static long park_key_cb(struct bpf_map *map, __u32 *key, __u64 *value,
+			void *context)
+{
+	struct key_ctx *c = context;
+
+	c->key = key;
+	return 0;
+}
+
+/* bpf_for_each_array_elem() passes a key from its own stack frame. */
+SEC("?raw_tp")
+__failure __msg("invalid mem access 'scalar'")
+int array_park_map_key(void *ctx)
+{
+	struct key_ctx c = {};
+
+	bpf_for_each_map_elem(&map, park_key_cb, &c, 0);
+	if (c.key)
+		return *c.key;
+	return 0;
+}
+
+SEC("?raw_tp")
+__failure __msg("invalid mem access 'scalar'")
+int percpu_array_park_map_key(void *ctx)
+{
+	struct key_ctx c = {};
+
+	bpf_for_each_map_elem(&percpu_map, park_key_cb, &c, 0);
+	if (c.key)
+		return *c.key;
+	return 0;
+}
+
+/* A hash key points into the element, which outlives the callback. */
+SEC("?raw_tp")
+__success
+int hash_park_map_key(void *ctx)
+{
+	struct key_ctx c = {};
+
+	bpf_for_each_map_elem(&hash_map, park_key_cb, &c, 0);
+	if (c.key)
+		return *c.key;
+	return 0;
+}
+
+struct value_ctx {
+	__u64 *value;
+};
+
+static long park_value_cb(struct bpf_map *map, __u32 *key, __u64 *value,
+			  void *context)
+{
+	struct value_ctx *c = context;
+
+	c->value = value;
+	return 0;
+}
+
+/* Only the key is frame-scoped; the element lives until map teardown. */
+SEC("?raw_tp")
+__success
+int array_park_map_value(void *ctx)
+{
+	struct value_ctx c = {};
+
+	bpf_for_each_map_elem(&map, park_value_cb, &c, 0);
+	if (c.value)
+		return *c.value;
+	return 0;
+}
+
 char _license[] SEC("license") = "GPL";
-- 
2.56.0

