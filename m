Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794556616;
	b=gLNywvjCx3/K7I+uVaHd6MjkWiDQ4NoGx2ab59GBjMx27t/uDvb0SOt2v+IJvZa+sREr
	 BxzSKZ+h1t7dxpbE3DIw7auV98SP71/2jNDkOuwENgY5VDXWSHy2Ssscx1GKzqd9UVUB/
	 yx+/5riOnuxnd7JCW28VvPFMFD8cVfZATX/gIBHOmnTGFBsnw8dcfQc7fn21nznc5773h
	 5hL0B+qtRAI0bOoJFU0BTFxRM2RsxmFAkpZlKkURh782cHJ5Vf8uGxVjqkMzLLJCuaDsG
	 I7sAxV+ZV4BKBnmcUmDeUmRVKfKcVxzKga7dLuHEP2msjtkeT9e1FYo0Zy7c6gscpyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=QeSYZZBSKoLuliFiah1nYjHZ50+xCIiYrRcjsFJbOlU=;
	b=C4silPA+V4QUFyYvs+6Se76GiYieyfikmsdzSpZ9htOGjelaApdr09qJMZcH3akexVg1
	 EbVdLE5p9xUtqed01htVTbyHi3yirbNkuCo74rtPl+ie/5M3cXeo8b7VI8kTCiYEQWLjv
	 FYsXR4+9Xjb6FQHoIf58G+azuJOLE47WC9c6I4gZHJK/aue3d+HdTtwBlElXNusr9zHF+
	 TZd1P37ZyJP+cZibuGcuKuDUjoSGfT2tBrGqn6uYoUE3PKhqZcyK4YO488iA3qytQmQUG
	 fksH8z6N8WcbGE4dbEFNtv/+F874t7RHhWlVSoaqmQmW5hME1aCsnOhponbmQVZOD9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CBJr7R2y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52177606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52177606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CBJr7R2y
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c09dbe96b1so53951e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:56:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794556614; cv=none;
        d=google.com; s=arc-20260327;
        b=UHqx6rZ0tphOf83EORcK16eFNAlhOzkHCPZ2nJ7Vwqc+DD8MBblOIpSC/ObTY/G3ff
         DPCqulaZaJJEQFVqYyd1g5tVHO+6Ed6yLXgN3/kM50e1f+fR8ZoXVa1UokSF3r3JRoMN
         2uMkCg19WxOb573RxGQu+BbERvejyeKB5AeEUYTyNmunVV4FBEp2/YMZLAVFPEIl1T/4
         cMPcqqP62/BnATRzWvFyQTIr74AZgrIZIZhzEGs4FppsA+l67weqs/Ru6b3tXB4m6e9w
         dsQvojcWfwYeqBtBdNtA2zwBEV+iYqRwqMr9Ylv8qDyflaXnJNL66XiDYNkd/N2vBdzB
         1fIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QeSYZZBSKoLuliFiah1nYjHZ50+xCIiYrRcjsFJbOlU=;
        fh=lbb4NNkH5ausChKVP6e4ZG4C/OQuBo4gj/EI2sfoITs=;
        b=Q1vcTqmqbhgeafFCu7lvyUHLiprW073QYg9YPStc8DKDhnK/r6QqTTnSjh2LTYM73S
         oIfzi3Q2WHaEm8Rh0hef/LpCyBx3tm+FM7h3qjsuelCYb0c9+UTGiWypBQHlfaO3rE7M
         4aAKRoe1sn3pNlQ0YPZj00jjrvlxiU9gAGavUqITMzlqcGiTiS7l9klh9xgHpdZrITi4
         rj5PWhr3gQwfpNZPmGfOl/oOFJ5WArd5yQyLzucq1atHvCpO0wY+0VVzIb9u5AmSZdqs
         Z9pBRy13Kuyn3eAbgPWsE8DD6ZQ2H+HKACWWU0dhGBJAI4ptbfkXRCxWqKWkcjqGIRUj
         4a8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556614; x=1795161414; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QeSYZZBSKoLuliFiah1nYjHZ50+xCIiYrRcjsFJbOlU=;
        b=CBJr7R2yumTXlwKpm3buCCEXKSx4vvzEG+tobO474AayJFPLRrUgSgnirLigWOMWi3
         IrhHMsBLA2/rREUCo+VW1hhcGyAHhWEYaFUPTBiwyNSiyLUQvXe1beWuFclCM8lsH258
         kDmTpl1kbGIhCr9iepM9MV4xUMcMi1kue6HgYfPp5fsvHF6p5/TRmlK5RMtC/CXcxIEv
         pwmqBVDCiwOEZZZ7YVVXcaSJwEa3wl68DNM/IGWDCR5N4Y567OhzFA0NoE85EiL9BER3
         n8QTqsUvz/N6ojrAtvT++5KxQBtI6V8Bc/Jmt4K3XepdgmuKGOaZT4FluTdlCfNszfhE
         wZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556614; x=1795161414;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QeSYZZBSKoLuliFiah1nYjHZ50+xCIiYrRcjsFJbOlU=;
        b=lHSI+CofkYhfCmQzio0DMY5e7YIeazAPjWuNWFNyJHYAbbNwsF3M14ZqAciTuqkfNn
         czHMozhqJEdIcvGzJM5IN9EdqxepeJCF2cRE9RCRxpodaa/CarJsGWtqof1VjkpsxCRe
         0nqo/KqjisKvTM4TuOMdzOxQbgP4z2Bz7OZWNqalK7cGwIDDS13t0U66o6Kpnezcib4j
         L/9vpXSGNN+lRHzzmcusZH2+5Yc6nG8lFKljtHkwIG+8StVt6DaMWZhfUxwLhMWumKEU
         AmvyFwj/tIGDEMq92ccq0yHCwIugduJFK3hrObnDLTidPoploNPcWbEWgtW6Sssqmivo
         SgwA==
