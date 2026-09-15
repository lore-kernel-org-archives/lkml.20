Received: from mta0.migadu.com (out-130.mta0.migadu.com [91.218.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0CB488757
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495502; cv=none; b=svDFjefEd37JHfXQufuSDpwvuyGzUnR+Bgk0R0ABn7QnxBPRxI/HdEub76JXjdZQAh5Fc2vsvFnhQYQ21IMsjoCjPrDZbcCl+Iyr1T2CuUp1TFmArCg2yx1Hd3IDrVTYSwLA8gGfNBEzXldpf91Ss4fCIunMs6iP3dPVd56PYc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495502; c=relaxed/simple;
	bh=9DAZE6K15U/g45s8JliXutNziNld3UlxJr1abslGfTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sQK5N1r00djkuQW2QZOv56f+2IpB53Em+KxY2LENK/stSTuVMrTLbmUeh+68EM53Sf4kNwGaRbwMqCOR2uzIT9soPL8p8Ms9GO2M9KPhXI47LTsb5OI6pTcvu1tMSG+8Lyv3/zq1xUGzpulRamsoU3lT199IwECGyCQ1Jl91R5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HluEc1XT; arc=none smtp.client-ip=91.218.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HluEc1XT"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9DAZE6K15U/g45s8JliXutNziNld3UlxJr1abslGfTA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789495498; v=1; x=1790100298;
 b=HluEc1XTBUNzBvxUL8Z+iKwtSCSfz1ffANkNL4cSgliBlgED4t5J7/Xb5ZOjAjGxeYM9ZQ1t
 ZOTlNkNGQ9LG5C6M66QAtSpjZqyFfHKV7C+SPSmJAuHcQed5AgeR/ylWSW08YNv9v7rRUgFBJk0
 QNTe4zpnqOtyjkvzXCAj06CA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 689daa772eb73eb6;
	Tue, 15 Sep 2026 18:04:58 +0000
X-Mizu-Trace-ID: 689daa772eb73eb6
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so1005e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:04:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy/R8+PIQ5F8idloTM/3M+q7OTWQpfbiy4UI6Qx4QTkmRS0yzSIsk28OgQwXTi2lmyx3feefow1J9txKfA=@vger.kernel.org
X-Gm-Message-State: AFuF++nh2pwxojhJ9WSAwDdDMYoqQIBlXVzJ0qcgB2M5Kil1DibLua9V
	RHdc27sM8xYCt7uwAuTUxNGJuHWvRfwUBHtKl4vUgjAWfDDk8bCQRXQM3voZcz4OBbVGOrvoyGd
	b8j9EGSJz67KXeSgSE0mMf1ljGupDo/qL+Ek4zmQG
X-Received: by 2002:a05:6512:620a:b0:5b4:9dba:7403 with SMTP id
 2adb3069b0e04-5b8b5cd8e93mr4722e87.13.1789495493112; Tue, 15 Sep 2026
 11:04:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com> <20260807164322.2970811-15-sebastianene@google.com>
In-Reply-To: <20260807164322.2970811-15-sebastianene@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 19:04:16 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw=GvKLgYt3bgcGMB_sn=0E1mN3YAiEwiWKsOcNVysjHg@mail.gmail.com>
X-Gm-Features: AcwNN1VyJWDmZjD0VcMqv8P4IMQ242-aiCsST2pako59aYERzk6NxGlaeT182mY
Message-ID: <CA+EHjTw=GvKLgYt3bgcGMB_sn=0E1mN3YAiEwiWKsOcNVysjHg@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] KVM: arm64: Implement HVC interface for ITS
 emulation setup
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

A couple of things on the wiring:

On Fri, Aug 07, 2026 at 04:43:23PM +0000, Sebastian Ene wrote:

[...]

> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
[...]
> +#define ITS_PAGES        (2UL)
> +
> +static int pkvm_init_its_emulation(phys_addr_t dev_addr, struct its_host_state *host)
> +{
> +        size_t priv_state_sz = ITS_PAGES << PAGE_SHIFT;
[...]
> +        priv_state = alloc_pages_exact(priv_state_sz, GFP_ATOMIC);

its_emulate_release_locks() runs this callback with its_lock and
its->lock held and IRQs off, so alloc_pages_exact() is under a raw
spinlock. On PREEMPT_RT the page allocator takes sleeping locks even
for GFP_ATOMIC, so this can't allocate under the raw spinlock. Could
priv_state be allocated before the locks are taken and passed in?
(Sashiko)

> +        ret = kvm_call_hyp_nvhe(__pkvm_its_emulate_setup, dev_addr, host, priv_state, ITS_PAGES);

ITS_PAGES is a fixed 2, and num_tracked_entries in
pkvm_its_emulate_setup derives from it, so the emulation can track
about 500 ITT pages total (dte_entry is 16 bytes). Each MAPD pins its
ITT pages into that table, so a system with enough MSI devices runs
track_pfn_add out of slots, gets -ENOSPC, and the queue stalls. Could
the private-state size scale with the ITS's table sizes rather than a
fixed 2 pages?

Cheers,
/fuad
