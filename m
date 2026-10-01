Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E304C2E7378
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790835283; cv=pass; b=TnYlUR6eKtELty8wLCWJfgWqCuuPd8XfM1/60kVVSzeQx468WkJP2KV85ogE5l2FdjQN3dwYHckeqE18pc2f+9XBwiob784NTwNeb+lizP5yRxvcFNs3efp+s9/EceEkLUTUBM794NUFc2oYMwyOqELvwN5ni5IIP7nLPKjNOm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790835283; c=relaxed/simple;
	bh=39n5+UyA9PRDaaatBly66cHBaTQdgNM7PETxUHwKMqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LvxAWptWv7YbjOSbjt+1iBcpo5oLXVlvOWwiJT5R2Kz5pEIrGSqq4YKS/Ve7e8SsfA4LTGH3s62pn063I6VA5oCCB40nlMlqB2CaNZyZXJ4Sejup9UWVlwupn329Ndv9q/vxgn2QP4NT+RDgJUWUM+lgch2YOXCmjMEErPzeqqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SosygpG4; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SosygpG4"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-532db7db0c6so56984431cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:14:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790835281; cv=none;
        d=google.com; s=arc-20260327;
        b=O/LoZsyG3xEjgQKsg0fZgBpXdNgsgsTZA10XAOQ+8m1/6dbBJ5c3JusBH3FwlSmqis
         yDui4K6fGviD7sF5TSGtHyaDTCSiB1H+PFV6SaxjCe5+yIHTV3IXpy95avkc1G7ElOc0
         mnYKEAwbqXNB/qOMsdEUZAGRrsRgRopOOdr7tgI4g99PZG4ioTtfvm4IoxX2g1J6nAjQ
         oHKGjGECyF0H4v2XalB3Us6ZjoYPBlABfexI+epVJg1eBUnxGMSSRgnjbZaTKRK3qjlU
         8JZane1ChVLRXEvWobaUBVmyPjJfyLI63dcPmjEla++42FhPjqgEgwVQqBHLaM/jZ/MB
         sKqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=39n5+UyA9PRDaaatBly66cHBaTQdgNM7PETxUHwKMqs=;
        fh=vOXLrBC36f14nn2DvS8R9d2zJXtH79Jm5xTeEyo3cz0=;
        b=b5vtixqmR4pu3klIy+qFKPHO8envumgCuC6Lt/T+fuIN+WwTEEEbJc0KWX6lHBxQWU
         gnbxbU1vyu25C2VpOmo+4vehOAO5jwfwQOVHnyznZY4lbywDg7yW4M+yEt36O8GtL/5d
         04L6qUw9Q2EZF0JE7La0+ZYlkaL46PGXmzSwHfMz4E622JwDqGBSnVyuXorbodDffkN7
         VicD0rCUTqg1lI+vsFcU+Uom8CsVDSLvHDbQz3S0p8GZhWrysy7QLBnARS8Y2UqGSMIc
         6nO+Q8AgXGuBX5QP2rZ/KnKdtRal3d7sIy8Vy+tztylbASbzM43PNz4ufZXx/5TRje66
         VFkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790835281; x=1791440081; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=39n5+UyA9PRDaaatBly66cHBaTQdgNM7PETxUHwKMqs=;
        b=SosygpG4bRzX582tomRJC+0rElP1Xr1V0kIWBzY7lca8/4JIxAdaYjao/jTLgWNF3l
         nD9v/tCzJ9MlBophwxw/4XcI0Emy3I9kdoML3/kJiihQzbtNn0zc6sc1hH/kKcHTHtRR
         6jO1OEEMvtiODWbNUtsGpqRk0EwlF0qqH3i8kWxSXYm2EVccl1MRKJYB34K/+64vEgLy
         opEEpXDhOanRV7zlWpLmcyTFaL6mNC+qPAxdaICW3tg0wl4bOwGIAS5y3sLA4RXewkDk
         97tNv0e9kkgkdPJc6HeDCJKx23R02KxWIDMOXTiqU5j+1JyBgy/WICvwR8a71PLXbz86
         +pBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790835281; x=1791440081;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=39n5+UyA9PRDaaatBly66cHBaTQdgNM7PETxUHwKMqs=;
        b=MzGPSb9xhi4lqy86ZJtJFMjh/UQDBimWXaUTP2ITvhOEIDzwEA75csMs2JEotYaUER
         0GVcbscXPSbuI3SNjPHpac1lGY6M4CyXi8qft2X+zEd9MzPuNliXv4vXIjvW7Q6an02/
         tzbAmGisZxD9CHMDuvZ4lU2tPajQpURYnLPCux6VTqydKJz5THU/I9a2mSFa+HxAnRYP
         lGESVvY5EIpohXztDDO7un3Vb+YXIRVhH0THod/Icf/NnrF3PDpxE5VBaV2xXLN68Q28
         6wtsR6YMw3Uxm9NZfpCWUMpa2YLCtPVZotYRb0APZAgIDNRvxvDzdw5BTLdJLfROPFKQ
         prdQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+QgNl5rHPC7Dwp13rzEtP85GTiCwYf/Ej1Wpg4lOmlaMRVUhVLrX7DdmDH0W1niIEqUz3Leatzj03+iE=@vger.kernel.org
