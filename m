Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8603F5BEF
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787745827; cv=pass; b=UsOEj6xF7rttJA03xY6nZdWZnaSXT2wFf7gQM63pY1xLaowvnLvhb7600w6XTNokYaHa3wCGIM+S0e8g32OZf6Bcqc8U37I0Nj/t61W8uVRu5yf2yph7JflqQTEDKsnpxpYYWUPx7c/TKVA9WbSxTjSeX+FOmbAPi/9UIy9F690=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787745827; c=relaxed/simple;
	bh=VgpSkfkt9+IsahxI1cQp4xeSvCEjsBixCuyMoUcG8B0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+O6uw1P+gNjnQsq3v0FSdDOMzTTEKyxmqRuIwguAROaoLXhOa+c8DENbIQg2/iDCPHbUZzc5vNfWK5tJHGd9/SJT7oX8bNjqLWjoWWr4hgkSrEKZ5+Emp4oy/lzcvBx9ZXdVwMvw0izXIRL930upPGrqriVB37BKfiBBIl8ahI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=aeznCf7h; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="aeznCf7h"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c250c6a6a6eso136861966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:03:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787745823; cv=none;
        d=google.com; s=arc-20260327;
        b=VbxD1+OQzHmo1dWwDmP9u4utUwGStladlA6UL5UVvt6/UUnY2sWZzbUn+7bmm8hTbF
         ik2fwGSp+k102SyXYX9jHQcr8g+8yK0wHz0OCLhXxpwvwtuQu9Dm9m95MWdRITFE6mWC
         QJRDaO0Lcc5iHSZs0jr/D2vfPVR4VlXyPgOE5BdrxyAJ6HLifPRy/RRgzBfE7YDqAwaU
         fHEMMZpn14Rpv33AzxpQL2eGpvmdMO4g9USXQsQtXlbk5nW9HT0L5EO6+M8cNh4oqBg9
         JDvukuZ1P/qndsDA80rQNk755bQtwPSpHgMzqSCdWGBF7hNkENgQmAmUKCVCTKE/qGhA
         /lnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KHczRSOUNQAOaPV0/pSLE0qgfPRAm7Vb+2aII/l1HUg=;
        fh=HRk4z/CKGp2+qth5rVo3b5Lt+FiRIsoSmEihm+AmKv4=;
        b=HCXE44sygYxN9b9PEQ1PvwuGfTxi6hR4ZL3UuAUY1OLZUG0GnSaqDaT4AEIZFWtE73
         9hGKU9OW9ZOT1o5QHi+d20L+YNp8vD6eAykGVttU9Ro5eOhd4pDjcH4UCTC9/Q8msHls
         Pzt2N4T8v5F2kLya6kxjJ764dmuvAnPG/cb2A1llQlyc0hRR3m3U5+GFpG2a7+midU5h
         cVexqn3FH1Sx+sLSGH6DReYBLxeQ65ZIdbWEZ4fOQrQkingXUHyFPY4GeFLi0jrRx98R
         jPZPu+/7qsngy0LsDqr0zygCfM9NrApGJuhgKiCp5fxPxjdvBncvUYlkGmfAhqfmDwaL
         Ggqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1787745823; x=1788350623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KHczRSOUNQAOaPV0/pSLE0qgfPRAm7Vb+2aII/l1HUg=;
        b=aeznCf7hTlqCxVFeifQu9uQE8Z60OAY04d4nwCwUqMH87dRKvGqlIcUnZdiQsdHB3C
         PvYYFijYXBlhLEmlkA9JK6KvTJ7S3NmH4EJOROoU+FqhpVBrTvrCp39GBcdpVTaY6yiK
         qU6J8KwvCIy4LgAIlHg4R8BwBWMOmXni4JykFIkC9Ysvk7OSHGnhkKLBVkmd8QtaCF7R
         A23z0bPfVSSo4FWV10Oz04dALfNKbEwtpzAlFZVH1doPd3J/IZ31HcJmEunyno80a6iJ
         DOF8LNyURbFBh7Ls3NNcq+U5zsPiD9MBJqfZPEblkVqLpVLNliKZBsip3HxZyzsQb4d8
         b91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745823; x=1788350623;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KHczRSOUNQAOaPV0/pSLE0qgfPRAm7Vb+2aII/l1HUg=;
        b=pZTzfT+/Cp+mid46xoI37miAB8BzSjcs6fm5YMqHrqvMH9cqeBVHGoVC6CwfB1jDPu
         5BFyt2Q/41TMFQIED7EGoWOyVdUFFouhtVD2gkJT2zdl+W7qJGbU6hRJY7X5O8w/0BL9
         eu/0AWyOtOWI7bE0Es6rCJFPGlBTrhAJt2abpdpFXxvUsYzJe035U0yXLhc1fHMUbwQX
         vVd0FwYEdM6GccEKnUoonDn4yCQC4tl3pzeY5ZZTwgJ/LW63L+2qQMC6bbgaBTpszyyC
         T86nAb5J7IDpoXpoS3mv12KsWbRo2XrzN15o5xHGSDSLGeMwCEsyXxUPD93ZCuvbu8IA
         AE0g==
