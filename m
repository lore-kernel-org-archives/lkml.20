Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC8F3B27E2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790720499; cv=pass; b=Z0QutbcuHMmoeQVr3BiZk9k2l/jS6v/o/2lU7b5Yto7sABboMw4epAE45K/jBX1PcPopIQ14BQKnZQneShdt3+yM1uNK+LXxV3TB75jnEPKMDE2KcnvpP1NZLMtghfopHPHuy1QtsYmoB+0Kexsnhwfw8ITogBjg00xgDfXUbcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790720499; c=relaxed/simple;
	bh=2h/b/s1hyf+hYHDXMhDwTwcRRjLZP5znf0gW0N5R0m0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=paVxIbQztEoWi0tv/AKNPDYA5OgWpkCXfhUBkudGjqe/y7CzZIJXyYErfUdqLTGZJrBi8RDjGD6MowlN1Vt1JXJ+3X0nzfQVI1m7InfIF25zU/8dPZPpo+155C6SPrtoCZ923Lk3gvjTja+RwBYoNo+6aoFMk1i90iTzE0CqDrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJkhQc/O; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJkhQc/O"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9105d241693so40108416d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:21:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790720497; cv=none;
        d=google.com; s=arc-20260327;
        b=safbFH0vAdzpHkMF+PQp322QDu32qSULMDDS0MYU702yq4auwSZ3uaVTDU0sZ4sKj4
         6uTshNVUAqD7BxXSKDYPWD8Hf1dvBykmMd0m/diPof5Jaa2KzIJ/uOTK+phoJVgrW4e9
         MTGr3TZdmdmZYuIeZQnneYIweS61/SvvO7DdJ/YVblWd4FPX4UB7bRlWiQ3dsAVhFPYh
         ED7YFlKRB5PnbAtrX3XreOzPslBAwTqzFUY0tygQoIAcG5+Q1r7lwCUHnp4+0lUe8Nvj
         3mVNssZxELce/cP4AA6vhnKDZ6bMDDmein8Wmx4aaK35Mo6Ge7PwWFSq/oeTyURi49Zv
         /L2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2h/b/s1hyf+hYHDXMhDwTwcRRjLZP5znf0gW0N5R0m0=;
        fh=RAN2qKLwQdzaz4ymbdUPfixDOHZ7VR4j6TTybt1XRlc=;
        b=LfY5NZF1lb2VPDIK1ypTm3HgJjOv8mt9Iono9Uq/0cEykm5KuVLsyfPhQrEjGjOn4q
         8dn5/oLv1km3UjLwmHQnpyOfY2y6CbgSa0PdoIIXBkauGqNa9CAwcnUYNzVqifiJ3NYJ
         BWZifdBfY21qyjBZoCG6fTVnJX14ZF71yXFJKfVWhBliATkYeu98Ttml+qHfeIztLUJa
         CjxK68I4KZ+LrZSXZmybBCD7QhPFxv+SytlfWM9d5qziCAmH06kyPNFBjK6AsdyIDScO
         5D4NBOhwRAVEcbqXFOiaJG/c7sWUQR/Y9oM/mpHSuanKGzhIjGZb670a9N+RkIyLDmVA
         k0Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790720497; x=1791325297; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2h/b/s1hyf+hYHDXMhDwTwcRRjLZP5znf0gW0N5R0m0=;
        b=oJkhQc/Om67h5v4ohWci4TOlquG1ejIh3wJ7FE3gZ+0xdTETeBvdxNy0EU38W02kPF
         /re8DHGex4k9HPDIb5HEPVEsVWwzS9gKu9Xm5tglYteKP0MAsHT1z5bHhYKwzVwMrAAY
         p52zZ/eMU+rNVB40iSq/fRszhqVQQtzFvhElqpgUUw+ULFBggJakO3zkCrJzYNgJv+FE
         RQWsOH27CjpJoN71w4MFBmA8BH0tASDcamNvome8uZk2mOA3bhUBIAuZZLKcc8Z1F46G
         XDSJtZcoubqmupNEPpLJnQNxO6YSBTsabfpd7NS3SntEGbOt6LCcRpPHe7UBYZ6XMgI0
         e+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790720497; x=1791325297;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2h/b/s1hyf+hYHDXMhDwTwcRRjLZP5znf0gW0N5R0m0=;
        b=QkDyvsjnhC4jAyF0k6ZPeuOFxgR5txNb5j41oahFZl/9LS4BjSFfcPVC5MyDSqvC/1
         e92RfuFg1C17y42AZI4AqKy1KE9PS5HL6IfSly2nHSWdsOTBLimva//MvFkw2W08lFBP
         hndB5+oirhxvJ39Syobtne9e63X/1FPyJmhLL/8xcmGqtCnB3fXphPM5GBK7Evbrllv7
         maXY6UlR6uMmTVKjdulzUyWN81SgLY6+YWcxZQpJg/f9Hlf9SIqwXk9nYnvvuUj/jEFe
         4F7TF8fiiEPJ3y4CIUcSkSHy2nJUswl/1TmCthJmnY9jqNdWrMV+v0h6cvQ2uM8GzBQ/
         HdJw==
