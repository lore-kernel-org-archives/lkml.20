Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E71C49B446
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789679210; cv=none; b=cY/Y/iY7FFjXLnHSg/QIvlDu7pqacHFn2ulTjutbDD1rhciHxKOiK/dn9Aw39pihLydbMD8Diq9/Lqu7uV3pe1QDtASrK/jhcx+zzy4TIt/whJCr6+v+L6MAjTTw6BCl3JIFFX2LziyPowtacYdW19A3nj5DtfiDOyV4Wsn0Z/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789679210; c=relaxed/simple;
	bh=HvdkJ/FnzyzxhIRWpbHKeoBcBq03AZPrsWZYmOz5CAs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fgE3idMvSHTHzMicMlC4xuYACv42ZybwfHRntp5ggN8yl0m5cXLGr78jcHQg1lup86HeG2dndyZsTJDPwerkcljs8yktaU7cm0biZcUzbkFLZVDvNrAaUN9g/7DljUSexhLxyx3q4djPvrne5/9fLWMgwKbBZkcuw+VyHcRoxUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBoZp6Rj; arc=none smtp.client-ip=74.125.231.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBoZp6Rj"
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-4c9a4910efeso28303b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789679207; x=1790284007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UhGqQvEgqcceDfwacv9AFFFJVljDY2FHfHQZ/xmKpow=;
        b=lBoZp6RjM/W3pmMw9EnkPietdw9V5oyHAbw2RFTBbE8VwDTG3lUNSNhJ+BSC1qWI26
         YYPCU4zo2lojubhabEmZbNuz2fDSYlyhRg3y4HuNt9Vng8o4jcQV0y9V1enmTKTIbIpv
         smxoZBNVWMRbFVHnE3vLVyqtikfxsY34Tdw+CPNPX0K10yfKqc+wJoc8j3LnzvYfnLjT
         75awwiBDm2DfsLz8O867Rv8O/QGdwCQs1lHgyr29JXfz6BB64pZEGJZfqlKXZnI9zTsM
         5T4OeItRruo9VYdSd+F8Kt1pjpZ0c6QlR2RO/RMtxyXyCd5t74r6rA58Bc36ozz52EZ0
         Pe6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679207; x=1790284007;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhGqQvEgqcceDfwacv9AFFFJVljDY2FHfHQZ/xmKpow=;
        b=0HDjWiyei1MNNgGw5lloopQ3RyNq3BMqUBcLr88/HK84+dgOlAcKdKYnKZvLJX7T+H
         JoJH0Sfz+quYhwevKTAgXyoNEP7PVDIoalgKjKowh54ZWoftl5J4E0PfNKwv48JbPFeU
         VQpLn+2IjB2x/pJpiwiFk+IylGlUO2DZ0kNxMdCQhMEjwOe8wnNlG/OMF7YLbhBVhuaP
         4d9fS3jJfU37vRFIy9m9D8X3LndlIJ4fAKinGOCshANVa3hHAywZbrWpZh1/w4gHtg9G
         XRoRzge+9eRl2gX0LFCBNIlzrqPAX9t1BIDorRr1PLiXJpv83s3As76xdTrHHOT7hOz5
         UQeA==
X-Forwarded-Encrypted: i=1; AKwUvByPpj0MAJ0j71d6qUn7j505r8pz604UX8PcP69bonPEr9mfvx/b3ljpTMRKgJ6+7XW2o8N9yyRfRo6O86c=@vger.kernel.org
X-Gm-Message-State: AFuF++m2nMUhiaWIg7axCQwB+3YnRVSKK0vZ+ATPZLppqq4sy5cs1O/b
	9zTjkA23gzyLR0fCS7bVpflq0Ipjy7ilBtzuTSuQDQMEp5jWZBeb6Y0t
X-Gm-Gg: AYBFou2XwZAdemgnj0w5RRPM4PP4nU8NyN8IMAIL/yQ30ViKYe6W51kVUEdG4UqHSr1
	2jlIKQLv4w6p+GYfQRmno3gElvKp/tFjqtfS9suuj3eqBslhELQ9DXH+WYs+1RJ7/nzt1WZxs3+
	/eUu3Iwww9LFNQ+a1kq2xwv30H3t5x9kvuOOnjBb5NXdJ70qdsjnU3XBJONQ6laTARyhzKDUcpl
	TsWzDih+csOKZspDwPh0t86SCbFYgOkk4DsPWUpW1nc3Uw+TUkryA0fqHJU9jHuCkCP2oXPEq5D
	joV/gIpypklch3tSUa/Ml2r3HMW5N3SSxtwrlD3jKR6r1KTyvypTmsOHW3eZtVxgqc5kSfzHmkF
	C63Sf86er0pnjISGca1xKqXlzyu6SKYZdEss6+b9GFC2oSRnFHgfV8ISGGgT0DHtgDpSAUN8c8S
	uUUWuSt0ULLcfq74a3ZYB0CW3k5W6KOILy8tLJER6sLubM4ZNW1OmHrSKgSaQoCgsFF7HipEZS+
	TgLfP7GZo97S+s=
X-Received: by 2002:a05:6808:c175:b0:49b:33c8:4b75 with SMTP id 5614622812f47-4ccf6a67699mr616748b6e.5.1789679207257;
        Thu, 17 Sep 2026 14:06:47 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6cd41d0asm3431836b6e.10.2026.09.17.14.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 14:06:45 -0700 (PDT)
Message-ID: <bc93ea43-0650-4a3f-919d-6e0272d24073@gmail.com>
Date: Thu, 17 Sep 2026 16:06:43 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
From: Ryan Brue <ryanbrue.dev@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
 <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-2-d35d2ac3d6f0@gmail.com>
 <aqpnpT6hU5Z0s1TZ@ashevche-desk.local>
 <71a6ed12-f089-404a-85ec-546e03b4db3e@gmail.com>
Content-Language: en-US
In-Reply-To: <71a6ed12-f089-404a-85ec-546e03b4db3e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/17/26 4:01 PM, Ryan Brue wrote:
> On 9/16/26 4:55 AM, Andy Shevchenko wrote:
>> Why not add this device support into that driver?
> Please see [1].
>
My apologies for double-replying, I forgot my link here.

[1] 
https://lore.kernel.org/all/2d1b80f2-53f6-4ed6-81bf-e35c0a9efb26@gmail.com/

Best regards,
Ryan
