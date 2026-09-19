Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4F1318EC5
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789827502; cv=none; b=nOqA+20h8w44a/PnoClT46BlZ2K9ir5YxtiI1Hq7OZ4vGsyJQ2iUrzUI7Ft6+sT2Y0XmQwJGbPXWaBXX/vqnmOKw4x34K2sGZvI/0/6c0xtv9avkD3azRGdKtusjqNAa70+JE0kHjic4arMmJoyuU5XEkd0pnHof+5l+3BHM6xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789827502; c=relaxed/simple;
	bh=PpslIjtfqdnivMU4+zxZKe2uCZBrq5qLNofJ1sx/HeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNPQW5K7hBAAlyrRcEo8lMkdlawlkpi0SNOSc+rq4HkwbvtkZw2+lErAx4AVp5xJIluaKJ8r3I+t+EUsieBApO2br1AMSAFlytPzXJD+GjBdxiqM7kSIDTn2w7JKY8ILGX3qXw8/KWB1VDUxHS8kG7fMSznpn51Mgqo7gbFcYt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oGR+jQPf; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oGR+jQPf"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3931so12040805e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789827499; x=1790432299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WVdtse4utFqdGo5H8fnCG1N9VsS3ll8DP5z6tgaWzw=;
        b=oGR+jQPfiTfptyCXAWBXQe9Cit7QtF8B6k3YHixtP+Pk9Z0zRWvKbPghLXi/Xg+yxQ
         OIbTKkOC9DJDl7ETC3kbR+2ZHFY5VN3wXDrQ7iUPfrVXr5Mhyg2O56nt5h/C85uL19Rh
         WQCAcDSG5pLi+NWCXKFNoewm+9p7UsAmOH1AmerEd+NIc4lNRHQe4MBIK5iJITHBzU3+
         Qj+ax8iVagCST2amDdNio1XJkCK3f9W/q6vPI3CAcBrC7ppXr/8xziCK7THezbyu1GY3
         8EcYV4BFWgCQy5R2YnzUSL0ChDxSTtKXkAxOuDtg9q6CstE9OueLX+ON8ZU746a24yKP
         lFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789827499; x=1790432299;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WVdtse4utFqdGo5H8fnCG1N9VsS3ll8DP5z6tgaWzw=;
        b=gGDd/29Xo2aIKKe1grUyP39Y1V95l7v3TDdQwSjxLdfl7gU0roAHsQ9/k6nWs2HmGh
         7v3rpYy4H7AfY105fFVHsH3hyVp8IUxSs4Ef2WaS3OaxSC2l2jLjRURFgRasCE4Fp3yr
         6v0WzogZJO5jFoEzV4EWm9SNIpeFJFeZPWBSxvwHQ2jmNP7IFhWnfLoEhmyO/wsP/A/M
         V17hmvZyL/FwsjkMoxk/mQcqWmrg0RiNNo1Y5zh/+9TF7KjGCOOVRBInAErZJczLPPeT
         PwRzUjldpqza7o/4DnGuMkAndAIW3IzvUU9QIW3sKFFv4rjfs7/i2kTs3n6TRZRTRb0z
         ca2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzCpCduNLH1I8Z32vWhc54ev86dU22sL0yjultsrH8LfbCw+mNORrG+/r5LIDbb4YrHmpXrtG3sw/F5yn0=@vger.kernel.org
X-Gm-Message-State: AFuF++kCdvMRYeDM7iAeuS2ux0uynywOQOzSw2XtwgiiaxoyUrU+ExlY
	ScRDoD47yytmn+rm3shNanHxUUdCSHyTqM+KT2crrYtH1wCZeNmk5tgA0FAECdzYVYQ=
X-Gm-Gg: AYBFou2BTUqN/s1nfum+NLnmalpccLeP3w/rBXqZskxaJ4zePxtzsjizo22Y1gfCvGQ
	8KJ9QZEFGUkpFHkgGlAiW5GG8J7Zbn4IQWBDDNTgCDUiYTQgAPomuOCEA8xOUJoav0AJmvb7ZNP
	JJJbZmkxgDNy3HPLdu3V88+LnrgSCq06MmyReA0ecoINUwxJs9NEWDqlgK0Hxj6IndyWRUqXiWB
	OUa6XNPXw+HdVOi4Om/lrTCH50vyu+QZI3jZ+PgqBb4l1xS0ZjBOvvoWTSN3A1A5ofhaKoAsbPG
	/gHK1DMSZUBcVn1xxGTpmbMfkoNV/NTo0exMsyf1BYXEq7nNxiaIGtW2gFzP6SMfk0nvhbOVkut
	MdzJLS2YxiR4eBr1vPLi+W+/xgnUcSBJa0DJtwCLw1pNr/y06efjw2T5kchqM4399UpcMh2uheP
	dXIKQ6sDpd4+ODqr00HZnG0UD/599gqVNuldyklAbPJf0HcUtWol2LqKO6zoKDFj6/GOsDelYOO
	sjoaCmKKcQXhKZNULze8qdXxlp44TSZwdmtbLqNmtFx2VeMjxzWpxfp
X-Received: by 2002:a05:600c:c493:b0:49e:74b6:740f with SMTP id 5b1f17b1804b1-49fc573603amr76055195e9.17.1789827499187;
        Sat, 19 Sep 2026 07:18:19 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd090f0csm106407185e9.15.2026.09.19.07.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:18:18 -0700 (PDT)
Message-ID: <5d09e717-a478-4c9d-b5b1-9f309edc064d@tuxon.dev>
Date: Sat, 19 Sep 2026 17:18:15 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: microchip: ev23x71a: enable eMMC
To: Robert Marko <robert.marko@sartura.hr>, ulfh@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, adrian.hunter@intel.com,
 aubin.constans@microchip.com, ehristev@kernel.org,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-7-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260907132617.1198548-7-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/7/26 16:25, Robert Marko wrote:
> Enable the non-removable eMMC connected to SDMMC0. Configure its 8-bit bus
> for 1.8 V DDR operation.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
