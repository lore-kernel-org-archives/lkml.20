Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792691820;
	b=jtgD1Ht5tpqk5iP10AxSW47zOoBGkRF1YjhMXTUOf0Zcv03DE5sqsBFUMnfSEVuzjwOk
	 jgWsbiwClbu78/cJP1y+bDpluBWU2+lh1rGRY3fe+ftlk6VRGicPI604pc7jeiiwIhdUa
	 SK12dcaSbFprj6JnKUHe+q/vtapf2IelG5tEthIJNE4wyuyPGkDrIIA5QZBHcO2SZcee3
	 01DusCmcGvR0uZFHYn73NwprDYkfNf11Rt9OUSFBwmTy5tQhcphq2KsE+4wYcEEjjTbzH
	 qhmOeam+f34YdsdJQCYDvOQcnrtDQRwPBD62LVzEMsv/UEwam1V7hyCBzVIdRvv1q7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BIrmnsOR+HHqvO287vhtPz0FYh6eka7mZUJWsTNMmN0=;
	b=37mbqsGYFSqmTOPfyPX/sOml75AT3fKS23k1wDuNmfovJuLjMBRP6Wm2ZkyZ75bsDVYc
	 m7RdjZYcP0GkpKQd9r8eJuGUCWgyJuxbyr1/kj58tgtWNIbnIIoiqENnxgZUhzQP3nFme
	 V75V2ePeA0fiWIXsSGfSrA486owDMP9tHAstr1yaWl6PQs0eICrD5u8YvPIqOuA64F1g7
	 ny82VRYnIfSwhQ0TAQ1IxGJwauiNXc31RghLA2IZKhZys1lmZe3J6ZU34sTuug0UWkN4M
	 sLom/6SlvMtdnIZzUDPCNV3euYzMY3sZNYoyYjuGYVLFzw8Y2WYDWbswSpX+YzEpTqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=YFdp+eNt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273C8606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 273C8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=YFdp+eNt
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8623790f8so6885ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792691819; cv=none;
        d=google.com; s=arc-20260327;
        b=KrRDpGPxhkWisQPsO17EUVuoT62rp9EIVcwXI385NIvlregjekpBwnHp4+kAbPQYrr
         u8l2iyOuTq7tNJP9QeonlchWTPH9QZOgh7wPJPy46C5AlJL5e6mfPXtgzBJdfzv/7+N+
         3FoPemhxFs7lFPnYdU0LUseqVyWfXXeQnLl/dKM+1t3yVlxN+kmfh3W1bw8UYF0v6O0N
         8v/gteQsurv2uJB0L1/ih0TfFMXnS3AVR6fyPUu2B5GyEHYWMFf9ZSWxooduu6LrOfVv
         vJxtcMDp/RWye0WMirtnyFQxKEHNU7P5sHIVng9v33ELB9WW62NZc5uGtDyOmoFyMQlb
         6mEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BIrmnsOR+HHqvO287vhtPz0FYh6eka7mZUJWsTNMmN0=;
        fh=phwkNvQkxDnvfQzeOzKPrLzNR5WUnL9QuxeUO6UkrWQ=;
        b=A0XUOMy35US1g6l7o4pwmxMGFxytv1qxIWy59mfOvXtPM+bHlXBhNZHAA88b1yyC5P
         IneUdG93CW1mbQdI3q893pQFDKHuN21mpCYMhP5kGzGFlduq1N7nZP8VUbbSLmzRJlJR
         gP/3w6xOb7+HW8/aHUtjQ7HVPTsbe8yi+jkn6X75zZqp7zAPf+tHrmsq4PovbHOkgsHG
         /rfrpc67ZNrYOG3ymYM48mpmEftANMcGqK2n8o45dN2sC+ZYlVtHM1VSAlPgEJNdKfWN
         KZRuH5KeNJyIafZ5M5Dz1aRlHnwXpbtZN3+CWzvghfG22FEIzNiVYw1jhCC3Le4NPZxK
         7VFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792691819; x=1793296619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BIrmnsOR+HHqvO287vhtPz0FYh6eka7mZUJWsTNMmN0=;
        b=YFdp+eNtUuEUTvr6WJyWDSWbgr6375Hv/W+rTk2td6itbHuLtatk8TV3FBePVM7v0W
         +q+UbeyAt0FTXceQoOBjMY/Ttfd7dUv8kQJ8yreK2BjsATGe11z1rwVU5iXiMvJ3Dqg+
         9CVMbQvVQ+s09u+L4/Qu3i27gNo0YA03TQrfaezeGuyKv2F88/DFShOTND6gd0rdAtjo
         9OgISODKkk6HDUFhd6tONLgbIZKHIQ/LSOJPxFqDhy86TBHzPOEa0QWqIRCc/4wp5rla
         DJdBFgmSiM6TL4oYHtefgccGo7BRzxU0mdcGk/pGx1FgArFziiCHYZrSeVpxvNTcWRgI
         g6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691819; x=1793296619;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIrmnsOR+HHqvO287vhtPz0FYh6eka7mZUJWsTNMmN0=;
        b=r6+1gFeS0YfT1k6AH8tgMM7eKGuYjlInebCbT8V3EjQB2giPEDxu2cVG0SpW+Mjewp
         3tXRJkyF7OB8Gg5/MbWHbq9+FbRDuylW2/ZqcYHHisMpcAi0MU+buTk5Z7SnrcXE7jqh
         Ms3P9rs39tZ2O5RjdDEtSPfHDKd9QxyJd8eygfvw1JM0cTzJvKQCFl9LcaQnIpKCfDWW
         bK6LBGYGDwZSnX0XHxsvcTgcIrOelhzXj28aga385rZ4DaB04gaR3QaHk2ax/TAp/5qg
         hpPvprLDKtXyShoMf8rxTdeZ6eOJmzZjpnwPlrzN2v7vpbBDWq2psQNNn+CKXYl+K8M0
         H7lw==
