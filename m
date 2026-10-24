Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792872965;
	b=2wSr5NZS11fqUMJuE3uP2311TSYdItxCJnmRW4qPHkf19B++hJSiNTK5B/rxNmKnJReQ
	 lyU7xeTxAzuv+2pFGKY4M8La5B9EBYR13/DERC3686ARNB6Ojn5gMOlldo8zXD7n649g0
	 F1iNIqJtd4GK/U8+JUq0tf2HK+8dqZo8nSYXFrfproxtgfGrdmmAOEacgfglBWO3LGNeu
	 POtnEdsdjDqtH2D97+8EmQadnfeihFvUeSng6/l0GmdAth3VFn85qn2gFjRbhbcTFuJj9
	 +snms97kHRivR14QiaQzf2oSSAlOXeEJ0q/Fxz/hjMp8FDnmV6YkUdEccSIwDuZ+m4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792872965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xOdSrRSD68sU03mdy3xyH/obHFukp7AFHKnxKyzExEA=;
	b=bN7RNVbqwQ4kYYfcZYlXT+AlbB7XA1ZjjBiwRDgZClnkrDgytJ0oVSjd7DiGEChT6/Q2
	 y6OpjKAIMSzyjHzMNlLlemNh2F3Srff3M+wG2JpKmSevweyXVjNMinLMnhe8Lsx/5QRUJ
	 LhIw0OaJd7PQFMmsG1M1AC+xfbUgFcuxYhxxBWL7V5je/2lbI01MwCzd38OwCK6oTcslf
	 E/KqPNqOhY8HaNY13kgDcxg7P7wsp/oFjNYTJo/nTkilhjGO8tXKQBcnr/7YDahYXibZF
	 dUDloi9WDIHt9aZsenMwQJFvRUd5oLwrRz5aeNP9b4pbMGZn+080t3JGbbWtRI3sn/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=WQBFRA2D;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0265C606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0265C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=WQBFRA2D
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b042c0728so477499f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1792872963; x=1793477763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xOdSrRSD68sU03mdy3xyH/obHFukp7AFHKnxKyzExEA=;
        b=WQBFRA2DHulKxtiRFCmc4qQ2bXOc9WyTsgvY6RyLoOOFM9P9l5dSt2Z8apXqZn4t5P
         SD+sowgsEzE9dYKs4zlv78FmttAFO1Wpl9vG4JEtOmncn39P+SVGcbf6a5B/NTLIMhHk
         OA/A10TXS2enTZtjLh260T3OJKOKotfSDvZ05Se4G26rS4WWANzf++/Xk9Htr4QdxAAI
         xISybnI/tagJspCGYI/f8f6jELof7uX4Oeyj2+RjxoO0YHuMPGLILhAGGic2SFzhtxvp
         HGhZ/blsHMCRN/E0sLem+lO/7b/f74YPq8FdJMaHNIeNTbLUFXkHBEATbzsYRUEJiuED
         6Ksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792872963; x=1793477763;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xOdSrRSD68sU03mdy3xyH/obHFukp7AFHKnxKyzExEA=;
        b=ZbaL/77zlwwlMWxeFBzZAOEdkt3u5e4+DCwRIi9j+SryLKwsvhxihdy+fNhoWAONS1
         wVox/FFBOFhEYO13UYjOCnZ2avuiWSdn+vbK0LASA5eaaLj92RQoZ4D6moGG1V4RmWup
         0fJ8UMH9htBfJnzGw2CBwFgpxOVB/qS1r9Tj1KW7trlOXACwwP2MmLO3ywHJif1lDEJH
         LA3VUTZhayaX5wJRunnrJm3Cw/iOsnc7uwvZERoUxGXSe01TAaZFkyabdZe5mo5a8nE6
         Ovy/3+zbdlpCsyeyJUHWCDaa8XSk653TNxYjc4DlR7OzRVvjKbajm5PphYO9ia1VW2j1
         LEew==
X-Forwarded-Encrypted: i=1; AKwUvBzsu9teS89qI97G2sf5jPcDzrWGwcdCDoj3zCWhosqkSHaD0nL8bpxfZBn23QGJALKWAqWG6OtADJ8DYU0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3MB9VUKLJhIj0EWoABR5wg0RAelmKZitLx26L59nxouTUpBBB
	XH+HH9eWn2YZPSMUVXT0NBJPT03la8G+v9WN4CKNubfzu7B9QhTiZCI=
X-Gm-Gg: AYBFou1uk+5zOP2ufb4T3bcSl71YkU+K7jb6HW2QRHsxcw6ZdS3O6vdfzIWh6JtmDsy
	f1FlFoj8T/K/8ZyoydecAVkTJUNegr5lD4c7+vpINc1wnHOQ3814pCsvwwQkklRtS1WcMLFrOhz
	0QcTu6hf+bsZu3/I4AkEnQrsZ4VZpY84xGTCzz7Sh/o1lompmd+d/SyUY51WimLrvCULfxyUf4a
	++mFAY2pL8klTg8nVgSqe2LWNDKZzZFGL86QJNSKscuqWHU9FwIwaio3rknxzcxmDjLjEjtDESG
	bjKDECxq1RPajhvMhvRTXMhXzRXcX5kDbaKyiQd+g00z2RTqH+9x9gFM99Z0IG/s8fFFxmS+U6M
	3zj1iGko6f9ZrICfnoJ+uE27YSivfViH8JXy5siLbnpwZW6h0h9T4favVbyicLtcXye/r+8tErB
	45SYurkVrJp8qpFCz8TGCivWCo0pTdJFntuUbBDWfH/WQd1qHzyQEm1Po/f/fqF7hQuaZGmvsTa
	xRwJf6vEHTJ3aG8dazb6pNEKXSQ/2fJnbJnprfKaVtAarFfTbG8YiuFDQlQoti5SeqdMdS+wQYo
	ClivhdhAL8vnPP7ztVibQKj4QY2dTQ==
X-Received: by 2002:a05:6000:4549:b0:48c:7306:18e9 with SMTP id ffacd0b85a97d-48e3eba0c36mr2612894f8f.43.1792872963065;
        Sat, 24 Oct 2026 13:16:03 -0700 (PDT)
Received: from [192.168.1.3] (p5b2b4b2b.dip0.t-ipconnect.de. [91.43.75.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4115f496sm5555426f8f.5.2026.10.24.13.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 13:16:02 -0700 (PDT)
Message-ID: <1cf833a2-1ca8-4fee-97f8-fb9b8e76b868@googlemail.com>
Date: Sat, 24 Oct 2026 22:16:02 +0200
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
Subject: Re: [PATCH 7.2 000/243] 7.2.13-rc2 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261024064731.125251200@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261024064731.125251200@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 24.10.2026 um 08:59 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 7.2.13 release.
> There are 243 patches in this series, all will be posted as a response
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
