Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5913A48E4
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788099577; cv=pass; b=fa3qp0bFV3tF+n5spy3jR0k84W396I0dGvRNNE65wuRrzYgeFkzDDo3j57UAr+rEeDxzmhfXYmbohvAjbqow0cyLZD9cuOAlt9KWHmeRshVAVE8oDU7PjKZOwcoBSAzRVvSvXC/0Jxh7EC7Y0gpHgKOy77toqMtgdCMGLOa67pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788099577; c=relaxed/simple;
	bh=ucHaSmmK3HDJRBDMZKovNeMryNnaSYvBg6uxiM9ku9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=euVwZtoCel/2auMylnN/1/QiMH03k9cPhILelnjLH60CIIu3faHuGxsdQ4Pqh5xBZTEzBb/OWxNU/h8laXh7BlilzaZnevfJ+5a9HGVSMTC+si0PRF0A5pldl3yUfeolYe8ZOwWJBiTQtcehf0YomItOhLHjWG2sBvYSXN5QhMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bozai+pb; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bozai+pb"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66c7e3a2332so2422836d50.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:19:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788099563; cv=none;
        d=google.com; s=arc-20260327;
        b=kFNTSCiqA43Q979mnNHQLlzPLhqbWNoruURGby4mljuAZM+uHk3Dr4gd25UGiVQbaT
         s/CQ7Yjg1/jesLjr6Zy6Oz45YNmOgIDOK2HK8fetBDRWPKARvIdGH9JvjM6oZ7VxphSj
         7tCJR/llc/L/RnBacCAVe9kpr1WZqouRkf9cFQjDmRsAziM0mLDiN0uJY7FD2VrCeTUF
         V9gHbpwKEWQACgOTNH6P+ss3UtU9qSILWEYRJLMVIP4c4hBkP10s/iKhsZ/C9IY+1Vup
         baDYAjSIPFFa5CUdtfopYymDhZ1Ggw68iHMl/9SyBldqfstOBoOpjFz7vUwDpTLAs82i
         Kb1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/BVr42MRUVRldWx4XHVEPdrXKSjB9vqpAshQuqAdcyg=;
        fh=TQ3wKsOrJyjBLnrlDWEiqBkLi16zuqnacLz3KOUfwyI=;
        b=fbaTj0UDJ9gIE7tetitzYgrxbxmLBSb6bfEWDQ8qYHLA/FsvlZ5eWhamkJ8Z+AP9Ar
         7pi+3Pc3eHm6FYIW0XTq20rYTslId8mYXPJaB+hG5VpkweNb2LZwyeA9TE0KfXqhNVMl
         TH91NKVDUcXVu9XWoG2Z4z7v2B494KtEBYk5309froQvQjh/UXsEROqH1g9qvXd6Mdt8
         qKmiKH1HWgZ1CGXstkXnKSjmqddM4vWxpPB0sAN/apVrfShAAYpcq5b80tPuQJWesPSu
         Bv2h88ie2WQblH60UFQj0lIGPbJH5ks95K3yI9RIgfh+Jnl2SMFctpGa9sAOKZqL6u3y
         EFkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788099563; x=1788704363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/BVr42MRUVRldWx4XHVEPdrXKSjB9vqpAshQuqAdcyg=;
        b=bozai+pbXtXPXJN59yfTjO3bk2GR4URfD+2FP/ciwhmpKEobjra/zeP7bFrbwxeaw0
         6VlFJyfFObreyjNd0ibkE8O+WbweDRcyuNmZjQ567ZSkO8Wq1wwolUm5YEAFdmkCs8OM
         2vZNS4SzdGStZhADJupMsScnenzxf29l9CReRced9eAsJlq6Ez8ij0h8ZeLy7voh7HOv
         KwSs50Mvyy4b6t9qQ39R3CvIQXKTGkVmp7oZGmPPZnm8ASm5yaMt+VnnxVD+EAGyhgPC
         iWSeydYuFGpoOzPosVjWUK6T0j6Bqna2X3dImuGNaXfCwLQ9N895hjmHV8x+upbss+CQ
         MRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788099563; x=1788704363;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BVr42MRUVRldWx4XHVEPdrXKSjB9vqpAshQuqAdcyg=;
        b=sv2WuEdGJT73cZr2N9CnaBaa3RIivURFyFSkwpxZs4D0FJ912cKoJF4yvTOdZZsYIX
         wusWl/lSjM6IkyaPgvFxvPNeqpCn6qaadLtr0AAjVdIPadjQP0wnbf+ht3IY3VQMgKH6
         vfXd/zvC5u+C85zbAztTAFALeQRzUVXFqADZMhReEYjLtBznU3p+MAq5ANr9P7KMyOAo
         hc06pZXBH6TsdfESLNpi+BfcE3FPJ6MnQxaMNxo4jzlrmvaKO05txN1+ORmPjj+smCon
         lWrzM7kDSemTF+DNSVpGqJIqRXG/4S2PF2WvSm0bLtWPAiHyA19OH5DU99VVEwXyQZE/
         35Ow==
