Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835297;
	b=3cWcezXqdf5NRy5MHhlflc1V1Ig3/T/WnGqAWGIWSW+qjLu77rOeUtElf+PHjuSHQMaY
	 RGoOHsKH6PTuxthbeZP56eVABgi3TN0ZCffwjfeDNKKKY9RJECf6/8UMW8T8yK4dAN7eg
	 CwQhzTgdbftQLTAgZNoQKCd0RmquGLDwC4qNDVumHsGoKoSkjEr1767yofSgQ/R+HO2Iy
	 7bUwL1enAL8ZxqRKMK2EFgab8vm4yK9h1mWydqPrcvicbqLw0OyTWOlMSltZIbkMMqFaW
	 k9DNZ71SVjB5urpEhf52TBeKJyv6NUi3Kj28olvtFPXFUE8sMVglc9oNQN+Qod60ZNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LfE6XYGuOtutQi6QIVbHin4gqCciGQW2WLAtGNmvG6Q=;
	b=NpzkKvQhJnTEMqqOLMUyXuQhyU93xeBFX0Rnkp4M+q+RIXB3ChtIkfT2xzhspr9Z2F2g
	 x2GbfKkat6Kl1jd9Am5JkjZyueLo0xt8aLELul6ApfoaOmbuJNtmKoAKmh1BVdTBHd2co
	 09aSDVX8L1toq5QoVMnohqc78WESMf5sTAwFQ/xj8nVrprtbUujfIiOq6OeCEdBr9kByd
	 ++0YLv2OA9qDsV7qzBe8PvbEMkKNwPO83FXt+DxF/khVfSLn3crnia3VsxQIOSQXK6iB8
	 KdwSYdKZSg2/Y7y4S5rDsKvsJBJWc7GQ3KlFlJdFgP95vk2AZnqRrUVwyBfjrwrGrxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oS7uv8AV;
	arc=none smtp.remote-ip=74.125.230.200
