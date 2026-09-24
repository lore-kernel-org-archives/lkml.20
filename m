Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D188D41D22D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278167; cv=pass; b=Yy7w+KMOh+e8EIfvLWtKOZEEIsSrEqgXIET96wNPYgmjatfPLokqQYoAIa0HTlBy8oX3xi6+K+JbbHroKL8r6g97MWkUj9aOLLOXvuzYC9dCTnz4SSdoH5nc6JKjwVxnivpsarMV6huDDhe3KC4taaesADFhpbix2CkGyEIceQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278167; c=relaxed/simple;
	bh=hs8xkC5GbX7rsGvvU+YLWtE+aWJsVOhaQkQD9okCwTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fo2XLOzellfD/eDv9LiDwUjHC0I0ttBvhJvUFSN0qKWjjsc+j+Btr3zYp7KbLn17RMdCCayCfM6gQ87kaMaeJWbSxxf36ACamwxbW6pd0Da2eLOyFRQeuc2IkcbI3REQs5rz1UZ6+/F1mTxDu8DDzaK5a+o+CeibZm12dhBUBSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q1x+Hg8O; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q1x+Hg8O"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so1080095e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790278161; cv=none;
        d=google.com; s=arc-20260327;
        b=oXmngh7JMIv+ltvzfJeHO7A+3cHwnKjKCPWKrogIZSHzFGmNiDBBjSVxACLVFZv+lq
         ZsVwoMMEQ5Ux/XFaYmHx9cKbukWvbAa+b1CeTkkna9uDjrqRrAvlA6MOt0zLTQO00Vc/
         qw9mHAdnzcusH+TjStYRMFy+dTLjcTrLufvCp2/Re59MmR0q1vh3EXdVcySnXAiPYdQt
         3MacTLwjTCBYwQ0oizvsHyw76pnpt/thB9Ehh/EvHCma5S1OJk3JXCK0iyeMtYH98Wfr
         OlvnkS020EtAOMBFp8pEg03x8UqCAYQ+jIvgNg4FSIN9TJYJxmX+RK+sdj8a5MTge+Fw
         Qpkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3tFMJWi5Gov9zmBh5Mcq+CM3NAFp23VSw1Y5x8fDtYE=;
        fh=qCjz5j+2kEiujIxj8N9h94WLiBk5qDGjsrK8J0AojkY=;
        b=bvM4+VxJ/Y2YluidCDUOP4BMLq6jHceqlreYp7v4/EQIcjd+tPOLMt3yoO8NNm49c3
         1FqgkfgaBA94S8xRJ+p6dbattRA9DQgNY20xsbFbDITYkFT7ab4QFqjTgwUou5YwB008
         H5xUlbzVukBJXotfAhtt2TwwrofO/SD0ekE24PmWCZ+hArliZr86eWchQ6v37qQf3mPs
         73kJB+cDdz8BlyA4oZtMqEYsbXUwEAUQkHaqVj6bg3E46ebWFM5tdUyb40uyJKLyB/x6
         x/2shIA6uDgbABIKqHGf9G89ACYYlB5YzdGZ6oWFnTrFsxLuaU5zycb0MKIXs157oBD3
         jHlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790278161; x=1790882961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3tFMJWi5Gov9zmBh5Mcq+CM3NAFp23VSw1Y5x8fDtYE=;
        b=Q1x+Hg8OzOFWwoNRCb2TlwL9o8v7fuT17fOHjLIiF+j1Oqcd25bzysoKlBOkDOu8BM
         bN8O7LnW0F/lr1ke/yCSgcx7vj7XRi5XcdWtjgMOiTJxRXEjiD9/19Z5+PNRn9PDDemo
         8ViSRVLss0ctKIegn2nhcmWyeZ+6g94Ro8FInOXrAxoT1JHf/G7V/4FMxq2DbgWdzzBz
         s+823vbiCwsrmR43/2v79BadL6iNlCjxZ4vJPjzmListSVl5NWJUAcHoFEaOPlR5mx8y
         /0Sprh3UEA9t1VB/jz0VKKx3/Ums4WJXaY1hDrAjqMfoYWd/p3l7cEkAhcjLs1lvkw+W
         3dvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278161; x=1790882961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tFMJWi5Gov9zmBh5Mcq+CM3NAFp23VSw1Y5x8fDtYE=;
        b=VSs5cC+fEUrSxn+h43IQdWkO6dr7hsuMUNlAtADlDZieGTCb2bFoXrIfJwauKRoQuw
         /hn6DFVXlv+3F+vLlW0qjqWMfuaSVyWzDwlHUi5IQwWhoS62za/qXi4UODPMC2p70uLz
         iByu9MLKKgGki/lgtrdKDnSGXmWhz027vrmICbW1q+1qSxmdDqoTIJIc4PcD0dw5iXP3
         +lS0hgku/OEUdN2o1EKJAtLrY9+f/du+VFZSTeSLV6KfVW8DdSlh8nxckAMExYbCwMau
         Njd4As0U4FMT4avyCMFLU7WSvPumWrVeboBOjABOq2PtzvK0++j8sg8wbvUO/emOrvab
         06Ng==