X-Forwarded-Encrypted: i=1; AKwUvBwP7k6mhzmUfLVwAibZCa1+muBjfcrf2XM2pEZvW2qsf5r9B06ZKbV4BZosATZ0xBdYxSJM4Qf/U3gJkEk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwtap2VFNlB3jwWPomwDUakfSqjggK32srPVW75Y+f/YJZbzKw
	XjN9yBRi0Lz0CsDYDao0a31R9cJqBvB7RGwi3acOS2VHaIKreiypIBZjX6J1Ld2vv0JvugLdis8
	a7Fk1edMeLnJOY42x+PzyBpfu47eNQOE=
X-Gm-Gg: AYBFou0k+GNzOaCqcVgPZYffxcRn65Fw6rNL8HgM5Zj4AiMXOSosIrcP5pGdGCOOqJW
	b/Pb7AaO8hSefbZnHMfysWJDeIS86ABxcwBAfM4DfqdAulSV31BqcxgIogQoRFgGu0FZ1zP6WLs
	/+KN9vFMjFNsLfadi1XYcrlhCcA6+dgCYJAnAvfK/AK3C/ClnDL+xa0j+wCg5pueLsX/OeT10br
	DTw+ZHjZlbacHhOIayWDTOOzRpS6BpUJd0+VUxjkAyP9f78bf6IZUYCydbRXg0PQANPLUi+MSjx
	3e+isX+7frM0sMgVg5YZhrqjRfBjjA8qt/r/+PHCH8XO5U12Tg1wo3M=
X-Received: by 2002:a05:6214:3202:b0:914:4bd3:d984 with SMTP id
 6a1803df08f44-91799b4bd9fmr11450236d6.34.1790720497177; Tue, 29 Sep 2026
 15:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
 <20260921-vrr-limiter-uapi-v1-13-2fcd7d011646@collabora.com> <1b722d71-93d2-93a4-acdd-bc02b9a36f95@nvidia.com>
In-Reply-To: <1b722d71-93d2-93a4-acdd-bc02b9a36f95@nvidia.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Tue, 29 Sep 2026 18:21:25 -0400
X-Gm-Features: AclHuK-WotblnMwdXvS53G0qNfl2c2x7OSON_0NQQ-TSXMtSHUSKVbt3lVkA9wE
Message-ID: <CAFZQkGyvxO7Dty4XXJ89FfTTeD5YfirX=16tMW2Mzds7A2_bpQ@mail.gmail.com>
Subject: Re: [PATCH RFC 13/25] drm: Add VRR target frame rate properties
To: Vidith Madhu <vmadhu@nvidia.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	"Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, Leo Li <sunpeng.li@amd.com>, 
	Daniel Stone <daniels@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Helge Deller <deller@gmx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	Derek Foreman <derek.foreman@collabora.com>, wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026, 15:18 Vidith Madhu, <vmadhu@nvidia.com> wrote:
> My understanding is that flicker may also happen if the refresh rate
> fluctuates significantly within the sinks' range, although I don't know
> how common this is in practice. I would imagine these frame range limits
> would also be useful there to "dampen" the fluctuation.
Judging by our user complaints, it seems to be very common, and I've
been waiting for this API to do exactly that in KWin.

> In any case, if we expect userspace to use the frame range limits for the
> purpose of flicker avoidance, it may make sense to expose a read-only
> connector property for whether the display is susceptible to such
> flickering. For example, NVIDIA G-SYNC monitors are resilient to this and
> it would hinder the user experience to unnecessarily impose such a limit.
Sounds good to me. I think such flicker compensation would need to be
configurable by the end user, but having good defaults (and being able
to simplify display configuration if the driver gives good guarantees)
would be great.

- Xaver
