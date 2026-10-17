Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307B73C4B91
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792245836; cv=pass; b=Z/lPYAJ7Fsnv6YTlm7oEowooS1o4kGvFGXNEQ9A93PZrEJzUjjRmw001+xcxAREmwjwTqd+TDVkrViorVqn5J1ZzYxXTok82WA/3RnoQv1hiQ9CIjRGw7i3SgCpyMKysKibMU/F5cFyuK1ByavKUL366vPsIbf/EXtCR2xqPFpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792245836; c=relaxed/simple;
	bh=Q/dWGxF+K2INO9x1LZXl2OEUxrgdNRguf9DssJID3vQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jf7CYN2Oyr1M14omTY5iSRczYU/LS+LJ/UszbfYNrZNB8VWh2a753Oo1VWuKj5Ygm/01KcIatnvfe4e2jJcJf8h42wHp9n1gSpF6SQXPdplsfUDMJr1qjWE3BP4K7KRLdYfIXaQ0nTrdSC9za8aNECJNjNDweGGNg0gGaB1VUO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXsvu48A; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXsvu48A"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be42ae8eadso490362e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792245833; cv=none;
        d=google.com; s=arc-20260327;
        b=pL766m+R4LGJneymE+gLCfehdNDpC/n3TJLO2Pw1eo7ZpmbmBNqSRyWAzYr/WvTB2y
         sro00sA6u1ss61ofPz/X0CuvoPcfZRfQfeMq486lvR6JWSxf3M/HAqgBm7GN+DrnS3JC
         HeZUqpFXdFDQAIF/eHLL63Ui4qL4ur+WbgjZl9EG2fjdc8QoRt+G2ODhf3SaByQ3k0rO
         vxf+KhFBGYdtW6yYuHDWdS7WpfPHox5TCrrKNaq6Nz32VUfdPr7OfuoUE/PKAXZagfSg
         1dnCB/SZwNpUt1Kws1OVRA9hmh8NmSljtpRy3Ff7V2W91Y0FcXnxmR4UVAGPMdNWAZCm
         PyYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+OsE2x5Pqitm8v/Z0qp1dkwtBd3ch11zvLF7iHqatxI=;
        fh=APmiroxQV/9zXAkNjiuyew4/8uIp246/3lGD4UGmYUk=;
        b=X1J6SwiER91vgAx+e77Bw741+u9ihtpv7DYBRvUb27d0a8Ho2FNaLDD1oAI57bGSS/
         e92nCKeCSxGz/Lw2GHlt5q5GVRYY55ujNvMiBo0/AuGHDtg/4oK8Fp1pgNB4+U0Bf22d
         2PKDVuH8CWtOWA5HlWLnZ8MmwwgiG8gtadHh9/LKLSGscphHSvuY//n7iXcLE64YjOfc
         l81N6wmuTQRprpGOk+SJS0dxuCMqZZajnlJFSEGFPQGQlbAtQlCW9oJxf0djx/sKeYZI
         yMQdtwsYPOnyxL/9h/S1doTw3WHloTYwYrPJcZhqHmEKeK4/+d0HOilRy/ijvsP4snlb
         q8nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792245833; x=1792850633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+OsE2x5Pqitm8v/Z0qp1dkwtBd3ch11zvLF7iHqatxI=;
        b=hXsvu48AJy+/+LX0sQ4R11DVxj1D0bH2chCf+T4srbd5lwAx8bbc5TEIqEFj3jo4Oi
         UCciJ9g51VUIzdYf1fm0YGFS9AdMCuRwmOGRN45R+ZaAc7Ca+P/E8F/iSsD76jgAEgWr
         DfZaWi1PJ+zX/Ginb1JZN9or7savwh1lJ2Dfd5gHfMr+EkfCSmQNom7fDdLSay+jCJV5
         XxXzucUunCG2LC6qWN6ANX+KaSkx9SHL9y19ggjlZ8G7xEeejsIW8HZ/ygbyxmcRK0y4
         JGLT+vqU1/y9R/sVyZGnompKUq+ECLYwcUXVyjUWiVaPK3DMxpMwzmZmhSv75CxZQAEN
         EkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792245833; x=1792850633;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OsE2x5Pqitm8v/Z0qp1dkwtBd3ch11zvLF7iHqatxI=;
        b=Fl9pa04GaGQJvrb8XP6leunAwavokESkJgpukDWpMwEeeTXgKxiZbo3H/tkwfd9aH+
         niHLgGhcu1rnW6YRWCBvAGpSf+M3fVz39sv8nxQ/tnxFFk+nASrgpg0/om/6KQHOlur/
         giFdkPP77JdWF+g02rKhZkqRLEYmfx7enOAHvb9xZDYrClAtsX9y28QV8kZz7tfjgbg1
         5UH8CjTQI38u/v7o4SqWkbWZyjINVRVNbJArOj0ibiBrs1ILe2LtKO4wo95zqKMkMLUx
         gP9m+rm4FBmnf8jyiO8z2pOEeh3QZmV2UgjCA4vmM9klwpK25UD6R5HwLJ4iG299iARl
         4Cag==
