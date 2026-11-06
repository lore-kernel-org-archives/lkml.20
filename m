Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977408;
	b=k9n/q1yTnhYY/wV2szlcJQdhwre2HRRwKbOts5asiFeUFrLdzWwws5/NSPbxO/WBagdS
	 WU/Q0fCvnwfG2o23CaJ6ocmXt20Mc892Om8EBXbxijeTmJ8m49v79t9tiP4CLG+xtcKRE
	 h+ZevgzBoit+NMsRGkjL+ngDre23FOjXoKR87jJu2WGCMeIYoCDDu0yjlTMiVPQd/BRs9
	 DoOQ4unHS4XFYk0rqfllU40sm4gkaYyxbAicbytKA8dj8dk32Va5SKcnvuvWxKu8W8L7O
	 MOHsPfV8sDfQJv/dK8UZpsEU9EfxIHHKiiUWTPY6fS4/9T985mN7uGdR9OuzCAxGHnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=I80ZPEWQB0WX5YXGTShdz3it+MT3nNR4B9Ty6wOKj28=;
	b=dom3OMjx+ub0BYY4ULpM2rjEUckd+XoNmgZQhQf8KoKRW2aYzhrG/zCyWsseEr4yw2nh
	 KkdTOuILDjsJeTQzbk7lh42629zMMuvAbSORC+MkgQqZkaPDhbQ/zrPY2yDGCPMnlOh0z
	 uWW/QSDwsxnWShK4lDUw2Yru0MTdcMfFKBAgSdp0i7PKhd2ytSh5x82Ipx5CV5TbxSeWt
	 5Ag4/xlEwQUj7IRuRI5M3ygwhrlhNMA/xY2TsvBJeCpV2QvePNdtRtVhFRRM5RiknP911
	 LjGdxY8osWyatuWsY0f82taNJiY/HSvaCZ6ItWlVV6xRBV2XuZ9qJq4P9oNWE04PsTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSM5cs8T;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAFE606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DAFE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSM5cs8T
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so295051a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793977407; x=1794582207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I80ZPEWQB0WX5YXGTShdz3it+MT3nNR4B9Ty6wOKj28=;
        b=DSM5cs8TWJxNt54mlaY7rzkEhtLYQugGZuG4lIUuE+2vLrlcrkkjbzemC1SOT3DmQR
         RFLbKEu82bm8zF2BFK7a3CMmI6bjiKkHCtmxZHRna1x9/ggfAZEfoj2598lcGDxcWuvQ
         zWCyJy6aFrj8rUXi+LWjCeJIJ46Ur27Xc/oR7wZKEhoRizqsz4UfH3j1RQFFJblyGmb2
         TAHxg6FLFP/6jU1exH7TbFBnm7rVIsl8Y9FA9MRrS16iP5ytTDeAQGhf6gplU3DPCGHg
         6QipybkXWLH3JXlLv1RgdbdnWXrt1iQs8kMYbeKdr3aSEpiYDnB4Pc6bdImBr24VZw/D
         MoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977407; x=1794582207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I80ZPEWQB0WX5YXGTShdz3it+MT3nNR4B9Ty6wOKj28=;
        b=CMKmi47al2NoqGWxPnT20V9RU9NXue0ZcY5q7SVitRbzAvCE5uuBimD5iTj2yNKFFb
         zKL97eGkuDQQ8R7LEHymrgK4ulQm7YushjQVsvEGTDsKrCbAt9aR4lf2mUuCO3Q8otRV
         YT6H2iiqkviz1kH3yuOfRm6t+Yg/3rDKcRVb0jo1s9/lOYouh4UJcGYTQ8EdWoZE9P2K
         mhsZKmcspkTTAOiO0FbllYria2HhJsvPGWoK73npnshcXxW5JmiiYBDDpMbJIaHSaRSI
         rPimpntZDOl4tc0hYasbRLbspNZ4qvzm1xQWWUAwELH+cf0OwXz/L0BKaCgmtMu2jR8K
         XOBw==
X-Forwarded-Encrypted: i=1; AL+hErFaGIqrskfGfKa1sUVM5kSa4YJlCF9iTETly3UQnr6rKvYCDFLPCHeMXhZGndKsxoBYZwGcDXs7QqMaEXE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RasZdGHEeBDlkAFQ8GwGcZqaoH1n1PVdNHu169BlZSjM+NJpa
	S/vKwafrrtRgOzw0/mnYZ0/sLf+RAisTBBbNAZMpX9OpHtGAuuVuU3p7
