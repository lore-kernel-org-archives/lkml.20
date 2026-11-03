Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722489;
	b=rJPbMNjEEHVE+m2quiawsaJwVlv5Hu2b11p9Sjc/+Ag8LOQKu/upzENwU+3wZW2K63Ag
	 VFHQu2OwrReDDnYeQXdsS3UY3OtyLXlwODnzsBAoIaYtIFpdwqB2aW1+jZpSgh600Z2Ht
	 60PwmrbdtmrhpGN+3a0mHF1ONYqV2ZNnHRW9+JRnihQyYMz6sPFIs2rJ4Po9BA4U6NZ7U
	 1/b+FjD2iXtd9DkYtdxWSkEABWgAbAC2+21L4gXATZgCkSDDQfy9lpXrKt7MpwyNCLg7M
	 vLEgnH6q45u+A7/tx9ZE9+2hueZWtBi+I+Sa/RdBA22AqhWp1revjasIpqRG9AEmDPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=RqgKOvUc0lsw73NwDA3YxCNWSPfGQRTkcWNoeJzwXQg=;
	b=4EWvbYq7oPekLLf9UUL1j1mo/fJRcCLi098FbkY//5HhdUkCtzY2BZ1MwtQFU/K7uZSe
	 MMKm+6IYNllHdpl6OARbUfUa9BfTKUOHE9xRREt/vKQBpPh/hDd/NS8YZz+Orvf3Yc07M
	 49FHQIYdrC1ml3C+lvAzjBk1dmig+uzOec4ByONgKMz7c1JuX60N6SoNH+ojhPNxHj8BT
	 djsHib+8uZgFbUcM8/bhMkWjo0tZXr6GJw4oGIOQLAPOnBJteYkLWTmIGHKjBSY4jHpJA
	 LAnMLn8k0D0dGayBxzxyfNIKz09ynfm4kbluyb80ZM7xAyFBeAV71YDoAQIWUHrwE6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z55d4JHE;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704D3606A334
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 704D3606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z55d4JHE
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso38921735e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793722488; x=1794327288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqgKOvUc0lsw73NwDA3YxCNWSPfGQRTkcWNoeJzwXQg=;
        b=z55d4JHE0CJjIcyzwXkWFXj5/mWdgnZuDZ4EUdAB8g4kNbF9OOBgWMZxrB5XfSy8yI
         IU788zCQHWeuqtFbGTm4Omy/lNLBlG5elcgy6bQCcPSXO+NZZlQLpk/pyMyaeAMERXeD
         d3P51glvULBfhYRz1l9o9hxnr+QMDJgvzPv2SGyp6z8b4+bJ/AwMHZqI4jK45e1zaKEV
         gO4ene69Ec0RNf1cD2uxw3Y1VgUom9VE+UWhJRp/froJP1N+Au+R7h9TV8QazkVriy4I
         hJAxgl8yP0qd+9nvfITSBhOxrhl4ZqJrHtehcTOPqODQjICumVbMebbx2nLQPL+1creV
         gkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722488; x=1794327288;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqgKOvUc0lsw73NwDA3YxCNWSPfGQRTkcWNoeJzwXQg=;
        b=noKfQivW7mjcvlR5qFSyVCM7nwB8xJ9EgCHRP+OR/x3kNardy38MiNFwnYfv9QXoTv
         V624VO5ql7LwOHHiOq1zarnoVgD7+5oGcOvvKcHUTU5prZ+vxxm1JtNbJ6C/zXffEgkb
         a+brRThHhcjoYModoHWJw2pNP3z/digiipvIxsfprCNnKkpwt2ct7G4/oa1hLdbheAvO
         KKaJFMlMoGXh9E2WOWmxhGtdAhIl8Tt0BewUHndyZkyqmYZWn6/S0bNavGGvZ0lQjhuj
         nzG2NBzqNcXMRfDbGZaFviFLir+Co2QGW4LIs4xTJvfocM1ylBwt2MgDOWdI1J5BBtF2
         3kYw==
X-Forwarded-Encrypted: i=1; AKwUvBwsoA0UG/zmNuH4ByaoCSfsE1rQxbHVYseOP4lXFbr+8mtlF0s+bGetdy6s6QXYL/DM0uDVCoAnMSgY3VQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MJe9h0ZW1qSwaBAUZl1qVWL/TxcvsbZaBehk8pTrn1JZm4nvu
	grS3dy3WRwcGe55POp51yY1nXBDOSshVPVf5guc9Tr8XG3NW10XDIqdS
