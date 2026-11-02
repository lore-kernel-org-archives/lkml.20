Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617578;
	b=MLG4uRLslMZZkMm28KYbw+8WMWo/ngSeAbCqBo+oMl3Zmd9UTDGZue/y43VlM9EmhrDU
	 VTsK9gWtHzMQrIzZENtBSWFelFCLZFCN3hqgXTKzENdjoprEwdsYTmqXlIw5pYTA3iVqp
	 5BnlnMRUL+JI58mNKQqidbd/7QTaefQLst3FJ/eeA4msCrzmYI2l6bPlcxyA5M4wR3xen
	 LBfgyJbSX6Mzwo/aYHpPWGy1io3DZk+fWumjwWAENciU5DQzLdSzdkJxsvew0rAaEXwz/
	 vfu1J0s3yqEtZJ2qkazyY3c/3WTyabRA2oFiWGm1Xa1nwMxnC8M7V9du1BZ4aGIldzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617578;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=bhafRCmdfcdXVx4Hiqwg3dcxBOA4joIid0EOAjhKCP4=;
	b=Xm0mNS7l3NscsECOmIHYD57BVMZGTn/fKclpoHdfgUGhswueZucM/liPtiv+PERR5HrZ
	 z93xSDA3+VCRYlyOeth/r39qvpTryoWTXXDOIFuZ1GJokOy5/K1S1G3MiQLWrzUo2UtVv
	 MbHHHoz/G9WRYWHMVIenzNyT8nlU1SCU2TvBCW9xLtY1/hGLBP3kbSesvNyEr3CJGumN+
	 M4jMQSbi4pzOBQT3Cohd6ToxoMWRgXf9C8PTNQH6kYzK4oxBP/vZA6C61RreLoa/yABjG
	 aUi/UeJhmJsyfMxhVBl8tbWKD+LigfIIUYwuKm7TBUf9prXJIZDs/XCbXk1yTyn46Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=NfCzOQUG;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25769606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25769606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=NfCzOQUG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bhafRCmdfcdXVx4Hiqwg3dcxBOA4joIid0EOAjhKCP4=; b=NfCzOQUGQuNL9GGK3rskljQhUT
	mhMnRXAQdoB9mzxfkX9TOncmoc1D4+LXQGz0+JfEQbb8QoOLL6umIw3/JP+2+1g0ZnIZ8yDBDHVfT
	jxYQr4jc7InTKzv2KPzR33lQpAiB2levlSH95fHbqhmRREWkhEBq7uKRELIB4iVk9sD3zyHy0uHwN
	R3ZzKAC48Z8UR4HzCMDmotNdXVWtsPRvee/KC1I04JG8Jq3zwGhOFM9JEBVwpvX0WryiSJWlOYIJL
	t4r8w2uFk+ICXi3+g6MMF/6Bo8/EXqnHpGF0sh8pnqG3c/4b4Ff3zoeFPRMcoor9t8/ioV6Fp8S1L
	rl2ISKgg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xNprd-0066zW-2N;
	Mon, 02 Nov 2026 11:06:09 +0000
Date: Mon, 2 Nov 2026 03:06:05 -0800
From: Breno Leitao <leitao@debian.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v2] mm: kmemleak: scan modified objects as soon as they
 are grayed
Message-ID: <auhuASGI3Y30ERpn@gmail.com>
References: <20261030-kmemleak-gray-drain-v2-1-3ec29a96668e@debian.org>
 <20261030120625.c2aa64b3e6378a2e78f2f676@linux-foundation.org>
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
In-Reply-To: <20261030120625.c2aa64b3e6378a2e78f2f676@linux-foundation.org>
X-Debian-User: leitao

Hello Andrew,

On Fri, Oct 30, 2026 at 12:06:25PM -0700, Andrew Morton wrote:
> On Fri, 30 Oct 2026 11:31:10 -0700 Breno Leitao <leitao@debian.org> wrote:
> >
> > Scanning the gray list after every grayed object made a full scan 41%
> > slower (1.72s -> 2.42s, arm64 guest with lockdep) when the pass grays a
> > million objects that do not point to each other. Scanning it at most
> > once a jiffy keeps that at the baseline, leaves idle, file storm and
> > mmap churn workloads unchanged, and still removes the false positives
> > at HZ=100.
> 
> Thanks.  I'm thinking
> 
> Fixes: 04609ccc40c4 ("kmemleak: Reduce the false positives by checking for modified objects")
> cc:stable
> 
> Agreed?

Maybe, I think this is a another new way to fix false positives rather
than a issue/bug fix itself, so, I would keep the Fixes:/Stable: tags
out of this one.

Thanks for asking,
--breno
