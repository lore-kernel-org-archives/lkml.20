Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFBE2236F7
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 00:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792284769; cv=none; b=IEA25FNkHkq//SnYsWAWEDq9IciczNS9Wh614JVAirkKw1pFPqsdqFMqkUYahtfWhqt91oObytLbLSzm706FZNb0dLZiQFsmqwQKFjl8lod9kUsyVTCenZ3om/EtAA7D1iTtqM07sSQbYW09+fochhCvV2m1whv1YfanRN2CdUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792284769; c=relaxed/simple;
	bh=oS9dfUROtDHTJcaCOgtH8Sgai6aEj4oEhoL3FqbWuZo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=h4QhKkXrFj0IDloiGWpGckP4lAZwxj6tvHSF3+R/9mwD6vU4MabZ0P5YxoU97w2ngLlZ3VHQJZZXdWqZcv0xPtsq5OlKvca/xicCsVI0XE03dnzxn6RU+uU5RN5BTCyF+C71pvY2eTI2n0LteSbLHQTkRe8or+FRufn/3RDm+2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrTblHNz; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrTblHNz"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so932603a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792284768; x=1792889568; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oS9dfUROtDHTJcaCOgtH8Sgai6aEj4oEhoL3FqbWuZo=;
        b=KrTblHNzzOQA26l5UmBzHOZLd2i4tDSPYnsNsAG6p/BcqqoKQCGGb5bBdDb4H2alM4
         +nEzzvsriq6O01bH98sVffFOyC2oO5eEin3Qj+0EBm0r47Z2M2oH8ZLVbRa6+XuCOClI
         eDmYuKYevsVB2dBhA/+j5Dn61q87uOlHmQMQuE0kp4iOXCNS2SdnHmYfP6bwhn8KST3n
         yT9lEsJOzQVw3M98gLmj0b7k7CgJVhYA4vXaQpARc62epG0UVazcYpZ9cbVmpNPuO1jO
         02EZHs9tLNFUOypDkddxmb94IvYdzKOKj274Q+FV4u4q1/2aJZKiUepCMh2aELJu9ElZ
         Z5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792284768; x=1792889568;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oS9dfUROtDHTJcaCOgtH8Sgai6aEj4oEhoL3FqbWuZo=;
        b=2AiCNRKoZwfWkUrDY+V1EX/bIhK1wSErp6fkRx7DszHsDy3l1hy0DkrIub9GMP4qvs
         wqxhOpGQzXihlnk9Nztum84SORttUqgHI1ytvTilVKa1+mECjBSG0OwHqD7iNDflmWSg
         jZrRt3pK/AZoRlw9pp+16a6a43YNYIm4FDNLVlFohE5rGjruswuoAZrSsyV50lS5/qN7
         vBbKGztCnd9gv8kIEOCym5258NHf9UkMjN7PLWpdJN5DzqKmjr56OsUrFwVLiHjYTz+j
         eL2gWMOpt8T2BcydfnFJmiWuhED1DWmjxRUfXHImlNmcHXjxurc9bEv18KgBnbczSWYw
         eTdg==
X-Forwarded-Encrypted: i=1; AKwUvBx/e/xQ7k+YVJ6L8QQ3e0J07/9fZxZQWsZM0poYgs/H0Yt3HyK5q+YKWf3Q6i8v57tTifH9NXaRzZmkwhs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxPHumYMAXmhOggaBONa3HcC6BKPlCo6bqgY90ULzczTU4wEM8
	p+87Di3TlWT1P32XqS1qWDz0hO0WsvBMOFYLxn7j+y4kU4UgDMCY/pt2
