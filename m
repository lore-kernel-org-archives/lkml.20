Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577872;
	b=o2tCncGEkSWymPmJp4bYmU69S76w3Dp8umpMVaX0ACOC5dUodTlrBK4beWcPrAg6oGWn
	 JllAQWQ5g2zu5EWYaSovySxOe8R6dxO/4CdkEKFxfy85FBnmDQwA6Es3JiUgeEt+kQvaE
	 yT7xlY+FGYC2y8s5CxHRdo0g3izgONL7dunqprOj3HBU27p51ekxgF3ohii579hnBDcap
	 sFGe3JXsfF6iZ3/uLc8eri6fHo7Ka9n1Se4X8siNLyq5lbYX/RUEkLJNQQ+RafqxCc7i7
	 7PAadu2iXWFUBE+lKzOtBybE8DEFwURmiY8yqzi69RrppFL/t9X9bspYQjy71Xzuxew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=e7yA3YWoAnnKTfnIvqWXC9kbQySfcwLKR4KGL8avuCM=;
	b=kg9E4fHEhGQPW10/wxEm9185Ph0brQQp6jxpqy/T+aKcO2ojkaAadabuRwTTISRLDX8l
	 WdbR/GKETzrfJrj6AaNPDeLKA/4QS2+sKZKxkCooG8eIHYfDOj5c/1nLRbdKtHy84Fam5
	 pGPa86PK8eKGHKcaBCBjknjrE0g9ZUplbWuELYQFl2wGw/Fw7tr71UZ0JMt4e9r+YOTad
	 1Klus2dfOvhWAOfFyVT2i1FFqnlHIqiJcwl/u+gKyApR4TQ51A4QYxkNtsrT/tcmzxkOE
	 Qs+UbuxiZRUhGih+HtBy4Aq2uyt/ibzNNbwAHE1D+OkIASPru0PnoCCiIemE9shp5mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f6FL9RFe;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688A260A381B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 688A260A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f6FL9RFe
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so652878a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577872; x=1795182672; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e7yA3YWoAnnKTfnIvqWXC9kbQySfcwLKR4KGL8avuCM=;
        b=f6FL9RFe9dT5BTTHOxUtFUHctuKpRMPCjvr59NaB2celnu9uvuowEEMYsXUnDFkxmz
         F780pnluzhvn/Ufb04pZmVsAIAsbVi2yDNhhk0VT4fCBsBSU6IWsk5tAp5QhlDG5FoiO
         M9geHwQEGdslbJHpDQX+9FNKegbqmb3UiYa9ZIbYLsjDcbeQdKSbnuhsCPyNotH6/NHA
         GlOefFoaqpARmbRCk8JFLzazJcYPy/7irScXbRXekOmBAqUcKTZIscfgkKkOQxc0QPrE
         TIpZ4FGZTfiEuipZnTSXNoP4tAB6cKf/stTe6ttxHey0pOGXA7EXM/deyP5PXJLH1Ekz
         vgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577872; x=1795182672;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e7yA3YWoAnnKTfnIvqWXC9kbQySfcwLKR4KGL8avuCM=;
        b=wNEtQQxpzZUvaYJHTX+jdjS4+6iM7wgjLbezviKOGh6m5sEyryYRrO46Knizk7uCh1
         iarWWjehzy7a1cN8VVJxPWnU5RG8LNykGNlZcRZhih0XDwtAPNYO4AKmMEi2mnAP1Bmn
         x36FxVh4FGHVrRGHozQqblyeNaObu3gb6peQbemq1IiQE8TE+9nVMW5gtloBskeTiLYg
         4TtelZPSXBLs5AsZnSeXL42U+MfN6tlwI/ViHoIUZ4GrLQeEmtB1sPXXstBLHSw1zXj8
         8bZ/i3K7MludUcyHeWGjHpENHRRsBFRjFbQKcwlzz7sBX79Rxc4WKVyyR+LL89CgsJ2b
         xmMA==
X-Forwarded-Encrypted: i=1; AL+hErFLEzBS9bE02xJSukHiGliWfd0k32WlWh6Gsl7GaUnaPw5/MbHlQ7hYXRgjlqwUHc1fUCqsT4cbdyjAzJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CP9B9uKNMvfGdDPyuQZJMFq7qjE6ZHFQgp0QsgrNQ4E0sKyVk
	LKIS90sGnR8ct9Cl210pIgclzTNmY+KXq3HcemWMhxZ4yeRaRSqF6LSUBqP1NFgDLQmnWzJ0mlg
	kZP6hsQ==
X-Received: from pglf35.prod.google.com ([2002:a63:1023:0:b0:cd6:23e7:ad7a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7e0c:b0:3eb:7346:7662
 with SMTP id adf61e73a8af0-3f7a85d9db6mr1963054637.64.1794577871573; Fri, 13
 Nov 2026 05:51:11 -0800 (PST)
Date: Fri, 13 Nov 2026 05:47:08 -0800
In-Reply-To: <20261110203330.11789-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110203330.11789-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441798938.78395.321265981492593275.b4-ty@b4>
Subject: Re: [PATCH] KVM: selftests: Override memmove() to prevent "magic"
 references to memcpy()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, 10 Nov 2026 12:33:30 -0800, Sean Christopherson wrote:
> Override memmove() along with the other string operations to prevent the
> compiler from generating a reference to the built-in memcpy() when using
> musl as the libc with a static build, which utlimately results in an error
> during linking due to a duplicate memcpy symbol:
> 
>   ld.lld: error: duplicate symbol: memcpy
>   >>> defined at string_override.c:23 (lib/string_override.c:23)
>   >>>            $BUILD/build/selftests/c/lib/string_override.o:(memcpy)
>   >>> defined at memcpy.lo:(.text+0x0) in archive $BUILD/build/musl/lib/libc.a
>   clang: error: linker command failed with exit code 1 (use -v to see invocation)
>   make: *** [Makefile.kvm:382: $BUILD/build/selftests/c/demand_paging_test] Error 1
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[1/1] KVM: selftests: Override memmove() to prevent "magic" references to memcpy()
      https://github.com/kvm-x86/linux/commit/5a588219fe45

--
https://github.com/kvm-x86/linux/tree/next
