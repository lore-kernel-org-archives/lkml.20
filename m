Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668957;
	b=Bjd084ovnq4c6QO6kA/j3KdIUjypAjVqqoe8+nZtotIqGR/jqZ7K5FqyJEvkwDGkCMLC
	 CGImgxlh0x7RkrnvLFuzqBlI/jnQ+3GL3h42Bdsz5/GHKlib1GNoKldpNl0VRXif4vHtj
	 G/iM5FeprbcoblO9HTr6Jwre9f7CvOgnfeKJcM1EirsmZQlBqMd8NV09dhKHFsbf23K1p
	 TDwsEZziHpV0ixOxKmSq04pkGiQLJ0Ca54pEQJzVsnufk7zHqfrB2JRp99gk7cuw95HwC
	 V2k7D+kHNzR7tRCssq83XpKhKn7hkCZ540Orb9eeEgsE9ZLdFTJgqVQGALGi3cuzI1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LIozortPxX9/yGgYF5RVAdU5h+CP6K/5KZOyPsSClnQ=;
	b=xGkavMd36MQmA99yTam5Sa7MagtUdrce0/yi1uurtUvl7Vyrffzg8Z+3PWaOZLjnR6C8
	 dXh2al/r72kX0cgUWF5+zk+oTPLScDs3IN0hFpoEgTT54LFjJ1ZkVQ3jHP78+JnwSxP0j
	 XFJqBFj5rLlq6jNyg9lWVYrCNGmCFximS5XGUXdH3UpMbVHqFPJSNpDKqEwwuFhAtbkAr
	 5xlY6MAV/w5fCXjG/K+t6o2+6Na5jdbGxi4mMf9q2Gt9fj2tgSJ8CFbiI+0jAJn9fntB1
	 6Rj0uztr5mLwPJ/v7D5rXO2F0r5f/pSLvrDiZfDLq3jbhx/+2bz7l1uHbNCrV+CRZIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VQhn7uk/";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3456606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3456606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VQhn7uk/
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2587680eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794668956; x=1795273756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIozortPxX9/yGgYF5RVAdU5h+CP6K/5KZOyPsSClnQ=;
        b=VQhn7uk/CZ18gungPBF6zgrENs8w+eInmNfy1h5e2/gP55wgavZv4Zz524RVkP3Ij/
         LnTFtzfo/CoTZU4ipLc5Yw1KF7Tckp4Xw8j02QuCNi29qDcfpb0JbWGzUJ2ZPfz0K7NX
         tpw3Z4Ckx3dwLn0mANuZYTpgpgW+MOP9hnVUiUjTqrXEZciVAGAG8pSwnb3ks7lSHkE/
         7Ug3i7cJiO3h9jZVh0JutN4n1jvSWxfH5jlpb2N2OTrLSwtapS3tbI8MEJw0+B0J3rro
         /5A/loG75CBkRNO/QoL3bWNSNERw9wXJHeU6NOSA/OpeTksc219UnccPLeM96NzRHOJP
         31pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794668956; x=1795273756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LIozortPxX9/yGgYF5RVAdU5h+CP6K/5KZOyPsSClnQ=;
        b=MTxAbvpnIYPmEZ4Mdulshbsm+QIXTXVodvW64DlEQBd1JjmYzHVwMK0v8KA981yYQy
         hY5Z2J8ukiuvWIoHY4R5xoLqH1kW7hHxthuF8irk6e/Y5aI0YEAZiFRKRc9+pkkU/YsK
         pOhgxqiOcNtBeJdbNXnMS/R8ApeQg7z/nIaC3uWAR0c7y0gzMzI3fiCSnJFTOK7oeGSO
         0z/rrjlHs6OhYPAF9n76a5BY4EkPUZVkH1Ni6XIaPh4hI7mSxFuJD5I8xI2x9d2Mukxv
         0JisZlDnD2VJiytpSWe6UN1NjqJW3OzFOAe/ROL8h+hmr2g8xXO+4WpkgBtbRQ5Wm2dm
         AcoQ==
X-Forwarded-Encrypted: i=1; AL+hErF+fLhFteXxbfUcnwIuK/5K+Jlx0r2Z+WF9RrGpj9k08AtQzMETctZYR3DzHbmPXUewI3G2wgLxJPrCQgw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mYcBHIQlZdKiG2dSlsUfPQaED7D2ZPXXFnsZwGGtO98NIjK5W
	njnLjTg6QonL0qHeDLcLGqcSAEvsbUxRTmxtUrqLmH6akDTlUnvCEyeI
