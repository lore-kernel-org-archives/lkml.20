Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659170;
	b=VVDAVT+Wg4sOXJ4iXGGXW8zKH3QPbjxlk7vcaPB/nRp/MId07a0U5W/34vaUPzYuEQqC
	 qfASNxAMwRiKpN2OKIxSFyBlDuRZw5JSU6MF3M1aXhS1qgqjoJMJb/wM44CGn+iW5DPuy
	 DLLD8k8A9k1WJ2JVlP4CeqAgcFZMH7bBeRNz35myk8sHIPaEvWOYa1gp6Fz60fr8vTHww
	 A31ph8Kh0jgkjDP6L1QppsuZ75P7MDelhYayqVKgnnfNEXVB83Lr+ZLC/LqVlIAIErAsn
	 1YoeIg6YJVsHzKJ+1f5qGtMf9S0MfESZUUegf130TbUZlU2QRlbCvJAGIp0w2EgupvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=g5XH9GbJz9K+fVYPnTUbNJQlpMqHowMb6PcTtvYSgZI=;
	b=2u8Q7wcJXAkqJc4yXOZlRnMC6mixlO2N027CTVSt9D+v2g88PHraQEvdMURS7V7U/ZIe
	 B45v58uTl/sUFoj9SdZ4Lz+NsdiWhQWUxb0VX12vQKjKJeHf9WdLswC93pFcP5DViJzox
	 xEwpx+5xVxQUWLj4CoUdXMcR5ozuwA273kDl7CGw64leVjr97Nn3XhImVp7x0DPR2GC3V
	 1ImQOD4jVI/okmY/9MbG8PC08VbEMnUkT8Kz93QLURgTtMieX9V44EYK3hQ4ccrznZZLu
	 ucMcK6mN5V22pb8LyO8AXq7oGOQFuTVkvIcrayvZF6S4GVLUUorRhp/WwwOuphzeGsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TcEd7U/O";
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F15F606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F15F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TcEd7U/O
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e946155442so31669275ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793659170; x=1794263970; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g5XH9GbJz9K+fVYPnTUbNJQlpMqHowMb6PcTtvYSgZI=;
        b=TcEd7U/OlX9LtOACLuuXqCzdGJudg5Zgsu1EbOUHl9QNKsN9rYg9VC12+7rRNq/Ucz
         ggPJ6ZimxlwljXZP1HsCZNkoeRFGPRjet25kBqeEe6b0bOvanrabymWZJz+twDr8wtv4
         esVOFrnCySx2Ll71Jr77+jsIdowHwmo6U1jbQixI4fASKllbYpN9QKxHkDKrPxEAXnlz
         pMGwrT6Z/OYHvrdf7SQQoY27hamdyv0F/tRTerGGEjheN1kAdmuPQ9F2R+tTLIh89WuY
         9IWk7NmzmTMKhks8aEfQDq3CdY3SMMaUt5PV608w4pLbQsiMRBPg7tpMnaTQbj/NfZEo
         0qHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793659170; x=1794263970;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5XH9GbJz9K+fVYPnTUbNJQlpMqHowMb6PcTtvYSgZI=;
        b=NW/c8YMe2K2+LDTyAlLpu60dwbh0PFgPMCHQHRC7URdvi3RNTAqvslMDX/tvTJyiJz
         MOU9bOyhv1zJ2xodNzVyFUThq2Ak3ceeev5+iSxaYnSo93MCZkkqE+RybtKqoSY2DAXW
         Z62ztaEq94GDFB56RT0Xgz/qcJPWmtiYxAu3uoWkk60D5iZgmQWMPKJ+26RZK5aqJXdq
         yKK1ophmeeajBvFB8mcykRv9k1d31EV1JYDuy5RiLJyEZ6VCwDJd6zdwnvEgMXFuV/zq
         oEDOpL4HCn/ef0VS+r8B81KdcJfUGJf+V6mbhfohQUDiUh33Kzqrc/qUDNfr6FyYAH24
         jXGQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3RfLaSXk+cM238jCNu1vh4XUWx1Ykhr0gG/PDV7ha9E9IgX64x8jGd8YuSxMhBryE6GP0C9qFM1gATGE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RXodR4O4Fh/3C2H5GRRxlL+Ea6v+4zvoGdRukpBZsF9RnA+MD
	9i0BdFIBAto+biXjL+ix/MKgOHkB8V7LMzeAYTbI1taJ2sGay/TGFrZ9
