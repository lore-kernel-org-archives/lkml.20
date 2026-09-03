Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5F64E56E5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450319; cv=none; b=gMOy2QmD0z4AsDhMuOwWyNFmO/ewqlDFwMvIA4ZV451PRwbASg26THcIp3fLcJsLeTeSwaUmNcTUazIeYLd2VEi2otvDqWwDGplr8nXNiLq4aIdP2jp6hD/mqccsMzWae0/GtW4XJvwIyd617VITXsk1tEWCOQ00SgF7vbc+l6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450319; c=relaxed/simple;
	bh=wNbZo52/jCuXUnRq9hwDsnLal9ayYeRAqN3lGb9tVZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=N922KVPTjViZ39L+4qOmwoMfuQ/HcEFs2hrs1fRnaWpda8mx+yB6h8GhOsRDqAwDaASEZJsZOuKYEL3XL6/kw7xsScDigAeVxSJqY+fKKwMN5qUtIszy54iE27TJHhcpHxLfM7GpShTC5/woRg6AWRW9fn9rBIB4XBd/3goVPkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dsXEK9oz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aQZ39lln; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dsXEK9oz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aQZ39lln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788450317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nLnpM91lg5cKjPDt0j7rgsNLagyFY0gB25r5tI9lEhA=;
	b=dsXEK9ozWqXUv7ziM2qDp4mD1Wl8FXrwPgjJd0vVepouqOPnAd9xAR+MGqXVT7MEheoJTG
	nuYI+v3uruNecry0lHUeNrVI9542duVAwe7MTGlp97GzupsY6bQrjk0nBasR8Jd7CnRU7L
	VIMcgcsxZCRkn0fSoql8KNnTrUOuO7A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-tVj1dVR0Pay5BzLevFPH7A-1; Thu, 03 Sep 2026 11:45:15 -0400
X-MC-Unique: tVj1dVR0Pay5BzLevFPH7A-1
X-Mimecast-MFC-AGG-ID: tVj1dVR0Pay5BzLevFPH7A_1788450315
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6a18e611c82so3060947a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788450314; x=1789055114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nLnpM91lg5cKjPDt0j7rgsNLagyFY0gB25r5tI9lEhA=;
        b=aQZ39llnIgzgMrM/osCg/JlicTknCwC1L6HLCE5i41eYc5lmyRR4WiqUYwv2moqGzW
         s9mXL2UVPFnaFfDBwLJr1Et4scPgHaJJFYsTQLgdpjbno2TIHGpWKaqdRMMdzCPvIXV6
         J3W5xYyKDo5b3dI/jJAtc4IAKivKnCapbaw0YPHeQg+KSX/TI+88Afd0S0qdBCf6nOQ2
         okBzvvHaw3I0siGSNz+zERalivcYdVqSzmlRYdbqSnZrchv8tybjKq+Lcu8pLneNnOhh
         LCkvjEX7HZDqMMdAN/ymohWSvcaZHuW5v7cIcv8a9WbNPYz9oAuEoJdlJbVMGBuWFptH
         ZJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788450314; x=1789055114;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nLnpM91lg5cKjPDt0j7rgsNLagyFY0gB25r5tI9lEhA=;
        b=N10jCTWGLDwdL4GcgbM2UUry1P6OR1Iz55B/jeHGttJfmD4JUoC9a3DuflyDnvWOBl
         UYsjc1obfEMJaW/1C7Du6K9tuzbLxuzSful081GBxW86P8KWPMi3Bfqy1cl6nWncgPDA
         G6WNdtL4P86dCvIOAHZEden/ZCIFN/hafqAgNb1f0eOtcOX0jy8WVMLAqcx997ElC7kG
         vWJgtjcmchaFEnDjtHQIC2ydDur7rtYGSQu6BsaoGrIUPl3oTGeQCer5hJd+wi1oPGjY
         W5cGf/YiEbIFHQvooT8H6ytUvz4M1pV2Etnl/5luWYwpFD3M6bCJbMf6c3mBl4odj9iN
         /nPA==
