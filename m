Received: from mail-ej2-f32.google.com (mail-ej2-f32.google.com [74.125.228.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C34D4D2EF8
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286538; cv=none; b=XGmY2SlHBK3wPnsl8eH/H1vomDXCqlRq3iT75dX3TVKJPveDwOOHGWQBzFuF2N2scQe/Vb4Nx8ojIYC6vZV4Jjli9SurWQLmh1/eAaRFCRApiP441OVPlMBRsrvpGHmBXy/BeERBOZ4+lDkmGc5anwSdgtiT/ZUt8RUVsXAkvTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286538; c=relaxed/simple;
	bh=+bTnSt3emqvX/u3TSnqSXB2cSUSvItl6IDfwbhpwNPw=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=GUQ3KkRzEbPnbPOFPiteHN4Ygk/ZPdFfaj7i0VS7v/xEA3jYnfqIyhUpIfeHDwpeATHj7B4jxkSK0CeWPpbYpk3gegOt1xkS3P+Ck0ULHpiwCdqhVflXXaigShdHm89EN4c5cXQMPnWLCVsTAsisqhkjwMdOv1RZqKbbQMv67qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KiwYNDA3; arc=none smtp.client-ip=74.125.228.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KiwYNDA3"
Received: by mail-ej2-f32.google.com with SMTP id a640c23a62f3a-c254f55efebso42329366b.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286536; x=1790891336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V2P12fpVrgq7wOLuxL2hcnHvjU6EVrhPKd2g6E7O5Ns=;
        b=KiwYNDA3WkcJoKyhl6bBpGQ/+hENvzHJMlcsjB3J8iFlJ1jFu2e4Vjf/umHEm7a8iM
         oYR0R2EXDPngKjnE6ChSyIkH6Um4xT+0XZTlcy0u2SNDuMIMtr6wS3Md8NubIzLulRlB
         d9lwjdOpM0BUD9TDJpU2b37hIRRPhNIVCY9DIACA75h4Atu1iHuLj26IgFQ5XOlaj98m
         m8EZxmvgLbbnQIShulLc194vVSy7mNCRoDBKjlKzmsbtpV48dfgvn/GaYMXy6xaE3MqU
         3rJBr0WQI7UaXCbMudtjfnTwJkUqFXPA4m2Tg/8qVnlKa8AJrUOvE4ya4fGrg9LnPS+b
         +LQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286536; x=1790891336;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V2P12fpVrgq7wOLuxL2hcnHvjU6EVrhPKd2g6E7O5Ns=;
        b=hTPG6wvDuvOSijsRsDxWlOSpi6QslAl+ko12CewNDyC4nrbn5JQ97wGjvJ3ml+Hww3
         PAYtW6IcDZLsh8dYDHjsfTiiN0MR74p5V0TXdmCjeOGil3ayVjovvG2peKWwi6T9Oef/
         m1bCOsZeGjer8n5DiqogLvPuIquQnVNkCzJugEMOW8Jr58GwhxxIYSImr1KzfAk/BRb2
         lWZjNT2D68x5RHudvEWRVy8V5JIydOARv1yC7eurawzTt0iDZTZW/0TyEXGS8+rY6tbL
         MVzHxt7+qQkXgv8EsZDLA16eYHsvtoxdIJIG/yNTl1AGSgqOZu3Gf4G3OZndzi5GEV/l
         wPlg==
X-Forwarded-Encrypted: i=1; AKwUvBz2YZJCb+EYBngFl/DxUxiSSeCFwVkF2VNoZ5UniXehPc2NsbS826w0cPGwa+A0xqMXtPXUeTpS22jsW9k=@vger.kernel.org
X-Gm-Message-State: AFuF++m8bLvVxgf1Rm94p59RdhpaJ+VnjAhlc7FgvkPrkpbKJQfD42hg
	pMOTmI9qE9GuAvXr/GA0X0zf6ADbXeliDM+/+kLvymQCmI0z065n8U3fToy2wAmV074=
X-Gm-Gg: AYBFou2uyKY78pH/zcxJRQVkh7aDlnZCro+alsG9yjVfYukKs3ztVOyArFB9yHgME3C
	zk2V0JUFG2lxzwnOa7gDFQrWsJ3jXbrY9w/vh5WHUOpHvbu9gQr4MpbVxqKdI7ozgMhVWGo84H2
	aYdk2Bp0qsRl6PBfmM3miXec0FCY+lz3nWsm1EZHx2US7+PTJKvNIn6QHoGkObHD9eUAFrvvPJ9
	TZ+GA9FwcR9bhMxwaWt2YWPttBPu/aW4OQypkOmkyYgsGOZ6alXPElyWU2/yu83yCZ9RsjUkkqA
	9gjvonrze7dtJCK+o0J214SuTNRLkuQjuYg9sYyqDJEL/BB2tVWDGmDdGms6q+BhZNXjGss7T0O
	Vjq+nyZvfkHBJaTSIezNHkwogEih3V4kLdV+gLcagKEYCwa3rxJCRdf86CsQkDXO5SbVheX8ZOC
	TDq3AkWzSh9o/fAa2IeS+hPbBPCuA921B6HJMh+cNlZzvQ3Bs1EwxEJib/Y0SXf5KEzi++RqF0V
	+5xEyHA2w7N9OQGZx0AlCQ0nk8WqUctMDQsZEMXgxQ=
X-Received: by 2002:a17:907:9447:b0:c26:2eee:ffc7 with SMTP id a640c23a62f3a-c2ac250ec3emr317347066b.35.1790286535550;
        Thu, 24 Sep 2026 14:48:55 -0700 (PDT)
Received: from [192.168.86.89] (81-224-151-184-no600.tbcn.telia.com. [81.224.151.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae678ec74sm20420166b.4.2026.09.24.14.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 14:48:55 -0700 (PDT)
Message-ID: <6432e712-cafd-42bc-9adb-5e620e57ccb8@gmail.com>
Date: Thu, 24 Sep 2026 23:48:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: erikhakan@gmail.com
To: =?UTF-8?Q?Erik_H=C3=A5kansson?= <erikhakan@gmail.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>,
 Bastien Nocera <hadess@hadess.net>, Rafael Passos <rafael@rcpassos.me>,
 =?UTF-8?Q?Gr=C3=A9goire_Stein?= <greyxor@protonmail.com>,
 Alexey Zagorodnikov <xglooom@gmail.com>,
 Roman Stingler <roman.stingler@gmail.com>,
 Lovekesh Solanki <lovekeshsolanki00@gmail.com>,
 =?UTF-8?B?S2F0ZcWZaW5hIE1lZHbEm2RvdsOh?= <k8ie@mcld.eu>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] HID: logitech-hidpp: fix Bolt hi-res wheel handling
References: <20260922-feature-bolt-fix-v1-0-63b0fa8da0d3@gmail.com>
 <97b3c67c-03ea-4ae6-ba64-afcdbbd8f36b@gmail.com>
 <xpFXjeFKTb2mOjg5M5iN0g@natalenko.name> <r8QjhQUkS86zOaJsxE4nUw@gmail.com>
In-Reply-To: <r8QjhQUkS86zOaJsxE4nUw@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

My mail got cut off for some reason, maybe Gmail thought I wrote too much :)
I'll repeat the end here.

Benjamin Tissoires wrote:
> Bolt in kernel was adding in 7.3, so I'm going to revert it now, and
> we'll have to have a fully working plan for an eventual inclusion in a
> future kernel version.

Since I'm completely new to kernel development, I don't know the proper
etiquette here. :) Do I submit the new patch mentioned above as a series 
with the old reverted commit first and the new commit on top of that, or do
I submit it as an entirely new patch?

Cheers!
Erik
