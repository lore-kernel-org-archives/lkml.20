Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAC83CF1FC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788227863; cv=none; b=qo2KGjpPSH7dOltqt4AmAj1s6AIDhfDCN0hE4HVfmurqLBoYwBBkdf9CIi/5qRvQFGTB+ldGrVBY4FnKkDno3eMOd+8mhV+QeV5UrnNc8Dy7glg3ZYHheBqnrQ31sMB1UFahcpWvZxEvBnUeuCn/c58/TX71BtB7xWmlff5QQ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788227863; c=relaxed/simple;
	bh=hzJqku1NKnKQ3kDzXaTk1gV8CP1VqSkYqMhFtIY65xs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tiNtwPfS9ahB5ssy8rBT6G6OVZ4HjuJmaurOdXKJjEbb371K23x1EkipTKrlwaFUEAipAezh7kQ8stAnMjPhMqHCcL+0Yiu/BoUeERvSo5zWqtLtdvEZ5DMUEsH9y+RIm5fIrwruqYvY++B0F7oNCXqEBUhIELgBHOMvCExQq8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cF+ArRMu; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cF+ArRMu"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5c27e38ee18so2939768e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788227854; x=1788832654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UtPjE3LBTPQKBFDeLu8tjdOsc0ywo3CyI93GelhRobE=;
        b=cF+ArRMunVjItwyPf1xYGRVry5JRiF/u2Wv1TgQ29izrcRAXY6ZaohnwVOQzOMFml6
         VzpEg7rWsgCa9BLLR29L4ZVkLcq6fn5WZY/KTwZ5sIl/dXpxnwn7Xm8P1C3ai602+s4F
         Y1gX+5W9YeDLU84xmMVLlYCbe+b5YcnbndW0XCDOuFbAx7XLs1OEV8FQ6HmYCoFT9+sM
         VSFZREGDCfsHim78+auoVuELCZ6oKi82bP/ccavkSmm6tK8Kc3kdPjWWSyi0+DSdJSrO
         t0rbujfz6ba232onoq1nQRMy5yb4pwPSVb+GiD0EONK605NzzIJEUFkS0Zra8rUzoErh
         DNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788227854; x=1788832654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UtPjE3LBTPQKBFDeLu8tjdOsc0ywo3CyI93GelhRobE=;
        b=BN7olFdHbpmMfZ2AAv1K2wj6/cEl/TA38U+8PbNj71ehGEXPRaLlm/Dhhx2yPcLU2M
         qaSLvtPSl1bQgI3RgIlt8h6BemcHg2MWThp3HqihpRV256iW/YdS4m1ZQZAUepHytSTS
         UpJx2p/Y5URXEK0w7m3cKUlHxndKz5dGWErtnZF7ThpqG6A0LD0ad9/KJZ464VbMEwpb
         ewM1siks5GZkFH/weTys6ScufmCw5xr1WiIuBr8MKkQKs4S9qCqTT+8VMePlazeF+MMC
         yIYONS8BNqsMLacuL1BgnOlhPoUBC01wEMOp0DzkoMl7MKPCslHsT9hXzsSJe1lmxihx
         fwEQ==
X-Forwarded-Encrypted: i=1; AHgh+RokQgvTOIapSoTk8D2BUtSq3VoeJ78gQgUeO/BJetjvSm5nzepUGcd/PdSen5H9pJJWf+NeNQc/JYOXv2M=@vger.kernel.org
X-Gm-Message-State: AFuF++lEQpnP7jIN33ItTu9u+t/vNNRWxUJU/U1AtS3gFw7JaHzdnxCf
	NmIZ7szoQBtfhvfMnNy/mwr60G6FcC13knOb5W4FKa/+iuw691w9MeWTQyPznd0y
X-Gm-Gg: AR+sD10eK2e/23nkP0LtNoQSaz7IUAQHjIwBS/kjm/l79WGbi6WaI7hRj1qsznEKi6M
	65JjUDJp2F8P4QOKE5/aKuDJ6BBT3GzXCMmv/MAnGOjY07j//R0S8j0eZKFj31GsRh6XOQ9T9qN
	HPHc5+8Huh6JU1TAhfk664sm5nIfgp2kLmdLWl1AFjrHY1Btgs618qvB0rqPj1Ip6st6oLuDHjt
	NQP81UwS1KPSO8i9bxeBOM2WXN9KpI9dnC3JMMPa+Z8spemeeWDawCTpMgBEP2VQIgHFSpmh0Qs
	ZN4/ONsxJdRconKiT031OrzMSb/fKxgfk4NvR5JVgNOka7MJhwrybfu8Izz3lFpn1Q77A26K7Rp
	sND7flHq8MKt1VdQZPqAA5I3wJo10zaAz6vtmSXNhZkaAun6oO9Hv8vkowJ2mi+TGX5NB339dHP
	vFiw9TNen7HMO6J2bu65D8mdgFNlsCCphWoWu9g1ZURwIPgwXHBbktQvnECdOYzj8G8Of/v66Ud
	8umjdr7PSo7AUMPKVFoTh6Uj15jaSKwsN8znJ2IYgkwh9sgKva9ew9ppUBisKE=
X-Received: by 2002:a17:90b:4c0b:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-3989c0c7ffemr30120187a91.25.1788227324764;
        Mon, 31 Aug 2026 18:48:44 -0700 (PDT)
Received: from secrnd-cstp.tailb7f510.ts.net ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d7ba9d5sm2820668a91.13.2026.08.31.18.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:48:43 -0700 (PDT)
From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
To: bpf@vger.kernel.org
Cc: Sanghyun Park <sanghyun.park.cnu@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
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
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf] bpf: Fix program BTF use-after-free in sleepable programs
Date: Tue,  1 Sep 2026 10:48:29 +0900
Message-ID: <20260901014829.3504342-2-sanghyun.park.cnu@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Object kfunc calls embed metadata owned by the program BTF. A sleepable
program can remain active under Tasks Trace RCU after its last reference is
dropped, while program teardown releases the BTF through ordinary RCU. The
invocation can then dereference freed metadata in bpf_obj_new().

Move btf_put() into __bpf_prog_put_rcu(), the callback that frees the
program. When teardown is deferred, that callback runs after the program's
own grace period (Tasks Trace RCU for sleepable programs and ordinary RCU
otherwise), so the BTF outlives every active invocation. The non-deferred
path invokes the callback synchronously, so load-error cleanup stays direct.

Fixes: 958cf2e273f0 ("bpf: Introduce bpf_obj_new")
Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>
---
 kernel/bpf/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 6db306d23b479f..3b6cf93c43c4d6 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -2438,6 +2438,7 @@ static void __bpf_prog_put_rcu(struct rcu_head *rcu)
 {
 	struct bpf_prog_aux *aux = container_of(rcu, struct bpf_prog_aux, rcu);
 
+	btf_put(aux->btf);
 	kvfree(aux->func_info);
 	kfree(aux->func_info_aux);
 	free_uid(aux->user);
@@ -2448,7 +2449,6 @@ static void __bpf_prog_put_rcu(struct rcu_head *rcu)
 static void __bpf_prog_put_noref(struct bpf_prog *prog, bool deferred)
 {
 	bpf_prog_kallsyms_del_all(prog);
-	btf_put(prog->aux->btf);
 	module_put(prog->aux->mod);
 	kvfree(prog->aux->jited_linfo);
 	kvfree(prog->aux->linfo);
-- 
2.48.1