X-Forwarded-Encrypted: i=1; AKwUvBzTSDD0SQ/76H5Tq8zo8pSW7eu5kcMXI72RChrg4Ki9r2wbPzaCvZfdzG8tAjZQ80Xoxjawj/7kyVMs6UU=@vger.kernel.org
X-Gm-Message-State: AFuF++kggj9TuxWB1CR5Z5NjIumu8tx2ux8Iw27iCzhBoq/az3hwYx13
	bNAwufvjhTHK4NGBmqX3oZbSzzOwGJ6gSufZW7ygyU9yCHQqZqe0JP0dlZWkRrTunLe/bwc1UCr
	d1fr9jCo+9Ec4CjSJonwV5O57rIdPC2+RNBMepJ/WHu3l0oGf0GWn9jS5SOLyODSYOg==
X-Gm-Gg: AYBFou0zIofjwTsfxxDtO/LYxRPkM9vHkodA5BG8DJpDjjrqmBzlVTyCsrCwaTJK3Wv
	gXVd+jid+u2x9+ZPKQepHBz8cqjO6asCLQ2cVq+95bK3UckLPnIH2mB8np98O3ccIpZMP7K11/h
	wKPehRKGkB1XKhFZ+p3XXcTL7cy5mhmVU6zIy+hcdME62JARDRFuQ+2q/FXhdU7GGdULiNgf/Ji
	BG7OxeWafVUJgtpl6UWmbtW8J+vZjelXBcFdcWHXGOHjhi4bvbQoTWwp2T59ormBkeFxBqyiWfv
	ic/r8E6phvnLEo5ZOv/RlMuCXQfM1DEHwT0ksEnTu9hJ7Wl6kz0IU8sgFjWK2qUJqk4sQexhsAX
	Qldw4poj9qR7deuTq0gtLUHPBFT0swKIpfLh0hN64aYwV6Lf5R17AztAk1VHgHX8O8RlGIcWYlg
	==
X-Received: by 2002:a05:6402:5515:b0:6a3:ee60:b13f with SMTP id 4fb4d7f45d1cf-6a6829aeb56mr9034745a12.14.1788450314628;
        Thu, 03 Sep 2026 08:45:14 -0700 (PDT)
X-Received: by 2002:a05:6402:5515:b0:6a3:ee60:b13f with SMTP id 4fb4d7f45d1cf-6a6829aeb56mr9034715a12.14.1788450314163;
        Thu, 03 Sep 2026 08:45:14 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f94242csm2510375a12.21.2026.09.03.08.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:45:10 -0700 (PDT)
Message-ID: <81bd9bf0-e9ae-444f-ac96-a341ae7faffc@redhat.com>
Date: Thu, 3 Sep 2026 17:45:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v5 0/6] Fix a variety of TPA bugs
To: Joe Damato <joe@dama.to>, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, horms@kernel.org,
 michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
 kalesh-anakkur.purayil@broadcom.com, colin.winegarden@broadcom.com,
 rukhsana.ansari@broadcom.com, linux-kernel@vger.kernel.org,
 raphaelcf@meta.com
References: <20260902015652.2421609-1-joe@dama.to>
 <bb4ae7c9-e705-4eff-9813-065ea4bd9514@redhat.com>
 <apmQGp1mEhQ1EiEb@devvm20253.cco0.facebook.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <apmQGp1mEhQ1EiEb@devvm20253.cco0.facebook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/3/26 5:19 PM, Joe Damato wrote:
> On Thu, Sep 03, 2026 at 11:37:34AM +0200, Paolo Abeni wrote:
>> On 9/2/26 3:56 AM, Joe Damato wrote:
> 
> [...]
> 
>>> I boot tested this on a Thor1 and a Thor2 machine and there were no crashes at
>>> boot.
>> Waiting for Michael's ack here. Note that I think that the AI report on
>> patch 5 is not a blocker.
> 
> Aright. If there's no reply within 24hr of posting do you want me to spin a v6
> that:
>   - fixes the commit message sashiko doesnt like for patch 4
>   - fixes the resets stat it mentions in patch 4
>   - add the return value check for bnxt_init_ring_grps in patch 5
> 
> or just leave the series as is ?
No other revision required IMHO just for the above. The 2nd and 3rd
points could be eventually follow-ups.

/P

