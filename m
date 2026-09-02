Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6951430649C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 02:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788315619; cv=none; b=gl/WS4JqKLpIMtyGvKHL0qDX1SbmnYQsW6MjiwqyK/3M3mPChzhnSmkII517cdpsSGi3gMxpmqaNOy2grbEt+mt5o72eXmdDghEhyqCQWsE1jZdbYE0aovX9nj9rbl2qlDPXIwyNrbbIgTxnC4MI+g1PXLa7j126aED6f5Zyxag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788315619; c=relaxed/simple;
	bh=FeA2SlR4eeQSTB+S4hYY5umaoF+DV3M+TwolG5uYExM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STBPfL+zL4/XoH/tfIBANRvNF5Wd9sJ/YuF/SWIahP1jkZt4qwzF2eotC1YgdgeOXXTkCYgCtJ095KdvbaVGdWw3MNZREMvcCn7nfi9PWqmIoOmzIzWmOCta5VOtIoVqSdwK3FhZMktSs7GLG2xToj2geZtG8BvHxxEB7O63RrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHaNAOvq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHaNAOvq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E631F000E9;
	Wed,  2 Sep 2026 02:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788315618;
	bh=JSNKUMG19ljYjQxMFfJROELQ+OnVuDWBJaJwd3/w0hc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jHaNAOvqsw2rPdbOgXsqask8qk8si6tJEeIGq2dhY1Bkx90JSCjkhgSfTUCPzFQ3c
	 PBrlFLxTeIEFkabxIHQneST/A9a4eY5DF0O5DP0YhnXcSNrhh+xC46qPtu67Xv8w0x
	 L23X4oJzoBM9f6HNRJKbSmCNykhm1WvkzpR+G8PqlKizkKGGvXOZUkmVkexRMq5Zq7
	 V5ZugdBlQntRzdfN0QFBzcgztoAqEti4Zqnl+oK49iCzogz1/chH95xmj5UQz4J48T
	 aoXxhcWc01mdmxPdMr31chJyENr12EawmEQ5H2eV5z9l40PxJdnxjVi/khXiI0S0JN
	 RNXkM4uj23mWA==
Date: Wed, 2 Sep 2026 10:20:10 +0800
From: Gao Xiang <xiang@kernel.org>
To: Qingyu Zhang <usupergate@gmail.com>
Cc: Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Nikhil Gurudasani <nikhilgurudasani314@gmail.com>
Subject: Re: [BUG] erofs: LZMA stream state NULL deref after failed dict grow
Message-ID: <apeH2iPSptCvno8K@192.168.5.22>
Mail-Followup-To: Qingyu Zhang <usupergate@gmail.com>,
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Nikhil Gurudasani <nikhilgurudasani314@gmail.com>
References: <CAPBHda=tMkmjY3-WE-d8jnNfDt5bEsAvu1BCiwOT4FgqqYASEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPBHda=tMkmjY3-WE-d8jnNfDt5bEsAvu1BCiwOT4FgqqYASEQ@mail.gmail.com>

Hi,

On Wed, Sep 02, 2026 at 10:04:41AM +0800, Qingyu Zhang wrote:
> Hello,
> 
> z_erofs_load_lzma_config() can leave strm->state == NULL while still
> publishing z_erofs_lzma_max_dictsize. The next mount of the same
> image skips realloc and decompress NULL-derefs.
> 
> Type: null-pointer dereference
> 
> * Summary
> 
>        for (strm = head; strm; strm = strm->next) {
>                if (strm->state)
>                        xz_dec_microlzma_end(strm->state);
>                strm->state = xz_dec_microlzma_alloc(..., dict_size);
>                if (!strm->state)
>                        err = -ENOMEM;
>        }
>        ...
>        z_erofs_lzma_max_dictsize = dict_size;  /* even if err */
> 
> On alloc failure the old state is already gone. The next mount sees
> max_dictsize >= dict_size and returns 0 without retrying. Then:
> 
>        xz_dec_microlzma_reset(strm->state, ...);  /* state is NULL */
> 

Actually there were similar reports:
https://sashiko.dev/#/patchset/20260714114729.3760594-1-michael.bommarito%40gmail.com
https://lore.kernel.org/r/20260830104109.60639-1-nikhilgurudasani314@gmail.com

I will reply Nikhil's patch soon.

Thanks,
Gao Xiang
