Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222775;
	b=Fx+FJ4EeLodU22G6/mpfxQH2t4xhukzI0NDgUBYxcym+J9ylVAsbUq+arkgoreqxHiDb
	 x+FbJZ6JkcYgv7IOxgIWp7MOxv3RKIwx3AqNT+XM3BkR3lW3p5YTc8Qjf5EVVdyhCMG+r
	 DtITkj4eZ5hdmIyIDE1pCOcZj/VrJ6LN+q42fV7U1+YarLak6x0PBwRbJSluvG5XsMSPk
	 YpmfQfcjwbQ51OImWm109JwRHZsIq6TVXL3MEjlPnZzZ6Pg/GrkwWakQPf6EgZNiSWhop
	 TvvRNCy573aUlXJBvd7pgpXbv/e/zVu+gk0zmVbo6M90VC/Vtao1KFkvYoPoBwWqNzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=6gvvAaf5oqzPrIz/4nEh4l4rMyZ25yG9p051XezDf08=;
	b=lJ9I8m5WcTgqJfyfUgkFIDGT0C65gO6b3yuJoCT4JNUiuVBt9ZT52VgYAk4SCXyBe9/r
	 Foe2urIC4gxvTEoWXCa3xPsVrdVIe5GpH6AzvsRZql1qEQW2pHJneTFcwaJ5TepmPASP0
	 vzzsv9476Pv87xYzsea1MuM7z6I4dnCjF4SKNJZqaiK17naNC0DFyV590/68lGIWIWRGn
	 svrcwtuxEwn+JbLR2Rv+coEZPCO0dOvvHPIxtmAQjwEtQRwDfPjyk9TALQpwVX5d+HvRV
	 ur5uCQXpvuwNaJ8smKzfSXpX+vtrbv0CzSQrxSyFyC4gvVkbi3M98tU6vGubNDpYfiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QD9yN87U;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43838606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43838606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QD9yN87U
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-14394530ec6so1700657c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793222773; x=1793827573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6gvvAaf5oqzPrIz/4nEh4l4rMyZ25yG9p051XezDf08=;
        b=QD9yN87Uh1J0d6iiUIj1W6WctIebIfGNxt7h9QYUIeawwYdz7ichnWcdtO//xOQ1v6
         O+EUX13ENy5pr4wT16aHkRYAJ8eNwYbD1dbMhfegvAuJKb3lTHfMFeRr18Uw3k2eNyLW
         9eo2FmtbRlFH+4RUAsVFYtsl1VJzdqiww4rD+cnQhAs7lw8NYR7WO8zFIgn3mnJh1Z7Y
         d8Eamf2elVNEahnBgktHdT7BzWpx+YQ2PkhCQZ54ks9gi5sL14hyK7Y4dN+bbhS/+XW7
         bQWJAeetcd9ZCv9t8EujP7eCRhN83M0dUeJ+oRNF0P1+ZBG8/OIS67HRYQwDLzZZgbZy
         Eg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222773; x=1793827573;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6gvvAaf5oqzPrIz/4nEh4l4rMyZ25yG9p051XezDf08=;
        b=j3dUkwDNJJxj+KgaZl8m5e87WfNeAqHroUg0WmQfeDmR4kilh+Pi3F/JwOzB46Vbs8
         0WdgF7U9VqE/8JAIYVSc8B0L0Nm00VFV6dvg24pLPVHL+zkluF3eZFbEJTC6+M460WQb
         xPDN2cPPY1fO3dkGOdjhSil/vV4Beqg6RRrGWcbEPdbgpq36PP0dR6MKSzKOi0b+3ZnG
         M5nLJqypsmjSxpvwtFVStbAL7v9Z7NzlYM4Lc/rj8LiT33Db5mtDnm4gmbUd5Q+GlgbU
         GQ3wTISIiTD30Ya7jS8pkZOYrippxbjI1Am1urspROcO9tWjr7IJ0Lt/tnUH4ivXMc5x
         7wvg==
