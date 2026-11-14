Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682265;
	b=C/AxxzML5LWUKGq5qJQmiK8INWZbV3t8z0gRp7VdHKnOIwUbvD6SMNYWpxL64EE/aGwl
	 THySdbdm2ZwIs3LzsyW2WK4QZK8T72db2K8wwpe8X0OZhblJab2tIWW1JoNRKyNi27xJa
	 5eNSFI6L3XIc2PP+B3HrBpTfPBuzrNLs+hM8jEly/w1ojDJA3/vXQ3BZrgxkkQb39AGy2
	 LCc9BZnq4gv5N02yxPgz4BqycsrDzGoTEfM8MOXIdjnhg0kmBRc5C1FxOaQOI9crSJoJN
	 srWuyGNbdzG/kQ0ZIqrppOMHw2gIj67tFpIyxSSO8u+jz54U1o8bHhDeOOggrXFQbSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Ti+Jb+6rot6D0fGqe0TLD4jEkN6i8C21i0D0JqlvkBM=;
	b=VIiprRVCs2sojzinCuQ6dVXckALT2l2PH1IwSVCCoG68xl9cio5l5sWIQLB261dqZ1uh
	 AO8huoUvAWV7hEAVeMlWXESvAX3lBUbeon2/qO19JdfsYRnglSsBirwCQRfiFgO0LxAoW
	 z9CYD1ss1AFo9f5S4L1ar+X4g70GPYUta+nOgfrwO+L6/2Dy/v4DLNNo6Z0Ud3RXIT64v
	 zI4WYoJhcFRUSXFKalL6+HxelFc0h3913ReAuxpSKgQ5IA6cpoLVVm0Ub0lfvRMVAbdIG
	 cT4jLz06AZu8osHlTiM3+hRlWKwRzJUrE6y8ZXmplunLQn99TzVXPsXUkkkgvdQ+m9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fy9f+vMz;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE46A606A886
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE46A606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fy9f+vMz
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so3951221eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794682264; x=1795287064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ti+Jb+6rot6D0fGqe0TLD4jEkN6i8C21i0D0JqlvkBM=;
        b=Fy9f+vMzmp7n3Hmbvma919FMJ8R1j+p1Tpy+wUmx8IywgHAGrHs7VQYCPqRmfdl80y
         D+CAa/1e6U4t0jniDpoZ1pdsmE+UAMuSpDKhdIkbFpxhikWI3eC3Wqj36qgibQxtDEuq
         CH+n4AQQawGQVIjnCz4jqvcKowbaeLd/a605/FOcMph6pN/OZT20Zca9g23GD1GYSsZL
         YqMWj8mmihvIV1Jnk01q3zQnYoSyMfqibMbycAERSGMaeilyBDfjXBPFxgYWjg8NduHk
         zfZfLPoXmFfSYMyL2YXIXX1pR88j1Qs9Y5F9bnZp//qY5pkUvPYqlGmph3U4TfVYNYA9
         WNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794682264; x=1795287064;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ti+Jb+6rot6D0fGqe0TLD4jEkN6i8C21i0D0JqlvkBM=;
        b=EEziqghK75NtShjmaXMTv9mp/rutRo/X+7xR+0biqE6+JP50sijlkYIis5theLA4p4
         Qd/2KN2n90NP/UrDsT8Uvxng7eYMVYAlbA1OWk/MNQBof+uck8Df9AUioI8hokmsuyWa
         goKbttCprd7tO/xrnDV5iWYMkSS0G5Q6sMcZccSKlV38Z15x4yzMIagoMHaJ98XOhQNW
         n2Dig5kWuFBf3eJy8/hFyO8hWPuD1pzjrzD88DKqpAeLXGupkZDFJ9znJ2HB0HDqAYLT
         5WvCVPxRAOV3h/I7bQjuRYa5AU9kmG2DEPL3JpZ00//7mQJT+7XTugGp5hHJmzUZ8c8o
         WtnQ==
X-Forwarded-Encrypted: i=1; AL+hErG65TNCNHh73nzkqemfEsaTvtCZqXf8soSGhF3GudzzcSQpZFVJuX8Oa116sb6P60N6uJae+4tk3rQgxf0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GUrmPBiQyMiTr41L19AXh/PVKoWAbSGtP+x0ST4E6e1C5khxL
	rGfoGpwoWkeLSMmP/h8Uyz3x7tuQk+O3jhcyT8ec4sf/aFEQcgW+2J+0z+jG1b7J
X-Gm-Gg: AYBFou2XxSFu/I5cl2w0wohEFE5XNgxemKka2iHREkNpSSJvN4lUjuDdQyJk73DoRx7
	R+dQZxLE4VEp43CbtTmRqbY6H/HqXzykNlm3n1H7s5H3jbBMEAwXNB27hpuVkgsQsjfBzveXDKV
	nIV1w+rLlqyW08JwcieRD/MUG1YTU8qXL6CGSQYRWoA2n0yduN2gqMamjEwBmqQJfwITKb9xBvX
	eWOHR8jj2mHx6y9i8Z3JjWAx2w+qkPytkEVrQWnT8P2ODpGOE0jq49h4+DvH5RGuQ+YtO6LzF1E
	GHO2e/kJDxF+y7DmS8qb8St4Lx4CjDNoem5/hRtR335autxrq5Xl+3XAeHqQBfYMAYHEoSEfvrF
	q+AqcC0Cp7MYXdjakpPik2rRUEXaTWC+6whliQ1Cvnsp4XYDZkc4umNcocM2GA2nDNXARL5bv4M
	3JsTqwFEOvW29qoEk+hb4AUBvRD1o4w1l69xAotDS/BXC2FBc9xg9jrBOikkQ/V5Z0gW/wYHLCT
	Xollb1frYWPemS7ns/P9j3ZTXIkAu6XP1y7dTBdOE3mNjJhdQRfi/AqQyr8AvB9K4F2eGdnP9rE
	WCzFUNSwBwhy8ucyZaiAM/QZGyfe1hqZjX2pH4E6VY/gC7ES27UGxIJaHtQ0Xl/k09nZxnIsztu
	zmzIQBjs=
X-Received: by 2002:a05:7300:8b85:b0:36a:1f8:a56e with SMTP id 5a478bee46e88-37966a5848emr9057429eec.23.1794682263819;
        Sat, 14 Nov 2026 10:51:03 -0800 (PST)
Received: from ?IPV6:2600:8800:1aa1:b100:2831:c6dd:8b01:b6b1? ([2600:8800:1aa1:b100:2831:c6dd:8b01:b6b1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm20079398eec.23.2026.11.14.10.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 10:51:03 -0800 (PST)
Message-ID: <da130728-86f4-43f5-a8db-796562c3d0f0@gmail.com>
Date: Sat, 14 Nov 2026 11:51:02 -0700
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
Subject: Re: [PATCH 0/5] drm/vkms: support more formats and fix RGB565
 regression
From: Sidharth Saha <ssaha2000@gmail.com>
To: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260928005301.367977-1-matheus.aalmeida@inf.ufrgs.br>
 <f3707b72-07f2-41ae-aefa-c46ef84de3e3@gmail.com>
Content-Language: en-US
In-Reply-To: <f3707b72-07f2-41ae-aefa-c46ef84de3e3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2026 5:18 PM, Sidharth Saha wrote:
> Tested-by: Sidharth Saha ssaha2000@gmail.com

Sorry, I got the tag format wrong above (and in my reply to 1/5).
Corrected:

Tested-by: Sidharth Saha <ssaha2000@gmail.com>

