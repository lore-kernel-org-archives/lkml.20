Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676F93CAE76
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022086; cv=none; b=D9jxL4fcoCoHsy9kkF0RtyrSth+39oDLD2mz7kadACg0c44Wq5OGCtJ3oX+dkvJzAU6vkF11qTH9i1O1gwk6fE+VGTCt9TRE8WhlSJJlRinwTVJf/Ozu+UJid0pZJGVHOaSe+i/LauFRNLqRAxbLEiDldrc7FIVwDESVhXpj6D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022086; c=relaxed/simple;
	bh=/uaCqa1UBzrB4l/x0ktWW2Ji3uA4tmOrYEYh+8w3GLM=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=DDFEoXGG8VI1UKg6d1XkJEUP/H8EQVgfnRVP+UUMDrj79OsHnrmFYh8iNxqIIsHiqrw3XgA1ZW1Ov1g5Ih+7SiaHtr9NJTo2bkJsnH5qL5AQt1IW1qe1M0p7AHKJ0HZ5XdFX4qXJjis9WS0diinmaG5huwHGo786Nc8kURB0Jj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLLS2CsB; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLLS2CsB"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2db18e5cb56so67540615ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022084; x=1789626884; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/uaCqa1UBzrB4l/x0ktWW2Ji3uA4tmOrYEYh+8w3GLM=;
        b=DLLS2CsBM/3zcihuPySTyvClBm44cM83nB5Qgwyl1nt/+zPA5+33GRfbfTD8JJNShz
         DbSQjoP+mUboKMKVZ8AqJ+pCBQwBF36bEl65kXCOdriAR0x9h2vbXdmfE/kYjTA3UNGb
         VYMABcaD9fNEKpRBAK/ZxOa01HjzMD1kBjYT6C9ywqQx58Oo0JeCNSusm2bZvZK/Bmhx
         /44CyQY1rpVJWFGYM8Wun1q5bCdFuIxrXo/8jSbDqd6F/uBdoM19kXpaoODXhf3aqaWD
         pCrGcHac0sNZ7raw2KT9l4O6/9Vs6gjEfTwEOR9KA5OWzRb/USpMbIA8vHj1W7LCaN+j
         J6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022084; x=1789626884;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uaCqa1UBzrB4l/x0ktWW2Ji3uA4tmOrYEYh+8w3GLM=;
        b=rXwY7RkdWvUHy3VYqKHxF+Bdi6ZU9zJtqduIM9hVPhAMv7y9DBLeLJRShKAUZVS14r
         tkE63wGYg++iP/z5I+LSbfNzDS6GCUBHKMqVg8upU1GeCziV92DdNth5nerK1QBqcv1Z
         iv7SK2aIbinEkSHg8+fzaNUGsFg7uVBHP8EI+ezI3W0X34QV62MRCOPDo47+s3hXBs34
         a3pNCHiRLoyogSn4ulZP+5BqAcJknDofjFe0mJyFEmVY7hYW2JxC3tbUjHrYIlTiiWOy
         dil3+qE0iVs5WZueHNcJFROrHqOJvwuFkNbbyGPmIqQ9mB+myt10FnQrZX5fq/qP5nqt
         jthQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuSdKICv0xWX16d58G9Plcr7MJyML7SxTm9DE6nHrKYbw7/08SVdtg3mmh8kXNFUgXllGOX//0eChGiV4=@vger.kernel.org
X-Gm-Message-State: AFuF++kOMNzlyML/Qg8qye90icNsBjJ0dJGsMsfXIl1txCmkPhpLAujS
	nMed7THgUzuNVlw6cccIUtSqhQ3vbt5d213bAMXP+s/gBnAAUAPFJQMp
X-Gm-Gg: AYBFou1+g252CVB4aMEHSwDCixVg+dXKOJr1HYtYTgpaQa50U8py8VeNbj134RXrv4Y
	YE9MWKxd8EG+s27v9vtXic4tLxDQOy/mH9TAya/wuMLTw1OM4OIjbLMsJC7HB6KM0F0ZXzVs1/T
	6TeVarSaGz6jImDtnphG9XkPQu3yeMmyYk0dfhpyt9g/qINOIQO35i/bCa2I6ibReXbaBdsvHgt
	VNAbUsHsVbzINp8A8ZwHFpQIbSnRF73e25+u6n72CdXg28lXYrHhTnkTS/iJEPhQqg6FjgdDPhL
	9I54bdsaO1WsWw83hjPHVilAEvHQRxLPqXdGbRF+tQMImUQtJoJHNYekc5lUnL/n/bHiCxGu00e
	kCip2Kt1Ys8Srn54kKySUWYmFjIDxfgNP0UASZpZ76yw97/hWJ844eXkhJdkVyeK4uOwNanm4Q8
	Wqr96OR63Wg+WJJ5I/7q8QkBAwa+kYlSj79FFM/uJ/LJCa0+HMbYw41VUXZuzxXu/tdw4j+1ZBM
	8ffKG80lpFsoeXxu2fq9BNID7oJPyere2XKwSGRsJ6S0Lt2wra1NTc=
X-Received: by 2002:a17:90b:57d0:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-39b260d28eamr57429977a91.1.1789022083690;
        Wed, 09 Sep 2026 23:34:43 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm10434389eec.20.2026.09.09.23.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:34:42 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 06/20] KVM: selftests: Extend page allocator to support naturally aligned allocations
In-Reply-To: <20260902164123.2546762-7-seanjc@google.com>
Date: Thu, 10 Sep 2026 10:57:06 +0530
Message-ID: <fqzh1xsl.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-7-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Sean Christopherson <seanjc@google.com> writes:

> Extend the page allocator to support naturally aligned allocations, as some
> flavors of PowerPC page tables require multiple guest pages per table, and
> those tables need to be naturally aligned.
>

That's true.

> Take care to align the potential base address *inside* the retry loop, i.e.
> the base needs to be (re)aligned on every attempt.
>
> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Thanks for sharing the changes. Looks good to me.

Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
