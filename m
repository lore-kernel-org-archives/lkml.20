Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A3D3655CE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 04:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791519003; cv=pass; b=mgz49XhKRDYsO/th3nPYz+ZN7BC1XoykuAVebOeXFXCYc2fSTsVWkVEl2zzPsTMKFQaDb47gBGJ3BLNgMcWnajK3xeC1OGJvtizKkDMi8UH1AUg4AEuer300pyhUoolgEjrYm8aEHviqz0kdMoOyzwee9Hx49Y1FmucCC9rjhnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791519003; c=relaxed/simple;
	bh=NPttGRQsFZMlYlWq7ACnEyxHFvnrxryCdv97VywA4yU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PPbwr4wSmK7bc5GXC3rVpCKxMgpy7AhxLzG3VbJXdTHaitiIgZe4tKnWwQsuOGUFF2oaWpBCF3NjOe9c4bSigVbUxNjlLR043m7u5U4ryiQZxgCBuNEmhpoizKhlXSCUGH6Z2lhTeY/pPUUJBXqLyrcOdhOoF6EYoBQNTvBx3Ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p6d+iwRm; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6d+iwRm"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2e5f8fe879so589627266b.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 21:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791518996; cv=none;
        d=google.com; s=arc-20260327;
        b=WE+r09yW+fzuV3zcTuTi7R5F6/4M0Wl3ZqERT8/oU9YRJlTvuIF68EPlYJspvmXebM
         vRGZcycr0FW38TUB/pJ63gmGQIS1t5dSegMXlVfpnKO81eOX/33E8tfC8uVUaLm2VfLc
         NY3xMcr0QMMD1Iogmnw5XHpUxbx2pGn+X8zjSl6Rlr+hmFpWxk5AHxDWt7UfTr/KNukC
         1ZtLUxN0ki/50NBvgIaZt7VjocanigVSiySco4nocprPcOebBGZMgBSPGO/aLEnUiWub
         FBQPoHJwK5L6rzbvA+ND39XKCFvCbAFfEX8nvTRVGkKN/chRQ3MDfFJ6FTM0arzooYJo
         CoQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s0w22iAxwWX3zCufP/m+FoKgPyaiXV2DxPNqJeKo2Y8=;
        fh=mi1bNm3R2YtxJDaFnYY2rqNDj+5FKYRzjF+Y9mucGoY=;
        b=sAYyh6fhKInToSIlry0Iv97ZSRTHunqwfjHZzQN7mKcjoes62tE5Lxw3t164C3vh1F
         M/4ZTmWIlbcVz7jbOXvA1ZfNX8oxKsYTjK0DT5Bq83p38hfAxez9/e4v7mHzO/XJbEYx
         gIJDT0Xfiz9nksHEg+2e8AE2XO4berQcFJj4PjUi68sswsYHAoMd/JXiqsy5/L3Mp+0K
         PGY+w99PiNsv9Zi6dvS1WPq78rCh8qH8zzRkCSiZTTiYNlFpSz/+5+eP49/gvN0WiKLJ
         CSA0j+6v+RePCJOw5Qkq01ztDvo/YZTlVztasNZhcfyAoA3WXW8TzV+dt6HfynaqijZJ
         YyyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791518996; x=1792123796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s0w22iAxwWX3zCufP/m+FoKgPyaiXV2DxPNqJeKo2Y8=;
        b=p6d+iwRm2x7LWaIkCMasRyU2yPdVda2HJWuUN8G/H3h7LwLkWevqmmbL7R8P3BGKZ2
         GV4Gq0gzVR6d728XeL5QV0nfse+EQfJOdOEt78o7kslfz7C/9NgZrZT1PZ74km4OCvCi
         noNV08SqDMdCNM3l1HrBbhJhQtY7ukO6GzMIDExpHDSIuhCJm9SoYjcpg0aUzo9hxn7S
         /t0wP+rX2hT022VHOVHpV+q0LGRwwED4585VIcCZnJP6IT0zdqMKm3Xcz12aIY4TSh2U
         PkVdNj7+diullU+IB1OEyQ1wS/m5r2k332sxNNP1FHTFAZiO7/R+Czp0e/1TYqZzEdrV
         5yiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791518996; x=1792123796;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0w22iAxwWX3zCufP/m+FoKgPyaiXV2DxPNqJeKo2Y8=;
        b=k0MCaIWqhLyrHg7BhX0CCE5YzlPuEOHZGOy2HRapnu4GxlW52+HLUi+VNaulQnOrmN
         wFO8JSk8mj5C+MrvHCcLTaOLIHcrq9udCvMysSWjtu4tNzV7A42XN/B1hi4pbrcacBVm
         KwRv/ErI4JZyvVjC/bKvuMgSWXcWzJSRHGHQvoNlaSVV+doR1hufLgj9MBMd5OsqFQNZ
         TzLY4n1Dl67OrUePnpEfFEczerBpI6iIObu8AVh3ZikVcKR/fLpTldAs0wbqbw+QgbnU
         AbrPiPoqhfqIAhheT39zy6u51kqg5XeE7AjsNCD99SRN0qWx5g9W6am9U0yCx0nxHIYY
         CEeg==
