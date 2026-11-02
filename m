Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619999;
	b=05HzAlhVZWnA8mYw3+0pOw6mNdgahvaTdcS6IwkE9/7tHfcFA3Fe55JwJdocemfWu31/
	 /phYKlYK/dMkwIN4axcFfkYpahgGI9Cwp77NHlVxPwBBu4BIc1xv3JbbG2lOpJRJjn5TC
	 dDa/nd4caztP1AvDYnb2pdOjYiyFyXvXZxM3bRV+5qksp7F0mV6I+ttvCMlY1H3toEfPE
	 VsMmh0Z/4suQqznRp4a6jVZuJ8PLOXBqczFZO7i9OrVxzK3fshq5n8jMUGTLliO3zkK7d
	 oDlhW+mFIEIzcONQqc4TPDg5QsBSgIvo8s5Pql4wQVttdb4eDEVD/agz4h/Av+pW/Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619999;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=W+m3CHrmFQywLf6TePlg1mKGWwLKYliHCdWDTJ6aHQ8=;
	b=W/7f6NHIqBAjueciLaMLJqI8qSxB3K89NaQhdmaE5WQrMXxZVsUSGNrQtBYYvH1TAk0O
	 NMYVYJgVj1gu5u6/Xn7mSXdDDZFLWcgPq3Vx6JRrnMv2aEEOT6L/cZqZEv6nYdpZnGqtV
	 MR/Vw94oG/aoXjZJa3hyK4AGRS7MmxKOc3XfuLVI+ifXzsB7ZmJeLatt9WcZ9PWasdTIy
	 cvsRUcSK/h+gg3jIcIRj2j3f4FzcFNbxawvqfvSThiPRTizUuxF1tfI5AEUrbFs3vnEGO
	 vgWcpOaUw6LSsP1ffwJc6fuWrsBHBanyIbGBgGyfA7+b/0dQzNjrzS+kQpfkf6xUlhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=sJNlNoob;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C6A606A326;
	Mon,  2 Nov 2026 11:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6C6A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=sJNlNoob
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98CDEBE;
	Mon,  2 Nov 2026 12:44:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793619859;
	bh=Il2jawOtTACJ7zfhzEJQgLvlmZ3qfox3dZ+2zsbOxBM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sJNlNoobrLo/mTzbYvXpee1l13KmgrCl0cDspWwcvH3uWHndcG2AvJFi1Sx5O6oTN
	 8gbZGXdzgKffXCiq5AMopa6ANUAK4qf+lAWBbRxIAzcU9YN5WiTcUr+mm8dtC3Knp2
	 SFpekWuXXZNll1ziSKZdWc73Nb8GabUL71yCz6Uk=
Message-ID: <15b7bfd9-8da4-4cd0-9f8b-634c03f46c5e@ideasonboard.com>
Date: Mon, 2 Nov 2026 13:46:32 +0200
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
 <20261029-beagley-ai-display-v4-9-dc7f2b532478@ideasonboard.com>
 <c12f6a9f-983d-4704-a90b-3453ce984a2c@linux.dev>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <c12f6a9f-983d-4704-a90b-3453ce984a2c@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 01/11/2026 16:14, Aradhya Bhatia wrote:
> Hi Tomi,
> 
> On 29/10/26 10:18, Tomi Valkeinen wrote:
>> tidss_oldi_init() registers a bridge for each OLDI TX in turn. If a later
>> OLDI TX fails, the bridges registered for the earlier ones are not
>> removed.
>>
>> Fix this by calling tidss_oldi_deinit() in the error path.
>>
>> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/tidss/tidss_oldi.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
>> index 506507e83112..7344d86e1f13 100644
>> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
>> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
>> @@ -638,5 +638,6 @@ int tidss_oldi_init(struct tidss_device *tidss)
>>   err_put_node:
>>   	of_node_put(child);
>>   	of_node_put(oldi_parent);
>> +	tidss_oldi_deinit(tidss);
>>   	return ret;
>>   }
>>
> 
> Since tidss_probe() (in tidss_drv.c) calls tidss_oldi_init(), it also
> calls tidss_oldi_deinit() in its error exit path.
Yes, but not if tidss_oldi_init() itself fails.

If we have two OLDI TXes, and the loop in tidss_oldi_init() inits the 
first one, then the second one's init fails, the code jumps to 
err_put_node. If we don't call tidss_oldi_deinit() there, the first OLDI 
TX will not be "deinited".

  Tomi

