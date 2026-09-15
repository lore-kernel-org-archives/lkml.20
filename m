Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C053B455171
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789502299; cv=pass; b=WZh8WtFXh0BoVkv1FR9Cr5R2f5gQ2yz2/MkjvDkVue6yBVaiPPbHN6gZQf/oQIStmIXzKLtpH+/a+HbJiX+BNL1D7uFf2eJQ1vONXJye+ZfTqNeIsa30wZzMwYELXEbIdmGwTEFoilnsYmPnV0OZq2jIvyBXUvqvSKnD5X8EcDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789502299; c=relaxed/simple;
	bh=FAzpqMwwi6sl1VtdlXZIoUcU/qbo27j0XppRaT5WpEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENRUQ56JmQwrhCbWPlzGLLB/w+5jNzMXuiu6CcirC3HnzOQfc6X3pV/mtTe7sS0i0TVOaZx3/RFrlJgsne69Iu6baH55yIBCHq6iAymvwiui4vdIg4JXGr4XT8gn8lZcjNNFX6/7VHGDH94Zdh3n1MnefLk4/T84Jkjxjn4Kygw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HikUK9bw; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HikUK9bw"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663c1so34361166b.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789502295; cv=none;
        d=google.com; s=arc-20260327;
        b=rbHhNZLCWKalf8aaiL5DPaY8yeqllb3hH2PxplpsFX8pSxvWRGKydq+hVXOvqLbif9
         a0eJlWlXfbZNw09Tu6QXQDDLxmo4IV38XJDn+8scC2xNRzNDFFivznt9bs6na8sozVJk
         dJXXvMJqGDWflGv/BooVvfjsO2Dm8+l0/pFI576LBbYYf3CkCGspxh22DAf7IPvqT1ff
         fjQVZxvPFl9rxJF7cL+G+S2cuwSrESfAXHoF/TL5gkKh6k1iPXFB+JX5TLJ5pyt/HnPB
         DUCqjZAPIUfNTNjkXPJEa3u4PsaYSEB2rx9Yh2QDzAp1e3y3VJMvgPWEhwwirBriET/+
         hpNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VgDjIW7K6yfw9H2uuq39mJuCV9xfXKip2q8+G3ZS+/Q=;
        fh=oyhSuzp2i2jdKln31Wn78HpekR3wcEZB917yVIeN3Yw=;
        b=mx3Nm2ZoOwcWomMJSW+55stzYmtbcweLCsml+g2mn+VTmTnGxTLeCnZ2OfKBjh1LvU
         1g7bhDlFTGDLI2DsWHX+HRWrJ6mFzVTl9xPiL86L1XkrlkOkbmOkFVyyRMqDTIfT6nQN
         Ekn4FDHYY05xErR8nYbt94KOiP1FT9laQ9Bb0PfF5VH3ZaNaRbKwETPODky+EPPgW7A4
         ORTvB1JuvQxK0BaVIRJSXP4o+rYy8Ihns3mTtkYrK825OdOzTG6gKYHaI9w29sCAdZt9
         LRVj/+D1emctLV9CPGhPOTgD/OM0xDuRPH+l//Gb5LVj5sdzRWCx3x14iaPUudAOsDWc
         o1Lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789502295; x=1790107095; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgDjIW7K6yfw9H2uuq39mJuCV9xfXKip2q8+G3ZS+/Q=;
        b=HikUK9bwFipO7qeORpqKUhq/UGbHnkvXJ9iKuc4JiGJ+MAze5OqHKubqBOaOuAvWnG
         gIpuqCaI9uwqxYXbgyDaQkHfKfUJuxLR+GJ8o0XeR4CVZGKBei5RhA5f3ZP9ywuAdYDd
         X28ATabr4ia4s1N47mnDqdJ719BBiKAizUbeLbEE40tEJ9aqziVn1uX7v9n4WZ0KidEl
         980zf0r0d6ECTUtNI6LAO9UnhTlK8lf/xpT6YabKgke3QAg7JVyltx2aQ5kfeqyRURkP
         EPBA1Z5eKGYOsyTk7feJSg5tMu0EX5ZY8GLCmjTVGrE0LksHcJayLBh1+j6PQM+hEVjM
         2xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789502295; x=1790107095;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VgDjIW7K6yfw9H2uuq39mJuCV9xfXKip2q8+G3ZS+/Q=;
        b=M66VICCbwPMJqg4qYYLORsluBn68+4VW6FHF6Zqj9ilXERGn/WBv0nVe4dMl6kmVCp
         QRFTx5lGFIXWZlhHxAwT9YSydxKxu325APrAO5N68VIG9lxVCNW28UMCE6lQ8t3fbl8w
         dGFzv97ASFuybnPeCmYdCWJjQL2LBndJz3GUIo0tYXyQHeGJ7sN2txIRv/QsvJCiSrH1
         mUnutWi1mNvbD1XM2soE3aq/4GaN+FJaT42ihBOVJvs/DWQh8nzAP8UxbcrXcmyGYQWl
         SWDwVaS3BFv4RpOP7Ban755Alk1xxTQAT/1chWoIyA3K6uOdq4q5zNTIdn9gETvkJb/Q
         eF5w==
