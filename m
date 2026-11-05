Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793889383;
	b=g1NQZeQlE+g206op8kU9+01MYgn62ZPNQGjlNJd7FRoxXWGeUoGNqz490iYf0TN3JGiq
	 UZKxg3Oq8tHrUJKmnG5wslmM4r5R+mPwKq+EvI/H5/8rHomi72giX2KBHOLWGCFIueR+p
	 cdCFcDVc7q/Bw0MDOwu1VWtIebAAR1PnBF5KOr8uNoR3O7RSiTO9ZPKP+9B6NIzapn/pp
	 3Q2QOu8moECQtJHDoyhciZ8njGNxYNrJBlDA2E4MliAbJju7waWE2Lzw8u0zzerbywx5n
	 qgYnZsKRuka6b4FJlA8GmSnhgjecTbOpi8Xl6j9TiFlMJXTNAV6D4W3bg4pnaFuS4RA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9Ymc+4AQvzzaiCWsBbLGU5SMznTThrS02qv+sUCHS1I=;
	b=H8KuQXXMpy+eNBjl6PfbJc8Px+4kPNErQiqm5QGMYgMPRsE2tl+3pJ4Oo86bC1DbRZDZ
	 ORD3B7IlqKSx4U4RnephmMOmkqy8fs6SfCt9myeUTVWXS5BM+F3RC6KEph+kwCht7MLJN
	 feWELFPTV1BqO27Jr72xEJyedT7Se5lSePJZ94jds3N39wt8tkqD1O+Xfi+bQ8TFt1nxl
	 N1dA2sDwpzmE2Dl838snsGLLlgBfad7oODu1EhClMpKJ4OWRIuA+hGV6T/gQy5fyYMdwE
	 rex4kx1tuvXTeH9CdqE1mUahq9uU7c/nopT90v3BrwgX2Ki1W4UTj616SnY2aBtOWNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=EAXbRDD8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7EF606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A7EF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=EAXbRDD8
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so2286553c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:36:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793889382; cv=none;
        d=google.com; s=arc-20260327;
        b=D7EZrwogmX29+ZwmA/HnXAGMnhAk5KWwqTi6oBO0CW6T1ZbVuu/bv2oZ/sWeAkQA+A
         PjcvgKw17O/tVc0VKjHRVogNTGX4WqYtuUEvBxxehugFXZevZlQu8cFSoTBT5AWQ8j+Q
         vL7UWh5HeRBS3EW9cm0vKfeRDAblos71QfgaWM49wAJuLKR8VyA1mVtEYQMu6Skt6my1
         efm8LqENoojXQK0lY5HcF1jAdbw4EjMDQUH8AQ9jovcf0rTyeyn7pjYmxsIQ7m1LXRwb
         RTsSVE9Egsd0nU0BkV/pOhdonCK8WV3SAI7WTa1cy5e0GqZsFFdrnHfMdFREQrMNbCcN
         1z+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9Ymc+4AQvzzaiCWsBbLGU5SMznTThrS02qv+sUCHS1I=;
        fh=Sn2QEI6kFv2WKf9DHVoZd/bx3Xfjtkb+Ym7woO5Xnyw=;
        b=KZxFhX65CBVo9V7LhtSXvJB+ijiYeOFJi2QCHMdEsbaxJz2M/beu+sJVnSX3W3jsX0
         bWtebJJSNUlxfl30hySP6Drm3bcRWVr3AUIESo0EkQ8ak5ORvvSAvHKykrgMXmEbHzV+
         Gge1L3N+y4AiweM6cbwCF8SsXWFxYaiTds8ihtIOkavCabUXWoaxzoTy+RGQTtTl4UxJ
         EiovzpEGwr/JU7I9L4pkfVO5gzCqGpYdFqSvQbOx5srZVTLgNyJbq6WQmctM2naRU3md
         VjQ4ibGnbXoWM0l3mdgqeQZPTOBSBCC82SbZC/0FPtDcTtVcCr5CCKpbPKz7g/w4kjLb
         eM0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793889382; x=1794494182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Ymc+4AQvzzaiCWsBbLGU5SMznTThrS02qv+sUCHS1I=;
        b=EAXbRDD8sPltHa6XBhqWXbkrc/ZC+i4CS8Ku8plXQaYf9QBBBm8zCzj3beJ+iJb2M6
         RzFCTpcS26U+H7+lm7nBXNGZv997OUq3zjfI0F8WpsKODOSx1VtIXWh5/X7ZpcFRrEZ1
         620xnHa0XpczouAPiQKw6Rk0Xbl8qs46GMJH6i29KDAF0o4qzMclxnWoNqlG/FaJGir+
         RVDs3YH8D0jXXC030fdhFYRHjR8f/FBoCXn3qo4W5adV4fP9YTB7aqu7/kxNqVXjzx/r
         b2NDGAEUono/OKX+iSNxKYgZPf/pVrsqDl1u//0+il3RYD/eZ9BbnkEvsG87ZeDylPH2
         A5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889382; x=1794494182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ymc+4AQvzzaiCWsBbLGU5SMznTThrS02qv+sUCHS1I=;
        b=u0bWqYlARmdl6mq+gk5Gagx/vqPxqnxe29dVEdbb2lF6mtlOP97d0I74H4N9bD0jqh
         a588zOKTHuiWBLLDfLIuUyY6Eug62UU6Kgc3VawFYKRfCAkD7jMHuHxx5QHtgmKWCCKG
         oQVzyM5RCa2HsY64VDzD8qRZlh9BNpc0AvbOJ5t+8eSAcr68TE+LCY3nZpyoDQygbW0C
         vsGJO9yIFXX4Ne7IqzkKxmEG9RSsvGIG7kwIQPGj+ESeKnej/HXxFr5+27cK4e2pt9xW
         7+Nedui3iBKVf5JV+TUhIblKk1uL6WtBWCFNmvTV3d9y+3RHdu6+8uJfsT0RYXG5eT1S
         3q0Q==
