Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799363;
	b=ohxViElCusQmaQrPfcXUjmq6h5uTi5j2/zaA9Q+cLUG55YRVdxNRYTDg9wq6M7pMxn/0
	 e2b8YIKDQTKtt0vh3n0J+i07UtgDEx85Nkv2jqDspPSWWnCTXdvzaZ2AiJ0YMGBA+RQJ3
	 6oC+dt7BOLS37EVHIkliHf1oloJK8V5tGtiqWTNk5Q4gCZXXCz4BgdDZuFaHbXzXOruoK
	 vNOC73GEeSEUBzc8v25eh91zlIDnHRTS9aDXTsQVvPkfc20DbkCy41vw//KKoIRD/2b57
	 MwZtAYxnSTUNvmsZRPACOErxATeehOx/BEMe4UTHLLVrFerLl4lmZZJdhzNqMNguuzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799363;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=YzxhnpxUqBGqHsobluwVum70SeDJ2IoGkDGEiWWv1gU=;
	b=sLvqpsGJy53Ufg84fz20rsKw+XyNsj8+r47e/XF0uGHq6KqsEzVORNLtoe8jF7q55w/2
	 llEirLzHwhXSY7JnNBrk4x1E8lgjO4Qn3rdFF2W2NjenXkfDXNHQW1P1knOsl7fXzep/o
	 6dSSfVS7KQchEdR9eQxyGq4/cxhsz4ujhYa+b6UR/uHR9EYRaORJXCJGt9fucY7q27d5r
	 rhTD2SPBPvwXQ0MXTZ9VVJL1BpD+KH3IxXVFeICneWOy0wP7K831fc4xZoiJhtRJThszH
	 sF223xL705uHx59jG911qqVZsdFHX5Z64i/yL0Gut7G6iclRUFo1m97w53jT3ZlS5Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=nxmSHtME;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE98606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFE98606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=nxmSHtME
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793799361;
	bh=Y50lTd+v/mAmOMd0DQBCaynW91uLDTWppOCSN5jsCG4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=nxmSHtMEU+dek1QJhtYKgggXiG6+UesAKILlb3OC3xpnz83W92fiZcMdaxfOIleo/
	 9el6zATiG979ybbpVa0M3qJzXg4NbZlkF/wjOeokkb+8KLvx/darvfw7XGPND3G6dv
	 NKSwM4iGiO53DSgiMP6Z2AL/1yCwTF9O+ox8LpXRStH8g2UXofA+k/oZNwwaWdnZUP
	 Bmm817+4Tikqr+o0jZdkTkjcki4/t0swuQWD5/a8d46tl4lAtbBpA75133ZIOBeDuR
	 lFnWTpz1GdGdouDXtfhPETU9FvQs8sxYgKSpcK5mnaVapMyKHYSKIsMukNiaDK/L8V
	 tT+FjgBtj6aTA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E887317E0269;
	Wed, 04 Nov 2026 14:36:00 +0100 (CET)
Message-ID: <9299bf4b-f238-4af3-84db-61af746768da@collabora.com>
Date: Wed, 4 Nov 2026 15:36:00 +0200
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
Subject: Re: [PATCH] drm/display: hdmi: Prevent NULL pointer dereference in
 sync_scdc()
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>
References: <20261002-hdmi-sync-scdc-fix-deref-v1-1-d99b4f544dd4@collabora.com>
Content-Language: en-US
In-Reply-To: <20261002-hdmi-sync-scdc-fix-deref-v1-1-d99b4f544dd4@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/2/26 1:26 AM, Cristian Ciocaltea wrote:
> The connector pointer is used to initialize the local variables hdmi and
> dev before the NULL check takes place, leading to the following Smatch
> complaint:
> 
>   drivers/gpu/drm/display/drm_hdmi_helper.c:663 drm_connector_hdmi_sync_scdc()
>   warn: variable dereferenced before check 'connector' (see line 657)
> 
> Move those initializations after the sanity check to avoid a potential
> NULL pointer dereference.
> 
> Fixes: d653818324ed ("drm/display: hdmi: Add HDMI 2.0 scrambling management helpers")

There are a couple of additional fixes on top of this one, which is why I've
sent them together as part of a new series:

https://lore.kernel.org/all/20261104-hdmi-scdc-scramb-fixes-v1-0-16a9bb3d64a6@collabora.com/

Thanks,
Cristian
