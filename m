Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594853;
	b=rCIomChZqH4QFXlEC98buR8BsQrj5JK+PnnkovJxDxwwsffPwM1OMsUhbHLT+UKQB+iX
	 ajqyykSiPhX0OHPWBrJNA7krXoNiip5ABj+Q6ExZizv2w2RR7OtYC5pgr6DtQoH7oONe3
	 WjZ0L4FXp5q21JxDyuBOI5P5YbGtFWCGU7BGVrCLYynmcl5y+xIkz9XgIwZ+8SkG71aNp
	 IVDnpbmK1MCxndumqf3JwaNn0Qh7A3YEFMOLESZMmR3cGFCqcINakTH+sRtCZKdN7m3Zz
	 C+NzOrYHPRN6C9SY/HXAPk0yfy+JWjd8f0WKMH4BbiY6VdS6HFqFzlHPCUzWyVlVClw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IJUFxlHAzttxqjIMcqfssbx3dgr60QqCU4WzOg2ixlY=;
	b=cYDlZtjEP14fWvk5xz5vZsBUmU89wPM3aU67YZdR7hO5lX67ZHVNm9Uif5Gf9a7HXVT8
	 B+WUEMzos0IqG/Bkz6WHsyFzU2g7FHO75kkXrao8jQ/vDNKZ5fyo9ZQZB6Q5XGFbZW7UB
	 Sf3yXPV5cESIyWO6zAsUxqy80d/uoFx1xE5R2j+FZ8XqRq//rAaUP9NoOY3ui3WrV8jN4
	 uREn+B4uNx15g1zhrd5ubC9sz5uTposiF5o/cLhMnnHraBGt61uAtZgrlEX88/BSZv32B
	 St4wEOkMb2tFwUoYfkwTBBtJk+FxjZibWqNFAkSYc6ZZoBvEPHFQK0a17MnQipE85SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A4xznEjy;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADECF606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADECF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A4xznEjy
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bce4e278baso764970e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792594851; x=1793199651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJUFxlHAzttxqjIMcqfssbx3dgr60QqCU4WzOg2ixlY=;
        b=A4xznEjyd9gjdzKJkX+mfkvPlnSAO+4xALnxI/8O+5f1RkwqiNl9G9bfCPcbIutDVY
         GVCQ6FNmtaV0q8s8YugGHDOeZRepbnQP7RqEqiqadKtcNsI9ax22vJGapQV9Lya740fX
         WpW+bitVEHaEIv6cCUxh5CRoe5V67OQ1ib4iDx0evFxiGLA8ifUnhFnOSsNECBJsOUOx
         7UCYNCH8OA24vPDw+EEq4bMJMiuWSAeDrkFaeVzQJH9s188awoox0hcdInX75Aaf5WEK
         O1lBSq2ov2DhdZVHI4M0oputoc8BXV4E6DsTtkiHjsWBEczfjA/T3rbIkHrVTTjE1Qil
         6IIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792594851; x=1793199651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJUFxlHAzttxqjIMcqfssbx3dgr60QqCU4WzOg2ixlY=;
        b=RBAZwDNNEZGYGNzILY/bl6WtudiTmTIBhA1DBaHkXAZyt7tc16I7/WWbo9s+xMSikY
         XD2OqQtbjPiOGRYvfOEfcOJZWSrqdATtvsq2MNj8y7OA+/0Z6SAYB4Xnx+E7JAmpErUS
         eR1oiwKLQwziQmYQjbiA/31BR2ZvHk5NWiCHJwlq++wrOybmWK0nra23TxwfisCsH0i5
         M6bz1x4mV24lNUpTmPKqed6p3Pi72r6UUEOS5hLb0yRnX9uqCKgI5BG35RW3CxxbEGis
         mh7qr2uBqhLy2FUIcDaToTf23dH1XucjFQihMHddgw0f92xKboDJ2doZ3OUFad0E6m8i
         bR4w==
