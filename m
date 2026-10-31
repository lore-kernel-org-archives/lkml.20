Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793424586;
	b=SZRL6uX1G29dxNw3ML3YVBO+DKra3M91WBWpupPfs+qbIuyhNElk3qz0qmxLioHZHmfi
	 dFE35dpNvS9n6XtU588e/Ol7h6eOHNCToYbwVxntlMLHh6vldgv2pT7HMOTdmm1IDiwV9
	 qbg9uVwrwZTU/9ENwyJEItKP2rL9W8PPTS6Gwc6wsBs92I4njRqtaDP3DK5l3xDO68fUy
	 o8/b4jjUQbM3O9v/Z3b+b1+HIc5GF67hOPlaCGqWrKm09z3B+GTgcDBP588dEqtDakLy/
	 inWiz+uOlhyPRvkfkXeIlidt4UcvRehQVDC1ZXHgy11MpNly9KRq5Xmk/gZgGB6cTwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793424586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=pPCYtQzMZtajXWmvtb2q+ThOcxjNXkaUo5PJHZCV/CM=;
	b=O1/IuQH1TDLUuDvtNR9ZT6NGMXJRqw1LP4OUuS6gkp5Yu3XWryM98LwxQVaqzjUtAdsM
	 ecqUc7pBLiu6gFTp7MF778J72QXDi+MFv6Tc8ED/PydTLvQRt9bQmew+pG/9Ul9ZywSw8
	 nfuLixVQekjlSudLZx6kk4BVQ6D79L61FWE3/BxJT35odNCNS8m+3URydBgCttTU7dmUL
	 5jHQdjX4OJ3ZCqy6U/hLxMj5Ln0XLVIYsiVdOYLUG4s2PwXMavvX+6piJKJgkHCjl3Px8
	 YB7LiXbcnP1I8at1dgC6OhHvkyfz3qNYeP6dpt/bfX8+8WOs6MltI1WWlkjzP1b8wQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ocmjj6TV;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94FF606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94FF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ocmjj6TV
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so872509a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793424585; x=1794029385; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPCYtQzMZtajXWmvtb2q+ThOcxjNXkaUo5PJHZCV/CM=;
        b=ocmjj6TVIvlHNqe4suqwOILLkAWxwzL2+oK3CrsX4xlSxWKBbGvRQxBURZ6Hoa1vkQ
         /MCoc2qsnAJwrym5ldC7tWZaik4xJgiRUwuGDrM013ukasqiZTX7EOjTDpKU2W+nv+Lp
         +r4Oyojn0AcdY6tZI32VcYdlKIM6FZXMEnakR+WWXid2sLZbpKB2/DlSyHH1X9/6NOvn
         sKT/Ve5Yr5wO+HcxxcwNV1VEsFPg2aUVDlSq1Hl+Ab8rnBHiM+OkVbJMzkyM1SxoME+8
         HoDqGtybBm/6JHnUlk2lhcLE9k8UlOQpBE8/nCzMyQPYtUIaTIHzDPiMp9qXS6OCoOaS
         BOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793424585; x=1794029385;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPCYtQzMZtajXWmvtb2q+ThOcxjNXkaUo5PJHZCV/CM=;
        b=zaio5dCDYGCkThocWkAZCFtN6jbXLsjd/JzhzKQEneZCqJtPW5Xx5Q4ZSnQSlEePMu
         6XLVIoBnMg/uiuX+3J8C62veL+zKhAJS/nGKX7g2OGACaSH+kRRdnTd+BZfIaeMINJIn
         W7pHqRZG9UrPazBoj2TD2bGN3W8KIiaOM+QBEVusx+bjO5+NFY3nzANkRrsBRR0iCqZt
         ZhrSdxoGgc5uy9C7WCfq5b2F3HEB2ECA3N+ph6KyRNlATmQZzGozGA0jY0/dLK8C00KL
         zff8PvTF4NZR4uWGRKh92mhRNYHJVj87fWViJtYtjvtsWs3CweFCI6o3gdZrCux5MUWi
         cVPA==
