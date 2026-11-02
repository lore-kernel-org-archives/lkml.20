Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626844;
	b=bVq3CekpYfHhGpoH3uTvnYEFiBgevre+IZBxnyyoUcwn00r/juVVMd49ySb65i1g7vFA
	 W44Kh/5inGf4Rh6kk3my03KRcEp/4xsQcMOfA2qwdAyUsQiSZJrpUwK8LIw5zncbND2nV
	 VvflDDtLqn85LghY1xhI04CnCWH8yYkibRzrv2c4v+tWkGhbtj7v2IzSlMZtzfyrzlox1
	 TvJpnoaKIjScoMgR3vkGxAReh45vzPRjTFFNbSwxrsZ9APpAq9CaU8sIbgMUglZ0sMLfg
	 lkw09WUjB5yaj6XKhierX1AZVAqxfnxTaSqUfFNZUc3HtNWnD0k66ekD34BfD9lNwJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=oCuAPCpAXOO6RuODfwfptklGCvaTyAJZnsj2ANQ9dHM=;
	b=qkXXHwDgWg4P5UbfTkRhbjwav4sNnfexq+48SXRQMMCl61D8X6cY2l+W/118BfaHz8R0
	 EYdrW0sCOiAY6an3hJMUSSPGmrOJIKX7ACxkcXeAInH88PVHiTbRWzoQU0r11UXbMNwqz
	 U0fgY6Ve28SKyv6N/F8UrN4fSkKcGjjyukh7R8Bs6nWR1rsj3yZ/2deMi8W21pZYB+2nn
	 1/qS4itjcGML66YiNyR70tVtBcoMLcu9ZFDNm3h1LaVdFFWDjGYXItbnUD7pauz5HlWg9
	 hjP/hUKGxyds+4DI+it0tiV9NeNB5U2Lac1fxvByrOuVYn29u4wdRvHpbKA+bpc3SZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aKVbvr2O;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109C860A3811
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 109C860A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aKVbvr2O
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso2116353f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626842; x=1794231642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCuAPCpAXOO6RuODfwfptklGCvaTyAJZnsj2ANQ9dHM=;
        b=aKVbvr2OSePQTPnByD3QDk6GBE6cccLpOEJ8xqmdxzIixkzl6289cv3/2LSFWw9LrT
         G2LEFjTSGdtVRA+HSG4m130NtMBLAx+jrKgfaSLgsdvG6bVX1VmCy8x/FnIA9ndPwnRO
         Xap4D+fMO1+Fzrjzpbtkey/xpn21eDM2si0Q/ZzKUm98cgB7a+eaK17KFXpLIsC9YY1V
         jGIKJbR/TDBAGQU2EY5TdLvbWmwNKMb9Uz+xAtmylBS7OtPGE1uLKEVu7/oj3w8idYXG
         171XHd6IdmJXPvGF4jYhcEA9BTPnjaLMM6shU8u2fi01mQlOrh1l5sOoQMvpBgraZZVl
         o3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626842; x=1794231642;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oCuAPCpAXOO6RuODfwfptklGCvaTyAJZnsj2ANQ9dHM=;
        b=P64LnzMNlPq89QWqomwkYT1VmQXuMfm6qoCOHJiRG1olRevq62p8akVoiXR0iLuAXC
         KRozmBsxWqkA9InNkfl477G1G/7jQzMz9XpRzqx0QspSbBpNExdtuIwSIhNtRH2TcNC5
         f0hhqixbjLlOSFFpbsCMMMotyrbSe6DJA+LdIU2FcPfbMqzbT5ZoyEaPUim9UhMQcjhK
         6OVxz6kO5viFGLF0IO+K3w/eK2yN2KAVkzxq3iQeMMCoaM4R9D7dXUAxdCo4NIsj/DaC
         lKtapNc1fhv/XsjlC4/mUzujJZhsluE8RZyIdgJeqA6ADeUOtzrpwbEyBCBW+JhJWmxY
         +Znw==