X-Forwarded-Encrypted: i=1; AKwUvBzvYV3p3LEJrU4/Z3mPB83TTgCybbswAmS6EnWFciN1k9Lsuc2oMjDX+IASoaXblnoEgtBLs8o5wwE6CO4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMRc4usFYVgh41peB3cAKO3whtRWtJ3MQYBipmH0WPfE4xFvM0
	QXxUK7o+YtNoQABuyhl05SHtq7bmMAwQNb8W5Z/rcxJ52sH0fZdvnT1h
X-Gm-Gg: AYBFou3HiEAXaqDpTgQ3k/jWDh3qYZzI+eSXvnMo34neFhF4P+PzydjI6Y/jQJkzLDB
	m2p7jan7i+xlunB3XRnourHFu754086tJZnHLax66Cjg0nqRMG3EE/cim0aFkQ8lMtG+eUiMa9S
	1511pvQVldPxZjzqS0gI6tW3vEUJ9rAcEW/7UWd6PT1jKIiQR1uG50UxXaSUgLNycftiwMwHgo7
	4toujg1AOTCHA+h3WiR8WYjGaqQfUe6gWT8RUAji8WFoJAxwPdVx4VD1Ye/0deyawrkED7g2kQ0
	+AfV+vUG59FNrKsgN/Xzde2AHeikvc395tYX44RXcSc8ksur8sfLB3I7qKwGowZKNwAApBDhX+U
	26kxavUKL9SSG+295pJuO96OQn6y5TDKMrLrpiYRr4MDa1X36bZcI72UgeEma5mYUCyV6o84LpA
	6S+l9BOg7oB84RLh8QuB5z9egObM+lC8H3H0RlhIabusXjZh++0nfvGeZeYRGFky4sU8bXhdBeF
	JVO3cZ3sjbJIqvZ7rglNe1uY2+Gom4XD9CSXbJ8TJjVdUO2vA3Y3wImR0RcifZwC0G66VTHb9nM
	93oiisulvKLE5He6ReTCDTkhtLaeJ/B1cMgGPKsuOxGui34u20ZZo8Hj
X-Received: by 2002:a05:701b:42d1:10b0:1a2:6b9f:f7e1 with SMTP id a92af1059eb24-1a6ced8ff72mr4944038c88.14.1793222772917;
        Wed, 28 Oct 2026 14:26:12 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm8109314c88.10.2026.10.28.14.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:26:12 -0700 (PDT)
Message-ID: <d989cca6-f049-4c87-bacf-8a6a4832dfbd@gmail.com>
Date: Wed, 28 Oct 2026 14:26:10 -0700
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
Subject: Re: [PATCH 6.1 0000/1887] 6.1.191-rc1 review
From: Florian Fainelli <f.fainelli@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261028170459.200466217@linuxfoundation.org>
 <f09f94df-c5e7-45d5-86a6-50be145f6655@gmail.com>
