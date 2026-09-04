Received: from mta1.migadu.com (out-103.mta1.migadu.com [95.215.58.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75732439F75
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526026; cv=none; b=uVoa6j5bHZBmI84hPsiHEoy/Y4FMYT+ohH/dXkWBRMMLf/pIwKxBT4dondwh1KXHz78beO8zhe/jLxMywkiusMmQp98jdfutUBKGN4dqxexvuibDRR4jaqm6v/JbVnnj6DHjLdpirGS2MxPiamnz4W9CH8Gi+GF2DX4d1lVmurE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526026; c=relaxed/simple;
	bh=/6RRvdPfNSRfPhC78RQVkUQB+HiIR+zg4OQYXsiR3d4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QY0x8Zr3fliihyBfI1RbXN7e3ERkHCbPxP8CuNKuhD0hZt5jPdWnLPbplC5L3Ux52/5pqwN/sHXDg43YICfCiZg7ZezQ9NyEfrBUouB+6+HyqgkpASoQZ9vRbFkdfjmzxzg+uD1CkqnxkZ/DLV6AFHMz8rWn98+tLahKZY5wCDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gvpgVrBF; arc=none smtp.client-ip=95.215.58.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gvpgVrBF"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/6RRvdPfNSRfPhC78RQVkUQB+HiIR+zg4OQYXsiR3d4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788526022; v=1; x=1789130822;
 b=gvpgVrBFWxLabS2Pi08/wTtHZE4RxJlmr/t/uEhJNImNRt0zfrewOJMhgTNpoIrDXlfQg0y+
 MHI/yhNtmbDDmhgmVz62b2i7F2S06olfs3UHYvj47y3CQiigXchc4wo2lWXn/ASI4iJjn06YuXo
 hBCPw0c8DI7G1kti7zsnBW9g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b8339fc4a4600918;
	Fri, 04 Sep 2026 12:47:02 +0000
X-Mizu-Trace-ID: b8339fc4a4600918
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so5260e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:46:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwGykWy6b6stX3mTIkRmIY/Epydxt098gGfkZ+PALk7LpCGUFHwxJCFILJDYjUZhDeAAJGvJfIn3Jf9ZS8=@vger.kernel.org
X-Gm-Message-State: AFuF++nirKvLn1Ez7Rw352WrVCSCegktVF6RuefqJD1VFcGFUtpiQBqW
	l5QYVlRORLRSjEtiYInJbXhttg3kBOLo8zg9lfXl1HGqInHU43bqmzLwXa+UHH0ddHwhErO6sMa
	aRgrscamh4AvggNJpp7swy4wn4Qrjt3Z4jvj1Rp6p
X-Received: by 2002:a05:6512:3d24:b0:5b5:e890:1953 with SMTP id
 2adb3069b0e04-5b6170e3a94mr115834e87.12.1788526017205; Fri, 04 Sep 2026
 05:46:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904122445.31163-1-hemanth.selam@gmail.com> <20260904122445.31163-4-hemanth.selam@gmail.com>
In-Reply-To: <20260904122445.31163-4-hemanth.selam@gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 4 Sep 2026 13:46:21 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwW64qwPPAY7GpGWnW7kTHgK+NOycPD+ztZLu8MxhKEgg@mail.gmail.com>
X-Gm-Features: AcwNN1W9fb-ZaN5mBBYmzsD57qiSfwaTLbZIgob5aDfYAa6RFKBB487JA6wU6YI
Message-ID: <CA+EHjTwW64qwPPAY7GpGWnW7kTHgK+NOycPD+ztZLu8MxhKEgg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: kvm: fix repeated word 'is' in comment
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Hemanth,

On Fri, 4 Sept 2026 at 13:25, Hemanth Selam <hemanth.selam@gmail.com> wrote:
>
> Drop the second 'is', reported by checkpatch.pl as a possible repeated
> word.  Only touches a comment, no code changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  arch/arm64/kvm/pauth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/pauth.c b/arch/arm64/kvm/pauth.c
> index d5eb3ae876be..22ff4b78d0e9 100644
> --- a/arch/arm64/kvm/pauth.c
> +++ b/arch/arm64/kvm/pauth.c
> @@ -5,7 +5,7 @@
>   *
>   * Primitive PAuth emulation for ERETAA/ERETAB.
>   *
> - * This code assumes that is is run from EL2, and that it is part of
> + * This code assumes that is run from EL2, and that it is part of

The typo here is that the first "is" should have been an "it", rather
than being a duplicate.

+ * This code assumes that it is run from EL2, and that it is part of

Cheers,
/fuad

>   * the emulation of ERETAx for a guest hypervisor. That's a lot of
>   * baked-in assumptions and shortcuts.
>   *
> --
> 2.48.1
>
