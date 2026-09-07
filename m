Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAE427466A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 01:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788745840; cv=none; b=UGDPYzSpwFjReZxzckZKOjLhIuu6kyHGI4Zjxm3rqoHFXWd025CGUF+q+j5geIu0Lx/qQAOd8wRkyj2ZkT8ekhqu7nXjZ/Z2c3BfXOEUVBZRs0cmn6Q1b5zqkyYy1jBZl+O3RAkmii4AAweLXwkULjYT9kTogm3BFqwmZWPigDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788745840; c=relaxed/simple;
	bh=kokv5JN/rnZ77YWSx9XOeaMER5jjb/W4Nrw9yZ3BRMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p+qfrsupwLqrkXsgHMkp5rMEiqvp9ylpzdv11IECc3UxLZ2zCuiP/hTQbTGCCbqTy18MAzd136Kbn8divtbyqVrRjby2YQOMxF0vDIeAXzsd+w3sqZ/zmw/gFbSs88Oa+dhowDnQNPThwZ9Kft99XvQOjUm6WKnF4QcTKmFQbs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LelZQjBO; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LelZQjBO"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d6efd73032so34104785ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 18:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788745838; x=1789350638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j7VWrhpcljpUFr71EmyuJVrRVa0yRu6N4fjJ0cTEZNs=;
        b=LelZQjBOD5xAA/RkOxADMIu2KUxTqQ2XzkjXJQR8pmCbW5TlfbuQCxY/OqGeUaa6mI
         6saYHfLHAWT2e4ODoEJclsBAKCov+JQJa41s6CY0JylADwc3p81km/s46kpGVi1qrqaI
         VtcidgEAZZSxngXWiyty40DJtHZKwNjWU8WoICDCThblS4+vJof86nSyM4sNOGWX1Rn+
         FHuZsP2x7bF4aCjYoq5mhVUGPIvDMyP4WDo3WKKnkK7UaNPWYtNNR9Z1u1qMOHiJg0tp
         d5poD/QVlhWuH/jjYiIoIbw6DGvDRer4541cyoyUGDDFEnVbL0eK+SHmrBBVzOOvyvaH
         l/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788745838; x=1789350638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j7VWrhpcljpUFr71EmyuJVrRVa0yRu6N4fjJ0cTEZNs=;
        b=O3MmJMMdTC41UUV0hkukHv9UwLNeKtsaLlgCXhYHmMimennJ0ZlIoxNBPdZj/L0L72
         nZaEihXdMCF7+F74/D2NIBfrFLKYyvFNZdYnKnQTgQjiF61jjb+vH9O+CgafxroVHnAF
         8FA7h/CA5jK2slick5qZLc7wq2EnOgQz4a0pX2la0WBSC9Q+kD0mid2OJW/2fUtJMmNI
         cM8h/fZphBWN7verHliZRTj49uij8g3OvCm5RpomDx5izZwWdncs3yny4nuStmCBpusG
         iG6OZKlOmKpmhBIVfZ+xrQA+UTbYljFvowcMaUl1Yw6hDw9HWpNIj5ZVqiQ4Hyk38yVj
         yFCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzW4ns9nauVmMvHcP9BpS8jOLaKeQEApKVpcQaRx9CsRq7C3/ey+xV3RvY6n0M5bKGaHIWyDw4ePKEFN3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lxId3i9H2AR1SxQjN0ORSUhqCQTeYi84gX8WzUtf1Fk0c3kJmo
	R/AlI73c5vOsbah2K3xLKnEFZm3alQUfCH1weBPrH2vv4rUyCwhdf74k
X-Gm-Gg: AYBFou0Om7dVHT7MQzR0Io4GlsUsbQZTpY+QiMbED+o2zA6/rbLXoB7JHoHCC/RHVyR
	/ssqypxju3O1fQSKlLJpNzoZ/37cSs6vZdMN1g2DMz7MuqrppMPKaSqTY4Kny8C0ZXASIauKvBL
	4CscukoIkbr1AoueXaFAuD3XRWlHwzsrLuggCIkkcbyn68EVqtm6H0nNYLH4BqyqdUsMkxxkBD5
	mii9ZTjWJ5pt2AgwMtkBQNI6KhPXEeNrP746+UmXzNqwbg2KKbBTJhu9DPfPqXJ0tLavdUwhf2v
	twgWPOML6RxhMv0enZTT0qelpBcIS5/iIiWrhuiK3ir6zDFA9OEl//bZsAdqPPG33BjZxlIpjjq
	ZEu2KOM3GsiK3BLH524lXwo5MoqluYPlirpsX0KhjCw7XmW2/tyAwNgqYVRTRW+8NiDjI8VQhwu
	NEi5UuBrumJ4CzaeazQZUgpL1n13NdwuAkJxmM3FgnHJ8GQ7AhvGIhwRCECbNLpRA0KHE+EOolJ
	kWnFX3iRRx/dKUGHqhYbu0gm4+nAKj+NF1a5O4orEZ6w1Pw42wNA3EeUhVL464=
X-Received: by 2002:a17:90b:2e46:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-39b08653554mr32458723a91.19.1788745837651;
        Sun, 06 Sep 2026 18:50:37 -0700 (PDT)
Received: from secrnd-cstp.tailb7f510.ts.net ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260cd2aasm17142018a91.3.2026.09.06.18.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 18:50:37 -0700 (PDT)
From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	bpf@vger.kernel.org
Cc: Sanghyun Park <sanghyun.park.cnu@gmail.com>,
	Leon Hwang <leon.hwang@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Pu Lehui <pulehui@huawei.com>,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>,
	Xu Kuohai <xukuohai@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v6 1/2] bpf: Validate program attach type during link update
