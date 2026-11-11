Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384394;
	b=FPrBZNyzIvpnZvWeo4sbhguMAjWryhHl7kN8Z6t//QxQ+1NRE2K/EY9iaBmpIM/xIse4
	 BIXYRQdmMCBqee3h/op9C4R81JFhFBciVUTy26rDBEsWDojymzbdC1ZIQjXmg1EdwET9x
	 MV7rhMe1EvEv5j7C3hvemI6UaNro2WM8zmZ9RTFtt/iEf5Whnd1oQCMI+z9U8jvjPALTX
	 XZGIDY1j6IBxJXyrskHnwv5IoNSetdHCZWeqPfDwCRJmcpxb/smpCINbWjK/pW96xhsdG
	 CQFWwVJTKfuqX1HYuMkMTSJlXCrpMByVNspUr8GA0iehEzLzXzhilZrW1WORcsikvTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=WlimTFKZ+lNbv/kTaPDoKbpQOPhwFKn5jhXH0jFlnbs=;
	b=RkkSDWhNBAn9PtFsLu9J32XhspZKfGiAYjMWZL4N4j0D2ng2gTTP8vEbo6PtpS2kvZkl
	 Idc7BZBA9hcpVnxas6OleOl04FOclp5DoPiwXP21NnNLgfxSQ0cVjECsdFEy9wDnMvPUH
	 ZcIQ1K1ox7y8kWsPpT/c+MttSBgb1ZKqODGrFmQ3Xalrots6m6QcsTBhTnUun9SHBgezB
	 GxhXYBtyBnrwLxMbYyIhmeHHLo4gjkgjE6ldLZ90CYOvbVxRPNN1paIwB4e/1KOf1bkJW
	 rY1Mt0GikakFlLU+pyJ1bPSPOnnCEnmoH0Z2I+G4jftqu+s35pCTUtLEkgKJszyHabQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJBIztFk;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F89360A3835
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F89360A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJBIztFk
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed06b725fdso21710575ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794384394; x=1794989194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WlimTFKZ+lNbv/kTaPDoKbpQOPhwFKn5jhXH0jFlnbs=;
        b=UJBIztFkXVFYspVajnljThEMi5GxkpwPEl31M04lV68BSSDO+iLuhapXs3gXake+dx
         HqrDQ5zPJ1NHOlctlLFsmPHYqFppJ2shMIxfhTqwFtcwp8FqcqWj3CUbfvoYzlYQ7BhF
         nDSYXvM40Tiln+zftit0gq9Z/mf44xwNfzmZujjBts/ZZLJ/7rBJ/44qugdjhPlC/ezh
         ma6QYSyDe3EeXl0Kupx7v/ZTED+9I7xVrEt7hLiQTWteOnvrz8EtE4vRww56QLY8G/PL
         IC7tmfjlpqvNFJp23hWS+v/Jf3Od2JNRnCbx94wQwIrv9o/jCQuEZnpmTHZTqJcRrKXD
         Jqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384394; x=1794989194;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlimTFKZ+lNbv/kTaPDoKbpQOPhwFKn5jhXH0jFlnbs=;
        b=NloYb3oA9UCGC6F7QJRxXnWsKg9d1fTLcCPdZR8bG/A054h5wFuylLKN9sq8COcYDs
         rjMGYdzYz2KkYADfyRS6IfJ+4O/EFK5/QCI9yLopndfaC2WRroCXqahN5btD2Sf4X6KM
         MICBiuhlp4UwaAtbcdareJxPeNhTKR0ETGnHXmL3wXNtNpgTBoYppaqJqiItdf+MgTen
         X5RqZFuyDutM51rox5VAI5fxD1170+dmna8AJnNnc1Npxw4zNyynsz1uvvZ4SvPTLMGe
         LnlFVA3OdyvhpRe7Y7zuCEPf7+mdnSA2IKzg7jWxBbqWlKzmjPZq8Zzlmx1I9qTl+bWe
         DpnQ==
X-Forwarded-Encrypted: i=1; AL+hErHtlmG+QRWC+6b91L6gSbvC54aVounj4+2UxIK0RwNJDLxX7kxHAKPm+Q7P2re5IafgD3P/SHcCaTGQ9zk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ImacjM+hTSGHUZbPGGIWimAn+1/TH98IbDqZRCwrBh1VHAMDa
	fjA981lAF+O1nTUwkY6uUKKxZYbbkDW0QlebFfOq8l0u86AUqTZVqPKkhzVruA==
X-Gm-Gg: AYBFou29mf+dKrAR2dVJRzWoyZZ9DO58FcSISMhY5gndkR2IDj/Gnwi4wQDFEKAtsFE
	rDHOgHCQyQgvyFaMQYdPOJLGH3EB1NIPPF9LcX87pkimSVOtqY+Sbi1G5KJ1BZGOxwwZ1Y7MZ3D
	3asHQOQQKanDiUGnf8sq1qIwGLPYjLLzl8mX+/tNHhBd/I8o470WVcdKYtIoC134YUhdtGSL2EV
	l25zfpt+sDtZWf9jvBgI4Yz598J5OjVAf4OSGCJ27l9IlVvC2bJ+LhRzlmxe/NNt6e26E430UYn
	9all5beL909QR+2u64JI8hVQo4QcEXMf4BetJMb8kvTnBzKVPBsRquB8aOhtpyLWlNjmUwo/0hs
	0LFreWeHxvZ7xWe7IzoFz48DNHvH+Bj92xx8mkKzeD5mi3L58vqi6YO1tYn0e8OVPv9Z5G5njUA
	Mz49GraP0cnnN3DCEkXf3YEBklCkbRvSUibVNTxLuannkSaEPPepR6B2o8qodhER6HXXCI9S62X
	W7vOLEN8ovN2q3zBFa0xHVdFLVRqasX0nIMCVSxJp2kx3+NxJFM3x1QBHjiZtZcz/AXRrbC3vy9
	6aHkQGEnf0kw3ZpNjvgjzg1jY95GEydTkoiPAt1D2H05XkTYK3F1Y5emlPy1LA==
X-Received: by 2002:a17:903:468f:b0:2ea:238c:4cfd with SMTP id d9443c01a7336-2edd408d124mr18545445ad.25.1794384393591;
        Wed, 11 Nov 2026 00:06:33 -0800 (PST)
Received: from HFGF46V04Q.bytedance.net ([203.208.189.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6de7df0sm17417515ad.63.2026.11.11.00.06.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 00:06:32 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	Ridong Chen <ridong.chen@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MAINTAINERS: MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU) update
Date: Wed, 11 Nov 2026 16:06:21 +0800
Message-ID: <20261111080621.63932-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>
References: <20261109-maintainers_mglru-v1-0-c25e6de60bcc@kernel.org> <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 9, 2026 at 07:31:53PM +0100, David Hildenbrand wrote:
> Fortunately, Kairui and Barry have been actively
> contributing to MGLRU and have volunteered to take on more responsibility
> by officially taking care of it.

Congratulations, Kairui and Barry! Thank you both for all the work
you've put into MGLRU and for everything I've learned from you. I'm
grateful to have you both as friends and mentors.

I look forward to following your lead and contributing alongside you.

Reviewed-by: Lian Wang <lianux.mm@gmail.com>

Best,
Lian
