Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577915;
	b=IlR+I9/0EqFE1GrPSyQD88kq42yjRmjy7plF1hi/xiDrjLIFRJk0RXYxZ2ilgYTiXh3n
	 QSVd7VUPdpZoK0kCInw7bs5cRF5pePUm6BgQn5Waq57L0L/OO3goRuQaLDIYCZnetFnZY
	 AEtJNopQSVFtRLywWJ4BAra40BxPi2VzbjY1JiHsKnnLPNn4cm+OKFZNUtS0RF2UW/35C
	 1cUCr1YzPVnGD/QKrU98e0SrRGwKoiO3woEr+nrtM+J6dezVz5EiAqyhjiaqAom2x9UNY
	 ggzronXONTxNHmumzfA7CmZ9n2acb7nTq+EMUnWIgypKfpU1yla7yfChuppyplj4G/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=VjaqT3209uv6MC202ND13nLcrUczNX+A6aMg0FaxB88=;
	b=X7SKS69oPujUJbCH0x/PNeVv/PP2QFY+aH2cofXQ5qxT2Xwd+V9vEDXq6Vkr6ZxP2NcG
	 Cn1DmBibqkMOCg7BqY2N40+SfbkhAUKyXckJk9O3Kd3J7FR3Pouf8Prp4fxigrKrL7f60
	 dvKlWt6hZq40ngJT8/MTSIdrY3fmST2OjjIAjiyC22guAMS9z4lQoFPlZShrf//nKIY/A
	 lcsLLPEu3euh3sZjI0ysjKKuyd/aBAjVd9QrYdeI/YvyKkcYwmMlNxqBXdFkk2pKpAqtQ
	 m8kLOnf2HQsmbwIDN/FJDG99tTKfV+z86LSuaILeCuL4yxzywLCbpNgDgUTm3KJUZhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kULy1qMk;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C151D606A897
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C151D606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kULy1qMk
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so1467640a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577914; x=1795182714; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjaqT3209uv6MC202ND13nLcrUczNX+A6aMg0FaxB88=;
        b=kULy1qMkrEvLFqNPD2ea4MMpEZMW5F8AX8btRQtJfle80qdC8bsC48WmN6jWuwA0JH
         KBiZe/XdV0VJ0fvE0Z3bO1zzaogNS1Nv5o40Qxok9rD6eJLHQRo1Hh5cEJYaPdecvH0h
         fjBYxYdZj0HqWqzYAIOCqZCcN4QlgfvE4UHCXBt5IJgM0pTVQWileSsIdT8T8SKYYvTf
         K15JxyQFk+u2xmlowfxRdwS10Ame2modkb9RIKo7yFMHiJ/G/R/7KVKpUD8Hyw4q1Cuq
         wJ6r72lIGg0KT/8ewZf+bbCHE4hL4NUJG7cd6uTdgiEQSYJTBA4viSKzUBKIc8yAPb3A
         IWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577914; x=1795182714;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjaqT3209uv6MC202ND13nLcrUczNX+A6aMg0FaxB88=;
        b=SX3qTfww5vK12coMCIypXRwJmQthyqivw+FyeU8PycFB6xh3wh+7I+rEMKA90+HcjT
         MITuyaSoq5U3ZG9tgIKAt5NSEF+GGCWnHb2eGWlGAR2aVZPNSJiyLgJcdnTlc0UtzVLl
         5FhCsgnG5KpF2et3rZn+r5NyL4FST6SKGwNsUe/7UbnSlVokA0l80B20tRVAMFdlupGr
         pPFQ1DJkMSJPgIq+CnreCa+EXw5zH/Kzz78oKK0WxAlrcRwhcwxdAECCKKF/cAkd6TS9
         /HXu9IXockgghGv39ezyX4LHdWgrUiEb72Ie2gK6wrfPeVROzkcJf1RHxEdDrctdcZCf
         CLKA==
X-Forwarded-Encrypted: i=1; AL+hErEvs9kuC0LY40MEm8LGaox4fEEkC4Pi7x6ZBPBT/Sb1BwjNXa9p/d+Au5kf47Ffbia13e1fkDaY30hyqXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QqlXn65GmL1kh/TN/c8BnyWKb4U9aj5pbCjIoEA/rgVL7vXJI
	s4kcO6lC63uT1w0UxKgQ3qFRfe7f8rzJ+9gpTxNsQJ3lt7wqya2plaqKNvIFPVTYA/WChNcIQCV
	YzVHXhw==
X-Received: from pjca1.prod.google.com ([2002:a17:90b:5b81:b0:3aa:ff61:94cf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:35c8:b0:3ac:e6a:1b2b
 with SMTP id 98e67ed59e1d1-3b1b05ea8cfmr2418462a91.0.1794577914038; Fri, 13
 Nov 2026 05:51:54 -0800 (PST)
Date: Fri, 13 Nov 2026 05:47:20 -0800
In-Reply-To: <20261022203028.595318-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022203028.595318-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441776823.76438.16222114675545424492.b4-ty@b4>
Subject: Re: [PATCH] KVM: SEV: Ratelimit all #VMGEXIT-induced info and error messages
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="utf-8"

On Thu, 22 Oct 2026 13:30:28 -0700, Sean Christopherson wrote:
> Ratelimit all of the kernel log messages related to #VMGEXIT and/or GHCB
> handling, as they can all be triggered at will by the guest.

Applied to kvm-x86 svm, thanks!

[1/1] KVM: SEV: Ratelimit all #VMGEXIT-induced info and error messages
      https://github.com/kvm-x86/linux/commit/6611ea2bff76

--
https://github.com/kvm-x86/linux/tree/next
