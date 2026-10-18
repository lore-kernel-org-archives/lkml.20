Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F3D47A892
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792322503; cv=pass; b=rl943YzIx1wqTpqnkeFNHDvkisGN2OQyV0AgNk99sbfVRQZrxjZhsdpp0flts93hj5hwkHE8v5bxAGWb6cA4uivK/C/uYsn1V7zl0+V5epFH9ZDCEuX+KMQZVi4mBaHqUW/tyWlCeDK5psetnqaSbGLIlFXiBWISDmblKr/gOYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792322503; c=relaxed/simple;
	bh=6HVJA1CilQEoae2ePMD3zaqAFtAvSpqKqWYCEyEwCOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8TU6HbPuzIL078nPI747hSc0ZIgTCt/cWc49MvfJRpj6WQjNvLm2qm6BHxUFh4ClYZh1W866A1XiKrP3ymkPIj/vsLWqH8Ys6/OyyShTDPtAvwwH3vLQOL8Xz2IZYicJ1mSQ9SYc+DPaib8KTcD80n5d54CdOupX2HECGxNZrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HS0TL9Wx; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HS0TL9Wx"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b0cf2c0785so8950097b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792322500; cv=none;
        d=google.com; s=arc-20260327;
        b=n6VH0gNN9emqvohGGE0WoaGzYN5aqi+NVT4kmjE96x84t48kQWmYoxB3qjeF9rBkkQ
         HNFq7JjblNo3H1a8C+hJOI1SOQc29M1KUeKYIcHfJHNyvjZQvKKhJkSD0JSBXN3SHKo5
         gZzENeMEp2bWVsxR6Gw4b6h5Ju8Gq59U0g41www5NNVNdFoxYCNaRQ2IWZZ48I6BjAfH
         HpxQWPMP4jpmgwETGycCpUz1C4xTQCbuqHLHeUm1/yxv5BhrUIhI7ir7SBB4oXE07O7D
         4r2x8IGFGvPULLwA9Ns+MV8QU3HWF+PWdS1fEEddoxpXc/bLA6hswhj2AgzuO1wEo01N
         9BLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6HVJA1CilQEoae2ePMD3zaqAFtAvSpqKqWYCEyEwCOg=;
        fh=mNHAzia1dELdqea0G7OaNS6D0xpFGTfXGtGPaDpAUAU=;
        b=YqLyZl/ERelfKjDaVUhSRDa56CLWL1/Dj+oYwJQFDuxj/fPd7nmqH32Bggo0/SFrS/
         WSV9IhTPvX95NSeQRWIVh7VYdwANHaymRpWtVp+FV2YWN6f6sO4v+Zv4HEkWxc49jwVO
         Z2KFMmRpxCsUUgKdOAjz6zYmqDDBJ88G1KlxVrHbjOmvi21pMNHOVTfPSkQaN/GooDtA
         I2bYU/7/x5/IeS55tFR7TfK3In+c4zwD8P6bItt119jR0qyvm4Hz8ttPWzaiVjSG5Ur/
         +fSR3RE/atE8HoVdYCrhOXtSaHRWGO7B6fxPoX8CXkrIVv3LiFgYK+b61Awp+FdwCV2d
         dLyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792322500; x=1792927300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6HVJA1CilQEoae2ePMD3zaqAFtAvSpqKqWYCEyEwCOg=;
        b=HS0TL9WxHN/q+rpoIkp4W5iBZcg+0SqDBnXs4XUW66vo/4pU+E352AA94RbgNIp7XH
         fBJKqdO3q18uCq+LcUTx0Kuc4m20xm3BXJW7LZM1CuIKmvX0cLZL0ujnBry1Ft1Y+wp6
         E6sMIdwSq0ZiKNIUWofgH0E5XkUgkwty+evpSmPNQoOBQxDJBd4zr4ZzAf1h0Uqk3NGI
         ysIptz5FHA3fyiTty1LkHsltq1aWYlEd+GjLqeSPXVoK3gaTGWpdW72Jgr8+VeYNShdx
         Y4EdydSg3PHRO9slz0YQFWzJtBAHVya1602h5ORVW3DfSg2y6rlPusyfYlmcrpieoWr4
         cjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792322500; x=1792927300;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6HVJA1CilQEoae2ePMD3zaqAFtAvSpqKqWYCEyEwCOg=;
        b=BK0nNEg2k5PcCnvcUvT53CXuMXR0GBPW7qQwtiRHVsf8XtqhokinVfsbodpzhtudzc
         oB4TIRUUVOjv4YytNF4kbWE5653NU5geNQuGvL0Hb48FOUudGTlht6zsyAdXhos4gd7A
         D0nM79v6rNYY0E1KRemdbwSP1rKPD4Tn2YZ+kH2V+PefNneW1THu4L0luzrx66RDw5lr
         yDeRsfKJBixbrAlNfpaMkB1IKauzm89oJWfzXWpF99NdH8Fn60+F7gPfPpbX+mqA6Kms
         mrGA8aamRWhCWZI/zbjKlnuti9TCcHDuktxfSgtevbKHH6DU9QXj9GTDa9dv4mXYRMnj
         te+g==
