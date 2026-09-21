Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D345013C3
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790030654; cv=none; b=eAsUy01DXds2rJ+FPlhXSW5EbprICDM1IR4P5bemCNmkbMiUpiSVkkl0KYQYJGP+w8d2mKXShovJcWSuLiroIZzqupS4GVcliztGLVh73oYrddFtWOjd0PdAdm0oLN99856HzlPxdkulIFzU8OVgwOEGa4Y6mecsNdjbCGiFOdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790030654; c=relaxed/simple;
	bh=9QhwX43kAdnxofPPBuUs/5aHrQY41yXWN28ALnl8G8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mmvBymdwBaISD3SDdq7pzLSp8RvjmpYCTXHa65gXlHLKX4hifOhJ1HD82bonhapb919ALiYBGrdUSuR5gtcuXc4SWvtqmV9UAolqh4Fw9IQc87GbZvNyGQFhno62+r4213Uku9q1izX+AcGGm2zsuaWzlk1YBWRdxaHnja5ETCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Rp4QAkUX; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Rp4QAkUX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=kJUN55IvtpETm9ZqDxcYOrMSuGXJ8YYL/bHnk8DOVzY=; b=Rp4QAkUXzHovKgCESQSdyCr8Nt
	JWJRbZglUUrBbMsr/OgNQnO5LC7Jis/A7+PLykAM73iwiVUjGWi30gYc8G5h4+24uN0qqafRc9lZx
	NGQhel3H/qRI+4gzSIm3Eh26WEz8qmONVVpta3RhbJ4rq6Y2aKfJp2iQPl84yZW4QOYAeutWHosfM
	k0s0urejxB+FEVWsEA/wz6xDoGM9v26qF+2pPI6U4sXbE9n28i0GPNrLAxR43hgF1JIzcFYRuZ5C+
	DryCOUojEYmb5/ZDmkIAlayFMlcPQGIdc2a4HNz6krOAUosXU2oAenp3Z9t6wEJD1NfZcwHhqWsfS
	wIkQgf2A==;
Received: from [177.172.123.214] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1x8mjk-005Kj5-Kk; Tue, 22 Sep 2026 00:43:48 +0200
Message-ID: <d162cde5-b53c-4e95-b587-6ee723c6783e@igalia.com>
Date: Mon, 21 Sep 2026 19:43:49 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] futex: fix hb lock mismatch in futex_wait_requeue_pi()
 and CLONE_VFORK hash init
To: Hui Peng <benquike@gmail.com>
Cc: dave@stgolabs.net, tglx@kernel.org, dvhart@infradead.org,
 peterz@infradead.org, mingo@redhat.com, linux-kernel@vger.kernel.org
References: <20260919221730.3707261-1-benquike@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20260919221730.3707261-1-benquike@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hui Peng,

Em 19/09/2026 19:17, Hui Peng escreveu:
> Fix two issues in futex and fork initialization:
> 
> 1. In futex_wait_requeue_pi(), if futex_wait_queue() returns with

I see an outdated comment with futex_wait_queue(), but I don't think 
this function exists anymore.

>     q.lock_ptr updated tohb2's lock after a requeue timeout or signal
>     race, unlocking the original hb1 lock instead of q.lock_ptr leaves
>     hb2 locked and unlocks an unheld spinlock. Always unlock via
>     q.lock_ptr.
> 2. In copy_mm() (kernel/fork.c), initialize mm->futex_phash properly
>     when cloning so private futex hash state is consistent across
>     CLONE_VFORK.
> 

This part was already addressed:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b61b6f95d6722ddbbbd09e689fa41b55fd36f9a5

> Fixes: e5c6828493b5 ("futex: Split out requeue")
> Assisted-by: LLM

Please always double check in the current mainline code if the robots 
ideas are up to date.

> Signed-off-by: Hui Peng <benquike@gmail.com>
