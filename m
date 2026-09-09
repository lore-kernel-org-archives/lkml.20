Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D555867F3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964353; cv=pass; b=p5bWpHT88MjHRD22d/cvmQbdD19x1KiehW0IpFhl5bnkZaFXQbf2yb6HIXNriqY4c6OhF6obePzVw61bREJzJWJ3gp4q/dvoBE0avwPD3C8gEFP4/2PLVUaUqLCw8Z/PRHPTNEBkiNfMp2jRiqQNhhDzIHH9q0pd+fw8Ltk5VnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964353; c=relaxed/simple;
	bh=pD9TXcj0deCwIDSY/gHovc99tumuugoF4IfHylmVrlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DJlIhQddt5rW3Hg4jqkJ6qDH8GpxClTQ+HZAENeb5iR5i3J10Yud9wAovYm6LMEWsq35XkVrTia+ZEHMw1Q/v4sZhbZHqub8gRiuVamnop/olp/OhEwHsP8k9kMVZKzQrp8GclsFkxRhSzfTxBk5r/pEQrqsyCrURXQOS34a7OE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1R1ZLO9; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1R1ZLO9"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b4ae3e201cso5231191e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:32:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788964350; cv=none;
        d=google.com; s=arc-20260327;
        b=UDuLdbfxFRTWRfV0vq/eR8Y/rqhSd0LDXcl0r0wfJ8cBg9eB8mZfpmO1+CAWwtYs+O
         xpGL/8kb12/p/sCrX0DNfU3uvmyFbJEErHCJuv7bAjat4ZGSL5dD2ZXLWPUYP1MGwidd
         mxSb3Euyz0GouoBvTj2HE11DBuxyVejwgAHFp94Z0f6CWmQYNA3QVAWJVkIYwGEEuQ2w
         7rAYRBLlftAOf15Hpku5xTGktsIg+Z32LA8q+LAlyKfejGRnncNuCqdiJkkFAdQKvkbC
         /Sg64zOmHd5qvjMvnNfRENQ7t1NPbI3i3y6YV5umdw+6Wa+5h5qRgolO9jHYVeiIO0c/
         k7GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pD9TXcj0deCwIDSY/gHovc99tumuugoF4IfHylmVrlQ=;
        fh=ZPccdyYevflq5bBMhuWGeCCJrft26y8TSRnNG4vSXPQ=;
        b=ImX7KXAaAVUSqNr5ldvJoUi6ab0iCIWkBob/TKUbRddz8zaIa9vOs4UyNvXbn/YYjh
         +d7nmlMYAJi38ATxNbw6UiZ1VjcN91o0w5q0VklPiLzXjZ0/Aa/YHd9ocZh7WstNwCzY
         mt1kF7PBViA6HABbHWa1nqGFIrK+5Zz3q27qKx6b7WWB0WWAki1lkSsRacWCsTAnFBgJ
         hDt/qa7rvdAO84aXYDYtoN4m5qKwReS0ST+L3+3ogP/PEC7hH1FLtUHsxgnzgJe3JHdU
         LUjQgFG/8xH3I8yujEJr9AQxSivwDjfAm2y47lTu2k7/R1U4jK9B6sWXwZZGOltjioZn
         LQxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788964350; x=1789569150; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pD9TXcj0deCwIDSY/gHovc99tumuugoF4IfHylmVrlQ=;
        b=Z1R1ZLO9tIz1bQmwyqzaZ/GAiWR5AnitqV9Nddx0whC5cxMRaIIsDA7EA4xsINKKXP
         MZcCewVY1Ye5iqum1Qz7AYnunCVcnnYpqr3ctUmQ9iwZCrwNxpbMhy0mhhiDnX6JP62f
         /RZnfha0AuX9mSKCzJb47a+mhAsIHU0763L4AF0lqdmZ5gIzQrPfEgQeI59/VRIzW6fY
         09xrBJcsqbtr5Wxdt/jb0MvZFsIfxhjmbildZUi2H7xCbYBlhj5aDld7B+deiluQJJ1j
         p9nGsFmUoYifuG9Bx365VPdnIaWiO6dzwH6S1XxIbcXBOKqN5xDKSpI6e0Jp+913wEvw
         OIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964350; x=1789569150;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pD9TXcj0deCwIDSY/gHovc99tumuugoF4IfHylmVrlQ=;
        b=XeYNB0jr5/9zpJ/ZqomSszMe45a10yzVjtlxrAfOoVJL+mcV+N1Ld0pWWVDx+FK3lq
         clrtVlsthgArLXQKIQp0wOzfmsHlGfVq+D1U2MlzNpCTpVRQwy9Oi05kcIJGg28Dvqu+
         HZnl5OrDI1xL4DaWXDGF3jpgiawHmXeZ6mv1EDNYDMYHXXY3O+EsQVuyZZSA7sOQWUEp
         LSwUze9uGDq1Y6HPEEkd/YcmOZNN0rxFkxmdHBigvWNrgYpX4y0n/vIBHan/BpbHsW4I
         HhqFm+mr+/yzNBMSA96i0wIdp+HRuHyslcwSjzeecDxwqk0qHfrRV5AWuwoH2J9jV9FI
         U8jQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYOeZ8KJoCbT9KnFUs8sdff7LT1AgK4AfulwFoNkaKqXHBxTKN0wZFp/vRopRCDdkaYZekyQW4Qr0jMug=@vger.kernel.org
