Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070646;
	b=ifY0bOfHViY2q8a6NYfa4TqFVCrAjCLIv9VqxGJAFZMmCu4A0ehXWAB+91dU3NPOcAUQ
	 5axXKnBgNykMYyw1jWPrg9x9CriKtbAcgvoehJqP/kw/DA6/RRtY+QoHIO3c5SStwCf6M
	 3ZrlfDDwBolMG1Dh2mvjaaslnyRZ0YhTUtkZta3CBPKglo5f73BlTxTK974fU6qcf2Xfj
	 WsUrSzyFIFV6mWRye9oxcNVuxfHUImq3Ben+XqKBckRcdiTaTIX8GJWv/D+czyYQ3lHY1
	 K/dh/A+zx0cR75+txsrUqaVVvX5cNEiyjDmSc85YylVl0EYSSb/eEuujM8Twjl6QDHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dZ/CQYskRN0JeHdAleff1h6SJqJJZnuoROXlSHd1Wv8=;
	b=EDAWP0kbVPKN6lHBn8fxE3KGEknxjpTn0YiiJ1iTgDR10ZmoZLAxUrX6gX9mTJNhkDCK
	 ZEnX73aSQGiiBjit49AZqk6whBriGKLbY+R1okzD5TNmBZrDqSz/zKd2Dwd/Rz+t4zE6Q
	 68XLmzpPsAiKYuxIf8LN29q0E+7u030qGvBNKQlYV5tqUkobKglJeNjFe8QwrM3kAvnnZ
	 KEUB2uj8NaZcIQbyLphaQ9rGe83leAbCr0SI0+PYzZ7qpNNxmQ+mEnV60bgF8K+kmsBrf
	 se77vvhqSz6yARJptTwyGVk1h4CWyR5U8mbiTG2USfyknz+tArr5n6wo3GfzerCZmYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=uB5u2QP6;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5AD606A33D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F5AD606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=uB5u2QP6
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so18202095e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794070644; x=1794675444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dZ/CQYskRN0JeHdAleff1h6SJqJJZnuoROXlSHd1Wv8=;
        b=uB5u2QP6Mwp4ctZ5zhTYwbQU2qqpke49+pV6yOEmi0MlyrNuBEEaOeY+e4xro8qYqe
         7XBUfH5SqJwUuLxf7T+7hfHB7kW2EZvy1/h2g3qW4x48z3bSlI+m+z9i7mD4UOf+BCym
         h98pTqgAJy02wQTrq4waY4CZJFF4zJDv4JqKTa4o/Z81pP1bkZ7IuqWhZ6qamdL5p2cR
         2vpXy1+JS+l80+u42DbA3jzuDhBxFvAX7apHIBOs/Jo/tzNBB47pI6DUVtCf/XtFn66T
         qxcXX3k6Ra7iOkmrLhgMdv9VHU6l/ws5Nl5Z9fLr4/YRPmGLPVxlezFC+CJsHAbOgmXG
         CCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070644; x=1794675444;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZ/CQYskRN0JeHdAleff1h6SJqJJZnuoROXlSHd1Wv8=;
        b=PI7g6pcGKsCcgzDQ3/8LTILwqsix0ANr6Pw6wIZ1Q9nZiHUqZRyuy8K5ii1m4TVhfh
         GiZGsmxka3d8MTrNUBfXOJSCpsnzm+vRS4j4oUIto69d4onrYKBVWtom8Ya9lPj9PHqg
         omBPydIH39jVFmGAfhCRre1I+B4V3vxGDyAXI5mBUM44CUNC8SHgdiPYj2tMXSglA9DN
         u7BfHgyyFnamnQZVGpl1NfAvqAwPj3udrpyj8IGoSe/ucbFf3Oy9Xz8FOOD/FLo8Er+q
         mHhfOogtm9ttjzUYxrHIrSy1OFFqgnQki6QLtj0HaJ+ACZoxQQnESxaAXlg2Pf/d4SWr
         9TZw==
X-Forwarded-Encrypted: i=1; AKwUvBw49Tp2pCpC4tmrq+l3PBBe90oV2J+jGIDtu6PjD0Ea/enOfmvjGuafa9C/yB4bKHgkfma5gqPLfhomgRI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EDaKV3JLIol+maYclAhaxWG2SUVBNevknh3gU92g0oqgQKJhL
	uzGGWsFEaGOsbLqeSGYC3IUDiYgU35P4p6hBHeRxutuEngYp6KWXv6Q=
X-Gm-Gg: AYBFou3gIqmsroo/eyZ58M3lGXjLDMMY/UDn5caWCej+cSVQbKHG7YeTk4oHO2GIgIz
	D618HmKXMLyfzZzA+o/3vhuW6B4PSjA/L2Y22ZOcZJfT1HRjvEiQTfMesNdk7dIVh5n7KjePQex
	LxXDW8rG3PFNPDbbZXfnjaZtsd40PEFm//argzlu5YCvduMylTJvUpUGs2T6oEanwYys5RCRYKd
	EIfLHfWj8otmuSW/h8IwjpqoZFZFDo7kDWAGhIh0Fv+mit/0oILqoyPxc761zTc5yPdIm81eMDE
	eb4IEgoq+Ma4fwtPB68xbzhE1Qg1f9tPX8/qeIqS0AcLwkHqDeiwYBNdOWbPWaWnW7EodZPWfpG
	yheNAmQ+9eu6PYAPtjcuX46ZnS57QHhJsU0ea3Bc29Ktz57bcTzQpX2EhTGL8GUzRnLKsIvXL33
	ISgE+8DVeP1z+oUHqWFVmxvTdjmUn9xKG0KB8pfDnforiDVQPz0IySLfRmbQmyFDm0eqqaWPKff
	yR5Xp2QZFcSt4GcuHkVNbbr6dxSZy7j6kIxVQqxXvnETrXuvGryd+YKdRRjvlTNkDRk61PmtyCr
	GB1cbZn8EwU+jWlwClYM53oJkW9z3K460vdO0pfzGrNP52YofWAja0dHPyFYErnQvgh3iaWmQn4
	guPg=
X-Received: by 2002:a05:600c:530f:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4b6dfbabcf9mr95721785e9.24.1794070644434;
        Sat, 07 Nov 2026 08:57:24 -0800 (PST)
Received: from [192.168.1.3] (p5b2acf48.dip0.t-ipconnect.de. [91.42.207.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1547fsm144188195e9.11.2026.11.07.08.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 08:57:24 -0800 (PST)
Message-ID: <2401f130-7358-4797-a872-592674a1888f@googlemail.com>
Date: Sat, 7 Nov 2026 17:57:23 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.18 000/869] 6.18.63-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261107134852.069646174@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261107134852.069646174@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 07.11.2026 um 14:44 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.18.63 release.
> There are 869 patches in this series, all will be posted as a response
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
