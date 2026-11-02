Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623039;
	b=NIlNFoFulZwgitPG3pAikxqzZ4iuwqJZ7Hwq2eYZqRdKGiDEGp1VOMwGNDtx7eYZIbJO
	 zjtDNg8JPl1WGbbVL9scYIc8P5RED01/fHU4hx3cQd2DS1w9Mu+2TJKQcnsO7QdGMDJOq
	 JPewS6D5lIwe0Utn0oeJ02W0z63z784gyYaxx2l8rNWTDdge2Ynuuu4YhZ8H/dwrqxhGo
	 prbCtZB58UAH6fDCo5pH+Uz49ppYktoaI3/H3KskXYxYHaoFB8IrpUFYnXhNRQiIXv8HE
	 DsvZlU5SbyYOkRhDu8vouCw4+srvrb44ZpsxDfMdeGJ5Ougqf2nXXeXjxzlGM1DaAGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=UjBzccaJDDlTsbT7lY8oUdWUO7cHir5+ebQJXokkFqw=;
	b=Y0KoEkapcpL36wipAqdZl8TO4sUA1pAhc+68lNLjgW7Cuw2ZpSihfS/aPIQJi4Lc8/Z1
	 wB8qv8Y6Hnx6V3ACTfJC30hmcIdZ9Y3OBvfmpWoJyJMGNc9PbimZGmIpLUdk/G/4RkU1f
	 m3zkytFS9zGUh2EtWFKkJI1d6qFP+btbi6VgG1NkGysJNWRQ96By9FV2szUD4riUegLPy
	 9odPDzi/ocCcvI50e+e14PEvL7bL528pbrEBsaBp9lhhE8efWidZueZ5WC5rFAKL4Bsj0
	 qSH4wjJ2FgVrLOiXjS1B5yEHOfmOPU5VpGx1heK7dnHDGQzNO2w32i53UTUUgdSud7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pSdxvYEa;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDAD606A335
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BDAD606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pSdxvYEa
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a17a332ecso4677459eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793623039; x=1794227839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UjBzccaJDDlTsbT7lY8oUdWUO7cHir5+ebQJXokkFqw=;
        b=pSdxvYEaXJkhqfPlsGxTuQA2m33GSpJYR2vhxJa1+ZrYumZkFLUcuwchm9jpzrSNRk
         UzkKbt37f5AeVZHpA0d15xNQJgc94ZU58Y46J3sdd8FKUO5Kk1bUzEBBdJdHu5HdXhaN
         mzPw3lO2D5zHTVHDUbdCNJnLRaGAyAl2F/7RCeuadNwmLat9snzopuhLI4IU3/t0lpAg
         yz2z35wNTZ4H8KBMop0i+viOahduXqQhtKaAfrSvNOb66VIRms7VtvYBtSe5F2rcI7+H
         XySFS0sBj6W5c4YxpowSdI9lyo5UzRZXT4V2fPBa3/8AMsQAby9x/8gWLrHvkWLL2/xn
         mrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623039; x=1794227839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UjBzccaJDDlTsbT7lY8oUdWUO7cHir5+ebQJXokkFqw=;
        b=OKqC9lIlBlsPn+anVe/Xi18QZds9UKNY5blhZWXP8MhikxNDkL/F60gPj0X0OVdrLQ
         rM/jeDttQuMd+cENeFLCEE2uqMSO47LhBVlNvbzYXpFOBUTsUdScuOOqc7bsL5NwUujn
         /vjkWzY621OH/wcuwohlNyJFjh09CPTbPZ799vu5a+dWQEnnD0IoEyGitkmAobR0imuB
         4183f3bMSHOl4ktwue0FOdU2cZcIRexMTqEy2BtVKV+KI6f0XgocBCKbRV55Eq4eRPDs
         wUrcFkmWYgQGLxAmbsVHTMu+aeK/7nvBTl2z0ZLli65K0FvBYuyottwF07vn2+CBwf6Z
         stPg==
X-Forwarded-Encrypted: i=1; AKwUvBwozEt497dbgDu/XFi0WYbesnjDAcoSa7KeLsweP6yI6IqZ4YusR3OjJ48LCgY5mJlQBFIhvSiUsmXeRC8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rvUVHasWX125CXk0xJEoP6OgSup7jRx5sZHJChiMYTRHpL7oX
	YuyAnA7zkB/46KMV/yf3TyQ6Cv9fX+YRywvN25HyYBy7MLR2ak+rvOQX
