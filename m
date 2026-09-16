Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64E559E335
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583906; cv=none; b=mUWFLt9KrW9mvRcgOOOnZSyKHaZiukkNRr+GEbiT02vtyRxA+rVB/K49SG+JxMxSXdkeRB/RADUTmRTvYbfgpB7Cz/H8ENMvgjFC98SEEF3LLy9J4KnnU73VJUfeRQAVBytw3aUn2I5icxsFCam2yKOT+pCV5qwUY5SfWK/9NbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583906; c=relaxed/simple;
	bh=cDzXvZbaOZP3SiwFeiDd+RJA7MdlMNY4XVSpNU20A3k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OoiS+59xd+TpVortw/HIP15VlAEiKaTMavhjvhtCF14KcL3xiQ3FahrH24m5L+B2DafoB9SdrOhwGCslSruxTISGQhZiyTYOIar+D0ejH01i//B3WVkD6IFpnI13bqj/2/R5TybE6ZRWBUU1U9mTD745CkR2WxAJxj3MReOJl1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ckLUiLC0; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ckLUiLC0"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e25a5f6e8so11493a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789583882; x=1790188682; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNEHdDji3u/WjfZNbUeK+OKQDAVuIySwD4Ew2YHeImc=;
        b=ckLUiLC0iIu3OMP//79Xj4r3LBrqXlbcW7dZ5B+D847OxTaWpc1Z4RSNi8PndJbfl8
         wldBmCbuWDsJimr6OQwc1j7X5HcxVQ47KYofILPShB7JjerO0czPRmLICAa6gGPH6y0R
         DIas4zila35/z43euoGc1f42ncmzWX2iO9Kh/SulGctLwd8MhhYn/SIupW3kFKAFrmB8
         UQ4YT8c25PcNel48V5YLqyZlXbIxw5xF53uOMrqmu5nIxuia//elGomDEgJw7B1ucX4S
         08NR6KwPxn2opdt3V031aCuD5Fu9cfCZC1GknRntYqNeTJuOhxHclo9aGDXs+lJRzrVO
         Fp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789583882; x=1790188682;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fNEHdDji3u/WjfZNbUeK+OKQDAVuIySwD4Ew2YHeImc=;
        b=B0olIOVhcxGBzrD1LcaINxa9ci8i8KI8PDHKqH+Yf7Puv0NUnCp+i+e1m+/2j7G8J+
         2N7dgXtDBHLWasmUVLlZAqXtROecjvc+jqmhMkBAUtu5GuxsO5UKljVTw8j+Rflpnz4w
         n0EcfQG3pT9HeCC8FN6rFSGJvDXxmYNE0A9xtdO3hBEykTnQw2URrH8mBoChRpOgod4H
         1VA+aPMAg7pYqkKQoYRMUscYvPw/oLLicnfYZfyz0Wfq8Ai2stxKPp1cQKBgYxXHUwIe
         +IYtl5K0L/pXbqNWUWf90h4pkYDZpQqy6kIzwv5+mC2vux4yNa8vqQnOXbVgAPAtEs9W
         4ekA==
X-Forwarded-Encrypted: i=1; AKwUvBxssZuHyP/JBG/J6I9b5rnTgZVirTsTKYiFPR9eFeKKDQ0fhiaANF0uKaJwJdWJHz3wmv4AJCpGgMJAA4E=@vger.kernel.org
X-Gm-Message-State: AFuF++ltw9VEY5emkjqtDVRIAZVqUO67R8hUfcmfYjhDZqYg3/Sm09Aw
	YKXD8wOhtfT91TdS3AnGvYAj2JbxDguLbGWvu9Ab5Oz/VeBg5U+SSTl3iTlVP67TYsxMfpo/FL1
	bGA+BYQ==
X-Received: from pjbkj2.prod.google.com ([2002:a17:90a:ed42:b0:39d:dd69:126b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2744:b0:39b:2c55:365
 with SMTP id 98e67ed59e1d1-39e1e45bc52mr7668103a91.12.1789583881800; Wed, 16
 Sep 2026 11:38:01 -0700 (PDT)
Date: Wed, 16 Sep 2026 11:38:01 -0700
In-Reply-To: <f4fdef08-fdf0-4af8-bf59-07c48625b282@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260806011536.4172258-1-sohil.mehta@intel.com>
 <20260806011536.4172258-5-sohil.mehta@intel.com> <e6220b0e-0f5c-435f-823e-318b527eee8a@intel.com>
 <c5076e4a-0335-4ed1-8049-a3ddf486ea03@intel.com> <aqlQgQgnLDf2CHqx@google.com>
 <f4fdef08-fdf0-4af8-bf59-07c48625b282@intel.com>
Message-ID: <aqriCQTG7F73aEpX@google.com>
Subject: Re: [PATCH v4 4/7] KVM: VMX: Implement LASS violation check
From: Sean Christopherson <seanjc@google.com>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: "Chang S. Bae" <chang.seok.bae@intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Kai Huang <kai.huang@intel.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Chao Gao <chao.gao@intel.com>, 
	Yosry Ahmed <yosry@kernel.org>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	David Matlack <dmatlack@google.com>, Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, 
	Kishen Maloor <kishen.maloor@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Sep 15, 2026, Sohil Mehta wrote:
> On 9/15/2026 7:04 AM, Sean Christopherson wrote:
> > That said, I love Sohil's idea of adding a function comment.  Someting along the
> > lines of "The basic flow is this: <example>, but the actual behavior is far more
> > subtle due to many exceptions and edge cases".
> 
> Great, how about this?

LGTM.

> > /*
> >  * Check if an access violates LASS purely based on bit 63 of the linear address
> >  * and whether the access targets the "wrong" half of the address space. The
> >  * basic flow is straightforward:
> >  *
> >  *	if (exempt from LASS)
> >  *		no violation;
> >  *	else if (user access)
> >  *		violation when address is in the supervisor half;
> >  *	else
> >  *		violation when address is in the user half;
> >  *
> >  * but the actual behavior is far more subtle due to the many exceptions and
> >  * edge cases. For example, the implementation depends on which accesses are
> >  * exempt, what constitutes a user access, and how supervisor data accesses
> >  * differ from instruction fetches.
> >  */
> > bool vmx_is_lass_violation(struct kvm_vcpu *vcpu, gva_t gva,
> > 			   unsigned int size, unsigned int flags)
> 
> 
> 
> Sean, other than this, do you want to see any big change in the series?

Dunno, I haven't looked at anything else in the series, I just saw that I got
summoned :-)

It's on my list of things to review, but I'm behind on reviews this kernel cycle
for a variety of reasons.

> The sashiko complains are false-positives. There are a couple of nits to
> be addressed, and I need to change Binbin's SoBs into Reviewed-bys.
> Otherwise, I think the series (1-5) is getting ready to be picked up.
> 
