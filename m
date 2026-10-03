Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7938A353A80
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791047137; cv=none; b=Rp8Etd6FZhVyA6byyxUeHVS7a/42qFHFU6sb/tVTO/M03WnGOMFWL/L6R5jfq5ABA9rstOY3mTxL7jRMpOfOEG5wvTv5e+ZpTFA0cnajFaCeYh3LueswNIVsRnjuicxmhBI+1onKAkkaK8ptLIm2XOQ+15uypewhA68QK6RRMlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791047137; c=relaxed/simple;
	bh=oNyg1sumQDuKlsQ3+kKQmL/LbIN0o4s4kxT6Go6YTxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/Li3GCcg7bG03ZtbI7z+oHM2AyC12k1fk1MegPL2WGiPSZKGHJKVyhoBrsZJJ0Z8XWiH202W7VeOcxfHt/6CHVEOtT9cxtz/AtyiWmJYDrIEeBQlceQkbRnHQrLexBT8EHUMUJatQfh871RD3AxwdnfYl46BBkV9HTz9xJYflM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=Bux+WquJ; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="Bux+WquJ"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533861a59b8so6688401cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1791047134; x=1791651934; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X8TPVwZiR3zkMo2v3+7OD+ay1QVv3kHT+rk/lDuOThQ=;
        b=Bux+WquJAirvH5CaU/vX1Q8kmRp3JQIcypFMbiFeFbWndR8zs2rte7o4EVIrmuoEV8
         J0cPGwRCIgSi+fYyoY+VjPXiTET9x/cDifJN06dFRNrWCHhTQ5AIXY3dshUcJUvod+hM
         GA+vrKtvo/JqEnGbmq9xA1N7wSULwl+xGGJ1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791047134; x=1791651934;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8TPVwZiR3zkMo2v3+7OD+ay1QVv3kHT+rk/lDuOThQ=;
        b=WuN5KSNDuH5ZHcohw+Xo3I2DJbdnrX/MrkPsBwLleArxV/UHyPypfg/gqh2PzYIiGy
         sadhOeGIr0COghZH6ShuPYjQvGyDSs3MhrYlVxMOt/6QdapEW9JmJPMZptRQx78xIfac
         wLgnA6bhi59LgXgLRBdLblqLNjYKmcMt+gmw0SJ/0FVRAQWv04zjEOXCC9hRoZYl6cXV
         kkqfqTbR3eX2Dbqd/hT5sIM3RFFF66EUkJ3vrIEGU6X6ikqs5VoG/j9/ESMCJgICMA+j
         A4Bg4o/EA+i28ZaEr+8QOXTmyAp6sEAz/Mzg+3LtNWh4zJMxt+hDDX/jgbleckavK5s7
         kxSw==
X-Forwarded-Encrypted: i=1; AKwUvBxQPiRczVK/eUG/ZSKi9FmhzOea/hm6jmSMyAL/QkmeWm7NSMXJiJ8PGwVuVrRG0mZ0Oi9MPwUDCej8VRg=@vger.kernel.org
X-Gm-Message-State: AFuF++lhQtupGOxn6PcsYTmVBrsoQunKBKgmD5VXpZJk7wkwW9CLzZ+N
	A9VtU5Wf0lUnUIUNm7PO1wwUtlb+AWEk2zZ4/aRjuPHp9CKaJONPFN6JJokBne1xXA==
X-Gm-Gg: AYBFou0Qwvfo1fFz6tFmDPcFjK9ABN87Rbub8GTHvTDO+ZJH3gPVx6O2+nUwQWp2Wty
	tUoHS9fzOggGWARc1y0xcqzirSYbN/iV36OIbuzL/QfGpBw3sbcRf34rIycT06OaqWRGZt9xXqq
	2CuREe6CtEkrW7GuDTWr1FtkCWnVA9rJF4oZq4jUY0csaFlktoeaFQWQAIzLtyKglmNieLcCUyw
	ZNqrLsJjeYNps3F3nZs/rX0sv+RcEjUJWWSNlRMLMamzh/VFUrAgnfNM0XjcXIrHhe6x0ILP2Iu
	4de2TrU5C4+aKtVZe+d0aCK8/3VCWvBxjd0n1WHI8E7RsXNSuSiRtWf70Yi1vw3FxYxF9jKzArq
	tw469Ec3fGdvxsqTerelK9F+H0G6iJdf2BeLIE8imSi8cBbxpOVGfoz3vL140aOom8J5dykvVcg
	DHZVUDVsGFkDhaNQJZx/V3dCSy7I6fNa6wJHxVUx2+/wGI+O4V6e6lcSHbhkX6emPlQwgeOhSg+
	KZB987s5t0kobg4gQ==
X-Received: by 2002:ac8:5d0c:0:b0:532:bda6:a48b with SMTP id d75a77b69052e-53511e421ffmr55165391cf.12.1791047134114;
        Sat, 03 Oct 2026 10:05:34 -0700 (PDT)
Received: from fedora64.linuxtx.org ([98.97.107.167])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-919442ce1c4sm40150236d6.3.2026.10.03.10.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:05:33 -0700 (PDT)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Date: Sat, 3 Oct 2026 11:05:31 -0600
From: Justin Forbes <jforbes@fedoraproject.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Allow hmac(sha512) for unpriviledged users
Message-ID: <asE128W4CxHDCFiB@fedora64.linuxtx.org>
References: <20261003160302.3000325-1-jforbes@fedoraproject.org>
 <20261003161859.GA152469@quark>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003161859.GA152469@quark>

On Sat, Oct 03, 2026 at 06:18:59PM +0200, Eric Biggers wrote:
> On Sat, Oct 03, 2026 at 10:03:02AM -0600, Justin M. Forbes wrote:
> > By default users cannot run sha512hmac with the current set up. This
> > is problematic because our kernel builds call this for FIPS compliance.
> > Rather than have anyone turn off af_alg_restrict all together, let's
> > allow a common use case.
> > 
> > Signed-off-by: Justin M. Forbes <jforbes@fedoraproject.org>
> 
> The fips hook in dracut was taken into account already, and it runs as
> root.  So this patch shouldn't be needed.  Can you clarify why you think
> it is needed?
> 
> - Eric

Specifically for the case of Fedora and all Red Hat kernels, we call
sha512hmac to sign the kernel, and a couple of UKI images that are
created during the kernel build. Users on Fedora 45 and newer are now
unable to build the kernel from spec without turning off af_alg_restrict
all together, while any user can build a kernel on Fedora 44 or older.

Justin
