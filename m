Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825803;
	b=g+rouk0yz/VQlCpAKDp2OXa+0+UCPcpmE/Tyrh9PBh/gEQilCW2vOKjTwAonom2Zzqtx
	 Lta9+eoEXt2G+oCXy053IpT2KMWLn8f2rmb68n6yWP2uDIVJuFjHWCVcAf360s+Mz1olJ
	 IVaXABJj9AwNVs8v2X/1wMQ/6A1dN97TtEBCptpvweue2D+UYKmw2cL4ehbrOOSlv8AXz
	 UzqHp5avkV+z/71axrZFSme0lUXMZ5KqqgWNrfufRVSpAIOwM0e3R72DZqxLkQBMf+46Y
	 YkGv9FFFG4zaS3/I9URkjlwnG1cZbzOar4XSa73hboF/Wvo1qC1Sp1AEKNpXY4tkKSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825803;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=HFgBNmF1dKKEXAhT4vAg4tXiNZMtdj+Tl7klj0u5s9w=;
	b=WLW/A5yLVDt2meTrLJFpQIEdcVhg8f4dmGCAW387KqW1L3ki4JP/vVyu3gUsmF7oFkEf
	 5fPUKQlLnTHbazNHtPyHVp16MRP6jMlznG6eZAYctvwwEeM8NmJui5XVVlZhK9AME8sHW
	 LQyQpjDSlD0Q8OJ65D781kTWVfCYFesZwUj6ewvBDrml+Ta0ZUaDHhHmWqYeKgGxOzuwG
	 TQYDidzlxHLzbeKMlivLvHXIwBhui9RGNyVJdY8Gy9GMcfVMO/ZhTnoxmN5ak3hxtsJF9
	 /5S5kECiSm28MFiSzhxZQeu+B0kJ0sCoV5yG5nrfNb5tbnpEIjGzWfD2ru878ebbX6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=AjUAAIFk;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB206078737;
	Wed,  4 Nov 2026 20:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EB206078737
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=AjUAAIFk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793825800;
	bh=DFMoN9VaSVJOOLJDXLMmcmecZLc78udASKoTWQJ1IOI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AjUAAIFkiuW98FJu5/ylNWovxCKnIXervDCdQA9Fh+rgpKxR7cLC9LjGYn0/xDgvN
	 DWOD0IX9qA45/2uCKokePyD9FH/mO/GX69INb+wLz7GtvLwG0dAvffxnF8C/0NbEWC
	 /mdZCIG442dQaiRve9lBLwbkCqo3zst9+3FUxjsUlYcA2T0onpOAb0rjejTUdDC2qV
	 VXbyWi0+92XST4OaZMgkU8AMALOZhHqAxdGouxgoNPMoufb/GcrShfQTXzgv1GaOLX
	 8YraaGnH6x7gnOXPAzOkUzqIhEh2dimoCaPvn5+mBwScM3HyJYvymkvfsk+CCdSzgk
	 aAWnlwKfjZJ2g==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 54F2617E066C;
	Wed, 04 Nov 2026 21:56:39 +0100 (CET)
Message-ID: <f9797a72-2fd0-4127-b741-dfc6cf3306f1@collabora.com>
Date: Wed, 4 Nov 2026 22:56:38 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/15] drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422
 output format
To: Daniel Stone <daniel@fooishbar.org>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Daniel Stone <daniels@collabora.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com,
 Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Igor Paunovic <royalnet026@gmail.com>
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
 <20261014-dw-hdmi-qp-yuv-v5-13-6fab0fe43a9b@collabora.com>
 <CAPj87rOMjFEjOQ9TVgbGWu3gTwVjmjuFNtnFiyxbWO+g_RPqeA@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAPj87rOMjFEjOQ9TVgbGWu3gTwVjmjuFNtnFiyxbWO+g_RPqeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 10/30/26 1:52 PM, Daniel Stone wrote:
> Hi,
> 
> On Tue, 13 Oct 2026 at 23:52, Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>> @@ -229,7 +230,14 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
>>         }
>>
>>         phy_cfg.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
>> -       phy_cfg.hdmi.bpc = conn_state->hdmi.output_bpc;
>> +       /*
>> +        * YUV422 always transmits two 12-bit components per clock cycle,
>> +        * regardless of the color depth, which from a rate perspective is
>> +        * equivalent to three 8-bit RGB components.  Force 8 bpc here to
>> +        * keep the PHY PLL output aligned with the TMDS character rate.
>> +        */
>> +       phy_cfg.hdmi.bpc = (s->output_mode == ROCKCHIP_OUT_MODE_YUV422 ?
>> +                               8 : conn_state->hdmi.output_bpc);
> 
> Same question as for the VOP2: why only special-case YUV422 when
> YUV420 also needs special treatment? And presumably in a way which
> can't just be mashed into bpc, because the maths doesn't work. So
> would this be better off being handled as a separate output-mode
> adjustment?

For YUV420, the halving is already in the TMDS rate, so the PHY PLL output
equals the halved VOP2 DCLK - no special handling required here.

However, since YUV422 is not deep-colour packed, its TMDS rate equals the pixel
clock and therefore the PHY must get 8 bpc.  This is essentially what
drm_hdmi_compute_mode_clock() does, forcing 8 for YUV422 for the same reason.

I replaced the ternary (and the related comment) with a documented helper.

Thanks,
Cristian