X-Forwarded-Encrypted: i=1; AKwUvBwxMTOWWXmjWc9GrBejFLfpfV3SYn68oIE1UYNZ6pKVZcy9J8N8ucuB9V6mI+G4UfVUxXARCM+oGJRZ5cw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3eYTor2JRdD7Q4wMw/68WmuX02q/1KPJX/pDRTHybvybwcMgk
	48HXjIgwOUUSbd38ynox+lm/vGo8FLf749sM44Kvy+GJQ+6ekyv4R9m5
X-Gm-Gg: AYBFou18ZSvpnGkDrm61u0qY7oqpbTMrMbP89JcAXT8MiIjhDVEqnqY3ceTmLDFEArQ
	M4Ng9kap43Jw3MSV+Pe6uweA55ZbJbCejABPVRuxMvm+hZsEeEO1sklkrJEpxw5+wOYxLrNQeBM
	gUs0lzVq/derrum76sJRAQgViLbYv/P6xF0mgzyH9esY6uY8TnN5S4ne1ezPoMgf3IFXnH8kgje
	hH9MMHxSgYi/U3rDbS+qvDzvhdN7rpnIEGe8VgJ6XfvtyaF78+Uin8FW+D7GyqXrLJ7BgyPM+YW
	bsvuNq77+asOvtEfgbAVflSXwPNaY0ptPxoC0IjbM2iLfMxsENH6TEky4qRQVqQts5Kcwr9W82b
	84QPQmGkuHMat7qJVl66d/u4m+x3PZK3kqlTajusQVlDDs5iIF0HfumB3kDStJ70VcpBH8VROH7
	VKnd9xqfzEMIPi1nfaXhRCZNrUwS+t56hGAOr2//mkARXKDmuWZ0SSMaKj7/qlT2hAJLP5D2yuF
	NuGMgaZM8GDnsN9zd8HwB459zsOk3sqH/BO1CPqiPbAwjNVrzIToiNm+MCy/jEViDseXdUjNlVE
	GEmd13UYCE3g/xwJEhM5rwSnZixPQIguZPT9dBdTXsCeAq0xF67vNvj9KFclo65htsmPPx8WFly
	ysA+FWlwNDHrW4gw4Qqs1tA5Zx8iVEy/kjhI=
X-Received: by 2002:a17:90b:4c4c:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3ae8972b662mr2341161a91.19.1793424584986;
        Fri, 30 Oct 2026 22:29:44 -0700 (PDT)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8826a769sm2582771a91.4.2026.10.30.22.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 22:29:44 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 05:29:43 +0000
Message-Id: <DMIRYFU9YEX1.14HBEXD0UQR7H@gmail.com>
To: "Qiliang Yuan" <odys.yuan@gmail.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 07/22] bpf: Let the patch list remove
 instructions
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261030-bpf-verifier-patch-batch-v2-7-55cd43439f7c@gmail.com>
References: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com> <20261030-bpf-verifier-patch-batch-v2-7-55cd43439f7c@gmail.com>
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

