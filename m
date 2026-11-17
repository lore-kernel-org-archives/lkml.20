Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892939;
	b=2wNtXUpVfer5Ul06p2GUyhQLuyqtDrg7M2ZBErczZBLe+6AqrjNhaJN4OKcSTr5WzK21
	 9Vq1Gu+hEZziz90iWoCe+xARFCk7Ng9ufzj/n/+T4Sk99VkpHMwEX6r55lVaYsmTTiEaQ
	 M/BjT7VH8j2Je2wESmCv6MKK/gOdJtxRgg9ES0M2PZduE9qq4q/xsU1G3m8DQAbmB/z4a
	 whqoJbiio7lAPshGmNemC8w4f1Hno/lGWHQX5eAYPlYcgcWxRIF74FbxMZxTHZZc/wOG/
	 uZ9faUoJaLtMOsTBnqbuAX17YLJ9zQdrtzreA1p9zZ+AjEfQcMeKi7Vh09qC9HHw3+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=KH2EdOZQFCM29AQgS9x2MTO2Oio7leMA6Gbor09I+Fo=;
	b=3/0sX0yGekEvKKjSzZ55GURrwmrXxWBAz0ntId+HRwmMbKw9vqHxMUj60m/CXx0QJ/wo
	 o02/G0CCUk/r1U0zDBfx6EVLyJ8OOXFZSL03zLNJqa82x8Dc6fDZNHqKG7bfjnOv4N8sF
	 FeQ/ji9K7Id4BmgF24GKGgucddvd1HsGDZPjBX/pa/sgviZ5ZO/tHQ0wy8bdUBOyIcGZh
	 /aHH8KK0gmVUupP0B9ZCAZ6pwR81OLEedv+forSLoonW32NEaDuAbQNVd89ufOaUdc4m7
	 r8GLTIVFp9dFyUp56Nt6afrWBFxfHdMkU9W9kxgtD7vNDb5YL6SABuWevcOj5gB4XtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgpotozO;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C212F606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C212F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgpotozO
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9e53d011eso37851385ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794892938; x=1795497738; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KH2EdOZQFCM29AQgS9x2MTO2Oio7leMA6Gbor09I+Fo=;
        b=QgpotozOIwafP7uLbeWT2TODTeVPHollYT3PV4rkXSBXMCIZTTiFHVXcgv5LmUHUAB
         sM6H4SaB+swTJKPebfWdVgNSVhx7Ai2xMgBDufHrFUmSndxJZ4iU4RgEs8IbmCwL44H/
         RnD5BGk7CmQL0gY1bXjT8+5gHGmgOIr7KJ6wJX5KWiZOe0s7QYwEOOaJ8MXVixzFXSCa
         1VMiM5KSBUz6okr0kI9ILn/Bnje5qU8Ge1mOccIz4SKGjP/ftcIb34IS5Xkmuk+vov+n
         dgREl+PhzdtQgnIdT8DpMGklQkSQIzOcNzs6VzOfLvEJvqP16HuoeznE6BuY2LKXBF4o
         tDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794892938; x=1795497738;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KH2EdOZQFCM29AQgS9x2MTO2Oio7leMA6Gbor09I+Fo=;
        b=QYVcYSjuaQHwOCqdBdnadKnmXs5iMQVnzkvU7OGDzTp6b/aKWLSt8KJmC30jZAoevO
         umsxAh0EBkMBKDOJaS3y/pRGXEnlj68jLUe2MAoPOaWf+n/e1CWtvFCg/LocuYXRTe0Q
         QQRiYRpC2Wi1D6d+cnboxLKOUgvkPSy8ADQPCetz9W1I0pqLnhqv7nuPYUfI5+/w4vnV
         XajtQ2MlSP08GwkBaDStiwZEHAArwrU3S/z6BGPo+fqJDAYBeXUSQ+q2nzdhnvOx0Zmg
         9y4EA8kRA3bpMhtdtQYjnirIs9w6NMIvk+edfAxGM4zbzioazz6dHGGc2DmubVOQHJ1B
         dimg==
