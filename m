Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601677;
	b=NeCbZIDhmkJl5ZjgDUY0K58E1nXalu/iFUZAxurtsoXRDE1iIiWcp1OHGkfHNXQYMAYs
	 tWzZsNOW3lgz9ng9bNZ5/L0zq0AVssGDBnNfgtCoNEtyKsNjbQ2WXCbtT4ymIToO6BuXP
	 uiiq7mYDB5thznwQKkd/N83IcDNhPHhnMnAgErebjFYlhgyrYZw/9NAoKkxaEddRmtxnC
	 gXcWIJ3wgSjpY7R/vP4kdtpmXVqd4AOgfuArKpyFXlXVDtTVCsPVD8vkGwTDbJp6qRDus
	 CH+/GafPOpLXKYGEiBuxHkVWquEIU802MvB749F6gu2o2w87HrHGczPCxLwwKrwCL/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=u9SnaLU47gOx8//3HxIsRgGkAd4PUM4g3QaiLuxcEWU=;
	b=EmO/XZZLnkv4lzq5wiso+iMPzDNddzOAUE0Go8QDmfj3X1gZ7A60mf7/B+Wo0qBuZnk9
	 +ou7JCpDxydOtzxkdUx1y3u5+mgSMdf5TQHab3Ky5+MY8KJ0QpteFmiU3T/xfWDIbUbIB
	 EDgBeTaQz8B80byU8oiP3P4BewqHUByGSGTs4PMMhw3Tzhgyz/dD+orf5sXcP8D5PoDV5
	 uEkt4NTdQZfbRMEBcHW1zcbmNOlqb0FWqk0mkfWYQDsBDpLRDgQddRtpGZQXahEECstmA
	 frl7XRvvl5W6q45VjjZXlzvwaNg0ekRRaVId8mzCpb/svSI9MwRyu+nXWK8EpBwIqhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fr2Am9ts;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809EE606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 809EE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fr2Am9ts
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab43d1dbceso2769371fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:27:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794601676; cv=none;
        d=google.com; s=arc-20260327;
        b=e+cpUgoYcwKA88hbL449uMEPjLJeeoKE3YmbMXBTu0okIIvGpvnVSUNCAWxKrBpDNZ
         J3vCQZy5zVWDvG2vg92hBGHejUq7F/Ke4PqeGoDJCbXRyKt4asEq/xqfazFmAu+RnqaY
         5jml81I2AvKV+5OqYyxvYNebVJe7Ujknv0LhQBwTjUB8qLdRTqmzU/xfA7egikRscKxj
         SNAcvf/C1QufQdHCZ+pPB7zFqBoMZIfmR3fdyzh9JUJPrUgrsaXo9YaReX8o15Kh8DPG
         1+Btjm6+DJszD/NEzbbrsMkFn0ONp7TV1ONWmqbPxAX9RZ7Z5MAMfSjOwAslgU8kL8xg
         OvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u9SnaLU47gOx8//3HxIsRgGkAd4PUM4g3QaiLuxcEWU=;
        fh=KkZsV/rqpPHoRPNWuxT4J9LNsmHmiP3ZyW+hcRKkl1w=;
        b=aaWMttDNHNVXRJnz/qBm87hTVRhuaTux5ClWKaoXkebrZuJbZ8I+oW6fuDyNaNyHxL
         tlYukcnmp8OY7Gxy6bH0kHU9aA3KwerZVWsDCAqwaxGZOmtPQAvYoAxZOrTneKG1y6iD
         W7JFLbwVP+9F4KyT86Rg+gdobqsbYo1i6gVXHGkR1qly63w/2izKTmUBuWi3onKvUGQk
         2uxGAwCCa2fXmq9rAxZ+X0SWzl0/sV0hH4Y7J4JpW17SP+PJbwBfnMgY/u3w/ouQb/EC
         dWUWxIII74YLrdt8zMI730+BFUltT5hkc89kIJ3/w2YWw7Y6biFsZglb1Ueo2rNYhv+p
         tdJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601676; x=1795206476; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u9SnaLU47gOx8//3HxIsRgGkAd4PUM4g3QaiLuxcEWU=;
        b=Fr2Am9ts2s3fh+ah0cjObpSrBTM5Tu3pVH5wb74It+UMtO7WaQQvuaBPi31YjWSNFf
         nxlWmcXVMsYxx1hZKx/PLcPfl7tJ8YzyyeVoSqkP5S8CzgCYIB6twR4vKibvgFbaVy5T
         VjJ5TbxTWzDQq0+EKNwpv5X1DwLuhj1ugBEYypLFbt6TswF4WxxNG2zUyLlzWL/2olpm
         KFHChORISvttf+8QyluEqYWZCP6eNj0m5kXBiZJCtG8xOJ8YPEdGDv7RUCKRWpA8TyPo
         zvUL9BgbJp5er8tfOR6y6OoWdWLHautbkhISMObSez2vgWkqbWQsB8BN3HUaHHDt2sYX
         PtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601676; x=1795206476;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u9SnaLU47gOx8//3HxIsRgGkAd4PUM4g3QaiLuxcEWU=;
        b=Tsf6CFEec/xy8dW9ETmwPLIsbuc1PadzMbgsAwTMGWlvLBH3PvKkqxJ5kVhjh+MHqe
         SJUt+sJubE8cp1WIzN466uw3iFqA3CjRqrW0KI1KbDD1k0DzNNUJrC1sRStxM7Ax9hV8
         0ApN8g+lq46VgvbXLkpeQI/TlHVG1aoOQaqyG21YUkytICzjTCAAqlzWndM/p/VWln6t
         lea1AKQ8eUUySX3FjHgsWDKPNNeFQonqXwrJFro2G25VQxs5Hy/tMq58kbyJHn5VnDzs
         9qVLJ2MxKJ8z4XUouD3FK7uyfEmQZKyb7kETbxIem7Ry4BPL18HDDloujRZ7D1PDqHNt
         WIXw==
