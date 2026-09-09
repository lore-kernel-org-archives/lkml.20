Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC4B2F8E8B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 03:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788924284; cv=none; b=AV0YIm5GWmVdtCRUda8tvaRA6XqOK1EouulWfyEDx+FqWo5bSfyS7ffpycNFQn4PhLglHPVtuaFB08kNDmvkVzAU0GteV1Y1JuAmMMOgu3DMPSsJGhs7iXBBetU4TkhoDrBZHq5iTe417CfDwVACNhConXPPEZQK1LSAG0J30PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788924284; c=relaxed/simple;
	bh=/jP3mHTH5BIVwVyKeHMr2s4OFPUoIcbazsD9x8qX6ME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDAjnqZwYLnyQhcsR3FlOUjozRfsvqBMGesVk58JLmqrTWaYaMizbussNIp6KFfQhnKvM/j2DBzkBZC9FkLCOO5KIXzkXsjeSQdh0EIDZ0MK/AzE3liS63ASFU95YrHfbpOS6YiWPGMs6Pwwgoai/GIcvf/5HqWuxEiXTtnr9rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1fRsTCN; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1fRsTCN"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d9004f39d3so64517135ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 20:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788924283; x=1789529083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5HwPXfl1lDwU7i8igvyJ9trv0hFhIKTFZrrxIBiG1ac=;
        b=q1fRsTCNp9NvGjuroeOSlz4SzD/8/1GrSNF/bvkGJhh3lN0WRSiLtO+68EZuOOJcWG
         Tntc45o+q26CApiA1aGjDwsQgV3HG1qZDV9GXgummBd3MIxf4YtF451mZX4q1HWF6bS2
         MXzrQkl0KZwiBwNpMRlaWL0QCk4UwRU10TwLTxFf3pwNfwN4LuX5S5BxrZcVZVRs5ojT
         s8zP5OXNdyO3+G3GPqNgTKyGdbzZUNSgQWrsRSh842n5dVLM7s+QzJK6VLAYbxDwq8a2
         fmXRLudjyHC4dZBUPFiZ+UnaFMAEUXbsi/mtdKArCEMTuMuSxKLvO8mqoG8D3MBdSvPY
         FwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788924283; x=1789529083;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5HwPXfl1lDwU7i8igvyJ9trv0hFhIKTFZrrxIBiG1ac=;
        b=N7bK+1biURxEsPduaapDpeLCDpMTSC1SSULXGmJnfGzRD13A5hhPcBmwnV3ITlCbBx
         O7sHOe/NvTFi9grE5rISQPwIoedFuS0qva4D9hC8UDrrckAsNQc9ucIysDDj9eAj4QZe
         gWgMfji9OfDAxaJ7CbxpC6D/zj+j9lZWjquplLSVbcoeOw4SsSCcGIzu9dyPWN+T0dKK
         Ncnv7EFKqkAVjlOYtiUuiX1s4YdvvCAJk7EgX2qAQ04Cks+RUJlKKrWf27q0n1toWbYc
         sEcJnj7TLcGNidSx3mJ6jHSrIZo9Mv1kzATdStjZHn7NVk6oj5Nniu/VLuerHv2FQzUS
         3jxA==
X-Forwarded-Encrypted: i=1; AKwUvBwH+qwZtUWjKRjHwX/ISglxMRcYmf3YU8Orx6uc159l9VNXgvQtI5abbazhu7hIGgekME1k5Tvcd8uIeog=@vger.kernel.org
X-Gm-Message-State: AFuF++mvnxmgUJ+LQc/qalh1DvGmAXelXM9pZ2iJuZ8n7mAusqZMOUt3
	u4DM82TUDan5GKjwZsGq91UMOs93zj3xsufG356tzTk6SH+tEEJtJZMg
X-Gm-Gg: AYBFou13E8rkeD7rXvX54syxFVbvOjmDciDnf/8BzN1d7lTuVgKJ8io22oazhSqczPt
	I8xorEg0bk5BSoEPqxIlfDQbVE1DOW98eq4xbVOLlyBEgcjpNYqXXQ47lH9t+rTe9xmaeJSadif
	zanIk//mBq256Bdl+twNmRCLhlfP1VK7Ce4Qbkt6M6I/TjFPMnjLSr8Tj6qxqqAwhM9WnO9f23d
	MEhun0tDNWYdvcHdxAAEcQ1wNAduOgSj0dgV3DH9Etz250cjNfgm24NYwioBvlorzuIINy0J98b
	RQQGaQZNrYwAboW1VMGP96vst4BE99QCcroEI8n1LXocYa3YCbn19rFFpSNJQLYrJGOl8nH8pnt
	fuQIZhRdC1x47osTA9S+qsvJViVFP8QhlvqRhDhKKKWMGF/OJkRrDqkAUl5DJh7U99E0RDlPrRP
	d501LKNkBZliDpxFzVNp+HNRpO1TS1km852xL9lcyffnmuUdsiLRKczGkw3ON4umqmh0jqvmeqI
	0+vuQfsxw4ObDu4kGrLlYtrOTPx
