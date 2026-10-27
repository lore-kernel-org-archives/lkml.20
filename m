Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094132;
	b=O64jOKxIU/zuMkJMFpbjx5J2VH6Kloqz8xKWgIeuFpIzgvzvEW8DkjoTYE66pGAILIKY
	 tX57fX2nn9ZiVrZfl9e02SSAj2KGeVhxi+1HWjUH/aVqaXuXJzpm68joWFlOMUW4Y1rRW
	 0oYlEgYa1pwiRZ5X09utxctFxoyhW4lwM4IqFIJk3tZPbT5UWI9UiR6ZGcvEPeO4e4BJ5
	 dhdzrCSQmttE7UcTKMKrbj2IXTmZrRUPJQnL9zmuUBrL5giHJ0ViWFazltkTeeSDkBAdb
	 tNk532JXouSwMB6a6nVtmotCQ4XugwbsRAmgo3/oTgli1hHthPZLGuoPC3iI0xQmGDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094132;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+t8OXJ27yQjE3O++/rKAi/jak7lrU5zBJrJZpSfBZnw=;
	b=ZU5SgkXaKnkyB/96Pwqg95h0xsTUYTJ46yjkY35gThANft7vDUz7zYMOOdDZjdMC8dWT
	 KzQJuy5BDbhiqmbFyhQfgVr/h0ebhZgtxGdnS2fs0JojAGE0twZk3yFAJQoeisOp5Wb4Y
	 XviDmErGk5FlqfHZ69kDAmQJWXOSaTyC6cQ2TNSHB03slZcJvlc9F9YzLVX23+GTB4dwI
	 GVQUi2Qx20pPuPId6I8LB5a+jjqQnwN6BbByBJX1jINbpsxqUC0xQX7D3Jv0SS8hDYYej
	 XVBD6bj++qUs7bDT+LJXeAD6kFzspcK117FrIig8tYIxq1bCAc8g5O+z9oHsybHc2qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CvnzYLZX;
	arc=none smtp.remote-ip=95.215.58.210
Received: from mta1.migadu.com (out-210.mta1.migadu.com [95.215.58.210])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B30606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B30606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CvnzYLZX
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1vSES+s04GHXXZ3aI3e5tzkJqHQjxYx925g4IWtLlCc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793094128; v=1; x=1793698928;
 b=CvnzYLZXoUvOogeGuaysQaL1NdLHz1pTGj8bCOn3sgNP0OCYspxACEJeyRV24wIv7NV5qtYW
 oPO1oatmO4hh6F3l9knKYM4q8xhgYk4Ut6VnVeHTVNE+yKeluUNtDK0+1VDunDSBVijpVh5N73Y
 aeFy3oLL9bZXCDTmWFtMMXhE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2fe5bd57ed297966;
	Tue, 27 Oct 2026 09:42:08 +0000
X-Mizu-Trace-ID: 2fe5bd57ed297966
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so6849e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:42:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxIjveSLhqWEzEdvo+axy3qNV9Rb0zAv0jBvNS1XUsYKnr0f50Vks8LgBF1dcsdMZmEBStgVSbsDF1L8Ms=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhkVxcRrAjRcsVe8WaPTZpwacfrHvMfj3Pehkd+DrtfsAr97un
	gapOQchwZkJ2ajmdqJVBAKwJMgP85oZjCfCAVppbEUD4prLu34hamreVSAub4TgNpfQe1zxbtdi
	lGrqaz6Y6GasCpEeBof1LA4SGr+dFbTyZia/d003n
X-Received: by 2002:a05:6512:2250:b0:5bf:b27b:6371 with SMTP id
 2adb3069b0e04-5bfc6972c1fmr93556e87.10.1793094123098; Tue, 27 Oct 2026
 02:42:03 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027081147.498183-1-fuad.tabba@linux.dev> <20261027081147.498183-4-fuad.tabba@linux.dev>
 <86wlr3xzdb.wl-maz@kernel.org>
In-Reply-To: <86wlr3xzdb.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 27 Oct 2026 09:41:26 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwt5c2GiMZXdaEZ7cb=Op_0FQPXgrih1bN0bpqcib63vg@mail.gmail.com>
X-Gm-Features: AclHuK-5R5nG2ZiFsbhrO7zAaWYXWI133N9FKiM4gKJbvEm8i2qdS390y_nJajM
Message-ID: <CA+EHjTwt5c2GiMZXdaEZ7cb=Op_0FQPXgrih1bN0bpqcib63vg@mail.gmail.com>
Subject: Re: [PATCH 3/3] KVM: arm64: Disable host PMU counters for protected guests
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Oculytic <oculytic@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Oct 2026 at 09:32, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > -     if (pmuv3_implemented(pmuver))
> > +     if (pmuv3_implemented(pmuver)) {
> >               *host_data_ptr(nr_event_counters) = FIELD_GET(ARMV8_PMU_PMCR_N,
> >                                                             read_sysreg(pmcr_el0));
> > +             host_data_set_flag(HAS_PMUV3);
>
> Honestly, I don't think we need to work out which CPUs have PMUv3 and
> which don't. I'd be perfectly happy to disable KVM on asymmetric
> systems, simply because they don't exist.

Ack. I'll drop the per-CPU flag on the respin, gate on
system_supports_pmuv3(), and refuse KVM on asymmetric systems.

/fuad
