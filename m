Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DA9420488
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064612; cv=pass; b=fLjYS9zYwkOsr7+kI+YnX5y3GX/6cwLaesRKerXXLNZBvcDWKW43rKEBphbbpBw9YwtPQlI5RNFoEHdHFf0vlKuXEXohnQrgEqRz7TkkiuO0hGdPni+Yf4Ad6XkNHik6iUmXIJO4cilxkabvB3cLk/r5UUmHqjF2ez0hEvH2R68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064612; c=relaxed/simple;
	bh=0TPHr2wjc7lv7i9amMHXALYK0m/OfGIqKy9VfsJQwbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JrCi8Wl16LBNciX+ng0W3awIPR2HXmawSUMbDwqFcHvStLDcrjvRw59O8rvXCgWK/DpOoJ8crbnpecop9+jMr4M6jxlEZbx8jTpeaQg8RRxug5vj4zq7a9ycDQpBTEKS2YEVq0P3gCnyShupwUIhhpTI8wbrsAUz9JVSbVpQuyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UI78I7jg; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UI78I7jg"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb767cc7fso30966331cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:10:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790064595; cv=none;
        d=google.com; s=arc-20260327;
        b=BoUejUaPpuQVDqEI/9uidLGJwvRjb21RNh046IlB15YL+R6kpSR+myc+WN8F+r01Wp
         SSnc9TTdbA9szsueekgTUmHIPDwN4gkZY6r202nUqYVwlEW6IhmpuDBEe4gEQMBQBdPV
         KNUYl1fevbyXPhQ4kCkb+wM3ugB5psOMYtVkCIVMTpDFCRVwUraGBuIOj36XXxE5C3+8
         0LBrRUGr11+EXLx6/cO/s9x9e5Uk4sJhtZLBRln2UYWFqItigaKyFGx4E+ry+WB1BmzY
         nKRoTaybMm1HgaMwrpqDguUT+xyuBeogCnlwUKrihGa2tROhdGPYmh00+uPS2nZRtSom
         NMMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0TPHr2wjc7lv7i9amMHXALYK0m/OfGIqKy9VfsJQwbc=;
        fh=n485dcTL2XMfO05lPt3V3Tyi8V+pB0sJa4q89RmEIR0=;
        b=cJmVQu616tNaQDz4XGyq6KY8caPybT6Y6qpZuN/AuSTedTvZua0gSxHVKPTNX/g1Y2
         QzCrDpC5yE/4slaJG8El1eWRorlcwlDBcl+M/1c239OgEZq1lkL9auorOC1YhilCW6Ni
         Y5y7GVz065EDWF6iVm7eAI1O8ysYoaoOmjYLnAB0d8Hv9oamU7j60hZrYiHT/zo0CIE8
         0KEFptyEQqXy2d2I8ylNlNCFvVgFQ+OPIGatKanpSIRu97PxG7IhOPLR5hhI2w6q/dzV
         5VvQ8C7XNrjlAeVrZ2fReKjxakgMylkGWeUZmQJr3/zuQ0QXW8NLn3emLppwPiDKp4Z3
         +idw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790064595; x=1790669395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0TPHr2wjc7lv7i9amMHXALYK0m/OfGIqKy9VfsJQwbc=;
        b=UI78I7jg2WcXtLSBRhot0Ibx1hwI5uqdSXP9L0/P9Ngf2Wf2tNiyiQJfV0rrLgGMLu
         IJu/JLXLNDQIYa09dB+7MS+wmonGDrQeiaJK1vsnwgq6V6QWOVc3mpTvLwhbxNyWX0Mg
         vre9548+kquflevrnvMByBzcn8QWU4AP0SihQKwfeD2mTRm9eYn0QPBY8UMNYUNPuMQP
         ATuJK9cUr3eA0hU19PIRmOamZ3616OJgOdDCtqVczw/3hUVDlCiJdEXE41W//BVlnMEI
         /SPWl7MLxYS94PfP+CVQPRjGQtBGiWRU5Zxxitz3Htc/PVpRTXJpuq15YZ+WWMCEclX5
         pGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064595; x=1790669395;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TPHr2wjc7lv7i9amMHXALYK0m/OfGIqKy9VfsJQwbc=;
        b=vB+u4RutMrwnjiFNlzYCzNx6gydzoOMDtZf4kU8EpYyl6w3cBZ51rXhiQR93QpqyC+
         YDCp+CrfRQJ0RS8IWw2QjbK0k2HbvusCanhSzD9qpChwcrLBwdipGoBN5r6GepqWEVBZ
         T498ZvpoIl3I5pevAb5VKMgK5n4V+LJst4D8m3EjaE0SLMFrlwP8EFVGgHN72s48x0xQ
         C3Mxd9npaWvvhTa3j2/bevchRb0umqoYJcWsQx2VtMuOQqmvSu6S4JyH3KX0hzr6tIkV
         I4kvrZSdcnIgIn6RdsnUS84CoF0S16YWE2qp6anYOQIp7KLlXr3sHp87UQhpC/r/x7QZ
         bqSw==
