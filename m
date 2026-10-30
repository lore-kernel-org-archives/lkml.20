Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361196;
	b=B2sSWCH1Fe2mGr200oWe9A7i2maFWd5nzMlhNyn56ylOqlMpESAoKXqHdND0fn6uvxbP
	 o5acshncHyieE3GtcYkb/sJOKaGko9NL63XsSNaJtvjOIB9i1RIUv56XutYnQ92zCWnWe
	 EMgYciJ3ZzCETE4tMAxZ0ngA0wtir0xmr4igBXm3Y57QGUZkquwXpw2OpxSNj4TmE9tbE
	 lJWRuV941Hfr3AhR/JNADi4PwvRmpyxQcZPjgw3kedVycwFkbmx8wTejljiGysqfEFhm3
	 lug8RDqXFPtQH9i9xvz19rwdW1RHLCxVzEoci6oRGzAUpbI+osufBmPEj/7MeYnX8rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7RaPea1Qjt8hsmpjEa8tMwhSJ3KypYa/1YHVOL45aDk=;
	b=BxzMM69dPsh1GY6kHH19vAkfACCrxo3GV9oSDb54XuHxiiXyCceqiYvumgG0pb+OtXhn
	 oJoKwaNY8zCNRYDiIUuHYiT1sMwSUAOnDwMA9CVf8BT8BCfCmN/zai+NUqCb8jEm+eol3
	 I6xWbsV1GVdbwa9RmAhdrsB2/aK/iuKk2NJ0ZEZUQUpkJHwBIDinnp/oaFj+pTEa2zZyH
	 YLxHcdirjv2gLHGQqIMhprrvYmofYFZvxoiQxsd8wUE1oPvQxG3O6nzZdKC+Zy++UG7LN
	 OkmeY16MJyXv3i2QoxycH0ecZszioIAydZ7vXm8aa5vIsT+qzXXuhef3n6925wDjC6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RI/MK7K+";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6AD606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E6AD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RI/MK7K+
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1adbf62dd31so235922c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361195; x=1793965995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RaPea1Qjt8hsmpjEa8tMwhSJ3KypYa/1YHVOL45aDk=;
        b=RI/MK7K+fVA+qCXVBxa379mqnjirEnm3l6A/b7x1T1+jyHpmAO31rKMcbfZfdWrhh8
         HnVuYJ2PZ1DzLxOObEMchGIbnBAGbfl2m3WNDe8993EbxfCh4Tb6/U41B27bh+aU/Ymv
         Ah/6+7zXJixz91W05I4ZoUe9sEyBqgEDG+rmMTyKfzZqzxeWNvOixWKslgk4+jvBrujy
         R1jm1A7HWWAJc4EZpI75G696hz6fsk0FfBGV3syfi1edJ3yvGy6GBMjdGboedLE2SfOE
         in5t2prwW4yPCrb3f3yXIznOg8o3BkxZF/mS61+ZQ+zWqqKS/65LY2MutedgfdJP3iyf
         E5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361195; x=1793965995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7RaPea1Qjt8hsmpjEa8tMwhSJ3KypYa/1YHVOL45aDk=;
        b=pV0WTPJdaJ5MvfzOm1cNOQXLBhhGuQ0rlsAaQ1zEEpt/e4UnAjD73gtZ9OiYUs2mg6
         ++AtxwIGdEiWUtPygCpelB2btYCTSD4N4dMQuFB7js82uOL7e93p2I5EDdXf/dC+ZuhY
         bVcsvIuMZbMi058mJ5DSOaWcTCIEQhqE8pWM5tbd/hPHt5MlXUJsvXvQGm+HHAty4a5g
         65WJdIVm1IpqYXQ5QKl8JaznSeJMLy0ZVz9RtnG878b6gtkLSOnLvY7bp/eL55435WpK
         6Twh4mRoVz9h4oMvooxn78FhPopcKs89DzltxDYGtIaSTuPNJ770W0kBkuLyptmInv1M
         99uA==
X-Forwarded-Encrypted: i=1; AKwUvBx7aHSOKmr2YjNSnvLDOPn6U4T8RRmt51aDSXJVw2XjPft6rD9lDhYSMgpRp4lJ++K1MYz2lwhko4f7e8o=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7oFMud/F4yt5g5ohFj84FTx9dWwWBkO4IoWY0XzcV+3BTSnlu
	KcWuv9wjAmrdSKI37mcC0lr/exXRf5fRm7U/diVSt0CJ7cW9v/4Y1m96XSj8TW74
