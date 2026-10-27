Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113377;
	b=jwy4AGl9p0yE61EU9nhygnBnWfwF1M8t+g/QtOj1DI20efdaUk9TFXGJAgqI4JZfZTaM
	 bch1XZf5M3zrs5/MovXRP+sR2BI3PDG5tM4metQrcfjpsrc7+SIDgU20wEYZok1ywubxb
	 Fy3LnkulbzXS1ayjQ06rUwsQIYrJ2oJt9jBPYzFsG2HiW2tj1ACRRKB6v1XeRWydtJ3dN
	 ba/uBlzbnHnPbnwt7YYhjqLOrd1fF0fM7yZNiaJg3VDor1ttzXUBDmCbIiipGoxU47syn
	 PCImhlFPCRHJXXqet7iD49vP3GmXBVFhX7aLsaj7jJMAqnMZt/fI4hj6RY0uoks6Kwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xMtUtPiKGPudRcl9yoWKWTK5iT7yT/I2Zu+Y8WFqLV4=;
	b=skmkj9BFa6UC9xrTAe+04Gqrq8Ne8NStO00/+M/ls3n/O8akVHpqDizgdKhGNhvsFjvW
	 yI4ibcJetD+HxVwUlVD4CzoW8cfHfmJpRZhsgz/VRX6SMtbtsl7vM++824s+J/fP3u0Q/
	 af19fWq6/64Hp3sOShUhTlpf7YsJnSN9CKMVAZ+4xAJs+4NS3HzpJuGIpYXHAS95xITgQ
	 SNYNUD9JLK4ezn/XhjGze61lwIO0WL79n1gFXTOinM1eq7oRbst6/o48H2fR20O5dnPpC
	 YCbi781COYSbgTUnonWbSCYus78Y1D0AegHrRalv6Ukhj2kQfKogUTmd9gdkqc+reHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O570ZE0j;
	arc=none smtp.remote-ip=74.125.231.203
Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C337606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C337606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O570ZE0j
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-4f3f1adebb0so1552435b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793113375; x=1793718175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xMtUtPiKGPudRcl9yoWKWTK5iT7yT/I2Zu+Y8WFqLV4=;
        b=O570ZE0jGBbZRJ58fxR+AmHreUcx/FKLecraYYCQdKoAqZa2+G/VoKnXmzjRjnECqf
         lHZ2X1aWN1t5uzR/OUUYTZJUsxJ5cDStMDeuI9QNJ00TWEs0wHz1w6z9jyz9JS3RyX0L
         S680qr4RrYY2TJNIQJUqX3DekzV5YdBB3WXcXIkC/A/23U8YdHkhUPZgIMbJEfKOIvG4
         NQdIo9PVhAGDS1ezeJV8sYIb68wFePf/ZsCA/J+wW4Hq8B4EhPnRNZa08bHZd1l5sFR4
         8txyC2FMxCTsRtsI2Oj0KsB2KGSMNhO2LNEkbWkdaX6N9m5kseXjA8SkpKZwjS3t5vR2
         dsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793113375; x=1793718175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xMtUtPiKGPudRcl9yoWKWTK5iT7yT/I2Zu+Y8WFqLV4=;
        b=Gcq/McOjUhx2M0hNh5dUzQv2/A4HNZJayz7xIB3c11bXMXizGcDX+B9QxLphBLPTj/
         vla5TqSZyBkAa4k/s2Nqb/lgP28k3bdUeJbLIPZlalJoGyng0Ew/yZ+87Ygnz84SuC6S
         sNOViDpTTKPDosVSuMyNruhsObXpJ5RwVWyGsBCBL06yLv4oeU5M/LPzD0MRO9OtFNle
         AOcvJ+3PxxBC4Y7s5U/iSke+XLXoZCEuFUzW6BvW4hhe9P8S2AkY7xn9nCpUYoQ82zYO
         4ukCu87gPtVVYI0FA9OFOs4L3QVwJfwD3cqZ79PhzHU9R41fy7AdQ0wnt8qGSbUlE4HH
         G2Vw==
X-Forwarded-Encrypted: i=1; AKwUvBwnxV54A/j9pB8EBCJO4pYQvvuE7MKYpmfdy7XJyORVcNbCZtnEL7oZydDmCz1cm6Fbia8SIjj8YfasQVU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaEFbGVnXYghGqFtDVvqzIo12xksa85ZIMFNMqYcuKcij/3ZKU
	mnIAGAR3vlODtOPfyBPWQnHXildlNHrRdmfn+q+RsmiPF+AFnlHgcwTB
