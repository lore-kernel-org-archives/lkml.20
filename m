Received: from mx9.didiglobal.com (mx9.didiglobal.com [111.202.70.124])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 9404A1DDFE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.202.70.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788843826; cv=none; b=dXC+Zk6PSSUX2ntocjhOYIx68zFR6CUoDnTe5g9BjNo6zSxWSNiEozenxMkfI0EiO2OupAyPCRXh0AB8KKYqS/PIzhEur8LpuFrXLAWlV52YBDNpvpfAopsjUskcDpkn7DWwLSBteArgY7r2iiqR1eVzfO/RjWbcqRicix69lCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788843826; c=relaxed/simple;
	bh=tt0kAtOei5u45B9EUwpol3SG5XR2CQ0RbJMxWktVp4g=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ui+sgddFeTsZH0zWqWlrXO/d0dA/kXtsc+Ah8z9twqY6i5t4Bgq+mE8jnNiu7ajGwgeSoZpqsGvC1XtL7KNmtOp74L29Y6p1sSn7lhcy6atd2/WtwvRNtVyLTAmiV+DGSwpzekD4pCLGNSD94K2qF80VR2Q3d2FV6lNThe5yjz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=didiglobal.com; spf=pass smtp.mailfrom=didiglobal.com; dkim=pass (1024-bit key) header.d=didiglobal.com header.i=@didiglobal.com header.b=QGsu1umI; arc=none smtp.client-ip=111.202.70.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=didiglobal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=didiglobal.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=didiglobal.com header.i=@didiglobal.com header.b="QGsu1umI"
Received: from mail.didiglobal.com (unknown [10.79.65.20])
	by mx9.didiglobal.com (MailData Gateway V2.8.8) with ESMTPS id 6D091185CCB516;
	Tue,  8 Sep 2026 13:00:23 +0800 (CST)
Received: from BJ01-ACTMBX-04.didichuxing.com (10.79.64.12) by
 BJ02-ACTMBX-02.didichuxing.com (10.79.65.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 13:00:23 +0800
Received: from didi-ThinkCentre-M920t-N000 (10.79.64.102) by
 BJ01-ACTMBX-04.didichuxing.com (10.79.64.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Tue, 8 Sep 2026 13:00:22 +0800
Date: Tue, 8 Sep 2026 13:00:09 +0800
X-MD-Sfrom: jinkehan@didiglobal.com
X-MD-SrcIP: 10.79.65.20
From: Jinke Han <jinkehan@didiglobal.com>
To: <mhiramat@kernel.org>
CC: <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<laoar.shao@gmail.com>, <peterz@infradead.org>, <jgross@suse.com>,
	<kees@kernel.org>, <jpoimboe@kernel.org>, <rppt@kernel.org>,
	<sohil.mehta@intel.com>, <linusw@kernel.org>, <linux-kernel@vger.kernel.org>,
	<tiozhang@didiglobal.com>
Subject: Re: [PATCH v2] x86/kprobe: Fix crash when probe cs call
Message-ID: <20260908050009.GA11579@didi-ThinkCentre-M920t-N000>
Reply-To: <20260908104425.98040997699efaa2bc741e0b@kernel.org>
Mail-Followup-To: mhiramat@kernel.org, tglx@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, laoar.shao@gmail.com, peterz@infradead.org,
	jgross@suse.com, kees@kernel.org, jpoimboe@kernel.org,
	rppt@kernel.org, sohil.mehta@intel.com, linusw@kernel.org,
	linux-kernel@vger.kernel.org, tiozhang@didiglobal.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: BJ02-PUBMBX-01.didichuxing.com (10.79.65.22) To
 BJ01-ACTMBX-04.didichuxing.com (10.79.64.12)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=didiglobal.com;
	s=2025; t=1788843624;
	bh=vlT82VuHw995LGlVlvvwQCMKzQF/CV2SssJelPoq5qg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type;
	b=QGsu1umINOf9oyN5R8flzJOZOwD5MlLUyCtttSPASD9XRN0alZT5rwQOH5xtsPtdr
	 FWK3MZ8NjCJX2Z/V4l5EwNzScLiUURgdqhjOm9UES8Yl6qH2g1OzFS0IyyuTxQnrAQ
	 O5FSlPwsutWlcGLi+fpukEG7pzLQhouc/y8ikogg=

> Thanks for fixing! I have just one comment here;

> [...]
 
> > @@ -2180,8 +2181,14 @@ int3_exception_notify(struct notifier_block *self, unsigned long val, void *data
> >  
> >  	if (regs->ip - INT3_INSN_SIZE != selftest)
> >  		return NOTIFY_DONE;
> > -
> > -	int3_emulate_call(regs, (unsigned long)&int3_selftest_callee);
> > +	/*
> > +	 * As seen in int3_selftest_asm, the effective return address
> > +	 * should be placed immediately after the instruction sequence
> > +	 * [int3; nop; nop; nop; nop.]. Therefore, CALL_INSN_SIZE works
> > +	 * perfectly well here.

> Nit: This explanation is somewhat wrong. alternatives only support 5-byte
> call. The TEXT_POKE_MAX_OPCODE_SIZE is 5. When len == 6, alternative.c
> explicitly reserves this only for 0x0f prefixed Jcc.d32

> See alternative.c 
> > /*
> >  * NOTE: crazy scheme to allow patching Jcc.d32 but not increase the size of
> >  * this thing. When len == 6 everything is prefixed with 0x0f and we map
>  * opcode to Jcc.d8, using len to distinguish.
> >  */

> So we don't need to take care of 6 bytes call here.

Thanks for the correction! I'll fix it in v3 soon.
--
Jinke Han

> Others looks good to me.

> Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

> BTW, can this be picked via tip tree ? or I can pick it.

> Thank you,

> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>
