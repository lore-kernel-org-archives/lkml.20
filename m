Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971735;
	b=AIGySxyuB2iIWiVOZauayeYsAc2GcybGlnX7/Ka0APqTnP/nccJdWzHcdIk7Ze+h7UBS
	 KWWLvAseWxtxSc3WLj2vwdXLhrTWPzlk8ZjTBFCy66L6YarqchbvnqVHG3QwHxRnCFN9F
	 3ZLQAQ5LbaoCNlDLPFVX2c8jRqGKM9FJ04XZv/FjWfh/W4fK/+23kxML4Bh7vG/pX9Ymo
	 tXizJj4zC8F3Ec+f4wOZG3af1t5WGlk9HA3lNngkS4yBhvHO9fnrCHXrMgoeqeqdmPhmM
	 6EBS1zkAMoSw2gf8EDR/hc6/iag6jR3fhxvKKKQ0nW7NpZnKJbOV/a9IxenV6D4cYFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971735;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=FGh/a8NZBJfp8mFK/MC4MYiJPVVpSd8mLxLJrAV0sTg=;
	b=3feMCzkC3IebhRI58d5B3TlFz5HTaAaCjio43/b48HSFI0QGRCar3GN5VVoFYG29yL+E
	 PR6pSrKXwz83HlnsrfMNmXa5HtJz5XABrceA3jU5ugWmXpNPYOtyaB/kRopMEviUkNap6
	 Ah0saKu6wU9BFwV6UJuqQbCvYsbKWxCRIrtg+IQDvV5WrRDeZw6NTSfQOen96VJWjGJ+c
	 7C0Lajq7sERxDRu6iNJnX4NwfaaDVQbAA7HfGC4c0Z3tkG2eNKzvxSvq2x+z4RQc8Kr1I
	 j/B7W+/LupPCQifejAw1ssC6EEuxS36GrSM/50vn7MTuJbdiXL77uaM6rE1i+hyc7TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KXGSaWym;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E136606A338
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E136606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KXGSaWym
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793971733;
	bh=Zbw4Pdi7/7yO5hBdNSUYXrfRS7EY1BsSPUefMzufvO0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KXGSaWymhy7vDq1ttAqgN//6MlUzMkvBRQ9TGNFIUu8N8bF+aJhjxYkcOykxTASZe
	 dXjkFbsSyC3pB9bg00QGoDlehTyzk3MX/feiNb1UzSi6jB1kqnL2pTh4a/tj+vagM/
	 aq+wt5I3zRIPZ19jauH2NmtFHgxwxCE9Emf1r6LB6VFX5bwBQ85fngNYVHBuWdHoY2
	 QgOCY+AuyzqjASUSPVIU5ieCo+n0iZNrXJ+S0XPNnBs/J5YrlV04UshV1yIojc9sae
	 +zUBMzi2QNTupSQXfzy8eYXJ8skF+ZKYIkK4O/F+Sxsqd9aAzuCN4uGzLfKzJtawXh
	 u6eNZJHg/RJOw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA49317E031D;
	Fri, 06 Nov 2026 14:28:52 +0100 (CET)
Message-ID: <a22410c8-7ee3-473c-aa8e-9c71c8555bda@collabora.com>
Date: Fri, 6 Nov 2026 14:28:52 +0100
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
Subject: Re: [PATCH v2] drm/mediatek: Validate gamma_lut size
To: Fei Shao <fshao@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20261106103932.1219696-1-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261106103932.1219696-1-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/26 11:39, Fei Shao wrote:
> The DRM core checks that a gamma_lut blob is aligned to
> sizeof(struct drm_color_lut) and at most GAMMA_LUT_SIZE entries, so
> shorter blobs still reach the driver. mtk_aal_gamma_set() and
> mtk_gamma_set() read up to the fixed hardware LUT size, which is an OOB
> read when the blob is shorter.
> 
> Add mtk_crtc_atomic_check() and reject gamma_lut if its entry count does
> not match crtc->gamma_size.
> 
> Fixes: 2f3f4dda747c ("drm/mediatek: Add gamma correction.")
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

