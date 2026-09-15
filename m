Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0464BAA17
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493452; cv=pass; b=hojL4H5M7TzyIW8G1N08qMVn9zbd+RYMjLCbUGR8b41Rcd7gBmVAYt6RGKvZ5g85eth2qOLDF8xOaXubP43euCX34AfIAxAimIQN5F93BJpuMJt499U5mRqsi4j7OnBJPSEGsMcCYNmmB7alL30s5kXtIC7n9Qt2i75Nhi8rDN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493452; c=relaxed/simple;
	bh=eAukwx8JnJI3cGyI5uMY8PGJs7GR2oj88tMoLLoGPII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c/sOwJpeMlkiQCaitxseDJXrHGNfgnrAWYFiV0nJDS6/JexSFN7WFy1lBseNItzCYlzL2xy4cavQswLC/XgI4cMPyhQ7XojkjuIXQaS5iRh9/T2tjEu/KQEix0NwPk6/RA6PfwhVhmUVHjWvbAKcLv/yHfyFmx0mmn6JuXcYWt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pMKXXO6k; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pMKXXO6k"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5eso918501fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789493447; cv=none;
        d=google.com; s=arc-20260327;
        b=NsxTEu6GUETvLawC9GBhDKPFKOqbpNBej8cA3AGbojdyBZh1OxZrXTQb7aTGOQORR5
         9hqOHPCbrS9YgNjStRth98d6YYYm6j9CnYPq0zo2AQN6rC4nG8tf3cMUv4uZME2hC3sD
         ZtB+oMXLocudLOiP5R2LTwslOCkaQilKxfXMU/mK9DYRTAzuQZFfTc997o6guK/15aYb
         C6wtduD34JT/fstpjQp33koDDpM4DV5B6HOTv98gNUx+uhtz2J3mOHnskBrB93p4hGgv
         GEy4Itgkv1P6gDKRkzO4RrRfryROCyokMx3N9fKbXhYJhHPEbsxPVJXL8A4GJpEr8chH
         Gxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eAukwx8JnJI3cGyI5uMY8PGJs7GR2oj88tMoLLoGPII=;
        fh=xXOfjWmuApuLj+Cc0NMyms/xVRoEK/e6O4CSFYSKxXs=;
        b=YzwyGZuzN2aJhfBoEcFcpMnBoyImeNDKlxTYMcdyC9anRhPrf6LuE8G+TgA3nMwTpf
         jTC8aTD6YgCRZ1tLMoFlq/7jyj2ciib+7Rkn/cBO0ET6OyekRGdckssHNd7uTejbej6j
         9xU32Za9LwixWELiTiRD+4J4QxD0bkzKc0fY1ZBS9+PVKnrij6+5vrf4480xJ1NEBeqs
         RJWtrmAloNmc5e9y5+jotC1BGpL+G/jaHDBskCW+chmNgm+TUB7c0B6ePdFGqcofsG3I
         YDj9AVmBIhiSvT8A2omoLbUitCGUwBaT9Lugq+FMvCWXsgpfaPxUjRH3An2ywIWvzldU
         uiAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789493447; x=1790098247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eAukwx8JnJI3cGyI5uMY8PGJs7GR2oj88tMoLLoGPII=;
        b=pMKXXO6krim404h3lA2CBgbZIVtoJ3AXBFXpC/pDA7sW5dwR/U4xQM1yl7VXrT8Mvw
         7wKqDpX5Ixgy0et2Qlw7jPxKGHJi453rrY+1OBAjVNGjpDSB3/w7g+AVTRCYn0NtraWl
         kyxT8fIel5gvFbIzM+gLWuVlVrtviHjW693GxDF4XgZ0iDfPyBG9IpMVqG7Vyf+Rzlkk
         xaE3nzrTU/XjS8MPcc40T25H/dnPBl9rc4Yr+ig6uCFYgkuhDT4eEWtpqrsQEvsOXXoJ
         WDVwIRZAgLFA/oIFw5MRmv+KGvSXlH8g6KugWMBZ+llvUQtQjDOH5Y3lH2ZYMZJ150H6
         SKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789493447; x=1790098247;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAukwx8JnJI3cGyI5uMY8PGJs7GR2oj88tMoLLoGPII=;
        b=2wvU/N6v6vm1OLPYcMzRHahGSeeA7qyjRv/+5u9ZAeTXYh1FM45vBiRTL/RQ+EXLCo
         gDC+GWZNXFYVi1GceZC8jSEtCf+LMFaF+8Lp7MSHx4NwdKZAqFegWrjfM+yvINPNgwmM
         6QWft72O+pKP09rYPTbni6h/9txDM0fWY86RC8dJccyD0ImBX0UoZMv1pC8hriaiR3Fz
         fVQOnbsnT98RPywNOBq2HanD1bx0YsAZTOet69ozKu95Vh4iVQ3VLXJ8wUvpeIfu0+T2
         ProVxM2RdAyp/huyA1R6LJq8d8gPIHhLUmJY91uP6bfSbQbbZGB5siVBckaDxduyUTvf
         O/9w==
