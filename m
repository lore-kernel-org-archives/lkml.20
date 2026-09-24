Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F784A1E02
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268870; cv=pass; b=mV+qS2Ba/CocwPyzhgidGlgCw8jz36sdyt3AEMYNEp7lpTx7iu/hnyW1ake1GLAhZoYPR9kRsIUEe/lR0z2z++LBsmfYMHGDRDPk3yGRREn2SJPyWy3cfqFrWMnq9koqI9DogXrU4xa4ucqj/jvcgUKPMqGPpSVmK/flqlFKLdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268870; c=relaxed/simple;
	bh=SJEi33YUftvD9/5Co30bt3uO1e7e42WDDs94MAuYOW8=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DrD2qT9WOZizO/EbHrQ4QBlMdCFE9r1WA+E5NWSS6zkQCH8KA16eArpR8BZA9waUOUxblYNn4szHxqDpYjU1JOqLPD5fk5s/NeIjUztdBhTfQ+VjBoXLcGX7Mn+9R7XmVPqHwKbuCZH+E/0n83SQNvsqYI8A2dTlw8NadCeUZR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fCzmDRD9; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fCzmDRD9"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6eeso970616d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790268867; cv=none;
        d=google.com; s=arc-20260327;
        b=PIwNpSO7WjjAe4PyLrPD7z7BE8s4oSKNyCZ/q3GZuesu72zuqFEMwgBBkvoyY6N9SY
         lcGKz86eaTg72wtu4PkK9nmZaoAspb09QYoQO+B3VlQn9Ke8KQku4UWTkojt+ZrD6Ug3
         MUHZqBhla7l7hT3h7MwOslmuNKj2qS0nWFeQ4jwdrywwfaiJjGt95S3uOQD6WWvaK5X3
         Y8UznshTe3zdL/L+9xwSbqbcEgHuYsvUYqkEa/3O6hMDMG5+EbREPy3mTmYfsDqfrkaH
         GAt3RTtRqZwdTCY8n6GnPpEvJP2ucYAIYMP9uwH8eumaplwx+exetwqWbZPFIsy3cVls
         UKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=SRzB483sqbAKuTAx4LCeSM1Mzl5jx5qk7J2a1wveDuo=;
        fh=XiXZJ43lhNjvY2uDYFB19fNnS6CI4816HAUN/EqUAcM=;
        b=SfiNhLqtodCxlvf5l0D1HwEtw+x1/vHux0m9Pdozk6o6C6N26c33GL+HC85uXdBXMW
         GwHlEyoi/KKliU+5u25/6pGSkAfxXy/zdj/JVvfkwdORnxcwhsUkO+ySFAZRX1ZVgTGI
         QLtpCcNmpHsUjGo5fOeTsfB3GiUfgaqlfWdSKEcgQcppYUlYTRaxvEEWLRLV3x07cIBx
         fy4WIMAmUmxZiObYQlbMlkY/rGl8rHeBIrlVK9xYjB6wTSTNTUHWeJMt4B3Fd+WW5Eia
         3H5CtTv1qrQFV6THXnqY/BY44LmT17tgbMW+vo8W8A+vqc6+fqOd0i6x8cT6Lk76wrP6
         uI7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790268867; x=1790873667; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRzB483sqbAKuTAx4LCeSM1Mzl5jx5qk7J2a1wveDuo=;
        b=fCzmDRD9iG0zjqlsCpLSWhbs5G6oTJu08ECjsuE2JME37i6eAEP+frWVPPGBgI2x0i
         7WBn/+L5IXtRtM2+Wtb9pggiY9p85ApVHcVJ9MJorsYR6Y2/cE2lm8+pBfdtssyUb0F3
         mhyHMUHrLE/7yGvGX7tk5NC89ldEJoSwv4iUFOYJeSflll/pISZ32qdZpHYMbeq7sbQq
         4OoZwERLmur7J9BKl5ETlyF9/IeWPkjgKF4O8yxfy51ruTE4cs+glqBS5pd97d7sBTMu
         VOzqh/wcO0nA46C7o7J0TUiM0M2tsezudh+TAyIIY7/vBVipYwfMbIYiJ6iUVQAu3mzA
         rJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268867; x=1790873667;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRzB483sqbAKuTAx4LCeSM1Mzl5jx5qk7J2a1wveDuo=;
        b=0S2whIrF/cDq0fad5M+rX64r5uvQ9gJeddudsR3NoD5AChsmLqg/FPKn1Hbbiz05BQ
         q0LANV5NSC4sBWjTxDTOE88n+y1+3VUzOUmPch9uxA2bFhZNENCgxHkBkz5yO4xCYKf6
         qYWVtZZ0xHFjVaUKlOqbGP3Yo11jjs3O03Qm/1U0PNExnq9vcb4GC9UXvV6l/57H9yWW
         TJZVmT5kMfNcUyMTSHzW82hvZClD1pZJ0X9TW7D/kaW9WB1+5EcQakYD9qvNRlUapH6l
         DUAI9qXUJOkEJ+zdU9U+dOaP+TMhMxXJOvaSzSOiAX3cEiUeCbZMWG7z79+nwZbdp9iy
         5WFg==
