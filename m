Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF4D457E5E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757836; cv=none; b=rFIXaPPKS3SUsWvX8s4YIJIaCLKZS5NoMaTplFjEkFn9fUsuhZ2GvEHopXYYthfHC2fZ2csxTF/CGSqT6v85YkwgxvSg3mqOFFdpyPwZan1j00X0kMpTIHIQaE8b/aYU66nfwsD++7YfNak1V+f6hB+OesR65cjY1WInjNuKzLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757836; c=relaxed/simple;
	bh=UHIktq9hHohxcsnuW+PjvAGKUTvxgMu5Z3skfDIeIVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5jLURlKI8dMBrctNcGwtY8YVKoRq49RaD6/r5rAswU8sjK7bzGt5OGbdGQDbmW069nTnlYnE6ZcHHPDb1CmvY+/x4J03MEwyTy34cAWiJgVT2Fx3W535flAoq2HiPgfB5pwsBzL2oVpnvpY2MBVG3WyCKyv2DUY8sz3Onv3k84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Qm9JQ4sJ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Qm9JQ4sJ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6ac64e54f2fso2283986a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790757831; x=1791362631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=11O/i4eaHiTKOHQj5oOKeDGVuB1F5PuQ9vQoJ/Gyud8=;
        b=Qm9JQ4sJp9p8W9kvU+Yl49C3WZmKFu4Zn+8vFMeElBfWaU09zE00j6c1Uw7QTfJ0YQ
         yHaBKmtxZAIs1U7BeIAXpnnOLX8iq+IKe2JY8+A2ay7rYZrU9DV48LKitCQ5ofH7n1xK
         RdnwZOWNRJUoeQouhjF41LNl7CYXApelGOT5os4sb7GFPB8pj22mNv3o//RHHrOCKgjB
         xW85O4qsP0X9l2u4TufTFX/dSM5F6GepUAnWrU6c/BtV/tjfM0KXfBL1HiGgFWwQGsXf
         /PnQ0UcRqj16VOXyNT55DXWUU/l8KZ1XGf3ZMIIcEpPINJWrjEL9z5heSXuUVel4cYXT
         WyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790757831; x=1791362631;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11O/i4eaHiTKOHQj5oOKeDGVuB1F5PuQ9vQoJ/Gyud8=;
        b=kD73XE08nr9i5UHYlI6KjKTJOw4gyP+vjiv7TPeZ85WHr4ihBYp/HQZsv5wdbiFKFu
         R5cHfSCiUG7F1KFKMCaeWv8/tP15KTSX2VYaKEZ5GwZTPzE0e1Ca+dMx1PKu7BzGx3bE
         0bixdXaPGVUcAEAPOF7FBojg32wlCfo721yvTuCWDRBoBtWGkVpXEJb8Q3aPCX3nMQcd
         moMBhzcJFVc1oFWyUYHgO9u+QF9QgXFETJ/cFURYYKmFXmbi7WHmTE6jFItNlL9FpZF5
         e+G0xRkimpBE8GcGyLnBpw7/xvR9X0qWnEHSRabKyFZkSE1vgjwVwiNdPyiV8gpb0cEA
         NnEQ==
X-Forwarded-Encrypted: i=1; AKwUvBx90Yi64XdPpQsZeNpanI4TqSkYmPBDTk6fQ4iMpETqGg0rgfIH5qUB5gGTGKJTjfA36dTYHkAoiQqpjfw=@vger.kernel.org
X-Gm-Message-State: AFuF++kyo2b4C1Q2X2NKZeGns2eZ0ixvWWgUlkUc03pcOTFQ5ocEeX50
	akkPVGAcaDMjfpS3fcjKG6jeaLO1ZdrJBYXBSEGTedsN0/JEa5A2LSYuNEwGLzIIh28=
X-Gm-Gg: AYBFou2pLV42Ya8kMeBC5HKNfmpHBL0FjtC3nBHZHyJ6+EafavN+gszqhRmX7PBJJw9
	KnHy+/Bo5K3CG/eLZBWLVp5E1o+5XDVlSpRXZRcNKOwlmwcS9xW3vdiRuOIlax6kBRUw0wRxLPX
	vzZCyVdKLWPk/F4jluJqo0h6AqQHwIiuExZsFd0rDSKCfis5a7hmL96AqdwjGY3xDHmHk4MmgCO
	UkpKZ+V0X5yjDFrJx7fktauJMKI3kV0JWf12OoMv5dyp2GS/jTtwIGyzI52sN3QOx1FYwQyYoqs
	YV+EfJ7/XiN64/S1MBAGySe3NUBr4Cvb9AWuPtL3/Mddb/Vlx0bRCX1ucqO0ZCnMM9lE2PXoFrU
	cSO74r8PCIqqv2z6fJQaiCJXIesEAKc85I261Z8Z1vKlwr6agJ67q5ixvTAcfj9aGOx9vd8gyrX
	PQQaVCjorWEFLsEJxj6EW7AuMSWu1K5PSXmtGXvUWdK2dFfJwUjZM3pJ559Uo=
X-Received: by 2002:a17:907:94c4:b0:c2e:22f7:59c5 with SMTP id a640c23a62f3a-c2e23cabdb0mr57793966b.7.1790757830388;
        Wed, 30 Sep 2026 01:43:50 -0700 (PDT)
Received: from fedora ([84.207.203.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f5f676sm29571566b.26.2026.09.30.01.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:43:49 -0700 (PDT)
Date: Wed, 30 Sep 2026 09:43:47 +0100
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, rppt@kernel.org, mhocko@suse.com,
	corbet@lwn.net, skhan@linuxfoundation.org, ziy@nvidia.com,
	joshua.hahnjy@gmail.com, ying.huang@linux.alibaba.com,
	apopple@nvidia.com, linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference
 with MPOL_WEIGHTED_INTERLEAVE policy
Message-ID: <arzLw18RiTN6Hmey@fedora>
References: <20260930072617.64665-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930072617.64665-1-lizhe.67@bytedance.com>

On Wed, Sep 30, 2026 at 03:26:17PM +0800, Li Zhe wrote:
> Allow MPOL_F_NUMA_BALANCING for MPOL_WEIGHTED_INTERLEAVE.  As with
> MPOL_BIND and MPOL_PREFERRED_MANY, keep migration constrained by the
> policy nodemask: if the CPU's node is outside the nodemask, do not
> migrate the folio there.
>

Why for WEIGHTED_INTERLEAVE and not INTERLEAVE as well?

Otherwise this seems reasonable.

~Gregory
