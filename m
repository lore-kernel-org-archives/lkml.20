Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980696;
	b=sjbXxVxezNZWhMcdAC+puceECOQ9pPh0hZkptu/+V9Y4U5O348RhMw6WUsCqLDG9bO6v
	 6+pi7MuJvpWrok36BABmhb7Wkm3+wA2uhmudzug8W9KRB9oEietZHudBYTRWIK0eceA7L
	 5M8i7zaITzkYzO4vrsoLK0XomFIjyPYx4NjdQinErGmRSZexr999QFnA/IGrIAeSR0V/b
	 GnY09wkgLHPhYHbHuxu+2LG4ouogp4uBDipr4vf1k+YOmu4gFQCO6SR/wLxbRTqrluUKQ
	 F4qr2AO4fPzSnI9fZ5jJ9pBIsA3dgDC6/aMPO0TysjYH8fcPsTBMnJe2IwN6r2MhRoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980696;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=t0uNok79xtcOaBj7hUV1cORn4nx2YFub6xhgV/RBq9I=;
	b=SakUD1Kbv+39RPAHfkM3Ca7h4ONCFBT+ZSARM0mdvUOZxXtR0KNYi3jIyQAuXiJRH6IG
	 dmyYI7WFcBL4aOdJTzgKFmIHkhkUnaAZCNYmqjhFd3Qa7kqtXcxQMoL/pD0Hmr0P+dDum
	 LH+E6VmaDItG1jhqPk4ENIOb7btTZvHhyJX51aMuePNeCQXxmuWYioDJUt9vLQuf70EN/
	 y6ctG2yiIu30Cu6EZlhg52oDfcztJtjqWnP2MtScBzMjy8bsPpSzIQUI+RlKNKTvZoSxJ
	 +3srI0syoB1amELaaLJZz9mCUDmGFHsNE35lPrUxW9sTOmYwrKjSr+0Z/RwPXocVl1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gWMGJ00x;
	arc=none smtp.remote-ip=91.218.175.220
Received: from mta0.migadu.com (out-220.mta0.migadu.com [91.218.175.220])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0F7606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC0F7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gWMGJ00x
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=t0uNok79xtcOaBj7hUV1cORn4nx2YFub6xhgV/RBq9I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793980693; v=1; x=1794585493;
 b=gWMGJ00xOrA8SD6jvGCgs9IL4eTlb8JgU8LPbLLOas31NmgLp3l027Snu1NzAx9tdUum6/6h
 XvXv33Dk8mzhkyPEoJXCu+2HsXlBOgNHO7j45UVK2Or9A+5CFxh2y26hNZSaKyq1F0xZ2fWMOzr
 +O4Tta4aWpOQE0AKfQzx4qaQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eb545b05e6a74229;
	Fri, 06 Nov 2026 15:58:13 +0000
X-Mizu-Trace-ID: eb545b05e6a74229
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so873e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:58:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx+gcGLcNq3uc5rp2OyMeM8PYiY2Mk4iuKq4OWH0amxBUlp/y9xceAIek3fm91Z3vcYBr/yQc9DpwoQvQs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W3IpQn2v++6ktlpSW55/rsWad0NHz9tdI4X/6pswffO8MHssP
	j0AM2CsFg50y04OszUUsYdDrBfNDbW2YRwrFFIrya3mxA7HpueSXBWII2v2YMqLKkKsLAJ0OyO+
	igeWeEcBmQHlFdjAMN1wi0CZQQ+K6NpMGH8QY1W7y
X-Received: by 2002:a05:6512:10c8:b0:5bf:ff8d:111c with SMTP id
 2adb3069b0e04-5c00a301a4cmr13851e87.7.1793980688227; Fri, 06 Nov 2026
 07:58:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106120221.347309-1-fuad.tabba@linux.dev> <20261106120221.347309-2-fuad.tabba@linux.dev>
 <1312ec44-bc4a-427c-876e-1405e8c46e0f@arm.com>
In-Reply-To: <1312ec44-bc4a-427c-876e-1405e8c46e0f@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 6 Nov 2026 15:57:32 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwGOWqhdQxC0p2LBupLjKdkNbZEzGzWjS+ZR-XSbTBt+A@mail.gmail.com>
X-Gm-Features: AclHuK8NtgOFZkr3lcGennwjJa6alIz28AdxX8kBirDq8O8OUlKzbOWacoeokzQ
Message-ID: <CA+EHjTwGOWqhdQxC0p2LBupLjKdkNbZEzGzWjS+ZR-XSbTBt+A@mail.gmail.com>
Subject: Re: [PATCH 1/3] irqchip/gic-v3-its: Zero ITS pages before sharing
 them with the host
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: maz@kernel.org, tglx@kernel.org, radu@rendec.net, lpieralisi@kernel.org, 
	steven.price@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, will@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Fri, 06 Nov 2026 14:31:56 +0000, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> We hit a similar problem with CCA, but not from a security perspective,
> but a functionality perspective (crashing the Realm VM). There was a
> patch proposed here [0]. The general consensus was to fix this for
> all "shared allocations" and Aneesh has (had different attempts at this,
> but the latest) series is here [1]. Do you think something like this
> would be preferred than fixing every caller like this ?
>
> [0] https://lore.kernel.org/all/20260820150034.88729-2-steven.price@arm.com
> [1]
> https://lore.kernel.org/all/20261104164555.3555725-1-aneesh.kumar@kernel.org

For mainline, yes. Patch 2 of [1] zeroes the memory inside
set_memory_decrypted(), before the share on pKVM and after the
conversion on CCA, so every caller gets the order its platform
requires.

That said, [1] isn't stable material, so I'd still like this patch to
go in as the stable fix. Patch 4 of [1] would then replace it.

Cheers,
/fuad