X-Forwarded-Encrypted: i=1; AKwUvBzg7ND2MrhOKsuV7+RtUTDmMGCzs6FntqaWyMocp6bFLEYUOxO3RoR6D4BH+CtNtmYWc3xoiNRR/vOYs20=@vger.kernel.org
X-Gm-Message-State: AFuF++kl6bgk0eo5zqZOltxDA2uelfmnRs7yicnK2oiSY3sizwt7dLi0
	qkTyum+ZZvbhkRYQvAN6gPunH6auPUjVNCfOS7c83ivFks501NO8F1+L5R68aoilzLWSpQyFtS9
	yREIxqmB78ji2r0ne/TUPLtt9Ed5DVhlLJdlsO9A=
X-Gm-Gg: AYBFou0eoMX8SF0c49SiFriIttFprKPC2NE7qn2+8v/aUcSiNs8PRKPbraeZ+kF3rx+
	K5KeTFQDPvGsueXbwdP0vYfedXXjdVIVZCOJlndrmPpBTHpClXQE24PNinxXPAp/9ileS5wMkry
	Qsfk4oITwmlqdkR7va+DpOi16RhHkfD1+4Mj2sLSLISLyALLs6xjTBX1Nl+RT7Rc5QYpIComxwB
	S23yQrLlUYnyw+iVMJP7uC3YKJ7tiwTaGZanZYYrSsv9NmWUu2L42Ri/h0UoRs00+PWVBROcGsa
	rCZM1PTzBwAVeXanVb2c9a/3nVBU0/NDgotJG/xA3gfa28x/LV7OXGy8xfdjZxDPv2Vn0S/G0q0
	5w+i3SIzHnBtKaykNSO5zf/Gkwkm6bciu/Zj993aUOfIH2AG5V6RMMzENubcvngS9Mfty84HTAG
	5+HOPpgA==
X-Received: by 2002:a05:600c:8b6e:b0:499:8aff:59b6 with SMTP id
 5b1f17b1804b1-49fe66cccf5mr56226295e9.14.1790278160828; Thu, 24 Sep 2026
 12:29:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917015237.2462954-1-eva.kurchatova@virtuozzo.com> <20260917015237.2462954-2-eva.kurchatova@virtuozzo.com>
In-Reply-To: <20260917015237.2462954-2-eva.kurchatova@virtuozzo.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 24 Sep 2026 12:29:09 -0700
X-Gm-Features: AclHuK9RBM64cKOlW-Jc_KVmdxW2OpdFgUbUbv4kqC_qBroNbvhQU6m6eETAxxs
Message-ID: <CANDhNCrBS+RRkHNLX9q+g8bceYyfeRmF9LjSN-M4yp=aoH-fQQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] selftests: timers: measure the CPU timers on the
 clock they count
To: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 6:52=E2=80=AFPM Eva Kurchatova
<eva.kurchatova@virtuozzo.com> wrote:
>
> Commit b00385b8d081 ("selftests/posix_timers: Use CLOCK_THREAD_CPUTIME_ID
> for ITIMER_PROF measurements") gave ITIMER_PROF the clock it counts, as
> measuring a CPU timer against the wall says nothing on a machine where
> the task does not have a CPU to itself. The other CPU timers are still
> measured against CLOCK_REALTIME and fail the same way. With four busy
> loops on the two CPUs of a test machine:
>
>   not ok 2 ITIMER_VIRTUAL
>   not ok 5 timer_create() per CLOCK_THREAD_CPUTIME_ID
>   not ok 6 timer_create() per CLOCK_PROCESS_CPUTIME_ID
>
> ITIMER_VIRTUAL counts the time the task spends in userspace, so take
> CLOCK_THREAD_CPUTIME_ID for it as well; the loop it runs stays in
> userspace, so what that clock adds for system time is far inside the
> half a second the check allows. check_timer_create() arms its timer on
> the clock it is given, so measure on that one.
>
> The test then passes whole on that machine, 19 of 19, busy or idle.
>
> Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>

Looks reasonable to me.

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
