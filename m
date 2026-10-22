Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792644137;
	b=NA1bROowbb5B37TLAZxkO2croYYoo4ln/qZ5rnNdOD2vaSOMT9fXm63TDMHUMJLLyYAW
	 ZedbCU15gFTQY6AWFBqkf+EOaKNSRcOSBnJN/yyXhVbTPHvYNyATv1XqDpXjTKMnpO0WL
	 H1X431sDrzif8zE22fnP6F78hadY4BdqdAJ5BuC1yeO54YfWa9I6SPPIcqnu+vm4tJeLv
	 YWkYTP06qkknjhRRtRVmq7oP6aypMkl31dEB3auQ6+3KX4kMCHcnrC0dMiilpc36hqHq/
	 /api5EC2VSeGebmlnXgABCzOZ2e5HCeIKVKpgVSYpEKsPDMNRYsPkiBFtfHTyj2I3sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792644137;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wrQ/+Av1DzqRRXs8RU4Ox6p4FcISjvvg+0pKuCllMhc=;
	b=j8w/+DyvMEKPjKrR2SrhWB6rJ2VgAtM+OTJrXJvAu5DjwED8yoWujPMYyYjNs/Qs7qPo
	 ClD4nTu10a4brXDlnoOeIo5tewMDkusYgUm8XCLR5I0OZZABzt/y+UsqWwL4Ue6gdrFZA
	 K9WtI1sxa7SqL2VDerwyVRq+z92bGBnHqTO9eS+wVltOhK1NSlPouG12RR3nFeRjiMdkK
	 ThBhL37ZuRs7J1NehfFe7X102IHXSw/yXE63/3un58IR+jPIvI47J5ixV/suwSrDIJkFH
	 bY1e9OCwEwRlmoIJ32oFJR39w8sucRqASBlKd6Hli+C4ctE02/CFD/GV0jmR3Ikj4IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=aZ3RX0La;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2058606A319;
	Thu, 22 Oct 2026 04:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=aZ3RX0La
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D356C1F000C1;
	Thu, 22 Oct 2026 04:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792644136;
	bh=wrQ/+Av1DzqRRXs8RU4Ox6p4FcISjvvg+0pKuCllMhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aZ3RX0LauZ6cVQGmqdAenFyYPcxWq7/U1K3E56jgQPEajLZVEsiLlgNDunZjxX/ur
	 e2g5wj/zNz/Xfvk/B/3YgEwCvzG6jPWJOlUmwyKE8mlrpI5B1puIthRXf/sV4wg0ZG
	 4IwB5kQcFv5E5MlKyLguDtUJUgPjwRk5+TuykyfY=
Date: Thu, 22 Oct 2026 06:39:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yaroslav Shevchenko <yros22776@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unused macros from wifi.h
Message-ID: <2026102202-venomous-nuclei-8d6a@gregkh>
References: <20261021204633.33067-1-yros22776@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021204633.33067-1-yros22776@gmail.com>

On Wed, Oct 21, 2026 at 10:46:33PM +0200, Yaroslav Shevchenko wrote:
> SetFrameType(), SetFragNum(), GetOrderBit(), ACT_CAT_VENDOR,
> _IEEE8021X_MGT_ and _IEEE8021X_PSK_ are defined in wifi.h but have no
> users anywhere in the tree.
> 
> Three of them are also broken. GetOrderBit() duplicates GetOrder(),
> which is used by rtw_recv.c, but casts the frame header to
> "unsigned short" instead of __le16 while masking it against a
> cpu_to_le16() value. SetFrameType() has the same type confusion,
> whereas the SetFrameSubType() macro next to it casts to __le16 as it
> should. SetFragNum() passes a constant mask through le16_to_cpu()
> where cpu_to_le16() is needed.
> 
> Since these macros are never expanded, neither the compiler nor sparse
> flags any of this, so the first user of them would inherit the bugs.
> Drop them rather than fix dead code.
> 
> No functional change intended. Built for arm64 with W=1, no new
> warnings.
> 
> Signed-off-by: Yaroslav Shevchenko <yros22776@gmail.com>
> Assisted-by: LLM

Please read https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh
