Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C18402B9E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787820751; cv=none; b=oCjjK6dLqKoc97+wIpxcLYyQOEodUPsgtlO/jzAC83iEWMPyKZsu+W74HV/AqZ0N//3c+VFVAWtttQq3E8x5C7lcw2xWvVnPIWhW2dKdA0XBLSWQRasLFjUuN/Fl5AZLFxbT+oVMDCPNQAq2eXK3hYokMuGw4IpQXcgmPHD19as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787820751; c=relaxed/simple;
	bh=5hJ7mZeypVJLmhRFxJYm9bHOTFShVm8RTGv547/GiLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHds1Ifp6f0jlLVwAUFczXPtW+Ehv/6OrnUvoDR0J/v/GVJexnBrDeHSFrlZYhN5bfDFZqLlRVBCwiwkWIiefCYRvlcyt3iyg+hS0pRYLTeCijNAbf/fyA7a5nbUO0mUEc5Qm8UK2sTa7/kYa+0G6mB0Rz8nMVBiKUGw/1+iXEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RNf/2WB3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ti0mge+2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RNf/2WB3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ti0mge+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787820748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5hJ7mZeypVJLmhRFxJYm9bHOTFShVm8RTGv547/GiLI=;
	b=RNf/2WB3AFbxa54n9ifm+cjdiox+7T7EA8f1/tDeAgX+o3MQqIQoh1t9oSKTOmDUTw4Awr
	vQa6J2M7L/2vaXXWZwS/HrGRgaWgmgPeOIYF3UutXUHD2GMNv9MlpQMx6EU8pjpPFr3gcP
	ygYPZqw+l/j6iAp/KIpRQq9Qmr6gs1w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-oi9eojPNPG2TKihNzJIVLw-1; Thu, 27 Aug 2026 04:52:23 -0400
X-MC-Unique: oi9eojPNPG2TKihNzJIVLw-1
X-Mimecast-MFC-AGG-ID: oi9eojPNPG2TKihNzJIVLw_1787820742
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f2de3ba47so1234169f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787820742; x=1788425542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5hJ7mZeypVJLmhRFxJYm9bHOTFShVm8RTGv547/GiLI=;
        b=ti0mge+2wPefxvEtLhEKK4dracbWY5JUUyqz18gA50kWQA5lSzOzWy3OBw9wFCQRS2
         iD3BpvnlsfDFU1p5Wtdyt45OvtH5KNMprYb1CE9WsliASizBqPCPrRgNJnZ/z7MDCimw
         FrxWmBgB3V8+t8PrdLKBGTiXZfBMW+mrkaQA8qSdRe+nvGQ+ZuiW7TwP6y+Zet0eE1gk
         Dh7LX7F9IpMKALcCV2Wt1ZBy9hi+xa0VvTSmumBVPtzb3JxyzU5IeW4XIvXQEe3gngIY
         a2qZQasE/xhKX5tvZbZf014dlkRqFRHHkiLOeWDLJGURgJsNXJYsAAhXoaCH7OCzaSJs
         V1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820742; x=1788425542;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5hJ7mZeypVJLmhRFxJYm9bHOTFShVm8RTGv547/GiLI=;
        b=fbvDA2TnFHX38l88uH8k+vNbvic/mwL4H3OYq0fDPotzKrGU5S0TwVeyeOv8fAPuMJ
         spvaigze99aI+s4lIGbYBvrvDiClDoWeNF/6rQgNx/DwZCay3gV9MAuTxCI2/5Ar/9zL
         /9r364YNA2LhyHkIR1mibzyPrdGX9sw2byQVbcXqzcQfN8jsuxf37ksX8QJLvJHxYkn9
         Lf9CqQEWmREy05N1/D7M2S6hn/r0yBH30MuayPNRYMIcO1S1atN46UDYDXHfJKtulgl3
         RDXpsHUJDMG/Swp+6c0c2cng1kszD+EqVbNewhXKiUuj0SdZwirGLrcj9u2T7CxHTwVL
         tlLA==
