Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291638;
	b=vTq0W3WyMp9yFCmQO7ME+KKojM9tcNDGs+uBW+vQnNvYVC6HCXNlI/YX5JER8V4t8qBY
	 269g+hbjy7niGoRDf0OCLVtTnjAVO60ZJU10Lt3b1AzW0ScmKPlQW0wBIBmxzMOE3nwvW
	 6fdMiu4E8uig6Qw6KpW+5+wXRLfneoUZ7jdJLOAxT+PIoe2Bx1VnbfxTukIwe02WrWhWM
	 GkGuVv+XHd0AUWmLaWeolMRwlKTNy5atVC1rd2f/FhyHHn7RAym34KYpqa5+sVVfsMp8k
	 bBlgxc2mg73aD0KZwTfOx2+AfSUaOlQEFePopdCAnq/leceZqsMvtgiouIyXmyQVgcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=AUEgA+KIhVNOjMXzh3FXk0P/lrvgmm68bIk2PmEsd2Q=;
	b=Zv5OjfNl00C+gTaZjWgEU3uCsKwia9xgAownUuZHriOhxMkcBvQSW0OehMmijDG5oATD
	 O1taDck4zWZbsyIZteCq0Tapw9+wwwgS4XKw1o84YjT09DRiouOT005NSSrV7HNBfz860
	 8BIKl2eh6aSMbvB+CZwZdJUyMUhhikS4vQV3Aesb5HNXLq/Zg79JrRmqTsBiMgzdk2saQ
	 GGYMzwaeWURrjxjVxMdqiuCMYHEFLW6EZFcfVHOhyclrukHJZp1PM2owrDn2tJW3WY2EH
	 /MbFDZGZz5KplGxp1WLw+gcChkjKeh/jfdkgDWP/egXx334wmr1E39tfh8oYxQCG4tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CRodfhJe;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC7C606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BC7C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CRodfhJe
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso15424265ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793291638; x=1793896438; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUEgA+KIhVNOjMXzh3FXk0P/lrvgmm68bIk2PmEsd2Q=;
        b=CRodfhJeEOikU0i+dQEuNpBaaDuycDWWjkuIV45tbb06Q1oe98Exbp4+RqKKNMYSEx
         WqHz6cusTxgQx5H57r4dL54D4B7825h9o1QGCamhOF0IueIDECAWTyiLzrLUcJ05C2Z4
         xuYSKCEvkN5rvq9P9J0pDcoLjoLM1d1taYXoUHliMo5CLG4HqJkdBEpQX6RLHIOZTfaE
         y+v/w2FDE841G4y9uutJ8gNMvLvbl+gtTwP4YyCKDSMFbUOPZ1rq51gvgJpTJEVtnePO
         5dY/aQ88F7VH78L8H8b97AObets7WjHiAYntCB0SjNFspam6J4iFmwxt8rdOaOSKnNh5
         ChkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291638; x=1793896438;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUEgA+KIhVNOjMXzh3FXk0P/lrvgmm68bIk2PmEsd2Q=;
        b=aL3gvdiut3M0vGKrV83q0BXqejcwAPyQVp8lDGJ9aR4Iy6/Tb1H3BTkVlNTKmL+EhN
         fld6aREA1YeiWNDaWqIpk5Q9xNW8nfb7autNJivIejtXE68j65B84l15GHbuya/WWMjp
         GULfSbLLrrg+Iyqoipsa1QDzcn3ckJmYBWnpP4h/v4UIBmkU7BWJJIgLlVEdrZNEI08Y
         /6WpaRECylcPH313rE6nSmO2AVS0RyQAspBqYjjHvt4jf/X67emNCnolXRnPZ54bLHQt
         22bAWUzxY17mhR+hR5IshRc+KrtVB9wayWWNdfMb2wwEG6NONqqDl6wXM7XoEzlfaAQR
         zWFg==
X-Forwarded-Encrypted: i=1; AKwUvBwNfIG1zAjeToCDjZMD06Y+ozhD6+XIITxe9usV/yZeND1bPF/x8L/vjFYKGxQFQqWxRxyjkH4kL2ddE5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5VOywt4lqqf/nm+9qv8gcepAAqlCSeHr6AEpWxZrl0+h6O77R
	Hf08Y1nYGQ/15oSPb1AvHJBaDfnit+XwfCXNDHdFA3b1FL25cpoJfvSS
