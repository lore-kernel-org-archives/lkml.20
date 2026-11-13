Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577950;
	b=YHhiswxpLTgTD9TP28mSBCNQjEPITN3E7NmRu4lTYPhAww24UVbAFgPNtkZCR4BSIoXx
	 5vRqw9CCAc70hl6eALtIE0+YdcM8QNbas5upciOEHUbGc5tiTKkc3RNnFj7mA51wV681K
	 zqB/HFSj8Sec2ZWcSYpbkl17QY5HJUtDn95Sis99G/0f8+eZMcbgylo01YEChX/UWVFeR
	 x2RQ3OxzhbZqF2rEf0AooJ0+66Wk6r2OTJFKF6rXdv3PoBi2tEUF+0YNgb7dmPQ+t7xIj
	 qe70GROQw3lxL/UIyQUdOkfeoNJQTP5ZvUBRR9hZLR90U1iM05w6Ho8/k2vlOsgl21A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=xtZVoHEKjEslNffaWu4f1H6eNQjIy/ggQUU7slMQKbg=;
	b=vSN3tAASIMgCLeIwZMP0b4XXvJRKCU6R3npRdad9NIzEEhYrdcb56NCL19ZFe0dI8SNr
	 7cO+52E50jXjLIDKZd1S+IdEUheganbXE9+9RYmx3oz0UOswEytZzUtAyf7LnHpddZsw/
	 Z4QZ0hv6ANAErQBxsBFE4vsKoToYkI775K+5EnpQuedc8sgNkpPlj91cVSkYW7Jh9UDTA
	 HfQiWw2m3M3POnzhnaSCnAz/kQyLPSeb6KZzskSYz4R75BgZ1ezoyl23DaKyiktZGpIEg
	 Y4szlG0s0/smOCMgD3A7M7jajBx7SrihxPD2vg3R5HqkwSC948iLwoA2olrMiEYiWjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cARDeU5p;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C104560A6F63
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C104560A6F63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cARDeU5p
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdd9fa2a558so1166564a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577949; x=1795182749; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xtZVoHEKjEslNffaWu4f1H6eNQjIy/ggQUU7slMQKbg=;
        b=cARDeU5pPDR0f1GuGIRmOidvzxc+RWryLR2z5+yoXbGKJ8jqdQ4HhCiKy2XsYrAPAd
         BOFgI/aoKvqUhh1NkF9UGwiHSCej5AcTpo/oiWyRiGzqekjGqsmMlacKYXC+Rmuyz9l9
         BNwgYVy/9+ohY5lvsJf18fzwH72vjgcoOmNKHmkv9zGd+N/iVQRvf78AO9pu+C98nMwJ
         Sj+4X3NXY1q06CyDoWrGh6Ql8UjF/XVTRDe8uyYcU761Qh1izkVDXP4doKKfjzeLtf4c
         KTHwO+H3U//rgkl7UJ6eXDdqZfRRVGvj+zA8R57zBBengjD/tD1wRXKJutXtZMw0UPUB
         ugMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577949; x=1795182749;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtZVoHEKjEslNffaWu4f1H6eNQjIy/ggQUU7slMQKbg=;
        b=fSPksOMLt9m+BwH+RrnmiYogEcfM1dfUqyPzZqUXKBiH2TpLxOwz2rO7Xy8/XXU6bh
         hGmdv+XakA3lxoi6SYQ+fbru8cnY0zW+6ov7I4l/+hz69fy8Z7Gjr4ddnSAkZP4fxEjv
         zqRguZWXkwPvSjATK2maUmENQvsWX7HCwkuaCZpf6CdApHpvFXIoKScOntfUEnSrxmts
         PSC07aqH7Hw5cncCvh5Fju+e+ZGylVBbEOGGf+Frj1SzUfhek+r+Yc+WnqRXd4Ot5n91
         unR3rO5KKcMfvHH5+7p3ZlEB6ut7FDucjyWQhtHXob/QQGCXLwCnM9L5YU8IorQP/Z9e
         Q0LQ==
X-Forwarded-Encrypted: i=1; AL+hErHF7LQgzRNmQYFUSq0LHx6/u4kBZTTiTaKxGGaGxtG5shNNDjzhT+a9l4u0uvCQ5FmDLD8ymnTkk+t6vh4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ENWR5CCH5ycLxUoFSfJqCHgLXQkvXAmDszk9UZUoFNarcw6sy
	VTK4Blt5IzXv05E7pfpLQQ7+uihQjrrh92Fss4J8TjQX/PD7kT+cJBnj1j0GUMta8ImHSedlw9K
	vgsgRKg==
X-Received: from pgdo15-n2.prod.google.com ([2002:a05:6a02:620f:20b0:cdd:bfcd:be0a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2590:b0:3a4:bd4e:6d15
 with SMTP id 98e67ed59e1d1-3b1b0a1080dmr2150084a91.34.1794577948910; Fri, 13
 Nov 2026 05:52:28 -0800 (PST)
Date: Fri, 13 Nov 2026 05:47:31 -0800
In-Reply-To: <20261022190530.541789-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022190530.541789-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441774252.75937.12953036689423091599.b4-ty@b4>
Subject: Re: [PATCH 0/2] KVM: VMX: Clear vmx->fail on exit to userspace
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot@google.com
Content-Type: text/plain; charset="utf-8"

On Thu, 22 Oct 2026 12:05:28 -0700, Sean Christopherson wrote:
> Clear vmx->fail before exiting to userspace to report a failed VM-Entry to
> fix a splat triggered by syzkaller where the stale vmx->fail confuses the
> force nested VM-Exit flow.  Found on a Google-internal kernel, but the
> reproducer (will attach) works on upstream (but only on CPUs without CET,
> because it generates a VM-Fail by injecting #UD with an error code).
> 
> Sean Christopherson (2):
>   KVM: VMX: Clear vmx->fail before exiting to userspace on failed
>     VM-Enter
>   KVM: VMX: Dedup VM-Enter error handling for VM-Fail and VM-Exit
> 
> [...]

Applied to kvm-x86 vmx, thanks!

[1/2] KVM: VMX: Clear vmx->fail before exiting to userspace on failed VM-Enter
      https://github.com/kvm-x86/linux/commit/40c0e9dd6b6d
[2/2] KVM: VMX: Dedup VM-Enter error handling for VM-Fail and VM-Exit
      https://github.com/kvm-x86/linux/commit/df070e4616e7

--
https://github.com/kvm-x86/linux/tree/next