X-Forwarded-Encrypted: i=1; AKwUvBwx8wxVboRMS271XXDdvz2g80GNu15eDoESD1vYfErWwlI+YNhL2YUxXVqIrAUGRSSx1Chf2kXKH9R3QkU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyCUWZGU1fPw88ys52KcGtgwA/3sIauZf05ytDfzo4edpoiPGD
	DCLMxgwIpMXvv/DSTAvGXOGbZaErdeDNrPMbtLGmYZzMwmQbPDj5iKC+cdlyveZSPRx+SrgSfTD
	qahs+0EzUB6pS1Pv4cHqZwwMoY3AAMQKtPE6JKmzg
X-Gm-Gg: AYBFou2Uwwhhy9qZ2U0lUDawKMYAl25SUXyFJs9A3Vomcf/sD/i5SoKhZfP4GIQ7Scr
	dkY5QQBc67k1lD8f6VzKSqyJEg261WBFjcuXBfOIWX/lQgnO9VsSM37iem2WKhyYQHDTh2KsyFl
	KVME6dcHC3kD9CLxUt6nDg6pWHchXP3ZUCA8KwkvZJQtwNZNyHK8wHyMYiGDsJsz4xVPa4PTjUq
	RxEHaCMQa5654ES5ONRihZHe0GaEJLwhmZAn0GBSDpzajC908UAech9C/RCZiytZdZW8PhWbjy5
	dn4ezJIMrN4/3Yb5lkg1WhxnE88A5kNEvpsf3feBnreYXIfszLAth4g7bhIW+i9Ka6ZuCFUJYZn
	3awHpd8Z/llIjazM3tr/+OMj5vf/SmNOktS7BIPvn8Z8K9EsJSWhXTryZ0KK0UGuvNR+QlDLqW1
	oeTAqeKePd5XC9U1+t3SNc/A==
X-Received: by 2002:a17:902:cece:b0:2dd:3a08:d47b with SMTP id
 d9443c01a7336-2ea7c856829mr195125ad.13.1792691818910; Thu, 22 Oct 2026
 10:56:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022015712.1297331-1-alexei.starovoitov@gmail.com> <20261022015712.1297331-5-alexei.starovoitov@gmail.com>
In-Reply-To: <20261022015712.1297331-5-alexei.starovoitov@gmail.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 22 Oct 2026 19:56:22 +0200
X-Gm-Features: AclHuK-YCNtnPegYnn9KvUKugGxObkR7MWrtu-3qSRj9_sjY2T5TwF4c4QpzRSk
Message-ID: <CAG48ez0cG532aaXZF_asCDk+fsnQmE9L5PA9T+JN6OGdx6yjGQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 4/9] uprobes/x86: Don't WARN if an optimized
 probe can't be written
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	eddyz87@gmail.com, memxor@gmail.com, oleg@redhat.com, peterz@infradead.org, 
	mhiramat@kernel.org, jolsa@kernel.org, akpm@linux-foundation.org, 
	liam@infradead.org, ljs@kernel.org, surenb@google.com, david@kernel.org, 
	vbabka@kernel.org, hughd@google.com, kees@kernel.org, mingo@redhat.com, 
	tglx@kernel.org, x86@kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 3:57=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> @@ -1197,7 +1194,7 @@ static int __arch_uprobe_optimize(struct arch_uprob=
e *auprobe, struct mm_struct
>         if (IS_ERR(tramp))
>                 return PTR_ERR(tramp);
>         ret =3D swbp_optimize(auprobe, vma, vaddr, tramp->vm_start);
> -       if (WARN_ON_ONCE(ret) && new_mapping)
> +       if (ret && new_mapping)
>                 WARN_ON_ONCE(do_munmap(mm, tramp->vm_start, PAGE_SIZE, NU=
LL));

Not an issue with your patch, just FYI regarding this preexisting
WARN_ON_ONCE():
A failing small GFP_KERNEL allocation could theoretically cause
do_munmap() to fail; the VMA tree has the ugly quirk that you can't
reliably _remove_ elements without memory allocation.