X-Forwarded-Encrypted: i=1; AL+hErFycBwf5AJHLgaSMvlMljZyXGdLQuhICZ53mUPJQRnpO1DnIs8zQMfKUjRvCSt9ByIywilqgHDxdeUrfYk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lKZzLzgjijuHpFMrwGzU8KlH3qH6Hgq1hAE266Zrc4tcToyna
	VQ3iS+aMiRzvDIMyl9XIaZYPxa5yiAQR71bCu++dVN+gaj75Rg25hfXqNi3mvHA+SppLgG1SUnF
	mNhwsB+nFbbslYkvR/3OSx7pTiE12uEg=
X-Gm-Gg: AYBFou3mjFs75T+LqMZk0eb02O3wH2lRNHq5dGIjZeu8uFyhMDuTXJDLhpfRCjguK4b
	HP4DKDoZDa1UE+kip8ODStkJ7qmUQyosgLiX5qvkswCBXN+t70sbcNioGKVGJLbIGG1k0TeBhOy
	3DovhT046B9+aRx7I0UT8t9JEeFj1Pjbg6qKQKPRJKl/U0DE7dsun6+LiiTf2VLo3sNgxoM5Lnw
	T0iULdvY914HojC/dUmgmEWi/4BnbBQnSjwJjbIYiNXG5IeXDXUiLacL1j1X5jRFkti3L3W3Lwj
	+KoxjsNRlUmMBPnJ2f4Z4eKPK+X8Pfi+GPj1FkbKYq0ZjO6waENOZS1BK7kXX2xEnaC1wTHDqli
	Lk5m0VCruSdchlxkBijjUAhT353G2wVZhPbGZlsx10U0XMTfk0gjIXxsLEYWZuzAhef9w7B1VcW
	z5961I+qUNgT5+NJgx
X-Received: by 2002:a05:6512:3da4:b0:5bf:ce1f:cd22 with SMTP id
 2adb3069b0e04-5c170434e66mr1688237e87.0.1794601675592; Fri, 13 Nov 2026
 12:27:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-drm-bridge-busfmt-einval-v2-1-fbb74905614b@gmail.com>
In-Reply-To: <20261111-drm-bridge-busfmt-einval-v2-1-fbb74905614b@gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 12:27:43 -0800
X-Gm-Features: AclHuK-HRQcdwr6yLC1DR59Fmq97vDFRT8A5nCzrrMnThAnV_neCVaC02KwMrAY
Message-ID: <CAEy9hNXoPbWzx=EiOXJwiiY=XJF56g1MfM86cgp96einDbONmw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: Fail an unsatisfiable bus format
 negotiation with -EINVAL
To: aiyengar1990@gmail.com
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"

A correction to the commit message: the DW DP example cannot happen on
mainline. No DisplayPort bridge connector has the "color format"
property, so "userspace now hits this routinely" is wrong; I hit it
with a dw-dp change that is not posted.

On mainline, -ENOTSUPP still reaches userspace from a chain with no
common bus format, as in drm_test_bridge_rgb_yuv_no_path(). The code is
unchanged; I can send a v3 with the message corrected.

Arun
