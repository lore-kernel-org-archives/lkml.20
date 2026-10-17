Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCA834D4C9
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792215037; cv=none; b=LwtHXZgHATx6mmIc6gV2EQAs9Oim5kQuXAovyNc0aYcevgz6tWcj+lmK9d5ciDw2D96GD4ANdl1GXL/aCpqR/DKRebpJ/q+t8zVQ1aS8npJp/Ioz22j/VQCX65/kYgVy8YrPRyQYkQf3E8aSL+r7SYg/ynjNe2f1huars/bvpTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792215037; c=relaxed/simple;
	bh=RxM10DI3BuIoTcTi147uoSj9N+L1/evJEXFkjBTQxME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRUTRnt3mIewXY5nREepunU0/ZqH8Tg22kiPWownnWLWCny01ME91pem7MjM65fqxHNVAoQBC7FNnW3K6luhsDRS19PGqcllxvV+T843Av/DobDWUbOzvdu9arm+QQhrqxOcUZxpE28KjCNd2akgmwtmnFY0iSK97oOqAtAuHJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=hLI2ytZw; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="hLI2ytZw"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e60f9af6e6so3470045ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1792215035; x=1792819835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A9n2Zo5diFt/3lyLr9LLZJwOhqcYigsp70hUBRz/SN8=;
        b=hLI2ytZwSikJA6WDcU55svB6pglfhvsPAZxBURFlPugCY5ekRZ0QDhMWaGDekW0Hc2
         5CMQKWrW3x6iDINcA1iVwEv4yDjCW6EHMuhvwIFAt1rWfI31S6CIJk55g03lJHc11ATS
         E/BfyRRLnw0e/FlQwJ6mxgGNmUUW3/kqh5AnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792215035; x=1792819835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A9n2Zo5diFt/3lyLr9LLZJwOhqcYigsp70hUBRz/SN8=;
        b=NIj7Yo2vG/ELDBISoxiC4Mo1bqqmiNIv27rFtCXZFj6+KQcysoHDt/cLbCfObvK2j2
         V60prgLrd84jpSAg5nGzkd4p6wcRVsU4eANylF5lzECSSjPjPBAV6ofbEvm8y4YqFdqM
         oQ4nu85oezFlyKd3rVoytBc64Bw+KYz7s/SAxn5R4OIVNIApejv46n+VO6UxCkTmdNmr
         zieNpxj77CSTc1GnFVGxHQ9m4S2JSJke8Sj/uOM39B05URNncfbKe85ZtX9DzFMVwVmH
         9cULO+8FQ5Ui4CZLjFXJeDG7KsBD+Mbn+pQdx169iOvVNWNIp9zndAv2GmbSllkIj2W1
         bLDQ==
X-Forwarded-Encrypted: i=1; AKwUvByYdd2IBP60eE44gWqen2ntHe2xVyJ1CNZ7LAGeMRe84upeI37XN4yhIxUJwMspEnLL3JhSgZOoFKJQbV4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXOdMcS0Ou8p3oOFNjh8auHOovm4Lrlc9PEpwH3Q0rxLL7PiCZ
	BiD7ImwOzy2DhGVX9O1wOEqQsM0osyKYwgMXKEU4GGd8O+nigRcTRSSRmNPKoUrj4Yk=
X-Gm-Gg: AYBFou0aU4yaewmsNj9+86DOb4jJgsLTRHaxfAY5cualSV3kYHhZnPfms5opLlLjDr/
	6Tj4OlopZlXLRfr9HHcsRUxGP91XNi8dWyY4HVdEfJUhi7Tgxc+gSojc7GIBCP0ampSrBf7PUKS
	i17i7gMT990N6Zg1CYXV1Qx6YPr6EuDcfUrm8d7rFt5TpcIS64g0fiKyalHhAoE8WlcqItuHh2A
	56bl7hYDl86BrL8n8bLVu8Rzwar/RzIUMo8E22Q+X3DmaqFQa5ROXinyO3Tkl7VEQxVGA2QFFfF
	6fMNddA/Dq2jF81KAI1cpuui1Vd5VxQkjNXRp8CF59kkYh951M/i475YS5rcCc3vOAYxxIjbSpp
	Q05/RvUU/iZhgkPnYkRlI1SaUlKCzMjkcJviHKxU0f5ndRn9Efi2GYe9E//Fh2W3mpc8+ir4soa
	Qn0yExh0h22DfTAMiaTymrX6io4THNevnw5V9cr5Bp1RhexrsU+lAv1UCUetw5y7NnII3Q5CR3
X-Received: by 2002:a17:902:d48c:b0:2e9:b7ca:cd5e with SMTP id d9443c01a7336-2e9b7cad85bmr5277485ad.62.1792215035336;
        Fri, 16 Oct 2026 22:30:35 -0700 (PDT)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b2001sm18691115ad.71.2026.10.16.22.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:30:34 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: ZhaoJinming <zhaojinming@uniontech.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] accel/rocket: Fix iommu_group leak and unsafe IRQ register access
Date: Sat, 17 Oct 2026 14:30:11 +0900
Message-ID: <20261017053013.4403-1-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610071045.3414828-2-zhaojinming@uniontech.com>
References: <20260610071045.3414828-1-zhaojinming@uniontech.com> <20260610071045.3414828-2-zhaojinming@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Jun 10, 2026 at 03:10:45PM +0800, ZhaoJinming wrote:
> -			iommu_detach_group(NULL, iommu_group_get(core->dev));
> +			iommu_detach_group(NULL, core->iommu_group);

Looks right. I agree with Igor that this should go on its own; for a
standalone version:

Reviewed-by: Sidong Yang <sidong.yang@furiosa.ai>

>    device on the same IRQ line triggers an interrupt while the NPU is
>    suspended, register reads return 0xffffffff, spuriously triggering
>    WARN_ON macros and falsely returning IRQ_WAKE_THREAD.

On RK3588 the line is shared with the core's own IOMMU, so the guard
makes sense. But it's worse than a WARN: on a ROCK 5B+, reading
INTERRUPT_RAW_STATUS through /dev/mem while the core was runtime
suspended hung the board. Please mention both in the commit message.

> +	ret = pm_runtime_get_if_active(core->dev);
> +	if (ret == 0)
> +		return IRQ_NONE;

This returns -EINVAL while runtime PM is disabled (e.g. during
pm_runtime_force_suspend()), and then the registers are read anyway.
Returning IRQ_NONE for ret <= 0, as rk_iommu_irq() does, covers that
and drops the "if (ret > 0)" checks.

With that, this part looks good to me too.

Thanks,
Sidong
