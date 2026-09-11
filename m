Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C971A682F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789085955; cv=pass; b=O54liw0u3WIMG0igKaLqOITitQsPR5WIHer6nnmwT1zj6/KxZuMFrH0QKv1PzMsNA8JrSS/KtjPT3dEWrJl7jmsa9uhYBvS9rRlJ138bNUC4/kRK+kiPLgr3DZhi/szEtIu+r/QqxPezmjJ4tPbCX2H1MQ/h1ag8Ifj4ueJzZoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789085955; c=relaxed/simple;
	bh=6AJasxW3GodlVjAlTMJ767WLjIvMw4WJZ6v8qOvBjjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dmHcit2URBFBDRX3+xhrYHxT9ZigQwnlF88wsabArNaMy5fF3h7LQUM98HiSlPSiDJCOTmtYyk2hEsHaJjn2tg1J/aMCoqPraLewJ429cozWUtdj8UEURlh/BNYhliVZb1CZvTvDyIE6ZEzJk8+7Xn75hO7PiWbUKV+ZupiPvr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZ2NlLtx; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZ2NlLtx"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66fa10f35caso392861d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:19:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789085953; cv=none;
        d=google.com; s=arc-20260327;
        b=m58Xf31UHChIxrsqqE65wO7Yrzyrgga5YD1m39Aw5iN9Hl7gpOG1GScZiZN+uyBS21
         dMLOb/go5LD4MTqkgLZu3Wtw9OLstTf+1N3KC2YvCmL9aYEe0SjPV9XGkR4F38BvOwNS
         JlR3ULz2YXeSfYFyv2ERirLy3vuV2LnsSotsWdshf/cbWXZ5rUhU5uWeuWWWdMLJR5D/
         SoK2ynC52eFep+WUsAtKA40tvnkyuOsSjPUPD7/XgVr7P4J9Z9vX0t+lGI0/CWOZs4+q
         wTosQ7eQnWmyp94ryY0eAx64IiMmGYoeplP2K0CMlri74W5ZN7UxmsJZE2KxR5q0/kT3
         AV9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6AJasxW3GodlVjAlTMJ767WLjIvMw4WJZ6v8qOvBjjg=;
        fh=aKMfjLb9mUSQgqfEY3gzbzpMSbDakfbFKRyj/HPpSgA=;
        b=VSeMF5aX1/L//xNY16QDIkL3mGgp1fAbCYyYrQym5HChJFE/b6Qk01OPgrRKCWhpiM
         8x4oECdf/Ine0abVXv41UGxsUA3Urm48eG/mg3zAmTwWHdotM2/3s7LarfQ0xQFIo1D2
         BJgr8whe+kn/XlO96knNoMlseYiHCMfGB8xOrSdKKcOpAH4aIdt3R0dNLa24yCEuKG1b
         dzIt0sdYu6Ly2vLlKeWespIpsZtKwF+c6BLlqL5p/kXmo1AUpeqVpAL+DUxxuffTm44p
         dKBsnFS2vfpyaIcMc/ykAkQ1RdVQhc9Ew+QQPIKbHuKn65+B4dhG9jlwi2NYPtkFCTti
         /7EA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789085953; x=1789690753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6AJasxW3GodlVjAlTMJ767WLjIvMw4WJZ6v8qOvBjjg=;
        b=FZ2NlLtx3yYAJ1gpoVntdEQwbvgpa5FuCKDb9oX54SyiDshTu/vA6s8mZHeGAtFXR3
         C3UPJUHTOm0SdB4rlTBDRD7bSnDOgehwE4jxkMjWOK75014wDdY40vrXaeFvW0FC21dg
         OaihUEgNhGcXnYv1+0BpRNGcecAjx2q7xHpoxUKmQS7fKENHUoJDxR6JB3Hnxi+skasP
         5jqqqlWDy9CDkPIqO3r2ZflpeKsPcdmxVxe4eyjlZFYo0qa0iv0ABBT419Hb9WDIH+e6
         rB3JfciTh35gMpjCs7Izn/AC9wpNP1TP9ukBCJ6ueag/9EgAtoo1mC0UAVbbBFCI0QSH
         gIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789085953; x=1789690753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6AJasxW3GodlVjAlTMJ767WLjIvMw4WJZ6v8qOvBjjg=;
        b=mbdBWpM0xmHPZErfc5ekr9mNOqzh/Q9vaTRbq+855+Lrolx8vRZwpC1/KFVoXToJxU
         Dv4akx8lBxYAdc678QLFvIL98d7MomsZl91XEytU76rHz+KsaSknPxJM/mIY13W+N6Nl
         nhQkCaIQt7/jqnSRCoFhEjI4fPjXNFNqLu5elJfPuoziOGgo5bv1dLOd/L9RGhRwE9x6
         skPNWwaYbp9oGBdG7+tdWeL5PuHICHzcOAo1OkseHtJ1diqHl2+4f/ixD/wkguPs9/+K
         QF1KyJoRqR1jjtFLzlvabseGEOk4G4C3f9qexC4aAZOzJXq3kz7q+9OtD+HHp6H/3Ik1
         kb+w==
