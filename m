Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509295;
	b=RAB79xRUZuh2Q7tTgE4kJYjLjICbqaHbpKP4xwWKhRJSjZOGvIjUWa/qGnEt/yZoq+wz
	 nizAmJrOraEEjGkW4HgfAL1dGNqgb3t35ZyFGWZXlPBxSGa4MP0JJTPpV9z6eQhL7TDxq
	 VZdG0SSsuVgs2vRqtmKoMQkFVdQf8m9s631i0sDL/uijIC/MCeSURXYUIUprVYVpLZCYG
	 gZsrUIr5MK6TCDxgzNAalI63JA04blxMLpGJRHkDy/SemE9kRdfmfGssFZrhwI5pQUA0X
	 3WbGYD+qBYjA7dBJ2O7HXFr4e9NdgE5a5L8XwGp7gGP2z4xTcUottzXoKCJcmyj4yQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Lydv4Hqlv1bxTLvka70pfIXWjsq6o1mYniyvpSrIaG0=;
	b=GIQCq/sirqh/Uvus+0qsdMKObX3qDJrcj7Q3YFGevismf4kTSjum7b7V07dY1v5hMH4y
	 4F7VePH1/Kasm/UD6qT6PGkK514Z7t8Zs8Zrmi0ip1Vu73ZBbyKuD0cyUWt5LGm4UyDye
	 i45KEb5K21Gf4iWxaX+qbsdkblCsTTvo/KcUNASKD1y00KPERD6ZC7BqUhx1ZMPbg6TUf
	 OD/O0ju2AuP7erZAVVOrHydd5kj1ulDwqelBN1+y26S+dIt6+wBuwIWw6YdcCQ5tnu2Z0
	 +Q7+B8kY95t6rajP1E48T0J1lrtxhGH3Vss31r6RGzS6Ub98o44qSnoVUFNqwNT2zPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GiEPqnFp;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD4C606A329
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FD4C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GiEPqnFp
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so1249907a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792509294; x=1793114094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lydv4Hqlv1bxTLvka70pfIXWjsq6o1mYniyvpSrIaG0=;
        b=GiEPqnFpR9AXzcShDpIumadb1Sbnmyrn9eX7hUEcMyzZbTAmk4mAFyODa2xZvYCFzE
         HkEEXg6o4c+Z46ZV16Ds+7/VzTRuAgPm2z7yeZfUWoyrFphox9kxGEZlP39Z+5G1P9aH
         0jh0Tcx43Te0Sfc+g2MnBIild26beuolhyS19eJokthhsgzO2AnO+5h3fdaHzNmNEOx9
         sbkZRy0ugD9Jn3JCh+PGUJVwKdKqsB2+NTInuUZKlHRDaGEr1nsKd0Dre8M89Dz0tRnM
         VlduIfRzAJnTxXFMMDpY/C3PBlNLTnT+v7+f4WYOBx2zETWyptUx+gPwzFy/klaEoDtP
         idFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509294; x=1793114094;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lydv4Hqlv1bxTLvka70pfIXWjsq6o1mYniyvpSrIaG0=;
        b=FKcTSGWL90oGo4W/2LkRyZsgoafBG5i/36OoEnNxqw+vrfUOtFpPAxwGOWazgXl/fK
         UYTfG0BMPGl7K77hTVbasxKTwhZTD+jXDVjcEaLQmTXUdkFbesiexKV3FWBYVd1BMOY4
         5+QLeLX56QUrfGB2qsyitbhi2wyq7IHTo6iOl2MkcmtstqTMvh83M29v0Zr2ZGEfteLb
         wCexw1OAWzSmFfoTVx99HYhXi1alXBaAvyGBak1f7I9I3w0ylu4A68zWon0n1XievcXD
         r1iG7MycnsvsxTAyWTriUn/a7uyqG805hFPh2GtB1Eo8274Va82O8w95o8JkhYuG0jOF
         HCaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzixZ6l/85pWwlNXgp+M01e1kovxAzYZoEcVH+EW0v1nuzwQRrZwQjODXy34l4sdTeOptzBzC0ZIUerKsQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN2OYoEkKUWONr5ka7++4eNe0QBw0+LSaKe7xaKsFnxHQSjBgW
	7j/2YRWd+d3pX85vBmWE0TZxom071erKARLmAAsIS1OZBrlnw3kSgntO