X-Forwarded-Encrypted: i=1; AKwUvBzmZsutqUAmVErwEzZcgqa9UDk5tfFyQNp+hIcQ5i21Lz0frQGx1Jcv8ViK1T4w/aRgxevhdVcQOtpKIJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcjYn64baXIzk3GWl1dvCgJ8/IENTqgIeay7XExLyJkmmlnRi+
	kk1lIFXXsOSTJibzqgEtIyZiTTYK4Wa6rOJKw6yGSzyYmHcj67ZnzrRPn6WGO6KYVeU=
X-Gm-Gg: AYBFou2CCrJTHYAt4jetaJU1m3pWZJXs4vyF4XRWVb1s1jbejEbJpmgeUIz8Dppw0xl
	0TinO0L/aOTW6/5W0+v76XaFqfEJX4FgW+SU4VNJR0OThatYZ1Rs5qcNqaHUBFbUkjiNve7bkTl
	q8hf8mw8rTpTRNEf4gKCTQGAadQpV93fhqa99dhxpi6U1y5AdoTartYhZ/qQthd2v8xciN86P4H
	1VnyCwuuXoZxjF5wBVcKGhYU7Jkzs1EQ/u5+NxHH+fPTZYIYL3dZ7YP6uqA3xNUD/sFGKRwMEwm
	DBkJPHHNM8wifAk9Qq5BZj+KTwWsqwJl6JoVAE+Dh3O40rBw482Z+NEX6wXboHLjGj9gejb+tiY
	StP7w5xRrJtilu5bzCQSIdhkmXJr5tZ/ATsF/mxRV/viNsAXyzPvO2spUGzD5p1nwzsykgkiuCX
	khnvqZ1a6jhMQ2kCjiC9SUpq8ElmQcl+klFDJAxQEUF4ucA8COgAGrsw0Bgsr4eaMcee5u9tHM2
	fmcUPSx7gDMu9G9MYhLQ81WDVW1WL/x/x+5xtgCvaH7n1SaIcAiydiIW0VuUwKVrihGCSUOdYCj
	vBa1IoxYpw0iMbNbNdXVIjlAlfzSGPIKAx8x1rLiQjcJnW8JwoHOiZ1gR2jm3ybR2oay/fc=
X-Received: by 2002:a05:600c:34d4:b0:4a2:d7e:5ccb with SMTP id 5b1f17b1804b1-4ac182dca99mr253947035e9.15.1793626842344;
        Mon, 02 Nov 2026 05:40:42 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:41 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Asif Ikbal <asif.ikbal@amd.com>
Cc: jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 thierry.reding@gmail.com, sam@ravnborg.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, git@amd.com, 
 michal.simek@amd.com, naveen.gaddipati@amd.com
In-Reply-To: <20261016094638.2958431-1-asif.ikbal@amd.com>
References: <20261016094638.2958431-1-asif.ikbal@amd.com>
Subject: Re: [PATCH 0/2] drm/panel: simple: Add AUO B101UAN01 panel support
Message-Id: <179362684137.3310106.8150068163787237277.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:41 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Fri, 16 Oct 2026 15:16:36 +0530, Asif Ikbal wrote:
> Add support for the AU Optronics B101UAN01 1920x1200 10.1" WUXGA
> MIPI-DSI TFT LCD panel. The panel needs no initialisation sequence and
> uses a single power supply, so it is added to panel-simple and
> documented in panel-simple-dsi.yaml.
> 
> The mode is taken from the MIPI interface timing section of the
> B101UAN01.7 (H/W 1A) datasheet and gives a 60 Hz refresh rate.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: panel-simple-dsi: Add AUO B101UAN01
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8f900e88c5450a40ef205f8e07ad32253a4ff7d5
[2/2] drm/panel: simple: Add AUO B101UAN01 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/21a19944ab649cfbba0c5feca21f5a000b36dd6f

-- 
Neil