X-Gm-Gg: AYBFou2AsBK2wOLxCkDRE6OV/QHkr0RyvadDadzxzvFG6Lne/LtMUEgbsFbOerkH4vY
	rHnbnNKf8fRIHASkMlwEmVzWg2IsuekiUSSQBaWISMtnGFqDGq0Gx4d2lWvMMGWMWa7RnAFPomH
	i5yQmXckNgAh4HxWrZCxIZVRw60EgV29Owq/0IAscAhDQtGOFb6A+RdvkYET+dhX0wkx9XQzWZj
	kVBWWmcYhm9fA4Y7ussW4/Ixs9JNTPrXVaN8jC3vsaMaPY+qU5M9p4y+I4IzJEJ9BlvGZeTwK9V
	Hoszy0IK+wVSzRQOvN0z69nZcneAY78WN0eud+YIBEPBpouR6ad1MqUk+W4aO/0jrBKOcjqZIFV
	f7vnyLeLtBEpyDWrCd0nlVhkROklwJQYwAh96JonOarAOK/Wn54DSl7HjvBVlCiBetuNk1i66w6
	fr3GH8WP2Fp43CtEM76XZ+moVw5Y1syGhBwGaA9cItBJ1ZQjgtNqgp/1t0AtmsXr+6rocYdoDx9
	T2DdUyjlQtzMipz4avf8Ija3h18QtwlK9iyvr1s0r7Ytjl8jtNYziS+S4Rb2r6/qfLaRUcTHG4b
	epJmYFyNSfNxhmUIoWVOSNwDBG79y+5L8skqXnnr/nitxJ9dngITpWz/Lo67J96ulYZ1v/dOnOy
	m1Woh7GXoZA+lpCKwyTXHfiDdgv+xYQUesg==
X-Received: by 2002:a17:902:d485:b0:2dd:c053:a6ee with SMTP id d9443c01a7336-2eb364ce5e3mr104247515ad.32.1793659169696;
        Mon, 02 Nov 2026 14:39:29 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052edasm32812155ad.4.2026.11.02.14.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 14:39:29 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 22:39:28 +0000
Message-Id: <DML33YRVJEMW.2HUSMGKYHA4HT@gmail.com>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <ihor.solodrai@linux.dev>, <john.fastabend@gmail.com>, <shuah@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <jose.marchesi@oracle.com>, <david.faust@oss.qualcomm.com>
Subject: Re: [PATCH bpf-next v3 8/8] selftests/bpf: skip the struct_ops
 arena tests without compiler support
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Vineet Gupta" <vineet.gupta@linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <20261102220717.4079739-9-vineet.gupta@linux.dev>
References: <20261102220717.4079739-1-vineet.gupta@linux.dev> <20261102220717.4079739-9-vineet.gupta@linux.dev>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 02, 2026 at 02:07 PM Vineet Gupta <vineet.gupta@linux.dev> wrote:
> These are not driven by test_loader, so __skip_without_arena does not
> reach them.  Use the flag-in-.data pattern linked_externs.c already
> uses for the same situation: the program exports skip_tests, and the
> host checks it before attaching and reports SKIP.

cast_kern() is cleaner...
It's a nop when the compiler supports arena.

