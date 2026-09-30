Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEE8234964
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790729714; cv=none; b=gAVA6loCIPTujYnGNPWwQ/we6BiNC9BrdI8QIETDXLXBXS8go8wuZMl4PJTyytIQcbSX9mF/jEjE0jSkrtFNK7U/4k/ZfJNa1QribsNcr9mNJhUnxL1cl4Lx7vSNIS8RcQraJjCk8ZuGnGbAE+UPfL8MUmCeibItNF2taMUVOYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790729714; c=relaxed/simple;
	bh=p2yWYS6720l1AamDkwuIrJ88Ej7lEOXOTezg8g01GzU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O5zYYxkKwQ0lBghYCC5+lbkI3rl/Plondv7jgLYwxfYBMVQkdyQp+WF08fnsQndfVUVa+TCrsssH/DfwPG026B54uGb3NgKZpx2bUCgSoIGpucPwTgalHul8OGiH7eitd4PFl9fC3RMctIlpMqrh94dgM4pCHcFCZ9gi335NwvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=od0E8/xw; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="od0E8/xw"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso3200772a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790729713; x=1791334513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wAW//sr3pC2NBc7liE6tPMI+ECsOTrk881ZsZeZAzE4=;
        b=od0E8/xwfyZ2Hbq7WqV7nkIrZYe/ExN/TES3AECQENqTks86xxq5gbGqyWZYQIS5PF
         UUpWlG7cBCmOCvU+lEXc4D7fmGZp8hXWknenYC8LKBoLDzI3KE2yf/YyXcrMAK10lKNf
         GoX/GOIpe6+hVapbvkNl2FUD7V2rXC0KnycYEq/o448+TA1aVco/1yoI/tRuVSQQ+REq
         EhYfr1y6BdKdkK2V4SvBw7VsPs4KtxcqdrKXtQiooAfKRpV6vF9RSExqdO0LPF+zR3za
         Jjc9CcfjAX0hCTcebeMy/t/IaEkYGPoV+5qX1lKBz94SGuvEu8R/wyb+7g8XFn3ImPTa
         astA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790729713; x=1791334513;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wAW//sr3pC2NBc7liE6tPMI+ECsOTrk881ZsZeZAzE4=;
        b=x6nva+lhkxe6nmoVGfJ8NQ+B6Kw9zqFX2jyw2PjaNGDhs8Ym7sQ0bu37Q2/gafZjau
         4Z7zzLnUfs3mB+jmQjWBHiwB34hBVdI+P9bJq9USI+dbvn1r8az+cUU4gzqLfhEUNId2
         nFbNXnI5w8mXBH1LLVVCPJ1G4bCot/hd2rt78ZxbMT+Odw99yQp6xtt5VTzLWU/LlSpx
         TT6/ZO74zXVe5V79Jmjo1LPmycAVRlECXdy38bCdl4/XVRrUhVHjNrs0yGJP+/al0k4Y
         z2TjWDTrLxWdHISE1PTUjc7RAPbMjihbPKfVbEy43RRbb36oWEQosgklHxgpEs+FbI3n
         R1Ig==
X-Forwarded-Encrypted: i=1; AKwUvBybeVmj1xo9rVuqHHMLpD/xTiQtwge5LexJhoLkyJnGGthfyv1wPjI8ewdkbOVxQLs7UQhquz64bc7vVGU=@vger.kernel.org
X-Gm-Message-State: AFuF++kCIDGIFZX86pLqg9UreTJI6KmOnCCfLhQBxuA9WIgSyjSgXHPK
	noVJoqyWZOxgKcPJqpHf1KLJgMl6nrPyVY1LcaCvp4KVRatzEJKNR28t3f5C5E5ozRMBGN+LnsO
	b2dpPJw==
X-Received: from pgbcw4.prod.google.com ([2002:a05:6a02:4284:b0:cc7:b387:6d4b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7fa5:b0:3de:849f:9053
 with SMTP id adf61e73a8af0-3de9530b969mr741880637.45.1790729712492; Tue, 29
 Sep 2026 17:55:12 -0700 (PDT)
Date: Tue, 29 Sep 2026 17:55:11 -0700
In-Reply-To: <3c0ee89f560b0235f293b32019327186785aa795.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930001127.3170009-1-seanjc@google.com> <3c0ee89f560b0235f293b32019327186785aa795.camel@intel.com>
Message-ID: <arxd78Pn6WWL6TGq@google.com>
Subject: Re: [PATCH v2 0/3] KVM: TDX: Syntehsize SHUTDOWN on unhandled EPT Violation
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "kas@kernel.org" <kas@kernel.org>, 
	"jthoughton@google.com" <jthoughton@google.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"sashiko-bot@kernel.org" <sashiko-bot@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026, Rick P Edgecombe wrote:
> On Tue, 2026-09-29 at 17:11 -0700, Sean Christopherson wrote:
> > Signal SHUTDOWN instead of -EIO if the guest accesses an unaccepted pag=
e and
> > has disabled EPT Violation #VEs on such accesses.=C2=A0 Returning -EIO =
is all but
> > guaranteed to mislead the VMM into thinking KVM (or the VMM) messed up,=
 and
> > will likely result in the VM being terminated instead of rebooted.
>=20
> I'm pretty sure Yan had a test for this path, and I'd love to see it actu=
ally
> exercised. What is the urgency on getting this fix upstream? Can we wait =
a week?

Absolutely.  It can probably wait a month and no one would care.  IIRC, thi=
s got
hit by someone (internal to Google) deliberately crashing a guest kernel an=
d doing
funky things with kexec.  It showed up on my radar purely because our autom=
ated
madness alerted on the resulting assertion (on -EIO) in the VMM.
