Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622753;
	b=iUzdCrmq6GVZCtZPYBaKUzVLkyeLB2/iSMmV98TljVHq7GttkVkNNlWcLt7Ps3dzrx5X
	 kD0YsSJz45HIlK1cZKvX2Q/fyRcj64luLQGB/UF8Iqqj4BAhsEq3WV8uGaG3T88u2X0JO
	 NPAn3dbW3NcUHtoylGIXqkG0Zf20Hm9R7f3SI2DDX0nPSCj78B/BF9R1fNrcNq8ciuETp
	 UUmwqTH5E7gl6nA7op/kFMt7kaZ9HxSsHngCEEXak0pPBMvgKQvL0ZBNVED2L4UqhsRE4
	 2+is2W3rSSnAkCv9LXQeIYM7z6FfOL9VvD3eCog03zcK+qgn1gKKlA8lj+PnakJPLMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=X7HK95+Ejz25JT6Hfe+wCQgxilDD6LrZVyreaMFx54o=;
	b=wv+BdK+Ovu0AE7ar1sqLaB8HM1dUaxoZLcR2xYiha4FuxaDdwxbZBvBXpf5ZzcwQNKUF
	 iGyDeniU8zyBxTMzY90O9Jj5sPg5RZPPNDWx718K2S4sI9IGBX0KAG11T6utPCBdoGwoC
	 eriZLGwdffgOBvJvoz3ocrpkbezHqPL87eSc8s31fuZXPQ8gjAipbLqNC9WEx/qbQvdLm
	 t3y+QCkRWvQ0Inpdp3KWrI8OfoQtEXjWgLZcAf7nOyh9mQDfJXqJnCUVt16QBatZuh0lz
	 mborWFZkHTjpWipcoyPRH45L9SHsCMGTt7EP1sCc4ERYMiZUMS28sE/eM0QspAiVJnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="c/E9KdFk";
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393C7606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 393C7606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c/E9KdFk
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so2671131c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793622751; x=1794227551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X7HK95+Ejz25JT6Hfe+wCQgxilDD6LrZVyreaMFx54o=;
        b=c/E9KdFkkQYlPtAuldaJu88tZq1+LgL4K4loOdTzgo6lVjbL+9mjVIc/qHzxkWJmRM
         qO+GfXKnyZ28hwG0cDofLMGssranDxNP1faLTCAkQntDWGo6CCnLJSQ1hiJJtd2acTaI
         7WhzNsMj0IcHIcXkWG2Q6eDQFSM19xV6hajtlIiyqi9yLlX9ITyY5KJkXLI6fejGkNT+
         Mk2aQPaiD7U1FOWlRH6PfG7ZsH+wOs5hx1XLUdX6MOcw80i9iaCuWKPDA+0yCwg6h/65
         sAwBROTPU3h7mARWRVou+4/iROk3ji+SS3WfmRw3ZwYyY7n+54qkjs6UQFdOCMXKyzLk
         J+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622751; x=1794227551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7HK95+Ejz25JT6Hfe+wCQgxilDD6LrZVyreaMFx54o=;
        b=gBVqFoMk2Dn84UIKawhQRbko8VSq8DznfXlzcxM8+eMyMZGGp3Lfdoj4ieENznvjCr
         PLsXk2VZNg2QqHKbwSVAKJT3YfAzRfK0sixqwZNwv6s0WPgGPtIkctHHBlskBa4UqhtP
         4TgfzwTFFJ3AQWIGy87pZl+IEoKxI/YTRAknYBthpcQirRUxkg5byxfUvNMJIXVaF+4J
         hagO7b/+Wr5duraNcJAt0R7uSbcvwDsDGOMgawpXuJ/IGmvcyNRmF3JpN42b6lPpsK0c
         4fxKXCITkFswhx15SNmflnRzRgvYpNgv943eL9B+aE72fc2v/RPva1OINEcrxC6wLsiP
         lJqg==
