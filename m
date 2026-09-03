Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFCC357CFE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 22:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476318; cv=pass; b=GH4vmA2gn1wD53jxlNrAVwrsH2FM+hmbnpTDAVEshhe1eOR3xZscmgwkCwbQMMEWumSzYbH2EPdj8ghAX7vOeDaMH8OXthkMXuqtB9AruB39+mcrxVM+5sbCMzbJXX7qhRmhkZB8mKxzfENkitGEjfsmoMWNrdRxh3UJfreTIqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476318; c=relaxed/simple;
	bh=Udt8tF9PQ+yaWtM/r1qdypPjIYTzftQh1II2bNtHw+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FvyQHFq7Gt1kCoIl1wfaXJ5Z3l60JQ05Ri0+C+UDHpwSEHNyVZ9O2gYqXhU5K1mNblxkq6h1biDumoFCt+BNuVD/wQpw950TuhlBndpVzfn0z0QOSllpi276CcmE3u5yzbS7409hPlh/iOML2at/ZqaT/EdZG88VNvXZkDVEMn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfmYtY0V; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfmYtY0V"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a6868f18aeso527744a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:58:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788476315; cv=none;
        d=google.com; s=arc-20260327;
        b=LFISXfCsMPSp9+8N9n6VreRJ6Uy/we7X3z0hEWxFbPWsp5cn84vTHxC2xYddn6Rh0X
         Lcme2QQFyEFM7xAFz44Rw+qXMxjNf7bBHsaUB22a/6WebUXD7TdcsHWiogkZqNn7OC8R
         2pl0BcdoKYihk7lI3vt3aG99T667IMGZpcGpuWGQJvaynQJA1U3ST8MPXK2cJ/b5kBsM
         hZb9iw5llcbmf7Y2nftuWW3UzRLbhjo+tBEECfCOGrpM1Y7jxtKKVwf8GDt/Jg1e94Eo
         EYLtYEb6S1lOP+XTzIpl5j9mSYm1ZbzkAWBycGCnG9mx6w5J51Ys6y8A7Lg1C639RbwW
         VJxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F5jtNNir4UNaJAkjh5s2D29poa0W8o8SXRWJxMp3EFk=;
        fh=K5edQ2867gl5IDDew1FkC7vURO9f+1+eM/iwWH1dGIA=;
        b=fRP2WEK/f9sPSt//DUeJroaMs+RX5y4AHuuG9Y867cREE5+Nho6mL6YcV+dP4NRV0l
         g7K6/dhOSUEibSlS++ZInTUO8f5mFEFUApBevJSQ56jfpb7nAx6BYTwHVKR+9diKojNE
         SK3AzGqoAEm+zYNFXa9OznzEIFh50PhMY6yn2XUQjCHKKnYg/Z1LFuxVMo/JGWU1pYf2
         JlDWt/Tw3YmYcvpfft2litSyQ2wJQep4JUVBnQRXqf/hBec/2M/yoirHKkKoOQIKncnM
         eNaSCPVkHELYDWwYUVbXsS7lzFqsn/QN8tDRaLPFBNaOzMoRJoBc643R5vqpLA7WsoyR
         WDlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788476315; x=1789081115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F5jtNNir4UNaJAkjh5s2D29poa0W8o8SXRWJxMp3EFk=;
        b=hfmYtY0VCh9H3768rMxZDyDU+copxDcPC0XFg3uCTvhVWNTCW7RUEzn1/m5msXeCkr
         4WZ15CngMgC4Hr44RJ9GbUuStvSJIj88LrFEA8OvGHELdfNmUGh8t1Tkl3hNIaTNysT5
         JZH1Pk9+cyPE6qpWqPpTKxIKE5+R/VdtpKoa1eM1PmO91Zr7j2TIAxs0V+xEpHRysSWd
         ukZ3/PjpPWbZfUpKdc6/wApX+BUbZx+PuYOR9F8GPYOlzoAz7HJ4Pl4TPVJYd2vr33+h
         HVcz1biMu4eAu2qt/db4cgmTWrdfjock3KrSmDXTQcS8uGhtbS2X1ttdkflB+A4p5tIx
         FvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476315; x=1789081115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F5jtNNir4UNaJAkjh5s2D29poa0W8o8SXRWJxMp3EFk=;
        b=MNKHxjoTsEvqi6FDKNa85UFt5VrXgSff+rbWPmL3eCN6Ev06X1bV6+aGYN/aJTvWsz
         IUcSWLk6pY5/pU5hbPXWyOUiEfPdS0/hL8hMY2GDaLfufo0lrtvhR8ktuR65s4HMNWiy
         2sC01xOqEwPxPDiWXGJkZa0Aeanwd65aJkfMCDSpr1BECaBbtNByt9MBUxENq1T5Qq5W
         tPm2HWsnE7xPtPpm6vpjhajol4PVh0cwYEmoW5f3BFJTdynboOkoSFOpmFZpymqs56Ri
         1HAGR9LMKgFOkQP7wLtFGlPAquIYsjGVP2d2aOHF5nlC1az/yP2DPl99MMEyDxyAj3wZ
         P1tg==
