Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DC649F116
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594128; cv=none; b=jf5iZJ8v5zRS69gTzoeHM6/4fAQwaomMHWuQX1Ct0E0zpvnd3D+0PACCHVmA1DzKVW5+GEVRHnlj3xQEXr2U5J4hXWDX4fqFiAIS839uO9InYvpMDBCZ/C8G6AcP4/YQygcmSFFoD9VPfr/BUdeLFm4PtLOytYC58goySZB6m8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594128; c=relaxed/simple;
	bh=bVku+LbLVtlPz/Z8zkEOeBjuoHkYEWFYESdYNWdE+aw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:In-Reply-To:
	 Content-Type:References; b=AE29jPCrosq48dGi8hEmhiHNZYI1z3WeEiXKoDa6D/qTrrOl/clCLOdhG6eRJTh4vDo3x6IF4FPHeZDEk931fsOyZ+/IK64i9+HBCh4QPXwCciPRPEOXrtnFnxjyYCwRzL2f/Q035cUZoZ3uYwOVXyBNOIs+G4FMEfAoU/hifiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=CWeQr2E3; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CWeQr2E3"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260928111522euoutp02c002fe7b8825c4efc097943618e097c8~Zd94oJK_v1082910829euoutp02O
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:15:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260928111522euoutp02c002fe7b8825c4efc097943618e097c8~Zd94oJK_v1082910829euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790594122;
	bh=IWJTDuAAoxJNuDYoyjKdqDuwuipaiifAXkgQs8gVGbg=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=CWeQr2E3HYtPOPQaQs3c7cAYkoTupw+OfNtCtlz64mrhh8ohj44KBgklfLJ1hbBAZ
	 Q7O4y0ewCaDDezC5MRKEQDkpPA5TTcb2K0QrDLuCzqqbl9qPDGC9wafOQQyiAG0BZ/
	 mHEiWs6gJQjESgMtzjto6UYmoNZmNBJrJ820Hik4=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260928111522eucas1p1e9b3945eacb52abe425272ebca524d8f~Zd937x-g32542425424eucas1p1j;
	Mon, 28 Sep 2026 11:15:22 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260928111521eusmtip25ee21cecd2bce4f2d8446081ed0ca8a7~Zd93m1wdG0159501595eusmtip2N;
	Mon, 28 Sep 2026 11:15:21 +0000 (GMT)
Message-ID: <c54e669b-442c-4ae4-acc3-9ccba0174fca@samsung.com>
Date: Mon, 28 Sep 2026 13:15:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/bridge: inno-hdmi: reset DDC segment pointer per
 I2C transfer
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: Dominique Belhachemi <domibel@debian.org>, Andy Yan
	<andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
	linux-kernel@vger.kernel.org
Content-Language: en-US
In-Reply-To: <9274543d-c569-43a6-888c-9b74d1a8c92a@samsung.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260928111522eucas1p1e9b3945eacb52abe425272ebca524d8f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260928111522eucas1p1e9b3945eacb52abe425272ebca524d8f
X-EPHeader: CA
X-CMS-RootMailID: 20260928111522eucas1p1e9b3945eacb52abe425272ebca524d8f
References: <20260528184145.384114-1-domibel@debian.org>
	<9274543d-c569-43a6-888c-9b74d1a8c92a@samsung.com>
	<CGME20260928111522eucas1p1e9b3945eacb52abe425272ebca524d8f@eucas1p1.samsung.com>



On 9/27/26 10:51, Michal Wilczynski wrote:
> 
> 
> On 5/28/26 20:41, Dominique Belhachemi wrote:
>> The segment_addr and ddc_addr fields need to be reset per I2C transfer
>> to avoid stale values. The reset wasn't required on simple displays with
>> only one segment, but modern displays with two or more segments end up
>> with corrupt EDIDs.
>>
>> This was found on a StarFive VisionFive 2 SBC.
>>
>> Signed-off-by: Dominique Belhachemi <domibel@debian.org>
>> ---
>>  drivers/gpu/drm/bridge/inno-hdmi.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
>> index 5fa533a4eb342..297be02bbd58d 100644
>> --- a/drivers/gpu/drm/bridge/inno-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/inno-hdmi.c
>> @@ -989,6 +989,10 @@ static int inno_hdmi_i2c_xfer(struct i2c_adapter *adap,
>>  
>>  	mutex_lock(&i2c->lock);
>>  
>> +	/* Reset segment_addr and ddc_addr at the start of every I2C transfer */
>> +	i2c->ddc_addr = 0;
>> +	i2c->segment_addr = 0;
>> +
>>  	/* Clear the EDID interrupt flag and unmute the interrupt */
>>  	hdmi_writeb(hdmi, HDMI_INTERRUPT_MASK1, m_INT_EDID_READY);
>>  	hdmi_writeb(hdmi, HDMI_INTERRUPT_STATUS1, m_INT_EDID_READY);
> 
> Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>

I was also told that there were some changes in the MAINTAINERS file
regarding this patch and some core people may be missing e.g Luca and
Maxime.

It would be best to resend with updated list of maintainers.

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
