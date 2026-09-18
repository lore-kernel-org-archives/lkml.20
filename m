Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3CA3D5246;
	Fri, 18 Sep 2026 06:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789714720; cv=none; b=NsjpkjcczymimBFnyxr1pnTWZEkHQfUuYFczgOVScd9/jNnYPetCHTQYaWTHp0zF0Ug9EH5dyuyKetL2SwrSd5LA8O58HmcImvQaPxoyb97mNflr/SUPoaD4xTiUlhthiZ4IZzsHAfmgsm1gqvajXqd3nn7i0lrTXah+3nBA9SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789714720; c=relaxed/simple;
	bh=V9cF5y+tutOk4VK6+m3sT0hS5YRLKDLB/lUHOug9XPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=keNg+y8WPf5qMVSlvbNwQWuXKLRSGjA27SydnQ27PeBbtEohrB6t3q0yqHb1a4+ofzDxJtDdN9MQY0iNF9v1zSi126t7CA2CVo2afNbDsGFB5HPiB1P+BETow1QVO/VkxvaKA3rgJLjA4BUEmCXPn4mllhP2Mpk1sVPHAnkbt8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FLzf+935; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FLzf+935"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FD7E1E6A;
	Fri, 18 Sep 2026 08:56:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789714610;
	bh=V9cF5y+tutOk4VK6+m3sT0hS5YRLKDLB/lUHOug9XPA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FLzf+935Kin+RI4p9MY+mBTKLOL2Dbi/QPunp1c47d1ud8V3TIn2W6rLUEz4Kfzww
	 XNqFVeJYmHLqZJadSyBJjikSzyKCQAV/TTnaotSYr//BOZj7xXjKZ5s/aXjKECmkdM
	 o5WiOteY2x92foPkOaMfRZZDhgPYvzebQKlL5mSM=
Message-ID: <1d62db29-9add-4907-ab09-a916c551b161@ideasonboard.com>
Date: Fri, 18 Sep 2026 09:58:30 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: xilinx: vtc: Dynamically calculate pixel clock
To: "Gugulothu, Rajesh" <rajesh.gugulothu@amd.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Simek, Michal" <michal.simek@amd.com>
References: <20260729101808.3904212-1-rajesh.gugulothu@amd.com>
 <bfdf98d4-e3f3-42ff-a0b4-55c67790e4d0@ideasonboard.com>
 <CYYPR12MB9014FF79595C722B3482EDED9EB22@CYYPR12MB9014.namprd12.prod.outlook.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <CYYPR12MB9014FF79595C722B3482EDED9EB22@CYYPR12MB9014.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/09/2026 12:50, Gugulothu, Rajesh wrote:
