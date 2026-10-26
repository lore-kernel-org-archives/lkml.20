Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025614;
	b=FZSbtGVbfCuCpHcQlnGpi0es8CBsEUM4X40dxEUpzApiGlTTJ1ioZb7fWC+0KnLNnxlZ
	 eSav1ij2TajJAIj6j0fq1x/18gd8NBc7gmr/7veftAN6VT3dOkZehOzvZiN5zrfVXbGbH
	 OYinwo4JPbjX/96cAWFQmpiET2kjSBBTK8DoVqQAqlufMfT11iXrTtg3a3fdTKITSKzKJ
	 KJZP0FMtZrhy7o8v9yfoYrm0jeuV9WNWd5Ka0NYgtC+kaVEBYqUwZ/d/SAN8FuZDcTKhg
	 RfkDPRMuzL10TMjRlfuzjUzuUBllbsnSqxuI+SXJFO7DYtrph+wCZuVty0ueniUyYBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CJx6Jk3q7Zj0vUF24ySNqADHQgrgfTJxl3ukIMikbSg=;
	b=E/bA9XrlMvZH49ytsNbLCCmnmJGZM10vhOmvO6uTAMIYQbJok6MrjltXVoqe7pTNlSIX
	 AbH2m7S2K2Iqh7u5DqJDnSPpgXpQp8yzxg5Ux97oNmjZ9zLBFO1XnZBocBuvvqgv/zb2K
	 MoUF2Oj8ngNMJqBJ2woAqw+Aqn3Ghu3dQwh1P5FuzpA5u3902ypyLh2x9B6TFMjOQuYiB
	 VFtJHhNFfkQkG/Q2qUbS9ySmxERoc3oOu4LOn89H6fMz1PjoCcRmC5OneHeR+w59R/VZp
	 ZKPZByMEoC9sz4WELBR6SDNvV3fDAbVIoMx9rKAfyjAkeMIrKQJaKj0KTwh45aW3EmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="AnBU3FC/";
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF983606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF983606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AnBU3FC/
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9ae391a05so21508035ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793025613; x=1793630413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CJx6Jk3q7Zj0vUF24ySNqADHQgrgfTJxl3ukIMikbSg=;
        b=AnBU3FC/k9/7NJPQaCbz+jpM4h9DbPEzea+pAhsWWMEqU7at8UDWkFlWrJGLeXEFIe
         jEJ3nTIQghMOvFuiH34NiTVKliL6GYYD6lB71lOYvesKdRjuTv/cd9RpIr4DXvxfCbcz
         e/IIdiBdO4cyN3u0Gohp/avUemciBsVq3s28wWFWjTJ7xtqO5OKf6sTdHYxIvFO2jdtg
         nqWdCRAX89Ll74HR+pGAgGrnepeIqx5rMuc/rf9PM2A5X0RScXPrHvJbe8quGTHaHxYH
         A51ep3anRYIWMswa81ank8FGaaE42stZW63XTaOCqCWBnQFvHNlQNx1RyvP/DyvFM/a1
         Qa7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025613; x=1793630413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJx6Jk3q7Zj0vUF24ySNqADHQgrgfTJxl3ukIMikbSg=;
        b=zakFRAG1r/BTcT/hEc4S25JU7QPrMsi90dp5d8NsJUgw0vVKImdqNSqnUlslJIYJ0j
         RF5kVCHathNcJRrWeGScl12h3huzjBCGssvIuZgzrtnzTRQtBfK7h2GkwySuw3nyUJdr
         BKRi5f1CQVfrCaCX1HhOdNDVHEC31jai+UptPkJmpe0KAuZOLubwAqX4vtKRysnp8mzW
         Yx71UbbG956PnYOm+dnjXl0fN1xuZMU31HkCLMUTg4sFPF44HdxIGJoiSCfo0AkvWk8x
         h7DDU6hoD20ZLbQcd384RQ6GFbuBcCmfrJ9uTafrmOwOednIdgE2snMLucqjybjEat6P
         WfBw==
X-Forwarded-Encrypted: i=1; AKwUvByhgt5MPAX5qW7wsind7xVYNu/dMS/fmZBhWJDysB3DmpJKRAzogUNOAFbc6WQt6cvNDbOz7b+qg1WMayE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtJn5vkVptDISWPWBhJ8YQlkk7qoqrhf0rWjIRVhC/1GMvJpXX
	M+D0GvKTz3koN0akc77pFWXMaaYvf79tot2HUqvx07/H4pFMEHOmJMWH
X-Gm-Gg: AYBFou27mH6vytK2ZtIHVOCiTY71P511F5xzh8CFI1ulY5ZolcUBmulTPcyNThsJvil
	yezg31dYZLxT5M+jhqJYg65FOEvXJL5Lo6mMFJzdUIcU0sGFn2ekuRD0uWshW94mXSKKv9DeTQR
	Uq2qd5k1ePeZiVI+SoSbHVKylzqKbpGXhV90jJjzq9vS/76o6DufB6dj8IGuuGWEHIiAdrLJmhx
	+68XI1kyZwk7LAIjeRFoNMpKCaTuV1VR/rJADnxGSA/DYT1lxO6agtQwcUM90l1kJhOgAbm0qwB
	b4ok1j9zv8bHks9vwvHbur27pJKzSIk/J+a0J+1vI25V1nWj61EcSWf1X+y83R2vlesTVeJTfup
	fjPa84F6AcW31kiphc974t50Q6ZBUh5HBwLX2WGcUWws93+HbpzQUTNY3GLsNaRQRsFP6oQFEAI
	2V5q8S3QE6L5ex2w1+CAvWKqqejvTevaV3yhNgC6F1uj/ORdlAV5ndB+3gLejQFlHO1PdI6IUw4
	9R/trvPVbdPyvSb7LRdcEk0LR1gUYoah8WfLxHa3ONZ66VvyB36iiZjHpFXs7gSNXyDzQ==
X-Received: by 2002:a17:903:3204:b0:2df:b004:df28 with SMTP id d9443c01a7336-2ea9cc685bcmr40841475ad.35.1793025613080;
        Mon, 26 Oct 2026 07:40:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b121651sm18814625ad.18.2026.10.26.07.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:40:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 07:40:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: hwmon: jedec,jc42: add
 #thermal-sensor-cells
Message-ID: <3a279e6f-5c51-4786-a322-2c56667faff2@roeck-us.net>
References: <20261001-for-upstream-dt-jc42-thermal-sensor-cells-v2-1-6edd30b082f3@free.fr>
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
In-Reply-To: <20261001-for-upstream-dt-jc42-thermal-sensor-cells-v2-1-6edd30b082f3@free.fr>

On Thu, Oct 01, 2026 at 11:58:14PM +0200, Vincent Jardin wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> Since commit 032c1623c9de ("hwmon: (jc42) add HWMON_C_TZ_REGISTER") the
> driver sets HWMON_C_REGISTER_TZ, so the hwmon core calls
> devm_thermal_of_zone_register() for its temperature channel and the
> device can be referenced as a thermal sensor.
> 
> The chip has a single temperature channel, registered as sensor 0, so
> no cell is needed.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Applied, and queued for v7.5.

Guenter
