Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792461620;
	b=j/P4JVCqN7UyZTyKlvXGB1lNy4hIuf20ItSqdE7MJE2X5M0zs0AJ7xVC1boxEu6pZCgV
	 LGmD6E+HKZxH8CkJhs0aQocCZWxjH/am0T5MB0fkH7FGqVt/TNZn5dWTmwPFjESVW8AV3
	 3NlhdjJOzjuvUtXoHaIxOTbIj6g60pTJdhuxdsudVjniwE41CUZJCXRIQHaqCkJveIpvW
	 cTfNrKF8UFbIF5w7GLWTw3byfiCi6okabetmhj+1+DhCSvgDlERMaylYNMYvifGpAiCD7
	 GcfLsiO6drmzqu6W7JyWrnkOpkZwLvb2mwpj8w6hln1gClOLr8EwNUgF6WqRciXR7aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pGsi2hGwO9RITOLJ86JItlXNxgoF2FSVbW3ahP5GtgI=;
	b=Ge476ZS3Ze3+VDxmMff/1zCppzdK5f7pLxZcmqbyBFRC0Mhzeqk60uPxc5wn4thAWx5P
	 07HZhA1L5eS8aKTxPkEtaeTOJv7GKF/ZkQzRsaC52ORljB/TDh8bGtf7LApXxr/Z+05Ze
	 e/xyVxjY9ZPr38V3tF0HaAyryTatUw5CdzAE5tkOaTg/FMjTn3KW/micjzfTDj+ypTA5e
	 NJlNuLtigHj2XwRB7gdvYPlR1g8Hm6U+kMIH+vC8ZWxul0FnZ1jL6mdMrsDUOARbKpsLq
	 5DCLpZ0w20tgT+WBw8BgY8g5zhHFdOLm2HKI/NK8hRTGpf8UFkuMpBxSrwZXsp0ImcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="bd/rLq/m";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E07606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45E07606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bd/rLq/m
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1517bda04a0so2276638c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792461619; x=1793066419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGsi2hGwO9RITOLJ86JItlXNxgoF2FSVbW3ahP5GtgI=;
        b=bd/rLq/mAQ2LYtc8KQcgYgeeQwbMILEPb5vg/qHePffNIFHn6wxWbWIMDcbGhrfeTV
         Pk03zSwKNE67ejR9oEF9LLX0t+LEHpqjHyvEakuK79L81aTrjePLUOTMk9/glyWOsicN
         AZUjuk7vLOSr6v//QN4xEjP4YynR+nY+/RZau5o5pS0ZVH1518GJeCytlK8/NpeefgOF
         Dsrpf0/fjkXB2Ka6g+gWmep5/E8ugX6Itg5RUeoNzd1cV/RfOfhgArUKYCp8ECbPTMKk
         zU4iD7bF42APuMmCnbnuVaAu6h4NPRbkqrXZB121ZTbM0hX7+yzUjufq/R2nMqCJH++T
         hC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792461619; x=1793066419;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pGsi2hGwO9RITOLJ86JItlXNxgoF2FSVbW3ahP5GtgI=;
        b=g/VuAV9m83oiBXTcJNoc126/+gRaw0Fhj3XDuEoXvj2YYHYeywmFKha4dGFGpN1T0E
         VeSIM6GZPUTrNqFO6X8I4m4a+JOEHo+SzkWTdsRa9IK/Eai+6GGPZtDah9mH14qByuuR
         wllwDG/YhsgaToXEme9Dw5KDDI8D8+m1svdvozsLAo9/ogYDrV6xa6e5OxYZpS9D08Y1
         9iV5qG42IZQmfpynAeETSAaIkzsf6CTwBoQpfgk7GryG5brO+mxvxA1M0j3S70q/ZqF4
         eSZ9SZR0TyMgXBpXt+Xcp7TKG3znvqpNfUsdvdHOAoqgYYJsoVTBCHcO98ZyYrQGF4VX
         R3Rw==
X-Forwarded-Encrypted: i=1; AKwUvBxqH7jlPx4pUwkVKyTK9Kb7KcT9jKCVrKXjZqFPmce6M+W2frseeyncfbH01/bhrPRUHx/oCOL38iPY1e0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzxXwSBoWfUcMTO+UFnY9fwuvltbjzWewwgtnvo28qtFTFRZrc
	9wtzFUay6ZjhSWzMxuqTT73cSThdHcRV/LlKa9sGumt3OqknjvDIQpv8
X-Gm-Gg: AYBFou1fbB3Tg1zW4twcHAXUrYYEdGcc2u8LekxWZBaQTt8GltUnpbaz6MQtOBbXao7
	OR66vm/wog+pS0CpJttGqKiZnJtXBOiT/8ZTG4n+Vn9KGM/6d5pIZ87mcNqk1Hvlb60X2Hyi1oh
	aU10MucoTcEdZha3R83KiUFk+bLxGEB7zuFoqKItgQplGCAN00YRAavX916/laR6FCnkHNxfaMW
	X90d8aJYBcpZClCDZKV50rKmvSjaw8Ps5ENKOWzHiH7w7ijGeTgNhDwsi0a0a9YV7VflE5qrNL6
	c1LXj8a+Pu6GnFpqBjdXrjdbVYS6h+PATww22EC2LiriXAV8iFJZ/AunO6hSi3IlFQpDuiKmgFI
	tXSiRb7ZjQsldjmKS9Q0vCR6MBuwWwrOp/2BQYJrVxlaowMo0IyxtHoCdANqlnzAovO+8YoebJG
	5Q4S4F5cTT8vTRBeMs0j5BFQbZ67dKwml8Z3gYqdOzR0WL+Iz85a7We4eoxTNhiz71YBNxrPIYN
	wfrMxBIsrQZyFwpjymnzFaQMZlnvJRAiCXdtIboo9RBwwfeqByxlwKAzDo=
X-Received: by 2002:a05:7022:7e0e:b0:154:fa0b:6df1 with SMTP id a92af1059eb24-185139aa6b9mr14485746c88.37.1792461619084;
        Mon, 19 Oct 2026 19:00:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm49419897c88.11.2026.10.19.19.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 19:00:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3e233439-d05b-4d65-a527-882043d64d7e@roeck-us.net>
Date: Mon, 19 Oct 2026 19:00:17 -0700
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
Subject: Re: [PATCH v4 0/6] watchdog: w83627hf_wdt: Convert driver to the
 driver model and add minute support
To: Paul Louvel <paul.louvel@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20261013-w83627hf_wdt-improvements-v4-0-b6f6b60a9566@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261013-w83627hf_wdt-improvements-v4-0-b6f6b60a9566@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 06:58, Paul Louvel wrote:
> Hi,
> 
> This series aims to improve driver readability and convert it to the
> Linux driver model by means of a platform driver.
> Furthermore, support for minute-based counting has been added to allow
> timeout values longer than 255 seconds. When setting a timeout value
> that is not a multiple of 60 seconds, the value is rounded up to the
> nearest multiple.
> 

Please address the issues reported by Tzung-Bi.

Thanks,
Guenter

