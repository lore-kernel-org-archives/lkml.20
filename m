Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A633C2BA4
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749766; cv=none; b=WpprQe0RURaQ6r4SBITyK5mJvEOzTJNiaF9Tzo7kB4FdjOJ5QZ69x7jMeLKKbWJpG2YU0Yp+uiTC88x+bSlUgbRJXlK94lih4bUWML6qaaSptDTwTSdc3CvNUf/oSRAloq8mhrD/Zm1mGsUiMo+2UEceWjkGaW7zZQXKHaLqCLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749766; c=relaxed/simple;
	bh=UQxkqTK3/1ZsLFibCpvCrUBH5dRiA4vZDvb8AlwtX3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xsx3Z6n4lltYs4uRe8MFMhE+vZG8ECY0giRSI2tAGzXKlMcVJFNlS0u+fs+rcVTLtO09NICn9nj9oQPAkRI0V8fwnx+lZge4hBKF3A3Ai/dbyGXEYjauhusIMz08INwgSxtq5IL8MNtH94jgLbSP8GQWkubSnYEmNCLH5pOxlpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=CEARBxtI; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="CEARBxtI"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15e2dab83eso141398466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1787749764; x=1788354564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6JXi2pwwnfsDJ7n9zXvp9v+SjJvo9VFU+ep7dFFjZug=;
        b=CEARBxtI5JNQMbb8P4LCdSZdQJEDI4HCVUdJlQThGR4EcXn4CO9v+kGpGjwLWGZoB/
         ChD6FLhvGki3uK6OZVgij7MVSpYQhzB7XWNdA2smGrzRqRfdM7yAl1LMPvNhvOULVrKl
         4NVE8krQaX2DVg8Fo40hx5OxGKU6oZiT4QGQW1L7/b9l1zPKpnG1w0P2XvCA9rKCNWxR
         NuoMH8mQ7Sp2w3ThSGFVX4R4TiwsL/zYa8UH05FQ4eVxq6lZjwcgfrwM53fscV9TQrXh
         03f3b2kz6pGHrG9L0Av+4HlLLQnukC/Tx5tcmOHvVQNeE2ZLXDSrS1GrYc0CuW7YIxkX
         G2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787749764; x=1788354564;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JXi2pwwnfsDJ7n9zXvp9v+SjJvo9VFU+ep7dFFjZug=;
        b=Uj1UBDiwfZ02sh3PdIqt7nhzQsQsxXBNb5TFGmGDStEAd8Sh/0dtHLfJ5EafEEN1Fz
         MvcpTHpe4XSjcQmiYezi6+51F0+H9f+Dim4aGXPy54YkBttrDQn7c4YQKulQzBHGydO4
         xrSsbw6l5+jyByvuwE5AIBSy9UdVPdHTkhzXpyr6tsxm+4m3U4rwGKHQiDhYsvq1eDlY
         0Z36YIB2kY48UC4Cbay/J/FGs5xLIwnAFemD2pWLbuiYSCEUoXrVvNt42u09xh55TqxG
         CD3tG2XIIvRQWNnnqpRJ9EGWJZ6bXIs6RXYmodwwx2c5x2Y3dSSk6BdFPMt1arM0FJZc
         2OKg==
X-Forwarded-Encrypted: i=1; AHgh+RrqzdkFKBRaePnRtvQ9bkQScpqUREBVxp1UK8nxnRtRRMkoc5o8FOS6qkjaMsElPVieN2X+qIBpgaXhMLQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kBvJJrNSa6XFe8kBXdRRZg0Vr0NeTjuylsnCt4y15t/OQ7D8V3
	fFKMsOHkfYz+CDpdMxFjJLPCqZphxw4wN1UJB9UUdG8dbUis4qyT9uM=
X-Gm-Gg: AR+sD10/T4wiEXss7HKJVPbvwMb9HOgcazQB++M30rIS3UcneSige2losPTE7OlHDEW
	Px0mmV50Pp0zW+CAKCt/ZKBd+hN5nRYV9SOEGWMxpqZgRmfbLFRPxCmacQP9VR/Mz4vepHnb0de
	vTF3LYHhKdnfoKc4NzLsutDaa3d1+Kdfhxgj0aNcpjZvl3Ovmo1Q2FJyFXihexuX8xa7zPO2z1k
	6rDNYwr86dr4CstRfhb0CDCYiazjNoAhVUfrqd9lor+RtJ/EHgtSxATRPPuxWxuotIvJlhIgMB0
	HDoxirreE2d1ftrjzTU+zYelW8HkALyt+SGG7c7fRPZtuyznwGB/lw4cwnuqWMVAQl8VTkO/EsM
	OJWyayXSROoQHiKYTHbGbmqpmL8SyTUb202m4I34mBGwL828lgxPJjfgpNqsQ8nqcUQfvEmQegT
	sPX+SnvvkQk3r1GNb7J3MDJH+GWb3nEQRB8X+FyEG7zSb50eggE3xWPuxQUId8af9QzQks/q46h
	gslrEfz0W2Pcq1+ZKn7Rw+Pjqom4oulNNteu5M=
X-Received: by 2002:a17:907:6091:b0:c1c:2007:298e with SMTP id a640c23a62f3a-c250c408972mr942154366b.24.1787749763224;
        Wed, 26 Aug 2026 06:09:23 -0700 (PDT)
Received: from [192.168.1.3] (p5b2ace5e.dip0.t-ipconnect.de. [91.42.206.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2533945d0esm586566b.9.2026.08.26.06.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:09:22 -0700 (PDT)
Message-ID: <ed8a1a2b-c375-4504-9b5e-370b2ccd6e08@googlemail.com>
Date: Wed, 26 Aug 2026 15:09:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.12 00/77] 6.12.106-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260825132541.580275153@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260825132541.580275153@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 25.08.2026 um 15:25 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.12.106 release.
> There are 77 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Builds, boots and works on my 2-socket Ivy Bridge Xeon E5-2697 v2 server. No dmesg oddities or regressions found.

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
