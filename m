Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.226.149.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794074382;
	b=JgI59LbNAAMIMXIXJsa759tUhq5V+byisotIJE2QYBAnm1R4vBgvwmUtZQTMTOQfOIKl
	 ATDA58UtxDZ0hIILy88X7Y7ES5iwknc5gz8AsxVJvRaF0qUjoIpRHBGutCq86YGiheEV0
	 32YNpUKpeWpFGSg0FZXwvxJE56qeQydCRYk4JLwbTLN9RgEND7dSkhz56j9Kei+6En8qT
	 VyCTNLLdlmyLZuw7gf6rzrewoBnLcWF1PhyQ/EraKWTyYSjG4r0hUA+vzUduX08dpKduq
	 kvZecnh65vLDs+Y4whdPFjIeZ0i/xfSiSAfijNoSyNxDpGWorHHettueQMsCx3rHs9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074382;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+cJ3MC7LUXBbC4N5bF/0Djg1Hg9lFmBTuLmxj+Rq3SI=;
	b=pB2FWIASbUeho8grxYHfRWrVv+aLsudFtYEsFORFtZvC4RYsWRwkdtC9N4OIPZYeXFdb
	 3HfOZKIQSiyirL/HD218Fk+fD4W6QDokEe++AcqyNB7MFfY8ZXF9n2W+xln+xFZJ+u0/O
	 7gqhv9AD3b4r95dA7KBgeondo8owR2H7nuIe4g3jzun2pSRhI1XuqhrarHzCKSYhzYzrA
	 OSstPufRYxPxYfjWP9oroTgs+Kwi13MFOdlEoOfIKrpvS0l+aCwVQfrLcxfJ3GRiM8lpf
	 4hkNitXyf6cllb/Km7uzd2aieJgvXIfgCPchsfV9v90UJR+N9FjVV9j/sAqiY437zpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rbox.co;
	spf=pass smtp.mailfrom=rbox.co;
	dkim=pass header.d=rbox.co header.i=@rbox.co header.a=rsa-sha256 header.s=selector1 header.b=wpYScCIz;
	arc=none smtp.remote-ip=185.226.149.37
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8721A606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 17:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8721A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rbox.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rbox.co header.i=@rbox.co header.a=rsa-sha256 header.s=selector1 header.b=wpYScCIz
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <mhal@rbox.co>)
	id 1xPkhM-007j5c-Tg; Sat, 07 Nov 2026 18:59:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rbox.co;
	s=selector1; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From;
	bh=+cJ3MC7LUXBbC4N5bF/0Djg1Hg9lFmBTuLmxj+Rq3SI=; b=wpYScCIzPC97U4nSU5l2hXFrnK
	okbOpkoNYSPUm7S23aDRjtE6AaJzWO5f65ERMT5E5JTGw+xKtFNAAcJdxSmGLpwrIVOjOYnMogf73
	q9TLrqKY3HIOPSbi+1WWvYHM0a2/MswqKtwY/h+0aHPy7dtLZaioF9SN7p3KR4kYFOUCLopJdfoNp
	f0Wc4/X2Wtys2nhkTRCE+laTyEniv9qfqQwt/nmak/DyyoBnNOs6t7uQHG/ruKU4DCLgp1VNCdIJ5
	tczqFqPrs6l3kblhBrrrOYWJxEuWu8LGYTG82/29PQtUuaL4pCpISaTpcXfje5JrJok3HXpa83EJZ
	Fxubv+fg==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <mhal@rbox.co>)
	id 1xPkhC-0006av-7l; Sat, 07 Nov 2026 18:59:18 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (604044)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1xPkh3-007LnK-Ez;
	Sat, 07 Nov 2026 18:59:09 +0100
From: Michal Luczaj <mhal@rbox.co>
Date: Sat, 07 Nov 2026 18:58:25 +0100
Subject: [PATCH bpf-next v3 3/8] selftests/bpf: Add negative test for
 sockmap update from non-sockmap iter
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
Message-Id: <20261107-sockmap-update-limit-iter-v3-3-7c0bad1ad036@rbox.co>
References: <20261107-sockmap-update-limit-iter-v3-0-7c0bad1ad036@rbox.co>
In-Reply-To: <20261107-sockmap-update-limit-iter-v3-0-7c0bad1ad036@rbox.co>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Eric Dumazet <edumazet@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, 
 Jakub Sitnicki <jakub@cloudflare.com>, 
 Jiayuan Chen <jiayuan.chen@linux.dev>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Stanislav Fomichev <sdf@fomichev.me>
Cc: Michal Luczaj <mhal@rbox.co>, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2

Iterator-context sockmap updates are now restricted to iter/sockmap. Add a
test that attempts an update from iter/unix and expects it to fail.

Signed-off-by: Michal Luczaj <mhal@rbox.co>
---
 .../testing/selftests/bpf/progs/verifier_sockmap_mutate.c  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c b/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c
index 20332a731d4e..1516fe1524bb 100644
--- a/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c
+++ b/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c
@@ -19,6 +19,12 @@ struct bpf_iter__sockmap {
 	};
 } __attribute__((preserve_access_index));
 
+struct bpf_iter__unix {
+	union {
+		struct sock *unix_sk;
+	};
+} __attribute__((preserve_access_index));
+
 struct {
 	__uint(type, BPF_MAP_TYPE_SOCKHASH);
 	__uint(max_entries, 1);
@@ -113,6 +119,14 @@ int test_trace_iter(struct bpf_iter__sockmap *ctx)
 	return 0;
 }
 
+SEC("iter/unix")
+__failure __msg("cannot update sockmap in this context")
+int test_trace_iter_unix(struct bpf_iter__unix *ctx)
+{
+	test_sockmap_mutate(ctx->unix_sk);
+	return 0;
+}
+
 SEC("raw_tp/kfree")
 __failure __msg("cannot update sockmap in this context")
 int test_raw_tp_delete(const void *ctx __always_unused)

-- 
2.56.0

