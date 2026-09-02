Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5AF47F794
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351684; cv=none; b=BnYi16NbKi9GWqD3kRpHINrPA9Yny9xlxa+IGBUpjwrvpKqZmrfAjtipJELkCzT2fvvZ2Ip0QOm2lN5Gq0IsPy4TdEI9o5NhgjUY0Kmsvbfd9KHFAEN1HHzEapUCloSbV2v692P9FIedz8E4ga6/vmn3jkyT0eH6zxYWWmTN5XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351684; c=relaxed/simple;
	bh=9fqEfRKgUMJWyOe5ZNAMkjiVee0f/Gw/F2S06frt78Q=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qvQbbt9uiB8DiNvr9x52/9UaeGUdg7yXrltSMG3UuHmLL/Fj/6DZex3L+4gd7EyGSW9741FoBVf27nT/MS7wOcoTXpNB4FmqVqEHuwzhzTOf6F1gUmJt7iOM5TGgs7iJswvv/dX8jc2YD+X+jb9uvtu6cZQVV8+1zLvHe6mTK9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qs0v8pf8; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qs0v8pf8"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2531f453eeso131312066b.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788351681; x=1788956481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+YtppFXPJvnaOnAk6ks95iIPAquAZkAVzmmLnfe8b94=;
        b=Qs0v8pf8GFPWB4JsWj0ZkMouJUGDOCg/wKdVq5zefebovi4tGw6h7mhPtBbjraeneU
         WYJ3VvvIMYtHhbs5ZtixVdQGSODSaymWQRSPRkukMdlDOGTWt7v+TyAPYiT9V5gxF1TO
         HhGivD+/0S3GgYpvcEXHbV72AodsWGZDe5+53xy7mdLS2GpX9UBmY7xFmvlp8jQ9fiZq
         iAqkHrX8G93YNbT3EMpAsNTVRRE8re4J+Fj5fCYzlDyx9WMJcZ8zy/8N2x+/Yg3w/i1o
         soTlP8Sb/LhuM0Uqm+/TY8uY4ED1/PhTsgi3WVe/8u87DQ+B4WtcfmbQb8MMBMURq+d+
         bblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351681; x=1788956481;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+YtppFXPJvnaOnAk6ks95iIPAquAZkAVzmmLnfe8b94=;
        b=hs14+9Ku3zKUktmYTr35pvHcZdHYhOB/eTwZSOLh8D12NZMzPlP5eKI5iUO5y4dcGs
         42yNd5tsrq8UOnBqYySTQmfZrSnkyICG/hjyR9LPbH8AA43O6Zbi4jXA0c7hMOpUd/tQ
         BMr33NqTIu4R1XV/EMG5Fr9MhfnvyEGrPVj+9tIU1KRKzPDADTGJc5q1lo7Xpa+DWa98
         xPpePAQ+rRu3jE81Hfx2RbmeUqPhY2ygP68Pg+cKRRtJWls2ZlGDMpC8zHR+Wl8WoSs/
         bhCd38yHX5YTxT6vraLA6EPeukHT5a5slVWyQDElTEpo0wzS9Dmrs040AJe96iQq3K/q
         7VuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZJxVupC3jcqLNK25BmwyVQNuQIA/JIHXrKk3Qxk2Zu6rfSMvBfAtxirWN+VGe8gk9YANC7wlNtOoI+8o=@vger.kernel.org
X-Gm-Message-State: AFuF++nU5nmYhZLqaSYiLXpfwrFBZmQE/O+EC20TbEZT3MT+YOdb8txb
	u2rLOkit569nBAt85aDaWB1xfuHCQUCnsSPTVsbLZmTKPgcxurSlmztc
X-Gm-Gg: AYBFou1QiH2TrAg72xbljiIoFROOlTu8wr+kgTIxGt8f5VDDW5aFmmiwe842+z/jENj
	l0KXOc/02kLWKB8KtCz7ToDvAodQ+a8H1ZqxTGJ+mZJKXHrS8fQQuqvVSbZ1sO75expdlgq3XsO
	xhWqI6/6SASzDzCPj6CdBK9ibRQW9AxpBAMfMUlWsqQUwBrPuKSsokQcfF7HHVl2/I6pxlq2FxU
	B6AXXylQ+gt52G8uN5yEiQBvrwkixO+Qr4razZdULLPPznmm3kj2HZAfs1/vmH4+1pLXWQnScGw
	GCKMpgreGFYi7BnN931yV7DgrybAjssWH94Oyutoxd415Mm103eYZoXbQHD0yay62uLemjSuKZf
	b0SO5v+r+EObQN0o8VuvNVT9PfU9MOr8HU4kSk+GRZ3Gj/oJqs1fO3TsprNk3QGzorCph6SITzv
	rj796RKVNjlayb8v08m6MPQ8rjxLo6baW1avjPVoGTbVm9D3wdqS2iWgXuEKAnLEgV
X-Received: by 2002:a17:907:3d49:b0:c25:c7a9:7b8a with SMTP id a640c23a62f3a-c25d54b6d03mr288409066b.12.1788351680630;
        Wed, 02 Sep 2026 05:21:20 -0700 (PDT)
Received: from [10.45.18.37] ([15.248.3.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d03f4d39sm123342066b.47.2026.09.02.05.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:21:20 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <d5d6a854-bdaa-4d69-87d1-c7a1731e8690@xen.org>
Date: Wed, 2 Sep 2026 13:21:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/13] KVM: x86/xen: Introduce
 kvm_xen_has_64bit_shinfo() macro
To: David Woodhouse <dwmw2@infradead.org>, seanjc@google.com,
 pbonzini@redhat.com
Cc: joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
 ankur.a.arora@oracle.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, x86@kernel.org,
 syzbot+208f7f3e5f59c11aeb90@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, suryasaimadhu369@gmail.com, lkp@intel.com,
 nicoyip.dev@gmail.com, frn1furkan10@gmail.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, imv4bel@gmail.com
References: <20260831213632.81023-1-dwmw2@infradead.org>
 <20260831213632.81023-3-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20260831213632.81023-3-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/08/2026 22:26, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Add a kvm_xen_has_64bit_shinfo() helper macro to replace the repeated
> pattern of 'IS_ENABLED(CONFIG_64BIT) && kvm->arch.xen.long_mode'
> throughout the Xen emulation code. The macro uses READ_ONCE() to
> ensure a consistent snapshot of the flag, which can be changed by
> another vCPU at any time.
> 
> This is the KVM equivalent of Xen's !has_32bit_shinfo().
> 
> Assisted-by: Kiro:claude-opus-4.6-1m
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   arch/x86/kvm/xen.c | 16 ++++++++--------
>   arch/x86/kvm/xen.h |  5 +++++
>   2 files changed, 13 insertions(+), 8 deletions(-)
> 
Reviewed-by: Paul Durrant <paul@xen.org>

...although adding kvm_xen_has_32bit_shinfo() for consistency with Xen 
might be slightly neater.
