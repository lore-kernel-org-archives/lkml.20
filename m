Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794927836;
	b=EkpVsk77lLL0Ic3zjrerkfjm/gBIsd/ms7blghgRNx7aXJV0PirsV2cdwQwhZIs/2KGw
	 AaAk32suKxWf4uPENIm1Q1Oi0brdzmLI1RJRLeqhv+J5oM8jIACYj31/OoKWrPYEWdkMT
	 gTk3Yb5SDxrVTX0vModFGZLYtZeAcvb4he/Zri8K1iax+O4ii7NwQyfbi+OerNM/VpGA0
	 q7ZZr5Gs9IrW6miJ/fIf1wdYOcpYZWbIgFHaKTm2kzy4QjPdiqbD3jx9uBPSi5GR9+9Pl
	 a8AJcDlD9ZjG5fRkg5Q1zE2LQitN7YyVooxBbGd13lJiia8p0burY/uMM/555+QRExA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UR0Gfgv/fdEsWHImhEXrlTh92/mXRBGXB0/jlnan5Vo=;
	b=dPzrNT5zq5C2XQv5jR3Iy5SmMo8z4urzvUtWl1wia6ml7Co0DVsKx+sfEA7EPsIQe6tz
	 yFhdYq0QlKZkmbnARH3V2kgm3OdoGAlJOkqz0HkSU6pqnjbrnpoZ8Rf1e1joB+lRKnKOy
	 Iwt1w5Mc++oJk290R4loDMJBtvjWcXS4+Vj9rh7hGAHwaT39WYCO7OYulCvWRosId9UAS
	 RvcKq/k6V+6mq/huqWCV5i9wYKDDVflzaDhK2821QVg+a+mpOYvAh7Whyxc3q97uNkVwI
	 poMbRq5+xLss1OlezCzs9teLmluYsLIgoAmTBZGGgtGO5Lj03bEgtB+8O5dOe7PKYhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RLgZDS+t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA56606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA56606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RLgZDS+t
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so10196e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:03:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794927835; cv=none;
        d=google.com; s=arc-20260327;
        b=YFgPrsX94eF2p0ecBZ8S5TBwgjyDYiMSu2bvegOwdPY6j/uxADZHOrk9z8HImaD+Fy
         ifibgW9mCPdZ88BLg6VtQJemRs6676q6di+kNLKhDat39WwpPwiF454goX9NSWgoD/Nr
         ee31znd3Y28MDje/1PrvMId1BX0aQYiEmUapuAW0TRchwIeegFWjgjblRvaKSp0eJcrs
         VqWfxAkFLaaXnpG66eugSAoW6I/P/iGsS0HDngeg6GDW/OID3dRLCr8bXzOExeQzSaoo
         35mAzQyxylX5VZEN7mm4XQ6zPSRXGnhkw5f2krr+8ZJ8QCTCf4CFtNzgJdtphyO/8giV
         nuXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UR0Gfgv/fdEsWHImhEXrlTh92/mXRBGXB0/jlnan5Vo=;
        fh=B8bghf4lCBaQnUTSO6Wlvlurtrw9cmZFTVF7vM1ArpY=;
        b=C/uLT6zac9EqJ7eFwBjXarFvJv9DPtn/wVeulb3QM4Ti+nzbs3EVoz2cBluPRwah3j
         /eNszvG4rd37rripYn9zPpI7Cq3RqtzSrM5pbMIXVzRuTwtqee0ytJM8g61XCQG5A7Ni
         ny3AVXTgLmVm8QL8rY3FsEvXQzpSUn0OQXdGMdUM3wSMzoG8fl4woZ18xfUWJObTDcq/
         EFdJ8ALqC0Yf9Z5cosEMvBmmdhapO+sYqFrNAQjq/LVvV81olp4NcmLj6/a6mLQUpPLQ
         a2kFybaUzNSU0Hojdxhwb5UIxRDmqIje1rEjrTaeoeFewGDpeC4zap3NMkxDCQ2hcitP
         Z8dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794927835; x=1795532635; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UR0Gfgv/fdEsWHImhEXrlTh92/mXRBGXB0/jlnan5Vo=;
        b=RLgZDS+tUgc+aaNm9VRRya/8Y5bVpU4/cnLDxlbXQR24Gg5ANKvAXTLTsFYt2NCIp0
         2jyd5aeguZJl1ctNFBKuwfCP8SbVTnExWnMKW3Fv0poSqRoXhOMUMcWnTHNuuPMkEZZW
         VTUXELdZNIIKZd7vVYOYo0ZBBmTopJdjskXM7GNk1gDPZZbSFJghrNYpil+4I2MCEzE5
         2PzAI+sGRJSChS27Q/oSTVEq3+DBnGcdSMXh01K9y7TcThm4Fkw4xVhjciQJ40RZVrcS
         L62FCt+c9SrrGjUIx3SR5Oom/VMjwoSwn1FAUhMKLgUr1NmtdvCAnJZM+Ieelqyj0/9c
         I4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927835; x=1795532635;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UR0Gfgv/fdEsWHImhEXrlTh92/mXRBGXB0/jlnan5Vo=;
        b=dV/nXlg4d7bN7Dfm8dn7XeG/vVTgilzq87hetrhMXxvn04cVVKOiqSn7LthqM68243
         uE7B8rwtiwfgm0/za/xUVAWXkzmwaLRdKsT80slwDF3diu+ZjeCy/wF6/XjAZXGAon7v
         wD28oqWIaQ75oXnvUUJ+dK8+2VZ66/7LRvbkD/rn5CNgIHxJWQHXHXcioycCgE9g2oWI
         8kgUfqnnqRWJUbS00b6urfogKEERsFUtH3dyBClkIG9LPHdPOtvBiODBqbXXo2kNl6bk
         0of603dagJHtOAeeGjVZROxlf+3WHG3ZJ/s7/g2NHJGYDkAYF9XP+JGu47EQMPiSBrvL
         e1gg==