X-Forwarded-Encrypted: i=1; AKwUvBzbgeXVcPDXBxSuJ0g+1oz8/9tF466rbyTCdfCbsBL+b/nr+ZIfU78BoOgTYIoVRM38PPC/jKMf2lnhpU4=@vger.kernel.org
X-Gm-Message-State: AFuF++kBAFS+EDGO0NvZLA2xqZKqceX7Pr4TYPor1AMzcbrd6eIkyRbv
	0wyyqYX4ShLVhDarMO0PzCe7s7ytvqU1q5thx7NMIUIqarKxuCHI9tv3p4+zmxYcUIfKOKQ6+jt
	MIfWZDwQVSoYXs1XaQaYLZxADTd//h7c=
X-Gm-Gg: AYBFou2235qagbV+2UuoS4nCwhmfFXH17wnVXg87mG+/YJJAJir44I7tASV3FI1JdPI
	W3exMRGyai4cZvApR9yukQESyLsd6LtNY/qsBqgEyZHZDoG/zCj0D35ggNEvwiMCjMe0PUN5Tro
	3zCB/jVs5/LD3nlbxu6l996NXP9EdIyYh08xyCX+OJ5ip6XSr0hqX72wtDuzvpTDUxZt08ea9wZ
	0Lh6XWfHmeuxYdaykOkfMgXdyb7pYkCHV8o4fdLYqOOuS1I7Sk0bdzuuvn/h8bN3uqLe+eq++CD
	uLfXHSnRr4lV/XXJIHQ+7F41J1J7sNLTXA43MeollAB7mS2b1q6cwA==
X-Received: by 2002:a17:907:a089:b0:c25:c7a9:7b8a with SMTP id
 a640c23a62f3a-c29b86b80b0mr897677666b.12.1789502294655; Tue, 15 Sep 2026
 12:58:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915022905.1535566-3-main.kalliope@gmail.com> <491fb0b335c0814e914b3d041b8cee9fda122c37567bd20e456fd3758fb51568@mail.kernel.org>
In-Reply-To: <491fb0b335c0814e914b3d041b8cee9fda122c37567bd20e456fd3758fb51568@mail.kernel.org>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Tue, 15 Sep 2026 15:58:03 -0400
X-Gm-Features: AcwNN1X8inw4eXVBgVo2LOS-mWKdLjd8l2uN2YGRgK2WHAH0Wh8vRRWq_n5o6G4
Message-ID: <CAJZwKkj62Oq+rdXWboGYTucw0mDYqFB=M1MhcjaGumyLTyYLgA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] bpf, parisc: Add support for BPF_SDIV and
 BPF_SMOD in the parisc32 JIT
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	bpf@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, visitorckw@gmail.com, martin.lau@kernel.org, 
	mason@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 15, 2026, bot+bpf-ci@kernel.org wrote:
> This looks like a bug fix for the parisc32 JIT's handling of signed
> division and modulo operations. Should this include a Fixes: tag?
>
>   Fixes: 847b98421362 ("adding ci files")

847b98421362 only adds CI files, not parisc JIT changes.

I submitted this as missing instruction support to bpf-next without Fixes,
following the RV32/i386 guidance [1,2], as explained on parisc v1 [3].
The current unsigned results for signed operations are still incorrect.

> This isn't a bug, but would it be worth naming the sibling commit (or
> saying "the previous patch") instead of "patch 1" here, so the reference
> still makes sense once the series is applied?

Agreed. Please replace "helpers added in patch 1 (64-bit)" with
"signed 64-bit helpers" when applying. The preceding text already names
hppa_sdiv64() and hppa_sdiv64_rem().

BPF maintainers: please consider both patches for stable after mainline
inclusion, patch 2 needs patch 1's helpers. Per the BPF guide, I'm requesting
this here rather than adding a Cc: stable trailer.

Thank you,
Nicholas

[1] https://lore.kernel.org/bpf/fa8a040f-64c4-484f-9538-fb0ec287639f@huawei.com/
[2] https://lore.kernel.org/bpf/alWEj2hDtxz8RW-l@google.com/
[3] https://lore.kernel.org/bpf/CAJZwKkgG2Ct3KipN4cRgg4v=QQwj9LhA8pveqQvT_gQ_GpzJ3w@mail.gmail.com/
