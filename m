Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012E03B83E8
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286821; cv=none; b=aJiJm8X6pTFH50DGh5zfdMUSc3qXVV6s73Hzv45hEOW0v+0GudNLgWtzqUcQkMUypGTQDJ4DrCo65hkGFPdzO4BOzRMbcYdI5kBqLGgAD0eqa52Y/pqPQBRFD0hrw5hGHUa7L1O0iXT4MUXtuGQbWP2JpiE7BVGboI9zdA6gokI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286821; c=relaxed/simple;
	bh=TIp+gIIdLq4cktELq+hOpwoqupHiH3XvzAWI33S58iY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ezXX/elNkJ/ViHVNpm1HY7HYQlJMNu7Sg37Ra0K7xMuygNSTWL8otHkYHeUAwbwdfjFSdofn9jtz+kUjKkzicblBLvg6ZxnBYjJ7CzTLzG0SUtoCEC9/CKXrQOPHdkJErem/3Ci8O7/7IzC44gevuMrp6IWt1KLV0kG5fFfga0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vRhgWsZC; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vRhgWsZC"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df8484f12cso1764515ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790286819; x=1790891619; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Btaghd/Mv+1f+gI69Pd/U/027XFnS34zNCKX9stSM6A=;
        b=vRhgWsZCULQspL3VOACTDa+IkoSPtgY7S6rZ3XRl/btt/7++ngSVq7oLtVZPpokpxm
         iaW1QE1Tn1aRVvqX2XFNKe2KrJDyZguLuPwZXsjR34w3NXvkrHcBxYCBsnfa8vVBbJNC
         E8IVvkIaAxuac1nPwHZpk3dSAH3Ftapm18I2ntZC0Ms2D6HGjFlY0FFMKyCtV68K68ll
         ia+/v81A7D7JoiVlaSwZYZu9aaC8SJeYDEFJQLDgELcpEDEuikzZIapchGa+AoL1bpR3
         nyjkp5V0A3Sq2baUhRoq0mx7osLZR9ZuAUJySeJRDF1vOBfwlIf9GpS3F9CuOQ1gTUg1
         CWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286819; x=1790891619;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Btaghd/Mv+1f+gI69Pd/U/027XFnS34zNCKX9stSM6A=;
        b=E6nCSmQ40sstgsISxnTmhw0WlN3Zqw5Adb+n7DJgo16FuCYyvLS+Ju+ASo1dbO4/rN
         Qqfliwk6Ya5o+n0tY5h2uzmI6b/ZoIIHs2W0I8I38T43WkSDC1uUnElicDRtl5Mf4WSD
         iVGRlYGww4QktrcovtEbDXB32wKpQy/sQggcqgsUmyuWeZ3TuvhgfTKV+NuHLagI3WyH
         wEwlbHCgIq8xz594s5AaZnMJy5SQcVlgV1wGrqUlMeFD5tbtDJJbDJEPenhNjjFczQlR
         u+THd2UgfCMCp6/5aRy/uiYjnMkjiSLUF/in91v/wxi7/xRuEoyhzc8FBb3Jrxex7Qbk
         lk7w==
X-Forwarded-Encrypted: i=1; AKwUvBy1CLK3+io/frZnB5L/3aXoMZ4U4WOI/xfPFQgi5AV5f1Tuky6qdboCsgUjcEyE581BCPGeJcwR6ylc27E=@vger.kernel.org
X-Gm-Message-State: AFuF++lMyEYR4Qi57TWKBz8ffACOFgDLBz49cxhmiD3POwYk03VGm2f6
	7QUP+UvDl1lEkmxtDj2aml5HOn/mx5ywLzF2eykGsFeVss1ug1+fNErtJ1s5yuEe3VdPiVh+hDA
	VPX0xow==
X-Received: from plss20.prod.google.com ([2002:a17:902:c654:b0:2dd:a9d1:e5af])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:26d0:b0:2db:257c:9fd5
 with SMTP id d9443c01a7336-2df7dc2a162mr30302595ad.16.1790286819065; Thu, 24
 Sep 2026 14:53:39 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:51:53 -0700
In-Reply-To: <20260826165647.769231-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826165647.769231-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179028369147.2007668.960049765709883203.b4-ty@b4>
Subject: Re: [PATCH v2] KVM: guest_memfd: Elaborate on how release() vs.
 get_pfn() is safe against UAF
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="utf-8"

On Wed, 26 Aug 2026 09:56:47 -0700, Sean Christopherson wrote:
> Add more context and information to the comment in kvm_gmem_release() that
> explains why there's no synchronization on RCU _or_ kvm->srcu.  Point (b)
> from commit 67b43038ce14 ("KVM: guest_memfd: Remove RCU-protected attribute
> from slot->gmem.file")
> 
>       b) kvm->srcu ensures that kvm_gmem_unbind() and freeing of a memslot
>          occur after the memslot is no longer visible to kvm_gmem_get_pfn().
> 
> [...]

Applied to kvm-x86 coco.  I'll follow-up with another cleanup for get_pfn() at
some point.  Thanks!

[1/1] KVM: guest_memfd: Elaborate on how release() vs. get_pfn() is safe against UAF
      https://github.com/kvm-x86/linux/commit/53c34396c19e

--
https://github.com/kvm-x86/linux/tree/next
