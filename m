Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288868;
	b=ROOWRo284MehJ3ASTFKJM/vyfP2qrBXblsjqFuCjZw0wz3FjSq6rYNJRF2lvEaUlv/XH
	 PX9vn8n1I75h+kFSjZzlpqcz88Av3yOIt5XT9x8BrVI773aeJYVjfYaNdGU9ePhwWQftC
	 +H1S/mW1n9BOeYD/lmum30QJTaK2mUUqfrj1NpRjnG5sCxO47K0bJJf718C0gDM5kgrLT
	 Uq9nPIvtFPlNSTa15NtJj547Agop/83sBI79hfolt7IKmj1iQnNdIWChI8wCskX8Ufv0T
	 /tZ0n3WX+lGK+x5pNvIRje7UX5KPEhgoALqgHSnB7wte9nJOjoTo3JbyuUuRsLw8GEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=H4ycqpfgZiGJ+RxRGCxitL2+CHZwQ6ss7LXiaKzsngQ=;
	b=ytePODwLxaa9gyx8xdPUJCOh37Gn+MW4v7YxOCM5wvKSM6rJseL086BORCPdQ3ioKPpY
	 x5bQdnRb32neTPoJ5sWnjE1rpm5ULUlhl8SGfnS3ScpBXIIWLvbAMYYKRJGQH3OXtX8TY
	 gKFPK8DYNWPi7gPJ929mMpozd1MZya8yE15AKx5mdW1paLoeL9Y7PuEP/JmG9D4bVf0Sf
	 m1F9A3G9F4tHxR7ATQ09WfW5DmnLJzXAEqDGyeMA3uNWF8W562tXQuBE0RfNucpeh/pVb
	 D1l4E+9a3GC2r928ep5nmEHn33prV+OdZoaFGGRy9fOqZDJGDVcjN3QNE7w7OiKko9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=VnRXHPfi;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1E6606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC1E6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=VnRXHPfi
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso850102a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793288866; x=1793893666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H4ycqpfgZiGJ+RxRGCxitL2+CHZwQ6ss7LXiaKzsngQ=;
        b=VnRXHPfibvPg0GfqszpAulWOh1rYDt+FC6k+McKwpDLTJtQtw+4u3F5Fz0DzGvSlAr
         1jOi5PGy3JuOOT8wNqwh3qcRrkMr6CS3jBKxdahmQtHFdEXTi6uxY2+2+mni4RVb1ZhO
         Qb/FBl7IEbaSmf9co/b9zFnJcyg8JBvy+IwFDSI2LipHSslrYM1XiFy7B9sHvX8CXm83
         mj88zxoYLCHXJR7J2AgksQ43ENCQyZKWfnSWTjMtl2fFVQpEKS+oLcCakg18fG2JYw38
         FmZOmB9AJPYLsy4NclUPIr41Cvq5tRofiK5WNKn5r3ThUkgFBJvWlAl0h6G62NIcZn3t
         nmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288866; x=1793893666;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H4ycqpfgZiGJ+RxRGCxitL2+CHZwQ6ss7LXiaKzsngQ=;
        b=ieOsEp6EUsgcXMERz8cn4NB0WEjltAUmXUsoklcPugsF1tNggBcJ++lNQaBk4gn2Mb
         YJdx9JQ3BNFZRIp/pvmQdAc/B1yxtsPA/pL4cFKqHcXvWuKN/TsNEqZQeRzVrpJUhdrk
         k7fd/p8LA967KDgJTlfXSTGPNVHkbs21hSTE+45P+FW1ALKbcxOglxBjgF7Ig9kB5BPv
         IgDYF3HYfSOF3hWNirbc40JkPk0m7IUs9h9H8rU1qIJn2T3HaDRC/nzW7bwqf2eDjosO
         UawibWGQnDGS1YtUzHe+YLic3hRN/AWlIOqatsKpVyTGkfi8Op7eshyfAC948CjUhYUy
         WpTA==
X-Forwarded-Encrypted: i=1; AKwUvBwj8ruQV7kDUeHHvT49OsnNhWDbDGuxq0SlGJlxY7txZ5IUg3y83sLHcGICUoBls1N0M1OziPGxZ6W2fOQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGRe2UEuRI2EiZqg9PGIap7QYRBmIcQt6lVhd+s3xJ8paM7P1/
	RYz5mXhK84XsTv0l5OXVORNInUpPQAsdXv+nbmdJ6mhi3CN8xdgY6k4=
X-Gm-Gg: AYBFou3QyP7diSVnmMp9P7pzecdAaYOIi63qhghe7F8kmC1bH3zKs9BK6jeVfkrrIj8
	CtqamYq+5ckY6NRbZqzghHaxpqV/IS1DKBSVGJxtpbffnI0MTh6PvbfLOiKz8f6pZYTWgG2bSWD
	0TKHmBYqueugHLKjcHoqHohyvCRj4l8NxHMCr8i8CO+76WRT/WY2ch3np9mAFRSr1fifbShCI1M
	n7eK2tTKOGwe7YZCrXQIoAtwR4VMAurrecEDq54JovN+2IhxdR3PM7a/tsdNmwyJYdOXvZYtDv+
	zc5QG+XXdstL4qxW0l294D/N5nZh4PPXP3qWw0B1Y2dtUad5a8V3vKNfFqW9bA7pXx6jVbpC+V9
	dALixbnkXCh0lj8BGMNFQjsMF1XkKZbghIJMBP+w5RLL058MprPk1FD8FHZK/zkGMzmLN19Gx0M
	xb1T5RlBLylC3kKQz4hGOBzRLJG6fDC0S2RxOGd0CyO5H7HMPzK0Ew65W0IJq+5INkO+S+UmClo
	lzUYp0nE4dEGZ9d82sDii0X3axZjYTAdJa2TMB3wFQQUmHkwCSNCNCHGOJy0iPJH85x0qPd1Fgz
	M0i7v/UR5vM7CNrAUlcwtKWaVQbPdxWocHhvDG1T0cloN2d5AV6zvpF25VUrCdx0XpG0LcJkQpB
	LHOXffw==
X-Received: by 2002:a17:907:6d29:b0:c2e:3f49:df04 with SMTP id a640c23a62f3a-c49bdb68d6dmr521364766b.1.1793288865850;
        Thu, 29 Oct 2026 08:47:45 -0700 (PDT)
Received: from [192.168.1.3] (p5b2ac3f1.dip0.t-ipconnect.de. [91.42.195.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca27a05f3sm6802066b.81.2026.10.29.08.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:47:45 -0700 (PDT)
Message-ID: <f16d1c32-8b05-4046-909d-ab7c9da92464@googlemail.com>
Date: Thu, 29 Oct 2026 16:47:44 +0100
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
Subject: Re: [PATCH 6.1 0000/1879] 6.1.191-rc2 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261029073135.159947193@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261029073135.159947193@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 29.10.2026 um 08:33 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.1.191 release.
> There are 1879 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Just like rc1, rc2 builds, boots and works fine on my 2-socket Ivy Bridge Xeon E5-2697v2 server. No dmesg oddities or 
regressions found.

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
