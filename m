Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577741;
	b=d9o/otJWP4wzsgPsdNKJOw5A7ebT+ZYO7dxYdTUtQh14f+DQdS6kVGeCl/pgujebNkfn
	 sDUj2mIaRY86VI15PQO0xTAWqb4IbcuzN51pGtb8KvMavdHZES5nhwE9VPQiBxknd9Y7M
	 9/dfkla7ombQMGv1cv+JCcrT5TpLMlQb5YnkIQy1NwA1ZGNFJ6EbRs1g36mj0pGwkZDG5
	 35nk2xJGtXynizF33UyKBqR8ECGp76XGEqOFcVmXvg5kASH8WklihjH1oGXuU1GCukgG3
	 /E1OgP/Cz5vuFrClmrHRp/NXMr0h+/S8F+fNnOmR5JUtQaeIaq4nULtQ461txONQYLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=nUA/XruHs1T2Tf0WpFoNgdHnIv/Lm/y++OYQw+7v6pc=;
	b=Sn8nK/MB2FvU8KH/scQDJIWlV0zKJL83CUe8ggfL4gemkUMfoPk5BI5+B58g1trI94IN
	 6+HpAqlTLvI1uN4j9C8ON2yAwGfUIfpqbn0o1nyJKb5lj6DFViMI7FMZc4QPmEy05nMIW
	 dBRf45wXOmkQDnsZ9TmH2NI7/bMIyGHFVH1CDXwcjXcf2d8I5zD4EnMef51ukgLuFz2S8
	 1U+ahPKoxjNuBSHYGM2IYX/I/z2xLMdI7/p8DpbopLMUyc9FyXTNMXzOVUK/oZxC4H9eS
	 MR7heKcKpi6X5jUfqrn9v+QlVti+1dHRpqEfaDQRygl8EneoY2wyP8vo+ElqyKc9cBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CBQ+FCKV;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B2160A260D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37B2160A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CBQ+FCKV
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b18741aaf8so1575193a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577739; x=1795182539; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUA/XruHs1T2Tf0WpFoNgdHnIv/Lm/y++OYQw+7v6pc=;
        b=CBQ+FCKVX7pyz+dQ5QKbM1hny+1ubSjujIi3qRVilyp/T0+yE1V8b9cVWf22zDenoC
         tjwuSSWg7a3QrAj8WecXcvHmgIRWj5X4qg3+BudzaHgS5l7FyC5gv9CPFyp+ww9oRyEt
         Za1LsSuXYb3w7AC1TcgQ8QR6wLhkDC1RLoic08ASNOYsKuNzstCDwkNVDld5k7y3hLkW
         zUD9eu1UQqI4u45bFgUefkvN65VbxrWK1Oj3ywn55s5q4lLyvq2v4GYjuBbWqK0xQ4x0
         +WuGtPMUGi4gy7/oFurNiG+xplmet7p0AGp1XFBMRPVjAv5OTaVMD410CTaqNXBq1olH
         hJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577739; x=1795182539;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nUA/XruHs1T2Tf0WpFoNgdHnIv/Lm/y++OYQw+7v6pc=;
        b=hghoAbcvQm9duujxmn5Xk1SRlP6vmoyFVts+s2df74DZkUyzjHg/0LzbJRJXlGItn2
         fc3PP7lW5mi6KOIOfNKbO16dRJqDaSdaXfMGzvDxherylhDSsNY+wqXDWEcAjsZr3+mn
         H1nvJr44pchiTSbJuDVQamYX9RCEGiy0SK+hMhVPp1hITxMbM/z5NBer6MW0OO19cJvO
         oB79Ck4pH5EexJXs3gcF00+4KRJaa7Cfhi0YVT4oT7ZvReepAf0okr6dLCKrAgbqodc2
         7IzkUhv7KAS6+g0DyePcYmAEIIgWVYYyiVjgjc3y5UYW6Gvy+iutRNftOID+6JeMcKYW
         8FJA==
X-Forwarded-Encrypted: i=1; AL+hErHY9iNw5FUO3zGGMrX5M5lak8AKuJZGmebvyo0zNreJl2h3TYyhb5tK8QeW2rZL1MERzr3Q9ALpA9c7rgQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LNma4kfzrHRsNJLT/sQo0FIF1yl8mubdb72hzj4pxf4+g3Rn7
	8N3CFoSw7VGVBwFz9qxTlfJDRf0x3D3TAgN/az/S+3t+L5IrMbzMlz6CeBvntI1DipDz5voybyI
	OaEAWeA==
X-Received: from pjyw22.prod.google.com ([2002:a17:90a:ea16:b0:3b0:9c59:c0e2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:35c6:b0:3ab:884b:65b4
 with SMTP id 98e67ed59e1d1-3b1b0d4332fmr2502747a91.59.1794577739394; Fri, 13
 Nov 2026 05:48:59 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:34 -0800
In-Reply-To: <20261022021349.296149-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022021349.296149-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441757932.74670.12537566702126454135.b4-ty@b4>
Subject: Re: [PATCH] KVM: Don't WARN on -EIO return from kvm_arch_vcpu_pre_fault_memory()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+db7bd0f41c2a7e82d4ba@syzkaller.appspotmail.com
Content-Type: text/plain; charset="utf-8"

On Wed, 21 Oct 2026 19:13:49 -0700, Sean Christopherson wrote:
> Drop the WARN on arch code returning -EIO when pre-faulting memory, as the
> WARN is user-triggerable and completely unwarranted.  In all likelihood,
> the WARN was added due to a misinterpretation of review feedback, and was
> overlooked in subsequent review rounds.
> 
> The WARN showed up in v5 of the original pre-faulting series without any
> real explanation.  v5 did add -EIO as a documented error code[1]:
> 
> [...]

Applied to kvm-x86 generic, thanks!

[1/1] KVM: Don't WARN on -EIO return from kvm_arch_vcpu_pre_fault_memory()
      https://github.com/kvm-x86/linux/commit/ed4d60b4ca23

--
https://github.com/kvm-x86/linux/tree/next