X-Forwarded-Encrypted: i=1; AKwUvBxW60ihOrJKFvArhwrpuWo8di5ZkgwyDyIf+QLDB60nRmi7rwxs/zC0UM36LBMM3pO8Djx0+KCZv/hQE4E=@vger.kernel.org
X-Gm-Message-State: AFuF++lZuWE6lS8LDpU3Kc2cWwRZw0ExykPJb7NluhFSIbi5zuln74B9
	GWM8y+cxmSlmYiXg97PV/HiWzc3zT7E6dwD3NkJwB3evqdPHTn9GXs/4938May7R8NWhDRDFEan
	EpjHSwPfKBzOHDEvZInKwX35vqF6S7Do=
X-Gm-Gg: AYBFou0yo4QqI5Lgn4q+xk2UMJ9W+JcKFbFEjb4aeM2PdPEXyKoZ6IPuZiSVp9JMFfB
	Nevl2P37IKBl9cA/bcbqK8si/nq2AxLDhPrrQiUgk1nA+X/1IdvCw0uBNC0bNCWNOzWmcBnZtUG
	EbLygbN4Mv+Wf5HKyRHn2gGZjcnr33TWYqNM40nhoUL7nqsbLW+FITNVJPDVuUi/l9KAktxOiuy
	N0bih6fL0rSY4SaKfXJj1tFzzV5m3rgvRg2f14BWxaoGML0PMR0BNM+/6tKR6acOLAUpkHZ9q4K
	lLluh9yQEBhB9JBpEQ+3cAWtVCYLoOs5I7G1jFw4+a5LaFOTiEGAI7UQT9M0kukWIoKvIYviQ8i
	aq88JyoPZ8Ll+nfb1VIUKCbL3vQIiQS7sdvfzG7/dc8LEeNodh/2LGQxfeqOrj7lSTeS/TrWdBC
	qDWdo8AAxoDEey4LDggre4+8v5ztGsTCUBiR5JwJDqRmPDS0KGFfF8uTa6cJ5zuJDjPH4=
X-Received: by 2002:a17:906:dc8c:b0:c31:8984:7fad with SMTP id
 a640c23a62f3a-c31a9feb114mr51812266b.15.1791518996327; Thu, 08 Oct 2026
 21:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004233523.516891-1-rosenp@gmail.com> <ashiQ98Qmie63mB2@studio.local>
In-Reply-To: <ashiQ98Qmie63mB2@studio.local>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 8 Oct 2026 21:09:45 -0700
X-Gm-Features: AclHuK_UrczYSgWiELM86QENzwDdfuoi_HLVyZFd-zZES-cUZQQiE5vhNbu5RWc
Message-ID: <CAKxU2N8WtY+=dhSTfyu=8ujEwnkcfV9PEkXxuTLHthwksDhTxw@mail.gmail.com>
Subject: Re: [PATCH] bcache: fix kernel-doc warning on CLOSURE_CALLBACK
To: Coly Li <colyli@fygo.io>
Cc: linux-bcache@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 8:41=E2=80=AFPM Coly Li <colyli@fygo.io> wrote:
>
> Hi Rosen,
>
> On Sun, Oct 04, 2026 at 04:35:23PM +0800, Rosen Penev wrote:
> > bch_data_insert() is defined through the CLOSURE_CALLBACK() macro, whic=
h
> > kernel-doc cannot see through, so the kernel-doc comment above it
> > produces:
> >
> >   request.c:308 function parameter 'bch_data_insert' not described in '=
CLOSURE_CALLBACK'
> >   request.c:308 expecting prototype for bch_data_insert(). Prototype wa=
s for CLOSURE_CALLBACK() instead
> >
> > Turn it into a regular block comment, and drop the @cl line along
> > with the kernel-doc markup.
> >
> > Assisted-by: LLM
>
> The patch is fine to me. Can you provide the detailed LLM name here?
It was Opencode's Big Pickle IIRC. Current documentation says to just say L=
LM.
>
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> Thanks.
>
> Coly Li
>
> > ---
> >  drivers/md/bcache/request.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
> > index 3fa3b13a410f..e7f097346d64 100644
> > --- a/drivers/md/bcache/request.c
> > +++ b/drivers/md/bcache/request.c
> > @@ -285,9 +285,8 @@ static CLOSURE_CALLBACK(bch_data_insert_start)
> >       }
> >  }
> >
> > -/**
> > +/*
> >   * bch_data_insert - stick some data in the cache
> > - * @cl: closure pointer.
> >   *
> >   * This is the starting point for any data to end up in a cache device=
; it could
> >   * be from a normal write, or a writeback write, or a write to a flash=
 only
> > --
> > 2.56.0