X-Forwarded-Encrypted: i=1; AKwUvBw1dj8R4Vh6mBzDiPRpxqX1HSRYwKONJKimViUGguu7M4VVLDa3+YOWmQPJkVEi3p4rAue69oqFNIieUws=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWFyZuJIXmqkclInemBD6FktVVwY/nlWgcESYnyM3bbT+5A2Wk
	UlwUEmilN4uwoxmNzstyZ0XaSATSpAuzyfqlIFGUd8GKf8bQ4oKQmw4kd/O7ENZpvjUf5BzFlQo
	WV4jlG14Ot54XxpNi8660daRDVF8MS2Y=
X-Gm-Gg: AYBFou3AcG2LZgnsP3erLQNGfOd6TZnqYJh3pxvPikwc2MTyRaP3yUUzwJZQbXez//S
	VSWOOTZ1Ngvg3WxbUvbLAweMu6s7WFEtud8uaQtUZ4LCWJTo/dOlYSAeRkxFsRWMLvtsmvnG7C9
	9e3CfvZ1RlRBQM1SQVAd4YM7xxVeLYm//K61cMpICdJfjw64YiGsJT1k7FP1udzI1OtF+alx+Bk
	5bfs/6qg6QG4vqjxCuCjMHwXaW6zyXy+Kn1pRhaLnRTQg758qIUZRg0x5sY5TlR63o1xy2VFKBg
	Gp5AeNTf04Gny/Lg6xhXI4DmPxYJLdyKknag6AksempQyKmE5SOvDOw=
X-Received: by 2002:a05:690c:588a:b0:8a4:d87f:8d52 with SMTP id
 00721157ae682-8b0f207372amr11089807b3.2.1792322500464; Sun, 18 Oct 2026
 04:21:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830-tlb_tracepoint-v2-1-e3c88c24df5b@gmail.com>
 <20261016103630.6e8fbaa5@gandalf.local.home> <CALsPMBPnp8W68tFQKCtx=kxce4bUPx=MR_NwarOmKUJgC5_EPA@mail.gmail.com>
In-Reply-To: <CALsPMBPnp8W68tFQKCtx=kxce4bUPx=MR_NwarOmKUJgC5_EPA@mail.gmail.com>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Sun, 18 Oct 2026 13:21:29 +0200
X-Gm-Features: AclHuK8cy2LSJv8imKz6jMFJVEsTHQHEoKxscGeMPDHByLswQn8-QeWvtdSi3IM
Message-ID: <CALsPMBOZjv9hdjf+ydbro5DHwuA4Uqt21ViWgLRFW9bnz5rDog@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: mm: Trace TLB flush path selection
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 3:55=E2=80=AFPM Roman Storozhenko
<romeusmeister@gmail.com> wrote:
>
> On Fri, Oct 16, 2026 at 4:36=E2=80=AFPM Steven Rostedt <rostedt@goodmis.o=
rg> wrote:
> >
> > On Sun, 30 Aug 2026 16:36:37 +0200
> > Roman 'Hedin' Storozhenko <romeusmeister@gmail.com> wrote:
> >
> > > diff --git a/include/trace/events/riscv_tlb.h b/include/trace/events/=
riscv_tlb.h
> >
> > Please do not put architecture specific events in include/trace.
> >
> > They belong in the architecture.
> >
> > See the example code in samples/trace_events/trace-events-sample.[ch]
> > as well as the Makefile there on how to put trace events in directories
> > outside of include/trace/
> >
> > Thanks,
> >
> > -- Steve
> >
>
> Hi Steve,
>
> Thanks for the review.
>
> I've moved the trace event definition to
> arch/riscv/include/asm/riscv_tlb.h in v5, following the existing
> RISC-V tracepoint convention.
>
> The updated patch is available here:
> https://lore.kernel.org/linux-riscv/20261017-tlb_tracepoint-v5-1-256fb539=
3a7f@gmail.com/
>
> Thanks for pointing this out.

Hi Steve,
I've posted v6 with an additional fix for
the alignment of the dynamically stored CPU mask.

The trace event definition remains under
arch/riscv/include/asm/riscv_tlb.h, as in v5.

The updated patch is available here:
https://lore.kernel.org/linux-riscv/20261018-tlb_tracepoint-v6-1-1447642787=
0f@gmail.com/T/#u

>
> --
> Kind regards,
> Roman 'Hedin' Storozhenko

--=20
Kind regards,
Roman 'Hedin' Storozhenko
