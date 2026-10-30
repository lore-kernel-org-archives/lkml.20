Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793385418;
	b=gv3S4CzOhh5lz8haZS7J8X6luEAngY+UIdUdT+UxOETD315fCSWBG/gq44wxSSdvpn7H
	 W576+uC3uV6yvBFS8G2jLMVHBxfIcHR6ZqyIXqyqnzTMHfb6GvsPZUtqswUs4vRlk4yaZ
	 jpQEUU6UNjfVpKk5xoNcDDUNCNomd8JxmWGbWqeh8zeXkkjwO4RVc0yo2TLLg6ky5J0jC
	 x5Cp5AatrNc/UPA/lb1I7BzfXgeq5JOxmEEZlxIqqCetAcUq5KeJOJDifgtELVXkiY6lz
	 JFSVsD2dyZ0enIvjCpSNncG20Z+Z6oj22oSJOr/1LmhekpDJ7ai101tIIFLWddmXK8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385418;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hQWb7TJsKWyoKe+2xRhxz4iuPIx/iKeV4EOEe75oHAY=;
	b=qiHTj0xGrZ2LxkhiKWJu+xFcDZMNeNhrlfpRZq8nS1roejho6Ra2yILElmTFnFABKgcU
	 09LPihYPuV3qhrs/kLwxyWV1JLDiUUJxwOuWgy4sEuqzAGhbNbR52RFLg7WlQ/arroGnT
	 E851qyA3Hoiz7+hUMlRSFQQHl0VO4Vlag3+KpD9Mfd9cvXsorFk+orS/MZYUQR5RCIyS5
	 pMwHvwNbUhyD9BRflZh8ltzfxM5NF2/jJQFuoBClwmHmfQrSSqsgBt+QxCw3d4808xGfD
	 0ACRoMyC7K4hPOyArSmVS9VwBn9zxVuq8rYF/WPuP6m7T1JKbU6hm8RxLwIqdDRGSfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andres.codes;
	spf=pass smtp.mailfrom=andres.codes;
	dkim=pass header.d=andres.codes header.i=@andres.codes header.a=rsa-sha256 header.s=protonmail header.b=FlbJDvrz;
	arc=none smtp.remote-ip=109.224.244.117
Received: from mail-244117.protonmail.ch (mail-244117.protonmail.ch [109.224.244.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAC2606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CAC2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=andres.codes
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andres.codes
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=andres.codes header.i=@andres.codes header.a=rsa-sha256 header.s=protonmail header.b=FlbJDvrz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andres.codes;
	s=protonmail; t=1793385413; x=1793644613;
	bh=hQWb7TJsKWyoKe+2xRhxz4iuPIx/iKeV4EOEe75oHAY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FlbJDvrzu33nzhrIMp5epSrskjuDi5oIlM0QpGFHcmJZguAuUTCvL+oe/Jp3xP5jW
	 dWOhrIHb/XGuLMnGK3Ikoboy8ntSBsYqkPrIUF2jdHKEW0afKlceiqLFQqAlMrIpTv
	 UmzwwAdA+niUtUxVnPDm1smGiWbBkhC4a/UUjv+63yPBT9hBY1AQrVSDX7LiKkwObi
	 W0zEwgkAC5lcqY9yGZk/fYFvkZ7s7/ukeo+o13C6XhplHEvuh8EIBUG4B8F+MWBfLj
	 U0Q/idNMLO4IN702cPfZxjWTV1EsLK3HKCz+Jkb1ninsurGHeA+iJQnyu9e8P0a03v
	 LCq0V4kSsXHmw==
Date: Fri, 30 Oct 2026 18:36:47 +0000
To: adrian.betschart@cinemaone.ch
From: =?utf-8?Q?Andr=C3=A9s_Rodr=C3=ADguez?= <hello@andres.codes>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com
Subject: Re: [PATCH] drm/amd/display: Apply the HDMI RGB range default only to HDMI signals
Message-ID: <20261030183450.31119-1-hello@andres.codes>
Feedback-ID: 74930084:user:proton
X-Pm-Message-ID: 116c1e407ddbb85253cb08b2e3ab49f6b92ff6c2
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
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Oct 2026 08:45:58 +0100, Adrian Betschart wrote:
> Require an HDMI signal as well, as the original commit intended. DP++
> passive adapters drive an HDMI signal and keep the HDMI behaviour;
> native DP, DP MST and active DP-to-HDMI converters get full range again.

Tested on v7.3 with an RX 9070 XT (DCN 4.0.1) and an ASUS PG42UQ on
native DisplayPort, 3840x2160@120, Broadcast RGB left at Automatic.
The monitor reports full range again and blacks are correct.

Tested-by: Andr=C3=A9s Rodr=C3=ADguez <hello@andres.codes>