X-Forwarded-Encrypted: i=1; AL+hErHXUyfIS3d6d3Qz2JYMgSBGmaaY5qdzUAnNn6L6GWWHQI9fXChoOylAb0jWpPxWjhdbg1QbkjW+Zk6u25A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/svvDzshZOxbtEh0XAGj3MYv16ygBKdTs+CKqwgQXg/aKMnkR9
	2EjoLLS/cUJ555/FDecRKRTWOzjmT2AaSbgix4ZUQ+Uyc1c4KA3b79xz
X-Gm-Gg: AZFdTZf8kHDje1/NOXN4yvfYQ1bzf8t4m3H3aPcLpRZhyt2h1F2bOVPfOIdf36iwY6v
	CE/Qg9gIswG1AXcBzMeDCd3LYaCTMLHlI+R+FVioEa750fr2jKaY3kq2ar7igNC5JLPNnsME15T
	LT4LCJLjGnwIDjbPPVbPWy+RIC0VDeTQHtfnDsmjaTHLL8wrSbBdzg3EkrkJ90RlLpVq1Y/fjWA
	AVLJvrcpXVylmhvhruHGGSWjRjiTdXu/4jm+96zyYIiXaUhxWpQqFWHSYRCr6FVGH2iaclMFlO/
	off1THrQ9CNHo3MEiNKQoXAlj8cLS5NoNgTd0JVHXYVIo74uuCniXpgckhYlOI38gBEkMssw+G5
	5z1XZeYpFaJjVCy4SzAX5HFUDrcDkANYmx21m8ztWM5bAZZaBUtfmD+CMxOebTmtCXd0WomTRAM
	NzfWno6FoikdSslJ10iSb+GfJbGE5RS0Y0n24vm7FcteVwjI3NWT4hWAuCIUdSLKvwOvgJvU5r3
	p0PaApiz5bD0BatE0tnL7xPh+IPoV0lDN0dMojZ4nBBa/8Ur+AVrqfjQ2XVhdjEcyDQl4OHs+Kt
	jTvW/+0ITcHBw9Y9ADNBdTEpqhrvpwg7TAa4UmnXNmhtXYLqa9b0FsfZeNkMSKzmONIiGYYoP4J
	HR4AY+xPbQqJ0fl8KAqSGWFJSbyDVow4igw==
X-Received: by 2002:a17:902:d4c5:b0:2ed:3ad6:141d with SMTP id d9443c01a7336-2ee0dad017bmr119363765ad.25.1794892937999;
        Mon, 16 Nov 2026 21:22:17 -0800 (PST)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a4114csm7909205ad.38.2026.11.16.21.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 21:22:17 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 05:22:16 +0000
Message-Id: <DMX8G01GB597.2KEEFI12YK9V0@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Steven Rostedt"
 <rostedt@goodmis.org>, "Masami Hiramatsu" <mhiramat@kernel.org>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>, "KP Singh"
 <kpsingh@kernel.org>, "Matt Bobrowski" <matt@bobrowski.net>, "Shuah Khan"
 <shuah@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 1/9] bpf: Add log support for tracing
 link_create
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Leon Hwang" <leon.hwang@linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <20261114150610.84507-2-leon.hwang@linux.dev>
References: <20261114150610.84507-1-leon.hwang@linux.dev> <20261114150610.84507-2-leon.hwang@linux.dev>
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

On Sat, Nov 14, 2026 at 07:06 AM Leon Hwang <leon.hwang@linux.dev> wrote:

tldr: pls use uapi names where possible:

> +		bpf_log(log, "tgt_prog_fd and btf_id must be both set or both unset.\n");

The uapi fields are target_fd and target_btf_id.
tgt_prog_fd and btf_id are arguments of this function.
Patches 2, 3 and 4 say target_fd for the same field.

> +			bpf_log(log, "Only allow re-attach for tracing and lsm progs.\n");

I think this one misleads. A freplace prog can re-attach.
It has to pass target_fd and target_btf_id.
The comment above the check says so.

> +			bpf_log(log, "Invalid attach_btf.\n");

attach_btf is a field of bpf_prog_aux. The user never set it.
NULL means that the prog was loaded with attach_prog_fd.
Such a prog can't re-attach at all.

> +		bpf_log(log, "Invalid kprobe_write_ctx.\n");

Another bit of bpf_prog_aux.
The rule is that both progs write to pt_regs, or none.

