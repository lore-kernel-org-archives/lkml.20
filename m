Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236EA22173D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933684; cv=pass; b=MuTGWbs6cIikgA4P9Z9j5K9OqnaZPX4riRvNADOtlFCuOll/vMJqDS7tYUt7Q0EdYKPNyvM7bXKI4+EVt58a2lTb6Ir51uBJ2opXGnbDSzmiW537YWGHOaHL/78jq2stvtcS2XIUixrIMrhF5oUTZ3xJ1XbuqqHUyF7qtuaf7mY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933684; c=relaxed/simple;
	bh=x9JTFIhcYIzkewGT1y4B5m/45uK/p/cDf2r6ve5Iqn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cVJQcFvcTPmGlkoN12YlNYpQ/h9lfwuiLXx3avxg6jUUEfQ9FX6Ii+VgqqWRQKCZt8IQ5xJfsoIgP8EP9Bdv7Y0LrPPse+LtbGOliSw3lbcWy7onRPpAF4sv3SLw66OBKuFee8mfCKZ+Ki2bBshs5hIp0YrZ8L16gxxssJHLkr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HxxX6cFJ; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HxxX6cFJ"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ba40832934so4324e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790933681; cv=none;
        d=google.com; s=arc-20260327;
        b=mBDHrv53EEvD/q9q8zdH9fu35wpKX8OA35BBq9Q1B+8GRyzGIVvsxJqmURhDx5I3E0
         fxDHC6D+RAT/m9jUXakuFTZozC3GIR97pOiBbTOIzZPC0Uf2y9cNFHlU40oqnjthK/fI
         UxfbxymCKWdHWoFLxJPpUeE5/Zv1sXf4j6nq3L5RDHXa8+81MVjvdngYsXBfYbyZiveH
         o0iaFqZ66V5ERp0nnKUy3EBC06VfGGoi47B0zUue4lTONMOFV7aa4l1b0YiSYpf5zdSi
         2aAViCu4kUZx3ntS/mRRIOSS68PuCUu8QXo65m+VZEIyYvdaFQM/E922sZNI4hnH51Uc
         VvIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SuyjNGNTaeTrwozTD0DPhcs6tJEVH09iyMIGVlGNB8o=;
        fh=6piVvOGE7ARiqZLA1YgbWQYGSv+nGzbuZ/FW7ASAGnk=;
        b=DauJQK77fyV/FmsuCZeC8rA+USIuesysa2Fiyddp6JUM2FUjq8tR0BvEm5MMoJUcbw
         OOi8ry219yGQQICpn1XLWjBp0ck4/rSL254FMhjJqhnsE+j/t7VDuX7JhjIjFjaVUukW
         NxAPiirQFViBjs9SiUC74JkpBb1k7K35OZfp98+12tn3cs4PDQU6Odo02gj0PAl5J6uX
         0o63UGMDKvR9EhuRkoq4z2HDzemsWVHFP4QXwLUTRxE/iu9xxTOo5OUnujM9FkhyHI0A
         yrCpPfwjTkMr+DpQL47l1eJB3CRLN4rXNy5T83L8dq+7cq1MnkPE36SFxzNiuNXRLilN
         ocMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790933681; x=1791538481; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SuyjNGNTaeTrwozTD0DPhcs6tJEVH09iyMIGVlGNB8o=;
        b=HxxX6cFJCTw76A3QP5JnbCYmHgzHAqlQq+BJqap6bjOYNNz4yp5siGzjbVQPmqpGXS
         5PG7GKRNJQmFmAs7CU1UBV9zQpaqkvQStTfPDVJSKYqGcRhOUo/hj3Vo7j/lQvKicKc/
         S0n1r1ai55iflZ2fYap9xTYUVvxXKzD1qxFm/8nUl2fYpNuOhWMqezG1q0tkHYh4/vD0
         +6Ubc2Mzx2ycwIHAsNyvTF7E+Ro1Zd9Vb1hIkp+NGAcffBoM4NADpvxAc1fHxKuy+b0D
         6oImIabVhK7LvWmPTGeDDqI9oYnttVo9paAZNkfRfxjUuBCRXdd77MeETYRKeWFrtTTo
         xj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933681; x=1791538481;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SuyjNGNTaeTrwozTD0DPhcs6tJEVH09iyMIGVlGNB8o=;
        b=fs94kjHnEjqT8loza56y0vEN1lv+QEOJ6fkE4+yyrT0Nq9PSueCaTU2nXXaXlTYOYW
         Uil1jmPNpVoaWfeglJiaWdWhKY2iOSTyMPbX9W0ZultNXsUC33IYBn1eqIMYa5EAqUcq
         seX3D2/HBZHEeOV+FKg/gMJtTGr/qiujOZJ/PdbworIWZwpsek40TY4UmuJDsDqpwV+R
         ShEDX/++B5+UUICw9f0DZ0MdpdClwMEl77YBYp/sktaMdV3p78BQCsMV7p51BhVpnhlI
         rLQ7Fnaj/IcElWi6KTi5h3AondwZvXr70hNSsi3is8BlSXb+F4sb5nr3Wvejc6YuzbLB
         zkrw==
