Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.74
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794400175;
	b=SOAP6WlBTx+BtPUROBP8TB1uiSZxpcrWq9kWzKvKWsYYUqutawtU5CX/Ji3qUYcjwP32
	 dAxBhJ8OPP8zkfMZwF/fWoLedzsoTfSDGegR+DEyv4cAoSaptWkjF5mrGE3WRzbEuVvoi
	 zrKtos+3jLSqm/c9mNxj7bYpaqzZ/2TMvmRLIOHefM1v78sAYH/JggwsqMgki57RtI/tj
	 5luklXbLB4ju9smlDolmhEiXmqJQ4Sn7kCGX9T1JOaSpwv/gE8dep+wi+mugGy7pMdc+U
	 qbFQFDAJky/45ZhbiKaoGV6SKvliohYjEciJVtY4ByvUgkHtkMHM/SUTbRiiGrs2Gig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ugQNukoG8zuOSCl9kH/Kdlpjvp5xVSCQl/EVqkaF+xc=;
	b=Mj6VUotYCCQTSXOui0y0WNHlUbcj4zvqRYXYwf+7dbsCsTXqD8GycL6dU2rvvOczZkDk
	 641kJDO4FFlgVHK688HuYqmXyqT7n9vyI0lCdBJl38p7Plx7/gmkXQuJpBI6Sa8MPfpDO
	 KemN2+t2Aunm8zQ9oDeOXLjyWh4joiWQacLaXDUyrjJcx9lOs2awv18xsYQAeCjs2MiNS
	 V98fCXBbS4ic+rY2dEutmP60r7uXrfvNrANCDfEICMieNc6ktZ43IaZlbW6BhA+Eqr2J2
	 WSap3MPsUY8zkq+gaioPAq0lm8OrxMtnCuoM8tzylWgv2lvrRvviFWH8e9vIuOzORGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PYWO8fA5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.74
