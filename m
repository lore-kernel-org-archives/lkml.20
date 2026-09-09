Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D782D552955
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959972; cv=pass; b=LKD82NSokN4ZHQoKlWWMfew30r6KkNHfXZCikrQRBHcLKqACYToNgKYr7hjNNB9AcxziAnjfZKpUlpBg/g5X5DjaoAQK30Sby0hYWE9zvpWoHFcPC9tEYhAkxaEVfhQng21N1SjXZ3o2X9Q7tjfoZftMvE0XQxQqjp2DV0hEm/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959972; c=relaxed/simple;
	bh=/lXKMho56Iawzotjf9gqPSSOK8+fhDi4DHNzWXgEKCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=crLozaKkcshm7KrST8F7aCurYNb+CNFxZxUhQXCxBN57HrNyXCGBp0YAIHpvh+h2xcv+mfOQt0m1P3HKm+oC+utBpAvWtSY7R11EamMdWAdWyf4b2tEqKwaWIFHFVYwoqzK95A0CtVl2fymbzQgfmLdF1aRXyigc+wEE4/FrzpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bg16aLBQ; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bg16aLBQ"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so3559e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:19:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788959965; cv=none;
        d=google.com; s=arc-20260327;
        b=lcarXCNbdozuZkoBZAqG2WigBq7GZ1x2o2AYpCYYzxZ74XZrXLivgmg6atzd9JUCRA
         IeF+B6Nh5zGgCnjBU/Tsoc35iF+ZcAFUeWQwflDE67TLmjvHdLceGzI50ajjrRMbm7+w
         UEBNRpxdtge6fTe8Eb3jBre4aGRDkLOSlI3/zwuE+2XlnCbIxP58EyU/BNzoW7hdpnls
         CLe81XF49fAbxFqgbk6Vi4aMyEk38MlDKk//VFLuqhiOsG0F3bVi40MMtckIHSogl0Kh
         cZLkjdg//naSGPnpjXDaP/hyahj72yuuP0tjAgm+bPUaYbRKtL5AD3NkCVQCIa1E2iOp
         lpYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=STg7xRV8j3OkHmv1a51bOo5IRu3aXP7QERSx2DeQDNI=;
        fh=2C4Oqhxr5lvrhbPPw4LtPnXoM50E1BLBHA6yVkfPVZM=;
        b=MNB0l8piWmUO5IWM51J7lCd0r/wPxCNFxRnByZGSNosug7DegLRxbhReduWUKBpjJW
         7p++AywWD5WzU74THWrpVlOV5yDVWUDqlF9lNunoxF2yvMI5ODzlK7t/QfbcWass1SVb
         5h3oAC75laeVhixRuR9NChu7xvrlvN9DDsOcBwn5BeKKTo5anslZkgZI4d8f71wdFt2y
         oxXQZgDZOqSMuXja7gRoc/WXXQgoPdoSDo9/mRYFhO1j7tFrp1mvlv7d+XBvbbdRup8F
         1rntpen9xPb79u5wyhew3Q8zdm1w4V8hpDbmgup2UTx9bSPa/pX56J64t3DrEDzTw46+
         gNKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788959965; x=1789564765; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STg7xRV8j3OkHmv1a51bOo5IRu3aXP7QERSx2DeQDNI=;
        b=bg16aLBQErZSfg/UYii5Gj+e0MESaN1WfVGqoK7a0bhP7Au9XBBm3ZlsbH1Tr8F/Zk
         QsQuC7FLLtehU6no+vxRdg5q7SuQ1KLHqeW1uBjY1CHd6pmdoRTD7FsLNpdff5+NhTCO
         eJpSTk6cuMCQN/cvUK2PA7Ds6xmNC2pYXlxj3rUb0tDWvwKuhDnbxY3smdWvxJEs7J6p
         YqlEz7R0PlqSR87KAt+53EJSXHtOUnqlC9Y9r7/YJV1iClD7fXeRZeZ0k9ARZVyBmJ61
         yfXIXJlBmA+/0JJgxJGz4dDJ47HgyjTLpohYF16em7mzruNiUnjGMxqE5xgoX6d8AdRY
         1qDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959965; x=1789564765;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=STg7xRV8j3OkHmv1a51bOo5IRu3aXP7QERSx2DeQDNI=;
        b=Mk0Nms/0t9gABKHFSNZ7H2tFGO5cHp7K+3jUMyMP7UdH+ijGThluzEuJlpwDMTQpbd
         e6FKS+MVt4sSU4FGseWDAO9CbjX7bVd8AvkwLo95KGNRanUPV7h0O4dAZP+XTy3aMLTT
         /wK222WV3mAl2npf91LUUGUnQfObYlTAYt0lEN3RaWyRWwvVHatSvBDFAHOl1ZlBA+6r
         AgPKuSAX+N43cV2wm9HlCZiiXsOU18MQWhcXooy/h5De72ExedRiM+t+2IwoJ9p5SjUb
         3vZYeYUzshCYNr3TA/zPQf2g/7cBIb+VNYCGv84PzyUtZG0P5xfrp+IkvlkI/yoR7awB
         lPvA==
