Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A2053162E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790173997; cv=none; b=Ior4ukV5OWsg/IJeiMHM3AOY6bJ3iwwKs3WUWf0F8vS1Zvk4nvXXKf6c7JDDNWDZcNrwfCYhzRG1vaFUuHJxGWY2ETsCwJxNmdC9iXdhuLB/BiHr8YB/hUYL/WoJIxXP8CMRe8lpfxBSwHCz5Zhs6eDpUSkXMN+XJbOh3fdGffI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790173997; c=relaxed/simple;
	bh=9SziFnm+aShDkRNqNWK4TN1HFS1h14/qWjFuIX4GFYA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BsdZcSr6DQyQmn24p5oOaMYfQbT1G/p4CHg+y4dg8RImK2YvHetws8TebYbDdeYrEndyfKZ/WKIPRH4ecNv6MFGBd4tHAqM4xWMAInEYQRx1rbhnL+IF5lczA8r/HeljTWdcxxEICroLQQX4APE1DTcGI7PVm6RlOyLNpOh1s+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G4djl8C3; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G4djl8C3"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8623e5d4279so1562591b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790173996; x=1790778796; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AX/aeWxWgB/GKGsHNXt+UF87Ro0pQpzXrq2csA576lg=;
        b=G4djl8C3qxRTsRmvPNo5MOrfBBswMKCGB6TDoGTiEKAlra62ktjDTE69fVMNHfDiRB
         6nwEsCtA47lYdmfdQC8e/d13TBE0tfs3znkzlWpxNNfwzchICxPfyhqaHKU87a9weD2J
         NRXNDMBr1teRUBUiubml1aNnXs93x+joWSp7oOxW7B0LqvvEAaYiklk2u7rWX7fgRy5U
         X9IWtepwDWlJe+kBfbHziUx4RFhKzQiSVXt2OVG57BQ9rXGa2EUTl5CnRiQWp82kEAyg
         o6FYT3jccLBqcl51Hb+ZvnlUj74dDlA1EgIRNsqpxwUzVIVXMfvuYFiPQ2cLWiu1/nBH
         n8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790173996; x=1790778796;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AX/aeWxWgB/GKGsHNXt+UF87Ro0pQpzXrq2csA576lg=;
        b=J9Y6PmGvKVSkgafBrzl/OTN2NpSxGjVHdl3W/CAocQRPmD0dGX2+N3oCrep5isNMbR
         T5z1axzs+dzcFsijlrx3im1J6iEySFopZQVFPI5Nuso8Tk/2b4SvB38b04y8uecQCddz
         YJKnYt8XfB/wPouoax+inc4D7sGSqk4Om2s5FE6IBTFhfSqg7Z6DwROoElwqv3XYfQWR
         GsE0lA/hZdTpD1K/cHFAMYsiVaYhtm7aEkdFcWRYsHyaJ4AdryNUVyC1/d6ZGW60gZ/n
         NGp1jUrbXyxmVTvmfGVh8x1XRlDVf2XLESE00obshl6MBHtFaC+mmLoHm2Nzc9IMywDX
         251g==
X-Forwarded-Encrypted: i=1; AKwUvBz7uzAuFiItlMway9ZtczM+X9nRbbNBhRQht+lAvI3m4DRoVLd/QgKR9pjVKNk9mQFI9SHsdT/v5fp7FRw=@vger.kernel.org
X-Gm-Message-State: AFuF++kmr0s2okPC6QsIXuNDtLtrwlbdMd8VI3ocIllspQm9ClIA7t6U
	EBZ10G0sJfV6juJ5Qzkjo6sgwftWc+47VglWLaueay4vb2aVzyunXnU8ZUTi69AwZEbNugYZHnk
	jBfqGeA==
X-Received: from pfet15.prod.google.com ([2002:aa7:938f:0:b0:87b:94d4:77a2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3319:b0:87c:e44e:5683
 with SMTP id d2e1a72fcca58-87d1a4b357amr2446190b3a.23.1790173995748; Wed, 23
 Sep 2026 07:33:15 -0700 (PDT)
Date: Wed, 23 Sep 2026 07:33:15 -0700
In-Reply-To: <20260923085139.GV776954@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <179005108298.388919.4535333252892590932.stgit@devnote2>
 <179005110742.388919.1509641807739909065.stgit@devnote2> <20260923085139.GV776954@noisy.programming.kicks-ass.net>
Message-ID: <arPjK1-PVp_UqAsQ@google.com>
Subject: Re: [PATCH v17 02/13] perf/x86, KVM: Prevent host debug register leak
 into guest OS on NMI
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Ingo Molnar <mingo@kernel.org>, Jinchao Wang <wangjinchao600@gmail.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Ian Rogers <irogers@google.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 23, 2026, Peter Zijlstra wrote:
> On Tue, Sep 22, 2026 at 01:25:07PM +0900, Masami Hiramatsu (Google) wrote:
> > From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> > 
> > When KVM enters a guest OS, host hardware breakpoints are disabled
> > before running the guest. However, an NMI can occur while executing
> > in guest mode or during guest transition, where
> > arch_install_hw_breakpoint() can be invoked from NMI context.
> 
> How? AFAICT perf doesn't do that. arch_install_hw_breakpoint() is called
> through pmu::add() which is strictly IPI context.

I assume it's:

  kgdb_nmi_handler()
  |
  -> kgdb_nmicallin()
     |
     -> kgdb_cpu_enter()
        |
        -> arch_kgdb_ops.correct_hw_break()
           |
           -> kgdb_correct_hw_break()
              |
              -> arch_install_hw_breakpoint()
