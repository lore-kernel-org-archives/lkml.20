Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221933DAAB7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790650902; cv=none; b=Sru4XwtlvPwUOtKddd/0dFnFMWgbqG2Grh1PfKAShQ7blJziV2gAhO7FfdZtzdj+nmbMiDJEpCEG49r72LoVJSlWPLPe7WzbBxbM1jJHbDSFw4DWwTbgpdQYDcKCatPRS0hQX68fegTj9peuxiAfX0MJRE9LTvZZ8g8SNN5zXAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790650902; c=relaxed/simple;
	bh=tjuHuJmSUWSzgdSY1MqrxhyhZbB4/rCV+kP6Py9vzxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mk2H9qFXYXUDJcog+hbeaUzde+XM+EFUAqWL8ZpMVGTtzoyDW93VV/8HPOAbuqhVRAGo4amfvrGV7AlNCskxugGurAxWoJHCH6iNRloPAMWddta0gc/Nze6eZbP7ukAfm/0e+IKeqFKNhxnW/VxaNwsl3QnvQsupnCXJyzZpEvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=Av2JwbfY; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="Av2JwbfY"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34ac03639e7so476035eec.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790650893; x=1791255693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=By2LEtvJF+8W3qvYb/dMgFvkCaBZwK3OmiKAlzBobDg=;
        b=Av2JwbfYQOAH73ibHQOh53j7ZTDzaN/fzE1EwOUPTZXX+zslX3tu6c1CKp4gBwHMsp
         1VD6D+pfwz7XrWkagsvYyAKvfsUt7D9ouKScqddjpJGWBPBT0Qe+OmF1BqcDrz53GjFv
         z0Yu9gl9xfkIwjo2Elw5APPq+9PsuEdDfrSuHjb+p91WZYtsBZ7JY8u9OfafCV3+prsy
         rtIOlckiqnLZyLrVlBGK4bwh4vFybRFYOidBTMk5KQNaw2p5/9XKzPDI7W0raAsJd1a7
         5HxwePHsklbQ1p/KAAoUOezZ784PL5gRCJPFnA167IksO6pUE+yQiVMHcqJnmYw6fhtc
         bXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790650893; x=1791255693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=By2LEtvJF+8W3qvYb/dMgFvkCaBZwK3OmiKAlzBobDg=;
        b=n8KusnXzkKC4Jd8407SRSQiUhzFlZH93Bhy8i6b+WHotScJrnriuvIixrzaZ6+NTj3
         sVSC9b7eoa8TIvudaeM+kdNGi1aog0KidleisoN3GtnY/pksp77f34aWRH9e+u2xxKKb
         xAQ8wsLpvElRApGOp1AdRpD1q6bTJw8iyaUuUse20EoP4Hl6+pu58pA02eRnuQYIhP6+
         2TpQ+Z8HSoKktxApq6dK8w6ROTzKS5mOCyQ6mjxdQXlT48GsTZeSuV25T8KMzct1JND3
         c+WrbxwlaxWUSnH3HkDk/bPiYjhGw15qvbPaYD6LsnCUiULPwW96HHl9o5LWH34aB/Va
         +Edw==
X-Forwarded-Encrypted: i=1; AKwUvBxx+Sw7+ri/7oRc855vrWV19Wmk91fTnwIsg1SrAfYUjog9nL+vdyp6J7IHRXCsFunc6Rvs7+B1WIsqAms=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLaCCqBr05VhAur7Ynb46jU9dEPYFkhl+YGQYfdSk/Bvphx3/q
	dQVuKowbAdOLJNSw6VBAyBcO+QnOXYls2K9ccQ2U5VHjToFrUeKSHRMO5NuLlPAHikg=
X-Gm-Gg: AYBFou2becxOLtC7BThDYI8EWRJCUZCI5cBzazLvvH4Kx0AMUJK7ustWkgV44+fQ5tY
	Zm9K2f7NyqplyNXOhr628aIiSRCwF5X55rf6u2vHHyLdGla3d/1///fY44R4RycIhcPmg9mbhL1
	CDI0fhdKlTV16Cms8u5FY09tpX0vgEx6T27++mNrMTou+JSkgA6wGKMy8vQD4VVTzBi1Jzv+I1X
	K4ArxDwEyJs9lZ5rkwsqwiPgqWS+iGVErNDnIK5NrqBDpWy8x1I2zHdlMt9sCCBSC/Xh8H82/mi
	7pQLh55tz0IKybXFJruDAaBvC7dhBd14RTlLWMhx50rIGn3cTGYJIIzyvoiCJYSnYb14eMLHN6M
	D1sZnaqBc44gqv5aJDhqdjFJCk7GpDLGIAZhWDSNN3054iidh62nkDgcFJcFxFKn4LusFr8XP36
	leVe87IGg35nXWXCWm4ZI4fcdugVSYKWobL0TGVZHZA6woWTSC3CW4XgCx8kFlGvW6XxfFb21+K
	arr/yFjv5Efqm/aNtqQT4CdoNFE6j+1nIx/+xJHKZQxMgllqwtzwGcoTR3HaT6F74ocpaI=