X-Forwarded-Encrypted: i=1; AL+hErGHaOsEkWtwJ7tCSZBqftdmsD/YPkj4gUKHzRU4XRKRS7d51Mveuo7SkxS+I2/H/urUTKC3x9ZO34yPqDw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6Dw4wrYm+aRPe32xGlGovS/hq2C7ZNVdiT/hDUK1D9cp0IOV0
	5MZUsKA1fFyflHImUQ+V2NwMPzj1mh3lYH5wtaohNK2peQm2fbAguP6dD98z9r4xJq+WRUuK1RV
	eFqPGn3RJqPkughMQYTvoSCsyI7AlxlmfToGRKmiA
X-Gm-Gg: AYBFou3LgK0xglz7lO4AwMmCE3lzJ2MWZf5+Jx10Qpsa5aBybvzkZC9lzKF89naOXcz
	zg2x2hImNRYIv2XFIn1G08mb+7LGTFzca7jhR2yEGa5UYpVe0cJOTRaJCko3a1M3iWlOKA5LI8H
	EfqFZaYEXLRw2YM/rR2kfiFcXyY9TIuZQ8j9NNfOCRYX0rzaRT7gQkd16tyKQVFLuuGeopT8Liw
	55+ts8zu4KEBWjhGcJOKaLgjFePfJSMDuootbHKQjmSFAH6Zv5FhuOS8TrrEP/sdLW7uOFCZg8q
	vW8nAd0US2qglhn6WWgXUc/Al+h2wLPlG6pwUTj0doMl5nX/nXlR67Ni7nEeRwWmxrope9NwzC1
	rqygp9iIEDPMHeq6+mu9wD9Ny96AZ8Sd8n2dmlAx6TAsk7AgEX2OOtr2ZNeyS5ayTMTiN0UwxC+
	40W4wPAR6K8PkdpOjT/enonp/t
X-Received: by 2002:a05:6512:2249:b0:5c1:543d:2e3e with SMTP id
 2adb3069b0e04-5c1a2166b35mr171174e87.7.1794927834031; Tue, 17 Nov 2026
 07:03:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116164358.142785-1-steven.price@arm.com> <20261116164358.142785-11-steven.price@arm.com>
In-Reply-To: <20261116164358.142785-11-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Nov 2026 15:02:00 +0000
X-Gm-Features: AclHuK_cslY3zjG6J6IGbNXJdnealsL3yNGOi2bev9GDyOWEmQLYI5dVsAlimaY
Message-ID: <CA+EHjTy-0k08Ukyo+4mmzqVn9UjRnvhy=BQT9kxSj7CBzzwO_Q@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] KVM: arm64: Dispatch stage-2 destruction by VM flavor
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"

Hi Steven,

On Mon, 16 Nov 2026 16:43:56 +0000, Steven Price <steven.price@arm.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
>  static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
>  {
>          struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
> -        unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
> -
> -        /*
> -         * Realm RTTs are inaccessible to the host and may contain stale data
> -         * after the RMM has released them. The non-root RTTs are explicitly
> -         * destroyed through RMI before the RD is destroyed; only the root PGD
> -         * pages remain to be freed here.
> -         */
> -        if (!kvm_vm_is_realm(kvm))
> -                stage2_destroy_range(pgt, 0, BIT(ia_bits));

Could this patch go before patch 4? Then patch 4 wouldn't need to add
this check.

Cheers,
/fuad
