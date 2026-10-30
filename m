Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793366512;
	b=G8NP2X8FIuTClPDCL8h9pxXZYjG9Nkx7c0HY1kiEvPea0+m224S/ozfvJrVgoBeNicEF
	 beEkBu1uB8q9JnF8d+9Ge4aQ3qMF8Ne/FIzMAChHwir8iCZKeV9NE2EF9F+Dp1e5S6Vmh
	 Sf65Ej6RralAvArcx1rJ/hxHMcqwMAmCXxPmCAQFQFKt282ggDPvzjdB/OZbIDxHEyMF5
	 sJ6OUnAEEmk310IZimbCLlUo7We2ZSrhL5jN3lkoM0agte8nvmeTB3swxOejAZzb8EG9U
	 S0cftZSk7MUPH7uBmPTI5qD1tIh5atwTPSMeOAN+x2KP34bn8EbyjUU8oVfQ1/R1b7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793366512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HviuIgC87E/yRdmzffRcUTRCSi2vUjjI/a/n/qNyN10=;
	b=GrcEi7mTywqTJft+yOlQTdORYdhrjRDrYygZC6qb3tv6H35YnywO1fGC6u/e9w1OXSD/
	 QWSYiU1o/QTzyid0NtFsjpRct570AyqigO6s/Y5MSUtEV7OZrESTuwMsyJfQjVbhRk3zL
	 nkk495ReCh4P2h2Od72zFbF6MxxDG5tKFJBXd7E1kxNPRblToqKB8EX4qaSWrPVQgjuK5
	 a16E212QM5+NkmWDCfL8HhBTvXanmW+tSn5qsIxVLTbtMm5RorLCh71YXGfB9qe0Iql5n
	 OFKzYMz6CdzdP2TE0RAfdmSGSn5aCLap2ISnkBU4oYwTzbr835GHrXdcMoixHTHfjeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fCdBm/fa";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AE5606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54AE5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fCdBm/fa
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so3398055e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793366511; x=1793971311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HviuIgC87E/yRdmzffRcUTRCSi2vUjjI/a/n/qNyN10=;
        b=fCdBm/fa/JyARCTD9TVi/fK3vJTkZEiIKkIsKNBXfjERuJrW7l+eD58q6lNCqvJ0DA
         DYl4V6Tshl06yRP5PdXWEWKCcaEDwYjymZb7IIcbyzMvk6vxQeMXv4evwhfoUZdOyG0v
         2J8SWRpA/2bWWopGl7idEY27kcoqFPE45kVrcZqxZS1rMW6wWN3+zXMMEiR81mVJxm8D
         m51P+y8tqWDcwfZSY0AlVz7piv6vM9IWNwohCDPkVVc/Pus9Ki9w6kr2v4ATn4IarR/F
         o4YaGCy2cF7RCKhLhT4HXsW9GnYMqFpDjt425VfraEPBij432JNf528O3rHZJLPohItj
         WJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793366511; x=1793971311;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HviuIgC87E/yRdmzffRcUTRCSi2vUjjI/a/n/qNyN10=;
        b=BSmYmPdz2pVYSrO8TaFoCmC1h+/F7NF+tqru0xHPOcvCWS/doqoG+GbK/iwggn+K1Q
         OhRQX0CFDr9syRjy7MkR5PxCh94ju22WeEd8spUcMlH+7bD7i5x9b8Vew/GJGmEPfTK1
         82omug0+D5V6DoBM86Np5/s5A6O9Gjl4WEHmrCxLBNSiDBQv7CKUrIjA2wYmvWPNiJU+
         QNClvsR11rCEA8H1dCFML9l2uBduE0QnB9F+gt6Byv/4U2wXGURmUf7ld7tTeVUCiB7c
         xQn1GTaHqB7wB2JT3Mxayj+DAlQbSKmJDm+shmBAyKVjUx7gwp/LvFhUk9kCYlDQ5AOi
         COvw==
