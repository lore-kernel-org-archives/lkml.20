Received: from mta0.migadu.com (out-70.mta0.migadu.com [91.218.175.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A2E488208
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380789; cv=none; b=r0cEerKs0rd5fadsIH1ym3eLAbhDnwaOa7Xcn0BBStaUbBOtxy4GUFIgLfH2aGn1qXDhU2qria7g1KzrjjlamjMTClfrQfJlKcqKJLl+dlMxJqUkWrCaZLyUSdI9/zQspy+ZmZ8epEjp/GDAfbww2k1x1c7NmdsjDT4e3cWo4sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380789; c=relaxed/simple;
	bh=EOLf8afyt5b6SOANC3rqCkf69jr4nV59FAjYhwNBzS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F6PDWwuP7IkUoLiNXZcecqtutFJuCleWw5ls0+HX8UjI5xk6KXwaoHB8TgstCH/rgqmlMieRjSlpkMZqH53rhSBcU/csGMRksvbKdzEoSrVreZbFaCjQwvJeoBZ4KhrzbDJG5Bx7ie+JeJv+9DzK3iU/Q37O1cKtRMeLs7LfWLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gZcX6Ks9; arc=none smtp.client-ip=91.218.175.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gZcX6Ks9"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EOLf8afyt5b6SOANC3rqCkf69jr4nV59FAjYhwNBzS4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791380776; v=1; x=1791985576;
 b=gZcX6Ks95jUcEVeEV/DeHEVvSx+xdQeZKfAijXps0Vy4fYo/fRKWLQ4c9Ccjo8ZMvmiKvwxZ
 JnGZUoefNkKskwLiN2mTKDTi5MKpxtiH3ulaSZuGgmhNgViEqmKU/Ikp90rT8OgkcVYGZVGGiRC
 Nx/eYmtKJO5WYPAbXXP2C+XM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f03e40dcd74186b5;
	Wed, 07 Oct 2026 13:46:16 +0000
X-Mizu-Trace-ID: f03e40dcd74186b5
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so6937e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:46:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzC+xvy9cHI1gNolmZ4Q7NA9EQhLaIueUYE/8be8PHPJuh1V26EnXF1d+nklpwPLJgece6KqV7uOeDRvzI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIExI0+Szx2Lzl/uU5bwtBjMjusELnqTFLBkPSnIvLjK/VyOGCP
	CAdbCWW0e2b67EPgw00kH2xX2jmQSWh/ZtnUOEd9KlkK9VgkSQG3fHGdBE9qimyBcj2gG7anFXE
	Y0AHs3b/YkyUIR130VtWtHtuODL3qBw3jgvQO8sVm
X-Received: by 2002:a05:6512:a83:b0:5bc:b531:51ea with SMTP id
 2adb3069b0e04-5bcca86c249mr304368e87.13.1791380772866; Wed, 07 Oct 2026
 06:46:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-14-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-14-suzuki.poulose@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 15:45:36 +0200
X-Gmail-Original-Message-ID: <CA+EHjTy_1EekD472UH=CDSpC7oksdy3eS8AP0rPxKkhQ_PyXdg@mail.gmail.com>
X-Gm-Features: AclHuK_J8GmFTVM33wX7R0VP_JP-fZesKaU03j7TLtkYQU0t9fz-B9AOXRmoM04
Message-ID: <CA+EHjTy_1EekD472UH=CDSpC7oksdy3eS8AP0rPxKkhQ_PyXdg@mail.gmail.com>
Subject: Re: [PATCH v23 13/14] KVM: arm64: Mandate VGIC v3 for pKVM VMs and Realms
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

On Wed, 07 Oct 2026 08:35:36 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
> pKVM does not trust the host. Realm VMs follow a similar trust model, with
> the Realm Management Monitor owning the protected state instead of the
> host. Add a helper to identify VMs that run under a host-distrusting
> hypervisor.

When I reviewed this in v21, the Realm patches that use this came
later in the same series. Without them, kvm_vm_hyp_is_distrusting() is
true exactly when is_protected_kvm_enabled() is, and protected mode
already doesn't register a GICv2, so this patch doesn't change
anything on its own. Should it move to the series that adds Realms?

Cheers,
/fuad
