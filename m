Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042311;
	b=H4UQA0hCEZMTPsrcQWX1UaSq6EwEhfeBcSfa6jpXymnNTvVkGt3PkWy4K50+vuWZ+dNB
	 56ZmjRiNaMTdaoE1+SyWi+cWGDtqswK4ICDQ0Wsoej8fuB1/X+yw8tuKcAA4y26JFiIEU
	 B685CviIH0/Uh4U1IkrQDJBsoQRBOgq+fb5HGziInAPxMbPbySZHZlh0xxhVWk1Qd3Oy0
	 MzXBNFGDSsdV7J3TUwEM0KW7aDxN58gAmBYTXAYW7C1G2k3PLjf52zMjsoGfHAWHafWMR
	 1DMLK0lIlAYsb6STs6dD5wZ9tm8efy4ydIvSbOzP/Mbj9kfRq0tTFUlmjyGgPsmizJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:From:
	 To:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=cGD8W5Iwqa3vtO+g7S66ASNM4WO54+pVAVq203sNFMQ=;
	b=N83xzqZKO1l/UwpiqcNJLV08hYI4XKDf/jNq/hVCCxNoS65sUtVfC0rivTVJh1br31Ua
	 xienMIvxAEQ2O8LZf95UzWObfJc6QFnQUacgkH3xDCoE5pjnd8jqeEfJ5JjbG6qXe6jik
	 vY4MCEF4ZcBbRijD9qXa4TBHEp0LeY8n5o0JQ4zYL0OdoGx2pHPeGc5Np9ecJwHvPtwTT
	 4liKbc73yArnXUoZdtE1Ftt+7R5qjHU9uUwFLx7nA+YPWB+QAACLLnKD6bhDLS5GcDXCQ
	 PgRY/XAKYSlnGARAhSWCaq/VI0NnHXrrq+VdaEr1nkrWY8jopqrnHdKM+KqysaUuTjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XaiZ8X0b;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5323060A2608
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5323060A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XaiZ8X0b
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35f1f76ea84so5641708eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793042305; x=1793647105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cGD8W5Iwqa3vtO+g7S66ASNM4WO54+pVAVq203sNFMQ=;
        b=XaiZ8X0bioidF10IAlSN8+QN62juwzsX/5+1MBvz+jcTxMh16TijzxD8hO1XxhrH2v
         G2qHzFB02Y4tWliymH3Fl8sEja8nxhjW+gLUfvVXyQHigIsA7ra2UoAgSlX8g+Uu5LJw
         HDZsi+XiAxYZUI6XicNF85MV04ShF5c/kGe7jMZFrkZ9CR2KIFqieyK81Rd4AlnqzLa7
         CbKfMqiyXJ+nZVqdYVOoq/alQZz+nO/A49vvNnbj3DAulLVsz7+pfVt5FeDzP+R/geiX
         4gtBPAm2GaLc3Z6DWZJLSNl52jrTM0f28qZ7VrMYswpr/pozKEq7+2ISQ5GZ8oH+HEI3
         pLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042305; x=1793647105;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cGD8W5Iwqa3vtO+g7S66ASNM4WO54+pVAVq203sNFMQ=;
        b=JulgWYV+/8XE+KMYxiU/82d4DqMe25D89x99O713S4H99keYywJqK+7hdcwsDwoVik
         3DVWYKIVDIZPHDQ72rGAr1ngkfBTCkx6uQW7Ci5lpLwhP8qeesRFpdBIBVhQfEstEWr9
         DwJ2Hx8kLg3iCFHZsayBawdITuzzo0T5RtY9135TWZNNyhSZDhhwEFZWjvEbbWQt2yz5
         zpdQHOlNBoOW9r2koQTkS+5+yOzIAzj4MXEMdvQoDgRGtjIRF/x3HTkIhPMDnQd/c59M
         OKSZbz2EPpd2U2mJV+2+y9Hp0gjq+3QqKVpj0vLjK03DE/2Z853/4MQRUNIdpSI3imK4
         OLPA==
X-Forwarded-Encrypted: i=1; AKwUvBxQZZRYu9HLlQywmjNZYYWWm83VeSJpnZOyb+wu/2vqbHFeD+vvKGtoAQDqL/gVR7Z66WtyBS+vezmeuok=@vger.kernel.org
X-Gm-Message-State: AFq9FYJE9XEceZlaSsPAL/6uvOmQoCKJVWvFOFpsJKmS6M1yJEkJqamQ
	BWaPIkzBd1JWb6JyruLOpr2DzYVFZnlI0JBkHmgxMV3FUYxszkcVd1+f
