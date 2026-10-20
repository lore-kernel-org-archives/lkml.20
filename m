Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460483;
	b=qa5oZJ0K3uV5eMxsUtLnbwKfnFoXP/hU0Vd+DoeKu5j7ZewmZU2KxOq16gKgu01V+wA+
	 rAvydUFvG3s2KFR+Z9saPLa4kTjuk0LL2DKYYcG/bVU3F+6UfSvjnpKLwaeuB9WKh1zTZ
	 OZ5PRakpOuFf7rV2JKBmJiMcw9PpGhAFw8BccYatXt0Zj2TegllUIXJOq56JNDC1ih9wi
	 O+91wSwXEU419Vz8WhbhLuBmSOj0UhQ93KnZiaz/i0ZKDLt7tpoWPm97sPo8QJ7C+3sBj
	 YjDCs8zYmyNVXNbc1Q0VfTL/HIlGByf3Qle+5gPUA19Gas/wK1R6YkhBzfiRcisDI8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=fr0TV53Zh4gczCXYrk8qJ7Y+cVmeHFe014wAKV8qTsI=;
	b=sXC+/tp9Z/U2qrnACoC6rN6Ta7UZ1IJJWJWjOuL7eC5jDGeWEZJW/iKZUHoTYzgFIDNY
	 2n24BmEJpTbvh9UXfiFGZeA9pxQpmK/rwva01WWG2GuMCYlVzRqhwBHTn2Ntj5PJ21M3z
	 waasOsip3NMZHop7Tt09rS1MlcNye94clBDU44VdkdVE+UplgU0VlqqqAJ8OteJbMGWEg
	 hSUZf/u6a5Z34hIiu7mrpv6LcbHr61a4Y9or+bkR85PpAIDLGD8w9WnwHVZ82dV085tOt
	 7vUf55xKPBBM/CP/1rP6+b72G++/5tvXQ4yiRhU36AI/NWuttawFOtD7/c8k0uUY13Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QczcF95R;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2A5606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B2A5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QczcF95R
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15ea896ddc8so3340226c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460482; x=1793065282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fr0TV53Zh4gczCXYrk8qJ7Y+cVmeHFe014wAKV8qTsI=;
        b=QczcF95RLqhKlbaXAMGeaN1AxXkPoihUjRzwJVbthf4GI55+lJ/tDi12lth6tKOKgS
         cTy0iOv691TwhqWhbFHkeMyngO05h40ol7fVkPUdDShmb/rxRNfuCGVl2BfSZK0Mttn5
         5MixBOFNKTY/fMstidcQZ3LVYufFQ3YWrTq9F4AVmrDg46vLcoHy8iKXwR0XM6Y7sGKp
         1IDs+Qj8URbMRiTauduB8UaIxqMiKMsUanldJd5gaRaB/+PvGIjPk6j+FFOenOkaeN+D
         eU9fsubgP6AxXusE7HElU6ZprcnCC676R3EJf2L6aT2bUSjW/DlIBnLUfV3aBygH8Bfa
         DeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460482; x=1793065282;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr0TV53Zh4gczCXYrk8qJ7Y+cVmeHFe014wAKV8qTsI=;
        b=w4KO2BiiDjieACeY45aEeW9s1eSIQ6OD1SkYKEzOSKJZHmuh/CDrsb7yiSn8mNpfMK
         Xh3dez12xdU4V/4F90iwv5+d04uCMkPUgrk5sOtcIbH3XAvABGVH40ZQBXYb92y/+P8p
         Me4SWnW9nZIfintXkeg0X8QAM59dQKF58a9+W6MApsXIxwRnlh6VzOXqRz8hd3NhRgP3
         XmzXKqgTrfUwCni8Ntx2AMuWaprmjRMp5oHlXVsUW9vQ9lN2s+UV4vsA83PyiPITTYVO
         1RN+q6IyMSq23/fPaz1BdJTwWWjmCKMFwK6nUn3IlvszlIa8ORMwKNCz6z05sG00llRh
         +fNg==
X-Forwarded-Encrypted: i=1; AKwUvBzPUFHmer70gRBRcvbp0YMpP7fH7ZqG1fLT+dAKWAlOByeA+qZvb5XZi/Rh9HM/nV69by2RI0aF4QveuUk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUJhfHViu3JM5xS4JqLciWJMNNrOxOjuO7yTlaGXYbK4itADBn
	zkbWeky/crP3tPDELRyRNjl7lHr+xvFPySsf8gX7p8yJBhYvR6FsZCnx
X-Gm-Gg: AYBFou2Ezlx/+a+ycg71kvf4+ZalZGFuH6XaVy9WG2gQdeGcpustje5UZS88yMGpKsk
	P9CSb4h8iu9PNboCzh2+OGr+sLX+LnQiYtC7XijDx8HfdFezbnLmQAMIqxVEpVWsjnWToI3T9Xt
	KHJUU2qBZnM6EhyN8uUgG5HE7QcSSFYp5/L5bYCgFa6GecMIbc7fZ8Rh/fETqai0StDWlCLF689
	+YwR5hBFkA9I/FS8j5X7uXhtNKPwQP6h91uAFhqz3vn2GoXQY7TSld+7er/rEXYfLmm9cCeP2mv
	lceL2GSwq6voLi7UPSNZwsBr5zVJhE7ZFjYPbX7KpPI5DUtKwngZ3yZ6ZQs7Nzz1WEF6NJ7cIOS
	cqDf39kxmA66H8e3RtrXHdcl75DEkML9iDly+CDT4FVxkL0n469oWujhc/TdxAvqF9czX5u/M5t
	QPbUN4h1FrqEubBgJ3gkNqgHHmL5A9K2yyzjU7Cp2bSP1gX7ftLhy5eFcdWFJUQfIITyDbvYGdB
	QMSRVC59/ZBKjBc6Ugaa9GMouU9mSVb6i/HTSWBV1D2N/Ff4IJyg2UslJygEyR8tc7PoA==
X-Received: by 2002:a05:7022:ea50:b0:143:2968:564c with SMTP id a92af1059eb24-18512f1e993mr12640931c88.26.1792460482105;
        Mon, 19 Oct 2026 18:41:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c2e7bf4sm28816461c88.20.2026.10.19.18.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:41:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:41:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ben Grisdale <bengris32@protonmail.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 6/8] watchdog: mediatek: Add support for MT8163 TOPRGU/WDT
Message-ID: <589d0ab4-46cf-4b8d-b4b3-5519dbf030ea@roeck-us.net>
References: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
 <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-6-f2462b2d2437@protonmail.ch>
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
In-Reply-To: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-6-f2462b2d2437@protonmail.ch>

On Mon, Oct 19, 2026 at 01:40:02AM +0100, Ben Grisdale wrote:
> From: Ben Grisdale <bengris32@protonmail.ch>
> 
> Add support for the Top Reset Generation Unit (TOPRGU) and watchdog
> timer on the MediaTek MT8163 SoC, which provides 15 software resets.
> 
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>

Applied.

Thanks,
Guenter