Content-Language: en-US, fr-FR
In-Reply-To: <f09f94df-c5e7-45d5-86a6-50be145f6655@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/28/26 14:12, Florian Fainelli wrote:
> On 10/28/26 09:34, Greg Kroah-Hartman wrote:
>> This is the start of the stable review cycle for the 6.1.191 release.
>> There are 1887 patches in this series, all will be posted as a response
>> to this one.  If anyone has any issues with these being applied, please
>> let me know.
>>
>> Responses should be made by Fri, 30 Oct 2026 17:02:34 +0000.
>> Anything received after that time might be too late.
>>
>> The whole patch series can be found in one patch at:
>>     https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/ 
>> patch-6.1.191-rc1.gz
>> or in the git tree and branch at:
>>     git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable- 
>> rc.git linux-6.1.y
>> and the diffstat can be found below.
>>
>> thanks,
>>
>> greg k-h
> 
> The ARM 32-bit kernel fails to build with:
> 
> In file included from arch/arm/probes/uprobes/core.c:9:
> ./include/linux/highmem.h: In function 'memcpy_from_folio':
> ./include/linux/highmem.h:427:21: error: implicit declaration of 
> function 'folio_test_highmem'; did you mean 'folio_test_hugetlb'? [- 
> Werror=implicit-function-declaration]
>    427 |                 if (folio_test_highmem(folio) &&
>        |                     ^~~~~~~~~~~~~~~~~~
>        |                     folio_test_hugetlb
> cc1: some warnings being treated as errors
> host-make[6]: *** [scripts/Makefile.build:250: arch/arm/probes/uprobes/ 
> core.o] Error 1
> host-make[5]: *** [scripts/Makefile.build:503: arch/arm/probes/uprobes] 
> Error 2
> host-make[5]: *** Waiting for unfinished jobs....
>    AS      arch/arm/lib/csumpartial.o
>    CC      lib/math/lcm.o
>    CC      drivers/video/console/dummycon.o
>    CC      sound/core/control.o
> host-make[4]: *** [scripts/Makefile.build:503: arch/arm/probes] Error 2
> host-make[4]: *** Waiting for unfinished jobs...
> 
> this is due to 341d4e6294d9 ("highmem: add memcpy_to_folio() and 
> memcpy_from_folio()"). We would need to also back port 00cdf76012ab 
> ("("mm: add memcpy_from_file_folio()")

And there is this other build failure caused by 997f9c35fcad 
("Bluetooth: MGMT: fix crash in set_mesh_sync and set_mesh_complete")

net/bluetooth/mgmt.c: In function 'set_mesh_sync':
net/bluetooth/mgmt.c:2188:36: error: implicit declaration of function 
'__struct_size'; did you mean 'struct_size'? 
[-Werror=implicit-function-declaration]
  2188 |         memcpy(cp, cmd->param, min(__struct_size(cp), len));
       |                                    ^~~~~~~~~~~~~
./include/linux/minmax.h:92:27: note: in definition of macro 
'__careful_cmp_once'
    92 |         __auto_type ux = (x); __auto_type uy = (y);     \
       |                           ^
./include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
   105 | #define min(x, y)       __careful_cmp(min, x, y)
       |                         ^~~~~~~~~~~~~
net/bluetooth/mgmt.c:2188:32: note: in expansion of macro 'min'
  2188 |         memcpy(cp, cmd->param, min(__struct_size(cp), len));
       |                                ^~~
In file included from <command-line>:
././include/linux/compiler_types.h:387:45: error: call to 
'__compiletime_assert_741' declared with attribute error: 
min(__struct_size(cp), len) signedness error
   387 |         _compiletime_assert(condition, msg, 
__compiletime_assert_, __COUNTER__)
       |                                             ^
././include/linux/compiler_types.h:368:25: note: in definition of macro 
'__compiletime_assert'
   368 |                         prefix ## suffix(); 
         \
       |                         ^~~~~~
././include/linux/compiler_types.h:387:9: note: in expansion of macro 
'_compiletime_assert'
   387 |         _compiletime_assert(condition, msg, 
__compiletime_assert_, __COUNTER__)
       |         ^~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:39:37: note: in expansion of macro 
'compiletime_assert'
    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), 
msg)
       |                                     ^~~~~~~~~~~~~~~~~~
./include/linux/minmax.h:93:9: note: in expansion of macro 
'BUILD_BUG_ON_MSG'
    93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
       |         ^~~~~~~~~~~~~~~~
./include/linux/minmax.h:98:9: note: in expansion of macro 
'__careful_cmp_once'
    98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), 
__UNIQUE_ID(y_))
       |         ^~~~~~~~~~~~~~~~~~
./include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
   105 | #define min(x, y)       __careful_cmp(min, x, y)
       |                         ^~~~~~~~~~~~~
net/bluetooth/mgmt.c:2188:32: note: in expansion of macro 'min'
  2188 |         memcpy(cp, cmd->param, min(__struct_size(cp), len));
       |                                ^~~
cc1: some warnings being treated as errors


We would need to back port 26dd68d293fd but this does not apply cleanly.
-- 
Florian
