Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354173;
	b=HuUyTmfunXvu70CoMV62UE1TD5351Whg0Qlxdu1kt2vdxW+bpeQb/bu82uWRou2d5No4
	 6rzY+yUU/y/baBme6nZsNVwtoFc6RT7YNb4JV7+6fhu6E8Ie05cwuz5hbRKl3B2bvTTz4
	 VXiNESHYV+Ra4is6HE9kx8rfzC5Dg2l3XyOFZGMR/M3S4ShyzlKRijsVQQN5hzieBavgm
	 5GkE/DA5zZXhZCbhZF3CXvpEjt06XyfRFLYvFehkb6ZRDDVg3wMXInTbP6cxjDsHGNzuN
	 fo6tD+IavSJ19WHrxB964Xl7quFsWMl/BdNIAaa7+XzLcuw9YbnXf/Lf4yMyezZ97pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354173;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2pjemkGxowj+xCRFsgpE+Sr/MpR5xg7sVFs22RMEq8s=;
	b=XOEfI3D3BvMMvHpJQnQ9IE96iX7n7UWlMbSMEVpVNGadsEU6eam8py6lH2yXZGjUC4Ou
	 NgzDZpG9qZkCTgrqmTGNejVHFBwbMn2Sjuh9UDAWBTicDCxidhPGqNJ9NC0BFAgiUIVvq
	 EyoqCUP8MTp+nf4IsVZ6yYAC4trPGnHmJgg0tnKNzBEpbXKGSuTMqoHuZVaB2/kbJLk6h
	 6ZNLEWnNhgvrJrNKwBDxL5p30K9nYhofzQF1inJ59w9WJHrXnbzNHWmM0Pa0w+IsEZ0MP
	 Ks/8u6YdONi4ZhKc8oNOx6TjdTInY2B0T8TCxgy2iRW3ssKXyK10dzwtzenBTGn0pEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nhq2YO61;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C098606A31A;
	Fri, 30 Oct 2026 09:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nhq2YO61
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F79F1F000C1;
	Fri, 30 Oct 2026 09:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793354173;
	bh=2pjemkGxowj+xCRFsgpE+Sr/MpR5xg7sVFs22RMEq8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nhq2YO618uskoVNhmXFuHaT9We+/yoR5HgkdFi+c9uZVNh8r5JMVg5uFp5TPQR8XC
	 981UpFx5tUSW28zHJQWqHnrcjzVuGzdqM5cdwo3kh1/lgOdpgHBd5WzFg9IytfWmob
	 93v5/OgJ3bSlSVL527nymMR0QKBZG0kAw92wjokeMajVC6QOlHVj/XzvfynzCZiF21
	 JgR1k0w3mj/CYnk9nrgIDLsWnlAbNEg54GrJq06yObJ86AlWXZWim8ofvNdJmXhcvd
	 VqyydmsJfEwFmVHZ5+6l6QFUcNBH6W1hYTji8xOQS2gl7fwY4MTdU+wSLOZdQ2tKdG
	 47XvemLlAsPmQ==
Date: Fri, 30 Oct 2026 10:56:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hermes Wu <Hermes.wu@ite.com.tw>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Pet.Weng@ite.com.tw, 
	Kenneth.Hung@ite.com.tw, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: display: bridge: Add ITE IT6162 MIPI
 DSI to HDMI bridge
Message-ID: <20261030-jolly-mantis-from-betelgeuse-2f0db1@quoll>
References: <20261029-upstream-6162-v5-0-8369f9e5afe6@ite.com.tw>
 <20261029-upstream-6162-v5-1-8369f9e5afe6@ite.com.tw>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029-upstream-6162-v5-1-8369f9e5afe6@ite.com.tw>

On Thu, Oct 29, 2026 at 06:12:30PM +0800, Hermes Wu wrote:
> Add device tree binding documentation for the ITE IT6162 MIPI DSI to
> HDMI 2.0 bridge chip. The IT6162 is an I2C-controlled bridge that
> supports the following configurations:
> 
>   - Single MIPI DSI input: up to 4K @ 30Hz
>   - Dual MIPI DSI input (combined): up to 4K @ 60Hz
> 
> The chip also supports up to 8-channel audio output via 4 I2S data
> channels.
> 
> Assisted-by: Claude Opus 5.5

Drop the tag now, rules changed.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