X-Forwarded-Encrypted: i=1; AKwUvBzM4Nu+owk7cyZ6saO2PNC3McAcZdh23C9lSkgH0XOiDM0/t5SECTmu0oYPqJNDqaXkuwylnKqSEvYS6jQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJR8G9UvehEX5N1zggNMZ8jc3kVtVoOxZ3RenTiQstjUytR0Qa
	s3Ewm+QdO9DvkrtRJc9wGi1b6x/2E4ISGCGO8um2eCvgfbBhyhHbLAhuRSly/Tqp3HjY550lYwI
	ukpwMRqkqxh7PS0YT7mz9MXr+NQxxCAQgQR46OhQ/
X-Gm-Gg: AYBFou1MD95THKqrhRnBlHCZ++hUzsp8A84yCJEyihLw+rT/1GsR90C3uldwBoxoaNT
	vK0U8vE9tTu6ayo39jeP7TJKBdzIyh7PPy3Mc6c5MotTZQnLEl2uu2c5IAx5tCx7df0Ve8y3BtO
	eJXv9E5ok2575Oz+4xCqDHoMPLro7nxWFq+fWk+Dyxtx2ZOCC8A5zivqnTcKJKgEk8x6Aum/2M3
	LG/G6/d+9qIhoe/qekInDn5myZ4yzgqGe/Vrj1voy8W9JyEloRZ0TEtdROSlcVUmGZ3lPQ7nTmW
	fcP6nOCUsHuOQv/hm9ozZ6wKtGYOMs+2ySmn0ZZYtQAp3qjKqSz+gfnloMZFMUf5mniwK9TsDzo
	7gmray4uzjYtanQ==
X-Received: by 2002:a05:6512:6d1:b0:5b8:f20b:350c with SMTP id
 2adb3069b0e04-5bb7c948658mr120571e87.3.1790933680638; Fri, 02 Oct 2026
 02:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com> <20261001210703.1597150-19-suzuki.poulose@arm.com>
In-Reply-To: <20261001210703.1597150-19-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 10:34:03 +0100
X-Gm-Features: AclHuK90hdLcclI22eF8PMzgsUup2Pu-fPsPyAyT7zN-k3WxhBppCUIye56E7qo
Message-ID: <CA+EHjTyyKxW2TT9XpjSDkdjWEuGyWmA_isDpOnoyri8ikxZN4A@mail.gmail.com>
Subject: Re: [PATCH v21 18/23] KVM: arm64: CCA: Don't expose unsupported
 capabilities for realm guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Thu, 01 Oct 2026 22:06:58 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> +static inline bool kvm_vm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
[...]
> +       r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
> +       if (WARN_ON_ONCE(r < 0))
> +               return false;

The fix [1] is in -rc5, so a rebase conflicts here. Please make sure
to carry it into this copy, i.e., a plain "if (r < 0)".

With that:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260914093838.1082637-1-fuad.tabba@linux.dev/
