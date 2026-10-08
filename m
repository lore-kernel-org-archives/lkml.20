Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A95D46D567
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447908; cv=none; b=r5ojqmp/zjCNByTt9olaXgMgJLDdnt1+gCzta984uxz3LMDeWyr6AV2KDRC+QJlcNjI4Jnj46qEMGF3V/voFGaT0fKH75ThQpU3CWJ4nVj/T3Qq89EfZlOYxbIGn88uIAegLHZnRIy4XtwQxlwlda3kl8Y72znceJZ6iLIu13c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447908; c=relaxed/simple;
	bh=k4EH924NdUEPU8L9M6Y1T9XBlcq8j4usVoJDeJarmuI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MfyGI/8o65GMtYma+W/WZxzDMH7jd2qEnqqUor4lu73I8eOHhL1J/7jo+IinhngEndxUbL3pd5JZKeFEgk3i1+xyIZr0aGnVBc+LxefP37uVHCpjG4QCWlLxXehiRfMK6O07aurXroNKMuwK4Q9Bg4FLeQ32SVLiRFkikMrquDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OOPjs/17; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OOPjs/17"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2886118f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791447905; x=1792052705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W42EnwmE67etDA5kP9Ha0QuiGDOcv6prx44pdv7jZT8=;
        b=OOPjs/17rAgSBoHvE9NGkQOuiDCVlTu4oMYsXCPPSPHNTUMRr0gYR/ETJJYJziCoQX
         smBmm8bbNBczOWQ2vJoD2rYIQQ8gn6K7vkeNfixLNSXo1DijLmB3X1Z8P9vtO2fYLQPE
         lT6vznhaoKCnqhxEMQOzUxma6QlxaF2k46wMUy9ms7FPjBFhGeQHMuvI0lQgNhc/nPYv
         ShuuJMo18wNYJisEZPk0t76lfWiSbUOORWD6NuPZmVeMnNtyCqojv2neR7zFRtCz22/U
         mdMoIJZ/qPvXzmkLJ8ZwOebw6O4Eam3qJQyRDSVy51qXNSNsFlWUogl3tJq7zI69ZXmx
         /RRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447905; x=1792052705;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W42EnwmE67etDA5kP9Ha0QuiGDOcv6prx44pdv7jZT8=;
        b=W6lodgolPotSI3pjYNX5ckihA01+l1vpOOMed51IrQRZuqatFYlKs80nAjU/BeSi7i
         ktGlRbgY7v47kHueUSQe5F/6hKKlCNUUnuTynr4zPRhb2Z4cks6rVd4GSCiGzj6YfB1d
         enUDpPHL+uw5qrNCcU+8s21zcR07t6/Q56BLon9YueFUHDHEUK2OkVsDKLJvPe7XY13+
         M+chx5YcpzX/48nIdxNfwJSlq9p7yGXMZtL5ehtwsDVEK5E9X+FC2BOiNahGhcy0oESO
         UCdWt0g1BrXzcXI1dzXWh1d8bfTVHBCFZA5mpePCDIvtpFx2vGBhoh+hE5IAtVa2YUti
         jjRg==
X-Forwarded-Encrypted: i=1; AKwUvBx6+KauoMXIfz5zTqolzuhaS5sSI10HaVUY1qjHwUKCFvuhb+c8OdLGh+LD0YY56RKTNtf48STyQEnoa/A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhyTcW12OVJ2/6l2rS0aPzQq8cpkw7V0G4Rd5BGoOoUkHReQHg
	J/yR8aw6vDYwEx+GFBQtgH0McVoBBsI+CwmXZLx++EbCe7UVwGtuBAc+pA/hq+mkAsA=
X-Gm-Gg: AYBFou3Bzk8v+zCVcSsr2EtHwm6n1erryAyO3gFW2luURrvGyWJief6hROiMC1ubqU5
	Pwy7YzV2Pxl3KFsRDOB7epmpwOdEDgAouq2Kd852IF5LUi33WNZe7GpIju3O2H433YcJGayc7Es
	iqCQ//vA6f125LmkUKBy0G/hsZxpFSppUl0VbxrGRQ34qn2pMKJy6cp9kDAOTBTEInZcrrXF/ZU
	dgQvtAlS0QoUep0S9agtIGuvRRxAkSlBKVwKggxrfFx9THxVTQuOmvPie211DVMnUnpMnMI/EgZ
	y9k4ax8jbS3wIsexYZe+Z8wPGixnvsyI4lVKBVimA/bbcIds29XjmcFbG69Uop6de6KarnBCaIq
	U6aeSCMyfPKbi3dQRcyU/PR3HEVqIcduqS9Bka7/ojTLalrXESEnkknmqP3i2KVD9M1q4F6p4f0
	OabvRc7oAEVQHUIRsmxoMqUbeJehobPto7ZSOE28M/5Q0o3o2co7fPsqwsTrwheLCo8hfUymICK
	ukDKnx+vVPSDQ6Rp1QBVs2I3kXR6iY=
