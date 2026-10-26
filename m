Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042000;
	b=rYjjAt1ZeYgzmnvJ5QPO3DBvu5AqQW43QtHAvovJSCmsPNfGmuq/+rQ64eXksfQDzdNQ
	 VUCzXI+f3QbWQJI9PuFArwpn1iXcH2RLp8gpzn4/zzVnNCow7Wd9/6RwuYWP/pBP+/l1d
	 4TsKUYPlVzKX7X/xpWNQQ9+aIhxLGntIB8TnrxlRwJLHGwIL2rATGnYXs8oGGSwsa9PYH
	 02hg1JTQQi50GF0v3B3UDM/ENfvU5MawViOgSvgujMlhlX3pATSwm1LLCRMI5oMSgsUY+
	 I2Ad+aEujVB1Y8taOAekCVpLnS2AwVkwJKKZWPEF0NK04nM9h3bYGfdDMVVfHRHk94w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XLkJpQWco9n5sMNhMe9Rfty/fDIzzK2dX/PPWjtzMU4=;
	b=LvnhPxDz1IGz0bjfFd9C6IL3vgM90DXRHXFAsvSrWZKJtKrrYOayw+BxouCsF7S0WOTD
	 Yc87LpITvbmPxVaeD4ZJ79q1nksquCFbjw/uWaUcHfxd/Do8/VHWukteqUKCR672P7UjK
	 rPlu8YQTnWpZNPeZXwFSFwz8Dupo+3PgwBAKh8U0tn8e+qJJ8qtsock6DxQSWjc6x4GFR
	 ZSSlnekxbxTNjPpxKcVfG0odD4wwC7RqBspKDbD6GUhsmWMDPDwzskBYja1is8LjTicK6
	 +8xGebBoXDeBrUJ9SSkpecG9I0ieat42mXK7aBC211NiduweBWInskxKm7CnEogkE/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CQQTClel;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153FE606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 153FE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CQQTClel
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so5831806c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041999; x=1793646799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XLkJpQWco9n5sMNhMe9Rfty/fDIzzK2dX/PPWjtzMU4=;
        b=CQQTClelF4Z/y1v1UKcARaJfZ2oWDcixPOJDkotrofreXPGW19wumCKvJyACKbtJ2j
         3Ldi/Kz4d5QPEAc/T3wJ09OqTnf3OU/JbpSKIA02sReTxeYEOAWBMCpTGGmEtMrqxkUK
         CrTHirElSsEtq+lLIc3g7mzJfNsqAROk8B4TCgiKHFWBzabG/oFAIVlb2VNeXijG2UPT
         sUNyumvg5MrbwWEY9W1wuUL5DcJvvEpUic+iRRZsSXSdxe5mWvfWzBwMYvJoq9aHLzVY
         CQL8+kLLjqhfmjskjxHhFQsd1tcAEprAG2PozEDtk6zjl9Kb9qlg47kJnucj0ixTqTHg
         nWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041999; x=1793646799;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLkJpQWco9n5sMNhMe9Rfty/fDIzzK2dX/PPWjtzMU4=;
        b=0Qa5/Yg1mCmwYfzobyi0vD6Ke/4oBhC0pPSZ+dhs+/xP7IkIoVj78x4xpqcmGZfvNL
         CStvyHnK11YTQ+9RtkVazhxLuYD3gihFjGAF6/OaJPnfbcEdpiIuDI2YrFi9m6dCLWyA
         /UJpe34MftkFToO5GY6DspnRE2fbQazif3jR6mZRLSdu9BoXvKZEtv3o7P+APrCbbiqB
         mZNnOiJ+hW0tASheqBbH3E9ip2iJ80K/lb7k0nRf4vq+03s8EdbIk1YGqdjhe54A8yZW
         ij/spQfPEoLgzvewpukp5IZJhpI6wnWFih/b7oZMpqfpnjME+Ae8G5TFCATpBZduP4/2
         w/AQ==
X-Forwarded-Encrypted: i=1; AKwUvByYpzxh2+44t4VTjU4KtFZe7uAZ3BDOq4yi8nLqcu4Eltjx3ejQUUcR3NZKOcb/11pus8lb2PlrJz/TWKQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK30nfG88mulPwpYTRA2jHKhNXvWh4WBrAZZke3yXwmesf930zq
	xEOdHDBCPcpdOM1joj3lW7u568X/J/hyC0j2QCHFPUBE5EzSVBH/Gvu/
X-Gm-Gg: AYBFou32U40s6en+L1YfHpYSDkk9cA6hPnjoXM6Q04Gbipw1Qwi9kz8CEEr0THnCZMV
	jy5oYZ9fRrpbmA/ZVgBBcJ9Yq4+F+MMNkRjO5On79SJK78PmXMBAbJOyXW6KYG8r9JTxvQpqpKf
	hgxditdYUNill2mmwEznZnhwbWxM+mDz/bM5TjPPs0H4nLS3N4sSwkVQZC6Isilp5vNf75aeIEs
	4gdRwd1W2RXlAIla2d8oy1RHQw+wYzqsoJcv+G608vpKfh3Dl6QnHJAOYBXzo+Vf4Nawhs1k17C
	Td/XcT3Taa4m6AjG64YkoEnW6S82J/ZVkpEWfKqQdC+MaLM1cOqkSe+dH4pAp3aNO/9juBLTfFs
	trsBcjVJhwlb//eCdRtUg+T9TskLGhwiw4LWPWYp9eVy5L6lfxyyzpqXiwQp+JuBBMXLZ04tbfu
	ruFbuISQbRsMOaj8boy5GWqt399w+7/f7ysteT02PSaELA5GXhPJQQvP3OZfWD//rePoByvsSmT
	EYGfYe7Ai//F9F8tgZ8WQAOLdtkUnvJlzsdRfWUmFyrtKJks+UrqqDjZJPpX+v3VFk2DfQNm8wm
	Wo0EX/S8UO9j8f8=
X-Received: by 2002:a05:701b:4309:b0:151:6e80:baa9 with SMTP id a92af1059eb24-19933e10e2cmr10466847c88.12.1793041999000;
        Mon, 26 Oct 2026 12:13:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm26826628c88.14.2026.10.26.12.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:13:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 12:13:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hamza Mahfooz <someguy@effective-light.com>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (nct6683) Report the duty cycle of NCT6687D-R
 system fans
Message-ID: <0c8f35ac-3c92-4b1d-a027-7d8912751109@roeck-us.net>
References: <20261004153250.516730-1-someguy@effective-light.com>
 <20261004153250.516730-2-someguy@effective-light.com>
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
In-Reply-To: <20261004153250.516730-2-someguy@effective-light.com>

On Sun, Oct 04, 2026 at 11:32:49AM -0400, Hamza Mahfooz wrote:
> Recent MSI boards (customer ID 0x20d) use an NCT6687D-R. Its system fans
> are connected to channels 10-15, which have no fan output configuration
> register, so their duty cycle is not reported.
> 
> According to a reverse engineered register map, the duty cycle of these
> channels is reported in register (0xe00 + channel - 10). Report it for the
> system fans that are present, so that pwmN matches fanN. To do so,
> support up to 16 pwm channels, indexed by fan channel.
> 
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>

Applied.

Thanks,
Guenter
