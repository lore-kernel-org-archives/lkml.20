Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310084;
	b=Z7iTk6kbb0Xc5mlyudlWAPh6B5Nt1xS5G59gS9tHndAtv2HDHI7iT0VxOiQnSWI9G7GR
	 Cx73fIlMomav3bRooJb2kwUuLe8wSUVqKjZ8vLM2O2ICttyulaCaJMUm6U60+mYAxXuqM
	 yJARE+aK84wdR6BpyCzfe498tWK1hgtAp1zp22Th2wITlHgGqo15aT0tVLf7IQOKNaf/Y
	 H8LoF/6aXRdQxgUJMsh7NGKMjLYkNiWTXNQdToMVvXyfn8zijCeNi72Q8yy22/izllh7J
	 cWaSSRvCg2Y8RtxG2kcrVtWkW2HjhHeIDOowquzr1o+At9k+IonhX50Nmj3DdA0pOng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310084;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=+8SmpKfanibtqfQvPi11fKmx/q2tro7mfSWNxssCkTI=;
	b=4cqj5bJzqRh7C0f2JM0comakpWmK+YfL5UFpIK2gdlpFahNeeggLtOg0ef0DGsAJ+T9b
	 puNvykOEay3I8FvPK5dMk/kLdgK/XEO046SDwOK7ukJA0WaSBXJeG+KAFHUMfJFev39Hq
	 stmKPy6RErRAJiORg6KuPTfOVdUiCW4lShxpEfXcL2BRL3WEP8rQfC9e7FOSMt4FZht3W
	 Xvf5GLDn8rdi03Ce9wT7Ay8HwCygr4LdHaMw++2rpzhLTLQPT9+6aF9zb2anCDXeOZKPC
	 p1EN9MAbhKt8YEtqPM3L9vZ/wOCU1QlEJfvgcMpU3F6/4NoMOSB4EvvE2JwrOGefsTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CA8606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99CA8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so15447525e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310083; x=1794914883;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8SmpKfanibtqfQvPi11fKmx/q2tro7mfSWNxssCkTI=;
        b=nzNzlJnibZIAtbRHjLke1FPVHJirIg2EJOGHHCKSFp+5oSDkUik/vy1VaLy8YTWzPP
         RVpVLk2xEpa1pFRTVydFaBbFvAK0WIW8K8Wts0asMUqotRZrVcmGy3VMhtJIRc3UhFfw
         r1uexWMuI07/9gkm/tLfGY6rVQx5NacTssRvIUc+1vp7V1NMvx2I3KHocKt9fHJwXvzP
         qEBSoY2M/+7VF4WdCd27CsOmJdLAUw8qXPIbDkLNsy3esPgOvz5xaRnT0YP1LeDZj1/s
         7IMEXWWO/Vbb5IvKV2ty0kauYiQwJxukn4qRFmALqyJqFr3IYndV8fkj0Wsp2hYkHLVx
         Xj2Q==
X-Forwarded-Encrypted: i=1; AL+hErFwokrysyizoydXKj8nso5U904knbr8jirJR8QcIbD+hngaK47quQ92YW9CTZf2o8xRvCkLLv4K3TUrWm4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jxUdBXSqXlFahcTjuQ1rTIiDpLIXMvtiw/SJEs3rv/xINdFvX
	PywlEiwKYgCcNjc6dMrBWDSJvjqhOc8rRWnqyuHdZXuySMQKcz+/HVKm
X-Gm-Gg: AYBFou0L3xciu8kp0bbQljeFf3h4GC4ZEl7dpOTI97Jkk3a8GEyJtMjF5+IGG0G+aKQ
	Q8e6XMsWW/NRqvds689X7RHaHSjN/rzV/9LLV7wHxguQyffXysV4D9JH8TOC1bMoOQz/KncEPAa
	VAFn5sLJU9XDMBQ9XsUXIzIjcrmvIZVxW3wy9e9P6vL838ZJRKmjqcEkbtv7nXCKHy4VIyqPRo7
	LFVkH9MFvUVSyObLiq+7zxzveMFqS5/2MaNawhzqzIfit35UQ8TCu/r9fnVDuPQA5PR2RlrPOPs
	ZgcNtwn1598G4GCTwA3o2OfUysvxHDrDjlSEt5UXYa15KPYLfms64fErvCyEeXaXFzfcj08f/bt
	wFBo6+vI4lOiNeV60yix9qnaavzgPXDhJ6wDnKCpLjMvkEoOeiIrD0KGdjWalJkRH2DxAaubon6
	7VSKcZl+JirLJO4lx9SvXuyXykV6Yfa5GcYF+HGY55lAQEPzAomeDZV/OG6Y/cLYB0ASyeNKP8a
	kXo+CC2MoECXjxjCKdf1JdOGep6HXWDFVkkOouS2EFkgfmzGebOXYkJRVIPAobnOL3RluU33TKI
	ratrTzl0Ref/6YVBIBJMC8JoXoTXL1vc6p8uI4sCtpdZQwtmV46sJZFjVMSm2AXB2ojkZCGR
X-Received: by 2002:a05:600c:3b98:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4ba02351506mr44181675e9.32.1794310082728;
        Tue, 10 Nov 2026 03:28:02 -0800 (PST)
Received: from smtpclient.apple ([194.64.145.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0234a5dcsm58644735e9.2.2026.11.10.03.28.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:28:02 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH 3/3] media: verisilicon: leave room for the JPEG header
 and one stream burst
From: Sergei X. <shomenkow@gmail.com>
In-Reply-To: <d8ba9d67a9452bc44be219d5327aa9d7ad83275f.camel@collabora.com>
Date: Tue, 10 Nov 2026 13:27:50 +0200
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <46F3E2B2-AE47-46D9-BD41-6970B58763F3@gmail.com>
References: <20261109-hantro-buflimit-v1-0-f0b86ce61e66@gmail.com>
 <20261109-hantro-buflimit-v1-3-f0b86ce61e66@gmail.com>
 <d8ba9d67a9452bc44be219d5327aa9d7ad83275f.camel@collabora.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)

> +                     max_t(u32, pix_mp->plane_fmt[0].sizeimage,
> +                           fmt->header_size + 64);
>
> Did you mean to align to 64 instead ?

No, the max() is meant as a floor: the 624-byte header plus one 64-byte
stream burst. Patch 2 already rounds the stream limit down to whole
64-byte bursts. ALIGN(sizeimage, 64) would neither keep that floor nor
align the stream part, which starts at offset 624.

