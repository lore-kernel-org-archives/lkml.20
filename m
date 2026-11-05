Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.91
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869128;
	b=uZSJK8tzYRLiaApyD0vnOlm1R57iqQpqtyjS1rEKjTrwLrH3XwN+wCRY3CM7pbz+nFc2
	 Ys1+22Z8O95iN7JIuAMxzCHtPbTbFxJTOpqK/1NnC8lkuIDS5uTEo+DZCoh8turcnAk7u
	 CuK+0Lu51qyeURudfEfoKQpkpwQnSuN0SIIUln8BGNwtQS/fsBhmIcVm8j4Vv1j7nMW6Q
	 ZlyVmFU8BNVYeiVd5AOxAUdUfPnM31mPtc3PekMGVl+dQcDtKiltSogmEIv6gOMsUh03v
	 1oIDTjV7mCkUvD2McJvuHzHiP7zP0DXmtrA4u89w2ucg3mM6/reNRHzuL11UiwLry6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869128;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0J35juf+Q3wPkqJ/fEvR/SIaQikfoEpWGs87Fk8Zd4I=;
	b=UxORMbr9ugDA8LbbK5FNPf6ZZEe7JvMBKmBoBQXETqGQ4jjC0rhZcKqElyVvlpvxmR9j
	 gzkSwqlfyvSygXIoaQ0Kd+ejQxmoRUO+fDSeZ60A3KBAJMioMXMWXyQG++0X2WMDQAlPQ
	 BaNSQan3MbHaNANh3qO2d//avVdN/gn1qqdaU2TabFXiL/jHyXeyd2xx28mnDoger85JU
	 Av1bNfoJTvjZJui+Q3/j+eagotVJDpHlAN4HtZnC8wzhfdGj7xauj6DYUO2oKJ06JmEbr
	 DbT6Q5BKxRxDH9BwkmMb6yEe2RaqZaKKyh10QoN54025U26cNTaWOnTKvbM9ccKryag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=gsCSAo6x;
	arc=none smtp.remote-ip=91.218.175.91
Received: from mta0.migadu.com (out-91.mta0.migadu.com [91.218.175.91])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE974606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE974606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=gsCSAo6x
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cl508koB5a8RnOsym5lLE/Q8Iyz8NnCi/Q9gPQjRJbE=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793869125; v=1; x=1794473925;
 b=gsCSAo6xxfa454vUOwOtxISoS12cy9iGy8C6X4GfY/s1TEbommUYUa1d6SkXj/TbNB++76Fi
 KVRgSvM9LZbWjUzow+WjG6rnOcF4xDmI6P3KGcBnXAqwd3eMd4mzrPy8SBDMsohgk3wAcZiGHM3
 zgw/34NkcgFyE/ER9+wCMWZG4DFhWW0TG7o4gQdtM3SEW9E4fbSbhZ7KLylFBHWLzK7yZ1Px8AB
 av3rXhYzREQ6O6n5jIyOM0SZk/4fAgX9IzFBB4wS9PUhr0mFg81I+7b6ucCBZaAfTkR91uWkacH
 nhfbKAFajgoTk4qZS3fQBgVfER50z+AWC7SIbpRz1+oqg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c9cd18ad5c886574;
	Thu, 05 Nov 2026 08:57:40 +0000
X-Mizu-Trace-ID: c9cd18ad5c886574
X-Migadu-Flow: FLOW_OUT
Date: Thu, 5 Nov 2026 16:57:33 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: Clarify half-baked review tags
Message-ID: <auxE_RJJKYf0gPlE@wyuan.org>
References: <20261104171744.439209-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auw_egkhHADKXL90@wyuan.org>
 <70a3eccf-2f4c-4816-a3d7-cd0a6708b5a9@oss.qualcomm.com>
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
In-Reply-To: <70a3eccf-2f4c-4816-a3d7-cd0a6708b5a9@oss.qualcomm.com>

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> On 05/11/2026 09:34, Weijie Yuan wrote:
> > Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:
> > 
> >> Refactoring of driver subsystems or some core driver parts often come
> >> with change of the actual drivers.  If that happens within one patch,
> >> people giving "Reviewed-by" tag only to piece of the patch, like one
> >> driver, and ignoring entire rest including the main concept of the
> >> patch, are not really reviewing "the patch".
> >>
> >> As explained in Submitting Patches document, the "Reviewer's statement
> >> of oversight" is for patch:
> >>
> >>   (a) I have carried out a technical review of this patch to
> >>       evaluate its appropriateness and readiness for inclusion into
> >>       the mainline kernel.
> >>
> >> The sentence is complete, meaning it does not allow implicit variations
> >> "this patch or part of this patch".
> > 
> > Agreed.
> > 
> >> Reviewing pieces of patch while ignoring the main part of it, is
> >> much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
> >> not be applicable.
> > 
> > But in this case, I suspect that your "Acked-by" trailer will still be
> > interpreted as an ack of the entire patch in future git logs, rather
> > than a partial ack and/or a partial review.
> > 
> 
> Which would be fine, Acked-by has that meaning and no one really counts
> Acks or tracks Acks for any metrics or patch quality purposes.

;-) Also makes sense.

(I just posted my last one and found that v2 was also posted, what a
coincidence.)

Thanks!
