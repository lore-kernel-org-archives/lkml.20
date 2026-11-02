Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.226.149.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793582298;
	b=AmxE5HDp75f2ryYiOONjogKeyt1W2PhoiaV0Y4J60sfFlDTb6Mdo79tNdFRXO+y0rKKQ
	 X+OtgOyWY8Rl2IbBzHo0b0M7W7zOrmH1gx27lYzWmqUHCbKF+iCxi4MoN3DmzlrCRt9/m
	 Plxc8UmgPkyVpnUrv63Cn5bvwaWsjO3TLVCgK6Sx9Pqd5bKIDKclAx0H5BapDuiS0x19H
	 kNkEQPMSNWKY//1OCHS4TuW4AxWgTE1zUZQb6rbqvbolhKg34djBcf3K9kS164lo5bn4y
	 ESEWaADz2HLM4qBU7R6CzjiziZFScgsKeYVtiMlxp5PIg9KZ4fp2YM84k9mCGfZUZxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793582298;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZddAGYbDrtSr+CZdnQE/HLJuPzfHd++uOjWgRuABxX0=;
	b=dzj46LSF0TAuKqzbF+517d640kLGumuVEpVze4OsFp2O5GTPOecPTAYsbvF0nl3xDM2z
	 a89B3msHyzAUfxy9j+Dv/oeVfRFxJtwyDVJiPTem84F+ew7lRbJzo5a3of6Hp3jd3kYaz
	 99KIIXJPkpApCLlnPZ3+58cww62wGXFLzbkcEQ15DyWEQBGhN+dzL53FDv3YuBjxUNNj/
	 kqL8OYNK3eLCKD+OsW/iN/fI/vaK09RtjyLnZsGIQZX9/xbQTlE0b/sSbJmxxDsy9/PEU
	 4IIvUuRstRK+zx0OaiW1XeFCdEqo9vcunxqTn9MsxVFH2JbR3Oz9q868acRVcaflP6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rbox.co;
	spf=pass smtp.mailfrom=rbox.co;
	dkim=pass header.d=rbox.co header.i=@rbox.co header.a=rsa-sha256 header.s=selector1 header.b=AeAuIpu4;
	arc=none smtp.remote-ip=185.226.149.37
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52814606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 01:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52814606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rbox.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rbox.co header.i=@rbox.co header.a=rsa-sha256 header.s=selector1 header.b=AeAuIpu4
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <mhal@rbox.co>)
	id 1xNggX-008AQr-FN; Mon, 02 Nov 2026 02:18:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rbox.co;
	s=selector1; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From;
	bh=ZddAGYbDrtSr+CZdnQE/HLJuPzfHd++uOjWgRuABxX0=; b=AeAuIpu4g5ZaTB05ZogxxfPgy1
	Ka3aZlbImxCDR3YJU8XtyN2sKHNHFASmcrcpmm0BS25em/4rg+DYzzXYrxZ+xWsIXJRjuLqmo1tBQ
	wnFaBaX/8roBQ/hjAQIKnhwVv0MK7Y/qevBIxPcVdrnoUaXbsdYZ+usjmnYoLspwUn3jKECS8ymPq
	0lPi2mvjt54yXUVR7ga8fUMj5lwfAfmeYb9UdAQ4pcRZI+cevY5EoXGQGbI5kF9hvIDEky/UgvKbT
	6w9stWSTX0clXGCQdIZsG0f6uhpyjKPPRgKbcTRV4CZSIr6LPw/pHUGSMCt/hiZ/u8N0pEXT5uxII
	BqsUktuA==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <mhal@rbox.co>)
	id 1xNggR-0005sJ-VN; Mon, 02 Nov 2026 02:18:00 +0100
Received: by submission01.runbox with esmtpsa  [Authenticated ID (604044)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1xNggJ-008JiF-1Y;
	Mon, 02 Nov 2026 02:17:51 +0100
From: Michal Luczaj <mhal@rbox.co>
Date: Mon, 02 Nov 2026 02:15:58 +0100
Subject: [PATCH RFC v2 1/4] selftests/bpf: Remove sockmap update from
 bpf_iter_unix
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
Message-Id: <20261102-sockmap-update-limit-iter-v2-1-e96a63c43b39@rbox.co>
References: <20261102-sockmap-update-limit-iter-v2-0-e96a63c43b39@rbox.co>
In-Reply-To: <20261102-sockmap-update-limit-iter-v2-0-e96a63c43b39@rbox.co>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Lorenz Bauer <lmb@cloudflare.com>, Eric Dumazet <edumazet@kernel.org>, 
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, 
 Jakub Sitnicki <jakub@cloudflare.com>, 
 Jiayuan Chen <jiayuan.chen@linux.dev>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Simon Horman <horms@kernel.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michal Luczaj <mhal@rbox.co>, 
 netdev@vger.kernel.org
X-Mailer: b4 0.15.2

BPF iterator programs that can update sockmaps will be limited to
iter/sockmap. Remove the update from the unix selftest.

This reverts commit 997b8483d44c ("selftests/bpf: Extend bpf_iter_unix to
attempt deadlocking").

Signed-off-by: Michal Luczaj <mhal@rbox.co>
---
 tools/testing/selftests/bpf/progs/bpf_iter_unix.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/bpf_iter_unix.c b/tools/testing/selftests/bpf/progs/bpf_iter_unix.c
index 3061b148f338..90beada0386d 100644
--- a/tools/testing/selftests/bpf/progs/bpf_iter_unix.c
+++ b/tools/testing/selftests/bpf/progs/bpf_iter_unix.c
@@ -7,13 +7,6 @@
 
 char _license[] SEC("license") = "GPL";
 
-SEC(".maps") struct {
-	__uint(type, BPF_MAP_TYPE_SOCKMAP);
-	__uint(max_entries, 1);
-	__type(key, __u32);
-	__type(value, __u64);
-} sockmap;
-
 static long sock_i_ino(const struct sock *sk)
 {
 	const struct socket *sk_socket = sk->sk_socket;
@@ -82,8 +75,5 @@ int dump_unix(struct bpf_iter__unix *ctx)
 
 	BPF_SEQ_PRINTF(seq, "\n");
 
-	/* Test for deadlock. */
-	bpf_map_update_elem(&sockmap, &(int){0}, sk, 0);
-
 	return 0;
 }

-- 
2.56.0