X-Received: by 2002:a17:903:910:b0:2db:5c0a:f184 with SMTP id d9443c01a7336-2db5c0b1641mr207897155ad.17.1788924282897;
        Tue, 08 Sep 2026 20:24:42 -0700 (PDT)
Received: from [192.168.1.13] ([106.37.146.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db25ea9bdfsm54747985ad.75.2026.09.08.20.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 20:24:42 -0700 (PDT)
Message-ID: <c43c24ca-7add-4197-811c-19b42aff7a95@gmail.com>
Date: Wed, 9 Sep 2026 11:24:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: ov5645: Fix CSI-2 CRC errors on RK3576 after
 init sequence
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: hverkuil+cisco@kernel.org, mehdi.djait@linux.intel.com,
 u.kleine-koenig@baylibre.com, jacopo@jmondi.org, p.zabel@pengutronix.de,
 ezequiel@vanguardiasur.com.ar, mchehab+samsung@kernel.org,
 festevam@gmail.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260826085432.1482348-1-xiaoleiwangxiaolei@gmail.com>
 <ap_gCH1AnciFIEoa@kekkonen.localdomain>
 <20260908103600.GF1672293@killaraus.ideasonboard.com>
From: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
In-Reply-To: <20260908103600.GF1672293@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Laurent,

Thank you so much for your review.

在 2026/9/8 18:36, Laurent Pinchart 写道:
> On Tue, Sep 08, 2026 at 01:14:32PM +0300, Sakari Ailus wrote:
>> On Wed, Aug 26, 2026 at 08:54:32AM +0000, Xiaolei Wang wrote:
>>> On the RK3576 platform, after ov5645_global_init_setting completes and
>>> before stream on, the CSI host reports a high rate of CRC errors:
>>>
>>>    MIPI_CSI2 ERR1:0x1000000 (crc,vc: 0)
>>>
>>> These errors occur exclusively in the window between init completion and
>>> stream on. Once preview starts and the sensor outputs valid HS data, no
>>> further CRC errors are observed.
>>>
>>> Commit 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence") reworked
>>> the power sequence to properly enter LP-11 during power-up. As part of
>>> this change, the SYSTEM_CTRL0_STOP (0x42) write in s_power() was replaced
>>> with usleep_range(500, 1000), leaving the sensor in wake state (0x3008 =
>>> 0x02) from init through to s_stream. Reverting this commit resolves the
>>> CRC errors, confirming it as the triggering change.
>>>
>>> Restore the power-down state after init by appending { 0x3008, 0x42 } to
>>> the end of ov5645_global_init_setting[]. This powers down the sensor core
>>> after MIPI configuration is complete, while keeping the MIPI PHY active in
>>> LP-11. The sensor is then woken up only at s_stream time.
>>>
>>> This preserves all LP-11 compliance improvements from
>>> commit 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence") while
>>> eliminating the CRC errors on RK3576.
>>>
>>> Fixes: 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence")
>>> Signed-off-by: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
>>> ---
>>>   drivers/media/i2c/ov5645.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
>>> index c772ef6e51d2..be85e0155b81 100644
>>> --- a/drivers/media/i2c/ov5645.c
>>> +++ b/drivers/media/i2c/ov5645.c
>>> @@ -351,7 +351,8 @@ static const struct reg_value ov5645_global_init_setting[] = {
>>>   	{ 0x3008, 0x02 },
>>>   	{ OV5645_IO_MIPI_CTRL00, 0x40 },
>>>   	{ OV5645_MIPI_CTRL00, 0x24 },
>>> -	{ OV5645_PAD_OUTPUT00, 0x70 }
>>> +	{ OV5645_PAD_OUTPUT00, 0x70 },
>>> +	{ 0x3008, 0x42 }
> While at it, please use the register macro.
Will do in v2.
>
>> Is the earlier write of 0x3008 still appropriate?
> There are four earlier writes of register 0x3008. The whole
> initialization sequence likely needs a cleanup.

The ov5645_global_init_setting register may come directly from

the manufacturer.

  I gave this a try. Three of the four writes can simply be dropped,

   leaving only the { 0x3008, 0x42 } near the beginning of the table:

         { 0x5a24, 0x00 },
   -     { 0x3008, 0x02 },
         { 0x3503, 0x00 },
         ...
         { 0x0601, 0x02 },
   -     { 0x3008, 0x42 },
   -     { 0x3008, 0x02 },
         { OV5645_IO_MIPI_CTRL00, 0x40 },

I tested this change on the Rockchip 3576 and IMX8MP platforms and found 
no problems.


>   It's not clear why
> software suspend needs to be disabled briefly during initialization.

Yes, I noticed that the driver was configured with software suspend upon

power-up at the initial commit.

thanks

xiaolei

>
>>>   };
>>>   
>>>   static const struct reg_value ov5645_setting_sxga[] = {
