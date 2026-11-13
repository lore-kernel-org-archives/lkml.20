Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577909;
	b=gchfXB4Xgsh9k372c0Gto84ultzSYuKJTIiw4pIPRVSt4IkmECCB5cO7P65l9ol9TC68
	 4qvrqXNKyLh+tlZLNsNeahQpBZqR5INTZmbHJEQcUqZCaArdWQzanrUHwzieT+ai6KC8s
	 miaZEPz8V7XmUvfSwawgOKNDcQjoQ29u8HQp3y2Img/AIOFtgixVd3gJozxQpjTN2aXWl
	 FpAWQUz4ZtR5fHE6HEEZYfKOCcKFfGmpgOZVcV5856/Uzh+sRLMzpcnx3mJw3BuztnUDZ
	 LsK6uFcVBD28jfNhQ51N1ec2WwFbLQOXMk0GzzMRAdRI129Qg84IVKJLLYyl/EH0e/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=42M757uFT5De2Shdc7fUSbsmEvk3UICXAJs/eiBakI4=;
	b=fI9zvYIzwLeM1zM6uQbcuPLuIzoymOZo8ck0AWK13vSLgPY8tbAAuRMADxOARqCXKztv
	 Ne4mpRtvDe5yAkfx7PN1MOhVCMstH15HqXfJ6UZeK7vMXzi8ztOoJhDqb2UnVANsT4dC/
	 nZVDYkkybTluX72mBD2GFzpOnnX7vE2/MDk2Tg4CUh3Zw608+w7wuX+/Bm5CvZfDMXbil
	 cPYjvaY2KDbGQTyQQRklQ+JcAUDj/HVOG71rrXhwmYX/ja6lzk1tGNrvlDrhdPwthFY38
	 Jpu2Y+t7jqWdhVBGTma0+sY2Vt5XiptngH+COtu0jz4aCnbo8GlXMIYrD7sOXN3PyMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iyYZiJ8j;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D66606CA33
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72D66606CA33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iyYZiJ8j
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so1451268a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577909; x=1795182709; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42M757uFT5De2Shdc7fUSbsmEvk3UICXAJs/eiBakI4=;
        b=iyYZiJ8jcqBngMg2gOjYjAHJu9i7i3NjGZ32sbMgw2U6zE9Iu4JJc/3fs1BBFmKBym
         TIuntcom/Sfh3JyDk3EnJT0Nbm27Ap95riyXzo/drUcLyTO8S5m98A8uJtl1bZzQGPSM
         9Av30/QYjoYn0k6MhIvN/VbYAOYYffw7NVxeSaMbjQhG1ac6zo1rX0NwtG2zyhB+mHpw
         sXOshidQuBG1WVI4U+H0YDdyXwwXcIN/dW7uwRtyt+rJHO7Xcl/os/JgVGXkqOhyCh2N
         qgTY+deikiW7hYpqnUNjhCwdNHqGSIB1l2KAdLJ/nTbmQJoQi4XMPIB0p6Z6IoZAUTSJ
         c4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577909; x=1795182709;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42M757uFT5De2Shdc7fUSbsmEvk3UICXAJs/eiBakI4=;
        b=v/x+Bb7p6Dw59MNJ8DzsuBDjzAht0nav2SlDWVBoW5Y1jWKAnmD1owSBHTXZ4SZByQ
         d7x+jQ1sMJZhYCgm0bcCVZ0qQwqTxlMWaJ/grzqOrGhubYVLozWyp4SoILqnNpq5SO89
         66jJLSTo4dmKh1qbFDproYqaURl1gqOJ7k2CRmpzZNEFypCuWS57L1y9OSoMo3EYOHbs
         i2OP7A/p/jROWhRGGkn6DvpUj3inhc6W9u69odB8JQKxMn6yxNw2w42Cz+yKzvddcniW
         46K36JHhKvvldIPihQuoIExB4kMWV0nOQJJB1gjKhCVAQ7cn3HmXEc1F4N8sg1U8aIli
         YMCw==
X-Forwarded-Encrypted: i=1; AL+hErF/ll6ZSW8/WKHb12wmQzIQdtdAUbkOAqEDKqyaNRVbfzHBZLHEP0sUAIludCsfs76sDGlFBUUWqL2c9kM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WilzYjXgegzi+cOjh+KhcYPGhDzoKtrYoMxNURrsZQdaogvQN
	8ZZEgXaso4MJJSIBoWGOrcehe4qjCryWxv4iCDk0inXm0GJZA5ju5YiJ8lkruRpc2kdSJ1KM0nx
	3yLyEcQ==
X-Received: from pjbse4.prod.google.com ([2002:a17:90b:5184:b0:3ad:c8d8:70c3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c2cf:b0:3ac:74b3:a8f3
 with SMTP id 98e67ed59e1d1-3b1b0ccec81mr2546508a91.44.1794577908610; Fri, 13
 Nov 2026 05:51:48 -0800 (PST)
Date: Fri, 13 Nov 2026 05:47:18 -0800
In-Reply-To: <20261030210321.3019901-1-jmattson@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030210321.3019901-1-jmattson@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441820842.80495.17224406535846671057.b4-ty@b4>
Subject: Re: [PATCH] KVM: SVM: Stub out MSR_VM_CR to return VM_CR.LOCK and
 ignore writes
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jim Mattson <jmattson@google.com>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Fri, 30 Oct 2026 14:03:21 -0700, Jim Mattson wrote:
> Commit 4a810181c8bc ("KVM: SVM: Implement emulation of vm_cr msr") added
> svm_set_vm_cr() and svm->nested.vm_cr_msr solely because Hyper-V wrote
> to MSR_VM_CR when running under nested SVM [1]. At the time, Avi Kivity
> noted that the MSR needed to be exposed to userspace for save/restore
> [2], but it was never added to KVM_GET_MSR_INDEX_LIST.
> 
> Moreover, KVM's emulation of MSR_VM_CR does not actually wire up any of
> its five defined bits (DPD, R_INIT, DIS_A20M, LOCK, SVMDIS) to their
> architectural behaviors (not even checking VM_CR.SVMDIS on writes to
> MSR_EFER), checks the wrong bit (SVMDIS instead of LOCK) when locking
> bits 4:3, and never resets vm_cr_msr on vCPU reset/INIT.
> 
> [...]

Applied to kvm-x86 svm, thanks!

[1/1] KVM: SVM: Stub out MSR_VM_CR to return VM_CR.LOCK and ignore writes
      https://github.com/kvm-x86/linux/commit/27ddbc70c82a

--
https://github.com/kvm-x86/linux/tree/next
