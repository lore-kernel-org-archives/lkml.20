Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793060148;
	b=GUQjdYh1R6gtnjKHjg/K9HJIpCvhRbW4ZCy4ZXNnbhx+0Uj2FY4nOnkaw69RLp7D8v+D
	 VASN3rx+kN2vBSsX9DJeSr7a38e11q/BDtrUOFUvqqCwJ23MbJFkGqZlQ+AsDyEq0DGYj
	 YbT/A9nvSMrxvKExIAdQzRt103FBz5zMUzYDlVLSKNwRoZi9yP9ikKc48ntKOMptJLSZj
	 UKW0q/od+BROKg5dC8irjzTxUo3mdjIrN1P4ZuB1PBO7U+YLgmz1nD9kpEgqRrYj3FTim
	 7zCQTHcccvZIfMco58BrxU19XEAUKa6fpDIELyjEdtGgJxi6Av+54An8+oSEGJta42g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793060148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VwQ+6JoAKufPGf0cTjRHYZdyECle7CFEoH5DFWVwgnY=;
	b=ZOZs6/yNfVfHNY3HaSkQaRkjLAIHslMo/9Tz7omQc5kAU/l5/4Mn/qcyniMFcZ68PkRx
	 3xkc4EEETz3D5dbCG9a8DptNs0von+MMmA1yPUxEtNyj4BT+kYbVg6krrZqyBBbL+RxPu
	 Iu4zVBPvhpTs1e8GKpxnEmY2vS9kNDIVnvNvrk86dq2pFxNlkoEDw5bCZ77x0R5gxg5gp
	 tA16A3iSr1XqXieOfttiU72KT3kghDeyE9SIERZq83ll6CjN3PUvdzC1eD63zO5J3bL7A
	 s1kzc/JACqITSUiNVbBnYTswJ+jsl86BVfKiKW5WREym9tJK/HBaV9P+8qib8w9Bftw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FtQGFneA;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62BE606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A62BE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FtQGFneA
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so1443734e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793060146; x=1793664946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VwQ+6JoAKufPGf0cTjRHYZdyECle7CFEoH5DFWVwgnY=;
        b=FtQGFneAA8NpclA3sZkxk+vBRPhyfgSpUsHG9N3eeX/PSe7vaGzi4yu1GgWfjwbVG6
         G7BIh2jV3nKIOfSJfvaUDkFEn+y+M9RcX5bxF4Ycad3wsXBPjQPWKoM+rXFZVgeH3ZEB
         EYMqdM+JP47POof/HvKTeJcFBNwmtDGCWUMTJLdyZGmS8yyf1GNZeMTVZkftJILZQPSE
         EOA99uo6QpI1vury3l6fgwKmOrNsGvuphSI4CdVAR0alfMa9u51ryAqJLmkeSjWXDPRX
         6Pn9autxO0r6H2D2HmF7QvPkEBC++zg/XvPDI/JAwmvVc1YOLhYrk/aMqrccNi+8fQpD
         6bvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793060146; x=1793664946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VwQ+6JoAKufPGf0cTjRHYZdyECle7CFEoH5DFWVwgnY=;
        b=FetX3tXL7yj58xH/W/gnwfLLOUSPvnFt3SDkP5J3BZZXLZ24dSnw+PqfrUvUk6PmWm
         gGA2BvXKwRDDawo4r2g1BTqJbjiBgY2AR1xJTCQbSVbRr7Zz53cHl5ABcshutgn0ZkBe
         Q/IU/RfXZuzMb+53Yx5Zthol7NLObX04vReYj8MH1P8wYIgDT67oNDWRaMbUgcn3AxnZ
         fOhMtcD2Pip6syRAaNn+hvgyPbkzywlwoI7FdJSzFvKmEApyGm9XGbJPmL8EHMNBabzy
         IpNSr4m/vyU+cAflT4C7FxeBKJx8PwNpa50R8RlMhGNtNBSx3jSVFm1UkH7ui2wsX31A
         GexQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7tP4UhvdbPD272An/MraWytj2sgq/GmVPd9flEUl9LcBAY0rTsL08knX93EuvGe9lyyMw5Uumde7t+rg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwO8FVRtGsZgYLnINN/S6Rw272dOFqaKWqq+xTLHw8xVuD/Scp
	T22eyPWELD8V7Tjg5an2Bf+CSKeXEQHhgXa96nBqCa9r4lBf2oRCF2aF