X-Forwarded-Encrypted: i=1; AKwUvBy3ihCiKUcy5tom+G6g2Bq3KrSm8vPWk4yfa9aW5ihm3CB1TCi62ajkQvuPCwM9E/X64K/vZJdaqU4bthQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nkXc6JDwqjVpb7+qN29US2es0p6+O1RzQ4tnRfcMOWpfZrl/Wh
	kRfI2FMh6QVpjIg0ZZ3H6ofB+ffffIog92hVmys0c1x1ENbHR52vyhGkiQG02Mek0J22yKLmBef
	/emRfJ5wyF7qTN0wWbdH5mftuCnK0nDav3K4kz2cJ
X-Gm-Gg: AYBFou19q+bxcge9eK4nL1AHVTp1WdaWMldt2Bj1XJQD3lwXNzgm/FhAaH3gr4ZZb6y
	4um6RjZqu2jWrB3pmy85DQbysi+7SMCXX5b/1Cp9J6L6XZQuDOHozKvYsAWI6LYra7P44jVRA57
	DjUyG+GFPU2VZCC9kGXKP9Ivu+VCGNN/skuuPbW5Y7mg8hMYusnYAHTljq1qXm/u7BJWrdcgLzy
	ga+s5m8fVk2ttOZLF1HGcykvYuD6Qumbin46mSZ+nmtkQAE0tSTfbGpcVgTgz7/MB0o8UIZMqaP
	2gfcegxf+pozgTBJwCl8CbHABNLCxQZ3Enrd7Umq8sRfA7SonCItYnNhozzfT5GmcIl+E4IBLMS
	Lgz231GdE2kEjCFz9GXa5WF/6da5Tcl+AnXvMOIM+xQ==
X-Received: by 2002:a05:6214:2f0d:b0:912:4310:e5a6 with SMTP id
 6a1803df08f44-91421dd71a6mr32010576d6.35.1790268866884; Thu, 24 Sep 2026
 09:54:26 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 09:54:26 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 09:54:26 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260922001332.1121266-6-seanjc@google.com>
References: <20260922001332.1121266-1-seanjc@google.com> <20260922001332.1121266-6-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 24 Sep 2026 09:54:26 -0700
X-Gm-Features: AclHuK9ZdoJEhArxkHYbmu4oWdkXl-wU9D8WNCFmEXCzdl3KIg6_0c7Gxq6koEo
Message-ID: <CAEvNRgFs0aqwGDbJdTmqmS2nKw1xmeka_TucjDqpdHZr8N+sqw@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] KVM: guest_memfd: Establish memslot<=>guest_memfd
 bindings *after* memslot is ready
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Dennis Tighe <dtighe@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> Wait to bind a memslot to a guest_memfd instance until *after* the memslot
> is fully prepared, as creating the binding in guest_memfd will effectively
> expose the memslot to readers.  As pointed out by Sashiko, binding the
> memslot before it's ready to be exposed to the rest of the world can break
> various memslot assumption and rules.  E.g. x86 could observe a NULL rmap
> pointer if a PUNCH_HOLE hit the guest_memfd after the binding was created,
> but before KVM made it through kvm_prepare_memory_region().
>
> Fixes: a7800aa80ea4 ("KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing memory")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260826170551.BEF801F000E9@smtp.kernel.org
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Hope you consider my suggestion on [4/6]. Either way,

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
