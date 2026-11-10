Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336785;
	b=AAzrfQSXb0YMlAD8UuSZrPJPXFeSfjHersa9jGfmlMBIz5Ek3lTB2ehcp2OiVI+tK1mm
	 EAu4+XUWEWj6RcA3eQ3h1LUIMYmISSd+o4mHqrJ7ebEUNSlofbkrnFuLp1fGVAyeE7pDI
	 Ca3YJOP3Z6KH708eFPYjwl1kIZ25wkvgCTetvcJ6EKK8Mi5W2cnpqf9WAt61/AspCgu3x
	 4qRuDi3TcPT666uAo5KbyQ9upf6x+ZAK2kfM3KUccvN6OJC3DfeK6p3oyZ+RX8pav/ThQ
	 niaDEdLvC3FGse4it/apBIkztsYRHIFEHxqf9Qug7eGvbBGm0kd881o6SDfLeE1fCMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=mA4YNX8Ydg/CPBY9GGXckgAP+pIFlnhDeHY6Iu8MWSg=;
	b=EoY9yLymRa/cW/1x59cX3ac8JuRkmb08lzvJ3FT/fH4Z3YvKq8GzDOYgnxn7Rz+whxvb
	 3cd+woxEb4JKXuFNCW3/HAy0hpUJ1DGksF3oGSU7EKWCpPq1tQ1JDioqlIcu56erptHpS
	 No90/58ycc21n+dBb5V3E5uFNmRx9+xPuG0DBClkY/TjM6UR6BkKu+7pTurE0zd97iWts
	 ELY3xtFQU/a1OLchAWBx+Lmn/To6v6DYTyitSR3D0RsZ6QKu2Bb6UW7CqC8OrYiWlUw4L
	 52wsqrDwzMGTComWusN78YjCBxPu4zDNE7UlcuOu9DYG2Eos87LZvxnLAARBDfgyGRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M3JvO+7G;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F0A606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5F0A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M3JvO+7G
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b847ab3fd3so3060320b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794336784; x=1794941584; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mA4YNX8Ydg/CPBY9GGXckgAP+pIFlnhDeHY6Iu8MWSg=;
        b=M3JvO+7GQPB6JuXsOL6dD6S2qMQ8HSXO40UTXzOGHaosOJil5GSywRu8zwDCG+9hVx
         5MdX0NUxml/hP3/YB/yMiXXRNSYqTsMhSKLVVwiA8dSXDlMQw5TUI1Sofgu6ppMUxnfj
         eyAB4ctx/oe7q1aHXivzDosHGDaZyZQnQDotXvjxTrLPuASiGta1cPo5H6NSUHl/0l5E
         6ODAWPpzWqMwolBqB35WMHwkk0b6tccTVY3D9K3y5PkQ8FNLO/lo/wci8zWtcKGzw0MR
         7pAnJa4dz5dHshE2RfrkdGTZ0ir8lrCNmYW8qmMbGDdN8uBxnaffyEeJHsXTLkOyrTSD
         S9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336784; x=1794941584;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mA4YNX8Ydg/CPBY9GGXckgAP+pIFlnhDeHY6Iu8MWSg=;
        b=lVbnZDveDHTBNedGS9769YPNFb9bVordvDdfstLiv/2O5bYkFNFm78rYYV9xgFNZGq
         M2VBBTLatP4zJzSTzP1g1N4b+UTbcGZEFlmfByPZ7tKlfAvJGJgLkw+/B2tJ45RDQi+F
         EYVTtXDWUvNsDXolA1jA7fEK4fkq3NERg9SLowRKXBiJ+pjDhL48mDpSaEqgHVlpGrao
         oeO11qdcvKIXrL7y/zv1vPC4bA6aC7La7v35DBnnPz3Ctj+ijgdAL6SgTestxbediIcH
         ZiIBfAN+shr+yUR6VLwdccIOW+eOKbzgLqf7KLwSbBOpATcRLY8R+NwuIoAHNjmxHvDs
         6hfA==
X-Forwarded-Encrypted: i=1; AL+hErF35QCjEaRTHaCVknyGGYcOyn1sirkzmX6OqGKUaNjUbqOqaRkSPrEV/MHt+EaCJfqilJFk9SWSDluBzlg=@vger.kernel.org
X-Gm-Message-State: APuU4Z91Mv2szWwYbGh7lCdkfmIWAYPnU7UeDiprEKP7CieFlka0A3Ey
	GeRpMekyEtN29CdL3x2plfgt8r434ySVRrBXuHW/oqp7TjnQ1qEghaykJoVzSfPi7SRkRusd/9a
	XkWzFkg==
X-Received: from pgme3-n1.prod.google.com ([2002:a05:6a02:6c83:10b0:cdc:b85b:3d46])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:918f:b0:3eb:a4ae:3aa9
 with SMTP id adf61e73a8af0-3f190086a4cmr3473914637.63.1794336783796; Tue, 10
 Nov 2026 10:53:03 -0800 (PST)
Date: Tue, 10 Nov 2026 10:53:03 -0800
In-Reply-To: <CAEvNRgGHUL4-KSMCsOHznKK3fpvwh=D-H7OwSaqk2A2T0nL6ww@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-18-2024e8fa517a@google.com>
 <20261106164732.3939387-1-seanjc@google.com> <CAEvNRgGHUL4-KSMCsOHznKK3fpvwh=D-H7OwSaqk2A2T0nL6ww@mail.gmail.com>
Message-ID: <avNoDzycqd3PN9gE@seanjc-mac.roam.internal>
Subject: Re: [PATCH v16.1] KVM: selftests: Add support for TDX ucalls, via TDVMCALL_REPORT_FATAL_ERROR
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sagi Shahar <sagis@google.com>, Lisa Wang <wyihan@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Nov 09, 2026, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> >
> > [...snip...]
> >
> > diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
> > index d41a1efc8a63..9982aaaba885 100644
> > --- a/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
> > +++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
> > @@ -4,6 +4,13 @@
> >
> >  #include <linux/types.h>
> >
> > +/* TDX hypercall Leaf IDs */
> > +#define TDVMCALL_GET_TD_VM_CALL_INFO		0x10000
> > +#define TDVMCALL_MAP_GPA			0x10001
> > +#define TDVMCALL_GET_QUOTE			0x10002
> > +#define TDVMCALL_REPORT_FATAL_ERROR		0x10003
> > +#define TDVMCALL_SETUP_EVENT_NOTIFY_INTERRUPT	0x10004
> > +
> 
> No objection, just surprised you'd add all the others that aren't used
> in this patch.

It's nice to have, e.g. provides additional context to help understand what types
of things TDVMCALL does "natively.  And I almost always do lookups for things like
this and MSR indices using kernel headers, e.g. versus trying to hunt through a
PDF (assuming I even have or know the "right" PDF). 
