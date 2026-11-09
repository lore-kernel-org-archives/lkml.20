Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229954;
	b=NJhD7eYH5h2+vC7Agno6sF4wbGItq2FV5Hu/6AjCcfPpBRAzdj665VA8bml4IQ5upxSC
	 futXQtDxeaZXYLie6qQNY/ZXjfUduDl3+qPuX+0ofbq21VWr6jpt+zyaHfmwItzCCm78L
	 DFSzMzkXzhu35c2pGNtQhMFMtr563mq15oYm9hShYDYL/knni67nyrykvx17ax/rp09bt
	 mguaume2OGgsDvBv4OxTuZcY5+iIIDbd151w9spfS/lXkcCgEJnBCxTAyBtxJ6djrwKMb
	 yMmNyNmsYcWxMx5UlhaWt7XzuzQtGGUgR1Vz9Zg5SvEhoEk10kbzaSwFi9UJVc8ux1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229954;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=VcGX3S/ok2ofcwS3uJdO8rQXnNkquiVnumUqc1g1VFE=;
	b=soj20ttTAa3yzy5/aFOh825nMsFMn/iySB6z69peUZjTmWQAKOs2thdSTVCJAT7/FikV
	 lTbzip4i43XxNgR1uIZeqCRTxR/+3NpFTDO47ZvC/pSxEWMWuZvD3hZmX8S4T4LeVsSoi
	 eXC5gbWPCWaG2QKnvYnoSBVGiv91XUWOlzoYcXoM6EwiXs/35ZPH5tBzsWhSpX6QGzo96
	 Amdim+KwZWAL/7tvfkyj5dh7O2cxejQ2uuuOtudu0Pbc0LdHgAHFVJhQM6AjNE0gTM8+F
	 lWSJzvfyCx8c7ByGKn7LHDBnB+lZIN43Tvepo8l7Zka/yLttMlRYbzlf6KZgLXjR2ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ll9SyF9z;
	arc=none smtp.remote-ip=91.218.175.195
Received: from mta0.migadu.com (out-195.mta0.migadu.com [91.218.175.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DC4606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29DC4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ll9SyF9z
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9ZfmGyDfW24qGm7656Xt3E7F30kmlnVfQdHu0DS+Udo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794229951; v=1; x=1794834751;
 b=Ll9SyF9zNlSMAGfwbEgHRzmiDmW6DEXh9Xfjr2F4nstXo8/Oxv+CNcwJl9Hv3ehjqU8sK2Tu
 RmSHN5VFbSCkpXljtXH9MiqAaCeVkDYTDtS1TgaWzkoTfieZag7EXJumvfpvdP2cJeH3g9s6pZK
 P5B04ihTOsK+7mEM1edYdDog=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 86ac3c8a92c8c74c;
	Mon, 09 Nov 2026 13:12:31 +0000
X-Mizu-Trace-ID: 86ac3c8a92c8c74c
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so5482e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:12:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHtXLbR6pGyEiH4zXE6UV0M1hM05HsAdDEE6dvlZ1KtBJD9UlROtZQEMBdRjXJcHRJpc8JkRmh5z0lmhrI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/xoqFvUucAT+mMpVC2RHwAfSAe7gZ+f3fjPtOI0tTq24EI/Gd
	l/e68S8kN618eOxjSmzK8tKadX8MGsdMscFfslQBFuHF0DiMhoMywlCI/ux4K39JWrRK7pGvBDm
	O+Yg/Hgsm8K4hOwVNhMYdpjk+YpbuXVMH8U/OI7fF
X-Received: by 2002:a05:6512:1109:b0:5bf:c3e1:532b with SMTP id
 2adb3069b0e04-5c00b60a427mr195461e87.5.1794229945777; Mon, 09 Nov 2026
 05:12:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102141304.126883-1-steven.price@arm.com> <20261102141304.126883-11-steven.price@arm.com>
 <fa0ee5a1-4c49-4c1f-bfbb-c270dc4b6301@arm.com> <CA+EHjTy970AWnhYoZ5OqxQ8ojCAELeejw60y2NmpDsM_ZMdu4Q@mail.gmail.com>
 <06e52c9c-9026-4279-b8c0-53a54a667dad@arm.com>
In-Reply-To: <06e52c9c-9026-4279-b8c0-53a54a667dad@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 9 Nov 2026 13:11:49 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzJ1O8=q0rL5CkLKN3CBDr=TkujEw_M-W0H=BJfmrTEzg@mail.gmail.com>
X-Gm-Features: AclHuK9lv_i4f5zskQj2LbWryVS8Q4D5sdKCijE4VdtfsoeeW5x-cT5K6pQCDgo
Message-ID: <CA+EHjTzJ1O8=q0rL5CkLKN3CBDr=TkujEw_M-W0H=BJfmrTEzg@mail.gmail.com>
Subject: Re: [PATCH 10/11] KVM: arm64: CCA: Support runtime faulting of memory
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Mon, 09 Nov 2026 11:35:31 +0000, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
>> applies as is. Only how the expected state is computed differs: for a
>> pVM it comes from the per-page share state rather than an IPA bit.
>
> When you say, per-page, you mean per-IPA or per "backing page" ? i.e.,
> can pKVM do something like :
>
>     kvm_ipa_is_private(kvm, ipa) ?
>
> (similar to Realm) or does it need the struct page backing the "ipa" ?

Per IPA, so kvm_ipa_is_private(kvm, ipa) would work for pKVM too. A
pVM's page is private unless the guest has shared it, and that state
is in its stage-2 PTE at EL2, not in the struct page. The host kernel
doesn't have a copy today, since EL2 handles the share and unshare
hypercalls and the new state is only at EL2, so the pKVM side of the
check, a hypercall or a host-side mirror, is part of pKVM's
guest_memfd support when that lands.

Cheers,
/fuad
