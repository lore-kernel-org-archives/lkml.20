Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794047338;
	b=SP3tkcLW8MMxc6RjQWv1vScBxN2SOMtBqqrFQA6VWlgIAf2XgCdOVehCOvgaEiUs6zz8
	 lQ07BdqPoefYaZQ48XXu6NoYGhNhB8IsmqPH3SDf5xV7bLwY4QRMJfkIUhXt2rjLco/0j
	 MZDZWT+HTkkXBKipFEbpgJ4L5lF5WZkyIKxPrzoVoJ7xCqgmxMJE69o95VikNJx04yeAz
	 fIPZ6SllYYeb5VwAKRKEcfItt//BgYyjCWq/3HxKhinPmdJSV4Ghi2th2JwxoMQTKfLa5
	 +iwhGJAIsMl6g2w9cCmqdAoWlXhEsPwzWI/LY0yhQqYQVgyNT+a0c2z0HYrqMiOBsrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794047338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dSc8Cce0DahS+PknmXkz4T5pIyv2lKURzT17LCtrd6A=;
	b=WdxKIck+govUZuvDP6oR/oOO/99PiiBVFgP3E2um+wheB8nK016dxmnDA/5w6xJRS8BM
	 KYL/EbBG/YGxHvCLUYzEy56/J8uxGYtcO3snB2iK8zIE4d5Tzx5YrkojSQQEIs6+Q72WN
	 F6ZfBgGvqcLLgK4ueY8gMpPIBSaFhy9r33QWUJdFcBENgM/waNagr6Azj1JYIY1hZiak5
	 G5Honkor9qDKRuAp5Xkl4UeA40YvWaBFuw89vz9Brs3wPjHHq+7HifxGmvqV1k/713w71
	 y0fOBPgBb3mEKvMV+TVq/DZKehluAR3Kb/4p9iD4yibu8UwTalWwPfJ2oXW3lS7J8gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gIHyWpZ1;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05DE606A332
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E05DE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gIHyWpZ1
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e96be2196bso5094155ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794047337; x=1794652137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dSc8Cce0DahS+PknmXkz4T5pIyv2lKURzT17LCtrd6A=;
        b=gIHyWpZ1iCEkEzw77nsaKu/5dokLtbxu79KQ+4oc/nYu8jWV75d5EiMPwS0C4oqg7O
         8eQlPtY/D/CRIUpPxdPOcZZ0uvYR2mBJn6JFFVp4GAh68bMGBOJpHsmg6FwGybOLfs5P
         0Lj81vleMhWg3IHz9caCFulGFeHdC1rKvTJXfuWE58b8cIutX1RCtjEPK/wg/8kgP4ls
         08vzh9Aw3v7vPYNZ0tZS9f5eMDwjIjaHZwcKmGwycUYTk1clSKRnon9fxV3hZIxiToXC
         UX8Zn3VE6sy3ANhVHnQ/ZYNeHU6PS37NUfPQYSetckrutcMHO7CUsNhn+TEMfP9ETP+f
         +1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794047337; x=1794652137;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dSc8Cce0DahS+PknmXkz4T5pIyv2lKURzT17LCtrd6A=;
        b=Le9vKaQNtRPqsOlSmBkdKJ597hwL5ngT9XP8//EJcLIDiGHpU98pqctp6vgwhO/CFE
         MNsThs23bBZDqzgIJgcl/3Gx51wvX4dt0Ee3k85sG73ok6Pvxt4lpfSnWLK+yareAUDD
         x7V3XCSzRAD3Dh6zNMSsR6ac4t3VPEhRTZW8HnlNrXhEhftVVHzdFKJRBQZUqFUBwK4w
         WYicqufpsHUb62TTHjCDVOZmoACspAPyVfG8G2jJ1uyZVmHnQRnjsJfILZbiGyS8vfCg
         RUrFU8p5sbJfyrKDwAZjyYPPUMPChkru7OQnj2Wdzk3VZgC/DfAEnX15u23vz3nnkKg0
         ylHw==