X-Forwarded-Encrypted: i=1; AL+hErHOssYgxzkOjz8vPAdNVRQFkAgtg0vRUCyrKkqsyKVOBLadwxbPWqtWIBF4yFJAHO5ZreVpvJLUJHG9NCg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KuOFwBOvnZDfpwJ7r2wmwsNhQKMxPknMHyi1I+2O5uYq7L8JT
	rFsYclOOZCWdrV0uzGMG34hTe2PqpbBd9FXThSnfYkIEP6iyI3vDCW3yyiaGJUaFB/UVXy5NV4m
	PN1bocR/DaKc1EeTrZzM3W20T4V2EwH4=
X-Gm-Gg: AYBFou1kyW6Bg2VALvVJFh4IjYa7Pu3fv0rCOEhQq2p8vSSMJRFaVx4/9jpZBFY8P4w
	lNE3HqxeHo1P38bAh8i28UtZfA1qmVg6P4C//uUFVBB0wZxHhC5IdxwgxYXsBgQzqc8Tqk0Xvf6
	MToQ93hXqi/1pn0mp3g7c+CjCxrnB5v6nxnPv5gROR+JCngWKfy2lsOLvw9eqHOwuSAtAY0N0TF
	KGgKbGaaKmWOBMgkTI4JiSuVcmgYUYs5pQxEc5FzRHEPGpa7HVk/wptM8vFNO1jNxdPZWzxVWpR
	1pXpHT3+JnzIDLrGUxhgpTkwY+kRBim46L6cNiXhiRxpGBI1sXcfIhoTzfGNMH7HNbttYGalM26
	ijuOC3i6Pa1jEioxzAXutDWv1N9LJo+slvpYK9A9UuftsGtArYPTkRncxr3LlUA5BB2gHtfQ=
X-Received: by 2002:a05:6512:39d4:b0:5bf:a48b:7827 with SMTP id
 2adb3069b0e04-5c1705f074amr884635e87.2.1794556614399; Thu, 12 Nov 2026
 23:56:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-smmu-cmdqv-leak-v1-1-7ea8e34277ea@gmail.com> <avXBEbkBJ1ZMZ00B@google.com>
In-Reply-To: <avXBEbkBJ1ZMZ00B@google.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 23:56:42 -0800
X-Gm-Features: AclHuK9R-O6Gj916v_Gk9doDaM56nfSpW5aT6J15ATtqrTQAWDgJ4XngFSKQD_c
Message-ID: <CAEy9hNX8j9FUrZBOBo3aU41RSif3_MvtSQaq=eY2yXTK2yxJnA@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Don't leak the CMDQV device on a bad #iommu-cells
To: Mostafa Saleh <smostafa@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Ashish Mhetre <amhetre@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> IMHO, it shouldn't be worth it
> to fix as the FW can do many other harmful stuff to the kernel

Agreed that it only matters with a broken DT, and it is a small leak.
I'll leave it to you guys as to whether you want it.

Arun