X-Gm-Gg: AYBFou3YCji+p71dBfIi4BhmgKAMKyHOkTWswRXrMKT/qDkcglzd304KFPMxyY2gQVF
	7RTZzerE8b5L1B8szdfzZ9iXArpXypOvAeG9xmJMNZmwlnuoyDOnrpu7o3QEa/MoJHRf/M/RlE4
	yqMUtRxSKJCMyRXs8z10R6Ut01WLhotylKy8IX1RmvBO0eATHbz+eRe34D6/hO9aqdZhINtrwK2
	ViHqCB6sRMasDmJpaZYj+ST/71TbbrZZBQrIKFCjDwnZXOwuBhGG0ClswYq5bb90vCj9iogrbe8
	4Rgs53QsUk6w7qsfetCI5syYd2sQLT5rstbbXTPpCGfp0w2eDUw7zJ4nDWCrgzKoYJQV9rgUNQP
	Q7ZGjek8qR67UcjzNHL2YBvBDEAlq0iv9KkS3HN853Kp5ILQEXde7dPL3ZCVxxIMax3s/i0hN0+
	VuW8F+HBEn10SiA8oxDilS5/NAQtfsk75MIhf4MEE/PbS391pH//0uQcCG5MQj+HGAhFfb6+XED
	sR2jy/wwFBNkPYyqy8/VxUsHx7X/eSs7nnL1jy4L2RKVkaxU/b1mb07YofBLZ8AE+W1/YwSvIRN
	U/hVObAhX2tuuuqQSAdUPQ35DXSVtewGsJQa70n+XJaI5ahVK5552wnXIBAIxN06+4/wRf1IME3
	inKISnARrehWanb1UMBepGMI8TldHCur55A==
X-Received: by 2002:a17:903:faf:b0:2e2:bfe8:aa7e with SMTP id d9443c01a7336-2eb000852dbmr59313085ad.7.1793291637435;
        Thu, 29 Oct 2026 09:33:57 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb361f392esm107005ad.3.2026.10.29.09.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 09:33:57 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Oct 2026 16:33:56 +0000
Message-Id: <DMHGTWQSAWG9.NUHU0WK9KRK8@gmail.com>
Subject: Re: [PATCH bpf] libbpf: Reject excessive program counts in
 generated loaders
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Mahe Tardy" <mahe.tardy@gmail.com>, <bpf@vger.kernel.org>
Cc: "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>,
 <linux-kernel@vger.kernel.org>, "John Fastabend" <john.fastabend@gmail.com>
In-Reply-To: <20261028183947.9606-1-mahe.tardy@gmail.com>
References: <20261028183947.9606-1-mahe.tardy@gmail.com>
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

On Wed, Oct 28, 2026 at 11:39 AM Mahe Tardy <mahe.tardy@gmail.com> wrote:
> @@ -122,6 +122,11 @@ void bpf_gen__init(struct bpf_gen *gen, int log_level, int nr_progs, int nr_maps
> +	if (nr_progs > MAX_USED_PROGS) {
> +		pr_warn("Total programs exceeds %d\n", MAX_USED_PROGS);
> +		gen->error = -E2BIG;
> +		return;
> +	}

nr_progs is obj->nr_programs. It counts subprogs and progs with
autoload == false too. See commit 259172bb6514
("libbpf: Fix gen_loader assumption on number of programs.").
Only a prog that reaches bpf_gen__prog_load() takes a slot in prog_fd[].

Two objects with obj->nr_programs == 33:

  object               today            this patch     should be
  -------------------  ---------------  -------------  -------------
  33 progs             -EACCES at load  -E2BIG at gen  -E2BIG at gen
  1 prog, 32 subprogs  -EACCES at load  -E2BIG at gen  loads

The second object fails today because of the cleanup loop in
bpf_gen__init(). It closes nr_progs slots of prog_fd[], and
prog_fd[32] is at r10 + 0:

  r1 = *(u32 *)(r10 +0)
  invalid read from stack R10 off=0 size=4

Lets fix both: clamp the loop and check the limit where a prog takes
the slot, like add_map_fd() does.
Something like this (not even compile tested):

diff --git a/tools/lib/bpf/gen_loader.c b/tools/lib/bpf/gen_loader.c
--- a/tools/lib/bpf/gen_loader.c
+++ b/tools/lib/bpf/gen_loader.c
@@ -139,6 +139,8 @@ void bpf_gen__init(struct bpf_gen *gen, int log_level, int nr_progs, int nr_maps
 	emit(gen, BPF_MOV64_IMM(BPF_REG_3, 0));
 	emit(gen, BPF_EMIT_CALL(BPF_FUNC_probe_read_kernel));
 
+	/* nr_progs includes subprogs and progs that are not loaded */
+	nr_progs = min(nr_progs, MAX_USED_PROGS);
 	/* amount of stack actually used, only used to calculate iterations, not stack offset */
 	nr_progs_sz = offsetof(struct loader_stack, prog_fd[nr_progs]);
 	/* jump over cleanup code */
@@ -1134,6 +1136,11 @@ void bpf_gen__prog_load(struct bpf_gen *gen,
 		gen->attach_kind = 0;
 	}
 	emit_check_err(gen);
+	if (gen->nr_progs == MAX_USED_PROGS) {
+		pr_warn("Total programs exceeds %d\n", MAX_USED_PROGS);
+		gen->error = -E2BIG;
+		return;
+	}
 	/* remember prog_fd in the stack, if successful */
 	emit(gen, BPF_STX_MEM(BPF_W, BPF_REG_10, BPF_REG_7,
 			      stack_off(prog_fd[gen->nr_progs])));

since it was already applied. pls send a follow up.