X-Forwarded-Encrypted: i=1; AKwUvBwtbHQ8AHNSFGLS7BIkthk6ve72Dt9L2ByAfc7St9CCC9LGuEP6i4Qs81D1NvPIiG8PCqf4os05YFsFGJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++lnMw8bIpyfXRbc5dkKu3KiythDDdoqSBQRWHFITsQ/aDvOFvyG
	dt7e3steGXBA0pvmYO+He4aT4j679dQH8BWkcEadE51oO+IfBOweLN6+ySqnZH4VBrCbiYRGHan
	PNiHuOwN1RRaA/ua8bMABsxyzbNkvqFQ=
X-Gm-Gg: AYBFou3tQvDdR4f3x/Q1YzTXitRF0h3hCh6+JZh/qmXRC88ZVrJiGsDNWhMnamHEIPS
	9Qd8JtPtknM313PT7v++C1OuGpkp3HLSJdYOpW3gRKF/xVVXMLDt7AbwMh8QRrjt0Dy7+CUp7X0
	AjroIN3JUKS5xkVCStZhFeMdjOyu6fCiLINObh1LPVor6KQj0WPuQEaanPFK6HoRwW4pqAQbsxr
	oDLIfuHumf39ZI9/ZiRIwS0tJIcMm9G/Dp4oWGfcHhTgFSWWUw6hleksrsJfE8uLOnMSa9T3b4R
	wYopcUPfpEfKKdi2WvT7NPm/mEFeT7QDOqmOQkeOaK9P
X-Received: by 2002:a05:690c:e0d1:20b0:81e:ae6d:caed with SMTP id
 00721157ae682-85d6cbd5517mr53744887b3.34.1788099563185; Sun, 30 Aug 2026
 07:19:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829-tlb_tracepoint-v1-1-dfdaede7e741@gmail.com> <20260829212202.57db49ca@robin>
In-Reply-To: <20260829212202.57db49ca@robin>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Sun, 30 Aug 2026 16:19:11 +0200
X-Gm-Features: AcwNN1WNdWcyYR1PyOdxtYXwKqRQnAQhNWg1LwpDWL57H9UOvMPUEn5qfIfVDMw
Message-ID: <CALsPMBMHSMLnOzO+a3gOMzD6x-+8-8fr61MOr3GVH9_LoY_dQA@mail.gmail.com>
Subject: Re: [PATCH] riscv: mm: Trace TLB flush path selection
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 3:22=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Sat, 29 Aug 2026 17:44:18 +0200
> Roman 'Hedin' Storozhenko <romeusmeister@gmail.com> wrote:
>
> > +static __always_inline void
> > +riscv_tlb_trace_flush_path(const struct cpumask *cmask, unsigned long =
start,
> > +                        unsigned long size, unsigned long stride,
> > +                        unsigned long asid, bool has_mm,
> > +                        enum riscv_tlb_flush_path path)
> > +{
> > +     enum riscv_tlb_flush_scope scope;
> > +
> > +     if (!trace_riscv_tlb_flush_path_enabled())
> > +             return;
> > +
> > +     scope =3D riscv_tlb_get_flush_scope(size, stride, has_mm);
> > +     trace_riscv_tlb_flush_path(start, size, stride, asid, has_mm, cma=
sk,
> > +                                scope, path);
>
> instead of using two static calls you can use the new:
>
>    trace_call__riscv_tlb_flush_path()
>
> That is to be used instead of the trace_<event>() if it's behind a
> trace_<event>_enabled() check. That is because the
> trace_call__<event>() will always trigger the trace event logic because
> it should only be called when the trace event was enabled.
>

Thanks, Steve. Makes sense. I'll use
trace_call__riscv_tlb_flush_path() after the existing enabled check in
v2.

> -- Steve
>
>
> > +}
> > +



--=20
Kind regards,
Roman Storozhenko
