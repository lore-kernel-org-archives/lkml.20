Received: from mta0.migadu.com (out-159.mta0.migadu.com [91.218.175.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3372D48164A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369907; cv=none; b=lNuKuKoPSxl7w3GxYOegh0P0bmvhCyvA0nKbOrFkgwIR1sgrs8BYFsrnpLnzdWeiQ4AE9noDecwBqzqRdDaTjQ0l5uG353ViIR5FgN3w8PJlYZw7Kw3KnOvu5rr5RC+GaIdKdpbessKfiBNCG9nAfUG76NCb3dmB3hYYclfFil8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369907; c=relaxed/simple;
	bh=/01lQesds7Qu15IlWJStcj8pAkrlNp3+XW9pTMK80Mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QUKHebZ9pghSKKv0Ms0GdsPiwFmjqtIN8xLgnh7f2uaeOiwQnCh5rgeFY2RMaUibKRUCJmfHJKHSGpZ8jsOXNJRBvS7AWOMpKUVqLdwh4pAl6dyJhFbQoitxsIcvvwuHxamao5yF6T+CXuvsXLhRav0lPAc7NrQjlgZr7SfeAGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JlkVE86J; arc=none smtp.client-ip=91.218.175.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JlkVE86J"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/01lQesds7Qu15IlWJStcj8pAkrlNp3+XW9pTMK80Mw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791369863; v=1; x=1791974663;
 b=JlkVE86J0VafOHNnmUq26erEyV18JLGA1cAm8W9Mj4WVpG3HChCa2t9OZrWDdeYR1XYr2FVz
 XSUTPOfH9bsptL4FQeWHsW3GvPsHHj6KRwYixuHvXXbpzv7bSU4Q+TXWbXPNypB6Ae8m1t0NK5S
 C+2J3g+Ilh/FF/zw+mG3ZlMQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6e62f30df9108b00;
	Wed, 07 Oct 2026 10:44:23 +0000
X-Mizu-Trace-ID: 6e62f30df9108b00
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so7743e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:44:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQBjT+cEnmDiob3inDuxGgEGmohEpdx3UiZX1b5EO2ZBX6prSZj92Lm6Eh6z2c+nxMycYfu1N4Fdz43U4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNPf5tEtFSJT3PkdEdnvGzZU+iiE8O0E4/Az5QQjaQ5fHeytO6
	QydWyySdAQWbuFqoXC+1IQHlcAQJuNWPQJVIqq+FpyuoJIwrGL4Scs4ZO+q0QYc0K1ZpXCXKQkX
	DTLVzM8e1TQrc7EoTieF4O6ek4ZfDJTcQyWeExNFG
X-Received: by 2002:a05:6512:2c9b:b0:5bb:27df:415f with SMTP id
 2adb3069b0e04-5bcca969b08mr280500e87.15.1791369860573; Wed, 07 Oct 2026
 03:44:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-2-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-2-suzuki.poulose@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 12:43:44 +0200
X-Gmail-Original-Message-ID: <CA+EHjTy44W8srPO2y2MJT7nijeWcek-BLsiwYfSPXVOA8DpRCQ@mail.gmail.com>
X-Gm-Features: AclHuK9bYO3-lIjbLvu1WEmia2gdqzHBdvJpWxSZu00WMWjDLerDBVC4C9fwiYI
Message-ID: <CA+EHjTy44W8srPO2y2MJT7nijeWcek-BLsiwYfSPXVOA8DpRCQ@mail.gmail.com>
Subject: Re: [PATCH v23 01/14] KVM: arm64: protected VM: Handle user writes to CNTVCT_EL0/CNTPCT_EL0
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

On Wed, 7 Oct 2026 at 09:35, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> Protected VMs doesn't allow setting offsets for virtual and physical
> counters, as the offset is always fixed to 0. The VM ioctl is filtered
> out based on the cap. However we don't prevent the userspace from trying
> to write to the CNTVCT/CNTPCT registers. This would lead to KVM triggering
> a WARN() in timer_set_offset() as the vm_offset pointer is set to NULL.
>
> Fix this by always "fixing" the timer offsets to 0 and marking that the
> timer offset is set in the kvm->arch.flags at KVM init time for protected
> VMs. This prevents the access to the VM specific vm_offset at low cost.
> A userspace writing to the CNT*CT_EL0 would observe success, without
> any real effect. This is cleaner over spilling "*_is_protected()"
> checks and "matches" what we really do in practise. i.e., always run
> with "fixed counter offset of 0".
>
> Reported by Sashiko
>
> Link: https://lore.kernel.org/all/20260908164641.416911F00A3A@smtp.kernel.org
> Fixes: f7d05ee84a6a ("KVM: arm64: Prevent host from managing timer offsets for protected VMs")
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
