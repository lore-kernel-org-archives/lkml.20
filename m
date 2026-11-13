Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584926;
	b=NHvBA3dtZ6SUTN8/f9ZtEDFIPNjOfIqt7iOkHJwAXUmjyzkSAgaoRYUObP0V2Hz1cU76
	 8ZhS+3JUr0N4bMZm9yRf6fcWHJkiIK1fFLT3h/jbvFCYsvNf8o2DfQVM51XbKkBpCDs36
	 N3K1e+uu85SmWo/TPXVPxKrtWFgdlu5YQ9v9JlQJ53O9DyFRr2q3IRLamssGgyw68ov03
	 8llg+LG+lQ0HfbhNGpQHlter1wM3m3oweKAe0Bb1gZ/+QtZhmNimJCXObsMliWWQbihvt
	 8DesIAJyRhJKQYd0iN6v689gRbUTasPxFazHFySH36mhImvyZdsmmftvcT8c/D3J1+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=L6ki+0PaY/WrQkPB6SC5FsCkgGtvChfCsF9j3DnLHtw=;
	b=4bZo1zKpLTAxhTAsMeWTDMQR9E+XViWCjqnJ/u1DrQ48fJNpWe/yPrtSPUKY+mSPw9MS
	 ythMUCGgfexDK5Gj7uWJAgLI7RNmltHm2AsfCvE1gphAoLIplevPR6Nfu1E++iBgbUMKj
	 NqYUCwpMyun4g2+NlIAwNhxrV1hwuD6ubx4qy1X2a4E2ojlHBhVYjvw2ZX2Z0o/mBIgMV
	 +X0MrUwsI5jMWorYSfeq9EBM9DItFVJYNN1x/nGTinQmTl2UGo54LqbZrie+kOy38nOTL
	 54KY9jutji77r6LA6Vog9PPICsCh+/W3VYGLSahfbfedp4HUnoI9a7t3OAGtIU3zD9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNZqCOkt;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E302606A884
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E302606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNZqCOkt
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1aefd1bf74aso814542c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584925; x=1795189725; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L6ki+0PaY/WrQkPB6SC5FsCkgGtvChfCsF9j3DnLHtw=;
        b=dNZqCOktSMke+581Te3s4mDy6oblJ53Glr5/osQh0522nsi5YCjsx7GlWu2mrdBq89
         TmWqE69XSIZJmh8EE7HE558eZxnIoWJI3JU5ttGpobnRI5r4ZI5LfzDWSqm0LsMSutuI
         DrY7QS1HrbT8bLhcltQk3PBPUz7WP9dBzo4TsgokV6eLPeDhG3OdPe/BmmYVH5JS9asD
         s15AN8E0jg4jrm3C2cTqYz5R6ZBGK+CjS+tJqRLwFmoLANF7na6WxjlgcTQdsQfmpSFq
         5L9GbYs12uT/btqH8AnrZtMUZkfiaAikq+wj9A8XXRhqnxXmEW3XOsuRF1ttkinKT5on
         bthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584925; x=1795189725;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L6ki+0PaY/WrQkPB6SC5FsCkgGtvChfCsF9j3DnLHtw=;
        b=FLtjz+I3zCBJsY7oBuaR5l0j5touSGBuuuw9ONoJ0F8RPJxylHJjwMtDTafIEkFql9
         Z3ctQUpoKGhqZNfUdXKo6gS9lJ1aNHNWlT03jWt/5S7y+QJDsYaq7mJY2c1DlaW3/TRH
         6dXkHe4Jm2V0jWSur88I2wBo1MRoeGrAtetWXfdXjmuHaG+VnDY6Miumdsays1YLrfZx
         5TaBcpF+SERO3zvL+Ssdkgo4mx1G/3O0T9Vxa1FN5EG1fSI22bHkH0Se5eTqbS9ymeQI
         Gp3K0YGgMYMb+BXutpfchzi6T+dIBS1uFq1JEuNPEj3Y3fAOyr1YFvbp+YpWkTp3oTGb
         GY6w==