X-Gm-Gg: AYBFou0mc/Rl2ZYvg1Xwq1dlnaGntu19RCQWw/Txd/Ca8JUkcNuYhGn3JAQ7rbeC0p2
	hJPtbBcw4+fmwmi3UU6DHKXeRnx6gaMCqZI/GrQ3YnoO2Q1KXmsZ+Ub4bs/gO0ojcLEmY4iIu/k
	6bKfm7vfsmsJPv3AJMXRKA8KuH+o7Xvb3PYzfuLEFl1Q2UsYhtn6r7910HBiIFZPizDtsztIQjn
	Il++bMWX6ji0AUfxG3eXHJt/Qsthokn+iHXBNIp/7qQXHNde7YVrNNPPxCm0O/a27X6CVGFS9xv
	Ah+lO+L9WYQ/3V6sBKfP7nUASBVm7OJ5G5sIPVWcM76IzKnTZH+jra59y+Sigcz6GpD5/irS3XC
	QFNDfkTfDYxqfzhrfk4VPyu/2VwPYhCDM7y52fhKd+R6vozFg5jNjWU0OvhEvuDF0HcN4ZT77yW
	Po0ARWGyu57/1CbExHgkbYhiH1J8BRgWTE5wDxgrbA/MrqvYxoWPI3CTWkfBYvLNo1aMiiw5gqz
	msElaIaVbNCAJ800hEumWxx/KBfykp8GeYS9ag1d5TS+6zOB5zEDbJ17FGL5eUChjefGxujPuKZ
	Mw3dV44CnyjzwTFcxjc=
X-Received: by 2002:a05:6808:250d:b0:539:ad19:d0af with SMTP id 5614622812f47-55c0020a836mr7093980b6e.11.1793113375046;
        Tue, 27 Oct 2026 08:02:55 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c04248804sm7886907b6e.3.2026.10.27.08.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:02:51 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH] bpf: fix out-of-bounds frame access for async callback stack args
Date: Tue, 27 Oct 2026 23:02:37 +0800
Message-ID: <20261027150237.938383-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

check_stack_arg_read() resolves the caller frame with

    caller = vstate->frame[vstate->curframe - 1];

without checking whether the current frame is the outermost one
(curframe == 0). Regular programs always run with curframe > 0 inside
check_stack_arg_read(), but async callbacks do not: push_async_cb()
builds a fresh verifier state with frame[0] as the only frame and
curframe left at its kzalloc default 0.

A static subprogram invoked as an async callback (e.g. via
bpf_timer_set_callback) may declare up to MAX_BPF_FUNC_ARGS (12)
arguments, and arguments beyond the fifth are passed on the stack. When
such a callback executes an r11-based incoming stack argument load
(is_stack_arg_ldx: src_reg == BPF_REG_PARAMS, off > 0, 8-aligned), the
spi bound check against bpf_in_stack_arg_cnt() passes while curframe is
0, and the code above evaluates frame[-1]: an out-of-bounds read behind
the bpf_verifier_state.frame array. frame[] is embedded in struct
bpf_verifier_state, so for async callbacks frame[-1] reads the last 8
bytes of the object preceding the stack element in the verifier state
allocator, and the resulting garbage pointer is immediately used as

    arg = &caller->stack_arg_regs[spi];

whose contents are copied into the verifier register state. The main
program path is not affected: do_check_common() forces arg_cnt == 1 for
subprog 0, so bpf_in_stack_arg_cnt() is 0 there and the bound check
rejects the load.

Reject r11-based incoming stack argument loads when the current frame
has no caller (curframe == 0): async callback prototypes cannot declare
stack arguments in the first place (e.g. the timer callback prototype
has only 3 arguments), so such a load can never be valid.

This issue was discovered by Tencent CodeBuddy Security.

Fixes: 0f6bd5e7a804 ("bpf: Support stack arguments for bpf functions")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 kernel/bpf/verifier.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 5f874979b8d75..1fb3e89ac59b5 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -4232,6 +4232,11 @@ static int check_stack_arg_read(struct bpf_verifier_env *env, struct bpf_func_st
 		return -EACCES;
 	}
 
+	if (vstate->curframe == 0) {
+		verbose(env, "stack arg read with no caller frame\n");
+		return -EINVAL;
+	}
+
 	caller = vstate->frame[vstate->curframe - 1];
 	arg = &caller->stack_arg_regs[spi];
 	cur = vstate->frame[vstate->curframe];
-- 
2.43.7
