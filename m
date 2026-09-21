Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20444E2F13
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009902; cv=none; b=VjfqbYqh/7Bbv38ecYdR9Qz2YYGJYD43KMuv+3+CjPaKZ85G0omHWkQvkEYCK0uDIazsE+XwjixbykO+2t/L6NQfdf4bxsXynRzLuahSlLFLSIaMxkTktTHplN0rU24tdbi1OiNvlT+oXKhpCwD31liVhqB25+e3gl/xLg9uDL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009902; c=relaxed/simple;
	bh=wWHdB41W1DvNt7beSy9Dq0J2mhCwUfWa1uMOtBfifX0=;
	h=Date:Message-ID:From:To:Cc:In-Reply-To:Subject:Content-Type; b=tg/TRuFEnVUsAPfF14OnVXf3Nv0KLmyxhxuTNqOYk4Ktz3MN8LnOaLNobEmrtJqaOq14XsPS+O97cmkllyTUuOES1qTwVzqFkfSH70aKkmGpQPau9NmvL0gCiwAglGij+nvqj7Tbco8U10+zdCZadzwkEjhIFYlxegqEt/mq7F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f22GCgka; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f22GCgka"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-38fd9408220so1051343a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790009900; x=1790614700; darn=vger.kernel.org;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j+NBNc6SqBPqRSjjTcg4t04/ngPd1IpMeBHJZ17kgEA=;
        b=f22GCgkaEMThjJVd/AonTLHvshiw9ewnlmuQv72FAYCUzLyPGzMtiGPuOGXKyu0H+Z
         1B1LGIaY5cXVPP7Lx7QkoRIphQlRMy/dz0LSQtGIWDuE3TXRlcvmXJ/FRyQvvKTBShzY
         yhQkP4irmObUH2z8zWR+RfZwCBXGrhtTGyoPgVppWLfuIFlL753rSvOIFPJsdnrNGg49
         Ak/tQGww2aSnki+P6Ayq+pAb8RCSn3awIHVNGwXGBLs1nwPSaMHQrINTj8FXWcELdUXl
         BVW3XdWn586OiXUcfwK6FQ+FT8FKnjjTFpyOUFcVc+ilDGF2kzDLp8kh6vX71mo+pOIj
         LsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009900; x=1790614700;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+NBNc6SqBPqRSjjTcg4t04/ngPd1IpMeBHJZ17kgEA=;
        b=UF/xm9dkVyoAoz5yAGbxfWcOMkNJsTKtik5Zo8uRt9zFQGwZ4vHfod876/rH4euh4q
         ymeNBldKMkVHR0u2t7DB1o8DXk3utFyS5PruQ04b/OUhKqiq9Z7QhnFGiejXNnEA2NUX
         j9T19iDOV24qA5slMgLCLDsw4CaO5GjUpCgTtQ2BvHzUy6OgJYNBV59sdevz0h3CoUTZ
         OnATu7JOquxsisWwc+hlUE6NFd3bqzzOSVRhJgdWF3dl6tb3IwD4KBNN9Oxrjj80ZTfV
         nfh7UYXi5FWXui6hfl8zDe/PrJer5mcuHb5NW7ppUBnhoLi4tnomz3zXrV/8MtyMO4YN
         9hKA==
X-Forwarded-Encrypted: i=1; AKwUvBzi6m9CpA4JdeiGa5M45CnJowYYfL0fA2RNwrM7t6DdGnhgLU4WqdBWJLq17sthrsfzEeQNO+PUoAKp5m8=@vger.kernel.org
X-Gm-Message-State: AFuF++mvHz02xoiQK5UxVZaD57hg7glruPGIPGuWMEN8nUIFR5VWqsf4
	jCCHmatIR/BRBcWOx7ljHQkN3qrpwFTdflmGfLkfrxeK0MWMgLDsg8mW
X-Gm-Gg: AYBFou2Mid66VWw7PniQYJPJuZcuhHQ8W5/rhCCbU4aazXz/Y3ZLsfr0iljNWyOwTYy
	nGmfNEeRtj96Av2moysoFeG2A9ryRZL1nX1GBRVwam5h+b8Q33CulGp5bhn12KjCRA+L9SLEgyD
	NnfWCafyRTHTJiUrkRi9VjlNsg3ayWkVDMhx91AF9uyn21XlokkDI7U3RljctKwSiwAPL10mmcY
	NndQsWIDWBrvbCKQeDslOjm+nBQ4zZe3K7Cp7E5Q/zbtBjp96Q5jf8LWxby4jUuWGjv8QhPg45c
	DmNk2kYQNtyT/1AGDZ5lyfCn38WH9GkuaYE6xpge/BBIrtmEmnC2ygWWxfAtByguGZVTeXrgR4+
	s+XTgLhyznaYpBVZyKldfCGKQolEFB/wMIrF1bdrtwjNhaQWijEKlIkoyCxQSCQOisdfrLTTH50
	sHGdax9mj7TSfxkO1qeoFdT51KKEzNO3hl60/YAaNpR+Apd6HKIbFeVuzIaixGPvhU
X-Received: by 2002:a17:90b:37cb:b0:3a0:2c7d:edd7 with SMTP id 98e67ed59e1d1-3a02c7e2fd8mr8181330a91.10.1790009899774;
        Mon, 21 Sep 2026 09:58:19 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:57::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0673b7f31sm188197a91.4.2026.09.21.09.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:58:19 -0700 (PDT)
Date: Mon, 21 Sep 2026 09:58:18 -0700
Message-ID: <7286d84a0b3b4098219acc0cf9803e6e@gmail.com>
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, sdf@fomichev.me,
 bobbyeshleman@meta.com, almasrymina@google.com, linux-kernel@vger.kernel.org
In-Reply-To: <178993807798.2160803.6987249829072277558@kernel.org>
Subject:
 Re:  Re: [PATCH net-next v3 1/3] net: devmem: replace gen_pool with freelist
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> gen_pool_free() -> gen_pool_free_owner() -> bitmap_clear_ll()
> 	BUG_ON(remain);
>
> Reaching this requires a separate page_pool refcount bug, since
> mp_dmabuf_devmem_release_page() rejects refcount != 1, so this is
> only a loss of a fail-stop diagnostic. Is dropping that check
> intentional to match io_uring zcrx, which uses the same unguarded
> LIFO?

Working as intended. A duplicate return already violates page_pool ownership.

> This is a pre-existing issue and not introduced here, since the
> return value of page_pool_set_dma_addr_netmem() is dropped.
>
> Would it be worth failing the bind here as well?

I plan to follow up with 2 more patches to cleanup freelist and will
fix it there (convert to the helpers). Let's consider this a pre-existing
issue that I'll fix separately?

> [Severity: Medium]
> Can this walk overrun owner->area.niovs[], binding->freelist[] and
> binding->tx_vec[]?
>
> Would adding the sum check or the post-loop equality check be
> worthwhile?

Same feedback as on patch 1: let's not do defensive programming. We
do have a contract where dmabuf->len == sum(sg->len) and it is
maintained for the in-tree dmabufs.
