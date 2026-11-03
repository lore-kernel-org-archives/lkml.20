Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694119;
	b=QZrBBkGy/Hotoiz9agEVL9kk9eIwv3yZu2Hxt4d4wbTasP1S0e1uRHwPw666uxs5tZsU
	 0tv1LRfgCvxoOq00TFrw5ob+0prxVuxeQ9dmBDBzIRxgKqtB7JwRYDXga7AL3GuXEM6M6
	 QkOru//v06ehU7UgSsGxh32VnKTGKRGLvnw8PNU0q9IPh6lKXLZeauibIaxP5w9W2GhWX
	 Kiajw56jkbLiqStP4JtgHlPkOaLfRE0HSvV1rS9r4b8tqcGTE1NyB1zlGy63i5WSNUMXl
	 hEDQgAFLs/7NSEsPMyFp7frSPRpVMyGMxSf2XWDR+f3O9Y2E5jYHc3CZSOwwuUdJAcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694119;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=9HFajkMdiw6Cxr5bhVQtWouD1V5S9+5PzrpHwKVgix8=;
	b=f4mEavbBMteb330YXWheJnZzzQyydFm9qXNLGkTgPU5aWQHfdLxrUi6pj7k4Ri3FdWvu
	 ZEjIW9yJZOLEiSrJFfUIODgXdiTTwezpWjMKFFBnILawWbX3Lqnwq1roJUJ50UPjnsKM+
	 bVd738mM9FJ+XaqHmyEJpIwrfYg+2qpvBq2BN1+1+5HCtnHJvSzoEwIMypiZle2ZZUIzz
	 GooKpq+pZm/TcxiH8H3aXC98c2L5u3YXfv2CLbQWjyMags/RilSMFnHhK4X8AaTY0lRuY
	 XMEfiUEK7Yw+gA6Y7QKkI9TOypZyJJu28NKzjiLkE4pF68G56TJ0kozwyWqsoRU4EwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=VOJbyUkE;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B431606A33B;
	Tue,  3 Nov 2026 08:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B431606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=VOJbyUkE
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F223A7E1;
	Tue,  3 Nov 2026 09:19:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793693979;
	bh=GP8xPnEIMDQsMAKAderpcsLm7MDDhpE8epRfiUMVDLg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VOJbyUkEBoZ5roG+T9bTHvtDR1wsdC/r/7TbTVX/gluzsDnNhOMw7fHFa737P4LTT
	 0gc2H/lDKEjmHQ0z0212jwhNK1hbWJIZdr4j7JU1jLYL70AZygTKAsFMT66DJv6aJ3
	 c+y+zgOWtPZh3clH3fe/bufXAA8tz/TNnkQHk3IU=
Message-ID: <7688e746-b4b3-4856-8e67-6c8ed21d10c1@ideasonboard.com>
Date: Tue, 3 Nov 2026 10:21:53 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/14] drm/tidss: Add support for AM62P display
 subsystem
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
 <20261029-beagley-ai-display-v4-12-dc7f2b532478@ideasonboard.com>
 <5782a7a2-3fb4-4d74-aae9-e1ff0d0d4393@linux.dev>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <5782a7a2-3fb4-4d74-aae9-e1ff0d0d4393@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/11/2026 16:02, Aradhya Bhatia wrote:
> Hi Tomi,
> 
> On 29/10/26 10:18, Tomi Valkeinen wrote:
>> From: Swamil Jain <s-jain1@ti.com>
>>
>> The DSS controller on TI's AM62P SoC features two instances of the TI
>> DSS. Each DSS instance supports two video ports, similar to the DSS
>> controller found on the TI AM62X SoC. This allows three independent
>> video streams to be supported: OLDI, DPI, and DSI.
>>
>> Since the DSS instances on AM62P are architecturally similar to those
>> on the AM62X DSS controller, the existing dispc_am625_feats
>> configuration can be reused for the AM62P DSS support.
>>
>> This commit adds the necessary device tree compatibility entry for
>> "ti,am62p-dss" in the tidss driver, pointing to dispc_am625_feats,
>> thereby enabling DSS support on AM62P devices.
>>
>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> 
>> ---
>>   drivers/gpu/drm/tidss/tidss_drv.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
>> index 44b0b009c29a..8e3cbfb5ef87 100644
>> --- a/drivers/gpu/drm/tidss/tidss_drv.c
>> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
>> @@ -240,6 +240,7 @@ static const struct of_device_id tidss_of_table[] = {
>>   	{ .compatible = "ti,am625-dss", .data = &dispc_am625_feats, },
>>   	{ .compatible = "ti,am62a7-dss", .data = &dispc_am62a7_feats, },
> 
> On a separate note,
> 
> Now that `vp_bus_type` support has been dropped, the only thing
> different `dispc_am62a7_feats` has from `dispc_am625_feats` is the
> subrev macro.
> 
> The DSS in AM62A7 SoC is functionally same with that in AM625 SoC; the
> only difference being the absence of both the OLDI TXes in AM62A7.
> 
> The dt-bindings enforce that rule.
> 
> The only place subrev DISPC_AM625 is used, and subrev DISPC_AM62A7 is
> not, is for an OLDI reset done log print.
> 
> if (dispc->feat->subrev == DISPC_AM625 ||
>      dispc->feat->subrev == DISPC_AM65X)
> 	dev_dbg(dispc->dev, "OLDI RESETDONE %d,%d,%d\n",
> 		REG_GET(dispc, DSS_SYSSTATUS, GENMASK(5, 5)),
> 		REG_GET(dispc, DSS_SYSSTATUS, GENMASK(6, 6)),
> 		REG_GET(dispc, DSS_SYSSTATUS, GENMASK(7, 7)));
> 
> Should we consider some workaround for this print, so that we can
> entirely drop `dispc_am62a7_feats`?
Indeed, this allows us to do a nice cleanup. Good catch! I think it's 
fine, we'll just print those bits on AM62A7, I don't see any harm in that.

  Tomi

