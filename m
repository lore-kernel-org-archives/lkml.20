Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996F33264D8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788832911; cv=none; b=HUmRFVOik//mSpVHS4M/wnaodLcmikEkybRiguDED1okizht/Va/OzLQFmB5qGETTEZ5jVWt7VnkYvhrvWgAElXUYowNS8xTTXnZzubewT5mnetyoXhWDLOTE56shq+QSm/8z8KiKAApyrijKhPjgWLLOBBHHyjGyPIF9LKR8ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788832911; c=relaxed/simple;
	bh=pTwMML0rgJe6+QkcJd/cTu44v9vw01mO7xfgtNsP9Ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VYtv0GHeAzkW56ECdLKH0YhIE0TVHLCPMCfHscwoO7qpkHqO+sQL2YBFeHVIVbMnZS5gsT6jeNOIhch5hOfR9s00Yz36Poatxyi2uNc/7Ee3R5Z3BXvorU65u4/gtQAvzewjZhKF67aAkMuKeWApgqrvt39SZo7aIAdsKPerCmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIYXkrHY; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIYXkrHY"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso3276941a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 19:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788832909; x=1789437709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lQtJgjCSof81+IM6z9nQ97DYMO5DHbxfkW0pYQM3/KU=;
        b=gIYXkrHYfiki1Ec4bwm+BRx5k9SwAb19CbkSonXZVGGROl3bhgmB/Tub2PNpJmOVkM
         yfiElqFKbzhLXsQUws5O9NUpelv4HcTd+j0akcHfMpaFRiRc75BgA00ELdOhFNOF7R33
         AGcbkWJInX8lf0juswb+7BP+mqsrpcAXzAht3B+8CiWWMVkNPcQYAEyNjtp0cWdJaqt8
         zX4Ga28kjFL0yLKTSMXId89/TQQGJO9v7PsvhqetZxST0IxzST6QdL8TQZmjUuWfb7u5
         1eockqKkoVu1Kqx6+PR0sv5WJcZ3YP4RpsRwq9/EWL7b/gdLHCocrN26SelGZy8hF0x3
         9oCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788832909; x=1789437709;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQtJgjCSof81+IM6z9nQ97DYMO5DHbxfkW0pYQM3/KU=;
        b=nO4MOxxSikIP0AkAm7VgyixMNixj9o9xVap02VrAB1bPacMLEcCQiwRKRalUL4i99k
         hvF73Pl2XkZjh4jm5OGyDhjbtwhuGwgE+mFHES4UYf8Lshdy8d55cpK3hoPFlXdwegdv
         B7ynz8J4ON9eoYFC7DtKxcPFpBPlF80n/taydwtehXKJHIGjERUrI3sbzogQODKq4dgK
         i28XAd8Mp3AyBicf2J3iSVZVbb+teYDvlno6GMPjRUL2l3TqdPWysGhSt/Dyc+aeShkS
         UNLgqzpSFNkXQoayCUm/UgTscMGg1GecXI66yBNS72AqZ2rikNx6syOcnTFuGytv2ux9
         b0lA==
X-Forwarded-Encrypted: i=1; AKwUvBzvBVlCIHWnzi2wBGjK0yFbdMk89BzS72Xamof14iBFUfP0Z45VbkACljF9FkdwMmndCnRhpjZmviW9gWU=@vger.kernel.org
X-Gm-Message-State: AFuF++lmvywUyn1gXSD8SIT9fGcPPlFjpdTlKLTEDFbquVn2PfLebTsl
	8U1K/BsQ+uqpB2kUsnMQP/UoTOXD/o5HUv894bylxcHqhrzmiiE7cVUIOlvCuA==
