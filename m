Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866090;
	b=07yHXXYjqgjkNdUIyUi+sahYlZKeOihH0AWLxur3s3GSRURY9vgz56CUfDU60xZxKAok
	 f2IvINX/GRMR1Cy0Sh9xw5iQJT8qrQdUe6wtXTj54a61ZYpn+jCuQ5VJEzxbLr0UBanYU
	 8jEmPz19SyN8h8CqNzsN2HTQN+UAnVq0nL5m4cFM++W+esNvoiKpvQu8Kc8ITVDIyIma2
	 DTMT9O/D/Dmupc3DuaP9F5tvWe5GXHKqR5r6frkAPtTCY92Rbd4pak7tiA5yQq8lnprOf
	 fVaSz+aYTTkMWCuA7dRlnMVH1UyNyj+gLLJBHZFM1mosnaUpIypMP3kmWHHd6INx20A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866090;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=slAjwWQDYVO39KamLXHsue/lfUEBTiuulu/3jpX05gc=;
	b=LI5PzSUBkfwC3cPRAbXKQUhMFiTalJs5O/v2XGqLzcJXtHdfeRdQvda9UTraiZIO5xVe
	 KLKJ0/ouH5MMF0Nbh75KFYTHaub8kbsqFFKG+GqvjuEhVpysBbxoXBYFemSJ8PbkWkOhy
	 3PnaWKOkkHCUtOQoKrjXjAxiUjJJOGNcaMxqbQ0ol8cH+0rO1mYJvxTX5dsZ/bM+1qigx
	 C3zFul8+YgT38FbD+bO0iIB9koCfFVQ+rIRqdTVlmm4oBtLnPXtk9L/LLMUmaW+a8Olrc
	 kBkdVH3z7+Q0tIoRB1iWAi8YTDe+jHc1/OqmliXR3yrBkVTf9TJUpFDvjjdhfa7Fh0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="QR/ysJBv";
	arc=none smtp.remote-ip=95.215.58.56
Received: from mta1.migadu.com (out-56.mta1.migadu.com [95.215.58.56])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4EB606A335
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D4EB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QR/ysJBv
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5dNzhcTaPSPAHoNbodXyj+zv2hdRrCEJXr1Y2dhrWX8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793866086; v=1; x=1794470886;
 b=QR/ysJBvl+GJUPglNTkM/A6Z59ex+vCXeglEdffePj1QVKtsCiB1QoXap51GWfQ59mC3JGVk
 efi0mTPVzaLQU/qpgA1PGp79vKCvudR4xl+jVA+j7qLIrYqVcwuJAYwRBwDgEDvoVn4dVM0aGwH
 7lx6AfxZbzVT09HtZOTl5UWA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2df445156f7ab0bc;
	Thu, 05 Nov 2026 08:08:05 +0000
X-Mizu-Trace-ID: 2df445156f7ab0bc
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so3780e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:08:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxTv70cJ3hM4ZV1iWHctAzxPXdG1X/YJm0LDvWeDVCmihnWu/0lCmQ3onagqbllTKfhpD+ecyXm1PP871o=@vger.kernel.org
X-Gm-Message-State: APuU4Z92bPPGm6ycSx78++0spypScTGQhgoqu4Q923emTTK8yVMzibkB
	/N5PnSBx4c9jmJlFTVIqn+VfsccdNDCwn1hh+0ZnrBjurV+hoTXc8b2ERhcShoQFuiGWMIzfOX/
	wfHEsy8bxV30H3c9qKZzCmdIezVeF7go444HvuOe0
X-Received: by 2002:a05:6512:3e02:b0:5bf:f0fb:2c9c with SMTP id
 2adb3069b0e04-5bffb1dc195mr77268e87.5.1793866080846; Thu, 05 Nov 2026
 00:08:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104124451.2148724-1-fuad.tabba@linux.dev>
 <20261104124451.2148724-2-fuad.tabba@linux.dev> <aut5t605onnuBWfk@kernel.org>
In-Reply-To: <aut5t605onnuBWfk@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 5 Nov 2026 08:07:24 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzEa-VZZ7TffdR0dY=92-iqX68yWkPR1zz7uzEX+c+f3A@mail.gmail.com>
X-Gm-Features: AclHuK__AB0z6apl_Wv0YuqPm4x2AvnN93O1z8V4Fr2KgOylyOBS-uUCz6gu5jo
Message-ID: <CA+EHjTzEa-VZZ7TffdR0dY=92-iqX68yWkPR1zz7uzEX+c+f3A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: arm64: Resume stage-2 teardown where the walk stopped
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 18:30, Oliver Upton <oupton@kernel.org> wrote:
>
> Hi Fuad,
>
> On Wed, Nov 04, 2026 at 12:44:50PM +0000, Fuad Tabba wrote:
> > +u64 kvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
> > +                                  u64 addr, u64 size)
>
> Returning a signed value here would be a good idea so you can percolate
> walk failures back up to the caller. Since that WARN_ON() below may as
> well be a BUG_ON() in hyp code.

Ack.

> Otherwise, rest looks good.

Thanks Oliver!
/fuad
