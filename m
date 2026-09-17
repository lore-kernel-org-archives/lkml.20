Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8CC4ED1B0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664632; cv=pass; b=Jk82YmxP5Cy1iqtp6I9MVW5RjoJjk08WkU1WaU90nmfwktrvWrEKc13y1YneUJ33OUV8P8saQwPg6VqSPimBrsFqGq9zJmaW731Ii0yZCQI+oYnxR8Gp6m9zsiEamV72PmupwEeo9IgcV398x1t/6aRKxBL8V16DGfD1Y9pqLwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664632; c=relaxed/simple;
	bh=dWqrfywKjEtr5wtVAxc0WKSejhs/grxWyCMDV7MugWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xu37rGIoyeZfkZKV1yvCKeNAh6MwusNtGNx+ozkba2qvEq+/x/KfjupdzDKVMharMjSSJ2oK+EQRK+C28roju6+F/P5itr2PyrIcfpDSKHBTWkBtXU1ttOCL9iQg5TmR+v9r+haWnBPvtitve1RR063zPAVNMtBU1q/7mSv2pe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b=AEQcnPwo; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b="AEQcnPwo"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a30521edd8so3628931fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:03:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789664628; cv=none;
        d=google.com; s=arc-20260327;
        b=UCzUBMK4sBZRFIzCDDAf0FSuiV/h/EhYZlhUwml/GmMHdNOv7EVAwUM73PO4FwBuyp
         N/6yvutG4cK09eIJyzKjRswlmSH4S1SuCzSP/fNoXfclhm5AdteX575whf7EBQADa8KN
         h/HGpiY5JbdDufSGAAyHuaV9xIAiRZUXEPEgWAVxymHKHK9Yutdp82NEgyBfSIPYpfbH
         QS+DqlMxhvqF3AzIj5n1VC8x0vN1hZrZcsaxOhXwR2JnX55KNRocNMBDQ7FRjZCjlI2H
         sFq8ELy0mjS5QovypYTieI62UxNb0k0hQnrq+lM85r1azU3vcPCAPvJ/jcOCDhWF7hpj
         dtDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HzeMyhC6Hs8/MFNRkyNR3mA2RoNAqfMyU39GFmQO9Xo=;
        fh=Nk1UmqFFWeqrjmWa25aaz672Vkm/xf559PgZGqJVlkA=;
        b=PXy1sEIheWfaSY5HOKbrvr5hSadQ/xvJaB4tVOLsXxxZZJzWIc+2UQtajK0aJoBJJl
         nd6wW2seMh3/meQ2Gb+txzDsrZtWbWCo1uQsoTQsCKBPp+a/r4Sev7LhXVb3euBCWSr+
         LlbG1xm1NfQuKNskMJiE5sWpTdAypmQ5DDXGvPuvZAqewJSEpXFQo/Q+Rh+XaZ7ZG9YT
         L97qRVJmLeBE4QlU6+nf1idFf871q+DcbDz58Clhkaqb5suWfttylQXbA02SRUHIV+aK
         i5IjRYD1fLt6j9qySajSi9EoDFPh7NSBetNiQbz593yua9Mqubmvqb05iWT7AxDJ8N+C
         D7iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20251104.gappssmtp.com; s=20251104; t=1789664628; x=1790269428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HzeMyhC6Hs8/MFNRkyNR3mA2RoNAqfMyU39GFmQO9Xo=;
        b=AEQcnPwoyXxDxi2G8HTMRz15+ecoMBo5bPl7J5kGmkKH9WfbT/LeHTAUBaptEqfNZI
         3Ms/Veu1OHZhbSQLHqnPoVtcLq7cmGp8H24HP7/zwWbI+1ZglS5gfgkEAg0R8cWEb+wz
         L2SWReCxRPh4U0Umk5XPEIBJDpCfDnEIBf+FymifgNEI5tD2/wWNHHIzM5ThWBZZOiTA
         Ve68G0CmbyHZxDBhMEl5UA09CBE4QCSyLbo6aQnQzR0WWnVzY5LREuNFAHXiwXFkLJwl
         +kT1uEinEXc+M+g95MQyLXJ1RQDHLJ/Adl4ej1K5Z01vB03TxXBnkdbJGF+LJJ/ltAoW
         wnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664628; x=1790269428;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzeMyhC6Hs8/MFNRkyNR3mA2RoNAqfMyU39GFmQO9Xo=;
        b=wuRM5cyAAnScn6/aMj6kEl4H3LfGHkZ3a6hvURzDF0u99z9acilo2MesXa9F0f0UO7
         5brJfefl1+T6WDYFjFUN0C+kC1P8MxsyD74ZwQ6IEeQIAc1FpLwGxjAeL4Q/MovHEwGh
         HiY7pnPnVSiyavGGjuTkeEgyiyzqilg4ynGWhMEuF2qHd6VVPnph2LLzZSMWk+BeR6UD
         RfD3g034MlKQ9VAmMa9aUFKmdR436l47YKZ1L21UrTvNRQ9zfUx9qZLP8LLfRlWRsB5h
         ytQVcBUT6A1jzVTwn9hf1Vbp6e/1c6f2xbPprubL6B12pNufpCmqHp2r3eJGlGmHz1nO
         OqVA==