> AMD General
> 
> Hi Tomi,
> 
> Thanks for the review, and Laurent for looping you in.
> 
>> -----Original Message-----
>> From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Sent: Thursday, September 3, 2026 3:38 PM
>> To: Gugulothu, Rajesh <rajesh.gugulothu@amd.com>; Laurent Pinchart
>> <laurent.pinchart@ideasonboard.com>; Simek, Michal <michal.simek@amd.com>
>> Cc: linux-media@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org; Mauro Carvalho Chehab <mchehab@kernel.org>
>> Subject: Re: [PATCH] media: xilinx: vtc: Dynamically calculate pixel clock
>>
>> Hi,
>>
>> On 29/07/2026 13:18, Rajesh Gugulothu wrote:
>>> This update enables the vtc to set the pixel clock based on the
>>> specified timing parameters. A new fps field is added to struct
>>> xvtc_config and the pixel rate is computed as fps * hsize * vsize.
>>> After setting the rate, the actual clock rate is read back and a
>>> warning is emitted if it deviates beyond a small tolerance.
>>>
>>> The pixel rate is computed in unsigned long arithmetic to avoid a
>>> 32-bit overflow in the fps * hsize * vsize product.
>>>
>>> Signed-off-by: Rajesh Gugulothu <rajesh.gugulothu@amd.com>
>>> ---
>>>    drivers/media/platform/xilinx/xilinx-vtc.c | 19 +++++++++++++++++++
>>>    drivers/media/platform/xilinx/xilinx-vtc.h |  1 +
>>>    2 files changed, 20 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/xilinx/xilinx-vtc.c
>>> b/drivers/media/platform/xilinx/xilinx-vtc.c
>>> index 92fec7bb4..695eb2a46 100644
>>> --- a/drivers/media/platform/xilinx/xilinx-vtc.c
>>> +++ b/drivers/media/platform/xilinx/xilinx-vtc.c
>>> @@ -141,6 +141,9 @@
>>>
>>>    #define XVTC_GENERATOR_GLOBAL_DELAY                0x0104
>>>
>>> +/* Value of 1 = .01% */
>>> +#define XVTC_CLK_MAX_PCT_ERR                        1
>>> +
>>>    /**
>>>     * struct xvtc_device - Xilinx Video Timing Controller device structure
>>>     * @xvip: Xilinx Video IP device
>>> @@ -175,10 +178,26 @@ int xvtc_generator_start(struct xvtc_device *xvtc,
>>>                        const struct xvtc_config *config)
>>>    {
>>>       int ret;
>>> +    unsigned long s_rate;
>>> +    unsigned long g_rate;
>>> +    unsigned long clk_err;
>>>
>>>       if (!xvtc->has_generator)
>>>               return -ENXIO;
>>>
>>> +    s_rate = (unsigned long)config->fps * config->hsize * config->vsize;
>>> +    ret = clk_set_rate(xvtc->xvip.clk, s_rate);
>>> +    if (ret < 0)
>>> +            return ret;
>>> +
>>> +    /* Verify that the clock is within a reasonable tolerance. */
>>> +    g_rate = clk_get_rate(xvtc->xvip.clk);
>>> +    clk_err = (abs(g_rate - s_rate) * 10000) / (s_rate);
>>> +    if (clk_err > XVTC_CLK_MAX_PCT_ERR)
>>> +            dev_warn(xvtc->xvip.dev,
>>> +                     "Failed to set clk rate: %lu, actual rate: %lu\n",
>>> +                     s_rate, g_rate);
>>> +
>>>       ret = clk_prepare_enable(xvtc->xvip.clk);
>>>       if (ret < 0)
>>>               return ret;
>>> diff --git a/drivers/media/platform/xilinx/xilinx-vtc.h
>>> b/drivers/media/platform/xilinx/xilinx-vtc.h
>>> index 855845911..0f360ed55 100644
>>> --- a/drivers/media/platform/xilinx/xilinx-vtc.h
>>> +++ b/drivers/media/platform/xilinx/xilinx-vtc.h
>>> @@ -27,6 +27,7 @@ struct xvtc_config {
>>>       unsigned int vsync_start;
>>>       unsigned int vsync_end;
>>>       unsigned int vsize;
>>> +    unsigned int fps;
>>>    };
>>>
>>>    struct xvtc_device *xvtc_of_get(struct device_node *np);
>>
>> In upstream there's a single user for the VTC: the TPG driver. It doesn't set the fps
>> field, so the above code would always try to set the rate to 0, wouldn't it?
>>
> You're right. The VTC change was posted without the TPG hunk that sets
> fps (xtpg_config_vtc(): .fps = xtpg->fi_d / xtpg->fi_n), so upstream fps
> stays 0 and we end up calling clk_set_rate(clk, 0) and dividing by zero.
> I will include the TPG change in the series so the VTC code has a real
> user.
> 
>> What is "reasonable tolerance", why did you arrive to .01%? Also, the actual result is
>> not visible to the user.
>>
> Agreed, the 0.01% threshold was arbitrary. I will drop both the tolerance
> and the dev_warn() - a log message is not something userspace can act on.
> Instead the driver can use clk_round_rate() to get the achievable rate
> and report the actual value through the API rather than dmesg. Does this
> approach sound fine to you?
> 
>> I think this is a slightly bigger topic than a single VTC patch. There should be a
>> userspace API to set the FPS, and the user should see what was the actual rate he
>> got via the API (instead of a dev_warn when the rate is off more than an arbitrary
>> tolerance).
> 
> Agreed. For v2 I will make the frame rate a userspace parameter and
> report the achieved rate back through the same API, dropping the
> tolerance/dev_warn heuristic entirely.
> 
> I plan to use the V4L2 frame-interval interface (VIDIOC_S/G_PARM on the
> TPG source pad): compute the pixel clock from the requested interval,
> program it via the VTC, and write the granted interval back so userspace
> sees what it got. Let me know if you would prefer a different interface
> (e.g. DV timings or a dedicated control); I would like to settle the API
> before I respin.
I think this sounds fine.

Do you have a design to test the TPG? I think Vivado dropped it many 
years ago, and I have never actually ran the TPG driver.

  Tomi