X-Gm-Gg: AYBFou0CBA77F3MLOMTk97pBWWnqzv0f5qUqr/uHdHPhTZHCHgmPmyMalZyotLHt2fF
	lv8F1IPNkW5yi+X7jvECnyK97gm/0w8sr/ZsZh/MX9ZrRVf80MzWy1g8wFX9Pkj+YiKIM1O78Wl
	SiHwY8Y424AaoaRDDtPaG+Cnk+Na74oaz1nyb2/qsLqO/aBGXml2HwzSNbRSM6VILIqJSn8inF5
	z8FPOw9PjfmupDNPV+rhrQkBVooTmg+nGg2mjGMrcytKw/AelM0PypfFhIN8NSJJWbyYFAPlwgJ
	3C0ALE9Eu+qrHr1dw721vhP11mF3GXfaZgvlIGWrAZscJEjUpEbFzyeIm7KTY6co/xLWbvlib0Z
	k9w9J0MWKQMGmyF/EKjKU6kNMOc5TtgoqiDN4Y/jDG7chHEn9Lr3k4F1ZLHtDumIE2jG0xTV3gW
	ocHScFFp1zQzo98fN307ePcC+f6WUOcWPNIkZx4HVeuSzTlH2r9SJJPhQSQvE1KhFL8SLukOV2r
	el55bX5qGovJj5l7ByXK77JVn7umrOjddPy86cFwyH+wf26hgclWBQePHM+r1Zv2a09hX4+csnu
	Y7S03GwKsMzU5w0Km9xoyjS9vFXmFgbqPLieOZpUUHaQ1RrtqvIhpbCakBLZcsnMjXtN
X-Received: by 2002:a17:902:ced0:b0:2ed:3be3:c63c with SMTP id d9443c01a7336-2ed40c48300mr36584015ad.31.1793977407496;
        Fri, 06 Nov 2026 07:03:27 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:bfa8:849c:2010:a1c1? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed477a9baasm6161495ad.26.2026.11.06.07.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 07:03:21 -0800 (PST)
Message-ID: <da3a0f47-7e77-4bbb-a431-06c7ea6a78e3@gmail.com>
Date: Fri, 6 Nov 2026 23:03:13 +0800
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
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Only expose kb_mode when
 it is supported
To: Bozhen Peng <bozhenpeng93@gmail.com>,
 Anton Karasev <uselessfire@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 W_Armin@gmx.de, ilya.gladyshev@linux.dev, chris@miget.com, kento@kekto.ru,
 wolf109909@outlook.com, vlku.milos.fun@gmail.com, btx342@gmail.com,
 zsanya322@gmail.com, i@rsplwe.com, martiya.ar@gmail.com, nika@nikableh.moe
References: <20261008-bitland-kb-mode-v1-uselessfire@gmail.com>
 <b2b8aeee-08a5-479b-bac4-a38ac606a037@gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <b2b8aeee-08a5-479b-bac4-a38ac606a037@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/26 11:03, Bozhen Peng wrote:
> Hi Anton,
>
> I tested your patch as posted on my MECHREVO WUJIE15 PRO
> (WUJIE15 Series-HPT), using your stated for-next base:
>
> 98f039265e580291d5e76a11b2072541fbb1c393
>
> I booted the baseline and then the same kernel with only your patch
> applied. On the baseline, kb_mode was present, but reading it returned
> "Input/output error". With your patch, kb_mode was absent and I got:
>
>    kb_mode not supported (-5), hiding it
>
> The GET produces an ACPI AE_NOT_FOUND for HEC.LEDM on this machine.
> With your patch, the probe still reports the ACPI error,
> but kb_mode is correctly hidden.
>
> I cycled the keyboard backlight with Fn+F7 from off through levels
> 1, 2 and 3, then back to off. All levels worked. During this check,
> atkbd logged unknown scancode 0xf6 messages.
>
> This confirms the unsupported-kb_mode case on HPT. My keyboard backlight
> is not RGB, so I didn't tested the supported RGB-mode case.
>
> Tested-by: Bozhen Peng <bozhenpeng93@gmail.com>
>
> Thanks,
> Bozhen

Hi,

Sorry for the late reply.

Attrs are not covered in this patch series.

I might start a new patch series for this after the currently one is merged.