X-Forwarded-Encrypted: i=1; AKwUvBz8WnAn30zezLMI6ts6xTe5TvjMpjGESggHwRjMwe3bSLmSFyRc5l9SzkbVNASdkFl6Lr/IiIDwU9rE1Qg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKx/36R4MQP4HyvRg94MpBl8Pea0g+YOu+MlxC7AzAclPFEK6SL
	QQvwBIiyvuTbYoyL7eqPXHLlzoALZiSq3Ukac4LXaPGELHKp93IPQFaKUGq8r+tXdeXj00lrI7u
	A2oQdvHMtYxvnm2lEYfC8tVQjY1j4CMh1qEcN+xQ=
X-Gm-Gg: AYBFou295mIlgVF1/wwmQD59TtjBdsmpj1sgefwFmzjPdvmzJjKdxhMUuSzfqWahuL8
	8/RaHS78g7kq1RPEI7UsKkvTmGhCnFFRSBLQRgZTvd4M4HYpdr35V2uqceAyje0qN/ADzdhQKqF
	+QaOVMvwHtIEpJVX0S2Bjc8c/HMStJw19ZFVgyNxxdm54usBy1CqXCdj/vjrXRBXThEpI6RpQal
	1ihSd1wlRHmvALI71NcFG45tjxp5ugzjWtNh5cQhw8g/R7mqHdrcqANHnkDF0MjvJEzCJGhp5Yk
	vLATSRQIAGwjtNvKFG+d/6OuMaLyPAQJM5xIGo4qAU6fLHREGJ0+IFXeLWwglF9JOQ==
X-Received: by 2002:a05:6512:3c89:b0:5bb:42a2:31fa with SMTP id
 2adb3069b0e04-5be50a7efcdmr899502e87.60.1792245832854; Sat, 17 Oct 2026
 07:03:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015-tlb_tracepoint-v4-1-f238a2bd8f7e@gmail.com> <20261016103846.73ff2980@gandalf.local.home>
In-Reply-To: <20261016103846.73ff2980@gandalf.local.home>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Sat, 17 Oct 2026 16:03:39 +0200
X-Gm-Features: AclHuK-r_eYg3gupJbYI7DWak9c5eTY2IipHa3Ysz4nKK_X5lXKKwE8MhWngSzk
Message-ID: <CALsPMBMeXHd1TN89bHCtS3G0M8MFiimf8w=qKayxuYCad8v_Gw@mail.gmail.com>
Subject: Re: [PATCH v4] riscv: mm: Trace TLB flush requests
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jisheng Zhang <jszhang@kernel.org>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 4:38=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
>
> [
>   I realized I replied to v2 and not v4 as the thread of v2 pushed that t=
o
>   the top. I'll repeat my statement here too.
> ]
>
> On Thu, 15 Oct 2026 19:32:34 +0200
> Roman 'Hedin' Storozhenko <romeusmeister@gmail.com> wrote:
>
> > diff --git a/include/trace/events/riscv_tlb.h b/include/trace/events/ri=
scv_tlb.h
>
> Please do not put architecture specific events in include/trace.
>
> They belong in the architecture.
>
> See the example code in samples/trace_events/trace-events-sample.[ch]
> as well as the Makefile there on how to put trace events in directories
> outside of include/trace/
>
> Thanks,
>
> -- Steve
>

Hi Steve,

Thanks for the review.

I've moved the trace event definition to
arch/riscv/include/asm/riscv_tlb.h in v5, following the existing
RISC-V tracepoint convention.

The updated patch is available here:
https://lore.kernel.org/linux-riscv/20261017-tlb_tracepoint-v5-1-256fb5393a=
7f@gmail.com/

Thanks for pointing this out.
--=20
Kind regards,
Roman 'Hedin' Storozhenko