X-Forwarded-Encrypted: i=1; AKwUvBySx77M1bjsJiD3aDpG3F7yh4mRWwnhYtJXlZAUq7Usr/PvOgFE+1XwxD1xqWTe1TN6GrQJLIYkqI63fUA=@vger.kernel.org
X-Gm-Message-State: AFuF++nLIEvP1K+mN0QhRcNRON6rv4UvjJa0W9m+IB7QmUujkA/HxqyL
	M8sco7kdy9r/gBXV34UTmye2NCsqactliJIQT77Dpvox88aJqyI64viGA25vpllMW8h8aKo0rNq
	JVVf64oRFwhzBoOtpMQY4MJ3uurybM1Vd8FmR
X-Gm-Gg: AYBFou0YLhEL1HnKy5srZk8vk4wGt+Y/zRtWGgbYDSK19LrRZWRNlMoPh991Cq2mOSw
	KOUaY9orUa3G4NhweY4gMMOm0ged51FbVafR8cpRxRmxZl4ii4I6CgAzD6USpweqVKd+qFQF7uI
	TIG7+tizvg/O7WkltBkaCs6MgmRmPu+l9sl+UVsO6WAaEaoMpvX3DI2pyDSEI0A/8AmzNDdee3V
	Hlp64wqf9y8dHVNZqAZnNkbuC0YHepBaCU74CP5rNrb1HJY7SMaiLgem4afv6bgyIQK6vfPTJxw
	086bL/uNoPNRLpdt5wTrCUOwGjQsQPzaaly58hByJRrWvHZ509YZur/taPaaUlLrzYVtOGQ519A
	JwCEERs4iMy6CLhirTGxEqedcSasGxYA=
X-Received: by 2002:a05:6402:450a:b0:6a6:32f5:ff40 with SMTP id
 4fb4d7f45d1cf-6a7e8f99b8amr748145a12.20.1788476315331; Thu, 03 Sep 2026
 15:58:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <b71c51ff7ca699ca6e667a55d9ebce58ef092c77.1788277742.git.mattst88@gmail.com>
In-Reply-To: <b71c51ff7ca699ca6e667a55d9ebce58ef092c77.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 4 Sep 2026 00:58:23 +0200
X-Gm-Features: AcwNN1UOei2zgDUxSPJuNJC6Z9fZXmj2Wvlgh4vJndJcYJdyLsVtnIJfNuyE9QQ
Message-ID: <CA+=Fv5Q4iCnvTqLdHAdXA1ahdPLBJ5nZcdWXc3pki=T6P76Mnw@mail.gmail.com>
Subject: Re: [PATCH 24/24] alpha: add TRACE_IRQFLAGS_SUPPORT
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:52=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Instrument the entry/exit assembly to track hardirq state for lockdep.
>
> TRACE_IRQS_OFF is called after SAVE_ALL at each exception/interrupt
> entry point and at syscall entry.  TRACE_IRQS_ON is called at
> restore_all before returning to userspace, where PAL_rti will restore
> the user IPL (re-enabling interrupts).
>
> The function call clobbers caller-saved registers, so the
> TRACE_IRQS_OFF macro reloads $0 and $16-$18 from the pt_regs frame.
> $8 (current_thread_info) is preserved because it is declared as a
> global register variable.
>
> Together with the previously added STACKTRACE_SUPPORT and
> LOCKDEP_SUPPORT, this enables LOCK_DEBUGGING_SUPPORT on Alpha.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>

I think this patch needs to be rebased on top of Alpha GENERIC_ENTRY
v5. Both patches are based on entry.S blob 9f2608de2544 and modify the
same entry and return paths, so they cannot currently be applied in
either order.

With GENERIC_ENTRY, the syscall IRQ-state transitions are already
handled by syscall_enter_from_user_mode_randomize_stack() and
syscall_exit_to_user_mode(). Non-syscall user returns go through
exit_to_user_mode(), which also performs the final hardirqs-on
transition.

The interrupt path already calls raw_local_irq_disable() and updates
the lockdep state in do_entInt(), while kernel-mode PAL returns retain
the Alpha-specific lockdep_on_restore() handling.

Adding TRACE_IRQS_OFF to entSys and TRACE_IRQS_ON to restore_all would
therefore duplicate the generic-entry transitions. I think the patch
should instead be rebased and limited to any entry paths which remain
uncovered after GENERIC_ENTRY v5 is applied.

Keeping these transitions in the generic C entry helpers where
possible would also avoid additional register-save and restore logic
in entry.S.

Regards,
Magnus