X-Received: by 2002:a05:7300:a987:b0:33c:1f00:358 with SMTP id 5a478bee46e88-34270ac690bmr14894659eec.17.1790650893218;
        Mon, 28 Sep 2026 20:01:33 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-347323f5a7esm10650314eec.15.2026.09.28.20.01.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 20:01:32 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	syzbot+ad9ec60c8eaf69e6f99c@syzkaller.appspotmail.com,
	Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Simon Horman <horms@kernel.org>,
	sdf@google.com
Subject: [PATCH 6.6.y] bpf: Fail verification for sign-extension of packet data/data_end/data_meta
Date: Mon, 28 Sep 2026 23:01:25 -0400
Message-ID: <20260929030127.86206-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yonghong Song <yonghong.song@linux.dev>

[ Upstream commit 92de36080c93296ef9005690705cba260b9bd68a ]

syzbot reported a kernel crash due to
  commit 1f1e864b6555 ("bpf: Handle sign-extenstin ctx member accesses").
The reason is due to sign-extension of 32-bit load for
packet data/data_end/data_meta uapi field.

The original code looks like:
        r2 = *(s32 *)(r1 + 76) /* load __sk_buff->data */
        r3 = *(u32 *)(r1 + 80) /* load __sk_buff->data_end */
        r0 = r2
        r0 += 8
        if r3 > r0 goto +1
        ...
Note that __sk_buff->data load has 32-bit sign extension.

After verification and convert_ctx_accesses(), the final asm code looks like:
        r2 = *(u64 *)(r1 +208)
        r2 = (s32)r2
        r3 = *(u64 *)(r1 +80)
        r0 = r2
        r0 += 8
        if r3 > r0 goto pc+1
        ...
Note that 'r2 = (s32)r2' may make the kernel __sk_buff->data address invalid
which may cause runtime failure.

Currently, in C code, typically we have
        void *data = (void *)(long)skb->data;
        void *data_end = (void *)(long)skb->data_end;
        ...
and it will generate
        r2 = *(u64 *)(r1 +208)
        r3 = *(u64 *)(r1 +80)
        r0 = r2
        r0 += 8
        if r3 > r0 goto pc+1

If we allow sign-extension,
        void *data = (void *)(long)(int)skb->data;
        void *data_end = (void *)(long)skb->data_end;
        ...
the generated code looks like
        r2 = *(u64 *)(r1 +208)
        r2 <<= 32
        r2 s>>= 32
        r3 = *(u64 *)(r1 +80)
        r0 = r2
        r0 += 8
        if r3 > r0 goto pc+1
and this will cause verification failure since "r2 <<= 32" is not allowed
as "r2" is a packet pointer.

To fix this issue for case
  r2 = *(s32 *)(r1 + 76) /* load __sk_buff->data */
this patch added additional checking in is_valid_access() callback
function for packet data/data_end/data_meta access. If those accesses
are with sign-extenstion, the verification will fail.

  [1] https://lore.kernel.org/bpf/000000000000c90eee061d236d37@google.com/

[ Backport to 6.6.y: implemented the packet-field check without the newer
  is_retval verifier API. ]

Reported-by: syzbot+ad9ec60c8eaf69e6f99c@syzkaller.appspotmail.com
Fixes: 1f1e864b6555 ("bpf: Handle sign-extenstin ctx member accesses")
Acked-by: Eduard Zingerman <eddyz87@gmail.com>
Signed-off-by: Yonghong Song <yonghong.song@linux.dev>
Link: https://lore.kernel.org/r/20240723153439.2429035-1-yonghong.song@linux.dev
Signed-off-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Andrii Nakryiko <andrii@kernel.org>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and bpf maintainers,