X-Forwarded-Encrypted: i=1; AKwUvByk0V4ZxhAWIm0qzp/fVkyQVzYmCSp70Gt+E2gpZ5sbIwTZ62G+R/wI2WV/za1E669fZ84j9/3f27GaRpU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBukCqMqV9XlMAGNsExLrnx5Wxh7iW9+4yvfIIPh83KoY7BCx8
	7DHCw9TPFcV5QRB+wK+ilnJ1D0MJPsE0gW2dXXqCbQZbJab8Sdrnqa4c
X-Gm-Gg: AYBFou3iGpWfWTKTs+TTMdl9Tr9L4JRrllhWNZCw9+iBwMXaXttOFNxMBQ4PJjAKSU5
	H28LIeNkR+38a7efxsVvchgNHjbqmN06kk0qKMLf3oEaGHX/VnQj/oo922OePZNHtflmt9NjhZI
	xQSBpc8VYi7lNM+X8pAG/mYPoGGgAVW8NcMGqKxss9KU1ElKTITRVqaEPzz6+iuAXx4+Z5tNBAF
	Ci40OGPSegkxgaRUsNU8CJ2ogHoVpHKsuTpxUVcO5506Cr6thuiBo8TpbD3kY3Dg/oQjN4fHFky
	y5abVqg4zyiXPMCjltUwYJZTCEb4I1xcSINM1XOP/8CJs8FE/YLCoWZXNN09rnbr/j2HKfnbTtw
	9ZpXkpc6FWRgXBcoV+uT4vZA3i2/E9ScD8kzG5gWaAz5wWtwHWIlNRSyNHJ/cUrubbH67kjdHuL
	D6zmU9k7IVa8zNRC8T/1jroGO5xvDV/AbsVZoejL0/UI0zjz34lIwfy9FPdgFsGZ4gc3X7cBFss
	tq1MnxZmRnWEWyGxbnDBjgf0ZyKgltDc01IBQWy1fYlBqXFPKOpnUi6vA==
X-Received: by 2002:a05:6512:158f:b0:5be:5184:a3c6 with SMTP id 2adb3069b0e04-5bfa1bf3e17mr812374e87.10.1792594850692;
        Wed, 21 Oct 2026 08:00:50 -0700 (PDT)
Received: from [192.168.0.68] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa48f1698sm168605e87.7.2026.10.21.08.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 08:00:49 -0700 (PDT)
Message-ID: <701defd4-79af-4ce3-9c49-d3f4378a9953@gmail.com>
Date: Wed, 21 Oct 2026 18:00:45 +0300
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
Subject: Re: [PATCH v4] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 David Heidelberg <david@ixit.cz>, Abel Vesa <abelvesa@kernel.org>
References: <20261013-sm7125-samsung-v4-1-3233901b48bb@gmail.com>
 <5fb086d1-7725-4d8b-a2c9-7627f6da7cd9@oss.qualcomm.com>
 <b33efcca-eaed-4efe-99c6-035afd73dec5@gmail.com>
 <eb559119-4d52-41be-a954-2c26492d6a2e@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <eb559119-4d52-41be-a954-2c26492d6a2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>>> Have you tried using the bus through the normal QUP driver path?
>>>
>> No, I haven't. GPI DMA support for this platform is not yet upstream.
> 
> It's a copy-paste job, try it out please.
> 

The pinctrl driver for SC7180 has no QUPv3 mux for 51 and 52 GPIOs. I
also tried checking devcfg.mbn of my device using qc-devcfg-parser, but
it printed limited information:
https://bpa.st/PEZED3BN3JGND6HS6BOGNHQG7I>>>> +&usb_1 {
>>>> +	qcom,select-utmi-as-pipe-clk;
>>>
>>> Is there no superspeed / DP altmode?
>>>
>> I could not find anything that confirms super-speed or DP altmode on
>> these devices. Besides, ufshcd-qcom fails with "link startup failed 1"
>> after setting super-speed and removing "qcom,select-utmi-as-pipe-clk".
> 
> On the stock firmware, if you plug in a display via the type-c port
> (perhaps via a dock), does it show video output?
> 

I don't have a dock or a DP-compatible monitor at my disposal.
I found the schematic for these devices and found no wires for DP
altmode.> Konrad