X-Forwarded-Encrypted: i=1; AHgh+RpFuAtMlG39y3Iw4Oz0oZsWG6Cogg5HS7Xu+JXwbC7e1loZMgmg3SDIETH7JV7c87ExF/aR5wOsUuM1SbI=@vger.kernel.org
X-Gm-Message-State: AFuF++kQTtDWloTn2JvBF8TLeHX20/gEY/2oba/2cIqj7pbdh4fgRNvo
	nAAa1G5r6Cfzck7uQsAsdxxsh5X6xslHb8EXm5yXjVbkIwfxBNmM9wgZnfmGOZbzRz4D3TJe3uv
	CY/c+HIMNJACQ9FxjJCe/3/uV/J+xxS5/D9uQ2xvTPQ==
X-Gm-Gg: AR+sD10Et+vN8UtD7mwbHj53eA6cRQTZDMtfp/qP+j2yUK92Rd4Fxj/wz5qcSQvrsqh
	ou7vMYx4MMVB7q7QBOdAXcx8g6Nn+s20fqxUcjsYLrc0c7Fx5AY+7NSEkotfZ4vf+/l//4v41t8
	62I8wSIeqBr2ebPqAAuxv4ys7xJxdd4isf9TJvG8MU7b0Z7Y2KUiogrU7k1RUz5ONwtWF1pWUuO
	IxjhrQ3WmMx8+tXuHQBxHZz8btEPCPUQiMRmmZKTIl0y7Vg+P4vckJYnYbqGLTiWFmUA65vZ04A
	9+Ct8LYDMDgXGlkjYeKqsOwdVH9zJlzRNY5s1oWR8KjpY0QC2fUeAIva
X-Received: by 2002:a17:907:9616:b0:c24:457b:86fc with SMTP id
 a640c23a62f3a-c250c329bf3mr603822266b.21.1787745777707; Wed, 26 Aug 2026
 05:02:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825132541.986300899@linuxfoundation.org>
In-Reply-To: <20260825132541.986300899@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Wed, 26 Aug 2026 21:02:40 +0900
X-Gm-Features: AcwNN1WueC4r3S8GatTaKBZIWNFDc6UcKGJRNI-BkTohTSoeo8p9V_YfbG8RAPM
Message-ID: <CAKL4bV4730AgqL6=U3bABvedwAtA5Kr5stJfCaCHJ9ZVyvn2XA@mail.gmail.com>
Subject: Re: [PATCH 7.1 000/101] 7.1.11-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@nabladev.com, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, 
	achill@achill.org, sr@sladewatkins.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg

On Tue, Aug 25, 2026 at 10:40=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.1.11 release.
> There are 101 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 27 Aug 2026 13:25:02 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.1.11-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.1.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

Linux version 7.1.11-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 7.1.11-rc1rv-g822f846a60fc
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 16.2.1 20260810, GNU ld (GNU
Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Wed Aug 26 20:10:08 JST 2026

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