X-Forwarded-Encrypted: i=1; AKwUvBx+3/peWfkC04xwyk8+aPHBacXNoyRajPs0z6AJATDE7exPsKmHgJLYtY0u8KuoD6xBu3vG29hFr/JFIds=@vger.kernel.org
X-Gm-Message-State: AFuF++mVPX2A61dI1afhl/QeONwOVsRH2RmWrKq80tfD4qzbJenwl73f
	N1kHye2ILECo3RntP2NVBrJbfpVEqbitiUbvAoMLYmbR66HiF0k6uAgZr+ZhSOsZVkT3MwRs2Jd
	ryef0EbnhUJHS1IWDRTkvGqd0j4Dk3MGn/k4TfMId
X-Gm-Gg: AYBFou1CWomZADOXqKd58seAYwfgBk2JQCXD0oG1Y7Zt8QqpGdp/KA47tb831r/lwlR
	wVN8FPv+prPEuMwiBTnM8tugVXsY6i8632jOvk+Iq/QWu+fApZzKn1og28jkVCtrwIfeSX40ZIw
	amuycaa5+t3LjqQWHdY7JYuI5dVXt8HeGCyybbzXS9wzaZIbSCOOmpmdUFIJQxGjUwd79WuSb+V
	coeuzxWBSeEKjpPIdcST52BSfkmBnhiFmAdW1ityfxd3A/h3zz9IqN6mcZzlIz5Bm9S1iGPQy8K
	aIHAqWsopZrBTLybLNRj/s2Ts+/KzfOH7lC4LAqrY2gRGxyhJzvEpPta/sio7vcnEwefKHYZze/
	2YaKJsUWYHQ==
X-Received: by 2002:a05:6512:234e:b0:5b6:bea:f091 with SMTP id
 2adb3069b0e04-5b764bba2f4mr141895e87.10.1788959964067; Wed, 09 Sep 2026
 06:19:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
In-Reply-To: <20260908162223.1683432-1-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 9 Sep 2026 14:18:47 +0100
X-Gm-Features: AcwNN1W9J0hO2XvyP_iEth4oT8xwRLULtx1NyAOMY4yUoohn2-IYZWX_G_vBhiM
Message-ID: <CA+EHjTzr-r1FRuJ-X3E38_SSHsNSz_vdO-8sFOtBdsiB3V_x=g@mail.gmail.com>
Subject: Re: [PATCH v17 00/20] KVM: arm64: CCA: Add basic plumbing for Realms
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

On Tue, 8 Sept 2026 at 17:22, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
...
>  3) NEW: Enlighten KVM arm64 about the different VM types and use call backs for
>    the VM type, rather than spilling the is_this_type_of_vm() everywhere. This is
>    not complete yet, but it is largely functional. Adds VCPU and Stage2 MMU related
>    callbacks with support for the existing VM types.

A design thought on the vm_flavor dispatch tables. They're
hand-maintained arrays indexed by enum, and a gap fails silently at
runtime, not at build: arm64_vm_s2_ops[] has no VM_REALM row, so a
realm VM would get NULL ops.

How about something like declaring it unsized with
BUILD_BUG_ON(ARRAY_SIZE(arm64_vm_s2_ops) != VM_FLAVOR_MAX), as
host_hcall does? A non-NULL check of the selected ops' mandatory
callbacks at VM init would catch the s2_ops naming typo Sashiko
caught, where the rows point at zeroed forward-declared structs.

Cheers,
/fuad