X-Gm-Gg: AYBFou2vBdDdNqqfxkIveyuil90LLLxmE/dh8lyahfe5jxhl8cLnKsZx8VjEV2RA/KH
	ED+345R7MuQK/72RN6yq1bdcOfAoX/fUUJ+np4dkfnCt/4KEyqwKdep/HU90rTaKYif4ex2RKyz
	2e947jwodXy+CDLdjEStqbmcvJKJPjxiTlXYZM13BK3jndLwdtknfsAVk1V9ofqUB3qx24m+WlX
	oKg45OVd+R8ELBSTX1qZjLizLHYPbeSsZuIyWyQ6zRsI474k+nkVQKyTSxLvtQ4OXKCY+2oBVGw
	zD4qdNlul4EOpKONGVAFXhnvNEDZISJrPzuRi9UGlUrTjeFaeAV0Q2c6H51MGnaGcJ+A/O87Ud7
	5STtba4KWA8fDTLixc83aAqXn7RttGB5/MRe5DOsN3IwfF2P9APvW2x9Gvvwp+jtplG4zZDlwS4
	tcFmIL5vk44peltnB8dy6IQyQpXsuXvkIS0akibMKbHdzt7154W+bBJlvFvyG+0K196oAIE480T
	GEJ7IZaZA3e+7UjqrKDeZXZM7GAj1Qk0lyOYQGuorQOtk6aOxqEA0EOuozE/my8V5fMPpSdwGQ7
	o5Z3CLQLxnJjAUe6YsFVqhhzjWEMMT5bMBkH/w==
X-Received: by 2002:a05:693c:88c1:10b0:367:5e31:ce29 with SMTP id 5a478bee46e88-369e84fe37emr11058609eec.20.1793042305050;
        Mon, 26 Oct 2026 12:18:25 -0700 (PDT)
Received: from [192.168.21.192] ([24.18.106.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a005c0188sm13789851eec.9.2026.10.26.12.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:24 -0700 (PDT)
Message-ID: <dcf2c329-9268-488a-8b7a-79419e49293c@gmail.com>
Date: Mon, 26 Oct 2026 12:18:26 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH] sparc: populate sysfs cache topology information on sun4v
Content-Language: en-US
From: Tony Rodriguez <unixpro1970@gmail.com>
To: Jan Engelhardt <jengelh@inai.de>
Cc: davem@davemloft.net, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Stian Halseth <stian@itx.no>
References: <X-TH#1.20261018222723.43442-1-jengelh@inai.de>
 <CANmkgULrJwKSuwQhZjgL0-zWgMYWgOZLhseDXGtp_XwjcAayow@mail.gmail.com>
In-Reply-To: <CANmkgULrJwKSuwQhZjgL0-zWgMYWgOZLhseDXGtp_XwjcAayow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/26/26 11:52 AM, Tony Rodriguez wrote:
> Tested-by: Tony Rodriguez <unixpro1970@gmail.com>
>
> Tested on both SPARC T7-1 and S7-2 systems; the lscpu output is correct on both.
>
> A) T7-1:
> A1) lscpu
> Architecture:          sparc64
>    CPU op-mode(s):      32-bit, 64-bit
>    Byte Order:          Big Endian
> CPU(s):                256
>    On-line CPU(s) list: 0-255
> Model name:            SPARC-M7
>    Thread(s) per core:  8
>    Core(s) per socket:  32
>    Socket(s):           1
>    Flags:               sun4v
> Caches (sum of all):
>    L1d:                 512 KiB (32 instances)
>    L1i:                 512 KiB (32 instances)
>    L2d:                 4 MiB (16 instances)
>    L2i:                 2 MiB (8 instances)
>    L3:                  64 MiB (8 instances)
> NUMA:
>    NUMA node(s):        1
>    NUMA node0 CPU(s):   0-255
>
> A2) lscpu --cache
> NAME ONE-SIZE ALL-SIZE WAYS TYPE        LEVEL  SETS PHY-LINE COHERENCY-SIZE
> L1d       16K     512K    4 Data            1   128                      32
> L1i       16K     512K    4 Instruction     1    64                      64
> L2d      256K       4M    8 Data            2   512                      64
> L2i      256K       2M    8 Instruction     2   512                      64
> L3         8M      64M    8 Unified         3 16384                      64
>
> B) S7-2:
> B1) lscpu
> Architecture:          sparc64
>    CPU op-mode(s):      32-bit, 64-bit
>    Byte Order:          Big Endian
> CPU(s):                128
>    On-line CPU(s) list: 0-127
> Model name:            SPARC-S7 (Sonoma)
>    Thread(s) per core:  8
>    Core(s) per socket:  8
>    Socket(s):           2
>    Flags:               sun4v
> Caches (sum of all):
>    L1d:                 256 KiB (16 instances)
>    L1i:                 256 KiB (16 instances)
>    L2d:                 2 MiB (8 instances)
>    L2i:                 1 MiB (4 instances)
>    L3:                  32 MiB (4 instances)
> NUMA:
>    NUMA node(s):        2
>    NUMA node0 CPU(s):   0-63
>    NUMA node1 CPU(s):   64-127
>
> B2) lscpu --cache
> NAME ONE-SIZE ALL-SIZE WAYS TYPE        LEVEL  SETS PHY-LINE COHERENCY-SIZE
> L1d       16K     256K    4 Data            1   128                      32
> L1i       16K     256K    4 Instruction     1    64                      64
> L2d      256K       2M    8 Data            2   512                      64
> L2i      256K       1M    8 Instruction     2   512                      64
> L3         8M      32M    8 Unified         3 16384                      64

Corrected the lscpu --cache output to fix the PHY-LINE and 
COHERENCY-SIZE fields, making the output easier to read in the email.