On Fri, Oct 30, 2026 at 04:51 AM Qiliang Yuan <odys.yuan@gmail.com> wrote:
>  	bpf_patch_image_install(prog, &img);
[...]
> +	/* before subprogs are removed, since it looks at them */
>  	for (i = 0; i < env->func_ptr_cnt; i++) {
>  		struct bpf_func_ptr *fp = &env->func_ptrs[i];
> +		int subprog;
>
>  		if (fp->xlated_off == BPF_FUNC_PTR_DELETED)
>  			continue;
> +		if (bpf_patch_image_deleted(&img, fp->xlated_off)) {
> +			subprog = bpf_find_subprog(env, fp->xlated_off);
> +			if (subprog <= 0 ||

Sashiko is right. It's real, and it crashes the kernel.

bpf_patch_image_install() already set prog->len to the new length.
bpf_find_subprog() gets an old offset and compares it with prog->len.
When the prog shrinks enough it doesn't find a live function.
The func ptr is marked as deleted and the slot in .rodata becomes NULL.

It needs two things:
- the first insn of the function goes away as a nop
- this commit removes at least (end of prog - start of function) insns

Plain C hits it:

  #include <linux/bpf.h>
  #include <bpf/bpf_helpers.h>

  struct st { int a; } g = { .a = 10 };

  #define OP(name, expr)					\
  static __noinline int name(struct st *s)		\
  {							\
  	if (!s)						\
  		return bpf_get_prandom_u32();		\
  	return expr;					\
  }
  OP(op_a, s->a + 2) OP(op_b, s->a + 3) OP(op_c, s->a + 4) OP(op_d, s->a + 5)
  OP(op_e, s->a + 6) OP(op_f, s->a + 7) OP(op_g, s->a + 8) OP(op_h, s->a + 9)

  static int (* const volatile ops[])(struct st *) = {
  	op_a, op_b, op_c, op_d, op_e, op_f, op_g, op_h
  };

  SEC("socket")
  int vt_all(struct __sk_buff *skb)
  {
  	int i, sum = 0;

  	for (i = 0; i < 8; i++)
  		sum += ops[i](&g);
  	return sum;
  }
  char _license[] SEC("license") = "GPL";

The verifier knows that &g is not NULL, so every op starts with a nop.

  bpf-next:     Return value: 124
  this series:  BUG: kernel NULL pointer dereference, address: 0000000000000000
                RIP: 0010:0x0

That's the shape of any table of ops.

The minimal fix is to do the lookup before the install.
On top of the whole series:

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index a442188647bc..de758ce7afac 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -451,6 +451,28 @@ int bpf_patch_list_commit(struct bpf_verifier_env *env)
 		}
 	}
 
+	/*
+	 * Before the new image is installed and subprogs are removed:
+	 * bpf_find_subprog() looks at prog->len and at the subprogs.
+	 */
+	for (i = 0; i < env->func_ptr_cnt; i++) {
+		struct bpf_func_ptr *fp = &env->func_ptrs[i];
+		int subprog;
+
+		if (fp->xlated_off == BPF_FUNC_PTR_DELETED)
+			continue;
+		if (bpf_patch_image_deleted(&img, fp->xlated_off)) {
+			subprog = bpf_find_subprog(env, fp->xlated_off);
+			if (subprog <= 0 ||
+			    img.new_off[env->subprog_info[subprog].start] ==
+			    img.new_off[env->subprog_info[subprog + 1].start]) {
+				fp->xlated_off = BPF_FUNC_PTR_DELETED;
+				continue;
+			}
+		}
+		fp->xlated_off = bpf_patch_image_remap(&img, img.new_off, fp->xlated_off);
+	}
+
 	bpf_patch_image_install(prog, &img);
 
 	for (i = 0, k = 0; i < img.cnt; i = end) {
@@ -474,25 +496,6 @@ int bpf_patch_list_commit(struct bpf_verifier_env *env)
 	env->insn_aux_data_len = img.new_cnt;
 	data = NULL;
 
-	/* before subprogs are removed, since it looks at them */
-	for (i = 0; i < env->func_ptr_cnt; i++) {
-		struct bpf_func_ptr *fp = &env->func_ptrs[i];
-		int subprog;
-
-		if (fp->xlated_off == BPF_FUNC_PTR_DELETED)
-			continue;
-		if (bpf_patch_image_deleted(&img, fp->xlated_off)) {
-			subprog = bpf_find_subprog(env, fp->xlated_off);
-			if (subprog <= 0 ||
-			    img.new_off[env->subprog_info[subprog].start] ==
-			    img.new_off[env->subprog_info[subprog + 1].start]) {
-				fp->xlated_off = BPF_FUNC_PTR_DELETED;
-				continue;
-			}
-		}
-		fp->xlated_off = bpf_patch_image_remap(&img, img.new_off, fp->xlated_off);
-	}
-
 	if (img.del)
 		patch_list_del_subprogs(env, img.new_off);
 

With it the prog above returns 124.

But that fixes one instance.
The commit changes prog->len, aux data, func ptrs, subprogs, line info and
insn arrays one after another, and helpers read env and prog in between.
So the order of the steps is load-bearing, and nothing says so.
Make each table a function of (old value, new_off[]), with no helper that
looks at env or prog, and install the image as the last step.
Then this class of bugs cannot happen.

Please add a selftest for it: callx through a pointer in .rodata, the callee
starts with a nop, and main loses more insns than the callee has.
All tests in patches 21 and 22 pass on bpf-next without the series,
so they don't tell whether a remap rule of the commit is wrong.

Also patches 4 and 6 don't apply anymore, since arena_scalar is gone.

Other than that the patches look great.

pw-bot: cr
