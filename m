Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F9E3A6F06
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466860; cv=none; b=gnQdowjN1EljWnIyP+VghUhvSzM5DUMlOasHXgplwRwYMgeZNd6VB8SdMe3J4C1WWxeSY7BBz9mjFGU9lKv1uWhWz52jXW3hv/dRPlrSXaGugZeCvzUxoBu6x5fWd3iGzfdQ3FBPAoFFKrN+bmWJ+sY9VY20B6IBx0Uw5FfhCuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466860; c=relaxed/simple;
	bh=2p+gZUX1lywqlPgIj4po3j9VmppV3CjsC0U+DQIfxj8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z5Ygq9Fo62nKzIRfJsdJosJ+h7f2YJV/8XXQmX0GJWCmjyMNoDClLLBjJAuU3rYDv3mLwEbTtCgqp0oK4wW1VZfuUBdonsTnheJcuTlJZVDILIBYfDpcWDixB5HXI1LtEZdxVk0BPb/fqIt7UtI54X9IxWzpioCNkSpRl/xhflU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQO5w9M8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQO5w9M8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564641F000E9;
	Thu,  3 Sep 2026 20:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788466848;
	bh=2p+gZUX1lywqlPgIj4po3j9VmppV3CjsC0U+DQIfxj8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=nQO5w9M8u/O0h/rNT81unSxjiltu3uhgADJgzfQJmDKoL7io3aqNaZtffq2vbjc7I
	 q2UtZlhWSdBVQQEMGNCbRru5irWASsLl+Ko9DJvHMUgAcZtEpg9/gnfDd7nhpwWTSg
	 SFRomvsXXqfy2hx/yIiHkUMB+GMBw92T43tk4V8JFP0ajhIGm/9fpmXwZ1sFNlcqJB
	 kryC25dRb1rtpj1utmwn8LWv95iRM+XaFQ7xGKPUMizOmk/aSnWEZ9WvZCo4BvPhr7
	 Bx7fCrGhNz+ObSNjjir0c7/XphKv+8j4ewACBpXHQl5QgRsKJSadaFsove9+nu3aKI
	 hcgaWF48Ao6fw==
From: Thomas Gleixner <tglx@kernel.org>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: Daniil Tatianin <99danilt@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Steve Wahl <steve.wahl@hpe.com>, Justin Ernst <justin.ernst@hpe.com>, Kyle
 Meyer <kyle.meyer@hpe.com>, Dimitri Sivanich <dimitri.sivanich@hpe.com>,
 Russ Anderson <russ.anderson@hpe.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, Daniil
 Tatianin <d-tatianin@yandex-team.ru>
Subject: Re: [PATCH] x86/apic: Remove dead disable_esr machinery
In-Reply-To: <20260902220124.2931854-1-d-tatianin@yandex-team.ru>
References: <20260902220124.2931854-1-d-tatianin@yandex-team.ru>
Date: Thu, 03 Sep 2026 22:20:45 +0200
Message-ID: <87tso69jdu.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Sep 03 2026 at 01:01, Daniil Tatianin wrote:

> From: Daniil Tatianin <99danilt@gmail.com>
...
> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>

Seems you can't decide which of your alter egos is author and signing
off on the patch.