X-Forwarded-Encrypted: i=1; AKwUvBz8Y/xjqgu8S7awXaZkRvZrfRiwM6dPopayAPt5QHx2pGQFK8f3MPbhkLBjD/hHCMoA81A7sJHsB/IWKiw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wnvueBCMnfgnlMGH0kizN5poXw8B65c4xi62MguI9hqxxcch2
	MGZYVNdBOWU6ZrDUV/DBCjKeolXtqHm0odRLICgByzrTPcYih9ZRr8arM1IEfwKimoKtDf+1DmA
	+KdJU/DSD74I6hzVQgtTXcZW4H529fstJSMFrCPvFnA==
X-Gm-Gg: AYBFou0YCpCliotxn1Gp6Chvp5nEs+QTHO2CEt/+F9e4eRAxt0YXZaPNgixZ3U8ufaK
	xDMlseJsdUhQoLuKlvFE6yOQ8BqY+T47s4iBORXIZUyW4gk9Aixs8v02WZWVtCbVA+L6e7xpa58
	TbI4I8cRWxbTg5qQO1OJRmiFzSN842a9zV18EZZp9+GuU/yS3qlacsn35XHm3N3tWcUmGjbL2Pc
	OBBFGylqKyJRVlDeoNk2xgGNZyxKxn26cFH0ffDqmjt01vpD/AuSTgoIH28KOLbYtcEcelYJQ01
	x3E4GIr8LYsxp+4fIkgI1ROp9EWnTWZn1XMCSMr+ZkBs5Uadix7l/mMXBy4ELDueAEBm7cOkF5b
	luICjpDqQIzNhuhNSwvQ7z1LdzOjyQZlDQ/M8
X-Received: by 2002:a05:701b:454d:20b0:1b2:3b5b:b80b with SMTP id
 a92af1059eb24-1b23b5bb847mr12680614c88.8.1793889382405; Thu, 05 Nov 2026
 06:36:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
 <CAPj87rMQdE3eeUxGSb4oQfB4Adry6UV8CvhGoTKtdKGQHdSo4Q@mail.gmail.com>
 <81fbb960-abde-44ea-82ab-3adc054da836@collabora.com> <34506010.aRNtrjHk3s@diego>
In-Reply-To: <34506010.aRNtrjHk3s@diego>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 14:36:10 +0000
X-Gm-Features: AclHuK-P65od5HCTUxTkNtF8XI9WRdmLEVnuoZ_IAiO-y4WkOrppI1hKYcCtIdc
Message-ID: <CAPj87rMyMB05OTMDLSPe+oDZJYUW=oHF9E-f2LaTPCsBrKAAhQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] Support 10-bit YUV422 and 8/10-bit YUV420 color
 format on DW HDMI QP
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Sashiko <sashiko-bot@kernel.org>, 
	Igor Paunovic <royalnet026@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Nov 2026 at 13:22, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
> except patch 9 of 15, or mail hasn't turned up yet :-)
>
> It does look fine to me, but if someone has an eye to spare ...

Nah, I just forgot to send the mail / was waiting to send until the
dclk reset thing was fixed (I forget which).

Either way, it's done now!

Cheers,
Daniel