X-Forwarded-Encrypted: i=1; AKwUvBzMtAf3YVJ4PaLVN5dB5ORVB6deSSi06QpvSISuFVmKs3NFY59+OMTC0pdumtzH2BK6OyVj0W7HYMhn7i8=@vger.kernel.org
X-Gm-Message-State: AFuF++muYNBR88Q2leHqHAIaejjGuTfaKd7wLW2hRwSQK1l3VTmD9yHm
	AlvRPTkIwvxwBhnexBgc3+l7wqzxaEo0oNYDi/nMJx1A/K3ebCuyHn9Vfo3KdcSqGynFXAfVeBx
	QsuLPPlDMaLQ1xFpntNCkggPejl/6y11bqE1QYbAi
X-Gm-Gg: AYBFou3ah+FAjNMeve2+MhkwvbcjJaoRA7nMwZ/6wI2seylz5WvrHPbLM4rsAiSoPUD
	iZsEDqj8tZcdMuvsvBkWK6rd5Lj+S9auKQNHktO+G4Hs2E9z8yWlpXJmyRSkDrl9KqTmNA2MTEK
	G79PxvdNDX8jWECSrLVgUUjf+ZrpPEgpCH2KRSbUBdrpQTDdy62TJJ4T1sI1kjqHcVIxFhi8Xde
	D1T/eMZX6reYv6gKbD8GdRzJm5eECW/HTFitH3WGhkA/Z+icn60eKupuwvuv6I/AQPt1zTyA50E
	ZCC8iTghX1LQGVylT9mWTm7TLi4zt8y7zy3AAsGfGmzt7egX91DWgpDPMwsZomAk
X-Received: by 2002:a05:6512:2205:b0:5b6:10bc:b86b with SMTP id
 2adb3069b0e04-5b8ba70ed39mr1313029e87.25.1789664628461; Thu, 17 Sep 2026
 10:03:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913193815.2862366-1-mikko.rantalainen@peda.net>
 <aqcmz5uI7PgN5CT7@casper.infradead.org> <20260913235145.GY25906@brightrain.aerifal.cx>
 <eeb50cae-87af-4a40-b9c6-f4fa9981425e@peda.net> <CALCETrUgLj4Dz0s6PMofViJwausRWCvNvJphxWHUeWCCaRBtQg@mail.gmail.com>
 <f61886ed-3026-4db7-ae22-b882264141bd@peda.net>
In-Reply-To: <f61886ed-3026-4db7-ae22-b882264141bd@peda.net>
From: Andy Lutomirski <luto@amacapital.net>
Date: Thu, 17 Sep 2026 10:03:36 -0700
X-Gm-Features: AcwNN1Weixzr00PWb42k0GJpV9JCtwN__AI5EcYFAoTJRpSFfr7ruhHRECy9F1k
Message-ID: <CALCETrVnE2unnjHokG=bGLEXAeC0U8QRx_wb8fQDh-Fe5O6PBg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] close(): stop exposing non-retryable EINTR
To: Mikko Rantalainen <mikko.rantalainen@peda.net>
Cc: Rich Felker <dalias@libc.org>, Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, brauner@kernel.org, 
	viro@zeniv.linux.org.uk, jack@suse.cz, alx@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 3:37=E2=80=AFAM Mikko Rantalainen
<mikko.rantalainen@peda.net> wrote:
>
> On 9/17/26 02:16, Andy Lutomirski wrote:
> > On Mon, Sep 14, 2026 at 2:44=E2=80=AFAM Mikko Rantalainen
> > <mikko.rantalainen@peda.net> wrote:
> >
> >> NFS and devices make the question more interesting, though. Some
> >> implementations put meaningful state transitions into their close path=
.
> >> Tape devices are an obvious historical example: depending on the
> >> device/mode, close may write filemarks, flush tape buffers, rewind, et=
c.
> >> Those operations are not necessarily replaceable by fsync() before
> >> close().
> >
> > I realize this would be complex and maybe a can of worms, but maybe we
> > should have a new improved syscall here.  close() is indeed deeply
> > problematic.
> >
> > On the one hand, we have the actual task of closing an fd in the sense
> > of removing it from the table.  This should really be doable without
> > blocking or without side effects (except possibly for zapping
> > old-style POSIX locks -- it doesn't really make sense to be able to
> > close all fds to a file while still keeping it locked, especially
> > since we report the pid of the lock-holding process).
> >
> > On the other hand, close has actual *meaningful* effects, many of
> > which you've mentioned in your email.  IMO it would be really nice to
> > be able to explicitly *do* those effects separately from closing the
> > fd, maybe even asynchronously via io_uring.
> >
> > Would it be so bad to have a new operation to do (possibly with
> > moderately fine control) the close work and another one to just
> > release fd- and process-associated locks and drop the fd?
>
> I think introducing yet another syscall would be bad replacement
> for the *inability to decide the exact semantics* we want to use for
> the current syscalls, especially close().
>
> It's pretty clear that close() is poorly defined right now. The only
> thing that we know for sure is that it releases the file descriptor
> and in case of Linux, this happens for sure unless EBADF is returned.

I think I mostly agree with your analysis except that I really don't
like the ENOSPC.  The kernel actually has the ability to commit to
having space for pending writes on an fd *without syncing*, then I
think that capability should be expose to userspace.  fsync is a
pretty poor alternative for code that just wants to make sure that, in
the absence of a bug, crash or physical failure, the data won't be
lost.