Received: from mail-oa2-f10.google.com (mail-oa2-f10.google.com [74.125.231.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20946606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20946606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PYWO8fA5
Received: by mail-oa2-f10.google.com with SMTP id 586e51a60fabf-4ae5a7c2df9so79931fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:29:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794400174; cv=none;
        d=google.com; s=arc-20260327;
        b=hQ9AFKhmvDhLGh7ue5qMTKSwUfxLdW/NN/To6AhKLn4gaTxPNUd/yC3iql7vs7IOn+
         iWnJW8x7vK+SdNx1TAd+6lH9j41Om8NsQHwkIS8R6DsTun0urLNgJH3Wm0ojrwrJrz4Y
         YkvXMP9FLMegmc3SjuJ9rZfOAdtZnojYwHIAaVUF3GJ692t67SJRKgz9lYygMpG06AnO
         PUYwJgROnU1vGWGE2CWq3ejHV9y+Kx8BsG8kAn+eC8Cd2+DXIpg3jUvYIV4mwkEQ8+xo
         /1y8kH2WChBuGyfTiOJASfKdu7kbHQbDhhW8E6YEO+4V85N99PonoXXc/PTZJzWc/bN+
         xrZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ugQNukoG8zuOSCl9kH/Kdlpjvp5xVSCQl/EVqkaF+xc=;
        fh=CxENHCJ6vQaTuoFFfZiZh7LcY6spDeHTmnfu3izTkjg=;
        b=nbdqicP1puBgs+HJXUj1GobsVrfz6N2Xx02ksCznfICCGMy8HKPryLb4X6lqeSo9D0
         trocuH59ZxkRO+q3NFRUmm7Up6dpB/9caeNfAP0rSJW7GXFHOCS0KU5sIbgVQJVvfmPT
         dtZ/5JpE51QS2p1mmOmP2GTnAOv++DCFjVo5z31+/bezQ+8mmETWKeTlwm5PoDexaFHO
         Ma4ZOx63ZqBD7jn+3P+qXrqhQ6qX2zJi6YPXP7LB76vD7RL7NjatvW7tZah+C8T35rVK
         GgLx1/5x6xgwM3Kf02QnlPWU7yECQohJPpPINx3r4raDmtloMxzGSNfZsoNBi7Dnz0DD
         pVWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794400174; x=1795004974; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ugQNukoG8zuOSCl9kH/Kdlpjvp5xVSCQl/EVqkaF+xc=;
        b=PYWO8fA5gRWaYW8Qean7e52jZfOMsPHQuM6ciQ8I2KUqOeKzZ5GvpOXxNAPtY5AhhB
         Cad6nYp76jWYyg20Wx2CHvHn9HHzxxDLTgndd12baYuY+6C0DGzHUKTim5OkboBpeoId
         vehG+laM1C+esKuEV/5zMQt153Kiad9BC2j3B1+a1CrK/kqexT//HR+RqgX6LEVIzh6G
         6CfowtQUsymmzNYPoNwPuVEBXU04FHcImiZvdMF/Eg158rbV/NBP+TjTiJG/F9g2CSS2
         XcOKlfCa9GpvzMZfuzMW+fnlwfT2t7ncVQfJ47mwGVV2PjW5NvbR/mbXWLsk64EGQxIk
         wOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794400174; x=1795004974;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ugQNukoG8zuOSCl9kH/Kdlpjvp5xVSCQl/EVqkaF+xc=;
        b=Y0xrqDZ4JL9U/ysYW+Sym3qSzeTxVrer+MhGfFInLScFypBXg4tKFCXJl9Vz1nuq5Q
         qFvgdkcSzNOs5qTbF/JejZvfs4QJFw9NMmgS+jvL3PGohS1u2l3eXc9yKZQ+ozF27H9n
         HshcJeUSWgf9zfQJwSfsDGF5npZmlKp7FNs8NtK4bqTQ3eFZ9zkoK96SLsdV5JzzJyqP
         98gQqTSFTiYPT4zmlqf3wQDkVRa1v7XwfUx3gkZ3UPYGtXdGsNloqdFPywvlDrkBuBmt
         XsKKySonYS3tKvX6C0Y7Clct3Zwrbc1vVCKKci7adiVXQBiIIvGHjUYDzWtd3h5SOLR4
         1+WQ==
X-Forwarded-Encrypted: i=1; AL+hErEe91Gv8GswkW+1LABUpHLP1CmsAMoe6MkK7n6GmT1f0SpAwRuSW56tnN/sVCiT886UUlJ+OSwhMsASoeM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G+SjeGsGawrrQkzFiOrWm/z/3qpYhmQQPlLoTv9QDWsxX/s6T
	ffBJLp9nBPKkDJKZ4A8WQrZVo108XpTYUeGOCL7GY/MpSA28/DYFqkuzEPugL5ZV/RIpfFQKS+s
	jwnGcGhhTjGJ3sGYqCvKpbgcn8satbro=
X-Gm-Gg: AYBFou0fJGVjD58Pzv6pWwA+vwzEaCGQGesNn9JXIVt73XjQOg511Gr2Nvr9v+HWElb
	gJuC6juZlySIC574tfVV3Vjx4dzct9/KpbFJKjZVp4F+yae2P1UtkfGvXNPcabH1O5Hs/6WM8ym
	qzj2IBx6CyW/DYYaQo6Q8eMPrqAzp2zzIjpHYp/4t6QIYdIi9JVCOLO9S9zBDHjmIw2bnupBQbL
	kQcfhff4uw73wVYqqNHy2E7RW/htkuh5ugw3qcRykXpikIQWRP24RJd24nXh5+iVzklX2hGWEgG
	/XGpr69+tIn8nFD7wM9l5LnKgLGHjS28vE6f47TcY479YLMkdQZF7Wk9CJC24SWrsPUIJ2LL80W
	QKvtjQs31UTaFPIIo1xw+A76BKm8imlkFOGisWWXadYZerfMFRIO9IODz9FORB2lkyWhE4Jc61O
	vINd8Q3Ma8atqQzA8LNfuXMNFuUwUpyQlckltFST4q7+ASKEOdSBFEdQ==
X-Received: by 2002:a05:6808:4f13:b0:55c:888:2a15 with SMTP id
 5614622812f47-56b97d216eamr1759866b6e.53.1794400173914; Wed, 11 Nov 2026
 04:29:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103185909.71843-1-dennylin0707@gmail.com>
In-Reply-To: <20261103185909.71843-1-dennylin0707@gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Wed, 11 Nov 2026 04:29:23 -0800
X-Gm-Features: AclHuK_f_I8U-R4ghS55caM--h46bxgyAYf2JvxTYf0GJGfw8SL-RER2v_qKYxk
Message-ID: <CAGEkeHfW2ADNSV7g5JMss8B80T+x8US17Bo51Ypp+1nnoxSPzA@mail.gmail.com>
Subject: Re: [PATCH v3] block: fix discard alignment for non-power-of-two granularities
To: axboe@kernel.dk
Cc: hch@infradead.org, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dm-devel@lists.linux.dev, mtsai@redhat.com, 
	sashiko-bot@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jens,

Could you pick up this discard alignment fix? Christoph has reviewed v3.

Thanks,
Hungyu