X-Gm-Gg: AYBFou2bepMtGn+ZYoiWuiR8OVSndyU8AhBH8mG/K9OAgCmplex8tDr8jvFOhFnHJIC
	DEdCtqFGAk2U0NN9o5AllHn2nYD7vCtUzP2dfMtbtsYTZW0i8NzIuf9FQih2Pijh9AzgRZ/hjUn
	S88DkMQ8nkkbJuSmOVE8xfzs3dU02Ut2phWIT+0VOY7d1STzl7nf1qz2x6ctNYsvcAne3C4pLAP
	qXa3oNFtF46pr3iZhW9L60YVA3HnZMskVtfT7bGYWJ/ymOEv1ZuZPRquoc1vBbAcU0qaAhJUKSJ
	n1gyxSXy3tPdxaYn9pvhSD8+ufPpFN7ofnaNDl/r0RUl4sMYIKxb3c9S+TBjJFfQ+dpAEMqxW/V
	wVJniOPLXsjeDRg54N0BRvzSYaWepmXKO+Mn+3qZAZ/lILHirXLF4vvLjp8xHpmVIWQ3wQdpaRL
	BgYbYGd1XjC1XvHmA2GK6G7YbLf9Jv/AMzHMRBS+uL2fjszX4og3Xl5gNICpuCrd8GYbVDXuIxV
	pMAqnXr24UIc6ejNmV5HjE/qG8PTrSErxlEjhoIzVE4coW/IBpgxC0Q5gHStSq/XpYIrRpi83Rz
	NWA1iTI3ISKBRZM=
X-Received: by 2002:a05:6122:c443:b0:5ec:3e18:b06a with SMTP id 71dfb90a1353d-5ec3e195f2amr793847e0c.0.1793060146333;
        Mon, 26 Oct 2026 17:15:46 -0700 (PDT)
Received: from localhost.localdomain ([177.155.254.93])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec232758d4sm10068856e0c.1.2026.10.26.17.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 17:15:45 -0700 (PDT)
From: Matheus Tagliari <mptagliari@gmail.com>
To: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Matheus Tagliari <mptagliari@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/radeon: process the VCE interrupt on SI and Trinity
Date: Mon, 26 Oct 2026 21:15:03 -0300
Message-ID: <20261027001506.27266-1-mptagliari@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <0c7e45a13fb78064390818bb501e754b62f16f6e.camel@gmail.com>
References: <20261022114754.865669-1-mptagliari@gmail.com> <20261022114754.865669-2-mptagliari@gmail.com> <88c61950-125e-4109-955e-ce09ebaab7af@amd.com> <0c7e45a13fb78064390818bb501e754b62f16f6e.camel@gmail.com>
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

Hi Timur, Christian,

Thanks for the input, Timur.

To be clear, I'm not opposed to a backport. Fixing VCE1 for people stuck
on the radeon driver with an LTS kernel is exactly the case that made me
look into this in the first place. But my goal is only to help, and as I
said before, I do not want to push a change you don't want.

Christian, if you'd rather keep this out of stable, I'll drop the
"Cc: stable" tag in v3 and leave the decision to you. If there is a
specific concern behind it (risk of regressions on other SI/Trinity
parts, say), I'd be glad to hear it. I can also try to address it, for
example with more testing, so that a backport can be reconsidered later.

On that note, the SI part was tested on real hardware together with
patch 2, but the Trinity/Richland part only mirrors the existing CIK and
SI handling and has not been tested on hardware. If anyone has a
Trinity or Richland machine and can run a VCE encode with the series
applied, a Tested-by would help for both the review and any backport
discussion.

Either way, I'll respin v3 with whatever you both prefer.

Thanks,
Matheus
