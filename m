Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792720014;
	b=sfMHPxPtrHr8LYoSos2pTyFE7XMcPkw92aeADnq8qFBE7rpLP/cvsCVtgDa6lNPxV7B6
	 CsSJDmij3SVM5CHs8jV8LDxRExK9XCtQZp/S0U2X69qTA9t4+GjQNRdMUpjQT8N8SAwXX
	 1o31Nkv6nfoJ2k3pZXVa9QZ//GzGYdsn59SYNW+Com2JXWi99xs1uiB7HmqNAbiPGwFhD
	 c+mDHwQAdvy59CIfZsmvlXGTPDB6fklXxNwIHSgk/BlhFhGgXe9HuzIYYkmyfyuYMbMjo
	 PDW4LCYecZeM78k7uUo88QKzlhrdjx8CsPU5OBE8SHPfs3J7QGaf2LtDCwnQu0otn5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792720014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=49tlLsKwv8QYIzXZv81VYW9pKqhefGCVYLctFPyDUlk=;
	b=3E90OBB2W+M1n+A+aNINc5YDePuTl1k7BRBZLc6dkcEd0yZKhr4w7llCir+W3LpMDpuu
	 aLzIifrNwHRUhq0mvJVJ9MV25RXPt+tp+C74i0EXFro+54nKHnLhPT4ln1rc1iqCc2xP8
	 dADrZFuLYIJHpz6AXrZMi9DBYBwZIrOiBJq59qOG6V310jSOaVIWB6mM/AngQ6hkWlxqK
	 Z5hHqjtlkJHCuucB8wfbvOBmIEmbMBgr5UHsbdHctZqTT4vjHN/TOK2ILTKE5oTqvGESm
	 t54fwK9hVvVEXlUQvwrpjEnl8E2J066VvCZpUEEw0QhrRzQ2TIHqhzXgARmjttr6Bgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TDy8QTqI;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD51A606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD51A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TDy8QTqI
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3ac5f801d7cso78929a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792720013; x=1793324813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=49tlLsKwv8QYIzXZv81VYW9pKqhefGCVYLctFPyDUlk=;
        b=TDy8QTqIZyxIxlPqzVjPm23SgAoxQeqdw3XErXd4mBhhfi08NQwRjtgYCntxvCYudo
         46F7x98zOzMLawz2grCqSfrbiJzDBtz/EO+A2iAi/24+RPLgFMlkPx8Pppr5GWu5V6mx
         Y2xSX4sapqQ000/6CrMR/zZHemYuw7jCpNVlIRRDVME9Zeq6iV3DopVbl2acFNKPvvh9
         4sqvO5tg+MeBcMZlsAYaU7XqZYRY8lp8/Z8z5KI77P4cPVDhqNhMFRKiBFQqs00UgMTk
         pQrOoxWUeTqR8uCy3Kz2zf3GeXHNbWIDF/5QR2NIFz4WS/LHIs5qDVhUwxPImY1nypP8
         IlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792720013; x=1793324813;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49tlLsKwv8QYIzXZv81VYW9pKqhefGCVYLctFPyDUlk=;
        b=Z/VaGkjpxBF6c2/ubv1Xq9qb/0pDT8jkvfjDR4KHGHJj5JjjwE11poepui93yyNdnW
         S2W2BASu6qp7d5XBvmxYqseoIOFYfQRbvVODRigotS0Hdnkr9y6WVvsG/o11Ug3D8uq8
         oQ1UO2/PORz6tuqPqLurqgZyIvA5/ehTzbVVQEgRSuKgdAnmqTAEozLkEIILizomthu0
         hiSaLBJB47RBzyW6jymKIxa+iDi8dbhmfE3JBWRP12fh6Hr5BpW0h/FBf0Dmi19ibJCe
         Bo8oROl01krDVF/mMTq9i4PofZxl8FvIk6UWkfseAPxudnMT6Seaq4kWdkbqqMnSUVBw
         4PIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwIWjCKSphyBK/GTIkBhXXj3+FdaaWpYRID9R/+gUcaY/AMmXwdbYqyqc7JE9n17rcHm3magwSqxDPCMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAUrS66TykbUcf6mpLazxo5gnkz6QiPHfIhRzVYLAisSclSf3m
	O9RBSG0Ze6kV+1i6w7XDSzZHGJGVQB3bjnNj3H+mNAi4ABUAGXYbIwrokJNWqdmUFRslaEed
