Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6CF4CE670
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645672; cv=pass; b=EKKYNuaRhdhVrvdLyGgVAQlYjXJady9OXX6hN5juqe8ThnwjLd5n7iKa+r4HiZrvIFzkxJ/g876m7z2XBEJxYLoYA5KH56CfiywExj5AfP680tubqLhZIvLKGlwdvctD5GkxCsqQYWydyXjGcxbQEt9EAW8RdfOVKcAIXgoELMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645672; c=relaxed/simple;
	bh=FzFQy2j7fd5eTJJCXIk006/qLEE8a/Xai2F79n9BXDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AW+eWu9O4Q4xuAjlf1Srz0wL8cq66W3xsbavGGHBE683l8MeHbco9/THiJ3qadvUoiQd6fBhzrmE6TPdz4cHlzT4O3wxbdappTQMneID7ojedgoI1YoJfbuqfiNjNyReHySlUGNTW05Qx0isFflG6L5jEsRZretP4Lg00zrmZ8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AxxjaZA5; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AxxjaZA5"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b5e5aaf7deso1126e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789645669; cv=none;
        d=google.com; s=arc-20260327;
        b=O9e+6rhUvO7rbq3dwLwisEKw0UyXSMyEISHhOEbCUkc4gjvUyBuhoavAdfvKT1FXWI
         EHbNdngh3+Lkv2ZxJEL+6mV1R8SOUClHE+Z345Rhmsz5byCQeFui5nAaJTmnNjHyERAM
         RVTrZKurKz0GXxrMIg5GgpBy2AD1zPw5+coLClo9EwpnI7mCs1CpLmRJwaW5UaMW+8nB
         O1nXuOFSdWB9D4b9go/HKqAo6acbfF8ddOWWR8Ymjy8JpiOyI2XygVUUQ5yoYAgWFay5
         F5Vz1DSt05yWpPPOPZUqjkNePJ1y/YlP0Mz8AglEy9lZOeST00WXbiNcuJ5rkV+4mKoT
         ZJKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AuZmGKQOozDdYhExUfv4iQ5oFoGABaotqoRByOfZs54=;
        fh=cblg+5gP5yag6vu5L4JRmajjB+BMZadPiztbdHiVBcM=;
        b=EqlhE/a7Z8ADrYF71ek9nFqHmZHm63U5qLUm2VrDvHI6gpKZ49+/hKBifsNw9+s04S
         EbMK2IOw6IVVPj8+AmX1fk+dBJdPx+7tdzW8Rkp8n6wK7Cic5qErL0O7xTagCR1hrfnQ
         8CNJTYw0MAwsOfOfiqxb1HaYgXBdpyjNuHP6wkSih6lH+HaFyKTjOVd76Pg099c20Dzy
         ZqepOP0SBq1Ys5txLPHG+cWc7lZ5WBs09U72Wsr1JdE/eiHqvRr5J8Q67QNiG3V2FS0z
         Sju92f9QVj3iYxzjTbPdLzMkIhx/zc0VHwxVeWB0TK2UlF1090O4DfokU2XoM8Zcx9NZ
         oOFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789645669; x=1790250469; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AuZmGKQOozDdYhExUfv4iQ5oFoGABaotqoRByOfZs54=;
        b=AxxjaZA5GviweJ17Q3K6ID4epFqp79D1CYzArB+FfA+Mj0RUK8DqzonI5aaqRYmVF/
         PA7vHqlH9J/RuYk99E5Zb/I9B89zpoHUMWZhvzz+AzdFdRa0XgKp2ugr6vl76b7EDFI6
         s3XbQ8KKS5eSfbPGy+1Sn8fg1HKj/whH9ib7zOqt/nXyRznorH3IN4GGN6BEQL6NZXaU
         iomkvOD61uW0BWZb9dsfETh8JkXpbwVME4gmrjn1WqZEJRTo3TmPgW1jBlrZ5My4j3Mw
         e11ikF5EeCB5O1qFWOaSrFmG9z68xlzPYiSqLNcHsr4Q68OHgqMA+RGQvhFeRhbsXK/t
         HlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645669; x=1790250469;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AuZmGKQOozDdYhExUfv4iQ5oFoGABaotqoRByOfZs54=;
        b=mMis8qCyrgeDOPg9Tl4QZUPr6Ganyl9Z0+2Pnp9iGypHZ9lQgWuCMSkBffu7da/F4u
         +IUgr9xL53ZP0QaghAlswK138tOE58W4XyHdJrEIjo/lqBT10JmQQ8kLqVQ+DLCKrLKR
         mOOQ2/E5TCjL+FpknD4S5PrvxgrWGnvNO7qSSFf5SYaaCLftZ00hUoSaYv7BAT4LvYsh
         RCerfvpc9fNuVXcaY4A02WsNxztRQZdGIxR3olBKldx9kA5CxdCriQ/GCb3U96Xt7UMs
         UlyQrOjGHlKi66JjCg+RmI0QFAGO8lsyM/gQ6ZNF8E2hGoOkapoxbuLUGPS2bIKaUG+F
         xZCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzR0ecKe9XWkg577Znk0iN5jwALeu98gz0av14kYfRB7+UKOXIcfQ+EBeB2wUftww+/+sSzBOOe7/U85Qs=@vger.kernel.org
