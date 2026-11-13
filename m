Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577964;
	b=jF/mdrj8L62V08uDND/kQM7n2r3DbmyPc+tLucAAzS4UkEXuKiUutLelSu6QPAOjTxlS
	 6Ox7JDO+fEwuykj7zuz4g3F73TQqeM7H275XgbZW8q/aScC844TXImSbyAItJJJrzF7Y8
	 mm9PEhIFd/nS6otOVZkxM3ChK9tsU2hll5E65vAyCd1VeLQUF8FBxI3TAJzTP0CuXdjsZ
	 7KLdZZwpHchN2Z4XBOu9T9aL6GcVhkOAJxcVQL9M9DILkG4B494J/eB8xDdQwb+cbaGLH
	 pd16S8W6mvxXweJ1k00W/X99PCGBUs0xb+YU970GDK2ab6pzt6U1U6Efpf5SUCwbNrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=xpuK5nOfiHWiGjl4bvVG9J9UfJEXUtj8MkaFIMn+oTI=;
	b=uPzBs60HLi6eqb5wFlvj/ewZrESxWRVQsVcmsCSGXk+0og1t9hZEsuHEHFmUf9YBSw2q
	 go8YSINI14YQqEo1FqpUjBKew6IYFEYlf4xA7yD2OgnH+jsNB1FXAcIf3ECvOQCSe6yeI
	 vINdP+G3WCX5HtZgjyG0CxZKu0mcsTzkL0oFaAUHa9SQFgvrfPGsgtPYeGZb3Cl5e0AQ+
	 Dlyh2AKdmO8mS5uhwYDluYpgtFwnLVV6AViH6TiFt1EiiHJD73wQbJQOJmXJt3C9Xc35b
	 oumvD29OdrjNrRto6z+Slar+hGvBaiLZilVMmUXf6Zm3qz8g9Q21Y+NkyoiV81v8mbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o5EeEkb8;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A977C606E0ED
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A977C606E0ED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o5EeEkb8
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b69b8c6dd5so1465105b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577963; x=1795182763; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpuK5nOfiHWiGjl4bvVG9J9UfJEXUtj8MkaFIMn+oTI=;
        b=o5EeEkb8onlHxOn5Z4RoNud0FrJD/RiS3hA5MaTQnaSfU6kax4thFsUU9WkMTe0Ipy
         VfHQgeeyOryj1dpSbqEsU16sJM+IAULrxH35NYq63NBC9QVxrl78Z/OGXUMacPPRllpr
         jlxQvuriElKyAz5Rf39CIQMgeMw4p30nBMpp8GkR23xj9zZf0Cyqr3mmulDVezCd+0Ef
         YzihWnqYvWVk2wLsm3nPXePAlSPlIiL3ub4JLPcq+3jTCkFdD707DgCCcrspVaiwITpC
         dyGNQDiVVszr2zn8T5FDV+U2DL+QCkb15d4OzZPxZEp1mPCMZAFQHWmqz9Y5/XZ6bs20
         yvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577963; x=1795182763;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xpuK5nOfiHWiGjl4bvVG9J9UfJEXUtj8MkaFIMn+oTI=;
        b=yIFcM9nIZh1A+gE+ceE2gePar93wNAm2iOIQ9u3TXZlFXSXqigLaru4jxaWKE1JmFt
         K6XR6TvuEfKBG+/eplDbJIVwWNw2pakrRZAdLRf/34Z9B53Mw6cJyXg1EdnW8MswxDft
         Qquddm8w2LLLO8TuzkLvJXa/MUXLFMuxyaW87Zjo684NVMMxf6Wp37twyfkXUnCKMbGN
         Wv3RzMlXFtnmHFFL+TV4CimbvtwDNRkvEdpLuK/lRYH1FHSnW0kfUDZv5NvRZNGs2jeY
         wdoJgPhgMYZxYAAIFsIeBqI8JCLFbaVzQ7poyDvoHwnlAPQuKEwUPV++bD1JlvcLevrT
         QARg==
X-Forwarded-Encrypted: i=1; AL+hErH8PzimMBbVPvLStYlfI7mBr/HyC65bgkz5ZetKak+Hd6nLbeh1Aa9jb8pbfsCZcWGG8bOJem4TDjn7dhI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q7W9XQTFuDYfaj3Gfc9BfHf7vVqpzutb4GdDfUyPPdlwGw5u3
	o/tjoUzcxp+kUt5gAZtJkSW+iYtJj2S2xrb+ol1P643n30s3F+BvLw1HEvn1BhmRl5yhue6bwqq
	qmMwL1Q==
X-Received: from pfej23.prod.google.com ([2002:aa7:8d17:0:b0:891:63bf:32])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:bc04:b0:893:8a6:3801
 with SMTP id d2e1a72fcca58-8beb6a763bcmr3065371b3a.24.1794577962615; Fri, 13
 Nov 2026 05:52:42 -0800 (PST)
Date: Fri, 13 Nov 2026 05:47:37 -0800
In-Reply-To: <20261105190733.3741959-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105190733.3741959-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441816119.79635.11581719704964945613.b4-ty@b4>
Subject: Re: [PATCH v2 0/2] KVM: nVMX: eVMCS consistency check fixes
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Manuel Andreas <manuel.andreas@tum.de>
Content-Type: text/plain; charset="utf-8"

On Thu, 05 Nov 2026 11:07:31 -0800, Sean Christopherson wrote:
> Fix two benign-for-real-guests bugs where KVM incorrectly performs eVMCS
> consistency checks on VMCS fields that are supposed to be ignored.
> 
> v2: Properly guard the checks instead of simply deleting the WARN.
> 
> v1: https://lore.kernel.org/all/f1f39118-2e1b-476b-9a84-ef7d56412bdc@tum.de
> 
> [...]

Applied to kvm-x86 vmx, thanks!

[1/2] KVM: nVMX: Do eVMCS consistency check on secondary controls iff they're enable
      https://github.com/kvm-x86/linux/commit/2e38263fc354
[2/2] KVM: nVMX: Do eVMCS consistency check on VMFUNC controls iff they're enable
      https://github.com/kvm-x86/linux/commit/a90bf96f3646

--
https://github.com/kvm-x86/linux/tree/next