X-Gm-Gg: AYBFou2RlMNEW6mDPYubzOy9gwFotNzQbt0145UJICKTLt8GgXFIbRbcC7Ni9SC6dOL
	opC+QueMCiXHURzG5Xp4XaWUJbCq5i8I2kCag8pAAlYS5SGK2QVBCAeZJZHW9+Y/c8D6qnKcJVC
	Bhca9j0h0kFAdFwvtnfVbSPTKoo8DtCFK+83mdaIzcFCDktZDlZxTMz/4xch6DJhGEDxHY7GK6w
	EBhsKW47VZTNNqXnUOptzQC3i0FXcQzZ4ug++npxD31P9aL3S8ADyr0KnDINmA2TCbS869s9ZSb
	T9VDdabMlrzTKeuHzW4O5pV5JNe/teVd5YlhtCY4Z/E2tOQmxbx6p8U8yr6oGyW7ZP0RGrUfpm9
	46IZL7NAD4jMw2fLYa11JjGhYiscRvihYxZxuH5scxtUdJlguJGJpI1RewU0IUl8C8t32HRoLul
	751477Q834LafrT+4xPPzIBhpyPRnZV44jkCn2UVEvoj35a9RuagslAxN5TCq0DIiwkI3gVnBWt
	MO0QVN4CBmwLpudIA==
X-Received: by 2002:a17:90b:4cce:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-39b260dd4e9mr42617218a91.2.1788832908836;
        Mon, 07 Sep 2026 19:01:48 -0700 (PDT)
Received: from [192.168.1.13] ([106.37.146.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db2d91341dsm36247545ad.39.2026.09.07.19.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 19:01:48 -0700 (PDT)
Message-ID: <7611bbd8-6241-46cb-b0bc-a4257277d98a@gmail.com>
Date: Tue, 8 Sep 2026 10:01:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: ov5645: Fix CSI-2 CRC errors on RK3576 after
 init sequence
To: hverkuil+cisco@kernel.org, sakari.ailus@linux.intel.com,
 mehdi.djait@linux.intel.com, u.kleine-koenig@baylibre.com,
 laurent.pinchart@ideasonboard.com, jacopo@jmondi.org,
 p.zabel@pengutronix.de, ezequiel@vanguardiasur.com.ar,
 mchehab+samsung@kernel.org, festevam@gmail.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@kernel.org
References: <20260826085432.1482348-1-xiaoleiwangxiaolei@gmail.com>
From: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
In-Reply-To: <20260826085432.1482348-1-xiaoleiwangxiaolei@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Humble ping ...

Add linux-stable in Cc list


thanks

xiaolei

在 2026/8/26 16:54, Xiaolei Wang 写道:
> On the RK3576 platform, after ov5645_global_init_setting completes and
> before stream on, the CSI host reports a high rate of CRC errors:
>
>    MIPI_CSI2 ERR1:0x1000000 (crc,vc: 0)
>
> These errors occur exclusively in the window between init completion and
> stream on. Once preview starts and the sensor outputs valid HS data, no
> further CRC errors are observed.
>
> Commit 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence") reworked
> the power sequence to properly enter LP-11 during power-up. As part of
> this change, the SYSTEM_CTRL0_STOP (0x42) write in s_power() was replaced
> with usleep_range(500, 1000), leaving the sensor in wake state (0x3008 =
> 0x02) from init through to s_stream. Reverting this commit resolves the
> CRC errors, confirming it as the triggering change.
>
> Restore the power-down state after init by appending { 0x3008, 0x42 } to
> the end of ov5645_global_init_setting[]. This powers down the sensor core
> after MIPI configuration is complete, while keeping the MIPI PHY active in
> LP-11. The sensor is then woken up only at s_stream time.
>
> This preserves all LP-11 compliance improvements from
> commit 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence") while
> eliminating the CRC errors on RK3576.
>
> Fixes: 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence")
> Signed-off-by: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
> ---
>   drivers/media/i2c/ov5645.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index c772ef6e51d2..be85e0155b81 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -351,7 +351,8 @@ static const struct reg_value ov5645_global_init_setting[] = {
>   	{ 0x3008, 0x02 },
>   	{ OV5645_IO_MIPI_CTRL00, 0x40 },
>   	{ OV5645_MIPI_CTRL00, 0x24 },
> -	{ OV5645_PAD_OUTPUT00, 0x70 }
> +	{ OV5645_PAD_OUTPUT00, 0x70 },
> +	{ 0x3008, 0x42 }
>   };
>   
>   static const struct reg_value ov5645_setting_sxga[] = {
