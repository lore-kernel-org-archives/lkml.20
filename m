Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792500144;
	b=nUdq64r7w3Ju33BfNGCL5NVtq5fdnn3ANi/8wpKGTENfFO25K+8rVobwLifXrzseqkww
	 ohDdsvLgeiVuMFcSjEmY7f2HW/27/Hq1ESefkHK9CrF+ZdikA9S6cxSy8+qov8YWMvz/2
	 T9cpBd3a+5Z4rUXeq/9ic2HwL4j1wJdTNFE9pHFjUhZZeu5Ht8mpIrb2/A5gB04BzDj8Z
	 Y7s8QaWzXodswi7fYZnLXrkmK5iQxQuiiofMNOCrHQVfqTWSZAK0VdCnrXfRstq6U9wha
	 i66e7X66FcDvr5wGWSwlFtqV82W6gWGH+igqHLjAS2rVsTHtyHskCdoJ5JmWpJHld0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=e2sTq8rdN+VW7WxDK+7MxrZLHRc/4eEUgMwJJ4qrXBE=;
	b=jb3kurBnhHn2FNclCCbD9Pcrgmt4bgfjo0X1sHvwB5DqBjHrPIzUCksy2Me542kZR95D
	 4Qq3wsHHfhSQBICX1Jl2/x12kdxdCKvb+TpnI/LtWX0Uo4+sW/IwauU62aUMjXD9yH0+I
	 yG1nEShqss9TpWPTW/suO1acCRf3SP3XxSn128osVRF970RyKweuJ2HqFKc3MUSdITgZ4
	 qP+GJC/Ou7h3fB89Q0cXHJ/QmmkIqC5cYOb8dhOcKjKRNWAziQH3eNsg4xS+9j+km50sp
	 1My7vU02cykuZSw9rS5r045iun3h5obIOGlxm2PaA9BPtc9FsGUuvk23bJmb9rr+vQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X2bq2x1u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A16A606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A16A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X2bq2x1u
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b05bf699easo27272257b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792500143; cv=none;
        d=google.com; s=arc-20260327;
        b=VDTmVCYrofHWQaE7R8j4v/Avf62zHOF0qCGd0JBYXPdZUHSYovUpJRTR1lW0uQnrSR
         u1w2EQIfpLLDUEUm7NjgEjfgkSvQPoKsYnvtvmIkXFmw/I91lxxI+1qGuCTZFLHumxOa
         7MQuXaEkIbUdJ0Waay5FyhLs148+lRIM2kswPMakHRJ5kWDkx5cESqmTZlflisaJolL4
         8jffDGnCLij4bABW9puZkL9o3NNV3TSBKxlVD6ZW9MT9FYBwuYkuUwnaluOoTAqRKc/Q
         MW95/XIlgJT84B2x15FX8f0wLQ2BFdM3ww9L+scOs0mlVEptz82YxDWwoypTT6Yn7JIK
         AtNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e2sTq8rdN+VW7WxDK+7MxrZLHRc/4eEUgMwJJ4qrXBE=;
        fh=1yJVjvmqvrqCIjxo01wBEme9qaOBRP5WRNke74+IQ7s=;
        b=K2OHYTlNbIPtlic9tnhD4Rv4vfqOvzRq/m5/bbvWt4N4A4f0uccVImFZQAZTGrkc5v
         QSiIAfu6a+dKMG8U3NIHF7wpg7eoQxp1h+xGgf1lrwr2kufEXcLwB3brhXr9lAXTExm0
         dk30Z6Dh6cjrwXWYfpx1/gpVGpoq86Hcg0pYCIi832qWPv90FyE2TjOhhEon9wo+fgVc
         hLa/ZtiQrFxVfvk5iWDqwSvKd00aQvd0h4t+HTCKX6LEZt2Cb+RT8dnA7NmD5GReG5x/
         oXaHJBCFMcNLODRKm9Y96vba3Snt/5Pf2FnRoR1511Y6KNtIb6QgnWWQasFstHXILhXe
         1FXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792500143; x=1793104943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e2sTq8rdN+VW7WxDK+7MxrZLHRc/4eEUgMwJJ4qrXBE=;
        b=X2bq2x1uOcf5SD4Z1rIbzmkbLrI8X7gjghTiiwKnGmMU+A1Mu1M+kTp6pB/kZ9Sus3
         XroLWmoKSbwvHdyA606JeKhhkAgFC/ihv2EcRN8ibH/9qA+s3IDge2aIcrh0xgb3JSZT
         p1NAQX2GQ4hBVml/rEwnJs84BiBIdrTyzbjXRVklC9JlDcc97IAScjIN4Gip86rRP6zj
         irbssSe8iodF7VxHrlGve69pUeJ8jZGMnFyDS1HvsIMcz3mv0R6kJo89dSisMrJMzcoJ
         b7aZi7N/5KSl3zOXgx7xp1JRzMU+j60PFAOqgng2uycu28XGfwT2rALZI7VfI1iNnn9m
         O7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500143; x=1793104943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e2sTq8rdN+VW7WxDK+7MxrZLHRc/4eEUgMwJJ4qrXBE=;
        b=UifOvpAtCUAXNXvC2cMdK5oZ4TivZVxgg4M9UWh4ic+urgNXg6GJfsAevppWNVXkG0
         da2FMlycTmR+ynjFWB9/pHoJ/6XYa6zapyOY2BR7zNrnp4NmvISwMr43TLBEkfQPmOt3
         BAfDwN8knKNuMJPyDjJvNn4GFzrrJVxgwZMQ0nqBnJrt7FYgIUkh9cj15DPYxIrU8bMA
         pw/li5ItHIiINPiFbJYkKpBwkRlOKMvA+3BRoULUQ1BiPKZdp6hAjxYzYAISprgx8IrV
         g811jRAj78Zvtiv3ZkNLmn47+nBTWT8MHSczhnNeI0YrorTvNYILzIlvYkBY4JjBsqq/
         szug==
