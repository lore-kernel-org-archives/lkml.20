Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85932415B79
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614918; cv=none; b=LZglQjuTej710yQcGCTwfJmJ9LRYNju7YH4JYIDsZzB0gxCXwNU4wLjMq9r48xOolKf3Eq9jC6FQOwWh7qP8Q6s+8tYbc4A2kHNiTFqcRF4fsuZpQz/mLHOYmD/+Mn2jAJhQLWFsk7ZrUCCpQfuqKaPYj2XedoyNl2emiYGUvBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614918; c=relaxed/simple;
	bh=aMzM5fzvbcSHzOHJA1huRTbo8w52WJS9I3sDGwRRaqE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dpKC6A3lmpx0H0/KUS13a2F5Z4+IAxlFm1uibjQyRpSdFGLRLUbGGh8WK5yqV33LDfj1cLBch6bmiOgEWnxSndIZxwhFMQJFkS2xlp+Qo2rhg+1arqrDh0iXAo22WN4+rqiH20hHQCYgYWCugLrQA7vPl3VClVDjXlGbgo9WVXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jmna8R/M; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jmna8R/M"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39533bb224cso4933929a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790614915; x=1791219715; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v5MkOtLdmaXNujQwpeiaeYMUIR7StZN5Q2iECEiW9FU=;
        b=jmna8R/MwKmWsqL9annwcXlGPhnQm0L2baB9vv3hMTpLNPDZORuLkdvKxkik8+3COL
         OhVQfHg9+n7PwqQqCFAQtO0Ou+EhNCZxAsSlFt+1iCglHmQKzkVcxtEpupFQplFRRvuq
         6/dtHv6ngD6pF6PlSL1IgO65SwNeBAbaMrWOldE0MWxVg+j0ZS8/tYPBa9fW7ZWJTxVn
         tVqYbgZMRsKz60Y2vifbXDgJEzobd4AMRE9suYdU7MQM5vUmKAb4u6TfpVUu/AD06Pbt
         MOWn1T/kAYdqyQV2zXdK1pLHAy42KEp/fQDlwd0ty48hYXeP2FxWZ+QsABtfTwpJadEl
         6KBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790614915; x=1791219715;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v5MkOtLdmaXNujQwpeiaeYMUIR7StZN5Q2iECEiW9FU=;
        b=SgJR/t4d1YsVQRlJFgGCxP6D+Tlndvn3AA9dtpeM280tjYlKcSkW1dp96snetb9034
         UCfl7GmcdXL2KIVP6Czh+HNQlVsmpcozJeMkJEnX124lvXmn5SfR+d0Ct0SJpy1ZxIcZ
         h44gQ99FB1aIRDHDAfb9x9FAQOVKr/jWw7JL3NaN0FBzsPOhBSzi3UWl9q20R5wFOCiF
         Cp25IVl00IjAvwVf/NVtycA1Pn4+M2h3L1fLAEdim0Ua8w22jxnMgBmlcvzuqPpl09A4
         mpvc6L5gL+wdFxLSnPrtbsdLr6plr3OD9g8Nb23MnADOiAxM0LHsP8xnbZvPLAOiCOt5
         gckg==
X-Gm-Message-State: AFq9FYK9UoC3tHEoWun+lNHudXqU/3ytFtn90iuyKjsCxi7B2SEupZ7j
	qMog7Vqseg0fk7uNr/C88ZE541EVuhuMMDq1DYm4co1U2oRizndYbRhkuGC3HUX9j7DoCTtdqfC
	FSVq1ew==
X-Received: from pgde25.prod.google.com ([2002:a05:6a02:319:b0:cc7:9ef7:92eb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:270d:b0:3a4:80bf:af6
 with SMTP id 98e67ed59e1d1-3a480bf0b5fmr1559457a91.30.1790614915254; Mon, 28
 Sep 2026 10:01:55 -0700 (PDT)
Date: Mon, 28 Sep 2026 10:01:54 -0700
In-Reply-To: <20260926061135.714158-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260926053253.195597-1-pbonzini@redhat.com> <20260926061135.714158-1-pbonzini@redhat.com>
Message-ID: <arqdghk8eIxk1A4A@google.com>
Subject: Re: [PATCH 00/11] KVM: fix issues with stale control fields
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, Sep 26, 2026, Paolo Bonzini wrote:
> > Fix two bugs where the guest could do stupid things on purpose to
> > cause problems in the host.
> >
> > Patches 1-5 cover cases where actions done through VMCB control fields
> > have to be redone if VMRUN fails.  In particular, failed VMRUNs can
> > cause pending TLB flushes to be dropped.
> >
> > Patch 6 fixes a case where eVMCS execution controls can cause the
> > host to use a stale MSR permission bitmap.  Patches 7-11 are tests
> > for nested x2APIC; don't run them on an unpatched kernel.
> 
> In addition to what was reported by Sashiko, the test does not pass on
> SVM.  Fixed as follows:

Thanks for cleaning up the mess!  I was definitely getting too greedy trying to
get bonus coverage on AMD (and I've been ignoring the SVM failures in my local
testing for an embarrasingly long time).