X-Gm-Message-State: AFuF++lkPEgMNoS4K/KIoGp2qYO3YJfflm2Wi2vJVh4sPEWgVdLG1s1n
	al4ldQGeDRFz0yeznEEZN6IaCAPdrjQ4oF8ZENDfJ7ZoaM3V+HT/E0Sd23T3jyhjXprkIlG5bt+
	KHHJBfNduF32F3mIStwMLRVsrfN9bO1U=
X-Gm-Gg: AYBFou1v3OLeTcJWNcGmsDNpqVy6UpekoE2w3hoxjhqlu1cqAzLB6tSLqgXaZyAHuyu
	SUSnO5U77Q5m4fwwOT60U8IhSDZ6kwbUiJVuzYXkEreAJZKg1Gv/orJd+woIk/ZxRR3bxE6LQqM
	DKYTPGn95Xn5ElJjTgFNNNSjE1zfABnP3sg6zc3rMbGwoX/cVby1wyk5G+f5q7/icBcWNaxrRMs
	Th44M7XINNOTGlMhzAX9WYZIrtEMOBIqj+5tl387rDf1+WuUJH6/HhWrqGX3ic2UIRMvqfWyjca
	BZpi31PLqpKbQ2dJp3hx6QlwseEEOQYXruOZd5efdKRVfM2iviJsMrUztUa+S4D1dw+IX7EZlro
	r1dtKQ+nPiLfwXVMN+JprgeVJ04xEXyhIqQzglty+F8Q=
X-Received: by 2002:a05:6512:2245:b0:5b6:186e:b79a with SMTP id
 2adb3069b0e04-5b6186eb973mr6080393e87.54.1788964349854; Wed, 09 Sep 2026
 07:32:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909133247.113923-1-sigefriedhyy@gmail.com> <ab826712-6255-4e9b-b6fb-f6f8c380e779@6wind.com>
In-Reply-To: <ab826712-6255-4e9b-b6fb-f6f8c380e779@6wind.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 9 Sep 2026 23:32:17 +0900
X-Gm-Features: AcwNN1U-zJe9KiEEMqLOKTFtdT1jP5RPoJOJuwn6aNuKHcG4DvpUskIblRkLEwA
Message-ID: <CA+7S2vLDaZG=VGzCYWbGUybE=fJyzPoBdM-Wz0T0qp4Sa_EvGg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/4] rtnetlink: dump link-layer multicast addresses
To: nicolas.dichtel@6wind.com
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Ido Schimmel <idosch@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Nikolaos Gkarlis <nickgarlis@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Please, wait 24 hours before sending a new version:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/maintainer-netdev.rst#n15

Acked, will be more careful next time.
