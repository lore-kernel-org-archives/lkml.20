Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369423;
	b=epCIjwj+lOqNGChCCGZ/cU9aqK4D4mMtyig1TH8Ik8EpgKPosofImZQ++44VA3gDnhKV
	 Nn9ZMbaGVup/7y0ZdaoAhYMvn7xQdjyhIYWGLsXuIqoM7dM3s2j7IVlJnuofBn2QzZU+S
	 q3STNw3iB6RNQNHx86/Bmo7Wb9iuW0uox5TsQehSBX6S0s98rNjXo7uw44p4hrzwTnhFu
	 13dzg4vX6hbsNNl7UwP0KjAJrdL1mwenU0WgbAz7l3XV7PTyOgwtBtMAQoMKNzEQWMALp
	 6vjWSOLkG9Sc+DaY068xi0yQDLoC6uS983yUzx9vL7ZSqAd5R2vYwaUT67d6k4UPLZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nF6oG7qdYpsHcUJcCpTVAL6/z6SjIIvM80+qHFQC0Tc=;
	b=5IcsoEM4HG+ZVPKdwITDjx5Uly9Vyia07A2DEJRs9RzwHyi0kz0pdbnLjExKW6+joreJ
	 1pb1ACGaVL3EAX/c2IVxe47cvWOPGrUwvHddgi2048PjObx7ON4eB6u0HVmwCUakzQLLe
	 LeEPYPjuQRbk5csTbfALb1PCT/vXTVRiFwc3IGaYDg6ahxcZdlU8HCynKXbDGa5SP7tfd
	 Umx9ymKcakoR89UAavBlcQjasH8iNGyRz+3cTCd47HkLLRtbDERJc32UrPwehCOGur1HJ
	 gmW0ehl0x1/I2FoIbzym00C3gDHNx6zY7l2dSeo2RcWv2GU5VR8ZE0uLeN9a9sGytQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tXq+wL7O;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E030606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E030606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tXq+wL7O
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c45111bebso335854f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793369422; x=1793974222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nF6oG7qdYpsHcUJcCpTVAL6/z6SjIIvM80+qHFQC0Tc=;
        b=tXq+wL7O4VBPBYITmcItGx3NcHxmEYMBduIYQBbj6RE988KULxBYq0p+J2tOUpYIhP
         AtwMt2jwV1lLB/exueIgOHT3X1Ot8xMkd1XDH1fiFtE3bV7lq98MUdpZPO9SkraAqwne
         jOJmxVVCI5BrjBUCvjZkjfXezxi2LuuHsT3VZE9Q4bcEZDJJsw3B720rezXthflWXj7c
         8fkWo3qfJEPiRDmzPeJzLTErUzouV5rqaHKLMrEhqYN46i88IYU4EmSfgY+OwrT3dT9Q
         Y7/9b5jj592pYRZ0iiTvnpbkEtVXQbzBxC3/QyhPJ/rYosUgBcOI403dumVNcCncNu1t
         fXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369422; x=1793974222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nF6oG7qdYpsHcUJcCpTVAL6/z6SjIIvM80+qHFQC0Tc=;
        b=bLrwyBdABeBLX+MUHyhUm4ZcKQVX3MRo4x5BkePi/IFTReOMkepJa1vXxDI7pVdrMR
         xV+drw0p8cq2M4gYNc+om96JJ2QfultTgtTlNq/7Ki95oA/HtRjGvVJHSv3630zfrnLz
         f1JegL23Iwjwu2brdRJCefE4iXFYRJgHN+2qUwWBfGNmGTqckMueTg8QzBWn/YaLrnR8
         5DdFXbVj3T+34GukyxL4XItmCSc//4T6cm9wKhG0C/YySK7xm2MQWFLqOYbdJfpNJGEg
         3t0O7MbBc/GUBiSCX50K27JPpIhu1dxMERBlFVLt+7oUqVNmenWUh7drX00D88e0rKhN
         camA==
X-Forwarded-Encrypted: i=1; AKwUvByGyzSwXSrI1XTpChEpNUvrWj/OF+aA0wkl4h8ASedWJ3o1CXtshTJVo4yNSbgXPXhPmIm7OvjijNszxMs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVj4KUruYW1YcuqygQ+Sbzi2zxpC2RghbkrkL6l7qbsjI2XKUF
	gx4PmKwNZi9gCdDRkfPBRV39JDjSlYwdA3XZV76SlBcBNTgASMAz/JB6
X-Gm-Gg: AYBFou3Jkj/iezmcptCbbwXB1BkYZzn39j00/DNmawYc0iZzJQVYd8n/p74mlfi4E54
	E+ZhlexsK/eFw83HgKDX9R6HfElIC7JFGY9Zl9ExbPOYFLiFXoZsmmxFbmrWm2K+cfpqioijjd6
	a+WX35bmeuqer1wLWWVIjYl/cehlgB7alwQRfbeRQwu3pjERBXhae3jjXtYH8d738FIH4zy4xPs
	UTXFlW4x2DPgxyWw2TAmxoSr9iPId0jJncenaMUTZqQHi0EPmdpqK1UN2CAY5dwxUWltEJvlM42
	s7iaXLjnDqVBy7CGFKYgsb//O50UHJ3DhS1Q13DtDN+EjmHGy0vyJEpj7bBn8IPtiUrXhXn/05C
	AMnnj4rdst2b7Su0WTrk9E8CHeVSrx0ZjWzIYYLgoC64beNZ9ISJrzozyqHlK0S98kdy8joTSz9
	SliQNdOyzUkvQj6Cjmt0P0cvyhK9obDKnzFyIQk8lt4wstjTnoPsvAu3UQRD2zUTh0b0MbYV/aw
	Z1JxgmEiH/g5k3dyKrPY+0t0Cl9N52d9u++aFWSai8hxNieFeKThJ988vqLfNVJSWFg5WcEt32z
	RW+n6kvG2eJxE46Mm2543sCas01svgP6HIUk8yFSDDXv9UlnDRBrcUVqtAzzfaZwX9tCNODLtc1
	1RM1LtZNP
X-Received: by 2002:a5d:6f0e:0:b0:48d:ea67:79d4 with SMTP id ffacd0b85a97d-48e6e518c14mr5740707f8f.53.1793369421351;
        Fri, 30 Oct 2026 07:10:21 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:39c2:e340:24ce:a263:4d8:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba53d7sm5181973f8f.53.2026.10.30.07.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:10:19 -0700 (PDT)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Romain TISSERAND <romain.tisserand@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	Liu Ying <victor.liu@nxp.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: use the lane rate for lbcc when lanes run faster
Date: Fri, 30 Oct 2026 15:10:18 +0100
Message-ID: <20261030141018.3851266-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9e3dc854-b2f5-459c-8267-55e88e87f5b5@rock-chips.com>
References: <20261025142639.3454322-1-romain.tisserand@gmail.com> <9e3dc854-b2f5-459c-8267-55e88e87f5b5@rock-chips.com>
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

Hi Chaoyi,

On 10/26/2026 3:17 AM, Chaoyi Chen wrote:
> Adding different glue code for each implementation seems like a good
> idea.
>
> Maybe you should try to add a new callback in dw_mipi_dsi_plat_data ?

Makes sense. For v2 I've dropped the threshold and added an optional
get_hcomponent_lbcc() callback to dw_mipi_dsi_plat_data. The Rockchip
glue implements it from its lane rate, and the other glues keep the
current code since they don't set it.

I've retested on the GPD XD and will send it on November 1st.

Thanks,
Romain
