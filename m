Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378F940B38C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788808939; cv=none; b=pOQaaSvR+5//DB4pwRg/18ytBEt++2pnJwEgews/IwEhSaZVdaQn/wrUC6zOJIscQhYlts4ckjO9pqhBRVmQQik79rtEUr89QhbR1ed92WVmOygMKagJ/1kYbfWeQ0EakjsvRkdFFpO6Z5a/f+yIq5RH4s21RXsauavRvGYDntc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788808939; c=relaxed/simple;
	bh=n/cGK7wH4GoYZ0duxKFHKYC6m0+42FSlU01hnzjtDIY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cd3V9j9vWj3NeABimYT2hL08dXLTE1QOiGmxdKmklKd8gCzzCO+ptfjpSoshp38uqhkf2AlXUrhqhGcglXDKlzUU3/AGchj2v+5DtuDezA4rioyPcJFc9TyaC71RgdcVLI8ln3NFpeidDH5VILDdWZb3hMFiF++hLWreXZNEIm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbLhcRp7; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbLhcRp7"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso4919729a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788808937; x=1789413737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/5a+7siNK0CHoxNAlmH1/vhMalrfMjpCZxPi0r21nxw=;
        b=cbLhcRp7Mi6/5M2Mfa7q1qiVtPTepa66i9py4PDuu2KNNjFi/ooJcspxVB3+UfCUT1
         fj5D8IImmsFbd8BTTR37MOqm3vN/DAwW5XW7C9QRZ2FRlMDnHzw57hk6Ui6Gx3O9ihL5
         e1R0P6t10un1DQOSl7zAeOhIaJgmPOUB3RSYznQ4aDdrJsiCX5pBJmkZ38a8oR9x2Jwv
         25Jpa1Dvp7gdPqpA6eQrjBo14hb6BxAeNLOsivgevSEXE2OFuMYk6KJxAgq6tlhTSYuA
         OmN6fFD86M7rY7Wg/5LLWcDbMQBOUPSts84jgIMYkXgyYOSUtlhFu1w5j0hhkPUEiDJb
         zkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788808937; x=1789413737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/5a+7siNK0CHoxNAlmH1/vhMalrfMjpCZxPi0r21nxw=;
        b=asu9/MbKQhOAqNH5+Ou3Eaj0I7RhB8IgdLJbvq5jks8AhwKSXYgfEwYin5WoY7aux6
         ht40p6p0XyCYV3YgtC+ObOSiY08Pw/eA4en5uT6MerOz0LCChf3DTM+8QX9I6JpJzD5s
         nVZSIFw5gL4N51+zKK/0k9cSuV+f2U/VE95YPfqmvu0LbbkFTL11O6I1YJC/ERQT2gs3
         u1Sys8uIxuh4n/bVgZZx8KaleouXOi9BTF8wc/Ie7NSoUxUCNeWxjWyRqWFlAhAlWfVB
         DwqPGQY4dLJQxbe6LCWV6nWjA/+8gfwv2IKEWZbrQFIWa5ww9GA1NXyximh/iPJ0fS59
         7wyA==
X-Forwarded-Encrypted: i=1; AKwUvBwyabl4VIgaGXrhumz/FQ5BmnFolsDPME5coGOKi8gpprUznG2OV21tFoDU9yp/9kgQnepZz82t1v3xLww=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ7JlHRsnlECL+moIiKkiDKHXTp8HMd8v218VrgmxrU7sOMkoZ
	8U0vMs1R+DmbxmonbkgZV/UZlxdUe5dr4szcE4+3LU3LQK7raW3YZ8k/
X-Gm-Gg: AYBFou1iwmzKkw8e+pj7wPfHJiXw8DJLS1eiG1Z6+Td93WoFPjtlXlhA/JZCAnRBBPE
	PQD8izO64d9/j760HmH8zcNTZ1BlN74vXd7at9elhzmbNaPQa80OKxCzHSIYmidVLB9C3Utju0M
	sRWeLq6rjcN36E0NLBrpc3RBvf5CcMAVMNARTSgReTMzPz7JowoINE1er1r24GWdrprH7YUyOX3
	nCr6TrGe5fJ/DsmwQQhD1Zh2OFcLtRUryVcDWs+dqvHvbiYIQhPJ2whvxF7XO9KouIxxdUV8RMo
	4RLnLt+Hd3IeglP/L7Z8UHX1llLRA393oLeNtk48DiPoCgdFMKocAB+73odTjei2nF3kuAoxWYc
	+/4kvAeTMDyIwNzY8rM/z58T4LmonBbDERchxJBmYO9koYvd2nLHfKCRRbJqOFOvzEo/d67XUZU
	jrDGxWwzsS7e0xU88TwTkHN0zcI/OXI/WVbdDdMslFRw18PYqksLAT3Lf7y0Xnp8/3GtV9lfNWO
	2kXcZgmrSeMAKEegOZe3DqEnIbtoxI=