X-Forwarded-Encrypted: i=1; AHgh+RoDvCfTBghZV7sXa6IRzuCCFs3BgSwSR12HLPil+0CvF4iXFMVDSSqjome0b9KEwMwgcmVgmYtiAmd2tfA=@vger.kernel.org
X-Gm-Message-State: AFuF++nkfcg75WIHGLhfaLOmMhXCodEybcrds6avjicTz5JnwvnmAORq
	Jhro2kZOW2dr9GQjnzqYrg6bHSETQNzxW4rKARXer2gFpHH5/P+Cfsu4Kj8egs0h9hWhc9bkm6r
	yk36V1pJyfiQ1KmOz7pEgaciVZNj1l+RkpYEfKycGmLburAm1xaYySFWArTRxTHgDQw==
X-Gm-Gg: AR+sD12w+duqb0SLNAz8b9q+CqBDTvVnroDngDjV4hmgu+vntMLU2Vsdnw+QwVHvfD5
	4wzNWm+V6YQTMferxDAI9dS5AEZQDWS/ueMWnYsN7vDgIoFbcw09mx++JBZBK3RchC3B860xQyU
	zpmhH51GR5Vqs+tKy5/xF3Y7UnvC4PtKrVD2C3EOegc8HeXrzxfOt4VpUsAQJhGLWre45/oF5oh
	NtDCc1h3rXegso+0ieDQUuKWsKV9GJBJFRJn1mY3ZmEeLD6dbtPZKGene5lJp6xau+z41Nm19g/
	Ix7axWVHDNmQqQ6MpoLfxGvYdJUaGJDli2JChowaldKEcKW0ssbcvkxXHsU82jwrnBURsQ/MZJi
	AbP6X0vyBCqb4umyOg4zgymPbrtWG1KiRQcs1vYVZWelXQIeVU0hzvINKwHbSZmKCSoaaVSg=
X-Received: by 2002:a5d:4f82:0:b0:482:e263:2c7e with SMTP id ffacd0b85a97d-482e26de754mr13993889f8f.13.1787820742516;
        Thu, 27 Aug 2026 01:52:22 -0700 (PDT)
X-Received: by 2002:a5d:4f82:0:b0:482:e263:2c7e with SMTP id ffacd0b85a97d-482e26de754mr13993819f8f.13.1787820742077;
        Thu, 27 Aug 2026 01:52:22 -0700 (PDT)
Received: from [192.168.188.103] (ip46-47-231-195.pool-bba.aruba.it. [195.231.47.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279ecaesm7707204f8f.6.2026.08.27.01.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:52:20 -0700 (PDT)
Message-ID: <18d43f38-ad3c-4e1e-b313-dd3b64fe02c3@redhat.com>
Date: Thu, 27 Aug 2026 10:52:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] net: macb: exclude software FCS from TX byte
 statistics
To: Nicolai Buchwitz <nb@tipi-net.de>, =?UTF-8?Q?Th=C3=A9o_Lebrun?=
 <theo.lebrun@bootlin.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jonathan Bell <jonathan@raspberrypi.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260824134703.766708-1-nb@tipi-net.de>
 <20260824134703.766708-2-nb@tipi-net.de>
 <d1f02ab923c0464fa73cafa75a21943d@tipi-net.de>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <d1f02ab923c0464fa73cafa75a21943d@tipi-net.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/25/26 5:04 PM, Nicolai Buchwitz wrote:
> Replying to netdev's sashiko
> https://netdev-ai.bots.linux.dev/sashiko/#/message/20260824134703.766708-2-nb%40tipi-net.de:

It looks like you instead replied to the comments from:

https://sashiko.dev/#/patchset/20260824134703.766708-1-nb%40tipi-net.de

Note that our reference saskiko instance is actually the one you
pointed to above, even if the comments are at as slightly different
URL:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260824134703.766708-1-nb%40tipi-net.de

Also note that pre-existing issue should (usually) not be addressed
in the same patchset (unless really bad/exploitable).

Finally I have some concerns WRT patch 2/2: it should bring a
significant performance regression, and the frames transmitted ATM are
still valid (even if 'downgraded' csum wise). It would probably be good
to provide some priv flag to enable/disable such behavior.

I guess some/most users would prefer send 1 frame out of 64K with csum
validation unexpectedly disabled than hit a huge slowdown.

/P

