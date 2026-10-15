Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887943BFE47
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078234; cv=none; b=rz4FSeTuhXkCMEIZblp19S3tGMSN76dxGK42jkljRLypdaBwueiWSBlLKIMVkrbrme9CnDAWy/yCMCmZOhzBp1F1Qv4t5j9Dxc26B3pbS+9C4epmgAAInTSMyXtETH4vjlgQlKLtcXDCE3SwSs+74KE3HzNI1bz17vUOnLAxQF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078234; c=relaxed/simple;
	bh=WRAeDjp6ofWENcWyqlqxSVWzgxgCX5uDEs3cM8Yt0eA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WE84mgdJxnueeMqfAfA1YNGKWUY4bxBtOWSSCirC7jic2wNC/tuLjX/3SXI5X9gUtrhauO96iAC3XOLlpw2T3707l4Pj/L++ZxF+fPWGFRWAR9UTL1aKDXJWrEODg5cNmZqstBFmvufMxaV3kHTTE53VBo2Ji/hzzJ/+9uqux64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Y+pP9h7B; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Y+pP9h7B"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BEE014BF;
	Thu, 15 Oct 2026 08:30:19 -0700 (PDT)
Received: from [10.0.129.161] (e122027.cambridge.arm.com [10.0.129.161])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCFBD3F673;
	Thu, 15 Oct 2026 08:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792078222; bh=WRAeDjp6ofWENcWyqlqxSVWzgxgCX5uDEs3cM8Yt0eA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y+pP9h7BJxusSlS03Q6z2ZFV09L2INalDQyHlpSM/lPJufCj6I5C6RTROAtaSzENR
	 z8oThpKU6Re4VlEP1SbYn1guC8+GQjJgbg6wXI19NrGz872DeKPxeMuAAm5dlhsJ48
	 Qih4pZJAWrLUaX1VWEkVaR5b8UZBQJJ+GpAUcMag=
Message-ID: <39917273-a23f-467f-86e5-8a8a954ca3b4@arm.com>
Date: Thu, 15 Oct 2026 16:30:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: reset the Amlogic GXM GPU on runtime resume
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Christian Hewitt <christianshewitt@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <daniel@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260930125629.2691968-1-christianshewitt@gmail.com>
 <179184031154.1056803.12154076398577087527.b4-review@b4>
 <6B9C57A7-8BE5-461B-B44B-EF91FC2D2D93@gmail.com> <as_A5ygwMkEgGeP4@sobremesa>
 <as_EPvb8S2rYmeRj@sobremesa>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <as_EPvb8S2rYmeRj@sobremesa>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/10/2026 19:05, Adrián Larumbe wrote:
> CC: Neil Armstrong
> 
> On 14.10.2026 19:03, Adrián Larumbe wrote:
>> Hi Christian,
>>
>> On 13.10.2026 09:02, Christian Hewitt wrote:
>>>> On 13 Oct 2026, at 1:25 am, Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
>>>>
>>>> On Wed, 30 Sep 2026 12:56:29 +0000, Christian Hewitt <christianshewitt@gmail.com> wrote:
>>>>> After its first runtime suspend, every power-off of the Mali-T820 in
>>>>> Amlogic GXM SoCs times out and floods the log with shader, tiler and L2
>>>>> power transition timeouts. Following a soft reset the cores report not
>>>>> ready but PWRTRANS never clears, however long the driver waits.
>>>>
>>>> Would you mind building the driver from the latest drm-misc-next and testing
>>>> whether this is still the case? Today I merged a patch series with a fix
>>>> for a long-standing bug that prevented the device from going into suspension
>>>> because of mismanagement of the PM refcount. It might be that what you report
>>>> as an issue triggered by power transitions is something altogether different.
>>>
>>> I’d tested with the v12 iteration of your series in my amlogic-7.3.y [0] tree
>>> before generating the patch I submitted. I’ve now tested with v15 (as merged)
>>> and other recent panfrost patches you submitted (which v15 depends upon) and
>>> with this patch reverted, and the timeout issue with T820 remains. I also saw
>>> a splat that I wasn’t seeing with the v12 iteration [1].
>>>
>>> [0] https://github.com/chewitt/linux/commits/amlogic-7.3.y
>>> [1] https://paste.libreelec.tv/desertic-cataleya.log
>>
>> Turns out I was wrong about having easy access to a Khadas VIM2, so whatever I try to
>> gather about the existing bug must come from these logs. I see one very interesting
>> warning in [1]:
>>
>> WARNING: drivers/gpu/drm/panfrost/panfrost_device.c:490 at panfrost_exception_name+0x1c/0x30 [panfrost], CPU#0: swapper/0/0
>>
>> Something's causing the GPU to report a fault whose status code is at
>> present not documented in the driver.
>>
>> I think that, because this seems like an SoC integration issue, and because of the unknown
>> exception being reported by the GPU, we should have some further input from an Amlogic SoC
>> subsystem maintainer, and also Steven Price himself.

Here I am ;)

From the log:

panfrost d00c0000.gpu: GPU Fault 0x00de024f (Unknown exception type) at
0xba86fee1846eb817

This looks more like garbage been read from the GPU rather than a real
fault. As the driver reports 0x4f is an unknown exception type - it
shouldn't be reported.

Other suspicious things are that the Engineering Spec says the SOURCE_ID
field "does not exist", so I'd expect zeros to be read there rather than
0x00de. And the address 0xba86fee1846eb817 is well beyond the address
limit of the hardware.

Which is consistent with the GPU being in a bad condition immediately
after power up and before being reset. Without detailed knowledge of the
SoC I'm not sure I can explain whether simply adding GPU_PM_RT is correct.

We already have the magic PWR_OVERRIDE1 value which is simply passed
from the GPU to the integration logic. It's possible that e.g. writing
this a second time after performing an external reset is problematic.
Sadly as the value is passed straight to the integration logic I don't
have any documentation on what the magic value does.

Thanks,
Steve

>>> After reinstating this patch on v15 + dependencies dmesg is clean again [2].
>>>
>>> [2] https://paste.libreelec.tv/leptosomatic-cherlyn.log
>>>
>>>>> The transitions complete normally when the GPU comes out of a hardware
>>>>> reset, as it does at probe. Use runtime PM with reset and clock control
>>>>
>>>> panfrost_device_reset() is always called as part of the PM runtime resume
>>>> operation, so I'm assuming what you mean here is that reset control is
>>>> deasserted at runtime resume when the SoC supports it
>>>
>>> I’m firmly at the hobbyist end of kernel contributors and I’m not able to
>>> technically explain the patch Claude created. It’s entirely possible that it
>>> pokes around in the right area of code but is not the correct fix, but I lack
>>> the knowledge to dig further without explicit guidance. I can also give you
>>> remote access to a Khadas VIM2 board if that would be easier or useful?
>>>
>>> Christian
>>
>> Adrian Larumbe
> 