I am working through the small CVE backports still missing from 6.6.y.
This one addresses CVE-2024-47702. It rejects sign-extended loads that can
turn packet pointers into invalid addresses.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.
The target-specific adjustment is recorded in the bracketed note above.

Could you please queue it for 6.6.y?

CVE: CVE-2024-47702
Upstream: 92de36080c93296ef9005690705cba260b9bd68a

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 include/linux/bpf.h   |  1 +
 kernel/bpf/verifier.c |  5 +++--
 net/core/filter.c     | 21 ++++++++++++++++-----
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index fd20812cbcc331..1b2f3c94365e72 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -929,6 +929,7 @@ static_assert(__BPF_REG_TYPE_MAX <= BPF_BASE_TYPE_LIMIT);
  */
 struct bpf_insn_access_aux {
 	enum bpf_reg_type reg_type;
+	bool is_ldsx;
 	union {
 		int ctx_field_size;
 		struct {
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index f7f5f54dc44852..46c205087160c2 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -5664,11 +5664,12 @@ static int check_packet_access(struct bpf_verifier_env *env, u32 regno, int off,
 /* check access to 'struct bpf_context' fields.  Supports fixed offsets only */
 static int check_ctx_access(struct bpf_verifier_env *env, int insn_idx, int off, int size,
 			    enum bpf_access_type t, enum bpf_reg_type *reg_type,
-			    struct btf **btf, u32 *btf_id)
+			    struct btf **btf, u32 *btf_id, bool is_ldsx)
 {
 	struct bpf_insn_access_aux info = {
 		.reg_type = *reg_type,
 		.log = &env->log,
+		.is_ldsx = is_ldsx,
 	};
 
 	if (env->ops->is_valid_access &&
@@ -6917,7 +6918,7 @@ static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, u32 regn
 			return err;
 
 		err = check_ctx_access(env, insn_idx, off, size, t, &reg_type, &btf,
-				       &btf_id);
+				       &btf_id, is_ldsx);
 		if (err)
 			verbose_linfo(env, insn_idx, "; ");
 		if (!err && t == BPF_READ && value_regno >= 0) {
diff --git a/net/core/filter.c b/net/core/filter.c
index f568006baafa8a..bcf1f453f0373a 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -8631,13 +8631,16 @@ static bool bpf_skb_is_valid_access(int off, int size, enum bpf_access_type type
 		if (off + size > offsetofend(struct __sk_buff, cb[4]))
 			return false;
 		break;
+	case bpf_ctx_range(struct __sk_buff, data):
+	case bpf_ctx_range(struct __sk_buff, data_meta):
+	case bpf_ctx_range(struct __sk_buff, data_end):
+		if (info->is_ldsx || size != size_default)
+			return false;
+		break;
 	case bpf_ctx_range_till(struct __sk_buff, remote_ip6[0], remote_ip6[3]):
 	case bpf_ctx_range_till(struct __sk_buff, local_ip6[0], local_ip6[3]):
 	case bpf_ctx_range_till(struct __sk_buff, remote_ip4, remote_ip4):
 	case bpf_ctx_range_till(struct __sk_buff, local_ip4, local_ip4):
-	case bpf_ctx_range(struct __sk_buff, data):
-	case bpf_ctx_range(struct __sk_buff, data_meta):
-	case bpf_ctx_range(struct __sk_buff, data_end):
 		if (size != size_default)
 			return false;
 		break;
@@ -9081,6 +9084,14 @@ static bool xdp_is_valid_access(int off, int size,
 			}
 		}
 		return false;
+	} else {
+		switch (off) {
+		case offsetof(struct xdp_md, data_meta):
+		case offsetof(struct xdp_md, data):
+		case offsetof(struct xdp_md, data_end):
+			if (info->is_ldsx)
+				return false;
+		}
 	}
 
 	switch (off) {
@@ -9413,12 +9424,12 @@ static bool flow_dissector_is_valid_access(int off, int size,
 
 	switch (off) {
 	case bpf_ctx_range(struct __sk_buff, data):
-		if (size != size_default)
+		if (info->is_ldsx || size != size_default)
 			return false;
 		info->reg_type = PTR_TO_PACKET;
 		return true;
 	case bpf_ctx_range(struct __sk_buff, data_end):
-		if (size != size_default)
+		if (info->is_ldsx || size != size_default)
 			return false;
 		info->reg_type = PTR_TO_PACKET_END;
 		return true;
-- 
2.39.5