Received: from mail-qk2-f8.google.com (mail-qk2-f8.google.com [74.125.230.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAF9606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EAF9606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oS7uv8AV
Received: by mail-qk2-f8.google.com with SMTP id af79cd13be357-9369a6afaf8so98008585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793835291; x=1794440091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfE6XYGuOtutQi6QIVbHin4gqCciGQW2WLAtGNmvG6Q=;
        b=oS7uv8AV9GQs+J3J5ITcjDbJ45MfrP5WlJdXu9KisS72I4zpWoRJN5mJENlCQNWjx6
         w6K20K4KUKSGFDrMS302lTQndqWgqfIIfYI4hiFH/mHVzQym9VVyMDrRCBCOb51DMcFl
         ofIQOr/qNDRlwNFNSvNiGZJyTOhzeJbFV8bAw8e+jKUTpwf9QgJv2xX1b7IFT5/ZC33z
         NtdznjXTZpPlty80dmkYSVqvYGXC19ugvUN86LkSV4Ng/wYHohFRzaMwCARIKOv50mQ3
         4t5AO2K5tdru0p2GZBx61QhznZr06ky45CDetlhp6aKoK/W9dCwWbUxhQLSjm/9isl9p
         5p3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793835291; x=1794440091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfE6XYGuOtutQi6QIVbHin4gqCciGQW2WLAtGNmvG6Q=;
        b=Wbt6ls2BDAg9P1XGrw+8JdYrXLMH6XV6gxJlzCKWWkflxsrOhyLJRQTqCtqRgVgRgq
         VzlqHcD0TYMGtJkjrGamSYFyT1KVZ226rlX96mxYrjxltIGBGmAjXtu/oCTect5vuz4O
         x1xhAs64sqekljQs1wDbcvGJVv6PgvhrvRM5u9ciHJIZ3HBDmbK1e18LPVoRNMPJbAt/
         1CSwjxrd/8p/l3Hl4fw1eamuTqsugiRSBQPQ2izSVtfyJxhkGw7DVE+gW/9zRcXMLB6F
         bCtHtuhamfOsK/JRZs3eaIWyfoQBI/9wXKX9FCZfwAgJUgg53zuh0GJlIv6b5WLVzj9B
         Wqcw==
X-Forwarded-Encrypted: i=1; AKwUvBxJIpSbBMmmfB+bnOBh0hBQESRB8YUzZ20nARPzwkyGXD9QtcQEPURXFVw076kytX0ez5RlOOE1sA/zRIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/DKtnOEt8pdiS02lqo/iG3AZKaSBp07B0GaD0GwlqM1gKNqN3
	Gh1VWy58w5/gMffp7X0rkH74yVnVcRhf4bYyL4GENK937l/RJhsVLQkw
X-Gm-Gg: AYBFou1BQEhYnwbXpwRG0OjzokLGrITAEEePFe+XHpp95iCtP0tTKm4J9bIvl6SfX5S
	2uzrKu379qT2pXK3aB7d/k09wYDHoBiEp+bTwJEPwVDtBwIrCm+1jx+N1nVoMcrBYM0XarJiu6U
	AsdFasL7YQ9UL4imjGrV7EgbVRtJLv1IlNyC2AATsCB64s3+mG+oo1mOd3F5Eeu/HZLmMHvW1y1
	OoNPUoGGhBrjqewhlV9zVyQYu+Re/inhNDr8DIGOh2ptI1X6DPIiAH9tRs94zmvltvF92Ce/Ofw
	sv7z62Wwt5wdKHuQBW9YloAfYkmX08SfkD64o4GFNPjQHSsisOtNmL0shugLFBYEai66GEbT0+3
	De1//c7UofmxSefbeM5B4OwV8iXLhBTMXTogINcOKr95gMvaRli30m+8rxAnezCh+PP3HJtn/TR
	fKOjC6HewFIYXzQOTCNJ2Us1CGez/ubwH50xNQLo7xdS1EFls+55eu3gdoQ4fhfiWV+44fU61OR
	Igqp6qoNm+fWl6Ioh4+aLr0FaX6yp3f+Abz+kJYPESAUlFrN7xxPIRv3I9QAjeGDj48HOqAyo6j
	ifoclDmoa27P+lhSNiWOtr7t++/q+XJnQWM=
X-Received: by 2002:a05:620a:2994:b0:939:4a44:5f99 with SMTP id af79cd13be357-9442156ab2fmr2992527785a.10.1793835291266;
        Wed, 04 Nov 2026 15:34:51 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488f183sm324141685a.39.2026.11.04.15.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:34:50 -0800 (PST)
Message-ID: <0f61c649-6e27-4f09-a69f-026f91d89848@gmail.com>
Date: Wed, 4 Nov 2026 18:34:48 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 4/6] tls: update the RX key when a KeyUpdate
 is received
To: sashiko-reviews@lists.linux.dev
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, Chuck Lever <cel@kernel.org>,
 kernel-tls-handshake@lists.linux.dev, linux-nvme@lists.infradead.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20261103-keyupdate-rfc-v5-0-de1ab90a88d5@gmail.com>
 <20261103-keyupdate-rfc-v5-4-de1ab90a88d5@gmail.com>
 <sashiko-outbox-198140@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <sashiko-outbox-198140@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/4/26 16:43, sashiko-bot@kernel.org wrote:
 > > +   memcpy(crypto_info_salt(info, cipher_desc), iv, cipher_desc->salt);
 > > +   memcpy(crypto_info_iv(info, cipher_desc), iv + cipher_desc->salt,
 > > +          cipher_desc->iv);
 >
 > [Severity: High]
 > Won't these memcpy() calls trigger a CONFIG_FORTIFY_SOURCE field-spanning
 > write warning when tls_check_pending_rekey() -> tls_keyupdate_rx() ->
 > tls_keyupdate_rekey() runs on a socket with a registered traffic secret?

I could not reproduce this. I built with CONFIG_FORTIFY_SOURCE=y and
GCC 15.2 and ran the keyupdate selftest with TLS 1.3 AES-GCM. There
was no warning. In this build, __member_size() and __struct_size() of
both destinations are unknown (-1), so the field check is not compiled
in.

The result depends on the compiler. A small user space copy of this
pattern gives a member size of 0 with GCC. In the next version I will
take the info pointer from the union itself, as c43c1c24f3cd does for
the same reason.

Martin