X-Forwarded-Encrypted: i=1; AKwUvBxaNIOe/wsPmePHGWpjno68qffM0gnoZQ1XYf2LiVNpQ/c+I/mmcdoc6ob7OeBxA7JCgjantrOehI8wp6A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcCaDmirjnezID0trzyKluvfMiqlcKEEx3d8ZGlKSbm22R3mRU
	mLL6uBN6F9GvaANs/UfNtbdUVf7mxYGqC02mMV29WC5fiOaRL/Zt9m459dRh4zTBwC30OF7tqFJ
	xhWGyGz9JrVy0FuZZIC5m0zpZHG1X8CI=
X-Gm-Gg: AYBFou2kj1jRfqs/yEXYrSQechEjanMXN23wGX8Db3xagmUzhb0o8TIXoOP7wz0qkmR
	gwbUp7x7Z5cdlFcBT2v7wClAg7j919aXLkwfSY65I4suVn881lg0PGYj/63WoB1VMUYn6YLhKMl
	98xBwnp0almR9SAE84/ptG9S8lnTRjuOWPQqHkthzp1Pz9p7jlZa0BHPuR2B+It5+IAjidYH1R1
	upeqA2CMsEUNmP6X2jIzegZm3BK+i3qFeuyib8vf7uwSn8uuQ6YSrp9Tm4WblM60nHL4SUYU5E2
	/9GVO4MzvNcp01KdQICmsYFfVc5PYwtscKGAIXDn3fI2waH0LIRB3a0ooExmrbqIBw==
X-Received: by 2002:a05:690c:a686:b0:871:bc3:9856 with SMTP id
 00721157ae682-8b0f21ae1a6mr25138067b3.33.1792500143092; Tue, 20 Oct 2026
 05:42:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-tlb_tracepoint-v6-1-14476427870f@gmail.com>
 <20261019100029.32a09f71@gandalf.local.home> <CALsPMBOKENath9-6pUoPrrSRbuudg0V9tc76bLcxsnkQJJkvgQ@mail.gmail.com>
 <20261019142644.5f02d139@gandalf.local.home>
In-Reply-To: <20261019142644.5f02d139@gandalf.local.home>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Tue, 20 Oct 2026 14:42:11 +0200
X-Gm-Features: AclHuK8dqEhVh2tz4HUjh8KpGEYzpZopHeRe1CVlc-2n0yq-l7w7CGlJ9Twyn-s
Message-ID: <CALsPMBNVuwwmf51186gu8K-KeQQtSBBVjbg+z57xuMa+nr=DEA@mail.gmail.com>
Subject: Re: [PATCH v6] riscv: mm: Trace TLB flush requests
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jisheng Zhang <jszhang@kernel.org>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 8:26=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Mon, 19 Oct 2026 19:24:17 +0200
> Roman Storozhenko <romeusmeister@gmail.com> wrote:
>
> > I've renamed the header to arch/riscv/include/asm/tlb_trace.h
> > in v7. I prefer this over riscv_trace.h because the latter
> > sounds too generic for a header dedicated to TLB tracing.
> >
> > Did you have a broader use in mind, such as including other
> > RISC-V tracepoints in this header?
> >
> > If you still prefer riscv_trace.h, I'm happy to reconsider.
>
> Either riscv_trace.h or tlb_trace.h in the riscv directory is fine with m=
e.
> It's more of a decision for the RISCV maintainers. If you plan on having
> more RISCV specific trace events, do you want them all in one header, or
> will each have their own "trace_*.h" header?
>
> I'm fine either way, as long as they are named with "trace" in them in
> order to acknowledge that they define trace events.
>
> -- Steve

Thanks for the clarification, Steve.

I'll keep tlb_trace.h for TLB-specific events. If I introduce
tracepoints for other RISC-V subsystems in the future, I'd
prefer separate headers following the <subsystem_name>_trace.h
naming convention.

--=20
Kind regards,
Roman 'Hedin' Storozhenko