X-Gm-Message-State: AFuF++lC6iVv+SAlsnYpkz3LTvhQ+TG+ptGenXHHfhYTz3wlewsLqwq6
	Qf6XmdGbgrOWPVTBmhCCdfsRYRLAuAYJHsFu6UQGutnBETqNFRA/vmZUcFOpvIJLz8d9ZjxZQOy
	ZNcUARaiuDPBrQoi7DJUxAxb5lEfnzZNqITzkvvA2
X-Gm-Gg: AYBFou1tGkNi2YT3fXxpZjNbIhOm5q77wDTT+7J8RRG+sFr+KUcNX9br5QLWW6iEl/8
	SZMKx2vrU6aGxw2/grIlkMt/KlNsHbfdA6zF1GFKwUdK7ZxNY2ONHw+anA8uV46M8yWqH3yljHK
	awMt/s12cT/C6IURV7rmqYLLCvSlFTVGOQ5HJkV8Dvxq0IWQXG+Zp9VQmLL5MSP/imdGBzYUV6R
	z3PEFdlwjlAHvE0A+tSMwalUordarLbS0pdl1Sx6njtSrYSRTQ3jEch9wiGfEtmOp1getlnK7B/
	RVSLtbqGoIvBHeXpZt0Cxls9UFKgvYYS75mYp6BikmW9MRzBQ7DGJm+0IVCVAz4sRE9xbjkJrBJ
	wsONRsFl6exbPew==
X-Received: by 2002:a05:6512:3c86:b0:5ae:b726:5f1f with SMTP id
 2adb3069b0e04-5b8bff2c01dmr18224e87.8.1789645668434; Thu, 17 Sep 2026
 04:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com> <20260915160141.3543048-12-suzuki.poulose@arm.com>
In-Reply-To: <20260915160141.3543048-12-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 17 Sep 2026 12:47:12 +0100
X-Gm-Features: AcwNN1UOph-dvwenB_bEiuZFqzb6gytAI9_L8AUcm8oP9DDQEKK-aUQXatB0jDI
Message-ID: <CA+EHjTzOR7xczcb1HbUAi3H7K8ta=pFcdjxJb7UixZEh7QS-Eg@mail.gmail.com>
Subject: Re: [PATCH v18 11/23] KVM: arm64: Use kvm_vm_is_unprotected() for !kvm_vm_is_protected()
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Tue, 15 Sep 2026 17:01:29 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
[...]
> @@ -490,7 +490,7 @@ static void handle_exit_pkvm_state(struct kvm_vcpu *vcpu, int exception_index)
>  {
>          int exception_code = ARM_EXCEPTION_CODE(exception_index);
>
> -        if (!is_protected_kvm_enabled() || kvm_vm_is_protected(vcpu->kvm))
> +        if (!kvm_vm_is_unprotected_pkvm(vcpu->kvm))
>                  return;

Could the two pKVM-only helpers keep the static key in front? With
`is_protected_kvm_enabled() &&` inside kvm_vm_is_unprotected_pkvm()
and kvm_vm_is_protected_pkvm(), as kvm_vm_is_protected() had it before
patch 5, the boot-patched branch skips the load again for every user.
This runs on every exit: the old test is a cpucap, so on a host
without pKVM the function returns straight away, while the new one
loads vcpu->kvm->arch.vm_flavor on every host. The wide
kvm_vm_is_protected() can't have it, since Realms run without pKVM.

Cheers,
/fuad
