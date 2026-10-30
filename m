Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361214;
	b=gTm3CQ50o3VA6jC7KTikloJDPc9uXlk26A9iLRlMhRweW4lk+vbK/sghRAlF/u7af9GO
	 qPXTw3NDnGgXu5o5uOk5nFyIli9oUqhspXByaH08Z77busdqSbI/2VfJMmQJmEArwz+OP
	 x5x0wZUdL3w5XTp6yfOi6CV34NDAPfK0FDP+zrtUNGbeYItmSFP4jzGfhtQArT/POeC4i
	 tYABdc49wnXP88pjuUGmlul7Njz0Orv439aCilAKpeWaWrXZKwvV/SXrb9eMiVeOAB/d7
	 bDGadbaAvrfe86pLkQV/t+s0AgwwZkPGgNzSDfdrvpFstg2yQruIKDJCqenoNqIw/zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=UoxK9/1cELFnYp6P6sTQoajbgJH7VOzsaFPRmpU26Ms=;
	b=TlMfm2V69vbmJ3hWVsoFqQWEqQLrELAh/rhk+t+u0oUwdiZsFRsv4pkELPS0fxhzpB/N
	 1JGzM8dXthRpaVLZRAoeClngPj7ToCNnfCjBKT3A35ENCbYCAzGtw5/Rb9wP5kn+ruzkB
	 6bI9fum+QZT1q+SGhEuBKjMOKI29OsmxHKkgUGg2BgRtDo0paxaTQDCuFPoPd8oaM+9kZ
	 isJTRjUhMoIfnusYVAqwkVz8FND1/wzO9rutaK0wqtrLvxQW+HDw+2gPbZ0W9VDTAXF4S
	 Q/1jiNyj115R65vlr/zXf+6RCsj9tOysMGNKahTI3cE4BfV60UPlNDA/+4useBEqj0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kv4pJV71;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC6A60A263E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EC6A60A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kv4pJV71
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so45283c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361213; x=1793966013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UoxK9/1cELFnYp6P6sTQoajbgJH7VOzsaFPRmpU26Ms=;
        b=kv4pJV71P9w8huHCPikTg6D2/Y5g7GIosa6wvzL6nFCWp7rfHA5ZKfYnj1dJGWRWIy
         xq3oHZA+xBaWO3zh17klv1eaoRi34y1CwgH2v4uLDAhz0Xp/OJZRpNSOGx+6DIwuO9mn
         eg8ZjMEFHgQl+OWOgfUTIk0K7L95SjRq/Rydb5E2uZAtuGip0Ig+5xU4eKGeyVZWLVWC
         cC0jafJ9YCzKuULrjzxgIEVAvjZGMyng/6crdS5xV9vQia/3a5tUGOjJq4BWER0xp9eY
         /CLtbxeZZ9bUfvh6yAPkwPICo+Cvv+tYLr1OSzCyZmtXtcNTOEPzUVXbCnEqiM5eMtX9
         GW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361213; x=1793966013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UoxK9/1cELFnYp6P6sTQoajbgJH7VOzsaFPRmpU26Ms=;
        b=v/3X4MN+UEu1ICnGex2BJDThZg9OxipfII7wtZU1HJ9O/J0QxWFWMwUiEG4p+INGxW
         TYi9aNyr3cF770OulW1ihoq/luOT4cvLSb/E2I4c3ijIi6MgDbdGRja7KhCW6j5Qy6nW
         25oqt5vpQQj/0DI/MjXCBnK+RJMyu/0BZNMQyXaI81P1hoAOsdNwjVneYzospuUyfI4y
         IAWaJxl/SufAjfsFH9pwmncL9JesJcaGfBsFv2c1MfGvrRhCNiskeLFSBJmdo34qyKFl
         UHz83jy3UHvLsNX4PhuVZzlNoNdqS4GEMZq1Lrknt1EoUbusrlMlhaDsFdkT62DMjhck
         8e3A==
X-Forwarded-Encrypted: i=1; AKwUvBwwcovl+v4JgTm2YduLm8/h77dqQiB+Xf7fjm8pcwX7ywmj+9aKFHqJOOoNgNSyWUzvj8T3FU+n6e6VIg8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQvBu5czcHPDDYY5rOSqXC2bf1kG/IOmO1UyTkROkbuLkyNr1B
	gUXwlVUiNCHwZWkhH/0YdZo6ASsnYhj2cEqHv2IpL+Uveto73Dw/1HEpohWt3zxQ