X-Gm-Gg: AYBFou3/DsOfKDBbkzu+ydqTo+oMq8iJSNFC/uXvfZHNhDyfvRrXNNukLcBdo0tnpiu
	paq9FDK4xFHf80JIQ0xzqjo5vQRMxI54iTMspeDzmauh95+wiAyeY4KgZj9rdlg1q8yX+IH/WXy
	xE9TFjWiwLTb5Yd2PZkhaDkMrFY1m+lSv1mD5OUiUHuwcDEmcz0zmYXqiIV2jnnneqr4BEcQiq8
	oLFGXOCjugYQfFI+B57VsoEOOkMk7YzzlSSw96F9ytIJlUdoVjSYRBK1teijoclU2K//Cyt85Mm
	qG00CI2Zjc53jKTAQkixwiR/mpl+WeMM1UXU8TCo4nwyRwmhQtcKwTogasjNMlNyjRUswgLCbn9
	erUfVv+Pl/V+aGTzuGvTqY6WpvjbfYiYLVRVWLh1zERI9jhOT/hgDQPvpXBjbnAI45NmtzEaFEi
	aWO+vgseTVPjAAr56xZBextlERGrj9CVwcK4XOhfZXT5lhvEFeZBjU/NE2T/x3f6KuG1AA3MVpM
	jHp6kzvCr9V0tcTJQNcNGSn6h+0uXzjnsZ+iZmXnzrkYla0iuDyNwBMGRA4kYdbHUeNVSz/zh7a
	gl7/euODyfoG7vb2Ave2Kvqk1lLmR8k9W17dq63C5OvvLrotnh86y0cZLZPqyDQxH+qu87e6FT5
	gvMw=
X-Received: by 2002:a05:600c:8b2c:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4ac151a8c26mr326782435e9.3.1793722487761;
        Tue, 03 Nov 2026 08:14:47 -0800 (PST)
Received: from ?IPV6:240e:47c:50e8:6a2a:3e80:5afd:fac0:93a7? ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d5dfsm30433803f8f.3.2026.11.03.08.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:14:47 -0800 (PST)
Message-ID: <78210b8b-818f-44c1-84c8-c013120375ec@gmail.com>
Date: Wed, 4 Nov 2026 00:14:36 +0800
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
Subject: Re: [PATCH v7 15/16] drm/vkms: Switch container_of helpers to
 container_of_const
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Daniel Stone <daniels@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, =?UTF-8?Q?Jonas_=C3=85dahl?=
 <jadahl@redhat.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Simon Ser <contact@emersion.fr>,
 Victoria Brekenfeld <victoria@system76.com>, Xaver Hugl
 <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20261030-drm-reset-state-flag-v7-0-4e55eaeae683@kernel.org>
 <20261030-drm-reset-state-flag-v7-15-4e55eaeae683@kernel.org>
Content-Language: en-US
From: Oarora Etimis <oaroraetimis@gmail.com>
In-Reply-To: <20261030-drm-reset-state-flag-v7-15-4e55eaeae683@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>

On 10/30/26 6:27 PM, Maxime Ripard wrote:
> The vkms container_of helpers use container_of() which discards the
> const qualifier from the input pointer. This prevents passing a const
> state pointer to to_vkms_plane_state() without a cast, for instance
> in atomic_get_property which receives a const drm_plane_state.
>
> Switch all four helpers to container_of_const() so the const qualifier
> is properly propagated to the result type.
>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   drivers/gpu/drm/vkms/vkms_drv.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 381483aa4fb0..dea6cad3f1b9 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -251,14 +251,14 @@ struct vkms_device {
>   
>   #define drm_crtc_to_vkms_output(target) \
> -	container_of(target, struct vkms_output, crtc)
> +	container_of_const(target, struct vkms_output, crtc)
>   
>   #define drm_device_to_vkms_device(target) \
> -	container_of(target, struct vkms_device, drm)
> +	container_of_const(target, struct vkms_device, drm)
>   
>   #define to_vkms_crtc_state(target)\
> -	container_of(target, struct vkms_crtc_state, base)
> +	container_of_const(target, struct vkms_crtc_state, base)
>   
>   #define to_vkms_plane_state(target)\
> -	container_of(target, struct vkms_plane_state, base.base)
> +	container_of_const(target, struct vkms_plane_state, base.base)
>   
>   /**
>
