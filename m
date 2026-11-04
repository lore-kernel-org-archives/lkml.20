Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833368;
	b=3yXE2l6fZXDo5TN/RjY9aCDIloiTKHOftoG2uIMcLm0/4lghi0UiJgaqQ/VtTF/PhQA/
	 /EOvjgHW7Sv0KQovaOzUa9NEkQwuB75oQKrc1bYL33Xb6iJ8zCKZ6bSTMcBvSx0FrThS9
	 u9F23mdpqrFtWuoBoebHwVvTsl3rV7z6uq9b/6oYwzPCaMu+JOD7NnWhOEshlbKA56uev
	 +TXGhxB2EeVXD1uv56n+UUEvbw4RPcHPLZxmgtbOshKZD2Aqi8gXZlVv92IiPi9RaGs9g
	 Q5GaF2vL2tvg0+V2fRm4I1pJ6NlI0aP3QJyLc+DkbzOx/1yhWuUxEom6RP82w1qG9Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=vyyO2xQK9gWshEcz/n+cFiGR1SxpAHdL0Hq3aJ/xFWg=;
	b=rKtTZtwdqeevD2mW4m4HSp2zvRMR2EabwLzy0tv50UKfmgixxZqmS7zPZu8ycQpVXkKu
	 zuTb1gW3KYn6WhPX0EsUg8lensZ0Kq13dzIT2lvuQ/FYC3p4uEK5I1NH9nrgcbpvet/qz
	 HPSuqTv9aBfA7pKF7/yBHbcHYcf3rqyh+J1MJIy5O6pRmbI7IXlDIBTfLmj2RH03Cx4vr
	 QbjyXxCDbiSj783a7ZVOnM9vjIGIAN6Ehl8EHWCwTDKlOTwnkc2VRA6jWM/34AgBOeBQZ
	 isANYtA1udAjvbBW6j+AicXl08H6tWuE9Zg9u5Pz8I4LcjmVTTcJO3/5UXCmbQlqqew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a+oxHKEw;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E778606EE94
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E778606EE94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a+oxHKEw
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so1162339a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793833367; x=1794438167; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vyyO2xQK9gWshEcz/n+cFiGR1SxpAHdL0Hq3aJ/xFWg=;
        b=a+oxHKEwZrv75w7v6JN7rcgSeAAqtvc/PA3NHJk5l4FuvuHozMILWxVrbPVO0yGA3z
         02X/mNkPlyA8ROX2R7TQVPWKEex0wDVf3FXiYuCTRpilW0u5yEn4TTqGu2dPfc0KEPlf
         E32NzKWvcCbPmM8257xAoMbI+yU38XpkYECmBly//I2zDPCVMuQqwS0MZx1qC+j9Lgjj
         iZL5xQq+qqDSELZ83j2o9SPHAy2NaSYa3uKUljAkiPgfCl9LLPmZqQfgsYRkaSKQC8Iw
         YZJuXnFHnsN9HVvazcBdkSOjNuSKWWQjCqvLl6eNkOeUhPPiFGUFtAaaNpTer8eTJb2v
         HBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833367; x=1794438167;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vyyO2xQK9gWshEcz/n+cFiGR1SxpAHdL0Hq3aJ/xFWg=;
        b=spI30A8bYGBefNd/+cWt0Drs7Fr/XD7bAoQRzwZNNFlBhWORoWlV+QY4okqvcXEGc2
         1pJX7blXWfZksG9ydjhTjgzby+bDAhhdwjhE7PWXQ8fybElMJfiijkxkoWtT8Xj6ffeS
         niliJrt21cLTLNtQkvJr2e9L/xAZVmt4nKoBY7bhtlEhw5OsLpqIQVEUs+ICOAjHa1NE
         bxI6LO2lWSUIPm0w4uFsPjXv77+jUO6imp8DS7uC5ev93w+jD40RrjoIc7ADGmtJ55Gg
         JAR//QhGuf6hk4u4B1XodwjZE9tuJasREfr6stqQ2qWEceDkEG1FUCyPWojUWwvOb5OT
         DDiw==
X-Forwarded-Encrypted: i=1; AKwUvByFxislHXqXBFTQB7A5PdGrW5liKwEs+sGXpJBkRHKwH4wsqoCKeYLi0SfNsw3dnid3ge8C2xhou4C8AeE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+thaxlp+T793SBufnXh2zPZUJ+H+rmhOGyg+9IPpBZNeCwona2
	dehmwR0dMAgWe8Dq5vsAfYdEMcc2adi7JTwGQWiufGg2kf2FSLU/o6Pdr+1sXOs6pi0jcPM1I76
	rjgzYng==
X-Received: from pjbqi10.prod.google.com ([2002:a17:90b:274a:b0:3b0:9569:4e9a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:5d17:b0:3ae:898e:a123
 with SMTP id 98e67ed59e1d1-3ae898ea1b4mr10835418a91.14.1793833366550; Wed, 04
 Nov 2026 15:02:46 -0800 (PST)
Date: Wed, 4 Nov 2026 15:02:45 -0800
In-Reply-To: <20261104193635.333141-1-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261104193635.333141-1-sashal@kernel.org>
Message-ID: <auu5lcHexLy6pBe-@google.com>
Subject: Re: [PATCH] KVM: selftests: add empty install and run_tests targets
 for unsupported ARCHs
From: Sean Christopherson <seanjc@google.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 04, 2026, Sasha Levin wrote:
> Commit 43fbd8cd389f ("KVM: selftests: Provide empty 'all' and 'clean'
> targets for unsupported ARCHs") gave the KVM selftests empty all and
> clean targets on architectures without KVM selftests, such as 32-bit
> arm and i386. The selftests Makefile also runs install and run_tests
> in each suite, and those still fail there:
> 
>   make[1]: *** No rule to make target 'install'.  Stop.
> 
> Add empty install and run_tests targets as well.
> 
> Fixes: 43fbd8cd389f ("KVM: selftests: Provide empty 'all' and 'clean' targets for unsupported ARCHs")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---

Deuling AIs?  The other patch seems like a superset.

https://lore.kernel.org/all/20261014200152.1365147-1-sashal@kernel.org

> Found with KernelCI-style TuxMake builds that record per-suite results
> with KSFT_BUILD_REPORT. 32-bit arm builds now succeed without installing
> anything.
> 
>  tools/testing/selftests/kvm/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index 03d91f00092f4..3881df8d5b2b8 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -13,4 +13,6 @@ else
>  # Empty targets for unsupported architectures
>  all:
>  clean:
> +install:
> +run_tests:
>  endif
> -- 
> 2.53.0
> 
> 
