Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484088;
	b=tgbhSu7w9gP9kpK+J55tBwqX7EV6VLl1PSapntXE9+MdhenGyQs/0zFUzo1AjeUdyYsD
	 xY7Ut/KFu08VRf041gu4XlCFA8ZQs6FxmDHz9swj0aeaOeYJIqMOZKh2OEvP5a5pDkANt
	 u4aZToZApRr6stWoG1Orh9fujh17f/pgPY+oYLFa2n7pxD8ySGc00rYzfVY22yme+oYo8
	 QKW91waypY5ySVGa70oO/Tfg9Hh/qC2i2Idb3ehxluwmmGvpGtOKJdCbwmBG4RqrE3wok
	 3PMgsuufa+BpIv9CeYWInsCzIh/5wsX6tOhZ9wooeAbpPaC+ZW55vuPq15M99G+urkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484088;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=DUppi7wmCC07SfVICm9l2NXXwmr7ZReAVb6VJt0FJrU=;
	b=jrmSuWindZdaG0bCGCgVgdPw4pWPvnscZlyvtnfNo4ZhIBckpo4qX7pm/BjJuvcS9Dex
	 e3wJZCzez2BzqFbea4Z8IslJu+yHcJ04ssLReMjNWQw6+nPp/v5yvoAtzYTGnZLFVHRsu
	 thoIEe/aBVHPf751H2MfWw5Kw3qE/8pCKfeADOwr3XvCO64HLKORZ/Y9mFAKyelCh1E4R
	 jHQ3FUeczV5NC0Uo3lApTlKKQfMVIHF9geltPV9hopWvGkRSzMCtQl2YPnzfR9nBHJMlQ
	 cMRjWf0Ew42dnE7+Po19hi0ugS9J3zg30U3PjGYFrj/jT7WCB5UJhqaDgDO69g5kQbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=pereq.eu;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6BF606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE6BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a208d93758so44546145e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:48:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484086; x=1795088886;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUppi7wmCC07SfVICm9l2NXXwmr7ZReAVb6VJt0FJrU=;
        b=koLPCYxxpuxN28CzwpBoFkEjXl5FZxAFv26aYqmO8B8WIm3xw+AY1qLLQAPnMjA0jb
         KbHQLsbiq4qX7tzszoG/WJXdiDjpBCzWsqazVH+NTf8e53d4i367guVvMTuAoEB3x1mU
         pq8FQdYDDWTckzLJr9G7kezb+SEM6E0CZwlcz27hE+B3fJ3CQiUipjc1ZsieCjPZfocR
         2wF1GlZM1Ml31FFfX9Mv7+iX3aVeWdkUPI6LJ6PrrGyHX3ptuBZCim9XGRGzyjdsQp41
         AG40Di1rsa1/2Fl21lXHmntnCCELzWnm40GgwVVRNGxzuz7gFFLy9TIFhCL6Nub9XdQ2
         dG+w==
X-Forwarded-Encrypted: i=1; AL+hErE+QkP3VaH1gezwJhw33pDRhC76manarOCj2bP17BvNSQulGRzXLp8jKOtSahMptHXj5dLDgR8vTgTejV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4yhwqevDfGru3T9ACrd7LQ3v934rN4UtRJKkQ6v/FTpih9fIN
	yxWNhUuYozwAbyaIhFQJ99vfiy3dBOPK2wlVdavqNJS1GDWbNkfdf6WV
X-Gm-Gg: AYBFou1il4cVmZ0lFEko7tN1PJgMSmHfCmy4ZXY9c2EPCr/qz9vtFSjil9suudEqJRx
	4JFOO/ySOBgajDp3Go7TRr2WiwiuqnBdPGJaHuzdW9KtTudcCsJV3FK5TEus/3U8yVHbUSCLPyF
	zqj9iCxC3gG+mr/Ob6mden2gVAneyEaOER0wmcG+CR5yZP6KWpXpQsDFM75Cl1gVJCQmMGIKfFc
	xGHVfm/eC2FX5cJfQMjZCqyVLNFvMHlQw76gfuS2CPNuLPGKk8+vicvU0cqXbyAAuJegpwJxzFG
	CMdxfhee0FLxS/RODmGtPxvDm8NjUvJyhdNHRecy9zsBl6O6sD5guUpUM4Z+oBuedCmcUlV4/EE
	GhE0+yrGi7hs9cN7T/ZA/AE3G4/FwpyaKMtU7vi5ZbhTqH+Z8+6g+TnSTMirNnkA7XEFg45+Kui
	X4XPurv310R1ww0CA0unYxyrvoWmZWmdiFk5BQ8cMzXi2Ckn7kq76gSnE3DiEYUkTOtTzZogyEG
	QUoJbcQBWfS8W9DerF18dOvpZlIiE5ze/+g8XchMA7SYtRSb8iW/GKRNIlU2vCQ0QOD6KtADqOr
	OCwTqAOAmbc1Ki8PIFm0fcppdEZpdXHAwjGpxp651fPqA5bOL3Kforb1t1/ZT/wl9Yz89Ivf9vf
	bKl0dVaADr1Uq5Hrtl22OZt+GhS0h5scj9RrLddK1AF/bd5dV+pi45UR2XZh5
X-Received: by 2002:a05:600c:a4d:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4ba0938e39emr104253715e9.29.1794484086102;
        Thu, 12 Nov 2026 03:48:06 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0950394fsm97148635e9.2.2026.11.12.03.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:48:05 -0800 (PST)
Date: Thu, 12 Nov 2026 14:48:02 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Priyanka Mani <priyankamani2100@gmail.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] KVM: nSVM: Check full nested state size before writing
 to user buffer
Message-ID: <avWnci8x0fn_4ck-@stanley.mountain>
References: <57324d544da1e92cf3b30ff7c40595dfbca1933d.1794465097.git.priyankamani2100@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57324d544da1e92cf3b30ff7c40595dfbca1933d.1794465097.git.priyankamani2100@gmail.com>

On Thu, Nov 12, 2026 at 06:41:43AM +0000, Priyanka Mani wrote:
> svm_get_nested_state() compares the userspace-provided buffer size against
> kvm_state.size before adding KVM_STATE_NESTED_SVM_VMCB_SIZE for a vCPU that
> is in guest mode.  When L2 is active and userspace passes a size that is
> large enough for the header but too small for the vmcb12 payload, KVM thus
> skips the early exit, copies out the header, clears and fills the full 4KiB
> vmcb12 area past the end of the buffer described by userspace, and only
> then does the caller notice that the returned size is larger than the
> provided one and fail with -E2BIG.
> 
> As a result, KVM writes up to 4KiB beyond the buffer userspace said it
> has, and if that memory isn't mapped, the ioctl fails with -EFAULT instead
> of the documented -E2BIG without reporting the required size.
> 
> Compute the full size before the check, as vmx_get_nested_state() does, so
> that a too-small buffer is rejected without writing anything to it.

I would prefer to instead move the if (user_data_size < kvm_state.size)
check until right before the copy_to_user().  It's more future proof
that way.

regards,
dan carpenter

