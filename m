Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415BC2E54D1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790736741; cv=none; b=dXnDrC9bOoUjdkoSJTyh9/wJT5WKwm6bfTpcIJwwB9w+lG7cHiHhRcLoWmT2m0IqFoqxnxEhHmfA7X5Cz5uDwTNFMZy6W2v3XikWQ8lQcnLfiMKkFCQdYHHIRaMe64X1kcppFoiUuamMIOR1WdfLqU6DCK8fdboKX5Agyqmkaag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790736741; c=relaxed/simple;
	bh=qCWJdhaFgboCMVvlnrhgl1QiFgLR1FwFOYikqmtBQ00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tx5ssxcpfwMnwNJoly8uV53+I1gUpHbpNWWm6swLzHoYWgIRnWRLDphAIIGAYHkYsHfdM6gtXpyiGE88Gh7C6bhJu29M5QH17WlbbHU4uBR4vdAG6l/Ml8T6KJTGTnwxjTkBiTP3VTa8jSvf3Z4N7j+RFZfOphSz5r1zwpBmEcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=N0Yp5S9Y; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="N0Yp5S9Y"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0D4C040E01F9;
	Wed, 30 Sep 2026 02:52:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gMIaQsTnHGhv; Wed, 30 Sep 2026 02:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790736727; bh=Wa8ENAPdP0iSscYkOIWjKLnsjySMzzbpYlnSAGWK8Gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N0Yp5S9Yf5sYv4doS01pBNIngSnGua4Z54QurpVq/Ejf/6DnMtRQgrqBoOZ/2yG1c
	 8c4nuCBKaMB12dJk06fKaneIhtgf/tkJIcbR00lVKHdD4VykpwVN5FowsKBixEMK/s
	 gBRmayZhc4x/ViiECNSxIUlGwIRYLD7u33GqzCb81uQ5VZnaIz1SZGsJXYgmJbJxCN
	 YjZ7I67LGLIOycFrMDQyd3EHlRrKhZfDlvFHjL/lgmWvjeC9uiKhJIzJxYpOsUtZvK
	 eY3lU924cIRCma+s0QxddyidDp8N7ZnRavrEOyr0lX0yEBZ++2DaCmGW+/NZQx3MK9
	 Ga0kyZeHVCdGuMVUxKwDWx121hkP0xu3hvXUO1dfg6QG6zZTYpC5kwCO98kV9CZp1X
	 1+VdVJVM1k/8XwUkF+5KaegnpB8DW3n4EKiP/1ufE5TmuqHTbVnwYzr9Iammgne94g
	 OBgXO7IMXq1ic2XkOAebPjSTcEAND/4kMiw6nrQaHkNxJ1wgl7/SXJio8MEHCQdHqr
	 ulChZNqCx4XWuA5VA5nctejYuf+SDVFf0dMNSTA/n6KzjRVqk9MhGUv/7cOqdsDv9J
	 lfr1OR7Y93iHjahTa9rt0fBL3+hm4lzIqqR2upYMXGsHChbzEcqkfVTFlyhkLrs5P2
	 +C6YaA5UuF5U5FIbu61VbAyA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9464540E01B4;
	Wed, 30 Sep 2026 02:51:56 +0000 (UTC)
Date: Tue, 29 Sep 2026 19:51:53 -0700
From: Borislav Petkov <bp@alien8.de>
To: Andrei Vagin <avagin@google.com>
Cc: "Chang S. Bae" <chang.seok.bae@intel.com>, linux-kernel@vger.kernel.org,
	criu@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 0/2] x86/fpu: Allow restoring signal frames with larger
 xstate_size
Message-ID: <20260930025153.GCarx5SUn-XMHNdly1@fat_crate.local>
References: <20260929232621.3745312-1-avagin@google.com>
 <20260929235700.GBarxQTLOrWy1I3UZr@fat_crate.local>
 <CAEWA0a6McVMNv1ALC7EoEeA9-7_7u_b5JrsqixifvsfVJ7b_8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAEWA0a6McVMNv1ALC7EoEeA9-7_7u_b5JrsqixifvsfVJ7b_8g@mail.gmail.com>

On Tue, Sep 29, 2026 at 05:02:50PM -0700, Andrei Vagin wrote:
> I think it is a misunderstanding. This series is actually the next step.
> The first series enabled migrating workloads from older CPUs to newer
> ones. This series enables migrating workloads from newer CPUs to older
> ones.

Aha. Any particular reason you're sending this separately, after the previous
set?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