X-Forwarded-Encrypted: i=1; AKwUvBxdd4zR/kBNb2saWwl1/CFxsMyiJggFS/97hu1ZUVypyBdFidkI1JgvtAEEK1IcpAA/nZ29yDfw4VA9Rnw=@vger.kernel.org
X-Gm-Message-State: AFuF++mbxJWiCjO9U62CXv5gG0Eqa2aHEPfooUMHz7P0XZsq193hCVbs
	86DqCmd2B3klj/fheNUXqwPbOtyKCx1654rOGymL1XoXscFNVqmtM+W1AeHohY5l9E9pAYHMtGA
	zAw40D0opBLHrXBIBGsyE5NUZZ/SvCl0=
X-Gm-Gg: AYBFou1LsQT1nGmP75f57q9xETCmBam8DAs3VTMmmuJp51+PgGB+WGAUN0tyEG6UQTZ
	h2uNgD5v0I1SSlov2KB3g7PMk3lblLEYjCYdEqU+zjEx9NY1qmf6upxSZ7CN4+mC28qhU6uPXDk
	gO45H4LMaMOv0ufTadWG3lvK29JsS2hSQA4REKgueD9MsL0A+B0K8EOg8JIr7fPHV96lNtfPbiP
	35AmI9y3X0/+9A/plXhU2eWCWWdPUIT/obMc1al6GXe9qVVe/MFTQbBVAMJ9DBJh9Vz7ymxyH5V
	VM1CQZmqLKvw0L6jm7b+Bvr18o4kC/xhQyzAKQk2YkNq8O/b03apslw5g19xb9SsvdTwLiwX7MG
	2fqANK2xxmIE=
X-Received: by 2002:a53:c787:0:b0:66f:c1bc:4031 with SMTP id
 956f58d0204a3-67124725896mr622106d50.94.1789085953300; Thu, 10 Sep 2026
 17:19:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910185030.870-1-frazinjonathan@gmail.com>
 <20260910185030.870-3-frazinjonathan@gmail.com> <20260910190542.BE6AE1F000FF@smtp.kernel.org>
In-Reply-To: <20260910190542.BE6AE1F000FF@smtp.kernel.org>
From: Jonathan Frazin <frazinjonathan@gmail.com>
Date: Thu, 10 Sep 2026 19:19:02 -0500
X-Gm-Features: AcwNN1Xw_ZV3zJF9oPd7-FCfkmdUBDHBhWTNPa2DLIGGrFtpH901py50U9hSvEQ
Message-ID: <CANW_FuNBVteTL52+iEnM3pUerrVnRRLES2SbrDt1FUtLgPi3Jw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/tiny: allow a framebuffer larger than the
 panel on MIPI DBI drivers
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Alex Lanzano <lanzano.alex@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 2:05=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> Since tx_buf was strictly allocated during drm_mipi_dbi_dev_init() to hol=
d
> exactly the panel size, copying based on this inflated width and height w=
ill
> overflow tx_buf on the heap.

Confirmed. On a fractional plane SRC_X/SRC_Y the damage iterator rounds
the merged rect out by up to a pixel per axis, so it can exceed the
panel and overflow the mode-sized tx_buf. v2 will clamp the rect back to
the panel in mipi_dbi_fb_dirty().
