Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4401B4B7178
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785181; cv=none; b=RSML+RWTEanM/8IOM7c3WtG8+MP9Yh09WgEnlsINMHfSPFnxLQ5HRLiCXz1S7Eq/Dzlzn0q9GuuXdSugKDIbTiqxuFWCkcyAhHnKv/nuUIqxc1GF9vXMt2xWTebKz/5BC39ubPV91wt3qLOj8S2yzsTrNPTXx0APhGJY3VWmpxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785181; c=relaxed/simple;
	bh=ESaHfGeBqmjtrWwElJS3HH8vZOhI45PP1/GZBR7s6WA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MQ+0ST5dnZYGLCHMFL5Jo6x5CKDpTHY+heEGRqzaBf2ux7LIxyMMiZWQRndf9W+RfyoRnSWIfEEIR4cuHfZ6ekKVN6X1D1hFJuo7JzOzrLx92VhPX3xn4nH7OzDuGGm7nnKR2JlOkCX9PxYIszMiu5IxQrGIFryRNu0tUTZvs5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BNwwR5qx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BNwwR5qx"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d0726ccc2so12982175e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788785178; x=1789389978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sh4lMwtpk7NaSaE+W0IfcVg67gcAoopfexp/sEpTXq8=;
        b=BNwwR5qx4I/oybh7bVy3gaQHEr23aawl2fIhbO33D6kTg5JiN3fvhiYVpJ+m3b1Y1u
         ctWkVYsupgqKb0Zi17RYRAh8DQLpOLoKMgP83KL+cAiHhAk6zLYlnsNkCj0DiJL7g3vX
         an4WPx546v9IPw83d+fdSG88K6OSp9B9divqyP7aBRMB2oAb9Lj+vglNP+9hiRAmS/CH
         rq9tTvLUzRjk9MFs1xcubdoECImyqxwewnaT9B/PikWmCzdc+Qx+mPs5uopp8wnEGHWP
         wHxYj/AobwvWJGD2C+vGghgz09oNLCXz4u92v27ZfixDhe98kZISUZ3yIVgxK5mMRSt9
         Uugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785178; x=1789389978;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sh4lMwtpk7NaSaE+W0IfcVg67gcAoopfexp/sEpTXq8=;
        b=hM4IhHTR5KHM9dTUz2E/f90/T73MvcCcI9ckcsdy74dE3lAl1tj3onZSwBBrhZaX0G
         I4DliOv/9SAIHIuUUjN8ddVeRikAGAi5HRDYsWtVGQL5SGhuyVRmZirE/adTdbUl8Qi0
         7y4eLJWeHmtFplCcopg3ajT/WLDkVpH8ee9Bge0ldBzaW1LHXfLFGZkSs7pdrymyj2S3
         fk/eRMlaRZBEQ4BjFJ74CiIS0XEyRr6M8XMqXm3bF4zuttIn1II16rd1KgXz92rbsotL
         lLUtTzeHff/2EeHaAREtydoOZz7xiYjZUv2eLxPTsPAj3otwVR52+EbGqBz9huHDnqWp
         +cTg==
X-Forwarded-Encrypted: i=1; AKwUvBzxrKlGSwQZeX4U4Lui3+mxjuHK8J+lhWsCODcYNPgchX6RXi3RaaK71GgKj//4U1S6du4UFLagBwrVQ1c=@vger.kernel.org
X-Gm-Message-State: AFuF++nQmZ+TbSckPGG4u+XDwrWCnZRwn12aHutOethMPD19/iCutRYt
	JBqIcGwDueDIUnLWnV3IpsHZ2KEv8CkGpc1+y7C9iAFLDkatMMsb/xqlBaxpyLBIWY8=
X-Gm-Gg: AYBFou3CXvdwsUlzlgkQe0zRHzQ/PjvDSqFGYNFlSjOcixMnFfQQRUCUnsIqJ0WEGny
	4xtPVhX4jf6Pf3PJ+YfhqO0pWVRoizcsBEV6uCcUts1LXqlTHQoImeiYXrPbofx56qm2YVPI+ki
	o0zatlMssmM2nqTQvK6rVNHLpJMDisEmGKg/9d7XEaXwXqZzwj0mrrahjtZf2XhN0em822bBmdg
	1UAO9e/okGgSsB/vCmEbjViYNWbB2C1seFXwwVSNWZIoBBk0+ahxJOncdQzkugcGi20OBAJ8JFw
	g8lOy+cbbS7hITbQ3WZUYxvwZvtuyJ4uWzcX2DVd9SGOuveCwUBZf1yMFec/7nptxQEwswEob/0
	LF7zgS/mlpmmckaAhrF1q4XAU4H4KGYOJRSSz02NmLLQROJ1k9PFGJnO82eDmD5GAfY2d30pivw
	Q/+n7p69yEcnhZ4QtJYnj25FhDLwMdxDprrXHHK799VOMDt/fXDJn/i8tnn7yglGe+tYioF+A/b
	qMPi85AXvT926rVYAoELUahmJ8=
X-Received: by 2002:a05:600c:6214:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49cf825115bmr459195565e9.13.1788785178420;
        Mon, 07 Sep 2026 05:46:18 -0700 (PDT)
Received: from ?IPV6:2001:a61:1340:dc01:654b:3cf0:59cd:498? ([2001:a61:1340:dc01:654b:3cf0:59cd:498])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm282573745e9.3.2026.09.07.05.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:46:18 -0700 (PDT)
Message-ID: <f642f815-df4f-473b-aaa2-89153c08bc05@suse.com>
Date: Mon, 7 Sep 2026 14:46:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: cdc-acm: fix racy TIOCMIWAIT implementation
To: Johan Hovold <johan@kernel.org>, Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260907065501.101013-1-johan@kernel.org>
 <e231a7e9-7aa9-40ea-8ac6-57855b4ac811@suse.com>
 <ap56NTVMq8GlbjmR@hovoldconsulting.com>
 <72615ee3-46eb-4639-a408-ba29c1235d08@suse.com>
 <ap6LcHWDvIWF3oNK@hovoldconsulting.com>
 <bc055887-3029-4740-bec5-7e2fe4205992@suse.com>
 <ap6iJ6vkVIaxXFwn@hovoldconsulting.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ap6iJ6vkVIaxXFwn@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07.09.26 13:38, Johan Hovold wrote:
> On Mon, Sep 07, 2026 at 12:28:46PM +0200, Oliver Neukum wrote:
>>
>>
>> On 07.09.26 12:01, Johan Hovold wrote:
>>> On Mon, Sep 07, 2026 at 11:50:41AM +0200, Oliver Neukum wrote:

>> Yes, but user space can call TIOCGICOUNT multiple times in sequence
>> _without_ calling TIOCMIWAIT in between.
>> In that case the counters have to increase if a line changes, don't they?
>> For that to happen you need to handle a status change in the completion
>> handler.
> 
> Yes, the completion handler needs to handle the status change (i.e.
> compare new and previous status and increment the counters), but it
> shouldn't update any old *icount* structure.

We could do that and it would indeed be simpler.

But it would change the semantics so that past status changes
no longer show up in TIOCMIWAIT. Is that really a good idea?

	Regards
		Oliver