X-Gm-Message-State: AFuF++l9T2LhW8q8QECSbV3NTlhEqkTD030NEokwGmFgLY3qMv8+EhFA
	a3yPHbkqo2pzIKGY0Z8BH8R/zj+o3EzEGVZO9Vpuxb/wcc3OaM2P30Z1pd8YzbdDUMaf1OBKY16
	k78wTTdyjcsdvyf02R+pfngheztPzDYg=
X-Gm-Gg: AYBFou2NWcdpkhBWtlXKJ0Kb6yWOLz73J00qE3/V8lOQnz1yAK3OSZJE2SJcKpcU3Be
	qjUk8ssMcXIDhNcWEm9rTiQ5zOmZA6nnBak3p4CIKVuX9hB16YGtY52e9qLzNBBZ4gfYuijMSib
	cZjW7DuhLyd0h54Wyy2kM/fqlTOMdToofbp212CfA+F0XGcn2I40UGWKJJJoVlAHxWYnwTj4tvY
	2UC8GHPymIH19+iRK/N/e3k0rCZbUjulTeFtzzQ9z4KppVjl7QMGn2zG/84Oi8xw2FD/5b4MDpt
	ggj2BjmuvvF0lv4DYAbF7lHJ7lT3Nl19CSx/L+eNRgb2TrePjF3Qr1gU
X-Received: by 2002:a05:622a:1102:b0:530:d429:c70a with SMTP id
 d75a77b69052e-53374a9f0e5mr71073341cf.26.1790835280875; Wed, 30 Sep 2026
 23:14:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914115607.350097-1-imbigking12@gmail.com>
 <c28917c2-4715-4c70-a2d3-582ca641e1d6@huawei.com> <CAADnVQLGWcdi+G-cWkxLCtY-Q3iQ4TJKPcL4i35+c2e_snSUWg@mail.gmail.com>
In-Reply-To: <CAADnVQLGWcdi+G-cWkxLCtY-Q3iQ4TJKPcL4i35+c2e_snSUWg@mail.gmail.com>
From: =?UTF-8?B?Um9nZXLmtKrlgYnmjbc=?= <imbigking12@gmail.com>
Date: Thu, 1 Oct 2026 14:14:29 +0800
X-Gm-Features: AclHuK9sgnNLOPWv1o9b11spZv6pvIUx-GPm4pSYUHjOL1ryJGDiBjLKXIrglqc
Message-ID: <CAN2uUdme+EnpG0w2vD=kxWzDxb3ik9PDwZmV_Na-sVCC-HVOCg@mail.gmail.com>
Subject: Re: [PATCH] riscv: patch: fix handling of bpf-jit execmem addresses
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Pu Lehui <pulehui@huawei.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Mike Rapoport <rppt@kernel.org>, Xiaofeng Yuan <xiaofengmian@163.com>, 
	Klara Modin <klara@kasm.eu>, linux-riscv <linux-riscv@lists.infradead.org>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 25, 2026 at 5:48 AM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> Not clear what tree this patch suppose to go to.
> If it's bpf-next then pls respin with correct subj,

It's not bpf-next -- this is a riscv patch for the riscv tree, based on
riscv/fixes (b94cec5761d2). It only touches arch/riscv/kernel/patch.c,
and the "riscv: patch:" prefix matches both the file name and the
previous fix to the same function, commit 8718e5a3090b ("riscv: patch:
skip fixmap mapping when kernel text is already writable").

bpf@vger.kernel.org is Cc'd because the breakage manifests in the BPF
JIT -- bpf_arch_text_copy() fails and no program is ever JITed -- not
because it should go through a BPF tree. Sorry for the noise in the BPF
queue.

If a respin is wanted for any other reason, I'll carry Pu Lehui's tags.

Thanks,
Wei-Jie