X-Gm-Gg: AYBFou22JuRuutBpQEvuma9xjG9fegbdVO2ZEwl2XQqyqJG3hizoxSis0p8JCa0mlDx
	hhv2l580TRTYxZMp0v14t5xZoqtIIPD9hNnctv4ZGqtgP8XQLfZjGfCBqXNUopCiHu5yTjBEmxY
	3Vz+PJypPq3blRezezXs1bAhXQ9oqHzSAM9+WiOeUdNmWYe2FUtxkID1tURP3kQteHCwmF6R884
	rujYZIjbQ0wt0H6KPYlcYtBUAknbeo6z7ONJUt2ZHPa9Hmz8X5CITLB0ZjlC4/Z3cY7MmuN4bRD
	EN7nscpsW/LTkeGkSCJ8xVxqA8xs9g67x8QQG0Vd4cwoF3OVkK4ACdBoQpm7Dv0GTRv0WL9EIZt
	uug1diNkAlU8KaXe4rDnmIXtCm1hNGv0ItgKX/b5r2mP2L2YSD79G3j35WVeTbPyg+bke1nM58i
	NeAzWTNcsV4q36nmpY5AU1QzadOmYVLmw32Iworf6KjJL31mytQaCRmVYf+k9iMmcas0U2UTGe5
	bxpVo3AfmEmyENxMndWlfu8g33yMdfok0S0GoLEdooXw8UkyAsITep3RbmhUJ9Uh1rAzTXlgqFU
	qWP4EyhexMz3aHd+NLFKyCNk
X-Received: by 2002:a05:701b:4549:20b0:14a:51c8:ea06 with SMTP id a92af1059eb24-1ac5d69f695mr2698743c88.29.1793361195245;
        Fri, 30 Oct 2026 04:53:15 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:53:14 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:51:58 -0400
Subject: [PATCH bpf-next v2 13/22] bpf: Allow inserting in front of a
 queued patch
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
Message-Id: <20261030-bpf-verifier-patch-batch-v2-13-55cd43439f7c@gmail.com>
References: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
In-Reply-To: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

bpf_convert_ctx_accesses() inserts the store of the context pointer
for the epilogue in front of the first instruction, and then the
prologue in front of it as well.

bpf_patch_list_insert() only takes an instruction that has no patch
queued yet, so the second insertion is refused.

Put insns inserted in front of a queued patch in front of all of it,
and move the patch down behind them the same way as a single
instruction.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/core.c   | 27 +++++++++++++++------------
 kernel/bpf/fixups.c |  2 +-
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 6e356e16613b3..0447e3b4cfa48 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -746,24 +746,27 @@ int __bpf_patch_list_del(struct bpf_patch_list *pl, const struct bpf_prog *prog,
  * Queue 'insns[0..cnt)' to go in front of insn 'off'. Jumps to 'off',
  * instruction arrays and poke descriptors still name the insn at 'off', while
  * subprogs, line info, function pointers and calls that start at 'off' start
- * at the first inserted insn.
+ * at the first inserted insn. Inserting in front of a queued patch puts the
+ * insns in front of it.
  */
 int __bpf_patch_list_insert(struct bpf_patch_list *pl, const struct bpf_prog *prog,
 			    u32 off, const struct bpf_insn *insns, u32 cnt)
 {
-	struct bpf_insn_patch *p;
+	struct bpf_insn_patch *p = pl->cnt ? &pl->patches[pl->cnt - 1] : NULL;
 	int err;
 
-	err = patch_list_reserve_patch(pl) ?: patch_list_reserve_insns(pl, 1);
-	if (err)
-		return err;
-	p = &pl->patches[pl->cnt++];
-	p->off = off;
-	p->len = 1;
-	p->target = 0;
-	p->start = pl->insn_cnt;
-	p->orig = prog->insnsi[off];
-	pl->insns[pl->insn_cnt++] = p->orig;
+	if (!p || off != p->off) {
+		err = patch_list_reserve_patch(pl) ?: patch_list_reserve_insns(pl, 1);
+		if (err)
+			return err;
+		p = &pl->patches[pl->cnt++];
+		p->off = off;
+		p->len = 1;
+		p->target = 0;
+		p->start = pl->insn_cnt;
+		p->orig = prog->insnsi[off];
+		pl->insns[pl->insn_cnt++] = p->orig;
+	}
 
 	err = patch_list_reserve_insns(pl, cnt);
 	if (err)
diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index bb4fd75a70624..6d99de1be2581 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -429,7 +429,7 @@ int bpf_patch_list_insert(struct bpf_verifier_env *env, u32 off,
 		return -EINTR;
 
 	if (verifier_bug_if(!cnt || off >= env->prog->len ||
-			    (p && off <= p->off),
+			    (p && (off < p->off || (off == p->off && !p->len))),
 			    env, "insns inserted at %u out of order", off))
 		return -EFAULT;
 

-- 
2.43.0