X-Received: by 2002:a17:90a:d647:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-39b261074camr36014666a91.6.1788808937535;
        Mon, 07 Sep 2026 12:22:17 -0700 (PDT)
Received: from 192.168.50.3 ([183.193.115.0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae60a8e61sm9991637a91.0.2026.09.07.12.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:22:16 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+adfca3e91be95776@bugs.sh,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH bpf] bpf: refresh seg6local SRH pointer after skb pull
Date: Tue,  8 Sep 2026 03:21:30 +0800
Message-ID: <20260907192129.557377-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An LWT_SEG6LOCAL program can invalidate its cached SRH with
bpf_lwt_seg6_adjust_srh() and then call bpf_skb_pull_data(). The latter
may reallocate skb->head, leaving the per-CPU SRH pointer dangling.
Post-program SRH validation then writes through that pointer.

BUG: KASAN: slab-use-after-free in seg6_bpf_has_valid_srh (net/ipv6/seg6_local.c:1411)
Write of size 1
 seg6_bpf_has_valid_srh (net/ipv6/seg6_local.c:1411)
 input_action_end_bpf (net/ipv6/seg6_local.c:1463)
 seg6_local_input_core (net/ipv6/seg6_local.c:1630)
 seg6_local_input (net/ipv6/seg6_local.c:1639)
 lwtunnel_input (net/core/lwtunnel.c:466)
 ipv6_rcv (net/ipv6/ip6_input.c:351)

Give LWT_SEG6LOCAL its own bpf_skb_pull_data() implementation. Save
the cached SRH offset before the skb operation and rebuild the pointer
from the current skb->data afterwards. Since pulling data can replace
storage but does not change packet layout, this preserves the identity
of the cached SRH even when multiple Routing Headers are present.

Refresh the pointer even on error because __pskb_pull_tail() can replace
the head before a later step fails. Preserve the pending hdrlen and valid
state so SRH validation semantics remain unchanged.

Fixes: 004d4b274e2a ("ipv6: sr: Add seg6local action End.BPF")
Reported-by: co+adfca3e91be95776@bugs.sh
Closes: https://lore.kernel.org/all/GCy0KRM2IcQGoJQTjJEU9D0maBxXzEDHuQpq@bugs.sh/
Cc: stable@vger.kernel.org
Assisted-by: Claude:gpt-5
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 net/core/filter.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/net/core/filter.c b/net/core/filter.c
index 61940e7535523..e61f9e9226b10 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -7162,6 +7162,32 @@ static const struct bpf_func_proto bpf_lwt_seg6_adjust_srh_proto = {
 	.arg2_type	= ARG_ANYTHING,
 	.arg3_type	= ARG_ANYTHING,
 };
+
+BPF_CALL_2(bpf_lwt_seg6_pull_data, struct sk_buff *, skb, u32, len)
+{
+	struct seg6_bpf_srh_state *srh_state =
+		this_cpu_ptr(&seg6_bpf_srh_states);
+	unsigned int srhoff;
+	int ret;
+
+	lockdep_assert_held(&srh_state->bh_lock);
+	if (!srh_state->srh)
+		return ____bpf_skb_pull_data(skb, len);
+
+	srhoff = (unsigned char *)srh_state->srh - skb->data;
+	ret = ____bpf_skb_pull_data(skb, len);
+	srh_state->srh = (struct ipv6_sr_hdr *)(skb->data + srhoff);
+
+	return ret;
+}
+
+static const struct bpf_func_proto bpf_lwt_seg6_pull_data_proto = {
+	.func		= bpf_lwt_seg6_pull_data,
+	.gpl_only	= false,
+	.ret_type	= RET_INTEGER,
+	.arg1_type	= ARG_PTR_TO_CTX,
+	.arg2_type	= ARG_ANYTHING,
+};
 #endif /* CONFIG_IPV6_SEG6_BPF */
 
 #ifdef CONFIG_INET
@@ -9052,6 +9078,8 @@ lwt_seg6local_func_proto(enum bpf_func_id func_id, const struct bpf_prog *prog)
 		return &bpf_lwt_seg6_action_proto;
 	case BPF_FUNC_lwt_seg6_adjust_srh:
 		return &bpf_lwt_seg6_adjust_srh_proto;
+	case BPF_FUNC_skb_pull_data:
+		return &bpf_lwt_seg6_pull_data_proto;
 #endif
 	default:
 		return lwt_out_func_proto(func_id, prog);
-- 
2.55.0

