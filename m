Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577953;
	b=KYaToxrjbwv04vT89EVR7ZU8UE+79QVmTNqDlqaQLQSm5/oN9PTarnAu3pQtWpomKFOq
	 JaDE2Y9TTqewjTMXrYxMDLhyZzRbJ4kTuxr6QcFwvs4fedWh7J/9U84J+IR0B6zLJ8Lx2
	 3xoaG72HdeVLo69thfZMS1zlIERxBZtiYpGouyTJHm59ouXR8PmzVDcWtJBu4E2LwnY7R
	 gck86EsD4TEwtD2NK77XskyUDMIbygSuFTpdlJjTgq1JcQFjbcngUwl6BDuz/EnzaaiV6
	 EqYRvaqjhVB/m4KjOthlvkMd3wp1Tfe4zcBP5dGQgxBQeVrS5GD4BXDRJxryKDmyNvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=o6rNxavkVSPGD6OXC5QlYB6spVgGCDdLKxziIS1EaPg=;
	b=W6/wGkCfnM7EXgcxsLoZ+AzKjnmf/A0yb4Ws4zQGcRQalZILsx+ePC0o5zBmgTsjPYDl
	 TGvDf7fYwsgbVZcDlAmjZ4TZ/KaNHV2rh5k7YQH3wzMkwR574bqH8+7r0ohkjtqv3hOb/
	 00ndBni9uoB7kN4G1RQ2lqm1ccwRjrC/bkjx1N80/rdvUcs9A58NU0BCkAYFjEPZf7Rh8
	 m/drF/vmIBitN4gnWURdu1MlU7X0oiCY268jz63ZlRsGuOBFP3jbgrL1w7FQ20qqrWtTd
	 laTeY0wsxP7Xmu/L8nF5JZGwnRrkicCPoP+sZ0RYSPKGHNVwuMUZXrrfnZ2MWb4iyig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZTJ4mr1d;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8759F606E0C6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8759F606E0C6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZTJ4mr1d
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so1316971a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577953; x=1795182753; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6rNxavkVSPGD6OXC5QlYB6spVgGCDdLKxziIS1EaPg=;
        b=ZTJ4mr1dVqcq1v73DSTZKzsy/Yocu/xyn4OjwBRY5OjWoByLoi+loB3b/JXDEyhGwh
         wLMMYIoV14j4dZxikyfBpe3EplpOJ7GeOGiiGRKLpvYjYhUYiih0nUc77rEvMmnVTGeZ
         gbNmAAt1mOjUM8FUSKWWReIM8mtP5T89xQq5EkB3YCLGzixnp/+Q6IhdN1VATWFcvyNZ
         OiHJvqw29MLOKu58Iwd1pS9xxJu5MPCprjo6hWLv7jTxo5lQLsUsl51Ttjk9c9tsFImF
         tIS20EfAPafTvuxCRP9HiTfSg+LZeSIDDBOeT0fDYsXFOidoQiQoJYlnJzte4ou4MMxT
         yMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577953; x=1795182753;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o6rNxavkVSPGD6OXC5QlYB6spVgGCDdLKxziIS1EaPg=;
        b=KOI7swgvMc71KIFGms24T8V+WoAjsjGNQbQ9OOE8k7jd0eo/aB1halbPKJiTBxCtDK
         JEfCCR3RJEw87y9994AlirmIj96BwrsQx0xM1khFV2wCSEUNoXdeIwTv6dceLJ8J3HXA
         /VqMDr6f68F7QibvcqadCMc4kQW7F2DknAHCL3wvy4+JaaeXM+fVIx6YplrhDGhwiBQ0
         Bu3QISE3swt0/2xZfgCsN8w3IdXYXXU1Ekm9YA10fwBJ58CN6ZhhqTKpFUFF0ySjsKNu
         kfSjQgdSGHBgRJchXSQO6G9cccUwvdfl7Av3fQo4hECOfFUYxUdtpnHImxQPBbiNZqvW
         ZcYg==
X-Forwarded-Encrypted: i=1; AL+hErHlg4g4GusYR8515BgtgNEbk+DOmJ8yUt1uuEJ85wfKiNk4ayGUHTEWMjgUB3ej5J6cZYn4hpSPwSAztv0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VZnio1hWtnjyieiyjrKtNwA/M8QJVFotCnJqdS+VpimXmDANV
	K8DcLu3LNRE7AJMyU7GyTYPVNA7DUJLbiZRcTTS+pPJyVRNyMA0D16yanrdsNlRFS+IwMzRXpNd
	OQtmYkA==
X-Received: from pjuv18.prod.google.com ([2002:a17:90a:d592:b0:3ac:a379:dc7c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:48c9:b0:3b1:21d9:4c3d
 with SMTP id 98e67ed59e1d1-3b1b0cc8744mr2610201a91.39.1794577952603; Fri, 13
 Nov 2026 05:52:32 -0800 (PST)
Date: Fri, 13 Nov 2026 05:47:33 -0800
In-Reply-To: <20261022202734.592745-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022202734.592745-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441776265.76316.16672462680333919952.b4-ty@b4>
Subject: Re: [PATCH] KVM: nVMX: Nullify cached vmcs12 pointers if entering VMX
 operation fails
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Content-Type: text/plain; charset="utf-8"

On Thu, 22 Oct 2026 13:27:33 -0700, Sean Christopherson wrote:
> Nullify the cached vmcs12 pointers after freeing them if "entering" VMX
> ultimately fails (because of an allocation failure), so that if a stale
> pointer is consumed, KVM hits a NULL pointer dereference instead of a
> use-after-free.  I.e. crash the host instead of providing a potential
> guest escape vector if KVM is buggy.
> 
> 
> [...]

Applied to kvm-x86 vmx, thanks!

[1/1] KVM: nVMX: Nullify cached vmcs12 pointers if entering VMX operation fails
      https://github.com/kvm-x86/linux/commit/7597bc333891

--
https://github.com/kvm-x86/linux/tree/next
