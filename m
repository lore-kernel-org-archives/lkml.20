Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29204A43E5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999646; cv=none; b=Ht8sDHVfKORiL/UODkiz+4MT0p/WogpWvJsiZ12o2LEzM4d6xGmFIFmQKdnqJgLmSvbr5a5kLtltbHX2IULD6LDnZn87RNJZhXDOGr+sheDZ/5t9ZZgKfFM0Isy8QWEj0QKEC0hGQvnzdPWy2eZXOfj+MPLFTQaryCmgfAl7qZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999646; c=relaxed/simple;
	bh=aVY+77+Rg4LdrLfAH6xlK0pN+kCKSnGa0twjylLa7m4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=noyNiQkQ/FTN0+JpCuOTWBQ1hxfKORUdk7EqxBNuxU6CjqqmN3sonqQIlZ9EjIkrRgOk3Xt9dfsJBkcnRAlDzY87M734IhkcSooVJGL4059pH0cOcALulSjZq57T7xFo2qiqW35R5qmNIlRaXqIikRFDyZSojDJ+oCkLcA3TPc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d36U9OqE; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d36U9OqE"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86fa6b15ed3so4399499b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999644; x=1790604444; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7kVfEuUUuG5RNBx6vZsXAqf4DhBGNyoOU9tZbLc/gs=;
        b=d36U9OqEy5t1YSBG3G0wsA04D9U97Fvp344kSMe9WPaXa1qeOiup1nBk7QMtYIe4my
         59Duy4/P+j6qra4KJQypPXj4jtrzjJndcbwzKxZ5f5HNDOJ+TCuNgwJvIuIVIlijEEHx
         uviGmzzRcXLKLrFEMe4WBSXUqrUDwzq1qNjDHFsEF9ycwor9ix5OLAaqZW/Yca9Spqkf
         COzdtAMyYKn5XGwJkOBe2mOPOzLs77snnJWUD4fZs6ltlvL8Esmfj3D5WU0jOLaLlukh
         L7kP0lYBS7N7rXvfXAzazoyPk2yfRyQ3ceN+ET5zG8s1GQPp0KO1MgoSJVjBKi/O630R
         BVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999644; x=1790604444;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H7kVfEuUUuG5RNBx6vZsXAqf4DhBGNyoOU9tZbLc/gs=;
        b=ixFWHJKuSHIUwL8D18XfQZFUwpxkfsFOc80zRkIKS/tDglouJuJwhWr3XffR4leekb
         Oo0rDtkChX70Mf7takJ/vY0cK4JJ6s/YSu+SCItJs4XRbj1rRaPNyQTUVR/CfQF5287n
         GVTQYiopIsnrfN1XH+SDXiBOmnuXChliwM+KgxKtmPIhzq/2h8CdrHRY+QK5f4qgqlp/
         M4egNN7D24sI1H02lFO0ys3tKz8bP6BEwaZNsNH5eQB6zii0ChVgGDm5k3vVSerzieW/
         lIiNC2JZOKG96WpSD6Ry0NoUdqNBSfSRHvaBxry8VrfM+23R2EwX1cx7+vi57tJWRiFM
         Mjmw==
X-Forwarded-Encrypted: i=1; AKwUvByXkug+qbLtHG7cyMA8ydUl9Hqu8XlZjMbxgzu+R4w0utP2UmD01Q+MUS1M3IY7dxl78kjhBm/0Ro+6aT4=@vger.kernel.org
X-Gm-Message-State: AFuF++nk4rqjLV7YTbws0z9FrUGXzNXfwMu1UkghuE8nn3cOrzYsgyRh
	b0hQ6Bzfw2rqerTrYNxs9shCkFffcGCPbTYTfmYwjz6yGW7QF/CAUkU26pDAm6bLhYlRHEe0Ghh
	HORPk+A==
X-Received: from pfst21.prod.google.com ([2002:aa7:8f95:0:b0:87b:300f:fd01])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:8883:0:b0:84e:d5e6:a085
 with SMTP id d2e1a72fcca58-874d84a92bemr15148212b3a.0.1789999643931; Mon, 21
 Sep 2026 07:07:23 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:32 -0700
In-Reply-To: <20260811050029.530698-1-gokul02k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260811050029.530698-1-gokul02k@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999927029.754512.6741483404933166279.b4-ty@google.com>
Subject: Re: [PATCH v2 0/2] KVM: selftests: Fix two VMs leaked on early returns
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Gokul K <gokul02k@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, 11 Aug 2026 10:30:27 +0530, Gokul K wrote:
> Two x86 selftests create a VM and then take an early return that skips the
> kvm_vm_free() at the end of the function.  Both now jump to that existing
> cleanup instead.
> 
> Patch 1 is the plain-SEV path of sev_smoke_test(), which returns straight
> out of the UCALL_DONE case instead of leaving the loop.  The SEV-ES path
> next to it breaks out and frees correctly.
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[1/2] KVM: selftests: Free the VM when the SEV smoke test's guest completes
      https://github.com/kvm-x86/linux/commit/434c50e703c5
[2/2] KVM: selftests: Free the VM when NX hugepage disabling is denied
      https://github.com/kvm-x86/linux/commit/ebb702707896

--
https://github.com/kvm-x86/linux/tree/next