X-Gm-Gg: AYBFou363rQFTW17sC0xmMwr3ywnE7MmmjI9iiLoCJ4FiZ7b9SseUa9/zGa2IHzDQf7
	NKUGVXJ/EznODho6qTW4BWEwb4IkxmlJvM4utY7NxKEeGb4LwVVm2tkqpJZQK9R2JN6EALVF18t
	DTVjxfwW0aCJfLK5hisLSclhtfA/cJslYTNDbY2UejwXnNysOqqVjwxBOiUPpUPWCr3VYTgV8GM
	f51psXBCGg3nyl1mTm+Uv4/5U1NAy0Mfo8Zo9MarKLqs0WwnhQMQ/0ufWkKA+S6sxFQP97V2po/
	wf0JyGHaJqxjbX1J2wEj5qNig3hf7SIz7mDiZ/S1YrnS64XtTkkdWuZF3Jv+w4HQhWdJxNJNf+D
	/ujKPAOIg25B2ycr+SqscYKYpdF6AopqDF9jKQu32J32r/JgnF52EHBnhUTs5xOGm/dQ8wzgqSS
	W6n0eE4Hf6txLjdHc+V0/5NVkbHmC9BGTsicKSwbioiVDS+QyIozEofhRY7j2pRi7OC6AGNxAeC
	nf6RsYfzUDG8JNyYHOWfPbbsvTpq37TDZ5uiw8KdIe5IuvIXmP89zWlSgU3HEKe0XYCeDxnFxpm
	uzRQmDykLVGqhL/7W7AmeEiDwA==
X-Received: by 2002:a05:7300:cc9c:b0:371:5cb0:4929 with SMTP id 5a478bee46e88-37967dd4c20mr5561636eec.25.1794668955716;
        Sat, 14 Nov 2026 07:09:15 -0800 (PST)
Received: from arch.localdomain ([2409:8a2b:a08:f11::1003])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm30427886eec.21.2026.11.14.07.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:09:15 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: luca.ceresoli@bootlin.com
Cc: Laurent.pinchart@ideasonboard.com,
	airlied@gmail.com,
	andrzej.hajda@intel.com,
	damon.ding@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	jerrysteve1101@gmail.com,
	jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v3] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Sat, 14 Nov 2026 23:09:07 +0800
Message-ID: <20261114150907.305160-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <DMU749TMB523.3OCGPYVI4NZDU@bootlin.com>
References: <DMU749TMB523.3OCGPYVI4NZDU@bootlin.com>
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

Hi Luca,

> Hello,
> 
> On Fri Nov 13, 2026 at 2:12 PM CET, Jun Yan wrote:
> > Hi Damon,
> >
> >> You are right, this is really a valid concern.
> >>
> >> If CONFIG_GENERIC_PHY is disabled, the old code could still proceed and
> >> keep the driver probing, while the new version would return an error
> >> directly.
> >
> > -ENOSYS can only come from the !CONFIG_GENERIC_PHY stubs in
> > include/linux/phy/phy.h; the real implementation in drivers/phy/phy-core.=
> c
> > never returns it. And the stub for the optional variant returns NULL, not
> > -ENOSYS:
> >
> >     static inline struct phy *devm_phy_optional_get(struct device *dev,
> >                                                     const char *string)
> >     {
> >             return NULL;
> >     }
> >
> > So with CONFIG_GENERIC_PHY disabled the PHY is still treated as absent
> > (NULL), exactly as the old -ENOSYS branch did. With CONFIG_GENERIC_PHY
> > enabled, -ENOSYS cannot occur, devm_phy_optional_get() turns -ENODEV into
> > NULL, and any other error is still propagated - same as the open-coded
> > check.
> >
> >> It should be better to keep the -ENOSYS handling to preserve the
> >> original behavior.
> >
> > Overall the behaviour is unchanged in both configurations, so no separate
> > handling is needed.
> 
> Thanks for the analysis! Cna you send a v4 with that explained in the
> commit message, possibly in a more concise way, maybe with bullets for the
> various CONFIG_GENERIC_PHY on/off cases or so, for readability?
> 

Yes, I'll send a v4.

> Reading it now, this v3 commit message kind of said the same things. but it
> misled both me and Damon, so it's worth a clear explanation.
> 
> Thanks!
> 
> Luca

Thanks,
Jun

