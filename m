Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626250;
	b=QUR865PYpcRpYOETWQd9p5mzBcz0DcgKmq0VZw27PcsS2k108Vke/z6MbHNKFMseT0j5
	 tAMzFiPHsrhNHC8zCXEcQkAzshDmkNEJQr3nktsP/pDJNS6Cs2Rl9tjYR9nycrh7fUkQZ
	 lymmfVmGDGoe4j+IH9vBWQGzHWjLdbSCmZMnI7O9yxej7Lc+z9pVSQdGx0sj8KsuDT/jD
	 10gnux6ZzoMwthCVfOhnyzO7utY00zg+kSX2ol3H9XCXemhB9VvKprnyhSkHxGEVHDwTJ
	 qzfDcGwFCkLruhHh4nChWQPOR2AsTIKafA+KBK7luVa7DzxgCEaFZkvjUW1FaWbB8bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626250;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Celi/Jf23dDYxiVlznjq1HrYLFzw7DtXkyqXcvMwU1o=;
	b=Z54bqihymq0ZBgXYHj8oGP9Y1IEtJVU+luFPlrqaeCNTPAUibJZzuxP1b9gODs/Eujtc
	 /aT8DSF2Ht6eh1g3Y91V8prEH+rWismOCzdmJVUDD+BTnVuQQMh5sDkpZUD5ntev5vqGe
	 rsFqMtOmbYEWl7kx6UqtfwTd8eh2fujaK4M7eHctgIWVBNdNNxwCugiDgyJJyq7VHg9k4
	 6Xu9zamnG1YmaRFBsbExe3TkKmXazBL2whnigo5tGisbtX64jZqMeH4vSHk1nTlx3Vo6I
	 sv8QZ438g/n4kfrUGq1w6fSNvBCbnylll+3B71wpN8Ex3W5ZXdLce9YTzD5i4lBZ+sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BdOvR9YR;
	arc=none smtp.remote-ip=91.218.175.11
Received: from mta0.migadu.com (out-11.mta0.migadu.com [91.218.175.11])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14741606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14741606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BdOvR9YR
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QSwhozA28ShgXnO4vo/Y2h8mkgH1EmGlGFODbd6mOaU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793626248; v=1; x=1794231048;
 b=BdOvR9YRuwP7VQCkEOm9VWoF8zPdmVy97qxm2Q3o9EFpE/TRQbd02uEvarwtDhvJSMj4rw7p
 huG/XEgTInOmP+4TNBAgt2Jh/Y8dr+g8UrVOGq7m1mM+UotGNkZgVcWzgscYs/isXkVehUbiSaT
 BdHTY6NCKjxhYRXaT8cd+Qyo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 83255ff9d38ebe22;
	Mon, 02 Nov 2026 13:30:44 +0000
X-Mizu-Trace-ID: 83255ff9d38ebe22
X-Migadu-Flow: FLOW_OUT
Message-ID: <91573b8c-d5e3-40ab-9e9b-be55e93425c5@linux.dev>
Date: Mon, 2 Nov 2026 13:30:42 +0000
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
Subject: Re: [PATCH v4 09/14] drm/tidss: oldi: Fix cleanup on a failed init
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
 <20261029-beagley-ai-display-v4-9-dc7f2b532478@ideasonboard.com>
 <c12f6a9f-983d-4704-a90b-3453ce984a2c@linux.dev>
 <15b7bfd9-8da4-4cd0-9f8b-634c03f46c5e@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <15b7bfd9-8da4-4cd0-9f8b-634c03f46c5e@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 02/11/26 11:46, Tomi Valkeinen wrote:
> Hi,
> 
> On 01/11/2026 16:14, Aradhya Bhatia wrote:
>> Hi Tomi,
>>
>> On 29/10/26 10:18, Tomi Valkeinen wrote:
>>> tidss_oldi_init() registers a bridge for each OLDI TX in turn. If a
>>> later
>>> OLDI TX fails, the bridges registered for the earlier ones are not
>>> removed.
>>>
>>> Fix this by calling tidss_oldi_deinit() in the error path.
>>>
>>> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> ---
>>>   drivers/gpu/drm/tidss/tidss_oldi.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/
>>> tidss/tidss_oldi.c
>>> index 506507e83112..7344d86e1f13 100644
>>> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
>>> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
>>> @@ -638,5 +638,6 @@ int tidss_oldi_init(struct tidss_device *tidss)
>>>   err_put_node:
>>>       of_node_put(child);
>>>       of_node_put(oldi_parent);
>>> +    tidss_oldi_deinit(tidss);
>>>       return ret;
>>>   }
>>>
>>
>> Since tidss_probe() (in tidss_drv.c) calls tidss_oldi_init(), it also
>> calls tidss_oldi_deinit() in its error exit path.
> Yes, but not if tidss_oldi_init() itself fails.
> 
> If we have two OLDI TXes, and the loop in tidss_oldi_init() inits the
> first one, then the second one's init fails, the code jumps to
> err_put_node. If we don't call tidss_oldi_deinit() there, the first OLDI
> TX will not be "deinited".

Thanks, I see what you mean.

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