X-Forwarded-Encrypted: i=1; AKwUvBxTSPPqiYNABMJ4WhkYcUwwHcjYX+npyp58bZ1qHOsK9dysZwDfSo/cD8crJugGbIyiEkN3pUp8KFU5CBg=@vger.kernel.org
X-Gm-Message-State: AFuF++kPD+KkZZofLQ1BHVJIX73zrNJfyskII1Gr5LO6dTjP37odvgZ6
	g/Q18fM6T6SGpIA/lvO7v6LdtvbzVZm1wYSIVPPXKQb3jRRly1VeeXLdIYZT7AUz+tL5uMAVVJZ
	e4Ia1YknyzE8F5IGCmfBYnfNzCrqop25m5XQFBEmZ
X-Gm-Gg: AYBFou2+ENUuQvYFxgH+eBj0xqkU5ZCZiJ+3MTDLYzm1CWuEVMc9vA/NjZ4oCP0WsJ3
	alYH4xOz8UOh6h0z+CSDHhz2aLHG+v7dj8nCzsPzqfLRSou0OL+KtdNH4hvHr7B6P2Qm9CaLvqJ
	OwqGTbirY0phWYdQiJfow7FvOQun1tneFirdFTl0sjZm9bb5wn7zNRKt9BDrFGrcgL6+C4zWQHs
	5z2jA6etxw95aMJrRyoYsqorTTNT2ddGt9tMUfmsdKQvl/Xp+YPcPasooTMDCKUgQJnOHl5t8Gw
	F0CGCIKdxgq4yp8XknoJVYUy8ck7luEsk8V91Z0czuOpZEa2pb2RQNaBe6PDiqvf2JlgdQUzxxL
	hKiL0bAZHPojrnsoB3CJV3NsK8WWsqCFEi+Sx0d0u3OnldWUCLYjTV7dcZtZFhA5wcUmLLg==
X-Received: by 2002:a05:622a:8b:b0:532:9ade:b6db with SMTP id
 d75a77b69052e-532d8ec0addmr44120171cf.68.1790064594490; Tue, 22 Sep 2026
 01:09:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921222609.50824-4-jeffjo@openai.com> <20260921222609.50824-6-jeffjo@openai.com>
 <CANn89iK00zXGA8sdpH9Y1CkFK3n=uKG9Bci3+=69fGV0UDQ80w@mail.gmail.com> <arIE_i8Ysz5nOI2W@com-94485>
In-Reply-To: <arIE_i8Ysz5nOI2W@com-94485>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 22 Sep 2026 10:09:42 +0200
X-Gm-Features: AcwNN1VZRZKeamW0woMTH2MljTZUPUykptvBQbfvKuUK7LNYhzxm8OhK1Dtip-A
Message-ID: <CANn89i+nY499TfuGMvMq3P=Pxw6vBxe+uYH1zioK=bhU--GXYw@mail.gmail.com>
Subject: Re: [PATCH net 2/2] selftests: net: check timestamp echo after an old ACK
To: Jeff Jo <jeffjo@openai.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 6:33=E2=80=AFAM Jeff Jo <jeffjo@openai.com> wrote:
>
> On Tue, Sep 22, 2026 at 02:08:47AM +0200, Eric Dumazet wrote:
> > Note: Even with existing packetdrill binaries in the wild that don't
> > check TS ecr,
> > tp->rx_opt.ts_recent is still directly testable in pure .pkt via PAWS
> > (tcp_paws_discard()),
> > the same way tcp_ts_recent_invalid_ack.pkt works:
>
> Thanks for the feedback. I'll send a v2 series tomorrow removing the
> redundant SYN_RECV check and replacing the test with a plain .pkt test
> that uses PAWS for the assertion. I've verified that the revised test
> detects the bug with unmodified packetdrill and passes with the
> simplified kernel fix.
>
> For the PAWS probe, I used TSval 300998 rather than 300999, since
> Linux's one-tick PAWS tolerance allows the latter through.
>
> I'll follow up with a separate packetdrill fix. How does that sound?

I saw you sent the packetdrill patch for formal inclusion.

Let's wait for it to be merged and our runners to be updated, as the
kernel bug is minor.
This will allow us to get a nicer packetdrill test that exposes the
issue directly instead of via a workaround.

Thanks!
