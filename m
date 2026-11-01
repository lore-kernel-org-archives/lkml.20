Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542631;
	b=eH6TGCh+T1yKJOHhcPKrhuJGvkUpBDg6YulQNXTkMzlL9wr19TvDCydScz+L1Ub3dj+Z
	 /mVOghPyOyUTUzHS6teeqEHvyYXj4pdU2L70XWbagCK9MHxjRE4s4S/AqnXceELrpgokz
	 I8sewShZQSx8Gb9MpZIHXUSjUg1Sg6mqgbhzRgTg7lGTwOqjfMEIQd1RUNc2j9OC918I2
	 STYyVIXSIoBbMO/uhVVumqLurqSuMP3UmdgwB2RpDsIm6NxEH9X7+Ufpsacaws6IINNiu
	 VofFB/MsZyJSC/n2jtNVHjhLFiZd7I7DjC5ezb+X/ve6NWwk4W7FDOimovdHhEQ1v7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542631;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=LWXBlZLPzKnKaNGDns1PDTQof10SihzxvuMClE89woY=;
	b=SvuP7LlKlD4KcbiZTU7YUIaxtL1NLGd37HJYfUSVZRi+gNXwl3v1G/flk7bumuxsp2eR
	 sqj+QpnNN7Iewl0azXd/5l4zrIR3Fv2gjP2bAk0ivLJK2j9WAZkLEqzczFonYnYNr9MRh
	 yq5gdj3/KryKAGgEfocUy3B0rt6vnzuiyBTV2wPdW79cO8IMyNdY7Ubyj/XJSpeyMrE1F
	 /L/rp0lKZiabU+7zLLknwm6NcMNvTRLvttvqcrCiohG0UHFYPbIwZEWaXmfrcJev8KY9G
	 AfsKakcmNAd2XqgH3mSe7cWDj4/iEdwSIHSDffPJxOGrC25Cevn9p7M1xb/h6oWuJ8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BurmkMJK;
	arc=none smtp.remote-ip=91.218.175.3
Received: from mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAE1606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFAE1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BurmkMJK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Mr3FrvXdJqV++CzeIDT2YbM/X6OsDRN2jwhe5NJSwRs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793542628; v=1; x=1794147428;
 b=BurmkMJKg76iQ0+eVR9kVIv/TufYb6x1CY+Mt+sWnb271cCbyk3sT2Yld73jF/xNXTdBOJ0e
 HGKwYcGV1lKRjBaGeZ0WW3oQ7Vm+kpMYw4RSt+YYDGciCN6FG+DxozK/kTht324AhgHz/2aUw4Y
 zRUuAJ22xzGfAM7Ymtg2TLQc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 65d1e23b5d0d19f7;
	Sun, 01 Nov 2026 14:17:08 +0000
X-Mizu-Trace-ID: 65d1e23b5d0d19f7
X-Migadu-Flow: FLOW_OUT
Message-ID: <51403482-bf37-409c-b3f4-cd957f34c1c5@linux.dev>
Date: Sun, 1 Nov 2026 14:17:03 +0000
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
Subject: Re: [PATCH v4 07/14] drm/tidss: oldi: Fix wrong return value from
 tidss_oldi_mode_valid()
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
 <20261029-beagley-ai-display-v4-7-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-7-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/10/26 10:18, Tomi Valkeinen wrote:
> tidss_oldi_mode_valid() returns 'enum drm_mode_status', but the current
> code returns -EINVAL or 0.
> 
> Fix it to return proper enum values.
> 
> Fixes: 86db652fc22f ("drm/tidss: Move OLDI mode validation to OLDI bridge mode_valid hook")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>


-- 
Regards
Aradhya

