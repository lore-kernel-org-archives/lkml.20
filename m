Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D1E4BEE49
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789167077; cv=none; b=aM7XL4yb9N3hziO/yT02bE8rud91b8ruxfhHivWhhdCceTzTr+vejJ71vXPcZpCGujoDXbzTjkWOaBdfuikT2o2BofygZEAxOHES+p7dIuYlEZRMxYtZos0ztj4tu/P1LowhTumoR5JIU7GXZGPTQ6cx0GnPR16pQoif2fxDv8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789167077; c=relaxed/simple;
	bh=WuszOSuvbqD8TkSiGDsvjzA7UbjiYA/y76dC6911dVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AydLytTZG6kE6D/ZNFDYcTljrxLj1xZ5Er2jJQntH5I4Jitk2CzP27hAPCuT1hoYiGAOeFWAQSOT+UG6yQjTZG8oB2HW3DjLh191atSOzYc7b3Tmw1K5bwQIgCDBaHLSSrB8EzBc5InhHnCYyvJnBYIw8h//jomsVOlneWJhn5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnDvRrOU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnDvRrOU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so495995e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789167074; x=1789771874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZGSo0dQwPRhPDt4biflnyco60O6gQHBMyd0ue8VnOGE=;
        b=FnDvRrOUTnrM/HtaUpUFTvVlP3hmzHJ9FvygCjGbHrp5BhPQcQKldxZbIgxEafx36S
         DKnaRF2vJQDRx2AEb2eXCrICe3707cEMWyBRk62WBz0oKOSZcKGDvsI/tiIE9FYlLl1P
         vhNOP3sdF3Wu4KpbFuJz0Vg3ijH+HI8POreB0KV424AXpU+NnAjFYAcC3Wt9NH0zG7J4
         N4nJNGdk40Iga6JTTGKO2Sa0lTX3t+Aj4VxgbgMMslZNf+B4X+1Z9Lp3Ba/8n+icREsm
         5qjbC4sj6lTGLjxvlt7fn6b0C3tEck/aqzL04DvYrqfgSy6CTw0UcB1JcYF1YXkSkrxf
         m/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167074; x=1789771874;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGSo0dQwPRhPDt4biflnyco60O6gQHBMyd0ue8VnOGE=;
        b=sDDX3OHzNPfHGXN9dBVTCu6QoOHfzuJk/ODJhz9pP3XqQCEpxk9CHc7a7sjFTiBps9
         wjrK1wvoyop33i3n4A267DpSW0qmAbvC7iYiF34IkJ73ZAR2BKxvSHglT5JK4cV2Ytoy
         NFTPTBDeDs6T5tyhL1vhIvGXiyViMDm1qzdyanucszoKzTmumzss6VmXU6xBwOEPsJeB
         epQsXvWYa5UFT5T9Agek6FgDZuIJvYX3a9KfVB7ArZWsPsDxmt5f95He9UURQcGhpEKI
         xJiqQJF1gsBx6Co0wC+kEvrvVw/QsvWWqSb67WmBmIFaOJj9j7GDo+ZloLusFCEKJYFN
         pxpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKOX49kk1Dz+puyMNOamtQ9Qn5e6x9sheZEWeT6EReRwz33cfRk0gZtsj5UKl3xTtg2/fuZuSFa5/o/5k=@vger.kernel.org
X-Gm-Message-State: AFuF++l0Eg6xfFVIU0cAKm6FUXF8NU2N1fkgHGItjvgK58SlNvfIr9hP
	sArJrRk75/AYrxaek9Px1VGUk8Klp8Vm3jE697rOEzbhBm1ixEbIuZWY
X-Gm-Gg: AYBFou2LEKu9GAOcYsq6LewQvLpCaqdrCYjTBQWxEADQr1XRXFFi73kl/1HPjJ1hohs
	ECOtWBH33Yz/Dk9pG7aSw9vOcFP21NhcD9dP6AK07f/BLUj6G32AL7yTF41+JaYudTHCM34intJ
	Q2C3/kh+R8rMYGKWsosc3tls4YRNWPo+GJGiM+KJZbehAozdIb9dallDNIPtqgk/k7hAgFUNg12
	lfneq5lNKrUF41w10Ijf/9Eraa5M2s7OQlVjDu1iAKMinylZCvQJkL46gLw9y/UfiKO8Veu44iq
	12hXipSX5CMKbbN3vNYPa6AxxvlVBHOQywXjKXcZArOFgWiKo9Spf/QjHP/bnccxx1ZgljhiZxI
	95lEHGufukTMjGh/OUzyGOMo0Fc7SgoeCfoNPcLlrgOgtw+7lMmNIv2mUFiO7peAQUeiXkCZNsH
	k1qR2UKCDFAEVL8UXfQoJp9nnq3qlGD7wh7Tu1kynSihwupqkwZ0OHO1gSaQXZGILaRqz+fFMfS
	cGge8AebDrW1zN3MnmJJciVfHWj4j0o9qocgvfK1ixPWU9eij/CVbeHR76L5FGDnKloRrmemmXq
	jXcmu1+MxgWemvDPpHuJZ30VB4BWRKwXMY6oW3mUod1p
X-Received: by 2002:a05:600c:6092:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-49e6cc11776mr1724495e9.26.1789167074426;
        Fri, 11 Sep 2026 15:51:14 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a33e34sm79323665e9.0.2026.09.11.15.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:51:13 -0700 (PDT)
Date: Sat, 12 Sep 2026 00:50:42 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtualization@lists.linux.dev, jasowangio@gmail.com, 
	eperezma@redhat.com, xuanzhuo@linux.alibaba.com, jiri@resnulli.us, 
	sashiko-bot@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] virtio: synchronize callbacks after device reset
Message-ID: <aqSFkk9bneL4zeNU@gmail.com>
References: <cover.1789160982.git.mst@redhat.com>
 <01295278b402c2856b83568e07c86853f2d30e2b.1789160982.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01295278b402c2856b83568e07c86853f2d30e2b.1789160982.git.mst@redhat.com>

On Fri, Sep 11, 2026 at 05:20:09PM +0100, Michael S. Tsirkin wrote:
> Add virtio_synchronize_cbs to virtio_reset_device fixing this for all
> transports that correctly implement synchronize_cbs().
> 

I ran 1,200 instrumented virtio-input reset cycles on x86-64 PCI and
arm64 virtio-mmio under KASAN, KCSAN and lockdep. All 173 callback/reset
overlaps completed before reset returned.

Tested-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks,
Karl
