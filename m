Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C07D3E4100
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790425210; cv=none; b=gYyyKCRn4nzXDDzT1lA6EvP/X5S8H5QX8cvhDv/iGZ3X1b+s+fjj0aV2BUB27rXRGBeL0U2D77isRQxYbY0nuhsXJTCtrjjNbJljge78e75IxUoVgqAt3slCPX1OxX/INhkT6A2LV0w4PsPBOVvwBaLh36+EHq6xUSEfGPVpRTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790425210; c=relaxed/simple;
	bh=WtQ9d9s0/x7zIw8G4gHljWmH7whIqxmzeOdsYOhYWUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgzTAvBFGIEK080mWvb5mlPkWFYCTMQjnrQrDI+WT6FwkFng0ZgTvoMkEmzYxYrnrDqo2lqivuNiyX9p94mxYDkg39nnmznLthVTVs7UIKZw6XG77lDMitPF/7ZkqJkVqdk8E8nW0/f4xvxz2VNtO38vCWM1WZm7crRM5ua/Y7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X3Yq3sFE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X3Yq3sFE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790425207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E31FkanMbaQ1+vpIZy6aCtCgHErmsnWwaF2nf7eFp48=;
	b=X3Yq3sFEgeWSh2UvJyLdIACU8fMvcpqCpBwPPnTA2+HVwEa1UUzicjjlYTLoPptA0uKaJV
	AgSOc9K3ppsBaPYvVVPCVie8G5zOeUKqvC2F7stW5ZA8YL6n2LkEkfJ7uIDdT8ZRvZ6cdS
	IU9upG189YgAykUApEXRN+DTVQLS2yU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-684-dhKzXkF0NC-wbTvPgHRU7w-1; Sat,
 26 Sep 2026 08:20:03 -0400
X-MC-Unique: dhKzXkF0NC-wbTvPgHRU7w-1
X-Mimecast-MFC-AGG-ID: dhKzXkF0NC-wbTvPgHRU7w_1790425201
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BDBD4195394B;
	Sat, 26 Sep 2026 12:19:59 +0000 (UTC)
Received: from fedora (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 6410C30001A2;
	Sat, 26 Sep 2026 12:19:53 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sat, 26 Sep 2026 14:19:59 +0200 (CEST)
Date: Sat, 26 Sep 2026 14:19:52 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] x86: uapi: ptrace: guard register offset macros with
 __ASSEMBLER__ or __FRAME_OFFSETS
Message-ID: <are4aAD2ckM4FMT3@redhat.com>
References: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 08/21, Nick Desaulniers wrote:
>
> The register offset macros in <asm/ptrace-abi.h> are guarded by
> `defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)` for 64-bit, but
> were left unguarded for 32-bit. This causes havoc for userspace that
> happens to use identifiers colliding with these short macro names
> (e.g., EBX, ECX, EAX, DS, ES, FS, GS, CS, SS). Without this guard,
> userspace is forced to be super extra careful with include ordering to
> minimize the chance of collision.
>
> Wrap both the 32-bit and 64-bit register definitions under
> `#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)`, and ensure
> User-Mode Linux (UML) defines `__FRAME_OFFSETS` for 32-bit as well.
>
> Assisted-by: Gemini
> Link: https://github.com/llvm/llvm-project/issues/217413
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/x86/include/uapi/asm/ptrace-abi.h | 4 ++--
>  arch/x86/um/asm/ptrace.h               | 4 +---
>  arch/x86/um/ptrace_32.c                | 1 +
>  3 files changed, 4 insertions(+), 5 deletions(-)

Acked-by: Oleg Nesterov <oleg@redhat.com>

