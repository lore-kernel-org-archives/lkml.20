Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55644B0CAD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275665; cv=none; b=GH2jFC9+bqPI5gk3sSQTefq8LMOlvNHkR1GeqChC+wcszz/zsRucuZ+FXJYY7r19mSH70YGX5d9LOqYwLmeeBLY/LnWJeN+Jhw5LwR4pMSV7uxaznd0daWjWYyENVjVUP8JBsjNOX8aME2nYemwnCa9NtkNy+8rWSnOGg0wdsmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275665; c=relaxed/simple;
	bh=6q7gSlc1vq+7PIjqRz/E4SeI9gsEb9ZVkkTnLkXflnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KXxpqpSPQZ8VvQQD2rdc1E4FMfL9R+EGeAK4vV1P7jjyU2gPzjGCwu1xF+1yQhpMEQFr0L1nrvbPS+vfcV3eY9iqR/yha3H8SmYSxnRtWA8SK3sq35CmL7XS1qPQAM1+cP0ft9dz+Ln9t2jWQvdxfw/RR23XMjjldaKOiQbeu9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=cECIf0dv; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="cECIf0dv"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3907540E016C;
	Thu, 24 Sep 2026 18:47:31 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id T8y6TXYLWKUQ; Thu, 24 Sep 2026 18:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790275641; bh=3glayFCzgbPovFyEox5JMajVqNNTaskd4OKX/hrPMVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cECIf0dvDr+XRYQppit5EmjVSZ4WXDjydPkS8ibI/1BRTnASC84dY8iNCXTZRRoFH
	 XoAybrg9KI1enEin2PNKuJyQCNyGlR5jaAI5FoMhWaKO64YooxXlROYE0S86vHDc8h
	 YIfO+ttVQ3hQQWAu5AnD2UQMkWmVrwR6iGmqq3aqeeefdOLgEq/nZwcSkHrwKM0Ntl
	 WRY/34osR08jtlg0tweH6v+QcINwNVA0Y44ChoXxEVvVMvW4D5jqpIiGDbaK/qDXQr
	 FbtV3yRwS+in/ZtjXR84TPam3fsgCeVc39oN4c5OIWaca/Z9YrVfuIeOQ1bAHTKHTy
	 vDaaGf0Gv4VzzdLv3nlQmQ0hLjybeLQmZ27Lbvz6MB/vvhBNsb8Rn2TkcFKLtckxNL
	 clqaljKiYH1QO/Jh3+XbEbXAtxoA2neofJS5o8i6ONrDjLsLiMlMAxv7qVpsTCvpVQ
	 UzJxuZiMWBHnQFZuLd2kX1OnWKduAPa1V9lBhC7fqFe1XDk4w+jo4nCMpS0TY2qNsc
	 kv5us/05OH/gMs3JWeytpU3WpMPAMv5KxEz632UNJhEJReRL2lXVaVI9aZsRpU38Ys
	 o4wxomXd5tw3ORZiaYp+zxtQotZlPgsy5D78xhftO/DzC2OETi2Zta1Er0346ZIowv
	 Y61AOFimG2kDtCiRPFFgnABI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6CB4C40E00B8;
	Thu, 24 Sep 2026 18:47:10 +0000 (UTC)
Date: Thu, 24 Sep 2026 11:47:07 -0700
From: Borislav Petkov <bp@alien8.de>
To: Andrei Vagin <avagin@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	"Chang S. Bae" <chang.seok.bae@intel.com>,
	linux-kernel@vger.kernel.org, criu@lists.linux.dev,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 7/7] selftests/x86: Add tests for signal frame FPU
 portability
Message-ID: <20260924184707.GAarVwK1eLHWLrIuag@fat_crate.local>
References: <20260924041604.3209659-1-avagin@google.com>
 <20260924041604.3209659-8-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260924041604.3209659-8-avagin@google.com>

On Thu, Sep 24, 2026 at 04:16:03AM +0000, Andrei Vagin wrote:
> Add a new selftest tools/testing/selftests/x86/sigframe_fpu_portability.c
> to verify signal frame portability and consistency when the xstate size
> is shrunk:
> 
> - test_valid_shrunk_xstate_size: Verifies that the kernel correctly
>   restores the xstate context from a signal frame where xstate_size has
>   been manually shrunk to only cover active features, as long as the
>   FP_XSTATE_MAGIC2 marker is correctly placed. This simulates migrating
>   a process created on a host with fewer xstate features to a host with
>   more features.
> 
> - test_invalid_shrunk_xstate_size: Verifies that the kernel rejects
>   (via SIGSEGV) a signal frame where xstate_size is smaller than required
>   by the enabled features in the xfeatures mask.
> 
> Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
> Reviewed-by: Chang S. Bae <chang.seok.bae@intel.com>
> Signed-off-by: Andrei Vagin <avagin@google.com>
> ---
>  tools/testing/selftests/x86/Makefile          |   5 +-
>  .../selftests/x86/sigframe_fpu_portability.c  | 246 ++++++++++++++++++
>  tools/testing/selftests/x86/xstate.c          |  12 -
>  tools/testing/selftests/x86/xstate.h          |  20 ++
>  4 files changed, 270 insertions(+), 13 deletions(-)
>  create mode 100644 tools/testing/selftests/x86/sigframe_fpu_portability.c

Sashiko has a comment which sounds valid to me but I haven't looked at the
surrounding code:

https://sashiko.dev/#/patchset/20260924041604.3209659-1-avagin%40google.com

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
