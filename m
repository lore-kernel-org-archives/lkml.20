Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE26D35B136
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 17:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788629216; cv=none; b=EdKa/Ega6FaTcqY8llEXt8IYtSOge0gSeUs4GsdVQbQ9jDJjzWjMwPMjpJ2BBZTe9eV9SyCMJJ1RtD3o/RMrNFIpNXHLRqmMGzbiD+cRtm6kHEEtycEWwULhTT5IrZP8zghqqDoO46zliHv3039bSgiiQvW78ugonIUrULlMjYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788629216; c=relaxed/simple;
	bh=gm2GAbU2aapkEro2/HB11RPcZtUVao5xZnpvqLMHfzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MAIh2MgnkUdqwbE/w2SBDqkPiEXfyA/ZY1V4iWheYqJ4IDZ1glwUqFRcT+a/ZtKTXrqWQCcTsNxBKQVQymlvKb2sSzOZprSvlsoIXowy3MGLE6dMonQCg0ViVszSTneRyLGpgwwL8ePc9poCLeiTx6PftQC9W/NrfEoUoRztTbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdoISvfS; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdoISvfS"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-853c07a76adso1996359b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 10:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788629215; x=1789234015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gm2GAbU2aapkEro2/HB11RPcZtUVao5xZnpvqLMHfzg=;
        b=hdoISvfSCNk2wnnkpVJjNfWgUBGLkHJpTmTpaVZrlEmvbSYjqdscDyF65IlEjAuWta
         XN1UyHxy+AWUAlxhqU0CcsfCXVq5+zL+FQqI3r+hJYl9OLjgwAyo/4/PBQE2W5NuuBhL
         +i8LBOqt/uSFVpR25jA8GHuYl4gde946O9zg2OgAEqGcFAAmlJKOJgofDAT897Ct+Dwu
         Wo8B47AhfHazmf1FdmkM8ImD3Ycc4G1Z5OmZmdI4dq4c+RM2A28FOM69/ZfpKCYqZP07
         Zn2DwTH3CEh36TkvqXnn56RhMSOCN+x1CEAU8/FmcGvddTFuzNm2fldUbeZYMxJ8lHtg
         LCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788629215; x=1789234015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gm2GAbU2aapkEro2/HB11RPcZtUVao5xZnpvqLMHfzg=;
        b=WkuZDM5Njfyn7ytdzLmevZOMKH1s2kaSQMRj2YC+ZCP/tJ7wUUcKP06knK/VqWZlQn
         867xh5uIx7ccPlBxMkB8nWYbd5fHUC9MQvxdHXoirqgZG5zTKMn1wX2AmTMhfP+nQSYm
         c1BfjOy+/iR80HsMzgwdinIG4XY2eI4S0BnP0XN49vP57jjwRifEGWfxBFaAbrQHWDmP
         lSUWhkfKyltIdh9EZ3TdCuZx4SSQX2CqZ8w1lDMKFXsmk790SCsL4fDLEz2/CfyVHbKU
         mRy4K8VBllRMJr3slSumWAY9X9JLLEfsSevgenGUig63jSj1A+rB7+b16v3Mrk/pTCbi
         SJ2A==
X-Forwarded-Encrypted: i=1; AKwUvBz2jpntgCh0LxZvhYlOw3KY4KANJ/Ufy0/epqXzlK7gB918Lu+JSHuVtj6npmJxwixJs+BoVqw/1IGtRaA=@vger.kernel.org
X-Gm-Message-State: AFuF++nGQHjWPrQZAHg/iTlAfnYoRi/sZTQGw3G6l6wQLAerhBazJ7ZD
	dxSKXgKl9TZ3oa/tnLT0/Rxpfcg2TTlHMlooLT+kY2MqhuVZZYIWpMg=
X-Gm-Gg: AYBFou0vJyqmR7JCmxOk6vZjZ+eZRlotuIfae2FLm0SaMQwKkKyCH+ALbgI6w8i+aO5
	tNwhaJqBRpHmfkQzJanJJqKoyAwD4GH4rDzUAKI5Hn2eXdg1hy6fWQ64+SlZIHiWhU35Ph+QC5z
	mZ8BDXcJkZCi81XKDsNVa1m05oadVEUyyfZ/zzkVATrneXjwOspj1IgceBxkX1PHeVOXcS/61cV
	XKuw63olkxHmyLdwyiPTFKJEt6oXIDT6DM9oyFSDjvSxsNVpaSzMg+yDBRZ3o49ALB7frBwnhDJ
	GDYhI3NnjdeTU8WTpKrdUv5aUTYmp/R4qrIbNKzpRFfDGLIJAhV1hsU29cT2BBZDeq7KffzoO4a
	cfteeMxRj7SllI7ywiu7zWmGb1GMlwac7ku+Rqpq+CBvBL/P2fQBAH6oDNE9+4FuT85AkqHB3WT
	Kq53zLpD1lm1j1nv+MrjGOkELhWKE36T6KwcfbznIA6iCihwt/Wj9+o0O9JdBDxaR/4U83WQGYY
	3p/QIyM4OUjJHE=
X-Received: by 2002:a05:6a00:328f:b0:848:77b3:579a with SMTP id d2e1a72fcca58-86168b8a898mr19041449b3a.17.1788629214993;
        Sat, 05 Sep 2026 10:26:54 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc465376831sm1061373a12.9.2026.09.05.10.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 10:26:54 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Subject: Re: [PATCH] dma-mapping: don't trace the DMA address when the allocation fails
Date: Sun,  6 Sep 2026 02:26:50 +0900
Message-ID: <20260905172650.158565-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <568a4f04-e0db-342a-13a8-886cf6b2a8ab@linux.dev>
References: <20260905071919.30784-1-donggeunyoo.kernel@gmail.com> <568a4f04-e0db-342a-13a8-886cf6b2a8ab@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/5/26 08:57, Sean Anderson wrote:
> I don't understand what you mean. We are literally in an if-statement
> that checks whether the allocation succeeded.

That if checks whether the device has a coherent pool, not whether the
allocation out of it worked. dma_alloc_from_dev_coherent():

 * Returns 0 if dma_alloc_coherent should continue with allocating from
 * generic memory areas, or !0 if dma_alloc_coherent should return @ret.

It returns 1 as soon as it finds a pool; __dma_alloc_from_coherent()
stores NULL in @ret and leaves *dma_handle alone when the request is
larger than the pool or the pool is full. The third paragraph of the
commit message says this.

The second hunk is under no condition at all: dma_direct_alloc(),
iommu_dma_alloc() and ops->alloc() return NULL on failure, and the trace
below the if/else chain runs either way.
