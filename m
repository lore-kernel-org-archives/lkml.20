Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2BE35C6B2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286868; cv=none; b=L7uK9taOhaHen81uP0zxzMyxK4dAbb9ZrsxVRnDAXPYmUVqllQMFtJ86ryBi6OwpcNJf/HJKwToqiu/GGrrwrlSjPYXo+nuA/aM8koov6OzExqJMtj027uQfad58qdfnowOiU9oOeqpqdO6d0grx4fFbyDZSgiP29EZ0xtUZBJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286868; c=relaxed/simple;
	bh=K/LIHyiYa5gID+5jEsxZuhFyjO7rvUwqI7ZTaB8OIBo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sYVaWH1p1rmN3IpKs09phzGgv9QF7Zw3f3qm5N878E99BuAusc+ft3Y4AHtzg4efZi+gidqegsOhQLl8f8Y+7uFY2MdKW9ctxVKJVNoP8er9CSOUQQld7NjOX1UuWc1x7vrEMxWWR45Or9D8dgwYy5v3Ihkx+giDFUUBN8bUp+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rxQaQub3; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rxQaQub3"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso122794a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790286867; x=1790891667; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SQ/usSA1tKKAOs+40+4Ubs2RZtDv59Vb7xFxUDV6QEU=;
        b=rxQaQub3iwMbsTXUwk6tRJ4UjpNa3yE3a6PzUgyee7tp5YCXyRR6LsUrOG0oE1Nlo+
         /0+GW0X81J/SD7aQXNcB47FTLO624XPfjvjVeibZFp1fINT6zI+DGgP3o+cTp5pd7kKF
         pr2ekLHTVfdNHe+Gsf5yWMUuD4R/s6nq5BmpRf31oare9QDL0vYO7PtRPpDN643NHB+d
         5TX+e+w81LBxciFxKoVZCj8gfk6CB58o7h0bxRyWvk+09XQV0tLwP2gyqt0TRf1NqgZe
         tDg1WhVMbffEVtSNn/Gkl83tCXQwMnzQJ7pRFzolk+VRnGjDSquku/Qo/GXRl4I0DOp1
         eHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286867; x=1790891667;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SQ/usSA1tKKAOs+40+4Ubs2RZtDv59Vb7xFxUDV6QEU=;
        b=N0tWPyPti3fJAGt/gU211skmzTjaF2Wr4PxIl7dabW4P3r9CcjBZOVOrpr9N380N3S
         +4WeOZTvbOUatmfdImQcQYFPyMoHU/hS3826EFQ3k+wk/WpaXuuPTHNuDRd/py4jBqhR
         MrxZIP4I+9PU9sFCMqOaXhRV+dNVvRyDPjNbwHZVKJTls1IxtGCAa/jfi7I4MEKn7FXY
         eHprsKcorkErrQ0zN17+bW2poTNk0lR7NQkuLJ0fLNamz2J6BYmPFenm1p3AAbe1s+53
         l8mb5eumopQKUX6XqOwwmqTyb0MRfrtx4ng5LmY3mKacX9lslTUUrwiuwhyxpHxNJbmU
         L/BA==
X-Forwarded-Encrypted: i=1; AKwUvBxXPUtw0evywY5noM0WXq6vmoJndR4uTwHT3ECi0i3CwoAjCFAR1+2wK+g4KWoHnhz8RPX0Um3Q7S4Nav4=@vger.kernel.org
X-Gm-Message-State: AFuF++ka0nitKW23aFrWrJhRbs6pxJJg3CbW+ZtLvg4w4G72ITSmdNaL
	JsYFfuqwGSZcDWIXjPrett0AtCrZn74KME/Lw2y6szN9msN3r2DSKcMI6u5VXrOvrvablLSbkTh
	a+AXWPA==
X-Received: from pgbfq21.prod.google.com ([2002:a05:6a02:2995:b0:c88:e5cb:265])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2d07:b0:3dd:a195:dd57
 with SMTP id adf61e73a8af0-3de0e933c4fmr3612027637.57.1790286866556; Thu, 24
 Sep 2026 14:54:26 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:51:57 -0700
In-Reply-To: <20260901-gmem-unbind-fix-v2-1-12febe1d2216@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901-gmem-unbind-fix-v2-1-12febe1d2216@amd.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179028369935.2007941.14069102369239125063.b4-ty@b4>
Subject: Re: [PATCH v2] KVM: guest_memfd: take the invalidate lock when
 unbinding a dying file
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	David Hildenbrand <david@kernel.org>, Shivank Garg <shivankg@amd.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Tue, 01 Sep 2026 07:20:38 +0000, Shivank Garg wrote:
> kvm_gmem_unbind() takes mapping->invalidate_lock only if the
> get_file_active() succeeds. When the guest_memfd file is dying, its
> reference count is already zero so get_file_active fails and the binding
> is removed without holding the invalidate lock.
> 
> kvm_gmem_invalidate_{start,end}() checks f->bindings independently to
> decide whether to begin or end KVM MMU invalidation. So, the bindings
> must therefore remain stable between the two calls. Otherwise, unbind
> can remove a binding after start increments mmu_invalidate_in_progress,
> but before end finds the binding and decrements it.
> Example, unbind race with memory failure:
> 
> [...]

Applied to kvm-x86 coco, thanks!

[1/1] KVM: guest_memfd: take the invalidate lock when unbinding a dying file
      https://github.com/kvm-x86/linux/commit/0ee2c883b62d

--
https://github.com/kvm-x86/linux/tree/next