X-Forwarded-Encrypted: i=1; AKwUvBy/1uIH2O/Frd42sXrXti3rUMq+PSQQB6NWZBHMqiHo/3VLMkhMevruWfAzxsZC4V6OJuIE8AqcFO3sBI8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9Z2KRztaHK+HcPgzIxovv6pm5gGyjtCUVhXd/dANnXKZEroc7
	gYApT3lLrcjnrnbyw1VKwPVU815QvufsegCH+yZjZmS/dgYAGHj4LZ6V
X-Gm-Gg: AYBFou1haL1dzKOazhn/VQ3cGbKSFPAzqq5KPBvZvNa+iCw+71oFffFP8JAko1R3FU+
	OejA9OULANlcV9SeBZL8BEoKArj3bjQhVhZ915aE+6+cjhzmGH6n2XZ6pxhHIzy+lH5FyPyx/20
	VQ24xRJlUv2qJ8JgKnnW1CcsbbZC6eO0zE2MTXSxqcDh3u1q5Y3LXKTQRuAnIpNrIr07wJNwYEh
	CI+2qwKKRuenaSBzCTFC2Djj1C0wNqJCPI0+a4JwyWdmCIbs1/inDXv3B3b0OHZ3Vm2RwSb3s3R
	STEAP7392Ao3ZY3KpzzukX89mhhdYturjhxajIquBPvZozIL1HYOAc4rJsjW4UccuEFeMJda3qE
	ns5kT2EFm4M8rTcAak2SsA3s/CT41m0D9eKj6NyNbUGdd9Ae8yz24kw80nhobQYfdZMzIfN9VO3
	JTTC6GRQqkMQJaPDnnu5tBHZWxdseNzrDCuv+mtCtT+Hetwb3n1DW8GZDd9HMMG5pqPsF4/fyac
	3rX7J8vb9gXyF5lgFl1yJSmUkerhBx+bWEjAGbx/ictuFCAI1kaI3unjUym0xphDAGpMSfQKW6M
	Bk7cda/mLmX5fF8pK4Ue/+kfqKDDaQ55i1uRUYfannWA1Ek=
X-Received: by 2002:a05:7022:fc05:b0:184:992:c9ec with SMTP id a92af1059eb24-1ac5fd06166mr10389427c88.38.1793622751151;
        Mon, 02 Nov 2026 04:32:31 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b2360d2066sm4950951c88.11.2026.11.02.04.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:32:30 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 02 Nov 2026 07:32:13 -0500
Subject: [PATCH bpf-next 3/4] selftests/bpf: Match the insn number of the
 out-of-range message
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
Message-Id: <20261102-bpf-patch-list-followups-v1-3-ddc8ccf40f43@gmail.com>
References: <20261102-bpf-patch-list-followups-v1-0-ddc8ccf40f43@gmail.com>
In-Reply-To: <20261102-bpf-patch-list-followups-v1-0-ddc8ccf40f43@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

"patch list: jump pushed out of range by patches" expects the load to
fail with "insn %d cannot be patched due to 16-bit range".

It matches only the fixed part of the message. Which insn the message
names is what the patch list decides: the jump that got out of range,
not the insn that a patch replaced.

Match the whole message, with insn 2, the jump over the divisions.

Fixes: 67d4d0b73c29 ("selftests/bpf: Test jumps around patched instructions")
Reported-by: Alexei Starovoitov <ast@kernel.org>
Closes: https://lore.kernel.org/bpf/DMKHZS5B5CNO.186F6YH1T6YU4@gmail.com/
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/progs/verifier_patch_list.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/progs/verifier_patch_list.c b/tools/testing/selftests/bpf/progs/verifier_patch_list.c
index 3ba99cf16e96b..045081936d73d 100644
--- a/tools/testing/selftests/bpf/progs/verifier_patch_list.c
+++ b/tools/testing/selftests/bpf/progs/verifier_patch_list.c
@@ -128,7 +128,7 @@ __naked void patch_list_may_goto(void)
  */
 SEC("raw_tp")
 __description("patch list: jump pushed out of range by patches")
-__failure __msg("cannot be patched due to 16-bit range")
+__failure __msg("insn 2 cannot be patched due to 16-bit range")
 __naked void patch_list_jump_out_of_range(void)
 {
 	asm volatile ("					\

-- 
2.43.0

