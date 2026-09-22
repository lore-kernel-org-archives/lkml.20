Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4195C47CA96
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790103038; cv=none; b=GrwUbvyyy4ibtJ20tMQraPj8eGTt3t5xKdDAKpjqQSU6Cmluc/u+HIVM4auJaqs0K8pEEsDBIMsju+XGFkNe0pXUSvLt/wfTsTaBpDBbHgPMFo/TmOEg51Fp5K72B4SpKPpfFiGJm/YoOj5yc71IlujYJdQTrK0e5KgZF4e77KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790103038; c=relaxed/simple;
	bh=YFV4f8xEQ5682y8KbTX6/j8Tl/peDO19QjRXYpb/Rxk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SkdRlysLzsvrhxWiST/BCu/OwP0gpm3+10Sq7Aysy+ur+UOoUq643p0h9rGgKUpi0FvXlbcsxTV/OOpBxsl2yNZ3SGvdEJMHMDwkj4SVCMoBm7FKfWHuV+kKKDDo2t6MYaGo1PfWOiS9AKIFcFsDPagpiMeFNshubym6GZTQzqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gAxBzKoq; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gAxBzKoq"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86a59faf521so200594b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790103034; x=1790707834; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=754YlWijxBQPELZeMlF4jFJNY3ow3QX/KSaNLc/AacQ=;
        b=gAxBzKoqt2Mwwwim6M+5FOZNYEqh1HnqNBr0IIuM5ui6JOHF7tBz00muTLE62Rav5G
         7S3K3Hd3rzaOFVdNImIO9FiP/Mmgb7/cC4euVzokZonKxUE154GCE3AgtYUyUpHR2cbo
         2ak6LBLIMgPvUd5vhZldvl3FvfT6vubONG6yhEmMiIWmpOVvbqhjeCtPJjugKm0+FtgY
         P8QvMcyS5au7Lxd0I8v9PgR1UnMpBZaJ7zIwprf1e4iHEpiTJfeE1GFR66FUjmtvhSG5
         MTm6dfEf8ImcS6/zeeTr+qMCKI3TY+aAM3LtpE6ROCggkzWAHPFYVZPy5NcYdMt9jvlv
         W2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790103034; x=1790707834;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=754YlWijxBQPELZeMlF4jFJNY3ow3QX/KSaNLc/AacQ=;
        b=vDrMK8Qd2CARpZRlGOYPX8K9YSXNEr2VgPhyi5EkUWjKtCgx9oRU5oVDoRrTX6eQZ5
         KX6RqSjxhkLGODyvLH94xfyPOi55T6Ps3v1VMqOUJXfZOkWk5kvhpZxkaOBIAzpO1znr
         6GZ1x+mUEdUeKELA0VKwrdF98sw0SIWsAFY8DGx5Q4MWEsdT6qOIOyIN6jxR8bvsUtDE
         VWZmVwdaf41TdKS6JzAV51u51UwTeTK3kwvG7bnvPyogZT6oKrkNG7ENci8OlN/45+JL
         S1rL1tYjt3HQf+XUUBjluVRzWg0mvmDB4v2ZlZ1fJTnaNQIUJC5fJIjR80B8OZM26s+r
         n34g==
X-Forwarded-Encrypted: i=1; AKwUvBxBDglbldVODTrQ39hKFpq8/yK0K0XJSDz1Uw0R5u47sNQEyRAw9oWg92JeJVb7d6NfFO/heusfAEJZJMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nCzt4T6/nhpQMt37yLS+8e1k158yB3BCfOiY9m+kijLnsJpSaX
	dc943my2mgeKuIA+ydZIgJMcZXdLBIXteDRf2WaT7alnhM0cNCkqvWKkDWR/ufx/CXRcJyTo9UX
	fYiIWgQ==
X-Received: from pgdi2.prod.google.com ([2002:a05:6a02:51e2:b0:cc4:aa77:305b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d508:b0:3da:1e7b:ea27
 with SMTP id adf61e73a8af0-3ddf7eb3f57mr382659637.21.1790103034178; Tue, 22
 Sep 2026 11:50:34 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:50:33 -0700
In-Reply-To: <CAEvNRgFZBHqiZuXawTjDU1oPR=u3yqBzXW5ku+B2rvMAbBM3vA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260806170602.4112602-1-seanjc@google.com> <CAEvNRgFZBHqiZuXawTjDU1oPR=u3yqBzXW5ku+B2rvMAbBM3vA@mail.gmail.com>
Message-ID: <arLN-ZrD1oQETuPk@google.com>
Subject: Re: [PATCH v2 0/2] KVM: TDX: INIT_MEM_REGION fixes
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Haotian Jiang <jianghaotian.sunday@gmail.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Sep 22, 2026, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > I completely lost track of this, meant to post these patches weeks ago.
> > Compile tested only.
> >
> > v2:
> >  - Fix an off-by-one bug.
> >  - Use gpa_t instead of raw u64.
> >  - Tweak the order of checks to bundle similar checks together, and to perform
> >    the super basic checks (alignment, size, etc.) first.
> >
> > v1: https://lore.kernel.org/all/ak0skG064rhKUC8d@google.com
> >
> > Haotian Jiang (1):
> >   KVM: TDX: Reject INIT_MEM_REGION if number of bytes would overflow a
> >     u64
> >
> > Sean Christopherson (1):
> >   KVM: TDX: Fix a benign off-by-one bug on the end GPA for
> >     INIT_MEM_REGION
> >
> >  arch/x86/kvm/vmx/tdx.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> >
> > base-commit: a806d364ef288a6443a1337820ea8410a7ccc6b3
> > --
> > 2.55.0.679.g6767b8d81c-goog
> 
> Looks good to me, just a question on the use of check_*_overflow: I
> thought Sean didn't like burying an out-param in an if-statement? [1]

I don't, but in this case I found it to be the lesser evil.  I think it helps
that both the out-params are used only in the same if-statement.  One could argue
that's even *more* evil, but t doesn't "surprise" me as much, e.g. I'm not having
to hunt for where some variable in the main loop is set.

> [1] https://lore.kernel.org/all/ag8BmtzxTlcuA_zy@google.com
