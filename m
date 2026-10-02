Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9ED3BB138
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975268; cv=none; b=MXxmLfO1VpKZ/ifGFbXaOwFiSCYvr+qFpDrB2q1ZLIsjEHq9/TTBrEtivmSOej2uH7m+D9tkGEp0lRpdMj/4/7OUHj5m7c9kb4d9fLwNJr1X9baSXfzQGFk+eZ3fkOyTyF/gVgMiD1i/WCp4CJ8UbwAFv7i654D8BtmiibUcJ7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975268; c=relaxed/simple;
	bh=Y8GDNbPyMgdEkV4CdxAFRFdT6Y8d1kGSN9nZzLCdeRg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lRYIMXOKN7HYgDJd+2VzviX4z89PYmtk3cJy9LmYZPP4gohl3pptfXOBntTVtMxoSsO7wWm/pS0x+bz6bWoL2mnfnLvJ3n/17PW4/aA9ifCdCT/IY/glz/v3QIqMwJ7p7ZFTtLfmmyJtXIuaBM9VmuibIYpmUPXiddVKToFgdt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z6+8P7TV; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z6+8P7TV"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso265229a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790975265; x=1791580065; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8PP44uGEZEb+7JewBj+EOqBPmGw0RZmzzcgLW1VRFHI=;
        b=Z6+8P7TVdEAvYVjSWO4sFBaRbLWEuvn0zh39wrjtEYAOpjgoZr/dAtA0TLUo4JgQYZ
         /26tK+xS/pd8j3gY7finwFKA3gJnT1ho0hM/qEHTh/qMamMhaWZg1Sffftu11I++4q7i
         ZVzrjk2UnBDhxzfPf35qbEQrOucqvLD4RGgOwvb92BTdLm1olZgbuF+aOvxjqperrasK
         zdO0+1jUveZwfVTlKU+K3adpk2aG3EO5ojxzR3EoWO/mIMvzYNpwXhvqRYLm9taACRa6
         aTUXMfdxAUTlGAtEmsZhjItOd7MSQX/wtLAoOHZu+WHrxYjqIMcA4As6BLl2abDDSYBs
         E85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975265; x=1791580065;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8PP44uGEZEb+7JewBj+EOqBPmGw0RZmzzcgLW1VRFHI=;
        b=ZnKELD7G5kJhkUmQ3868yKbhfK5QaIbtSJeI538U+am3DmngWloSNdV/ZPkiALivyZ
         WZMzet7lPOkTgM3KNW7awJnjTpuW7qmmr52Rktrvy7amCaFgRpTeNejY39TemU5Cfg2W
         tvFfjCtmPJYxpze4ybzxuUVT2JCX10/qU2Pno9ZmNmdhn7pWRuTND+wrvg9fv5IfF7EY
         QGHbWAZ8BooL9dSK4oaYtpvMVju++U3573Y7e74lDdeWvOi52lAKlBm5Qyx5IEYsMuOm
         NV7cZexsYdf7U3j8JlsrXt46LQYBByMrclXCr0p9/rLPUHj5jzSGKqz/Rs2ql3sFH8qj
         u4RA==
X-Forwarded-Encrypted: i=1; AKwUvBzh5BKTQxmx8l59i9Wp8Fme+xNDU5lsTMHiWXyLzYLOKQtQKB46WGk08a1fVdgWvnstHPK75t5WXofzc+U=@vger.kernel.org
X-Gm-Message-State: AFuF++kO2fBgHZDIlJIjqyN4qDcl05XG+Gkgu/xitXc03ZZvgtM8/Ksl
	+/d9TJ06PG2mAT3Ci1U/Lgu3XsgUmqbQytWRNUI3jH61kokJWzr0xukJXKFBtrOoPSquHYVJNam
	D2prz6g==
X-Received: from pgcv5.prod.google.com ([2002:a05:6a02:5305:b0:cc7:84e0:e066])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:918f:b0:3de:7c83:26cf
 with SMTP id adf61e73a8af0-3e0bd18f3f2mr4012633637.19.1790975264546; Fri, 02
 Oct 2026 14:07:44 -0700 (PDT)
Date: Fri,  2 Oct 2026 14:06:50 -0700
In-Reply-To: <20260920155453.10836-1-absandze@amazon.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260920155453.10836-1-absandze@amazon.de>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179097502083.4081947.8136908804673682436.b4-ty@b4>
Subject: Re: [PATCH v2] KVM: x86/pmu: Don't retry a counter whose config was rejected
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, 
	Luka Absandze <absandze@amazon.de>
Cc: sandipan.das@amd.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	dwmw2@infradead.org, kvm@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, 20 Sep 2026 15:54:53 +0000, Luka Absandze wrote:
> kvm_pmu_handle_event() re-arms the reprogram bit for every failed
> reprogram, on the assumption that the failure is transient and a later
> refresh will succeed.  That is true for contention, e.g. the -EBUSY from
> x86_reserve_hardware(), but not for a configuration the host PMU driver
> rejects outright.  A rejected config can never succeed on retry, so the
> counter is reprogrammed on every PMU refresh for as long as the guest
> leaves it enabled, and every attempt fails the same way.
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/1] KVM: x86/pmu: Don't retry a counter whose config was rejected
      https://github.com/kvm-x86/linux/commit/1c24893fdb4d

--
https://github.com/kvm-x86/linux/tree/next
