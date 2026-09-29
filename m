Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C712248B3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790650020; cv=pass; b=h+taCwEnH36JP9WozUBH/M3yxIlzto50iSrkICEKgbeCkl0VI5y5wDc6UTfAS4yE8+UXvEZ6AluCzuXX76IUUharF8HHTLJ+8YQeyj52riVcEZvdzukFwha5TzhG8uDtVk6YzJyQMd3GlK3SY3fRMlYxKc9xRrNEAUilu5Pgc/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790650020; c=relaxed/simple;
	bh=+JMu39k8t90lMml2PTuqt/SuNIgtnLZvu803sFgpUCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BgBCXCVNQzcA5OFNIOgo/vzROJ6QdjuJnBv/zIOMcZaN3eQdpTxewWR2qEAxNhhU3+R2kSqqr5dRlPCCq50O1gl9c6v5Nie338sT/yXhWuckTiUZyz+nqlR9gqZNNxiLtqzyOZnMmzgebdw9OQ+I3el7YwAQ8a0AjFOXeo5MjDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzBAyVhw; arc=pass smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzBAyVhw"
Received: by mail-oi2-f42.google.com with SMTP id 5614622812f47-4e667873c38so1104242b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790650018; cv=none;
        d=google.com; s=arc-20260327;
        b=q16WvDVYWkeWoIpSEZm7KVGLNTnyxDkB6ahtKCnomkkgTBKhYgSsLMV4RMy3OH54X/
         gQJsV4uisrKbjJ/PeZMz9GpKSUaQsYqlO55cziqu3MK6U45xtrXYAW9ALEkMpCBMXWph
         O9XrunESpFsTckYEMx752jJT7O3laASQdda8lea8e5B4JZYm2bX8OlG4umxRRC34ygEd
         PtwbfVHsaGbxHhAgogvuWswc6wYqB9/eaonFj+5oELjfRyIUsAb6Fh9xTqksD4jIKc3/
         fYYE2jIP9rSO0tCsC1K+yuEz3TJTNjAuKbnjSZ+OuqDwotmJZe9X70PKV9Z4NaTGUUDJ
         Qvbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0GLky+zMwV+lXLc5wxi80Ewpo+ygveBV5zL10ZyTdtk=;
        fh=nDkAGug1JzIQ7PE7x/E1DzKbaxu+lpcaa+ga9dY78dA=;
        b=c33l5JUH0Jcbb157WTCj0OCYFp7lyDQVveQ833CpEZqpQ333d9309iFhgl0a2YcCJe
         TVumY1uaKh5NpfmDZhQuOI+4kbr5dGThzJmnHt/fez9Vd3a1h8RNXjBMbStPay3ZbjJA
         WLH74SDuVJP1gIH5AvLz4TTtt8lg9HKwR+8NBvu0nzn8AW/1Ibb/AjdM92gmxG1zeiJV
         QssUGGUbv9KzGUFxr+2hNEunzLC5ABz/lZtUSgv7/y/WGDCPIk3ddnCxR3+IdVbpMIUX
         CqksKiqa9W2XpzMd8gSxLDzPk4gq0oR0AKzlXW5qybz0ngBAUaGqzAoHN3lKxvYRIGGx
         Dekw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790650018; x=1791254818; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GLky+zMwV+lXLc5wxi80Ewpo+ygveBV5zL10ZyTdtk=;
        b=VzBAyVhw9SwP1TgQ4tHJ3WPOIPefHO1HSpIIF+x2Wf0Sn4CUv2snLPi1oFw8pIrb9X
         q4nDbjtaU1h32kpL/7nNAuRnFWxc70yZmRa/PiCLgiHWe7ULKzzPfRuwh6Z0nToxYIX2
         Ks9OxCPv9tVKTsdAzMA2xczlV8u5M3rzc1SOmq4jdSHVelPt9p15CMEpm1ZenwypzO25
         v2xJcfbcf3RZIYmFwwLUz3g69AUttvKqvPV3+MgqBLMNR9XVuf9otucDLSevY/EMM1rj
         x5Uz+wzO3mW1CeqmgPzpnx4nCV8+qrV/5Euqp1Ae8VvzZcJRF8a0C7AwmIj1GdapkEGQ
         K8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790650018; x=1791254818;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0GLky+zMwV+lXLc5wxi80Ewpo+ygveBV5zL10ZyTdtk=;
        b=dfRMbqx0EDWqBZ2JzS5I5WXg5/IJWVMe8vuJ+GzTAD68Pxhx8pQlUB3qrmZQZ+rtTT
         BX+xbpfg76oLZuGrzzy5EX5Chq3haWtNsDS5l5EciJ84MZOaG05FgTWh3YRrltsCp9i/
         QVbu1tXtL7rOSmjeTgB/csybih045h/5jhQrX2Z+zTbFTYMUk8iJcOwBn3RseSzesyBD
         K+E9thCNO9qKUVhsSTaVUETSSKzxDyz537lZhv0yCNPFzjiv+XfGSkVbta2GHwvKdnBM
         yc05j6X3r99QwKdynHFZrbVlwMFEcf9FNiPrezVSOuBC/Q1h/2LFeQh19q2LyWtHtfNz
         K3Iw==