X-Gm-Gg: AYBFou2ksB4CvsyYuy5zCXxEfzIhjumUUbrwWg6RHnFuMjXYc42rV/9PobubfcAW2y4
	zareiLYvb0iRfPERvsPwbAR1Ddj6ClT+cdZEip04jpmjMUr52PYhkmvzVT4I1bh5QvtXynKJny+
	C1v5FVEGmwyXEm9mq58MW27p/fJGfinYDGey9Lll/Nh889bQ1qrLzRPZxnj3zoe5YYRChhTHgbG
	GofTRjIo3RAk9UwfMXZjLXPShycnLm4tI5MOiveRu7l/6hg45GJm6m7hH31fsdbRB7z8s4xBIcz
	Yvfr7fBk0+4/924cjlb1TZhlZwnPivOj9mhYRUYXIsBpFl5bRQ9MVJ6gGftPZ4H5v77CZUmsY3v
	k1v2TMxUM1DdRrP2YnWfwXNYg2J9466UX5QmqVtCiqbcxrE6/6nmWMB9RDV7r4Jha2/zvao8hV+
	FWvhPx0ToJwpsO/azBFivrjhPqA/BE6LAb6STakdGB9L8BurJb5LZ9qo21244w16ZLyx4IHiMum
	KpFWYvct5B+PtdGZwoj2Buhmv3kgVRwa5outFgBlM7RCSDM702lA/mSpJWHYCi5uS3p7WB1D1NK
	+BComCL10t7nBiIr9nWxkXq6
X-Received: by 2002:a05:693c:638e:20b0:366:703c:5ef8 with SMTP id 5a478bee46e88-36a423935f0mr16041785eec.7.1793623038614;
        Mon, 02 Nov 2026 04:37:18 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm36326095eec.6.2026.11.02.04.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:37:18 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 02 Nov 2026 07:37:02 -0500
Subject: [PATCH bpf-next 2/5] bpf: Keep the barrier of a nospec insn when
 removing nops
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
Message-Id: <20261102-bpf-blind-nops-fixes-v1-2-844300e42cdb@gmail.com>
References: <20261102-bpf-blind-nops-fixes-v1-0-844300e42cdb@gmail.com>
In-Reply-To: <20261102-bpf-blind-nops-fixes-v1-0-844300e42cdb@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Luis Gerhorst <luis.gerhorst@fau.de>, 
 Henriette Herzog <henriette.herzog@rub.de>, 
 Anton Protopopov <a.s.protopopov@gmail.com>, 
 Xu Kuohai <xukuohai@huawei.com>, Hengqi Chen <hengqi.chen@gmail.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

When an insn is unsafe on a mispredicted path, the verifier marks it
nospec, and bpf_convert_ctx_accesses() puts a barrier in front of it.
The verifier doesn't check the mispredicted path beyond the insn.

bpf_opt_remove_nops() runs before that and doesn't look at the mark. A
conditional jump can be nospec, then become a 'goto' over dead code,
and then a nop. The pass removes it, and the barrier goes with it. Here
the jump behind 'r1 = 0' compared r1 = r10 on the mispredicted path, for
a prog loaded with CAP_BPF and without CAP_PERFMON:

  0: call unknown
  1: r0 &= 255
  2: r1 = 0
  3: r0 = 0
  4: exit

Don't take a nospec insn for a nop.

Fixes: d6f1c85f2253 ("bpf: Fall back to nospec for Spectre v1")
Cc: stable@vger.kernel.org # 6.17+
Reported-by: Alexei Starovoitov <ast@kernel.org>
Closes: https://lore.kernel.org/bpf/DMKHZS5B5CNO.186F6YH1T6YU4@gmail.com/
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
For stable: before the patch list, opt_remove_nops() in verifier.c
removes 'ja 0' and 'may_goto +0'. Skip an insn whose aux data has nospec
there.
---
 kernel/bpf/fixups.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index ead78713e04f4..0cc758749be9b 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -699,7 +699,8 @@ static bool insn_is_nop(struct bpf_verifier_env *env, int i, int next)
 {
 	struct bpf_insn insn = env->prog->insnsi[i];
 
-	if (env->insn_aux_data[i].indirect_target)
+	/* keep a nospec insn, the barrier in front of it must stay */
+	if (env->insn_aux_data[i].indirect_target || env->insn_aux_data[i].nospec)
 		return false;
 	if (insn.off < 0 || i + 1 + insn.off > next)
 		return false;

-- 
2.43.0