diff --git a/tools/testing/selftests/bpf/progs/struct_ops_arena.c b/tools/testing/selftests/bpf/progs/struct_ops_arena.c
index 8aa8639..3fffa24 100644
--- a/tools/testing/selftests/bpf/progs/struct_ops_arena.c
+++ b/tools/testing/selftests/bpf/progs/struct_ops_arena.c
@@ -86,7 +86,6 @@ struct bpf_testmod_ops3 testmod_arena = {
 SEC("syscall")
 int trigger(void *ctx)
 {
-#if defined(__BPF_FEATURE_ADDR_SPACE_CAST)
 	u64 __arena *val;
 	int ret;

@@ -94,6 +93,7 @@ int trigger(void *ctx)
 	if (!val)
 		return 1;

+	cast_kern(val);
 	*val = 41;
 	ret = bpf_testmod_ops3_call_test_arena((u64 *)val);
 	if (ret)
@@ -134,6 +134,5 @@ int trigger(void *ctx)
 		return 11;

 	bpf_arena_free_pages(&arena, (void __arena *)val, 1);
-#endif
 	return 0;
 }
diff --git a/tools/testing/selftests/bpf/progs/struct_ops_arena_autobind.c b/tools/testing/selftests/bpf/progs/struct_ops_arena_autobind.c
index 495faa0..3455ca9 100644
--- a/tools/testing/selftests/bpf/progs/struct_ops_arena_autobind.c
+++ b/tools/testing/selftests/bpf/progs/struct_ops_arena_autobind.c
@@ -45,13 +45,13 @@ int unrelated(void *ctx)
 SEC("syscall")
 int trigger(void *ctx)
 {
-#if defined(__BPF_FEATURE_ADDR_SPACE_CAST)
 	u64 __arena *val;

 	val = bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
 	if (!val)
 		return 1;

+	cast_kern(val);
 	*val = 41;
 	if (bpf_testmod_ops3_call_test_arena((u64 *)val))
 		return 2;
@@ -59,6 +59,5 @@ int trigger(void *ctx)
 		return 3;

 	bpf_arena_free_pages(&arena, (void __arena *)val, 1);
-#endif
 	return 0;
 }
diff --git a/tools/testing/selftests/bpf/progs/struct_ops_arena_member.c b/tools/testing/selftests/bpf/progs/struct_ops_arena_member.c
index a2218cd..afbe59f 100644
--- a/tools/testing/selftests/bpf/progs/struct_ops_arena_member.c
+++ b/tools/testing/selftests/bpf/progs/struct_ops_arena_member.c
@@ -80,7 +80,6 @@ struct bpf_testmod_ops3 testmod_arena_member = {
 SEC("syscall")
 int trigger(void *ctx)
 {
-#if defined(__BPF_FEATURE_ADDR_SPACE_CAST)
 	u64 __arena *val;
 	int ret;

@@ -88,6 +87,7 @@ int trigger(void *ctx)
 	if (!val)
 		return 1;

+	cast_kern(val);
 	*val = 41;
 	ret = bpf_testmod_ops3_call_test_arena_member((u64 *)val);
 	if (ret)
@@ -104,6 +104,5 @@ int trigger(void *ctx)
 		return 4;

 	bpf_arena_free_pages(&arena, (void __arena *)val, 1);
-#endif
 	return 0;
 }
diff --git a/tools/testing/selftests/bpf/progs/struct_ops_arena_member_render.c b/tools/testing/selftests/bpf/progs/struct_ops_arena_member_render.c
index 09b4c74..c4e134e 100644
--- a/tools/testing/selftests/bpf/progs/struct_ops_arena_member_render.c
+++ b/tools/testing/selftests/bpf/progs/struct_ops_arena_member_render.c
@@ -63,7 +63,6 @@ struct bpf_testmod_ops3 testmod_arena_member_render = {
 SEC("syscall")
 int trigger(void *ctx)
 {
-#if defined(__BPF_FEATURE_ADDR_SPACE_CAST)
 	u64 __arena *val;
 	int ret;

@@ -71,6 +70,7 @@ int trigger(void *ctx)
 	if (!val)
 		return 1;

+	cast_kern(val);
 	*val = 41;
 	ret = bpf_testmod_ops3_call_test_arena_member((u64 *)val);
 	if (ret)
@@ -80,6 +80,5 @@ int trigger(void *ctx)
 		return 3;

 	bpf_arena_free_pages(&arena, (void __arena *)val, 1);
-#endif
 	return 0;
 }
