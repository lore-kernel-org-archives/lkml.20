Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793054476;
	b=RAfPL++F1nRV/hvxigXVht8kxa5Gm2A5gPB6A5Vtd53Z5PCKtkX4tqXGfbfbECqZap1s
	 vcOQKKj71grWW4mCoaUgle8zpNlNzgEDvtajeg+HICR7EAyLbgO/pNaDtjMWO3/1IFdLZ
	 tlk2c0jTvst4/IWCZeAA9g1tB92No9qekxj0vgzOMt2ZFNKMDWgQe3XJbrkwDclJ6Qazy
	 w+LTUk4WmnFGayg/GSvQGsXoyV+9+6pGuD69xZ8SQqVmzKqzwfhuxu5S9GJNSq5xdoEOy
	 xpVJh4jSgesMiOYdPyWMB313/kN7x7gM0RKHR5Xxod/B4go4A3SOFTJ6EbreHH6mElQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=1IjnlN6+aaXZFs4fDwukWvb2fFrAKDEe8srxsq1Mvqs=;
	b=rYt6xJQfYLRYl0nsjz6WBeLINynSmvJiLDDkdArj4hqHWZmhWyJA8yv7DzHcLuKEtvyT
	 Ouv18YSXlW8bhi0R6p/qkbls82AboyJXKzGz6yyfR7hBjlzXcyVoJew0EAUqEA72rJHcl
	 j8UF+vn60WmeA+B5IZFy67L0ArHmg0qF2E1t/yPnHuiv8SKBD7l4zGBHb7gzHxvZjMxZq
	 VV9yJv8DPCSJGmxi6vVz9fMPhFH1rBzMwbBAetr5mb0dqJa96Eny/jjaVnvO7O1dPQJqv
	 hgs77DG3E5fsutqHSLjrow3hCZ7Szil1uZADwsHK62YZX9Vz89Bqp6RPvLuoAjojquQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JGEKyRbU;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D71606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9D71606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JGEKyRbU
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1307911f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793054469; x=1793659269; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1IjnlN6+aaXZFs4fDwukWvb2fFrAKDEe8srxsq1Mvqs=;
        b=JGEKyRbUfXlf51DJqC8HLYHxhilfpXgjcSvCkyAe6YcIJ5226WpfsW8Xs1J4IpaZ8J
         LnA2BK2BS321CDeOOQiAS1IFTjY3HCP+sTlkJteaPUbhBmNiImDr0h3Ow9te1cvWpnGA
         0mjFKtsNC/Ixx3Am/TFmbTJhEWs1LTr20IStjnkhIE62KLeO9C+OcxM/Z6DKm3gggg83
         5B/V85A3gJf/CobAq/WINQo2p741a5/bzFYyZ/q3xb3T8N76LTncmC/+gbBBalbr5l0o
         KI8/gX1LFWPAt5Ru9H2jwd6B27CPW+XN5GkMCaQxRd9FR6vQ/jaWd2tD/y8cjxPzBq6Y
         E9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793054469; x=1793659269;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1IjnlN6+aaXZFs4fDwukWvb2fFrAKDEe8srxsq1Mvqs=;
        b=fTRLjOUCfyJUYtnA1CH6m6G75wIClcrzChcug3fwMNzEJF+x2ID660SDLfYO+h8w/R
         r64IzltqIbO4YL22kAV278paAKJq217DNSVJBX5724eCk/OK5P0LOGjUxOpRnIf9n+72
         RLHv8dn8CT28CPN0RpxHby1U4heC39E0gXxVR/hbcoSN29Gw9uBc3WCcMG5xmHTBzs8Q
         v16ZUQaXZOD8Wts7D+nZlgric5NCIVXd5bfw6CGmhYgodT19Q9yOsE0SN0dKDxTurtjf
         P3nKMrXmw8cyDCw486d3jGl8bQUlzBOmdYwIKQA/PK0H9WaDH9IGGeqzReC/fW4tEJ00
         tDHg==
X-Forwarded-Encrypted: i=1; AKwUvBzf4zfFJT50hWAP7OCaKYue6yRTBCYwf5HFuwui3rkOi3akN9m9AvRel2AUm2Sbg5b3xXX+MewGuY4jeFY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXV83Eitjaaol/4mSejAYZrDr9ia7izJ1CxlS4ez2585MgPBYD
	EcWCQ7x7YUs7YpO8IzYah64dCBs8rIThC/+LAvidRjk0MdWlvjpeXix9
