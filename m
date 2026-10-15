Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCBB56511E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085771; cv=pass; b=AyJ1IbkpdV4RKzkEX2Q9gv5DhjunGoMvm3Zfgvtm8pMjXheu2Ma5JizS05GnUOuu4gUGXBsq3MoMW9f0rUYjqMb5gagk1kExvuEuDtXV7wWhq8iiC9WoCpHRXZkKWa2H80NZtBEKaDKAvZT/8o5qczvOH+qFMM4+zVaRK4J9Xis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085771; c=relaxed/simple;
	bh=dm9d8Wo7phCvR235TygduRlnGSKE1I/4rDerIX3YHQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ph4KBFA9pGhT+9vZiA1XCYT3HzbzxPKFTXsmzt4Gqq/45DnrV8O+wd04EcKQpsc9jn91A/3qErD3L/fpB1MVHJZclGY93/SbGN0KpVk75YYCZFnAqyaRqkE5c+LtYbBQtRKbK9/v6khaUaISrGDJBBmF+bCJ1Ep0Dg4mpYM7BMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mo8arRBp; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mo8arRBp"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8ab432273c5so50542347b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:36:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792085760; cv=none;
        d=google.com; s=arc-20260327;
        b=g9FoHHw6kIy6Pcj72MTNb7D5Ukm4boWrT67pEHIajujPudOGPY5QGvr9chGIKa9rJx
         RBHleOoz8zKwMoDWI/LEUi4BHuF7Mp4HX9K8tM40Dp88DiW9i/wbD4QMKWynmxyEfb7o
         iDH8rFyEzVm0HBztBE3xXXaKIPzPHbjjv80kzX6uaHGLj/vx7IAthLZjAsthcBpH2JNn
         7f416YeX24rIqx7tfQK4ddS3HiI2qIntGd5cmMA9PYDml4QA6WRjlBa/MfTdix8Z34EI
         2pAuxFjcyWfts5J0LvOXb3onnjKhGgHvUdPh0P1N8BSgzYCZVoS4wYkQ4nAwwxsGULQV
         0B0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dm9d8Wo7phCvR235TygduRlnGSKE1I/4rDerIX3YHQA=;
        fh=WjHo3BScqE130SkYh+Y+trkmmqinf7gEdOnYuILNJNc=;
        b=oek68pkKhL9y2IhE8Y4znz+pmWAOVVwyFfR8860cnqxrKsDKkbhZnl+cYncT9zwIA6
         cxHfsvQSQ3S1fzSFEbZG6y+eDKJeaY0aNOCCjWSZGxuJ7BvmLt60AYf1ziKDDDppwzvR
         YVTj9THde8bQTVa6oyOGiNwzoioa78Byd/zyF6n2Q0fOMRK+POj7ErE4FmBLzzSmmOvz
         cN0qo9Ju5L/tdl/sUOwj2Kd2OVpHxshAhcRR2ebdmHVinl3ZD1EhdfH2zwa7JMsvr66M
         gWyVEdhATf8xyN0BHGpsGXW/DhVxz1RVRuIKdB1UImfiTwi3EongqrzQOgLwozEAQLYe
         rjjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792085760; x=1792690560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dm9d8Wo7phCvR235TygduRlnGSKE1I/4rDerIX3YHQA=;
        b=mo8arRBp4Jfh8UYILGXLhAkhdCrikPAbVWDzvUQdlrPr9kRMJ+rOlkSQinqRO2b8nL
         +e2KPo6L+7Bai4X08Cuo9O/xYjaGTbxmLN0UWftL//2sniRJOg4ZGE7DEO/7Ho01feEf
         C2omtWjh6qpp3AcY2gJUWgwXcly0Gay26bbA53nAVsz8jetkb/G9CR/IN/Hw8eXiJLFI
         22Dz2/eFy0/BeNakjEv4ZbzYCQgvar7v7rPZDPIbkEp8I49SdH44E11KF1W+cKgpRBS9
         YpBjY7m9svi0Mbd6/JP9lnWAO+vv0GL9ZxbaedyhuuhDTihZjmcZhNWZ2SWJgTy0pgc+
         Oxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085760; x=1792690560;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dm9d8Wo7phCvR235TygduRlnGSKE1I/4rDerIX3YHQA=;
        b=tTPVBtMtFKELjAAxlgzYriOJmpkXGcNNc4o/rjvKVUhBfJE5EZRKcp/pe08T1XWGSj
         nafYFZbr1/ClKGG++awq5H3C+PAE4zglJ+unD6wRQIkFnPdwgJJ6NZflylrpaFd68Tmv
         4wY/P9NP8Etg/z10WU4U0ztvM7vZ2ZWY9RvE2ycCALZOmmywEVeu02b9w0PmTlrwR/3F
         /mr9TY2GRJO0cMYZuGKu39OnVXPdagE0YpbFoGaj5x50vCPc5h3Z+j81rML6gvVmIia7
         cosPLNZpB7qqGi9mRvk8/t6xtQziscz/GzXmxHURmoNKE5d7e4djLdRj+MnLlgBRu+Mk
         /P2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxzI0pbY9+0owsMyifn+Lt2aNlT+N7Ma6GNnZtN7HegvPVz38E4cT3WuArvmqEt54swUDyz3QryL7RFNyg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/orabIlSr3MR8nWYKc8PxzJiCaBXHzkuBoYB6ygthqSAOVUbz
	aLh1F1jfT3cQXKVQNiQVoibMS91HbnFC1yoLvnn88d9Uj+m96kSxhrmGrvASBIAYEjOmARfOyyf
	zWV+GWTvlM4SJUNBTI9lpEtZ/B7XlF90=