> +			bpf_log(log, "Invalid tracing attach_type.\n");

LSM progs get here too.

diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 35f8a71..85d97cb 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -3712,7 +3712,7 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
 	}
 
 	if (!!tgt_prog_fd != !!btf_id) {
-		bpf_log(log, "tgt_prog_fd and btf_id must be both set or both unset.\n");
+		bpf_log(log, "target_fd and target_btf_id must be both set or both unset.\n");
 		err = -EINVAL;
 		goto out_put_prog;
 	}
@@ -3725,14 +3725,14 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
 		 * attach_tracing_prog flag is set.
 		 */
 		if (prog->type != BPF_PROG_TYPE_EXT) {
-			bpf_log(log, "tgt_prog_fd is only allowed for freplace prog.\n");
+			bpf_log(log, "target_fd is only allowed for freplace prog.\n");
 			err = -EINVAL;
 			goto out_put_prog;
 		}
 
 		tgt_prog = bpf_prog_get(tgt_prog_fd);
 		if (IS_ERR(tgt_prog)) {
-			bpf_log(log, "Invalid tgt_prog_fd.\n");
+			bpf_log(log, "Invalid target_fd.\n");
 			err = PTR_ERR(tgt_prog);
 			tgt_prog = NULL;
 			goto out_put_prog;
@@ -3787,13 +3787,13 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
 		 */
 		if (prog->type != BPF_PROG_TYPE_TRACING &&
 		    prog->type != BPF_PROG_TYPE_LSM) {
-			bpf_log(log, "Only allow re-attach for tracing and lsm progs.\n");
+			bpf_log(log, "Re-attach of freplace prog needs target_fd and target_btf_id.\n");
 			err = -EINVAL;
 			goto out_unlock;
 		}
 		/* We can allow re-attach only if we have valid attach_btf. */
 		if (!prog->aux->attach_btf) {
-			bpf_log(log, "Invalid attach_btf.\n");
+			bpf_log(log, "Cannot re-attach a prog that was attached to a bpf prog.\n");
 			err = -EINVAL;
 			goto out_unlock;
 		}
@@ -3849,7 +3849,7 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
 	 */
 	if (prog->type == BPF_PROG_TYPE_EXT &&
 	    prog->aux->kprobe_write_ctx != tgt_prog->aux->kprobe_write_ctx) {
-		bpf_log(log, "Invalid kprobe_write_ctx.\n");
+		bpf_log(log, "Only one of freplace prog and its target writes to pt_regs.\n");
 		err = -EINVAL;
 		goto out_unlock;
 	}
@@ -5921,7 +5921,7 @@ static int link_create(union bpf_attr *attr, bpfptr_t uattr, struct bpf_common_a
 	case BPF_PROG_TYPE_LSM:
 	case BPF_PROG_TYPE_TRACING:
 		if (attr->link_create.attach_type != prog->expected_attach_type) {
-			bpf_log(log, "Invalid tracing attach_type.\n");
+			bpf_log(log, "attach_type is not expected_attach_type of the prog.\n");
 			ret = -EINVAL;
 			goto out;
 		}
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index ce11e78..ce7f530 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -23873,7 +23873,7 @@ int bpf_check_attach_target(struct bpf_verifier_log *log,
 
 		if (bpf_prog_is_dev_bound(prog->aux) &&
 		    !bpf_prog_dev_bound_match(prog, tgt_prog)) {
-			bpf_log(log, "Target program bound device mismatch");
+			bpf_log(log, "Target program bound device mismatch\n");
 			return -EINVAL;
 		}
 
@@ -24133,8 +24133,10 @@ int bpf_check_attach_target(struct bpf_verifier_log *log,
 
 		if ((prog->aux->saved_dst_prog_type || prog->aux->saved_dst_attach_type) &&
 		    (!tgt_prog || prog->aux->saved_dst_prog_type != tgt_prog->type ||
-		     prog->aux->saved_dst_attach_type != tgt_prog->expected_attach_type))
+		     prog->aux->saved_dst_attach_type != tgt_prog->expected_attach_type)) {
+			bpf_log(log, "Target differs in type from the target at load time\n");
 			return -EINVAL;
+		}
 
 		if (tgt_prog && conservative) {
 			/*
pw-bot: cr