X-Forwarded-Encrypted: i=1; AKwUvBzDt72WwUW2+sp3pcXIo9Z9yIBL3oVC6XKVEFOpHI92Z2fQsNmysFsfLuUz7YF/P4oZXnWJ9kooTN08IMM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Isb7LOmBYK2Ion0TzAoMB7iRf99lORcV73n0tlyFivpC7hx4K
	NY6BKPPujSHs/0Ysce/fDoY2A/MdXq5F+/QcBh36Lhjth8n6yNHRHhgP
X-Gm-Gg: AYBFou22L0ZdRwqdiJG5Occ4NpaVDp/o8e+cdiO3dUg3Yi5mX8Hl16tns8voETtBXz0
	3lqxmzXbhtxgiFv3oRvWKoorfgy3CGKumQ04ebsoNZpffYnbWYaQgrJF9etmuBXlRwbEVzW8K5r
	F89Lj9EdOtazyh1cER4ibz88ZS8U9TdMccXg+ZFhZavrulGv+e+1lZvMYTVudTjHJsb8JnR+9gJ
	2fJfV5aKtnoAxdONCJ+AHgXWTVgf6m8FD4axXgSsdPyJXnEE4abAf1mCBVer8vfgzjG6qJE9hLR
	lVCY8jnoEBTP1yaQwUjfJCjvNiY7bA9pZK26AXcpb/0idYFjrm6O06+2MfZRfIVSGsMoGxgV6aK
	TXoiAGd/71WQyMl3rnR9zVGFPYERaP9zWtNhpulrAsazQ6F0yOtxGQahHwci768TCQ59OrQmm0c
	iOiDQnpVGMHzltOYBulOyY67BF/9KLkE9xIpk3WAMBIo2sfyM1AfqDhy/fcxKKUGYwPd7uMVdR2
	RFda/yvGVptUKInab1Os4pmCV0TKtJjCEeEDfBFxycUHggAEEOWyA60iPHDqfzv5GWPbWY2x0Bh
	7S875r14hxCn5WJWnzBBd7xuy1SEEm1IjZ60/rDAqY2CtAYHghZeNA0=
X-Received: by 2002:a05:6a20:939b:b0:3e1:885f:b4ab with SMTP id adf61e73a8af0-3ebb2751c28mr5214585637.8.1794047336992;
        Sat, 07 Nov 2026 02:28:56 -0800 (PST)
Received: from J4f-Laptop.localdomain ([183.36.237.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b58293f83csm122073b3a.51.2026.11.07.02.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:28:55 -0800 (PST)
Date: Sat, 7 Nov 2026 18:28:45 +0800
From: Shihuang Liu <shlomojune6@gmail.com>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, kees@kernel.org, 
	justinstitt@google.com, morbo@google.com, alx@kernel.org
Subject: Re: [PATCH v4] media: siano: Replace strlcat() with scnprintf() in
 sms_ir_init()
Message-ID: <6nxioe2si6ch2vbdfm2sfspwckbp6qp44rgxztnioty3smqxs5@eccx2xwdy3cy>
Mail-Followup-To: Mariia Nikitash <nikitash.mariiaw@gmail.com>, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kees@kernel.org, justinstitt@google.com, morbo@google.com, 
	alx@kernel.org
References: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
 <20261107033928.13891-1-nikitash.mariiaw@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107033928.13891-1-nikitash.mariiaw@gmail.com>

On Fri, Nov 06, 2026 at 07:39:28PM -0800, Mariia Nikitash wrote:
> In preparation for removing the deprecated strlcat() API[1], replace
> the strscpy() and strlcat() calls with a single bounded scnprintf()
> call to construct the IR device path.
> 
> This preserves the original NUL-terminated output, including partial
> or omitted "/ir0" suffixes when the 32-byte buffer is too small.
> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>

Tested-by: Shihuang Liu <shlomojune6@gmail.com>
