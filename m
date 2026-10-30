Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793359304;
	b=WsZWc9W2YDM6xk/aimfRAXwGYt0qAlSvR98rk5hfzr3KRluBFPbFdRsyINbmGedamhn5
	 FfCzLZvv8zDzjfkGxI0MrHAdhUsKUsNbbODXmvuzUbXZsrdzOv5J24WZCFUsLmUGlnKSB
	 jE4bVhlnbxSJ8kvrMJI0ZDpGj9SLUJtkt9Ns3yEsrIUjUAUTQlDpUW7+Yn06DTKLBoKB3
	 yerhkch/Toe/AyD3H0On8Nazgcba4hsMkWQtPFRH+5Illn4Io1VqO+iuH8dMIILYNII/K
	 Wa+bh3HnA9vHHKHDWYVcTd6BSbJHk3IyDqATJnDYHA2eruQYdTp6uY5gEQyoVB8v+Uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=IhotsZMujGgxWB8wogYX7M/QNYLtJDwXry3FOoC6GuE=;
	b=Ah/6vtkBFaNICakQt95Jt/sv2nk4eOxKpZFACo12SQ/5jlmVa1nqm0U/MtkjldOrfQc9
	 jiPBLH52tnSO50249eFCjXtVV2/tI+h3bWDJq0TYPiKNq1mupBTPwAsVp0kBi0AlUQiPY
	 gD1woyUZ+nY7ACTwvbz7bm9YFDNSL8BcEIGzthndC/5dPeQAg4cy4bbKnOPK47T+16c80
	 BP+Zg1qKqnrWFWa5n0MTM23AtsHfaTOHMREAZGBryw23aXSMYOemK0kE0pbmaIIOo4Tmb
	 Qb3YSEnsBDktPYLpKraYtaVqbOE4aAdKN93RlVBHQoAd8fna3y4yo246bLfC80ogvHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ST3TiZBV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04D3606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C04D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ST3TiZBV
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a089dfee18so1010274b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:21:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793359303; cv=none;
        d=google.com; s=arc-20260327;
        b=TX0zLEp8l3pKstXLjAR5rejFpK0/ISAnYu9NKAJZ5LTRtIlpdESJRrrp80YkBtl/HY
         LidCZE4oDJF5txmmkvWpnbkMHn7Et+Yznfny/Nbh9dAYfzi7q5vRkT4g3VykhwKTG2I+
         iY97KrmnS1tH8Tzf7L/jqGbIUZyCH159KAEJVPhvivX4jLUaeM+EZc3NFSVwYSSZ1K/Z
         JqquEbDhp1d6RtRQGnyCEiMmNZgXYKGbGKbRwhSzyW9M8i7i9hfBWgW8ifGbtK1fYZOx
         3tcIL/nthOI09ZZFq1fOjf5jYmoeZaKCoOd7mtAXjRZneqnxg8qClqGTrGHaqCXugPoJ
         I/pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IhotsZMujGgxWB8wogYX7M/QNYLtJDwXry3FOoC6GuE=;
        fh=E1aAeS90fswB2GgAKYAV+anARg1xKWU3gl7jy5PtMN4=;
        b=ROqolCj3BfcVSj2VGxxTIBkWOfYEN9ufuCiJ8gaA4T5HMvEN9leY7RChFOzrnLw0YH
         i6Lk4B+Y4k+DiUgmb90+rj0bMkkHUQDSi/cl5SAIRBhH4gf9l1LutqBx/epNNJMgfQs8
         XKA+MQlF6YI1GoKR5EGkFgq7rUwJnfVguotv34Psq0ZeDzCrdh9VwND5aHQghYr0XHZm
         LlRMGZbrf/4oXMkhW8pLNsnoYfQBdrvWw/QoXVPxiVuCY0u+In7M1mVpkdosbI4kWJeD
         eYr0SubIo9GO+hvQsw+MP7f54UHiOkYnTdINctqdFCXqKRZTV11/KD4f+pd3nIr/exvY
         DJmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793359303; x=1793964103; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhotsZMujGgxWB8wogYX7M/QNYLtJDwXry3FOoC6GuE=;
        b=ST3TiZBVYOQ3EPnlZadMfv/II96obcR45eIj4UK4HcNzxNShEHyAS48R1hFH9o81Ph
         fMSni7TQWL8TVQn+JDrv/h+B6WRS3LQxQmJw+x7/UvSKJLllNHaZ2fZdMQA9XnW3RfnP
         AkgYYS4DHVlrogob8pY8CpohjE57tGcT1fC43Z2aBVQz1HrSkL78ZNG+wZKjyuZ7Orv9
         OZhK/agd8JhQvpGY3XDAJd5+w9oJ36a5Nz/ZPW/8+mvXH/3Q60U2Ft/0yTqfk6cslCOm
         OWJ3QWJX60qysCjeRDBKSizqo1I5ARjWy4KwmvLsDtGFW4//80z9TNjKMPS0yog8YjXg
         JDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359303; x=1793964103;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IhotsZMujGgxWB8wogYX7M/QNYLtJDwXry3FOoC6GuE=;
        b=mEctlRZSDmy3xI9cravynytv8wrEa9YJdROovGqpyN+w9jP0KNCAGTQcmXE+HBONxX
         RUILlYpV/59lHogUZYzkiCvlbvD957qABW9d0EddXqbrz7gZSZdPsy61dsCU546Hvq+H
         qYY/QgxREv+I3yqQpH4615uLCiwGekA1pLA2dD7ZyyhbLuOl+Fixb9kniOE0dAD0dq7x
         VhIa6wHU74Axff7TDdJ8bLBHuixjXb9N0myEei15Xm/UJokltj0cmwTQgAU6fFlAzjTO
         Iq4gbECbLELcezoLe7WwcsQNaY07GSxUu4slDkc4F9U/IFYxbeTHPOMhXYPr8/dCAb4k
         rJ9g==