X-Forwarded-Encrypted: i=1; AKwUvBxF2lHZp/wG9ZCg3+cEt195P8HgEX4OMgqjwLfCbwuKqJxYpWEnnrWfhwYawUeb9e0RInHpvKLktv1vV4I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8gAEe+QGiXXuqN+wTQgBkq1yArKDgcmZF0Twe3le3t1kXFpKX
	9WZL4lqmCqzReiS6Yj7dhgHtVjQ+i6IvU+qeLARRGJ2XV6hHPNwk0Vs2
X-Gm-Gg: AYBFou241JsTNS13+p1nwfkIeCGClmNObvC+LMSQUuUDypHbUerlS8jA5uih/NJYuD2
	zumnd+s2JIearzIfGEDTCUxXzalRmKc0kRrGxOzPmCndhUiVRlhaKuyoOSEphl4L994xqB1c/SF
	fNTc44EUfVd3+f6wapaZ8D5IjMsknoku89Kmizq+z1tjaMPO5YjQPhywY6Hykgt+51Sc8hcWdS7
	AbTmG1tiUPmSFQ0KFc0fxQVc21++L5g3vH2DL4Z7Ua2mRMiMoivfU+lW/JaNmbVNCvLk0Qs8hU8
	TzHK3jq12IM8cBYQhAIKJ3CyBMNF4Op+1cJNKOWeObEMd6ne9S1WkaYLdU1Yjwzh7HZ7xjSndYG
	/b7XoMePcaaQ4U05FBb0KOoqYdZugq5zGXbFjWCdaAaZsMjyM+8KaGGS4tw/mQ5Yf/ZlKku5qLF
	7K4OT4ZGDWJicVKM3OkqXp7UxkcSr4bpWIhmVKQ1Q/S6oT/W+d2ryJ6kTz1Jf/LjHDwgth1CfTG
	dmmRoutLUdYTG0820fN27M/EwfLjByh3aXKrVp0ECbcREBQ9wrMRo73h9FDqncYkIWtppNy/V5E
	bDWzMDONqsArlYiXjqODjCr9GTBij7hjMBZdN9jKBFBM7leX9LfxRatVRpUuS8ih5pDYAdwBjlP
	KhZUq
X-Received: by 2002:a05:600c:4f86:b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4ac18b7df2cmr50002535e9.23.1793366510349;
        Fri, 30 Oct 2026 06:21:50 -0700 (PDT)
Received: from [192.168.1.7] ([31.176.170.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm144128695e9.9.2026.10.30.06.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:21:48 -0700 (PDT)
Message-ID: <2070cf87-bc38-4237-a58b-6554572a8842@gmail.com>
Date: Fri, 30 Oct 2026 14:21:46 +0100
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
Subject: Re: [PATCH 1/2] mac80211: move static function from header to
 referenced file
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261017155509.128114-1-omer.e.idrissi@gmail.com>
 <20261017155509.128114-2-omer.e.idrissi@gmail.com>
 <b60d12eb-dad1-4482-89ca-155dfcb410b9@oss.qualcomm.com>
Content-Language: en-US
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
In-Reply-To: <b60d12eb-dad1-4482-89ca-155dfcb410b9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> Move static function from header file to only c file it's used in.
> why? all the drv_ inlines are in driver-ops.h
>
> first rule of commit text is to describe the problem you are tying to solve.
>
> don't add unnecessary churn to the wireless code.

i moved it because multiple files include the header and when those are 
compiled they don't see the tracepoint definition because the next patch 
ifdef guards it under the same config that enables the only file the 
static function that uses the tracepoint is called from.

this static function was only used in that file and i didn't see any 
obvious reason for it's existance in that header so i moved it to the 
file where it's used.

commit messages are kept in the git history. should i send a v2 with a 
better commit message? or is the patch series problematic otherwise?