X-Forwarded-Encrypted: i=1; AKwUvBwxmn8sHAaspMN/sEnTSW37aauJ7sDp0Iad9pK1EzIz8SN5r1IlMaOZNPh7dvGC7BxCtzSQsnrcF6JcCvc=@vger.kernel.org
X-Gm-Message-State: AFuF++nLRsIrAxEuTbBfhC8d7ss7ZDMOykuSS9PETiN5dKutvasrRsYk
	UhoE4Gwtk1+2gUjLHZH1nktui1VLqtl2Rc/oyeh5mgV+OHBQHZjtR9mGAkJqakgq+rY94EdPMPq
	XO3WP4tuxGLVeTNGssUIaarn5drP5PMw=
X-Gm-Gg: AYBFou3XstzmSDfZexC77HlU768ihCxuVCjaCDAoj6CENuDGxi53qI/0frp4KlRrfW9
	+T7xw189oY6iSoT3ydvjaEdytc1bHlH3jWKFKSh+RyUAspMrXDpQ2CF9OAT4AC7OJh1Su9m4Jci
	t9jyHJzWuQaYZZK/pXcJAtWXNQcgtTCssqCth73FF2BmPvFKNwf+iHoK5vh8X/v/HzY2lyo9IHF
	JcXYNHFIQZ95rOR3846LFmniB8NBX5E05lSIvIJhfCjpvaDRNza3aHE1NTIzQOGwJkKLo+X8zl2
	aj21dXaI4y1NvH/W4bO7rTOSfE/KAK6GYSVSjnPSVVztC6Wuo3RxIHG8MNexrbk6tQ==
X-Received: by 2002:a05:6808:1495:b0:4cb:f21c:a7a0 with SMTP id
 5614622812f47-4d72ac548c1mr17435493b6e.40.1790650018230; Mon, 28 Sep 2026
 19:46:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820123512.87236-1-duankeqiangcym@gmail.com> <arrwQKQJpFZtARmN@google.com>
In-Reply-To: <arrwQKQJpFZtARmN@google.com>
From: Keqiang Duan <duankeqiangcym@gmail.com>
Date: Tue, 29 Sep 2026 10:46:46 +0800
X-Gm-Features: AclHuK8mMnu4MvWcyqvFMSXacZLsQfPg_SuyLmkpDnlhsh7cHQGVbBVXMe35tyo
Message-ID: <CAMd06Xdgp3y36msuro8W+X9eLwXDR29KLADtTObN+41bRr78MA@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: x86: Clear hardware HLT state when userspace
 makes a vCPU not-halted
To: Sean Christopherson <seanjc@google.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Qinguang Chen <chenqinguang@kuaishou.com>, 
	Zhiping Du <duzhiping@kuaishou.com>
Content-Type: text/plain; charset="UTF-8"

> Anyways, unless someone cares enough to want to back up the claim that spurious
> wakeups are ok, I'll just drop that line when applying.  I don't see any reason
> to mention spurious wakes: the vCPU is clearly being moved out of HALTED state,
> it's on userspace not to screw up (for this particular case; there are other live
> migration issues that userspace can't solve).

You're right, I was conflating the software convention (every HLT is
inside a loop) with
an architectural guarantee.  The SDM and APM are clear on what
actually wakes HLT,
and neither mentions spurious wakeups.

Please go ahead and drop that line.  Thanks for catching it.