X-Forwarded-Encrypted: i=1; AKwUvByc3P1uAiZKnoI+hEb8WaUQhiifIDvjAqH15NyeBjlvkykUeVi64VCsD0mOzO9hm4K5OV+l01Bl0Z5Am2w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOjAiqqQi9edH1/JxqcKYZbzTS+EC4Upa46pp/BQtQIhphfYHq
	mO6IDpNQyhSmAiZgpv6YV09fuOd60GEVIvvOpDdrvsk3YyvkO42VrsI+OaK2z8DTSlu6Zp0sDdo
	XUJu8qLZA648t3V3angd2gMvxSeBI1hSPsuKsX5Hxcg==
X-Gm-Gg: AYBFou2pzXlqDdKfp4enVKfBT/aWKfOYcxZDp/aq2XG/xkYDQkzE4fNXLty5lfBde2e
	FHpxOtjMddfxVfi9NGHQgjFq4gZeHgvzratkeE1GrVUWYuyFCqVhxPsWT1U/p4MthzjrE1kgJAt
	5Zq+0cLj8WEoy9f5XABNRCxlCwRzZJOjtCULSiqq1zMPUsKYTHRbo3VHERMx2qUxKh2FJwcptS7
	lirm4F+AEe6Z2TBcmzGof/4DMSX02zystBGp3tqAtEGuVVi/ISDSdVL2fE1BhQEmd/5fasXXA0/
	DctHgYmmkpf5Q438zJbo7wLTMzCm6kwDdWtvPUpzN0hUCIomIvBKyID3BMBTo5fN22/6rGZ0U4g
	OpNnJstjOClmlyiMgyEGKB3G6dU0bdTwmgfZP
X-Received: by 2002:a05:6a00:12dc:b0:8a0:18bd:ddb0 with SMTP id
 d2e1a72fcca58-8a9bf71b34fmr1264612b3a.26.1793359302995; Fri, 30 Oct 2026
 04:21:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-4-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-4-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:21:32 +0000
X-Gm-Features: AclHuK_sZpu_OHKEsqb49igvHOjsFenvWY6XU2UJTZwHMq2AAjoVYXumXoLt9p0
Message-ID: <CAPj87rN1rzjDMPvVJytwmvHGipCCuYOyX3abTRqYp4Vq5PyrYQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/15] drm/rockchip: vop2: Send pending event when
 atomic_enable() fails
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> vop2_crtc_atomic_flush() stashes the CRTC completion event in vp->event
> and relies on the frame start interrupt (VP_INT_FS_FIELD) to deliver it
> later via drm_crtc_send_vblank_event().  Since atomic_enable() runs
> before atomic_flush(), bailing on an error path makes it skip
> drm_crtc_vblank_on() and leave the video port disabled.  atomic_flush()
> still traps the event in vp->event, but since the port never scans out,
> the frame start interrupt does not fire and the event is not delivered.
> Userspace waiting for the flip completion then blocks indefinitely.
>
> Note the event cannot be flushed from atomic_disable(), as userspace
> waits for the completion before committing the next state, so the
> disable does not arrive and draining it there would deadlock.
>
> Use the newly added vp->enabled flag to detect this in atomic_flush()
> and send the event immediately when the port did not come up, rather
> than deferring it to an interrupt that will never occur.  This also
> avoids the spurious drm_crtc_vblank_get() WARN previously hit on the
> failed enable path, where the vblank is not on.

I really don't know how I feel about this one.

atomic_enable() is not supposed to fail at all, hence returning void.
(Obviously, there are scenarios where it will fail, which Sashiko
keeps 'helpfully' pointing out ...)

I don't like how this just papers over the issue. It turns an eventual
WARN on vblank timeout - which surfaces the issue - into a silent
false-success. Userspace just sees commit completion requests arrive
as soon as it's posted the commit, so it keeps on going on and
everyone's happy. Having the flips time out is a messy splat of WARNs,
but at least that messy splat points at the exact issues, rather than
the screen just going black and userspace blithely trying to continue
on.

Cheers,
Daniel