X-Gm-Gg: AYBFou23OlboR5oVUtLM1ioGlJZ88bpGZio9kiuid4JoGprBuKmL/x+BwP4mjhtKPi+
	2UXWyXBUNKRKb8OlKk2BrCGlNoQ+KoE92H6IO0KmKlqRn3ArQWh4qDNrqnJQbiNuopqOu36JoA2
	YOIRNFnsXAkiA77v1RcLiTnxLsqIMs5M+Gk6kWbvYeteXv4FenvHWvvaF3qk9512mQIlPFwnGYY
	8hncGL0ZYupQfwzcePdLSrZ4uP1jIu2K9udWqI6bPCqQel2oudWMW4nnlx6MCqM/RvakvElM+NP
	vIM9Fq1Dhcl76XgqKiJxQyZ0G1Yx8nrLhtAK8dYz6UC2Uh93bK3cy+vRx10sNpvA+nrHy9PhRYR
	Vct/q6TlliCKW/VFE7qQ0yOxT6TR/2ePCDlHLUTE3gzsR0CjcNRMCndAkLICtM6nQe/Y3H4Wcdw
	3KGAcZoqjLg1gbPbQrrOMg4fmXD0z+7tIY1Hokto8/iSgHFjDDNSDN5ptjekrMD0B3ZgLBZ6iog
	TBJTT+84r//yj1O/qgu61cB8J7H11JDR3if3TN006ZDKwSfZfJHjrN1DjDF/XOX3rvRLH9h6kga
	IYY=
X-Received: by 2002:a17:90b:2b48:b0:3ac:9f00:3bc7 with SMTP id 98e67ed59e1d1-3acef0c88a8mr3507029a91.33.1792284767800;
        Sat, 17 Oct 2026 17:52:47 -0700 (PDT)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947d2706sm14951503a91.16.2026.10.17.17.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 17:52:47 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Oct 2026 00:52:46 +0000
Message-Id: <DM7JXB4PREVH.1BHG31CCNRXF1@gmail.com>
Cc: "Andrea Righi" <arighi@nvidia.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "John Fastabend"
 <john.fastabend@gmail.com>, "Josh Don" <joshdon@google.com>, "Vineeth
 Pillai" <vineethrp@google.com>, "Balbir Singh" <balbirs@nvidia.com>,
 "Shameer Kolothum" <skolothumtho@nvidia.com>, "Himadri Chhaya-Shailesh"
 <himadrics@protonmail.com>, "NchangRoy" <royfru44@gmail.com>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next 0/5] bpf: Expose pinned arenas as sized bpffs
 files
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Andrii Nakryiko" <andrii.nakryiko@gmail.com>
In-Reply-To: <CAEf4BzZZRrD86ZswsB2r-swqNi7D1p52Vs=fQ9MXSgGATN31Jg@mail.gmail.com>
References: <20261010224902.1232178-1-arighi@nvidia.com> <DM6HVNSP3USV.AJSWS289Z3I9@gmail.com> <CAEf4BzZZRrD86ZswsB2r-swqNi7D1p52Vs=fQ9MXSgGATN31Jg@mail.gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 16, 2026 at 12:52 PM Andrii Nakryiko <andrii.nakryiko@gmail.com> wrote:
> kernel to do that. But once we have the ability to create ARRAY from a
> bunch of pre-existing memory (e.g., from memfd), this can be used both
> in a guest and in the host, and both models, guest allocates or host
> allocates, could be supported with the same model.

I don't think it will work for their use case.
With array of maps scx needs two lookups and two NULL checks
on every access, and the result cannot be kept in the task ctx
which is in arena today, since ptr_to_map_value becomes scalar.
unless everything is converted to magically bounded array, but...

> annoying, but what if we teach verifier to just automatically add
> bounds limiting sequence (e.g., masking if value size is power of two,
> slightly slower sequence for non-power-of-two, of course)

while working on arena ~year back I tried to add runtime masking to
ptr_to_map_value and couldn't figure it out.
then in ~april I tried again with llm-s and failed again.
the main issue is that ptr_to_map_value is a pointer,
and progs keep adding random stuff to it.
There is no way to split it into 'base + offset'
and apply mask on 'offset'.
I tried alignment tricks, like align each ptr_to_map_value's base
to 64k or such, but still failed. Something needs to remember
upper bits to see when math overflows.
That's why Barret was using explicit mask in C on every array access
(when he implemented all kinds of complex data structs on top of arrays).
Every access in C was base + mask(offset).

Array from memfd is a separate topic. So far I'm failing to see
a use case, but if it's not a lot of code, then why not.
