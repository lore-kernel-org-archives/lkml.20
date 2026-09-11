Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850AB44F557
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113440; cv=none; b=N7QtTLAI/3tFuzIM6WiB61DgxB59S++fihqRPlMobJxB9z1cEW1a1obpmK572PHaEyBVS/ircR+d9/VmZwN0N7KKD+8iLvdixhUu6wDamhOGLBgSowkBTend821lGpmuF7WQgq2iEWVonJzUEYj16HMjztv8S40eNnpMzfAgAo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113440; c=relaxed/simple;
	bh=x7ObKTZ2HTGus/JCQNOFi9VSB9tl7CEINYbybbpc+gg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pkZdL8LRI6ZhK3vOGACe2XUH9ENko60oAwhvtsD0Aug7a4sDO6OGo3W3cGHnXIv0vGe4+MjyMoBwnTjaGkRu7HM8cr53KhmMbhv0aorn+geUBjnMGYQmqjelam6Sk6Gl1a9YrX522s8NCAp+O2/0H8eU/GkdPYRJZZ6XxPnIERY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=d77uMhKN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="d77uMhKN"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so4711575e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789113437; x=1789718237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XDpaAa1elq+LYiq/gSdOwz8vvhdeP7/6a2iuH9Wx1YY=;
        b=d77uMhKNwFNnsV4hTjjlsPDg6xuc67TAX8nfDvmrVIWW1aDH1Awr2Rrqh4j21mwIev
         qCC6KfRe7RHdHTUqS/oMZySvGCJqJfGkdcZN0RHADu/96CKRTSzDIkyjf54SgfFHQHZq
         5PAC79FQfuiVTxDV/NIkjxhh7i6g4QtAVzq6mRQdtC81q1Yf7jvWeXwUtA/95NlLy90r
         ZKxHdM+JVDWyDUe7aoWW20rvrqyXpGZoUPXARFcb756O29Qdf7vYpmPA4UtZKTCBnFAb
         NM8eqQ7/aqg03EIE4PTyTSwZG5V1hROzSOLGYiebs5ffjXAqgd889YQ4+9JqCJkdNFEi
         sKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789113437; x=1789718237;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XDpaAa1elq+LYiq/gSdOwz8vvhdeP7/6a2iuH9Wx1YY=;
        b=Y/soTNIax4rVPOzP0IJPFGFygFZBSbfSMaa4zMU70mDlj8MP47fsP+eiCsesi//yUu
         FWfHNphCNbOq6V2Hx8CNTi5k0IJsXsZvL4btDvJIZZ3a+u0d7hS4tivZKtlvi1UwHy/4
         4kNzYrlR6WsWv7FryMKcQ1hok6Os1jw2RdzLsUKjtr4ahjTyIphgchH7hY24JcFcg9zR
         61biXnyeh3SlzUCEchBHyARpEv2V01O3f6TDWZRlbaaSKXbemQej5VTP78UNH8HGJlyg
         A9sKlztMLIZQVnw/87viRYmga92dhdb7YOpf0NMeuaUEutyXihXlbKzHbTizopx+8JIX
         UIrw==
X-Forwarded-Encrypted: i=1; AKwUvByWngBxsBArTvHKAb3j3FfvrL6uHQh1V3E776YA8KiQq3HZ5iTdo3nBZZv+fDuZ9azfxQtVb7uHWMC/DL0=@vger.kernel.org
X-Gm-Message-State: AFuF++m9rFBIn/VKQI50uFAZgMxlwnCrlqOfdDnhOVNKXO1IsfEvHh6W
	E+3aDUmgi2HEWUZnMndXj5xFyLun0X1XRiUWf2NrqUn1XGyiqJ4v8/o=
X-Gm-Gg: AYBFou0BRm7CFOJsm09RcKvnT5GddMWiXV06MMjdIE/YXjXUnAyiWN6/7zjEQrAFHW1
	feGENyj/wN5j5Up3X674JHpSMsJfaWEI9moEhzQNl0s1vfHqkxDfSPgD5DtPfobecBqKK/zwLQt
	7A2DZPgdb3DxBNHw6lqRwiKnDxAoPBT1lTkWnrx8Vhfdh4YHYbXyyVKm1IAOcepkcGcMN7VfQ9t
	KdgOYy5LgOlRiWd0dTDx8n/ninJvPXt9k5CiWJwEJHxwjy7d7xF0tqv12rh1uPMTKkmzaZS9oxu
	+9yFP4NyddPqW9ZmQwDUqyqD5gddaqPqNkqVUOTxbZZwxnqqRrevktduOt7tuBDvWBQb7mRlQ7v
	NPgQrFLX9WHRfGB8VCgrHI5rBa3J1knSeeUsDAamXWKeV4Z8Gf5FkSV64dY/mlkR53lv7ubTijx
	483ddbsXrJio6z04IKlRWHRbzuPMrzVTc7Td26fJ0QpzaW9g0OPvw1/xKvSi2gnQ2dnTGzPVLxr
	mlyaKKLl7+zXnCijQkZUBX1Hbic40acH0AhvEMAyECoFnSPsLQ=
X-Received: by 2002:a05:600c:1c21:b0:49e:663c:c69e with SMTP id 5b1f17b1804b1-49e663cc8bamr5307935e9.24.1789113436464;
        Fri, 11 Sep 2026 00:57:16 -0700 (PDT)
Received: from [192.168.1.3] (p5b2ace69.dip0.t-ipconnect.de. [91.42.206.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bfc1sm158082945e9.4.2026.09.11.00.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 00:57:16 -0700 (PDT)
Message-ID: <de4d3fcd-6459-4a8c-bb56-741b05b10198@googlemail.com>
Date: Fri, 11 Sep 2026 09:57:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.18 000/583] 6.18.51-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260909134237.773280130@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260909134237.773280130@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 09.09.2026 um 15:34 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.18.51 release.
> There are 583 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Builds, boots and works on my 2-socket Ivy Bridge Xeon E5-2697v2 server. No dmesg oddities or regressions found.

Tested-by: Peter Schneider <pschneider1968@googlemail.com>


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
