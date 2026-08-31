Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0C63BE631
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788217054; cv=pass; b=Yb8anpKVfZriLfMm3qcffnNIxX5S2Enq1hIqyxVdTRjTc0XnRE8nKSBaJ1xzosE+DQ6hkKpRCFmpgRMM7byIAb728yn2r6NWQGcwogDNr/+R379Yv1Tlg0uRLhVVGLNAWtZPvUtTyFPTQkh5xoWzO6d2Icv1F3KhEiMTt7dkf7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788217054; c=relaxed/simple;
	bh=S4h1Woe8qq1XwMb4pkCeaJdMxtTyGeVDzxpnT/rD2oY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eL9lezs9jSl2ObzWktgKtp810nLaM8HGLhQobvTblTJGstWuxZdV5R7rpMVkak9LNSUVCLe3IZsyglR9yXWekgVjAC+cnnJeDHY10vulpAt1kUheV7mSy9aYx9Una1wYm2djuOUWfFogwWS55WBfRysszUEG5a1/p3GgaICLH/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W67gzxZ3; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W67gzxZ3"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-836ce6cbe1eso40797107b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:57:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788217052; cv=none;
        d=google.com; s=arc-20260327;
        b=ZI6Uw0EXVNwuVzefqbWuOC0Urh7Hz1vwNiUHn3TlqeO0bDRgnYKFHtVb3XQ6UzTx2D
         pHIRkOx+iqhJGnzAq8r/+Ou/lZrFScSEyjilwiB40zzqb2mkazVRjL8RFF8os/x2ll/I
         5JBM24M9eFdWlk2nVtCrzI8YEiaaTmIcg2SsyMuiD9wR5b3fLJVhA6rrU9LLfNH4K+9q
         qSyE6A5iqnM2ZZRbgszzUfz1xdM9v1j7ewtFUBKACGLpQGtv/9oghBc94bt/yCeEiC4K
         IUJNPH4HNm+0hvbEmOwYXsdWKBKFGAPXlHZfynVZ1NXwQY1tjhsp03GogYuJ6yd0vYkw
         UyYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S4h1Woe8qq1XwMb4pkCeaJdMxtTyGeVDzxpnT/rD2oY=;
        fh=wDDzrqb5Ix/6bWKlPG13dfl1Srcf0772hpEeOjmfPL4=;
        b=a5QpO1rKdnB/jg193tGKc2zwIV7H2EQUD6DGOHH+3um9h1cPx9mxjJN5btxLVRCUB/
         0Qfp91aGYQbSvkj1rZrKEmVEWwnKzDjGfLXlsO3j84Kq9ORl+RgRnakymfx4ljJi6i6N
         W3mwQK4y5DSnduW2lIAymbetCuEheGbqM2Ff+QTpDrF4CMxZR+di7W1NOQZCvHCNZ1Hj
         KJKdGQ4nllJXto0QIMgfJs9tkfBJkUhWdKCJZf7b0o/FOVC9gxnrdt6on201qLxNNWp+
         I8Zt4AIiVG+ZmSYE9QjZ1BWNQa8G+ECXJbYlwNwrwC8CkKxXWKp1Cc0FM903g2U/Bd4v
         0+jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788217052; x=1788821852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S4h1Woe8qq1XwMb4pkCeaJdMxtTyGeVDzxpnT/rD2oY=;
        b=W67gzxZ3DNwjQW6VAAoaJjRADle3yEM1gyoxVq1QLotxiwQ/CGQCJ0L/EfeZTQusuo
         06dmHwhZs30ar3K6WGQms+xQd/8dcX7DVleLsW/7QeyThSJsInxEeRByEBLpxxJllBrS
         Mwg7uPJ/Bxrjw4ixwAU0YuLmxQbYdgH4Subvu8PlrNu31v1iE7qBY1mjRTwY5ghoRW9p
         oKlht6oESB1P9ZDuLTNs6JIgqli3S3L00eFHT7FR9bbtDyCr6qLOMA+fptDwkHXST86G
         Hre3jq2beWKPMgdAdMjvWClyAD8oQRcOMHWt9RkkZtSaati5DIfyHfPWQS+7VeJ8Xj13
         IGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788217052; x=1788821852;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4h1Woe8qq1XwMb4pkCeaJdMxtTyGeVDzxpnT/rD2oY=;
        b=SpaPpZM1f14cCyURekmWVA+bP5oopgLVW/AY0lXbUQzuq++vdZuqst7IbGhYzGmQKD
         bM289IwoP4tnOlzT+XAolQc8FOlr20keXUceXrYMAU7Tk0JOdcQPEVU73WjfY/U2YSbG
         fglsDjXJGonXtkvMxs3BWafWZKx1E2p4BAkQQljKUUezvwpu+SHrhMp/Wdhq58JA8qy6
         D883PxbsGS3zwuy1qP40rTR9HJV9Bw0dIvxsBRWo2EsoJjPesqmSzlb+/muX7/f4Ixyu
         XIyOEJxxEpfHfy4oR3Ba9P2VF44di/4eM53KeEdpOvkMjVe/hTwHo0lLmuLpSdM0Vq6u
         ckLw==