X-Gm-Gg: AYBFou2TCA9jKlVttFn/N37mGoNiRofYvVxvy4zFhM+lj/FNuWNyOZAJ1T8h0wql0h+
	7aZUSc2Mlnu8uxfT0bzINv4Uu/jtZUw6vxTbO7Z4Q8DTYgn5FINEWjXGtmRPq6jml2SF+JL1p0d
	Rcc+aMU7BrNEgS+wQg8yBkp10WZSVaynW56+AieEHD7yvdMnEKYmdHm3NwEuYs64VfyTYvzfgP4
	0HPqRbTRfHDUxXJ3pt5Y6nB3x5WACVqI2UN2m7ik4/qP02SwVZDApX9eJCiVrLpxkmE6i1bwEOb
	kEReyZ9vFjb/xA9jlHJqSPq3xRAsOYEc/8Pck4LVhni2aw7y5KroYXVasVBD1LYdtdSOgU6MVMu
	5RWp7+6ZFtoMuKqI2qk+Yt8JK05L6tB0Xew8MXTbxmHfJiORe8d+Q5c1WraQhqfZr0RdYKOr9i/
	S4kdDhYr+7WXoyh+X/6K1aB7mYCxrySKKsyYrbIZglpdVoA3xlbFImc7Udepn3el0eIaohDKzXx
	IfojRC6EKkdXt3wTxGoN920htqDgk0hyTLIrhfzNwBl9CiwlIiSw3A5Fu+JbyM2u/PJUvoMFrIa
	4RiF5aBBQWMjPQzujA/oGSIK
X-Received: by 2002:a05:701b:4187:10b0:16c:ff3a:d72e with SMTP id a92af1059eb24-1ac5e322fb7mr3093981c88.20.1793361213355;
        Fri, 30 Oct 2026 04:53:33 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:53:32 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:52:01 -0400
Subject: [PATCH bpf-next v2 16/22] bpf: Append the hidden subprog through
 the patch list
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
Message-Id: <20261030-bpf-verifier-patch-batch-v2-16-55cd43439f7c@gmail.com>
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

add_hidden_subprog() appends the subprog for the exception callback by
patching the last instruction of the program with itself followed by
the new instructions.

It does that with bpf_patch_insn_data(), which is going away once all
passes use the patch list.

Queue that patch with bpf_patch_list_add() and commit it right away.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/fixups.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index f55ac904b4e78..84aaaa4632aa3 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -1865,7 +1865,8 @@ int bpf_fixup_call_args(struct bpf_verifier_env *env)
 static int add_hidden_subprog(struct bpf_verifier_env *env, struct bpf_insn *patch, int len)
 {
 	struct bpf_subprog_info *info = env->subprog_info;
-	int cnt = env->subprog_cnt;
+	int err, cnt = env->subprog_cnt;
+	struct bpf_insn *last;
 	struct bpf_prog *prog;
 
 	/* We only reserve one slot for hidden subprogs in subprog_info. */
@@ -1874,13 +1875,15 @@ static int add_hidden_subprog(struct bpf_verifier_env *env, struct bpf_insn *pat
 		return -EFAULT;
 	}
 	/* We're not patching any existing instruction, just appending the new
-	 * ones for the hidden subprog. Hence all of the adjustment operations
-	 * in bpf_patch_insn_data are no-ops.
+	 * ones for the hidden subprog.
 	 */
-	prog = bpf_patch_insn_data(env, env->prog->len - 1, patch, len);
-	if (!prog)
-		return -ENOMEM;
-	env->prog = prog;
+	last = bpf_patch_list_add(env, env->prog->len - 1, patch, len);
+	if (IS_ERR(last))
+		return PTR_ERR(last);
+	err = bpf_patch_list_commit(env);
+	if (err)
+		return err;
+	prog = env->prog;
 	info[cnt + 1].start = info[cnt].start;
 	info[cnt].start = prog->len - len + 1;
 	/* The patch ends with the exit. */

-- 
2.43.0

