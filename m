Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894218;
	b=aRyZOcZBqDbpSOJ5XdaBrvyfdPjiqBly1sbh6tBoLTZyZsYXN9Vojk5VNv+BTPgOANqQ
	 YgzA+ItrXAOSIK/ljYHCy+kdyt8axu/I3xCabdh72CsGjIVk07djdTLYZPHuXt+Qwk+zz
	 kE4hCEDfTmUhqB4fIpr//mGpb2omZWiIcRLhJ8lD9wAjTyGmKLZx/Ac2i7yz7jv7HucJO
	 rXZ5z/pKjMv8dUToXzY59VKcNCfF0UXcavMBZQxM4jwm4mYhlEUH9YsAezmpRuqoUrvGI
	 0TOt7Tojsv93bQvcfpQZqZkOUHXkNXy2iIP6QbCaslEQ3wQ03FEZgpMINO5Ltvdilww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894218;
	h=Received:DKIM-Signature:Message-ID:Date:From:To:Subject:In-Reply-To:
	 References:Cc:Content-Transfer-Encoding;
	bh=fwV/2B3TkwHJXgDq9v3y31qZQLcW8rg2jXVX7Q/BYBs=;
	b=pL2axKHH09Yl9lWp2hfwlbVwmw9Zu79SbWKUUSW8I3+ULEP4/lmERtCbeYw9h0DJ/QG4
	 N4GfrDTmZXFFnIXAJ7DHhn9iz6Akgk7OXd6KtmOXCunL8SRf9qdC3SxuToGrIfNB2Prfl
	 e5atfAJ2+KHWolsWBzYX1lfveqWESrKPNpV97/3zOyPmUzfIOs5mNh4ic/iRu9CYnBvLk
	 3I1xIp0zq0zbG8wDByirp41zXbvGPdpefbS4uYY6a9b8SL1v2e1sU416QlUhPvVV7hliY
	 +DU/j4TxT11hF2E5jdB4HBucG1FOP2LGkgUfx8ETRTYnXxod1p+66u/nKFehsCc888A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mthzq1VV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D0360720E7
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mthzq1VV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FFC51F000C1;
	Thu,  5 Nov 2026 15:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793894217;
	bh=fwV/2B3TkwHJXgDq9v3y31qZQLcW8rg2jXVX7Q/BYBs=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=mthzq1VV++GovyrOsvOve2PzrK1e2YnD6/5c8e6w07xQfL/JkNSOIh4XMpcPdniwm
	 diC7wRhV0Z3jTwQrjoOlGsHxGokLGE/x/ccHqoEEELTm9qyWnPJO2gTQAruanN9+qX
	 tZIHss3uEEY8N6rKhVA3TzbEdfu3fweQ6qgFVUFMQJAeCjo9ODpAqSMZyXMbc9xvgQ
	 SOhUaTSR/mlnqtLkvxTqOfWV1bzVHsMZ+X2P4NhNKgZ86elbsCEAjtkTppZN0E7X7T
	 YHIVctkIVzOQOiQs+W9fCNmU0kh63/NwOPKTg0BbSlhnrs40ou9Hvtby/Rfi8dIDM4
	 Yv1MzOmCbVxiA==
Message-ID: <654ec450bfe86c60279a352014ead93c@kernel.org>
Date: Thu, 05 Nov 2026 15:56:54 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Sebastian Wick" <sebastian.wick@redhat.com>
Subject: Re: [PATCH 2/2] drm/vkms: Use drm_dev_unplug() for ConfigFS device
 removal
In-Reply-To: <20261031225901.3200167-2-sebastian.wick@redhat.com>
References: <20261031225901.3200167-2-sebastian.wick@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "David
 Airlie" <airlied@gmail.com>, "Haneen Mohammed" <hamohammed.sa@gmail.com>, "Louis
 Chauvet" <louis.chauvet@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Melissa Wen" <melissa.srw@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

On Sat, 31 Oct 2026 23:58:59 +0100, Sebastian Wick wrote:
> VKMS ConfigFS devices can be disabled while userspace still holds open
> file descriptors. Using drm_dev_unregister() leaves the device in a
> state where ioctls are still accepted but internal locks can contend
> with the teardown path. Specifically, drmModeGetConnector() triggers
> fill_modes which acquires mode_config locks that contend with
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
