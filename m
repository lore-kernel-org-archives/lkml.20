Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6270D2F0661
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975258; cv=none; b=FFZDDHvWGoqGpNYKATVTJXmw5mSTvG+2GcSSR1esuQXNnrCr7pUrqO/LdoqepnkuGH9EPFWxXbh1xZGY1F8QAix1tTXgYDCk6QvnJQgnDWk39gFQQqLLTyI0qD11VN3jWt1bSLERmGVQT0C8CccvAeArM4zyH2l3NwsZGTNbb/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975258; c=relaxed/simple;
	bh=RysYLdTI9IkJdpGWoZlY1Bvfxzr6j6x/weKhB/U2w7k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=csK/QDl/E04q3KKangAOzTTiz9LvBk/XF+syDe/ZEeM9CpcLmk+A90ubrwVyhQPEDUK6UwJaUFynUfli0MJpuWdBVEPeuI/U9byrlSQk80vHZDPwqZQWQ2WtUz+h7LpkH5ry2lXhrpvolghm0qB+B89JEAQmx+v7kHR4kRW52hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oWuLO6P7; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oWuLO6P7"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88b45cc20ebso8946b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790975257; x=1791580057; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6BHkxBDd1tqbm9aS4RtYwIu5tM3v8amscCNMFwJmzb4=;
        b=oWuLO6P7ppeBRQZWBa/rT3piOc8m+oUaO1cV0IMADOhGXmo6B4H83Fl8bHPGByJbNp
         53tz7F/bpJWlME3oSxGmt2KZJ43MktsfDeXaTRU0S8ASM4JKl7VDvwSaGRvubuolrRFk
         BaJUGCVLTt66nBzUfepOqJh8YjePhTDgMpdzinez+O1/XdYNvwS5MdyhWSXLnEdm+Lkf
         wu8vA9up2HAp1fHGhnpvNwTHFI7IvgVWJJwDxFPhwidSUe4s8U9pyNzTKa5VdwCQdsrc
         z2x8VI9cRM45zCo4/o4sSaxaSWxJ5yiUSpE40vp8RgYytSWA8NS9pQCg6vgci4GRAp9/
         leJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975257; x=1791580057;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6BHkxBDd1tqbm9aS4RtYwIu5tM3v8amscCNMFwJmzb4=;
        b=XqCXSqgo8HDZUirbiytM9PhV0KHJPIqSM2VIsm7ccBWt6Ak8cGK3N5CHtJEphGY4aa
         LnB90rci8caB78M5RO1lgOBYGgbUJ22IinmrTaFfTXeZBANNGfs/UOqwBmgtuhPJSz4K
         FIPe426qgX8t1cmRC+A4cO6C3vjobBvtlnwi8J3vUxFq6sFvrhxBjU+X7nUlwm7TVVgI
         Q0Ke2dPV/3uSWHpCe5UZhii6BlTS0hEboTYvn/zeHwzBbUJodAPKm9YQVhGLDqeJVL5U
         4yZHwm23XZj+OcTXEBMuhc/oJYrNIvOJtr7dwY60reHCl9721naZ1REodltQjk1hB2sB
         8cJg==
X-Forwarded-Encrypted: i=1; AKwUvBzO5tOTxdG8MirvQuJh090rrLdtZKgWh2UAK4f5XBS2yd1/Tu+92jtYontvVHClGYJv+Qhxu71cRWWZ3CU=@vger.kernel.org
X-Gm-Message-State: AFuF++nZgdyd7l20Mh3jY0j3+fc0AUZ9JsCYJSrnPfevt0g3S0GBI5xk
	ZSsJbLQ7ZH8E1a8AXQfMmN7eXTbmbnFhddg1Ph6kF7sKNBjgPQj3FuJuCURDmuwI1HjtrbgoY67
	NbgMh3A==
X-Received: from pfbg17.prod.google.com ([2002:a05:6a00:ae11:b0:888:2e48:6a7e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:7099:b0:88c:30e:9ee5
 with SMTP id d2e1a72fcca58-88c030ea97dmr1287672b3a.28.1790975256477; Fri, 02
 Oct 2026 14:07:36 -0700 (PDT)
Date: Fri,  2 Oct 2026 14:06:46 -0700
In-Reply-To: <20260810-x86-kvm-setpagedirty-v1-1-85f180892d4f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260810-x86-kvm-setpagedirty-v1-1-85f180892d4f@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179097485665.4077346.2109893956484550745.b4-ty@b4>
Subject: Re: [PATCH] KVM: SEV: Fix page dirtying in sev_gmem_post_populate()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Jann Horn <jannh@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="utf-8"

On Mon, 10 Aug 2026 17:33:59 +0200, Jann Horn wrote:
> set_page_dirty() requires that the caller holds some kind of lock to
> ensure that the page's mapping does not concurrently go away.
> That is not the case for a random page we got from get_user_pages_fast(),
> so use set_page_dirty_lock().

Applied to kvm-x86 fixes, thanks!

[1/1] KVM: SEV: Fix page dirtying in sev_gmem_post_populate()
      https://github.com/kvm-x86/linux/commit/97818b2fa708

--
https://github.com/kvm-x86/linux/tree/next