X-Gm-Gg: AYBFou19gDQCu2POf1P4hL0T3s6wFYTtrwI8Nz2CBrW0joJA7iUYMMmUQYLF+/HIww5
	rIQGcdUsNXGnxRTqL8Zh36APxthwUReLY+gLijYrVN5G4udZ1sNMXLkKWJbP+qOI1/XecZbWeBY
	UEDaI5OQt5tS8n5zoDhq04yxlx/x+44nopzJZu1qw2xHi6eFU2eR7K0P6zYYW41geXigl+m7Bzx
	ZQUDoPU3iCsaSNr5g1jhb1AYl2wsSGDifPlCUObxlJ99iygIBTUR/+32pu6w56g57S/lUyV4y1f
	3wSHP44ztZYxdoJ20QAZPNjPxXRMhO/J5tJjfFU0cGb7sMXBdeNnY2QJXRrMJ24a5tVZgW72wKF
	+7nnYby2FE13O59IpFdy/ynZbIrpyNIwpeJHI0hzlenKCrr9rGOa38+Y6oeNS3xvnOE5dgHsNl6
	4nAYjX6KYItzbwcU5nlTCN7Xi61lfLRNOWWoVvyYYjeZ5DbjEZQ1tQvVZ0f/tNjzGwYO+2pqrfd
	dhwQo63Q8phbr0oB4g0h/DC33YdY/ClDVgZC6Idx/Y/1kOG
X-Received: by 2002:a17:90b:2c90:b0:3ac:b7b9:6484 with SMTP id 98e67ed59e1d1-3acef0fe32cmr9268033a91.45.1792509293876;
        Tue, 20 Oct 2026 08:14:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad801373eesm63002a91.9.2026.10.20.08.14.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:14:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c84edffe-6e09-480a-8986-9b72f9d055e8@roeck-us.net>
Date: Tue, 20 Oct 2026 08:14:51 -0700
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
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: ltc2978: Add support for LT7175
 and LT7176P
To: Christopher de Guzman <christopher.deguzman@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20261020-upstream-lt7175-lt7176p-v1-0-86b9b728b95d@analog.com>
 <20261020-upstream-lt7175-lt7176p-v1-1-86b9b728b95d@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261020-upstream-lt7175-lt7176p-v1-1-86b9b728b95d@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 04:45, Christopher de Guzman wrote:
> Document the compatible strings for the LT7175/LT7175-1 and
> LT7176P/LT7176P-1 PMBus buck regulators newly supported by the
> ltc2978 driver.
> 
> Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>
> ---
>   Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
> index ea8b1553a3e9..467c6ab4a29f 100644
> --- a/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
> @@ -14,6 +14,10 @@ properties:
>       enum:
>         - lltc,lt7170
>         - lltc,lt7171
> +      - lltc,lt7175
> +      - lltc,lt7175-1
> +      - lltc,lt7176p
> +      - lltc,lt7176p-1

The -1 variants are not needed and/or useful.

Guenter

>         - lltc,ltc2972
>         - lltc,ltc2974
>         - lltc,ltc2975
> @@ -50,7 +54,7 @@ properties:
>       description: |
>         list of regulators provided by this controller.
>         Valid names of regulators depend on number of supplies supported per device:
> -      * lt7170, lt7171 : vout0
> +      * lt7170, lt7171, lt7175, lt7175-1, lt7176p, lt7176p-1 : vout0
>         * ltc2972 vout0 - vout1
>         * ltc2974, ltc2975 : vout0 - vout3
>         * ltc2977, ltc2979, ltc2980, ltm2987 : vout0 - vout7
> 