X-Gm-Gg: AYBFou0uRc9McNKB4UdLR4j9I2qoOjpMGt/P4BeDaoA000Kjz5UnmXugUrqHkTAvMAN
	yoZeJGFdc1q1l7MFpzMj80jIkgpwVYCYwAxjml/70vE86jeujgb3tSctNDwXmaBJejjQKNeE4nH
	NvB/wcNNbzQnUbBUKKYnWagsO2qq1alxcInwGgPojnEmtVf6iwPUYQ3scv1w7vgeIY9E7Ie42mI
	Kb4md31FfT+UX+/NW+5WgrGlipO00XjIRXmKXd+U0flwtk2zb6Dp2haI9jX6xSD4kzRdMOYbw63
	AMO+lyx8nJKASmd+hYWh2P3eYWLgvGxdLmbRzWoHLQdMcl1FtPA51MI=
X-Received: by 2002:a05:690c:e3cd:b0:8b0:dc4d:941d with SMTP id
 00721157ae682-8b0dc4d98f3mr6640397b3.37.1792085760499; Thu, 15 Oct 2026
 10:36:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830-tlb_tracepoint-v2-1-e3c88c24df5b@gmail.com>
 <ar_Rathmoj2aP-H7@xhacker> <CALsPMBOYQbro2gZTQR=DSUowmVDs9kujH4ua2UzCoHAQrncuiw@mail.gmail.com>
 <asm95GdbmMpc81p3@xhacker> <CALsPMBPMHc7q-YZvqLLYDSr5RfLmDRwBSq-TFeB8Fc8bPBjQGg@mail.gmail.com>
 <as8NpaT0g9Tsl6PS@xhacker> <CALsPMBOdy4ZDWfnkYokUFuB3UYPV27wTUpBCZaxLWEV10ZuS=A@mail.gmail.com>
 <atAROTefufggiFPO@xhacker> <atBWGQ2iWpm2VKcY@xhacker> <CALsPMBPNKsnSAczyVm3LFFQjwRg8eiGgpB2hJN19iipRZ0mASA@mail.gmail.com>
In-Reply-To: <CALsPMBPNKsnSAczyVm3LFFQjwRg8eiGgpB2hJN19iipRZ0mASA@mail.gmail.com>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Thu, 15 Oct 2026 19:35:49 +0200
X-Gm-Features: AclHuK-wBT1gio8L_jkhM1aKzScEpjwEXurLQrG7VqNt3Zx9orkwjzcjHQwTcig
Message-ID: <CALsPMBOfqDuCqCdODvJc05CFVda5pMsixOOTXyvjyDO2=DnWYw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: mm: Trace TLB flush path selection
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 7:08=E2=80=AFPM Roman Storozhenko
<romeusmeister@gmail.com> wrote:
>
> On Thu, Oct 15, 2026 at 6:47=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org=
> wrote:
> >
> > On Thu, Oct 15, 2026 at 07:33:13AM +0800, Jisheng Zhang wrote:
> > > On Wed, Oct 14, 2026 at 05:58:42PM +0200, Roman Storozhenko wrote:
> > > I think you misunderstood something. A riscv platform uses either
> > > SBI RFENCE or IPI for tlb shootdown, and won't change. So you can
> > > know whether the system is SBI RFENCE powered or IPI powered by
> > > cat /proc/interrupts. It's much simpler.
> >
> > Aha, I missed aclint sswi case, if sswi, no explict /proc/interrupts
> > difference between sswi and traditonal plic. However, whether TLB is
> > powered by SBI RFENCE or IPI can still be known by checking
> > "providing IPIs using SBI IPI extension" in dmesg.
>
> Thanks, I see your point now.
>
> I was treating SBI RFENCE vs the Linux cross-CPU path as part of the
> per-request selection, but with the current implementation
> riscv_sbi_for_rfence is effectively a system-wide choice established
> during initialization.
>
> I reworked the patch in v3 based on your feedback. The tracepoint no
> longer reports the local/SBI RFENCE/cross-CPU implementation path.
> Instead, it describes the semantic TLB invalidation request itself,
> including the range, stride, ASID, target CPU mask and request scope.
>
> I still think there is value in exposing this information as one
> semantic event. The individual pieces can be reconstructed with dynamic
> tracing, but having them together makes it straightforward to analyze
> the distribution and characteristics of TLB invalidations across a
> workload without depending on the current implementation details.
>
> The v3 patch is here:
>
> https://lore.kernel.org/all/20261015-tlb_tracepoint-v3-1-eef305a3bb63@gma=
il.com/
>
> Thanks for pointing out the distinction. It helped simplify the event
> and make its abstraction clearer.

And quick v4, where I removed unnecessary cleaning for checkpatch:
https://lore.kernel.org/all/20261015-tlb_tracepoint-v4-1-f238a2bd8f7e@gmail=
.com/

>
> --
> Kind regards,
> Roman 'Hedin' Storozhenko



--=20
Kind regards,
Roman 'Hedin' Storozhenko
