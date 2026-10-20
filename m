Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494967;
	b=3rEkYIBvTXh99Lgc7NGuunyvmisABAmqDP5VM7m8XcY9ZQiVothrLvaOnFBMk791Zyr6
	 MV1/X6AFKe5jkqz9VrbHksI7GL3JTMsBMkbKHtKqzq9P4vV1K9DaIMfFr8HVHXNHtArpq
	 dk8+M9TgCSoD3JtPM9N+toMmTZ3o9TVFyAEDU446QMdmI/pE3mbo4fRSwWVdCIThK3Yhq
	 CIf87JVe5iNwVhSUhFUk7qZ4lYfafUf7dKNASyF5QgORwnyvhyreWX7pgFoBFhEvlTqlr
	 5mhGKoZNy4c10u/XQgjTfpUaNEVN8rrmyr/yNKuNj9bVdEllJP8Pll3FkYXZ6f6MOwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BKNUIkvvRElNLCz/nkWKn3YDTekvBpvFpeCv+ciRNW0=;
	b=fEwIzRVfA59NkUQX9AYWAmMqgutpZxikPZWQzAl2iKMg99KungiGRZqyNmScVAA06l72
	 W5FAL3GO+b8oBgoIC8KP3W+TnuoZ53rpI6rlUZz/CVMG32KMu1bm+/Zs63zdPhD2gXjoN
	 P1E3vlqx2QgC0BBmwWpAhaQOxPXpR7ob17L5j+Kgl8YVOuP8UsBMe0CEldZX1xcVpACXA
	 KPe2G5ppWA8Z4vSm+gsz69YpgOdQsGzIhKgxCf6nmUMzFRtr9bFpyfrdFS0KU8OV8t2Le
	 /vhlF3XlnXXkSuJLE1MOooA83IY+osp3FRIJykcnlC+j4urq1ZcorQlPoBnugMfk5Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FCHEkMMH;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1F8606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D1F8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FCHEkMMH
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-354ba08cfd1so5645256eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792494966; x=1793099766; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BKNUIkvvRElNLCz/nkWKn3YDTekvBpvFpeCv+ciRNW0=;
        b=FCHEkMMHCZJvrzaBB5rate4Fph4Rq1kjhZI+VLv0rKL7jFOYNUgf0C069UkN7PQEjL
         PUccoLadivPMR/aUAQvHUhbMnPXVkGWpOcEEhucRWqhXJcYE85lrvquDS7q6Nimm/IUW
         k4EhWZU7yIGZ61lrl6Ey3KUIz6ztljPhP4JNh5x08h65TR9u5GdEeOmqfikdDQKCj1uZ
         FyOQsZQx3YWCbpZinXk+SQcv3HqDXA+1/cfX6l6rn+4aNB4tcUeKphb5yBWYUtKMPJQJ
         Q9j98tsyqAnvAOnqwdRATe0htn2FmQCsegS0PcWfCVZiVOOvs4kiExTtUZJ7AgkXVRfv
         xXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792494966; x=1793099766;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BKNUIkvvRElNLCz/nkWKn3YDTekvBpvFpeCv+ciRNW0=;
        b=m4ma5YTykVZthZxV/QOS4vNYRhzCyhosh+OW6hcVI/mM2DkdpTZNvUks5ZRSLnAVKS
         oJgrFwiDw9eEvUph3927txdhN4p8DSNugj4d2M4zx12Ylmndht0NtAwZyV0bAC42itmy
         m4mbkv/UnKkdvsfN1wRsimBYuxlXBr6U09FqNHgdvyRMxvYQcYoR9rRheiUXvsGI+ctR
         U0s9NVoQpJipCi6Fo0mZLw0IddXRx6qBR9R7hlukU4bRXXYtsl7d7CHqmv0FC4sFlo0Z
         Ji8wroqjArPPXaQpdQKz0qQMM9k11jBYaF36UMRUiGVFm7uwaY7glYgaSpaBegZ84LfS
         lk1A==
X-Forwarded-Encrypted: i=1; AKwUvByx/bB80hExCZmG6Gm8KEnuQxDWJogcJQnSXy9LAeCA3eyf1s+eAC90JMA7uU/Ayek9ZuQ96y93hO7a7Vk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQks8NWG2WKTsNRXTTciJCmww3c0Ed64lvqXYXzRFAahJYdg7M
	aw0T7oB98dI8PBjKTOPqDnfJFAFbdLS+gYbOJc2Bdn8pzBVzdbqgR5+4
X-Gm-Gg: AYBFou2a3ufVyWGBkWRWhEhaFVP+4PqjkmZuOhAbP6+8iwZ2+b9P7ktVyUs3t+hiEMk
	lYyhVbZIK8UwXhCHqu0BI8PRXz1lbuJAXD5fMshusyjZqvUA8aS6X2F7riSWSLRf3RYN3VxM6A/
	tjoHeqrSCWG6Ef4nOEZFcWJZ40dMXSpQWkh6r1uXvjt2DaNAb39FYFfKKHM+9ni8xOl2BMYp9FB
	nTymVGca4/niewP7OFi3qIRQC3DHwRpznllzVqN9w6PadLjIyK0qQlqNYgsO24uyOnH6887AXPH
	YH1ATXrQ3JYlrIwvtagtlg4bpVnbSdPhdS3smIf1M70sv09nUKNiWL78Q/KlEjd1coWK289Tl3D
	whVI2QqGJdsucQ5KW2k3+hSWDRcRCzmd4LDgCCJDmCn5MqAGBifbXk0gSTjoxVOh0OeWUPJfO0j
	vD/83WnUYXZT///58SYZJ425IYIqEdzlYt604shrFR0LPvbKm+rQqXByrCnVL9OlD6dYRDNWeBw
	2DT
X-Received: by 2002:a05:693c:42ca:b0:35b:91da:7cb with SMTP id 5a478bee46e88-361a284198emr14197128eec.35.1792494966059;
        Tue, 20 Oct 2026 04:16:06 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081fa5a6esm41461147eec.16.2026.10.20.04.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:16:05 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:15:57 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH v2 2/3] drm/bridge: simple-bridge: Support
 data-enable-active endpoint property
Message-ID: <u3zistwpxmtjstw6lqh2qfvr3mrj5ozflxfnrln2qqitjnj6lw@5ea5j3zmonw7>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
 <20261019-v2-apalis-imx6-enable-vga-v2-2-ef6a3a780472@toradex.com>
 <atZ0jECm5BDeROSI@SMW015318>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atZ0jECm5BDeROSI@SMW015318>

On Mon, Oct 19, 2026 at 02:50:36PM -0500, Frank Li wrote:
> On Mon, Oct 19, 2026 at 07:17:15AM -0300, Leonardo Costa wrote:
> > From: Leonardo Costa <leonardo.costa@toradex.com>
> >
> > Some simple bridges, such as a resistor ladder DAC, may include a
> > data-enable input that must be driven at a specific polarity.
> >
> > Read the data-enable-active property from the input endpoint and fill
> > the bridge's input bus flags accordingly, so the upstream encoder drives
> > DE with the required polarity. The property is applied only if the
> > bridge doesn't provide its own timings struct.
> >
> > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > ---
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Hi Frank,

Sashiko's comment regarding atomic_check was a false positive, but I
wasn't too sure about the one regarding devm_kzalloc. It seemed to make
sense to me, but I'm not too familiar with this subsystem yet. Do you
think this was also a false positive?

Best regards,
Leonardo
