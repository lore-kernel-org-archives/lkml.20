Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841099;
	b=YYgxjH5p8sTTwKP0s5eByXB7dJnSz1QtEWc8h0OB+cgfqtj1t9PElw7lU/9Lbbg2oy24
	 7cbqZzrj+6X6mnhB0ti/fj5E9DRWq5wzMXxOmNz8zg45AFlhfw7KWZo8NEgkachF/BJPB
	 1C+3JUVVNciSVikhVWe6NoFgmHPGYcjL+Yt1cTgrtcJyRHMgHD85wDcmrLNl5tKMtxv/z
	 806esdd4UsxS/kiYtaay+s+eSkUy+evGhQg1Q+GUPcOw0ujZm1FVpAl6wCFjqbTqyLl5X
	 DQS9fWK7zqEJSk31w1Ly9QQo4y+1Z3WKIHNSv69qtPlwb9ePq2obUOlmNoY2TRPz/Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841099;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=afpW4vnpyJp1rQF7sDbdJVsvWT4LIy5CP2XonGShR/Q=;
	b=qmwhgEmaY88mPsdQAMRhLkronKhLZaKhoZxLuuFCRT4OYQnruyXyGfHA4POhZezpYzXu
	 6cgFRRL+Yrce7QViSUkmHG0OAJwudlyHgrG2pjFmNwBwnPSnDT2rBijCYpgV+wqnx4x9g
	 l2AsNq7sHPTaTnesBnb5baRdDNTQt3a4Mcibbv3RL3IVsjxrlCwdWT+p1emu5j7UlcSXA
	 tFVkVKl8UK4yeRTWlppE/tZmGUQexyBl+rR5Y5u0R5NHxukb+crj7Ov//Bids6M2s7eBt
	 dKyRtfBAe6Ma9h8+Z+MLb75fjKIZ2rs7laSdC+kNpAfiKcgMF+kMzUmalTdWy1NovUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47151606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 01:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47151606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06e79e152so818586b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:11:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793841098; x=1794445898;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=afpW4vnpyJp1rQF7sDbdJVsvWT4LIy5CP2XonGShR/Q=;
        b=1eb8X6aqqqXVpWQZf2lCI+4BrLFrvdiuC5QBN4r7DEvZQak4eObgLQLdxo3YIsDCbF
         hxIBzUZm+F7KoUdD3LRmZmTe0cNL0kNTkD5vwv8cmEguVwQZr/Wn3vTuJa3uKALtuN6G
         4/C9CDyZgfEZ25/5AeMurixGTH7tH+V5gvCRMHBMfRVv06/uuIPninzYa6t6cMfCSuhk
         6Kf1EnDU0Tf3rURrGO6VpAjmvqM/71efwvOcVr5cVW09DxsE8AKdZuJcq9eXDenC8bGG
         xJNfREx8NmscgaAhjabLnx4gh9OUgTq4etLPe0zbY/YuGGrMkY5H+ugV2pQHZUJRDG+a
         4Ndw==
X-Forwarded-Encrypted: i=1; AKwUvBwNj/tWRyECLTm9cRZm83aMJTSSFb7tWYfvDac5rGF8Ekm3X7gnrMq3ITEQE/UZc5Q/+7y+DTUskjv0p0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SmovgVQ7yqgZxE3SsLEAk3LJW1YB2SoiRME//EX/HtAyICx5V
	TV4jA6JEgAMzbGg5AgCUwe/X4bP10A8/7BGlU7If2I02guZ01TANFb9gegf1w4kv
X-Gm-Gg: AYBFou3AdxPQayiIQh4xtE1UqUgdIx2wBSi+ku+S9OApFOplV2jlqTjZeWX3lLqP2RN
	VtyY5YzvVjOM2M//FPMyL+5QGe0H86R0uEvb44Pa0GrWC2hSNyBGFTEdpDWVLC80stKZwQvJ8Vk
	WTG12IarA2F9aP9VJ6ySmcZGTONZYjN1Cy3IqKHGdejkrz7Lck9kmzI23iG9FZMomuMae8toxSc
	KamGhYy9Wyj2emDLVtjwh4V1gTQ8t1qncl36Js6udV6v3fUPevs+GcnMO05pS1qZhB3ICQJcqTe
	fdac8BgHmvMn6b42+ILFlxBhsUlT9SxHQ6U5MG7Lxy7cJKel1CV8MS9EgGiHTLLPqE52IpTZl5v
	q4CM5vnE0EB3iuPYpN8kGxcC885mSl1Ck1mAJjzwVTLfPYblMRHVo3K05etqGXveuwmg9aMd7jh
	YNg5ROgR2sa5sh3ZRhuY6W0BMqIyfDnjoDPqBJBPcWyWGxm2VbihShAbGVoCNsQiWdhvOetGp8z
	/gbPA2Jn+7n71+hRUz6STzfq2jQiS6V3+x3K37ZY+hiJ29apOgvY9PEbKfpp61YNKQEJFNFjpi/
	kJWwWzi7OYxqaRIGK/AO1z4g2c1cQ7SbeIRxTtHy72Q+mBaqSSr2rs3VOf0ZsepB+8wMt0Az4G5
	0XLXoldH/RnRQ4pihQZsQNNVGCcjkkPeeOGZBy4SZTq/Buxvo2uZkfcj72pZSTfPM
X-Received: by 2002:a05:6a00:244c:b0:890:bd5c:5710 with SMTP id d2e1a72fcca58-8a9bf61f38bmr14507425b3a.41.1793841098480;
        Wed, 04 Nov 2026 17:11:38 -0800 (PST)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com. [74.125.82.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09af918d8sm1386703b3a.22.2026.11.04.17.11.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 17:11:37 -0800 (PST)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2498353eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:11:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw1eSyv/AqJpv/HNRfJtgjjnsld9nbjWBnsEyxfBwUXrXP2LUgYioxDmLJtt/0KxbySh6HcLc9dg2diHNE=@vger.kernel.org
X-Received: by 2002:a05:7300:cc9d:b0:36d:2f0d:217d with SMTP id
 5a478bee46e88-36d2f0d26b3mr3496824eec.33.1793841096817; Wed, 04 Nov 2026
 17:11:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-mips-v1-0-eae80820af68@telaak.dev>
 <20261104-sf19a2890-mips-v1-1-eae80820af68@telaak.dev> <20261105-stellar-viselike-e56010ed5fb6@spud>
In-Reply-To: <20261105-stellar-viselike-e56010ed5fb6@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 20:11:25 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6Ao+YDt6aX8+h8dyCsEs8CK1nzLpquUErPwbyce3OB4A@mail.gmail.com>
X-Gm-Features: AclHuK_YtBOeVzlfxROlhjFtxAVCHbL5PR68tz94OCdt7Biz0baVYxdF4RY-7p4
Message-ID: <CAPY4CJ6Ao+YDt6aX8+h8dyCsEs8CK1nzLpquUErPwbyce3OB4A@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: mips: Add Siflower SF19A2890 based boards
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Burton <paulburton@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +F:   drivers/gpio/gpio-siflower.c
>
> Based on this gpio thing being here:
> pw-bot: changes-requested
> The dt part of this is fine.

Thanks. v2 will drop that line; the GPIO series will add a MAINTAINERS
entry of its own for the driver and its binding.