Date: Mon,  7 Sep 2026 10:50:02 +0900
Message-ID: <20260907015003.65087-2-sanghyun.park.cnu@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cgroup link updates compare only the program type. Programs verified
for different hooks can share a type, so a UDP6 sock_addr program can
replace a UDP4 program and write beyond the four-byte ipc.addr field in
the stack-local struct ipcm_cookie. The same gap permits incompatible
LSM_MAC and LSM_CGROUP replacements.

Validate every replacement program against the link attach type before
dispatching to the link-specific update operation. Keep the CGROUP_SKB
CAP_NET_ADMIN check at initial attach so pinned or delegated link FDs can
still be updated after a capability drop.

Fixes: 0c991ebc8c69 ("bpf: Implement bpf_prog replacement for an active bpf_cgroup_link")
Acked-by: Leon Hwang <leon.hwang@linux.dev>
Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>
---
v6:
  - No code changes. Add Reviewed-by tag.
v5: https://lore.kernel.org/r/20260901014713.3502900-2-sanghyun.park.cnu@gmail.com
  - Fold the link-create permission check call onto one line.
v4: https://lore.kernel.org/r/20260831023918.1857658-1-sanghyun.park.cnu@gmail.com
  - Validate every program link update through the shared attach-type helper.
  - Fold the LSM attach-flavor check into that helper.
  - Keep the CGROUP_SKB permission check in the attach-only wrapper and rename
    the wrapper to describe that role.
  - Follow the preferred BPF multi-line comment style.
  - Add focused regression selftests as patch 2/2.
v3: https://lore.kernel.org/r/20260821084726.3769957-2-sanghyun.park.cnu@gmail.com
  - Factor the CGROUP_SKB CAP_NET_ADMIN check into an attach-only helper.
v2: https://lore.kernel.org/r/20260818061021.2551771-2-sanghyun.park.cnu@gmail.com
  - Extend validation from cgroup sock_addr programs to all cgroup program
    types, including exact LSM attach flavors.
  - Preserve legacy CGROUP_SKB ingress/egress replacement compatibility.
  - Keep the CGROUP_SKB CAP_NET_ADMIN check on attach, not link update.
v1: https://lore.kernel.org/r/20260805052858.2390918-3-sanghyun.park.cnu@gmail.com
---
 kernel/bpf/syscall.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 6874ba1424af..2bcd3f3a2a55 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -4481,14 +4481,9 @@ static int bpf_prog_attach_check_attach_type(const struct bpf_prog *prog,
 	case BPF_PROG_TYPE_CGROUP_SOCK_ADDR:
 	case BPF_PROG_TYPE_CGROUP_SOCKOPT:
 	case BPF_PROG_TYPE_SK_LOOKUP:
+	case BPF_PROG_TYPE_LSM:
 		return attach_type == prog->expected_attach_type ? 0 : -EINVAL;
 	case BPF_PROG_TYPE_CGROUP_SKB:
-		if (!bpf_token_capable(prog->aux->token, CAP_NET_ADMIN))
-			/* cg-skb progs can be loaded by unpriv user.
-			 * check permissions at attach time.
-			 */
-			return -EPERM;
-
 		ptype = attach_type_to_prog_type(attach_type);
 		if (prog->type != ptype)
 			return -EINVAL;
@@ -4542,6 +4537,20 @@ static int bpf_prog_attach_check_attach_type(const struct bpf_prog *prog,
 	}
 }
 
+static int bpf_prog_attach_check_perm(const struct bpf_prog *prog,
+				      enum bpf_attach_type attach_type)
+{
+	/*
+	 * CGROUP_SKB programs can be loaded by unprivileged users, so check
+	 * permissions at attach time.
+	 */
+	if (prog->type == BPF_PROG_TYPE_CGROUP_SKB &&
+	    !bpf_token_capable(prog->aux->token, CAP_NET_ADMIN))
+		return -EPERM;
+
+	return bpf_prog_attach_check_attach_type(prog, attach_type);
+}
+
 static bool is_cgroup_prog_type(enum bpf_prog_type ptype, enum bpf_attach_type atype,
 				bool check_atype)
 {
@@ -4606,7 +4615,7 @@ static int bpf_prog_attach(const union bpf_attr *attr)
 	if (IS_ERR(prog))
 		return PTR_ERR(prog);
 
-	if (bpf_prog_attach_check_attach_type(prog, attr->attach_type)) {
+	if (bpf_prog_attach_check_perm(prog, attr->attach_type)) {
 		bpf_prog_put(prog);
 		return -EINVAL;
 	}
@@ -5805,8 +5814,7 @@ static int link_create(union bpf_attr *attr, bpfptr_t uattr)
 	if (IS_ERR(prog))
 		return PTR_ERR(prog);
 
-	ret = bpf_prog_attach_check_attach_type(prog,
-						attr->link_create.attach_type);
+	ret = bpf_prog_attach_check_perm(prog, attr->link_create.attach_type);
 	if (ret)
 		goto out;
 
@@ -5968,6 +5976,10 @@ static int link_update(union bpf_attr *attr)
 		goto out_put_progs;
 	}
 
+	ret = bpf_prog_attach_check_attach_type(new_prog, link->attach_type);
+	if (ret)
+		goto out_put_progs;
+
 	if (link->ops->update_prog)
 		ret = link->ops->update_prog(link, new_prog, old_prog);
 	else
-- 
2.48.1