X-Forwarded-Encrypted: i=1; AL+hErEIuLVmR2M3H2m/GPSI3QY99+deQnaRWkwOqU+3Fqk+gPmDeqvlIsRqeMvGGUh7gDBh7NhSc1+zE3pfuv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AjSBuRZzVD9h6Aso2gNR4NYNLVOtHEou0QdP71wA3YilYlI0f
	ppHrWkDJ1pGDfA9rolvFMpMwPzNPf0b2SeGRE+Ql4vpqcsAyb/MTv7Vj
X-Gm-Gg: AYBFou2TY2DIa1zru5Xb3Q/ANSgMOUjcpgqH6etQMJd8R1HChiFVtS8SkG+z7dEOIBK
	asMqJyd8xjKMV11mtNhs7TX6NtjHykBhXBK7I1/DdF1APMwneYKGLk9qyBv/xCu6F+pwGItthQt
	nai8EjVcKPIofXSLw0wEnrJWb5A1VJluyMtNn1G4e67ZK7+uEljyLdwlcycJU+I42P3Y6vMjaCr
	8rnnGVNE3QxY42aivtEbMjOh9dBZKnKVXxto4GNTiy7Q6Wq8QS9gxnt0T6gB6oFBWnkCXV25ND1
	Od6Q//oq5og5QQgFChezQO8bZYCaPyJo6z1BjfrdzgrvYzcwIHSpC3VuImeiNY9EUDaq2IrcVWt
	6T4urEmF6XIf2tm5lj2YBIaCoyrEk9yG+UcQuZfLVMYggG9oOJpY+khGSk/6JZoYQPLjQZt298F
	ijbz21q5pfmrw3pQOtAAwLbsL3QlgP85j3pQ1j9IkhCGtAWDhFzOz9FjfoGyNJZ2S5gJ/PzSiA8
	aRYMx3Z/A09aXDRByTTmPVl98X4sEpE2QhV86H6r5xntSngo173sEIiVXDF2zAGcPfbAQNU74cb
	IDgZVuLQZpETHYz8Pz2ZuyfGu+ySHlImlJaceobBFDTDYW5l/e89IHfdAnecsdYW2N85JF0=
X-Received: by 2002:a05:7022:3b84:b0:1b3:a8ee:a0e5 with SMTP id a92af1059eb24-1b5030243ddmr2914814c88.2.1794584925353;
        Fri, 13 Nov 2026 07:48:45 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b2b5sm7053580c88.1.2026.11.13.07.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:48:43 -0800 (PST)
Date: Fri, 13 Nov 2026 07:48:41 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Yuan Yao <yaoyuan0329os@gmail.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Vishnu Sankar <vishnuocv@gmail.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yuan Yao <yaoyuan@linux.alibaba.com>, Jingle Wu =?utf-8?B?5ZCz6YeR5ZyL?= <jingle.wu@emc.com.tw>
Subject: Re: [PATCH v2 1/1] Input: trackpoint - Add new TP JYT_NDT device
 variant id 7
Message-ID: <avcxUnUh17L91ny9@google.com>
References: <20261113112202.10304-1-yaoyuan@linux.alibaba.com>
 <20261113112202.10304-2-yaoyuan@linux.alibaba.com>
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
In-Reply-To: <20261113112202.10304-2-yaoyuan@linux.alibaba.com>

On Fri, Nov 13, 2026 at 07:22:02PM +0800, Yuan Yao wrote:
> The new trackpoint variant id 7 is found on Lenovo Thinkpad X14
> Gen1 laptop(Product Name: 21XMA006CD), it belongs to JYT_NDT with
> confirmation from Vishnu Sankar in Lenovo. now it's incorrectly
> probed as Generic or Logitech PS/2 mouse.
> 
> Add the variant id 7 to match the TP_READ_ID command return
> value, probe the device as trackpoint correctly.
> 
> BEFORE:
> input: PS/2 Generic Mouse as /devices/platform/i8042/serio1/input/input63
> 
> AFTER:
> psmouse serio1: trackpoint: JYT_NDT TrackPoint firmware: 0xa1, buttons: 3/3
> input: TPPS/2 JYT_NDT TrackPoint as /devices/platform/i8042/serio1/input/input8
> 
> Signed-off-by: Yuan Yao <yaoyuan@linux.alibaba.com>

Applied, thank you.

-- 
Dmitry