X-Forwarded-Encrypted: i=1; AKwUvByl2YeSF5YHEXNiQwmaWxxcYcKu1WfgsVxd2QS5ANon/ukp5mDemPjhbGYQJiSnNhLL1iH9w3Z+QFPMFTc=@vger.kernel.org
X-Gm-Message-State: AFuF++n9e+3nKuOz/YaWQecinP+j8lAvir5peeET3PYgjv66SSegagWW
	sGjlyuip4ummdgJwavKWTfI6a8fKwyAKyOqgpFwFvAMEn+Mq2LW5rIPG1LBAoy/ex9VJOjlRgAb
	1mhSpp0rAsJNkwkwZotJzO3GCsPw/L2U=
X-Gm-Gg: AYBFou3+DwgQUhaklBiqbXm6WNME4FOo50kheTmNTSiyMAuvM4Qpu9H3UMzdsTN1wOa
	540UZT3zd+Ka1FTFHwSlQtjFnwfdVcTpo84HX5/83mh35KxuD/zbYTuBd9LotnOg7R1FnO5pHwC
	dxuttSvS0RBCA5wAPTBf9wCwBorBBDbBpKIwYETJGGF7qObJOmcGIDjx3AYMuUgh9ba3Xy7EhAc
	bSxURBxuLQuhhyt1TyT2W/jdVF7uM9Dn2XM9UnfHHIMmtZ+M7GWDV0wfFrUskQ2pr0ywkpZta5h
	nMeoEXcxlFNVJmmx/Bwn1+0y4O2SjPMDq9UcSANI4FLQM2k90BiaVDHhyUqhmdC7Nu0NAQ8jsEl
	RcuwIpCez5w2GRG+zRV/1iDnxqtpaKaxXvDQoByCgFSvY8444G6SruTVVKco2a0ZP4HeLmfS1yv
	IcaitAVxxgOEU=
X-Received: by 2002:a05:690c:c677:b0:80b:9114:3b7b with SMTP id
 00721157ae682-86874be42admr18262427b3.17.1788217052411; Mon, 31 Aug 2026
 15:57:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824213158.3755932-2-Jeremy.Jean@oss.cyber.gouv.fr> <DKYH3KM93BDY.1MR4WLZSWGEU8@gmail.com>
In-Reply-To: <DKYH3KM93BDY.1MR4WLZSWGEU8@gmail.com>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Mon, 31 Aug 2026 15:57:20 -0700
X-Gm-Features: AcwNN1WFnLcmDvQvW4HotcJihJIRGqp5kPEzBTluFqMPQvhKqiOM-NnXr9wLqv8
Message-ID: <CAE5sdEiGA+chRkkNGOWL89AFDNXor1RKHMEmouCNoCXVd4fc-g@mail.gmail.com>
Subject: Re: [BUG] bpf: x86 timed may_goto corrupts private-stack JIT state
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>, 
	bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, linux-kernel@vger.kernel.org, rlmenge@gmail.com, 
	hargar@microsoft.com, apais@microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Aug 2026 at 18:10, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon Aug 24, 2026 at 2:31 PM PDT, J=C3=A9r=C3=A9my Jean wrote:
> > Hello,
> >
> > With the help of AI models, I found a bug in the x86 timed may_goto pat=
h that
> > leads to a verifier/JIT state mismatch on private-stack programs.
> >
> > The root cause is that timed may_goto fixups pass a stack offset in BPF=
_REG_AX
> > and the x86 trampoline reconstructs the counter pointer from native %rb=
p. That
> > is incorrect once private-stack JIT mode is enabled: ordinary BPF frame=
 pointer
> > accesses are remapped from %rbp to %r9, but arch_bpf_timed_may_goto() s=
till
> > uses %rbp and ends up reading and writing the native JIT frame instead =
of the
> > private BPF stack.
> >
> > The bug was introduced by 2fb761823ead ("bpf, x86: Add x86 JIT support =
for timed
> > may_goto"). I reproduced it on a KASAN-enabled x86_64 kernel based on v=
7.2,
> > however KASAN does not trigger because the bad write stays inside the n=
ative
> > JIT frame. Yet, the saved-register corruption is observable.
> >
> > I have not included a patch here because the fix seems subtle to me and=
 would
> > likely touch many files for different arch.
> >
> > I can share the minimal reproducer and other details privately with mai=
ntainers
> > if useful.
>
> Just send a fix and a selftest to the list.
>

Jeremy,

I just wanted to check whether you're working on a patch for this. if
not, I'd be happy to take a look.
