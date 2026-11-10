Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342643;
	b=o5MfH+bcAPuKY692df2TfpaVbmllWjx9o0nLt1EFe7GIGbfR6M3vXT5iLgbBhjyBx4XD
	 vXw1JXKvSfSrZxEoSE1io0JhGy63RUphFSF4oTq27fOCwr4q8PCoblWhnKlX/rRQO6JdB
	 Cg/oNt3/5WzmJENOFlQYwoS2v5mthQtE97wGEtBOtMZNK8ZoNrdVkWB+DoXM6BI5cAOpB
	 ZZSBNoS1mpLx8A2peMDmH+hvoTpNdlMalhG8yYFzhI/+yUDfQybzjbvYpp21UReVSWZ68
	 juzoBDrd+QwmtwgQvpPG4evEa9BjplY+O7BaOm7RPFFk4IFDhf1ny5MK0DSHFT6qhKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=gjXaKiyZQPSwExAfhsrIhyKjre3uu8ziTpIkVVhFMVE=;
	b=xSYxg7aJ8oZukfiJUVbU1Jwzik/TXmmltmwdpxH6zIKMuDBfPSSfgKhjc8S4WXykfexu
	 UbNKnLeitWhLi2mSNuj0cR/x3S3J0a/a2Vc/JA+tV6P0Ij1lDg8EmRyEqpwIJL+YPMWxn
	 Eyc5LFTAO3iO+Z7Ef0Cbq2Sn7KHbtTPE+Yh1Z+heLekLutg7TjTabY8l7FlXXAY5A3KD3
	 4jerZZOVYBZLbMW9a+U1n8n8igs6wlC/NXXrrZnFNxdknOK23m3FFGTyl0ixm7h22ZHDy
	 lSKUuYf6Gf5xOgeWfNyGTUhKodTRWWWI4H8N2OktpnOnzfpqWZWyTVTi8ZxUfxN3zBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XnGLrhM9;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF8B606A89A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CF8B606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XnGLrhM9
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed47dc8f3dso36306655ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794342642; x=1794947442; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gjXaKiyZQPSwExAfhsrIhyKjre3uu8ziTpIkVVhFMVE=;
        b=XnGLrhM9pDAgt2m1qDtK+9GDh/WOJikUa953pUSNK3mBUmTFvEOyyrgcDQ9ShgICdD
         QV8hvlVIUHgtzRXUvnCLJekubr+thbbb6hQty3mB+5RdoRAWAyLbUviTzlVGoVJUSnDQ
         e9yGlyGKLlM3sq9/s8FrhZtge5njBKh9hUiwGV+4C1JMOT8+SE2BrhdqfT1yG5b5kTD/
         arF0cTXNue89/rTdWdRHjcoEKdav9p9B7ko0Gy7DgTxbAxnVT+yA+NZTOSQtIUQUz7xa
         yZhdVd/VrErRyupOebn1bf14660C/3iHlWHT+qQJhJsYoImoAwdytOCC+IPi6laLvcl8
         Vn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342642; x=1794947442;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gjXaKiyZQPSwExAfhsrIhyKjre3uu8ziTpIkVVhFMVE=;
        b=jzoupF6V2YgRzgZwYfyMhjji3rARyxm0GvctT4plAtxMvUSIpUmMbcHwa1FWQjqu2O
         OsMfv8GLUmYC/suTZSlQVeW28VQE+LjiAxoy/lWS6h7fQNNyf9HkXaSUzjsiIsgVMb35
         rURV0ynzi4+tThOzpGP5ZN4nBHDvnay00RSgs/V6GkacGD8dZyLn4yQXZjmrQM4b/BBt
         dgEtl8r3BOWC8raSi5uMg1BOytX3Lww8nGyP7ErtZJuWwtrdkbc77vFZltRYS8GSmwEC
         0AC5dByiidmsu9Ck/lcH6aT2qqVVtAv0luok7R3753yWAVzHMS4T4VxvMETW2N9eEyOn
         48Vw==
X-Forwarded-Encrypted: i=1; AL+hErEQHqsSCWQHtZr8T7yX2xqtxLxJe9HtAWk+Gkjb+nuItTbrcneehg0wEMU2czOZ+4EIsO5HSOdXOJnamTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6bvE65FkrjQv5QgVfmyVUjzrpFhEjRmLECmk4zRWJ2F9kjuuc
	YpgcQUlmmHpmaIDAHQThFe7meImW/16wauIFMWvZ0uCCrRLn134JLRhRyd6XHFmX12Reb9EN1Db
	SWO58zg==
X-Received: from pjbsx15.prod.google.com ([2002:a17:90b:2ccf:b0:3b0:f7d8:3b91])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4e8e:b0:3ac:ffb8:183b
 with SMTP id 98e67ed59e1d1-3b182f3e1e0mr113027a91.51.1794342642319; Tue, 10
 Nov 2026 12:30:42 -0800 (PST)
Date: Tue, 10 Nov 2026 12:30:41 -0800
In-Reply-To: <20261109210833.1250548-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261109210833.1250548-1-dmatlack@google.com>
Message-ID: <avN-8S4iZKD6xRMu@seanjc-mac.roam.internal>
Subject: Re: [PATCH v3 0/5] vfio: selftests: Automatically detect the IOMMU mode
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Alex Williamson <alex@shazbot.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Mon, Nov 09, 2026, David Matlack wrote:
> This series makes the VFIO selftests library automatically detect which
> IOMMU mode to use, rather than hardcoding iommufd as the default, and
> makes tests skip, rather than fail, when the IOMMU mode they need is not
> available. This was suggested by Sean while reviewing the KVM selftest
> irq_test [1].

...

> David Matlack (5):
>   vfio: selftests: Automatically detect the IOMMU mode in iommu_init()
>   vfio: selftests: Skip tests when the IOMMU mode is not available
>   vfio: selftests: Print the IOMMU modes when a requested mode can't be
>     used
>   KVM: selftests: Use VFIO selftests library to pick IOMMU mode in
>     irq_test
>   KVM: selftests: List the IOMMU modes in irq_test's help output

Thanks much, looks awesome!

Acked-by: Sean Christopherson <seanjc@google.com>