X-Received: by 2002:a05:6000:4818:b0:488:8751:e78e with SMTP id ffacd0b85a97d-48c72788373mr8448347f8f.16.1791447904535;
        Thu, 08 Oct 2026 01:25:04 -0700 (PDT)
Received: from [192.168.151.76] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2044fsm10204091f8f.31.2026.10.08.01.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 01:25:04 -0700 (PDT)
Message-ID: <2c1dc2eb-4404-4985-8263-22caab44485c@linaro.org>
Date: Thu, 8 Oct 2026 10:25:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/4] drm/panel: st7703: Add DCLTek 300248 10.25in display
To: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, =?UTF-8?Q?Guido_G=C3=BCnther?=
 <agx@sigxcpu.org>
Cc: Ondrej Jirman <megi@xff.cz>, Purism Kernel Team <kernel@puri.sm>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
 Felix Boucher <felix.boucher@savoirfairelinux.com>,
 Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
References: <20261007201859.3709656-1-marc-olivier.champagne@savoirfairelinux.com>
 <20261007201859.3709656-5-marc-olivier.champagne@savoirfairelinux.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261007201859.3709656-5-marc-olivier.champagne@savoirfairelinux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/26 22:18, Marc-Olivier Champagne wrote:
> The DCLTek dt300248 is an LCD panel using the Sitronix ST7703
> controller. Add the panel to the driver.
> 
> Suggested-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> Signed-off-by: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
> ---
>   drivers/gpu/drm/panel/panel-sitronix-st7703.c | 97 +++++++++++++++++++
>   1 file changed, 97 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index f4635a7327de..b3abfe8c9ed9 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -768,6 +768,102 @@ static const struct st7703_panel_desc ayaneo_pocket_ds_lower_desc = {
>   	.init_sequence = ayaneo_pocket_ds_lower_init_sequence,
>   };
>   
> +static void dcltek_dt300248_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
> +{
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETEXTC, 0xf1, 0x12, 0x87);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETDISP, 0xe0, 0x05, 0xf8);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETRGBIF, 0x10, 0x10, 0x28,
> +				     0x28, 0x03, 0xff, 0x00, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETCYC, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETBGP, 0x0d, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETVCOM, 0x6d, 0x6d);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETPOWER_EXT, 0x25, 0x62,
> +				     0x20, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETMIPI,
> +				     0x33, 0x81, 0x05, 0xf9, 0x0e, 0x0e, 0x20, 0x00,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
> +				     0x00, 0x91, 0x0a, 0x00, 0x00, 0x01, 0x4f, 0x01,
> +				     0x00, 0x00, 0x37);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETVDC, 0x47);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_UNKNOWN_BF,
> +				     0x02, 0x10, 0x00, 0x80, 0x04);
> +
> +	mipi_dsi_msleep(dsi_ctx, 20);
> +
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETSCR,
> +				     0x73, 0x73, 0x50, 0x50, 0xa0, 0x00, 0x12, 0x53,
> +				     0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETPOWER,
> +				     0x25, 0x00, 0x32, 0x32, 0x77, 0xe4, 0x77, 0x77,
> +				     0xcc, 0xcc, 0xff, 0xff, 0x11, 0x11, 0x00, 0x00,
> +				     0x32);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETIO,
> +				     0x10, 0x00, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0xed, 0xc5, 0x00, 0xa5);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETCABC,
> +				     0x10, 0x40, 0x1e, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETPANEL, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETGAMMA,
> +				     0x00, 0x13, 0x1a, 0x2c, 0x34, 0x3f, 0x4f, 0x3f,
> +				     0x06, 0x0c, 0x0d, 0x14, 0x15, 0x13, 0x13, 0x11,
> +				     0x19, 0x00, 0x13, 0x1a, 0x2c, 0x34, 0x3f, 0x4f,
> +				     0x3f, 0x06, 0x0c, 0x0d, 0x14, 0x15, 0x13, 0x13,
> +				     0x11, 0x19);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_UNKNOWN_E1,
> +				     0x11, 0x11, 0x91, 0x00, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETEQ,
> +				     0x07, 0x07, 0x0b, 0x0b, 0x0b, 0x0b, 0x00, 0x00,
> +				     0x00, 0x00, 0x2f, 0x04, 0xc0, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETGIP1,
> +				     0xc8, 0x10, 0x0a, 0x10, 0x0e, 0x80, 0x38, 0x12,
> +				     0x31, 0x23, 0x4f, 0x86, 0x80, 0x38, 0x47, 0x08,
> +				     0x00, 0x0c, 0x04, 0x00, 0x00, 0x00, 0x00, 0x0c,
> +				     0x04, 0x00, 0x00, 0x00, 0x8f, 0x44, 0x60, 0x28,
> +				     0xba, 0x02, 0x88, 0x88, 0x88, 0x88, 0x88, 0x8f,
> +				     0x45, 0x71, 0x38, 0xba, 0x13, 0x88, 0x88, 0x88,
> +				     0x88, 0x88, 0x00, 0x00, 0x00, 0x01, 0x00, 0x80,
> +				     0x38, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETGIP2,
> +				     0x96, 0x18, 0x00, 0x00, 0x00, 0xb4, 0x01, 0x0b,
> +				     0x41, 0x01, 0x02, 0x00, 0xf8, 0x43, 0x17, 0x58,
> +				     0xba, 0x31, 0x88, 0x88, 0x88, 0x88, 0x88, 0xf8,
> +				     0x42, 0x06, 0x48, 0xba, 0x20, 0x88, 0x88, 0x88,
> +				     0x88, 0x88, 0x23, 0x00, 0x00, 0x00, 0xd7, 0x00,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0x00, 0x00, 0x07, 0x8b, 0x00, 0x00, 0x40, 0x80,
> +				     0x81, 0x40, 0x80, 0x81, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_UNKNOWN_EF,
> +				     0xff, 0xff, 0x01);
> +}
> +
> +static const struct drm_display_mode dcltek_dt300248_mode = {
> +	.clock		= (440 + 8 + 32 + 40) * (1920 + 41 + 8 + 6) * 60 / 1000,
> +
> +	.hdisplay	= 440,
> +	.hsync_start	= 440 + 8,
> +	.hsync_end	= 440 + 8 + 32,
> +	.htotal		= 440 + 8 + 32 + 40,
> +
> +	.vdisplay	= 1920,
> +	.vsync_start	= 1920 + 41,
> +	.vsync_end	= 1920 + 41 + 8,
> +	.vtotal		= 1920 + 41 + 8 + 6,
> +
> +	.width_mm	= 58,
> +	.height_mm	= 253,
> +	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +};
> +
> +static const struct st7703_panel_desc dcltek_dt300248_desc = {
> +	.mode = &dcltek_dt300248_mode,
> +	.lanes = 4,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO |
> +		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		MIPI_DSI_MODE_LPM,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.init_sequence = dcltek_dt300248_init_sequence,
> +};
> +
>   static int st7703_enable(struct drm_panel *panel)
>   {
>   	struct st7703 *ctx = panel_to_st7703(panel);
> @@ -1026,6 +1122,7 @@ static void st7703_remove(struct mipi_dsi_device *dsi)
>   static const struct of_device_id st7703_of_match[] = {
>   	{ .compatible = "anbernic,rg353v-panel-v2", .data = &rg353v2_desc },
>   	{ .compatible = "ayaneo,pocket-ds-lower-panel", .data = &ayaneo_pocket_ds_lower_desc },
> +	{ .compatible = "dcltek,dt300248", .data = &dcltek_dt300248_desc },
>   	{ .compatible = "gameforce,chi-panel", .data = &gameforcechi_desc },
>   	{ .compatible = "powkiddy,rgb10max3-panel", .data = &rgb10max3_panel_desc },
>   	{ .compatible = "powkiddy,rgb30-panel", .data = &rgb30panel_desc },

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
