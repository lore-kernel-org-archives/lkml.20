Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2302D3B52E1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702630; cv=none; b=aDxikywz9HWE4/SiUrmMzaVTs6zJLaLbnyxviDiQZ88UNwjOwub5hUPwIqnxTdFegoeqZ6BJND2y2+qbKSUzw5Ht3oQWRp5fzORLoGkG3XYK6QFgb4KjxNqMSw26B5UQ9MISEPMlmA9v9dv0TTSEmk4tmsf5EaGOYIMpVzObLRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702630; c=relaxed/simple;
	bh=TZI0X3+I1L1Wmpg84vIuKoIdqolxovT8iqYRB9KXvp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=H4x+JSl3KlVAOs1gCsN64+o3Ifxq3Oh8uOGYoYA0uAnpdWlUxutLTnium1UbPKFXJCgQiA6/vtJLE9USqCosBNv24IyQHcWb5lST4/np5GEbcOU17w6L7Mc/XuYqLAMwP0ytjrW88HmTXg6ZSPcW3IfQFZtj2HweMXkf4uJE0+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TZ7epole; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TZ7epole"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260918033702epoutp02e264a0adf36c9de86e91a7e44cc79513~WTQ11YuyJ1952519525epoutp025
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:37:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260918033702epoutp02e264a0adf36c9de86e91a7e44cc79513~WTQ11YuyJ1952519525epoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789702622;
	bh=wVNZNX6eNlyCyjqKZuhGwmsTwuDYuVKLYvCN2QvkmDQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=TZ7epoleif9/tjTCcwO93NSveNWPb4CaXuiXxPkjyTfMyLKPfIi3GW7o0WGU20lu3
	 Kx/Je1eQy2oWYSd9deri3WFiDdKCCi6uGV5DWMsPwy5SMiyA9GpIAZ22FkouOtm1v8
	 JK+WiKXzaPImGziv4DNIlpUOgAg+8lqHmr71x2eQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260918033701epcas5p28c94072e3b67ed14d50879deaf09bbfb~WTQ1SToQ_1503415034epcas5p2S;
	Fri, 18 Sep 2026 03:37:01 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4hmJG4309hz3hhT8; Fri, 18 Sep
	2026 03:37:00 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260918033659epcas5p3efc91b48516c12b52293604b2c272239~WTQzosaGy1269112691epcas5p3b;
	Fri, 18 Sep 2026 03:36:59 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260918033656epsmtip1d0d87fe4e19cc56648a53ea55d7ab60f~WTQw35rEG1575715757epsmtip1V;
	Fri, 18 Sep 2026 03:36:56 +0000 (GMT)
Message-ID: <c74dda5e-7fc7-49e8-befc-7def930e8bb3@samsung.com>
Date: Fri, 18 Sep 2026 09:06:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
To: Alim Akhtar <alim.akhtar@samsung.com>, krzk@kernel.org,
	peter.griffin@linaro.org, gregkh@linuxfoundation.org, robh@kernel.org,
	conor+dt@kernel.org, Thinh.Nguyen@synopsys.com, mani@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <058301dd471d$5d985170$18c8f450$@samsung.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260918033659epcas5p3efc91b48516c12b52293604b2c272239
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260916122354epcas5p401fd6470d6cef75951af732b03aa5970
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
	<CGME20260916122354epcas5p401fd6470d6cef75951af732b03aa5970@epcas5p4.samsung.com>
	<20260916122229.2604003-3-selvarasu.g@samsung.com>
	<058301dd471d$5d985170$18c8f450$@samsung.com>


On 9/18/2026 8:55 AM, Alim Akhtar wrote:
>
>> -----Original Message-----
>> From: Selvarasu Ganesan <selvarasu.g@samsung.com>
>> Sent: Wednesday, September 16, 2026 5:52 PM
>> To: krzk@kernel.org; peter.griffin@linaro.org; alim.akhtar@samsung.com;
>> gregkh@linuxfoundation.org; robh@kernel.org; conor+dt@kernel.org;
>> Thinh.Nguyen@synopsys.com; mani@kernel.org;
>> selvarasu.g@samsung.com; linux-arm-kernel@lists.infradead.org; linux-
>> samsung-soc@vger.kernel.org; linux-usb@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
>> Cc: jh0801.jung@samsung.com; h10.kim@samsung.com;
>> dh10.jung@samsung.com; akash.m5@samsung.com;
>> hongpooh.kim@samsung.com; eomji.oh@samsung.com;
>> shijie.cai@samsung.com; muhammed.ali@samsung.com;
>> thiagu.r@samsung.com
>> Subject: [PATCH v2 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
>>
>> Add the Samsung Exynos8855 DWC3 binding using a flattened node
>> representation, where the DWC3 controller is directly addressable rather
>> than nested as a child node of a glue layer.
>>
>> This is the first Samsung Exynos binding using the flattened representation.
>> The existing samsung,exynos-dwc3 binding describes the parent and child
>> representation used by existing Exynos SoCs, which can be migrated to the
>> flattened model.
>>
>> Samsung Exynos SoCs sharing the same flattened model can be added by
>> using the samsung,snps-dwc3 fallback compatible and extending the
>> compatible enum with per SoC clock and property constraints.
>>
>> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
>> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
>> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
>> ---
> Thanks for using flattened node representation. Are you planning to migrate other existing SoC as well?
>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

Hi Alim,

Thanks for your comments.

Yes, We are planning to migrate other existing SoCs to the flattened 
node representation as well.

Thanks,
Selva