X-Forwarded-Encrypted: i=1; AKwUvBwcgn+OYWb1YGPl0pacz1nnwx1kPk4GaCM7n259nfmklvLPqNFCFnKEl7W77aVUfyWBuOBSB2s5eMx76s8=@vger.kernel.org
X-Gm-Message-State: AFuF++nQCJ6gE3E1nS00R/4y1y2FcozqQkQNpUca446/5VUo06wYSWCe
	8/SJ1XeVy+jzUtk8GoGrIN2PTwxZANbnsZI9sspwDR0a27agSLSvgP7u+DHYKzbtxCdPbt9Nc8N
	SHrGQ4+q4KXn/JAvr3IgkgRM0XxNTDPk=
X-Gm-Gg: AYBFou2pagv3M6lfSl3K6WNvDQ1z2SG+ga/Eh8ItjkurYUHV9h5DSAJcaiNyWwZReWm
	95lGpaiSysgKnmFZ8zXtpJgvRBstDuSBhDUZezHuw3NlvaDfI8JokIc0csGijR0F6svsjpENuQY
	ND5TWazAVRgOucQLQYcpDX8sFYqL7NPDJa3+V69bc2hk3RWc4LCy4amgWT/mj88YbgitmJoRBDN
	It0RUrY/FqOB3hN9qM8GRZRjw/hFUYmhj2nVH5fPGZgrfHiV/is+jLWJTR2gnrycUrDEMcOM8LA
	HlSHqW3jb1JFeP7ir5n5A6fkOcnXWAxSKij2tuTtVl42iS6E0B7qhQOxYYv2v622oR3l5BQ/AXm
	3BOmCvHRcRVkd26v15nphqA==
X-Received: by 2002:a2e:be9a:0:b0:3a1:ab57:ea2c with SMTP id
 38308e7fff4ca-3a5c887ed99mr24859181fa.2.1789493447239; Tue, 15 Sep 2026
 10:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-test-zswap-wb-ignore-eagain-v1-1-6fb715c22cd8@kernel.org>
In-Reply-To: <20260914-test-zswap-wb-ignore-eagain-v1-1-6fb715c22cd8@kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 15 Sep 2026 10:30:34 -0700
X-Gm-Features: AcwNN1XbTKjkghV6cjRHkn5yooQUMbPEmMgoyX4OeoEMM6gp36nDsHu1A29JVbc
Message-ID: <CAKEwX=N=e+x=S1qq=9fsNgd63axDjjSWgL7MF1pJFEQw71TOVw@mail.gmail.com>
Subject: Re: [PATCH] selftests/cgroup: ignore memory.reclaim -EAGAIN for zswap
 writeback test
To: "Harry Yoo (Meta)" <harry@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, 
	Usama Arif <usamaarif642@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Tejun Heo <tj@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 1:36=E2=80=AFPM Harry Yoo (Meta) <harry@kernel.org>=
 wrote:
>
> The zswap_writeback_enabled test fails when a write to memory.reclaim
> returns -EAGAIN, which means less than the requested amount was
> reclaimed. attempt_writeback() propagates the -EAGAIN to the caller,
> and the test case is marked as failed even when zswap writeback did
> happen.
>
> This heavily depends on the performance of the backing swap device.
> Reclaim does not wait for writeback (on cgroup v2), does not count pages
> that are under writeback as reclaimed, and memory.reclaim gives up after
> MAX_RECLAIM_RETRIES passes without making progress. On a slow device
> where reclaim does not make any progress before writeback completes,
> a write to memory.reclaim fails.
>
> On a VM with zswap enabled, where IO delay was injected via dm-delay,
> the success rate of the zswap writeback test drops dramatically once
> the delay reaches 11 ms: 7% failures at 10 ms and 79% failures at 11 ms,
> n =3D 100.
>
> When zswap writeback is enabled, ignore -EAGAIN from memory.reclaim and
> determine pass/fail based on the zswpwb counter because that is what
> zswap_writeback_enabled actually wants to test.
>
> With this change, the test reliably passes even on a slow swap device
> (tested up to 1000 ms delay). This makes the test resilient against
> the performance of the swap device.
>
> Assisted-by: LLM
> Fixes: 158863e5d7cc ("selftests: cgroup: add tests to verify the zswap wr=
iteback path")
> Signed-off-by: Harry Yoo (Meta) <harry@kernel.org>

Acked-by: Nhat Pham <nphamcs@gmail.com>
