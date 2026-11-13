Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577717;
	b=B/TtespxbnMeO9wn25Lsy3QzNA1zpFjBzQhJiLk1qsrWles8YV8TC0iZWBHYbwpm9RXF
	 IDSCsCOp+WLLH1+I86/9UlXjOi0Ao9XHiDT74+sdx2UaU1PFeGM5FvaYqgPcnKo2Z+A0m
	 crlQiUwOt+KFWXe+MuEF/EfcKbxY5tFy1BVnz3BJydnH6xRsnUL5/THJWZFlpirFzLew0
	 HOkU0tH32IGH6jV+U77fdX48/SOyvc2aY2LvGZ55NEXBSs1bWB/1dXfBfMCffDNG2JnKm
	 Unmc1EnqHlSH+E8niLYktWZujUcKFCIIJZQMXmctun2w/pBWZKBMLPL6k78xi66jDag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=MRt/+n3qpNWP5atygjxku8RJqbtyvsNAOovAuzylIO8=;
	b=TfFaN5xfI3uKHIyNCMTEzTyszubuC+aGRk2rDmsXH8v2qJa8XhxYnD9VRVqBpWUlUA6k
	 GDJVROetyopujSerO5zN2UmqmWOH4pPq09RSCtrq2024v+lK6pkCqSDv3BuuluZGB1DCY
	 bQbc9JvDX4w8J7S9sSGfxkEca1J7Vkh+YlWJ7Y/uVbglYQL9gVcGmQ5aMiGnqcFel/+SE
	 bz7FN9egoTKPXOi0jROomJF8BXYijbTRZQjlur0AhVi/diDQ8epEla4qTVukJXKO1UnSt
	 BGuyFhOUu3CnwOTc5nvuLNt0+908pd1RDQrgCgFAcybJeBzb/BEa8Ax4XBzQ4bamOxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H7l3hkV9;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBD4606A339
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBBD4606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H7l3hkV9
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b17b31c3beso927430a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577716; x=1795182516; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MRt/+n3qpNWP5atygjxku8RJqbtyvsNAOovAuzylIO8=;
        b=H7l3hkV9qOW+6vyuUekiTht/VgeOUD9RY6ujvAaePTbWFCrkmneK+9URuCWnM4Idif
         nch2e3YuYB3HYE8YyaksiOy+sz+dPIgbz2pgiVFDHlKax3ow6perDCufFHfmW8b4vJc+
         81Lgwz4RGwV/C5+UsUDMJRAsEj1k/FdBFiL1HpUAWQnCSntqNX+L8s0MviUX1ZLfBTmb
         zO8HD1J4iQSnT12Uc9OvoZ7VZq8/DkBMzIgr+IqbUR+T6swRCGybzhPUoqSoDcGaym3l
         rEAqkj1YL4C4cFVzh1abOH6LXn7xq3Ql7P2pisU1h3t33RL1M/EAUhhGcxTC+zki18Su
         42Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577716; x=1795182516;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MRt/+n3qpNWP5atygjxku8RJqbtyvsNAOovAuzylIO8=;
        b=gRQT41PhppuGHtke2hg4iENv8LQB7MAhLDKO8xRMgrFx0uDHAG0MErH8mMrm6rW5Jm
         8ujhGWcm4pVBVShNpXb7xYaSSVLy7hHhFub11wqA90s7S+kcRVS0lH8flm3+fssI9vn+
         FEOhW8JvQ1a0OmYjNA1sn3HzIUXNi+UtlfTVZNvHrP9sZsh2QAHw0xtTWWWDZO4uREMy
         LnjPXfaTqvpTFURP2RWHethUDx7xTAc9PRXerYI7R8hIIfm+tOvTReOrVI+8cfwoKOFs
         Ptfe26Lt7sXeRahzvvZpRNNhebFJlymMqihfot+sGRd0hfkDcgTcDYTyHvNlj1rSnAWY
         vFyw==
X-Forwarded-Encrypted: i=1; AL+hErGuqfw68uXQQfiVnHvfW4jt5FEdluiEcNcuBeBrCU+9rnJ87WOe9qIRU58E2iHir4hWIo5vaYWzQWJnOdU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9t9UznO1kgfUq5VWBFXqBwu1CVjuBkKsgvhrDw8Zc+zWWMG1xH
	etwPZ5ilSfyl1rR+J+0qCkpSNCGVRb6WtAtDce0UeoxdpVguehEi+PZLWrvn156h1aDDMUCBOMO
	YbOyfvA==
X-Received: from pjzb15.prod.google.com ([2002:a17:90a:e38f:b0:3a6:d839:55d1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:49:b0:3ac:bfa7:b079
 with SMTP id 98e67ed59e1d1-3b1b081bbd8mr2314779a91.7.1794577716202; Fri, 13
 Nov 2026 05:48:36 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:26 -0800
In-Reply-To: <20261013195358.163375-1-yosry@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261013195358.163375-1-yosry@kernel.org>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441826991.81142.10798231327707439438.b4-ty@b4>
Subject: Re: [PATCH v2] KVM: SVM: Update tracked pCPU on pCPU switch
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Yosry Ahmed <yosry@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="utf-8"

On Tue, 13 Oct 2026 19:53:58 +0000, Yosry Ahmed wrote:
> When a pCPU switch is detected in pre_svm_run(), update the tracked pCPU
> and mark all fields dirty in both VMCBs (if nested is initialized), in
> addition to resetting the ASID generation in both VMCBs.
> 
> Commit bf260dc9e7b8 ("KVM: SVM: Trigger new ASID allocation in both
> VMCBs on pCPU switch") reset the ASID generation in both VMCBs on a pCPU
> switch, but only updated the tracked pCPU for the active VMCB to avoid
> unnecessarily dirtying the inactive VMCB. Leaving the inactive VMCB's
> tracked pCPU set to an old pCPU still allows an ASID allocated on one
> pCPU to be used on another:
> 
> [...]

Applied to kvm-x86 fixes, thanks!

[1/1] KVM: SVM: Update tracked pCPU on pCPU switch
      https://github.com/kvm-x86/linux/commit/d41766c45065

--
https://github.com/kvm-x86/linux/tree/next
