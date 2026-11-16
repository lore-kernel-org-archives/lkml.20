Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835778;
	b=vaBvt2x5rtTdmiwuqn1H1PtcViE452N+HOxQzFrCbR3cnyki3sBgKCWtnPx9KTfrwQDv
	 rGVPg511xUzoNqZlFgwBfDGoEaqmt4uMM1/yG1/5Pste05aBskbiQn+J1WPJns9qRAUo8
	 uBJiZDMcMbprwXa0l7AlFQ/U87lhLlpV+saDccUF7sldFlJIB+I5itvbVop/X17XbcI43
	 RB8P7c3CAzQKTV8JbyhUpobF9CwvTvQWJ9K50v62Hz/NjahbynI+iEKqf+zkqzTd0h+Ju
	 0yJvVbTdvR6zgFv+zF4KG9XNjrwAermzGoeE5fAUUB+ASGMhqi18xnTCtPQ7NH3AloA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835778;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=amPjiGpOtCIdke4l/yrc8l6JZjZ/UtQMeu9AnP48ylI=;
	b=yJLdOuSh/X6PR8Ca+9eDcAkLmer/c6CTCxfu1x25Vn2NZl+TUfLNW0NXh95lvW7GL/0k
	 e/rQvFTADss3+avawOKR/yj6ZN9Y6mzTBVZQxhwrPkRBrOQJq6Vf5coINRmAbvWVuNXDr
	 IoWhU8KjRDxcQz3SL6bEO6lklrzSpp/6LKuN+LR71pB0dWxR2bQlFGvNV2+i2Cm7V/Bc6
	 nyeexakf8ugOsk+DwGqxQhDc5rJM8kdZxGoxw8bY4R03/Vxgayo+N9sGp2U3A9Gu7Q5zB
	 3MX0IaTUEsZ3WuQjSsMSzVB6HfqmRXBjk3pvKK/6hKlHp5JLCVKJ6jbr5bZyjzxt2ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HDQ5eqxv;
	arc=none smtp.remote-ip=91.218.175.239
Received: from mta0.migadu.com (out-239.mta0.migadu.com [91.218.175.239])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A92606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A92606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HDQ5eqxv
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=g502higwqKmkBG0dlHtsxFQv+cbldCJE/40G3RLaxkI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794835774; v=1; x=1795440574;
 b=HDQ5eqxv8/RKdDElgWGVPfBOUNfvoiVNf4TVWtMFmWv8StfjBlOFLZdy2jV8idAzRSodI8k8
 RaUXd5X5VokyqmWsF974ubzA+8Gp6wdN1ZbTiDLQysiWslewnlISuTGY8YW6GZNH0lMFHhEbIsK
 jBVWaPwpkjEhD1wYiVYe7wkA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a42947ddd4f56588;
	Mon, 16 Nov 2026 13:29:34 +0000
X-Mizu-Trace-ID: a42947ddd4f56588
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so9997e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:29:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGlNYoL/SkPntBedp1AGcAc6Fz2Z21ZkJyK9FGVmLUYJ2h0TX51Cmp9QqL7VT8EUujdhB9Fmyb75asT2m0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t8gCf/Uu1YSTX8Uz7XvFHdXWfyDuPyGyKdRZG+dues+2rWyBK
	bYgIxh7rityhZ5uBugKIb7F5Bu5fstSeNnxXlNdDnxMHHfjuJF8c70CQUg/1z40lk+JyQVwivWx
	/hMwMENHHEU8yf/sFi3F8goNKp4j/IWbU2XUw6JCh
X-Received: by 2002:ac2:4e05:0:b0:5bf:a911:7ee3 with SMTP id
 2adb3069b0e04-5c17d90d3b4mr200956e87.3.1794835772489; Mon, 16 Nov 2026
 05:29:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261112145814.853424-1-fuad.tabba@linux.dev> <avrzusx1g1ZICo0Q@red-moon>
In-Reply-To: <avrzusx1g1ZICo0Q@red-moon>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 13:28:56 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyGQbS7zcHSRg50c5xVN2AY4AmMc7JqNAvrc=_UhPQ+kg@mail.gmail.com>
X-Gm-Features: AclHuK8CwBlEBiyR4cPCR9dmkgnQ4XF5VSuwS8WKs9gu-GxXMupedl-FY3peK6Q
Message-ID: <CA+EHjTyGQbS7zcHSRg50c5xVN2AY4AmMc7JqNAvrc=_UhPQ+kg@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] irqchip/gic-v5: Fix misc IRS and ITS host driver issues
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Mon, 16 Nov 2026 12:14:50 +0000, Lorenzo Pieralisi
<lpieralisi@kernel.org> wrote:
[...]
> > invalidate have the same shape. The question is, can an IRS miss the
> > poll, or is a timeout here only ever a dead IRS?
>
> Thank you for your patches Fuad.
>
> The latter, though freeing memory on timeout wasn't a good idea given
> that there is no way to cancel the respective, pending, mapping.

Thanks, that answers it. If you'd like a patch that doesn't free the
memory on a timeout, let me know and I'll send one.

[...]
> > Notes:
> >     Setting L1 on every invalidation turns each registration and
> >     teardown into a range invalidate, both rare paths, and keeps the
> >     function simple. Setting it only when registration allocates the
> >     level 2 table would miss a registration that fails after the
> >     allocation, which leaves the level 1 DTE valid.
>
> I can't follow. I agree that we have to invalidate the L1 DTE on
> L2 allocation but that's a one-off, I don't understand what issues
> you are pointing out in the Notes above, if you can point out please
> the code paths it refers to that'd help.

gicv5_its_device_register() can fail after
gicv5_its_devtab_get_dte_ref() has made the L1 DTE valid, and before
the gicv5_its_device_cache_inv() at the end. That happens if the
EventID bits check fails, or the ITT allocation does. The L1 DTE is
then already valid for the next device registered under it, so that
registration doesn't allocate a level 2 table.

The patch Notes were about setting ITS_INV_DEVICER.L1 in that
gicv5_its_device_cache_inv() call only when the registration allocated
the table. In that case the failed registration never reaches that
call and the next one reaches it with L1 clear, so this L1 DTE is
never invalidated. Invalidating in gicv5_its_alloc_l2_devtab(), right
after the L1 DTE write, is the one-off you describe. I'll rework the
patch to do that instead.

Cheers,
/fuad