X-Gm-Gg: AYBFou1bYGn+F28zmlrIGldRn7cT7DfRkeo7puXZBH7DGeq2jLPxAKR0KFX8ur/lger
	5I66jANJuuDvAVcpw+68f4HKE7utq4riM95DOO/czkEkRw8j7r7nOxK3R53IUjx3CPxRasXGoPN
	E6Cfq4EF0WtX7rR+iM6PMI3zDg0KjSh0FY41vHQhzvEgjJ/clToeLHgRIdBVe6XxV5MDs9BNX3D
	CMrEGkv0aIZDc11oO7vwIM64LnthagBPOPmIYlf2rRhY/fzDkxWhQ5fkY3T535+K2Cp43bYqHD3
	uWdkUVza4bqxT4E1t/0nQB3U+5T+fCV8exyAcTFnIFB2R8oxRZ0Rl1Um5yca8ej/s9WBdO0mYV5
	9g9Ut7IzKg4rpHc8hKiJ+FBFj2sWPWo8SWlFmA5x+4X5STSzXyl5LznsMTd84s8cAh5rtcCH1F/
	fkgQ7ZgJ8nB1UqHly7D1SUb+vM1Zx0hvVui5KR11k6LOucQGmP2MuJEogHyTl1AQ4rW1Cr32Zl4
	HF+YjM3MmKHYPDuqT2iCdVwWb4FPeLf81ZzNj4xnEql1LxwcAqY+lavPpyollw=
X-Received: by 2002:a17:90b:52c7:b0:3ad:85fd:711c with SMTP id 98e67ed59e1d1-3adce03c81emr663240a91.28.1792720013195;
        Thu, 22 Oct 2026 18:46:53 -0700 (PDT)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb1d84fasm1155510a91.12.2026.10.22.18.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 18:46:52 -0700 (PDT)
Message-ID: <809fddf5-c4aa-4a78-acbe-c9c39da2d363@gmail.com>
Date: Fri, 23 Oct 2026 09:46:35 +0800
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
Subject: Re: [PATCH v3 0/2] of: reserved_mem: use dynamically allocated
 reserved_mem array
To: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring <robh@kernel.org>
Cc: linux-mm@kvack.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>,
 Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <CGME20261015082333eucas1p28bad74cde14ee0afac2eea11bbe6696c@eucas1p2.samsung.com>
 <20261015082315.56876-1-m.szyprowski@samsung.com>
 <20261021134138.GC3667411-robh@kernel.org>
 <e42637d0-c800-48fe-b943-4ec6ac540d82@samsung.com>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <e42637d0-c800-48fe-b943-4ec6ac540d82@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/22/26 17:59, Marek Szyprowski wrote:
> On 21.10.2026 15:41, Rob Herring wrote:
>> On Thu, Oct 15, 2026 at 10:23:10AM +0200, Marek Szyprowski wrote:
>>> Mike Rapoport suggested [1] how to properly use dynamically allocated
>>> arrays during early boot.
>>>
>>> Use this approach for reserved_mem array during early scan of the
>>> reserved regions. Having all the reserved regions in a single array
>>> removes the need of the two pass initialization introduced by commit
>>> 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory
>>> regions are processed"), so implement it to make the code simpler,
>>> easier to understand and ready for adding proper error checking.
>>>
>>> Tested on ARM32, ARM64 and RiscV64 based boards. Arch specific issues
>>> with early mappings were discovered by LLM.
>>>
>>> [1] https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/
>>>
>>>
>>> Best regards
>>> Marek Szyprowski, PhD
>>> Samsung R&D Institute Poland
>>>
>>>
>>> Changelog:
>>>
>>> v3:
>>> - allocate the reserved_mem array only after all static regions are
>>>   reserved or marked as no-map, so it cannot be placed inside any of
>>>   them
>>> - record failures of the early static reservations and print a single
>>>   message asking to fix the device-tree
>>> - restore conditional compilation of the early mapping code, because
>>>   some architectures lack support for it (C-SKY & Sparc64 as reported
>>>   by kbuild robot)
>>> - allocate the array bottom-up, to avoid allocating from highmem, what
>>>   might be an issue on Xtensa, C-SKY and MIPS32
>>> - don't use the early mapping on PPC64, where the scan is done before
>>>   early_ioremap_setup()
>>>
>>> v2: https://lore.kernel.org/all/20261008152403.766439-1-m.szyprowski@samsung.com/
>>> - removed superfluous ifdefs
>>>
>>> v1: https://lore.kernel.org/all/20261008094125.3197971-1-m.szyprowski@samsung.com/
>>> - initial version
>>>
>>>
>>> Patch summary:
>>>
>>> Marek Szyprowski (2):
>>>   of: reserved_mem: group allocation helpers together
>>>   of: reserved_mem: allocate and map the reserved_mem array early
>> Can you confirm the sashiko issues are not issues?
> 
> 
> I've replied sashiko review. That are again the preexisting issues initially
> targeted by Wandun's patchset:
> 
> https://lore.kernel.org/all/20260920092852.614973-1-chenwandun1@gmail.com/

Hi Marek, Rob,

Since this restructuring and my series touch the same code paths, my
plan is to rebase my series on top of this series once it lands, and
send a v4 then. Is that OK?


Best regards,
Wandun

> 
> 
>> I'll apply this after rc1. Are you willing to be added as reviewer or 
>> maintainer for this code? I'd prefer not to have another entry just for 
>> the reserved mem code, so you'd have to filter out the rest of the DT 
>> code (not the bindings and dts firehose) which isn't too much.
> 
> Okay, I can try to take a look at the drivers/of related code as reviewer.
> I will filter it out to reserved_mem related changes locally.
> 
> 
> Best regards

