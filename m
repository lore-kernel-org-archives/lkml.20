Received: from mta0.migadu.com (out-101.mta0.migadu.com [91.218.175.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8A13FCB37
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814476; cv=none; b=CRacrY9YfbyKxx/mtny91MisrgBgUcT3V3dcuMm3MGDdev+Yn8EWfJT8FLIpaiq0Y+/syPB63g2W+IIFj1bhZJDUVgcYTkZusSB7CCWfpUpLghLaleYdnUskFvbfCJnjEdDLsizmx/0MR+PU2Jof+FSHusdRPEabudunOHCUn5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814476; c=relaxed/simple;
	bh=BU8FrrYxJtVjuWI+jaNz6hLEtjMMOJYa/QcIW3P8I8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c29vl6UUNfowlNSUKaj/F5DODV45uF9+MPeoIOBpGCoFl0MV1pXKSp95hPkPPHyR9avKmoNR2qNPgmDDiN1zsW7fNM41JlHoPjH5r9aOb5dd+e6ZfIwVgsMbSjKM8S+cLazIljjeGTBmZQv1jTukdmQ7ji2KzlXfsCjBseQtZpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DVLTvlA+; arc=none smtp.client-ip=91.218.175.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DVLTvlA+"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BU8FrrYxJtVjuWI+jaNz6hLEtjMMOJYa/QcIW3P8I8U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791814472; v=1; x=1792419272;
 b=DVLTvlA+3qCFuhaVdqI6z2S5ZNpwXUWlbQxv5JzyNmfcQ7Pak4lfiP5kr1UzzeRL0BoxuRiR
 xjCNAIvbYTspNtOmgYA1vMRMiBYss/95px4gFsnIcB+rga/BO5hEfZiCM3Bc4SQR/Erm8iQGehZ
 A5Jly961oxOW0z6JSwnJNVTA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7f7b5e7da821bd01;
	Mon, 12 Oct 2026 14:14:32 +0000
X-Mizu-Trace-ID: 7f7b5e7da821bd01
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ba40832934so7815e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:14:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy1WYNzzevs2s5vcJl4umI9ZLJHN7eIQ5G+j06JluFrD3Sfc4T35MRhr4yDQLtMtl1aKthsNDb79sI2Yt8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxNnd+h+cdURi/AatQn1l+hfBUSN0/EOAK6Bfa+zsDS0CrO727
	EGg35tR8DXuBBjosbZWEf1Vwf/CNtrTKa2xGKN+l+qanmdmat44xrC2QELVEEd732XQqihQe7/r
	6+PLE357RCUrWBOkl797TzB7JCH6bCFbgH01usZXQ
X-Received: by 2002:a05:6512:3043:b0:5bb:661:7db4 with SMTP id
 2adb3069b0e04-5bce97ff24cmr161841e87.0.1791814467633; Mon, 12 Oct 2026
 07:14:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012084743.2228612-1-fuad.tabba@linux.dev> <8633ub2mlg.wl-maz@kernel.org>
In-Reply-To: <8633ub2mlg.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 12 Oct 2026 15:13:51 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwyQPPVG4tGY0i0DRk=kwbdEmjca6+GNjLDXrGxkNbMOw@mail.gmail.com>
X-Gm-Features: AclHuK8JAr7VKAyNHjXlm8W06MLq8y4tWsehOxWPWjdhocCzuow2M7Ozid4Azug
Message-ID: <CA+EHjTwyQPPVG4tGY0i0DRk=kwbdEmjca6+GNjLDXrGxkNbMOw@mail.gmail.com>
Subject: Re: [PATCH v1] KVM: arm64: vgic-v4: Don't forward an LPI with no
 target vCPU
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Mon, 12 Oct 2026 12:18:51 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Isn't the core problem that we don't correctly handle the UNPRED
> double mapping of the same LPI? I'd rather we attack the issue at the
> source instead of papering over the consequences.
>
> I hacked the following, which is obviously untested. Can you give it a
> go?

With your diff on rc3, the second MAPTI is dropped, and forwarding the
vfio-pci MSI to its event leaves the host up.

However, a vgic_irq outlives its ITE while the LPI is pending on a
vCPU, so the check also drops a legitimate remap: a guest that
DISCARDs a pending LPI and then maps it again loses the new mapping.
On QEMU, rc3 (baseline) keeps it and your diff drops it.
vgic_its_restore_ite() also goes through vgic_add_lpi(), so restoring
tables that hold a double mapping fails with -EEXIST.

v2, which I'm still testing, drops the second mapping at MAPTI too,
but tracks in the vgic_irq whether an ITE maps it and checks that
instead. A restore keeps the first ITE and drops the duplicate. I'll
send it tomorrow.

Cheers,
/fuad
