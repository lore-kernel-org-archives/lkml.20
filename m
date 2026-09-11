Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F6045FFCF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789129344; cv=none; b=l30PUEAB2yiZoB7FQLOpcJ9zsDoOZUZkutvYFmh+9xbgedl/ab9awMVzRVCPH90Qw4bLCz8dsSUsuuMC1WzPy7wkcekWJY5swFklCPWPwtuCwIZMT+7vOiStkjuzPGQOc8VstnpD//ZCFlfQSn/siev0bs5bkolAMXc5VKtAED8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789129344; c=relaxed/simple;
	bh=MgFjQH3kgdFgCoc4l/+xy8WhFKmK4hGtujrcyhVeg+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kO/GR28L1QfxZaxM6cn5ccUihH4ajHtYCuJLghiRZQD+Rkdf6LQRcnalwvbGy96L4VDngYCuKYt08CBliWcHZM1YRY9gG6cfP9s3/F7ExKaK2sNoxXRyqYjPjmWPORVwUg/V0YzzYZvh16a1bh7E3ihkPih1bxbX5Athi+82F1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KD/IBNkB; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KD/IBNkB"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so5445635e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789129341; x=1789734141; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYg6ENX3iBZcZ6V+nXDUolx1uCJT2hGf2/9jC8O6fjE=;
        b=KD/IBNkBlmYi9BaD2CAOTo91IKTd9SyP1TI8CVINtLT99raWjQpWoKV0dQvtuRSXoD
         ay/kqzMfJUimTgK/YMNJomS9rgjfMWlBAUWZaeQd07pP1ZcIMD0ZeetvRnRSdFUnE8ox
         JL0bjC2c7dCapB0Vw0qZzqh6To8E2vQkE1BQ9scs//hub4+17Kxz1CLY2ZpAbM5QjJyB
         6S+mPJgslo2iAaOsZv4pvQHHeKzvCvvUaqQFnZFuSDc+5oEBYVmpt65pXNpOelIr7LZZ
         ozljC+uIM9MmL33+BIu5+6vOSKDzfP6Lj/++Y9Y2VjnnthckEI0E/HW3/HcSIA6scYyt
         PRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129341; x=1789734141;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aYg6ENX3iBZcZ6V+nXDUolx1uCJT2hGf2/9jC8O6fjE=;
        b=tI0gYSAuuFmIhFVfLKDALeUhK+tpu8vRZDV5r5K9O9GuUrSTsTFiWeyEdwhVEdJ2bl
         ZTv946XE0yoXF3wlXq1pofPQX7PDxAojbaUjd0WbLqElY7da+lj9TZzqO/TauRR9Q1oe
         Aw8vULxar+/akY32XV5+r9hF1niRuNeMpPTaHyIE4OSTMH6ga2Y0emzXuB1SnaS3as0l
         8SLhBjQVGWGACvCPE8OkihcJvDGA5wUMFhHfYvTm0MqYip4/BemzXg+AKAoC2NkKmgjV
         ZklDA9AtzXkbrD1YXU0c1rtl8q0UUKjGf55MqWQLq3IwOHiSPAa07P65DSNkwi2x3qm/
         cnNw==
X-Forwarded-Encrypted: i=1; AKwUvBzz7s2dCToZR+xZv5tgJoH/tZusaCtmvHt7V+YGZnKvzjUvnpU6VXt5BSE4ZBZ7DJOdt5uXg03Ai3h9vec=@vger.kernel.org
X-Gm-Message-State: AFuF++kKVj8aSTdpeawE0XQKGMMOn20NUemmpektA57gcLZ3MCgO/rk+
	l4qh533QuoQVmJO84tYmBzsURUNa+6Ig+ici24Davp3Rt50wYwK6zkkk
X-Gm-Gg: AYBFou3shxk8mxGOarEz89XUInDFzLkASpIe+JiUTbeXj2CIpf4thmExDB9uBPWuG/w
	eUkuE/gY1u4S43kOK7N1z+OD8HIqC8OhEglbrGDNAuJHzc7m11ntsEJaO6gV4EcflVK+KYCQcGh
	WcEy8IdX2RlH9ILy1h3ms6GjBype0D1LHzL2IMACz6OGsHwVN9bkxzAb9X7ITSA8iRxIHxQeMzG
	yTPLYSPu9KfueUo4dHxkWWjon/uHUvJ76njSdA8Iq+/T2Xm0JGgRYj6gpsD7EwWfUvlKhVCx89I
	WSK6eqKYGBNU4XtmOW57whcr58H2ejvbKPyc7CHyNnNUiW5cAtYM19LpK7tz2GD0FZep2WUOkYt
	2iTc6nafi7rdEGg+kM0TFtJOHmKYYPFdoecaO82Pb38acsgO0n7t2vSwWm3X2FuuqzoPdcLuhq+
	vORbIOzRQDr0dIAKZcFx8DfVj+zxxAbcaX3XExCTOyS64o59fmBQmYyXnmEQsugHQGJ9k=
X-Received: by 2002:a05:600c:c493:b0:49d:2607:4ada with SMTP id 5b1f17b1804b1-49e619bf31cmr80924325e9.14.1789129341343;
        Fri, 11 Sep 2026 05:22:21 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm164864835e9.7.2026.09.11.05.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:22:20 -0700 (PDT)
Date: Fri, 11 Sep 2026 15:22:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: drivers/dma-buf/st-dma-fence-chain.c:207 test_find_seqno() warn:
 passing freed memory 'fence' (line 195)
Message-ID: <aqPyeNLCsy-k0DIz@stanley.mountain>
References: <202609081301.6ARYAElY-lkp@intel.com>
 <3f26027d-805f-4ab5-a181-d56a2708c50a@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f26027d-805f-4ab5-a181-d56a2708c50a@amd.com>

On Fri, Sep 11, 2026 at 09:49:54AM +0200, Christian König wrote:
> Hi Dan,
> 
> I just double check and this one and the other "warn: passing freed memory 'fence'" look like a false positive to me.
> 
> Any idea why smatch things that the memory is already freed in the test case?

dma_fence_put() can free the fence if we drop the last reference.
Or imagine that we aren't holding the last reference and a different
thread is holding it and they could call dma_fence_put() which is
also a use after free.

Incrementing then decrementing then incrementing the reference
count doesn't make any sense.  We are relying on something else
to hold the reference.  If we can rely on that, then we don't
need to increment and decrement the reference count for certain
basically random places.

regards,
dan carpenter