X-Gm-Gg: AYBFou1L97yXjldANnnGtxsUDOljmKaMOdxyPwJvHkqCsLX9GzVdGIxqN+AlwR2VxX8
	QsZCjZ5j13tAs61IYTrdVRe57hmYlSzqwf3Zo6o2Pw68VfOgTpc89PpEoJ0LPJqWLgv5FBZbQJq
	SFgitUteXNRlCjy3qjFD2nhe8aRdhhX1V6/u8tw3ZK642xrAkzu5sif6SY+dptaHqnQ+MaHTswu
	a1PTMsMxuCAbd0fLl/CwS6XOeG9TvKQMlap6cac8BYJvV81sEg2Pot8XiaU89d0WR4u4jO022+9
	ULOeoHqOUVYag9WQe/rYHCRsdi5hugUAmAGSPi9+tq1efDj8MmEwfRLRrGRgqCSTAd0+AgFNOgc
	gHY2TSfyxyrYzPVej6jhtaSkLG2GwA4Wl429cXBQ4YkjhLX0p2ZN6fa5Z5WMzJVkXoxpxlPvvRA
	BXCzwJoDHDTURZdL1esJP7Nmgn1U/TSfyi26vc0V5QSOwYi5ur6GIY+cHpQs30sZhy4tvC7g8eb
	t+m2LA//hH0S0b5VaDqSUW9ruenVOp0fI2ikTvWS3Z9phAuSsyTYeEvVAQ73LHMQfCc34P5t5J1
	q7FlM5SbzhDuIUQ=
X-Received: by 2002:a05:6000:1a8b:b0:48e:3085:425f with SMTP id ffacd0b85a97d-48e3eb265camr18739691f8f.2.1793054469211;
        Mon, 26 Oct 2026 15:41:09 -0700 (PDT)
Received: from [192.168.1.253] (4E5C1F56.dsl.pool.telekom.hu. [78.92.31.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dd7sm18468284f8f.15.2026.10.26.15.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:41:08 -0700 (PDT)
Message-ID: <0c7e45a13fb78064390818bb501e754b62f16f6e.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/radeon: process the VCE interrupt on SI and
 Trinity
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matheus
 Tagliari <mptagliari@gmail.com>, Alex Deucher <alexander.deucher@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 26 Oct 2026 23:41:07 +0100
In-Reply-To: <88c61950-125e-4109-955e-ce09ebaab7af@amd.com>
References: <20261022114754.865669-1-mptagliari@gmail.com>
	 <20261022114754.865669-2-mptagliari@gmail.com>
	 <88c61950-125e-4109-955e-ce09ebaab7af@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-10-26 at 09:22 +0100, Christian K=C3=B6nig wrote:
> On 10/22/26 13:47, Matheus Tagliari wrote:
> > radeon_vce_fence_emit() ends every VCE fence with VCE_CMD_TRAP,
> > which
> > raises the VCE trap interrupt (IH src_id 167).=C2=A0 cik_irq_process()
> > handles it by calling radeon_fence_process() for the matching VCE
> > ring,
> > but si_irq_process() and evergreen_irq_process(), which serve the
> > other
> > ASICs with VCE1 (SI and Trinity/Richland), have no case for it.
> >=20
> > Add the same handling.=C2=A0 The trap interrupt is not enabled on these
> > ASICs yet, so this does not change behaviour on its own; the next
> > patch
> > enables it.
> >=20
> > The SI part was tested together with the next patch.=C2=A0 The Trinity
> > part
> > mirrors the CIK and SI code and has not been tested on
> > Trinity/Richland
> > hardware.
> >=20
> > Fixes: a918efab631a ("drm/radeon: add VCE 1.0 support v4")
> > Cc: stable@vger.kernel.org
>=20
> Please drop that, we really don't want this to be backported.

Hi Christian & Matheus,

Why wouldn't want this patch to be backported?

AFAIU the main case for this patch set is to fix VCE1 for people who
are still stuck on the old radeon KMD on old distros that ship an LTS
kernel version.

Timur
