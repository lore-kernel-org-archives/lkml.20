Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778690;
	b=SAdWngX+SAxCkTbRUdiUL2J1ZiZenv3RO1MrGzD6TjoJoeWWPiPhGed4rv5B3z+IhRh5
	 FGc6ek9hmOVTkkpiGZsNYrpGOQMGnoqmOeMhfXaVg1D3qKYS2C7Xyw7EOx1ncOsTwQQ6I
	 ABCUnDmBP69hjQkB1OblaR15RNZGNZ7w4fhU9Sqte/1ZrxDxu0AhiWBc++Wome1lwgnrQ
	 uemKByr63h3/srP2IEnmhRL3fFYrH9zOcLOQYpaEXAIFPNDqrFrwGm6wIXJiluTKPjuLj
	 D0UCNFBO9J7l6l2xL3/EfkXbAnSG6pUXlv7b6B1DPr3omAGgWtl4bofOaFI+Go/32eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778690;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ChdNpfFMmfSeiMhhgq9rOjsI8hm4xzlZkNy7PE+mUqw=;
	b=0SQOAyiJY5h38jHEj77YKoDow58Ff29hlhQVOOgnYpwcTPeu+NiY9i+0xep4A/8zLPnF
	 Hp15rfX5lAuUJHUJcergTxiJrqjq/lWmGmpNkO8dgrXj55Uqr88lSFg85qegZhlJ18Sir
	 vsNoFS/OxGTr5gWA/tRFxAqb+nQXQJaXmhzf2zZLgAIZk7Hk/bFVMsm/I+Vu4KTQ+dtSx
	 +VqBecHYDI2HT1L+DtTXF72X/ja+SaW/HDv31xtbYEb6GgpAJ4tw51lxOUouq2TEH3thj
	 55KwZRppBHKrQpjYuBgQYWOcvCLWVTpL+IJTrrKuEAzHAhNFVDC+XfH66+Zs81hQoJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oOq9mBSo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74CB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oOq9mBSo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651C81F031E0
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792778689;
	bh=ChdNpfFMmfSeiMhhgq9rOjsI8hm4xzlZkNy7PE+mUqw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oOq9mBSogEELRUXKdb8J6x2Fr8brsYoQrFkTwYC+3qVOEkdIyhvQAHtMITZGVv7ED
	 d73ZmMMU7knCNrQUmetRG/hD3VAqZXnslhaEOh9RxbNigf0z85T9nl+uDy0UzJ1Pa8
	 wAWPKvDVXxqu3cmswLZjhyGIpaYhVah3ouCz1Sp3WJ8hm9NXQ8gb1dGiDDOVC5k0sz
	 EfEwsNmgjT+MpKCzfLeM1E7toi3SS0qQeRxeSkN7SyoEOLXKphSLJLW6rqKslIxza0
	 kXaUTZdMX/srHRKT683vhGm2HEaqf9FnbFIBSM/ErxHzm2CMHahNxl/TmSk8rhgWoV
	 ULhoF2gbX+v8Q==
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f3c89594cso78349385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:04:49 -0700 (PDT)
X-Gm-Message-State: AFq9FYL9hE+2w20ipdbnA9jYOb8ieTMbBuDSlX98iJe7pcEU3xMBlQWe
	2hl9LkKiRT3IsZLpqsOyasszlWGPber2pfOzVdOiIRYcYNMfvx87PVwzlzP/Bw4FnXVwkyp0bea
	VzXa74xlApZngMj9TscKr9P2r+nJzPkU=
X-Received: by 2002:a05:620a:1793:b0:936:df48:d507 with SMTP id
 af79cd13be357-93f6f91b90bmr544428885a.18.1792778688699; Fri, 23 Oct 2026
 11:04:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023011049.1164625-1-song@kernel.org> <20261023011049.1164625-8-song@kernel.org>
 <20261023093256.20d3e300@gandalf.local.home>
In-Reply-To: <20261023093256.20d3e300@gandalf.local.home>
From: Song Liu <song@kernel.org>
Date: Fri, 23 Oct 2026 11:04:33 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7wgXmQ7QKf06z1kiR+-5VbbrZx8ByLPCUXZtw2-SAHsQ@mail.gmail.com>
X-Gm-Features: AclHuK_J5P47a14LkpdtNyyppX1AvylBaLgmpgm_44519CpkozMkFuPGPPAAYzg
Message-ID: <CAPhsuW7wgXmQ7QKf06z1kiR+-5VbbrZx8ByLPCUXZtw2-SAHsQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] tracepoint: Mark __do_trace_##name() notrace
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 6:33=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Thu, 22 Oct 2026 18:10:40 -0700
> Song Liu <song@kernel.org> wrote:
>
> > __do_trace_##name() takes the tracepoint SRCU read lock and calls the
> > probes. It is called from trace_##name(), trace_call__##name(), and the
> > notrace rust_do_trace_##name(). It is a plain inline function, so if
> > the compiler emits it out of line, that copy is untraced only because
> > inline implies notrace.
> >
> > Mark it notrace explicitly. No functional change.
> >
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Song Liu <song@kernel.org>
>
> Acked-by: Steven Rostedt <rostedt@goodmis.org>
>
> -- Steve

Thanks Steven!

How should we proceed from here? Will you take this via the trace tree?

Song
