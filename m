Received: from mta0.migadu.com (out-130.mta0.migadu.com [91.218.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B02D38B7D7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485140; cv=none; b=fS4NbwjZFxGgv+1XddMnl0aDQ0HouC6WxeuK1vExCDkU80817MVUGl8PriN5/nG2QoSSEW0RsZsbKzmwiG9MH0dcWflhvb5sAS3zGcdMth5UpuHDKe5UhR81ti3f6YjBJx4PjcuunP1LuaZRWNE6LBCOm6U+B9HdmPsKiDqLoUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485140; c=relaxed/simple;
	bh=3r4+AODjX+xG9QP/OqvGAgcLWtNZcO4KFLsZFVHz2bQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DX1gLKjQ/IYg2fMCKnbvglLtxjwHMFTRJh95yVprf6HPCmj+aJv5R3JxWXESo5VIvgfiCrCkDeXyoCf+9A+4aIwS1Y+5M4UHRU6m9F0u79oIQoF0au7LfTCg1hsL6K30DK49YoN3bcVal59TrCBU0KaVLvewJJL5zH35c73fnag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EC3VB8ck; arc=none smtp.client-ip=91.218.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EC3VB8ck"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3r4+AODjX+xG9QP/OqvGAgcLWtNZcO4KFLsZFVHz2bQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789485134; v=1; x=1790089934;
 b=EC3VB8ck4Gs3Iahg0muAY3jFqE8AyVfpuFsV3xQNkG4CC0BlZzYbVOFMRtZiBIlxyCNzHHm/
 5T6aBG2DsLWpjzD/8xXm3KlYg3Z5yAvGwWlY5dlHKvsVw+hjb9mubG3FdDrhb5uj79hOOFgK75s
 Jm2UC4d0WmfSpmGOmE/yF4go=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bb0a4d2e3eb518ab;
	Tue, 15 Sep 2026 15:12:14 +0000
X-Mizu-Trace-ID: bb0a4d2e3eb518ab
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so1184e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:12:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy/UYZPOBxetC2kNp7bwJuJz5sYcF9+CCzS47XIC5QEYWL7Y0VukGD0fVUtzs/LPqLERGwP0zwOkNcaS7k=@vger.kernel.org
X-Gm-Message-State: AFuF++nPh/+gRPm5v/RjnKgI8wOTFEKpQ/2DdsK7zQPrLqXxsPz5ZXX3
	uq1rkpdo8wy4bgiunLgduGEJYdjsqs1zz1tXX/LADhkebhK5jXUEffQoTdAaWqJbX2Xa9GLPV1v
	D00CAxXb8I6YyYUbsktnODDuWNrxXJakiKLJB4SiN
X-Received: by 2002:a05:6512:2390:b0:5ae:b1b3:145a with SMTP id
 2adb3069b0e04-5b8b2d4e662mr188401e87.6.1789485132544; Tue, 15 Sep 2026
 08:12:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com> <20260807164322.2970811-9-sebastianene@google.com>
In-Reply-To: <20260807164322.2970811-9-sebastianene@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 16:11:36 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyezsXuFbw-eYUY8uPEd4bt7K=2K8HRg8tfHF2EA1O3uA@mail.gmail.com>
X-Gm-Features: AcwNN1XLaUwovCsrbP246c-_MGSA9ZbLdMWDwGYNe45yhrglwzVmarj2CpR2p1U
Message-ID: <CA+EHjTyezsXuFbw-eYUY8uPEd4bt7K=2K8HRg8tfHF2EA1O3uA@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] KVM: arm64: Restrict host access to the private
 ITS tables
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com, 
	maz@kernel.org, oupton@kernel.org, rananta@google.com, 
	Sascha.Bischoff@arm.com, suzuki.poulose@arm.com, will@kernel.org, 
	kvmarm@lists.linux.dev, android-kvm@google.com, bgrzesik@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, perlarsen@google.com, seiden@linux.ibm.com, 
	smostafa@google.com, tglx@kernel.org, vdonnefort@google.com, 
	vladimir.murzin@arm.com, yuzenghui@huawei.com, zenghui.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Seb,

The approach is right, and it has the same gap as the command queue in
06. A few things:

On Fri, Aug 07, 2026 at 04:43:17PM +0000, Sebastian Ene wrote:

[...]

> Make the original layer innaccessible to the host by donating the table memory from the host to

nit: "innaccessible"

[...]

> +static int pkvm_host_unmap_last_level(void *shadow, size_t num_pages, u32 psz)
[...]
> +                table_addr = table[i] & PHYS_MASK;
> +                ret = __pkvm_host_donate_hyp(hyp_phys_to_pfn(table_addr), psz >> PAGE_SHIFT);

DIV_ROUND_UP(psz, PAGE_SIZE) would be safer here. psz >> PAGE_SHIFT is
zero when the ITS page size is below PAGE_SIZE, which
its_probe_baser_psz() can pick (a 4K-only ITS on a 16K or 64K kernel),
and then the L2 page is donated as zero pages and stays
host-accessible. Same in pkvm_host_map_last_level(). (Sashiko)

> +static int pkvm_share_shadow_table(void *shadow, u64 nr_pages)
> +{
> +        u64 i, ret, start_pfn = hyp_virt_to_pfn(shadow);

ret could be an int; it holds the errno from __pkvm_host_share_hyp()
and the function returns int.

> +static int pkvm_setup_its_shadow_baser(struct its_host_state *host_state)
> +{
[...]
> +                original_table = kern_hyp_va(host_state->tables[i].base);
> +                num_pages = (1 << host_state->tables[i].order);
> +
> +                ret = __pkvm_host_donate_hyp(hyp_virt_to_pfn(original_table), num_pages);

Could setup read GITS_BASER<n> and validate base and size against it?
base, order and the INDIRECT bit all come from the donated snapshot,
not the hardware, so as with the queue in 06 a compromised host
calling this hypercall can name a decoy table it owns: hyp protects
that one while the real table GITS_BASER<n> points at stays
host-writable, and the L1-pointer patching this restriction exists to
stop works on it. (Sashiko)

Cheers,
/fuad
