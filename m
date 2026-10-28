Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203784;
	b=hkTU6zxDWii/WcfyVC8pp4/UJmOVsV6OmPORx1hgkEXS0wn20ODGv3bDisvMcWEAD8Sq
	 /f0+TE0hU++rE5aw2RKn473s3At0Et3YZlfM1fCvjjVHAs70CaBykQknTdl9lBW44Dj/q
	 hxxt2Ctuwk4c09UKcE6NamsFlZPpkeo71XnHPh89p7Dtrk5oXu4sYnTpg7vBQRdSPzWd2
	 W7ElGLju+17uxh6xrbK52NVriOAMTSQ1tr6cPk8nxQ7UpA28sr5iRIIUDZlfhhZVGFp0x
	 1Y9g7WDc8JMF12V2Vxb4xv22ir7tXnqwcUX3XMi6RUVYsGuqUXOceD4BqbtH3lxJumg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=YZcts4qcYFLKUzeEZmCB29OAtaKV7wlY2duix3l+9sA=;
	b=ONAGxkfElOBrAaYo3Ota+rlYpxfjquA9w7EKCt5+v3xDoRVAZudoFOFxRw2OtNfJ4L3z
	 PZkNeYhGZZiNrJUauII7AYnTLUTAdzvP1OwmvjhcvLUMEUJ2ywi07u/UzpBBDWgVPiMIR
	 6LMEnejKvXeMnmKXOX292xV6Y66g180i2iKIxM9l7wOS0I2MaTN/4BvRajcv+0Vwdt/dj
	 Jo3WyVQ9qvTGkb2I6AOuaCd3iuTKmQbThbNkyejEzaPMfsQPlWxKa39LKd6y5EayFOEY/
	 elsSNPAMx8UB/woh/3UYd0TUQEpCy5lWGzjZAA0jtmnjaRQrXGpIWIy0cI11JJqz4Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1D1606A330
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB1D1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a208d93758so12252345e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793203782; x=1793808582; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZcts4qcYFLKUzeEZmCB29OAtaKV7wlY2duix3l+9sA=;
        b=Ji5Xvtpoxyb8kVn4SdVY2cX+DsEgu1bKkZdsC3ebjs4d1+CltzAuRtjoP6qRorAjmm
         U/OTale8tpuOeROnVeyxXNIIaWfog47eEJFCNp27SbEPsWiXlbJSFUU7KgmL/w+kS1Qk
         Xoz40ZBJl6WRqwF7cZjV6sWb8IbzqZcrFctXWKFMXwrZRtrx0RyDRwjEA32GAPhICZjW
         MQaQxgB9raqsmYBxkaP7PzkQnI5sX89vYUiv0DZuFdVs9fh4gndC7Z/ZAgGohdQcpiRV
         +IlqliYlhUTo7YEUzaeGWGEgvu/pIVHVtE9NKkTWWWXdySGqcXDMlZXy58QAKS+slkSX
         voyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203782; x=1793808582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YZcts4qcYFLKUzeEZmCB29OAtaKV7wlY2duix3l+9sA=;
        b=o8eq/9LHNj5yFXGBa9PeTpok2GqUKEuBkhyd63pettUC47TxVO35eJaNVPyT4CCnhK
         EGbmlVB33cpSViIPUEmyGsS2Q/6PG3/lO83hFpU0krT+ev3gtdtgZjmio/zWFvfw8ecV
         sPsoWLG9VvC81Ih5TucwbEVz+dEx4NRWnmy/4rhk5k3fY6PfxnRjT+rNw0PGxXNOtIYm
         aUKzJ5ovqR16LU29IDlTHvx9PhsgAswEu8aA9a+O88iKMU5WiKU4m6HgtyboHCsMAD7e
         ymWZj1rL9bM+icN8qdi68FC6w5KB8cSJNrna2Y1s90l9MXn+BOvYnVYT9QhK6omMNg1K
         fCtA==
X-Forwarded-Encrypted: i=1; AKwUvBwf0AQk+6kAmEIj27tT1hAWZXvxA5GGvFKsi/wVxixKEEJ1fmWHewATZ7HiRk81wWv48rPYLkzEIsVxHBs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSuSLBHUwYc3/miI3esidAyJnnt2i68RkXW6PwrrpBbZtYpQ2K
	s0OCoKhFho4NuQyIipXZB9CnLBvHKOH5uf5MXV9lRc9YS7IVuzrz4jheW/BjBxEbgEE=
X-Gm-Gg: AYBFou115B7KJYu0a0n29/dV39HuFi7Quz3mij0C137aB1kNjGbd8B3nqZudNRm4tFq
	18Y7YGu88Bec32Eapbz8zLLFu4ahvPMKJibpHQS54zSVn+EuPSAoLTO5yIekwIr1K3U2y2mYDba
	jaOC8pwxspm1coCiMtVzcpFof2yxKUdvYaRKqeOvVLzofPMW2c6xl6XxlIUBYe4pSU9i8OwLk1v
	P0jWSS9ChItcsZ+tBnxUqysMDskLzVj3fYB2uFu4A/dVF8xRiXBXiFzMQaZk6+v9pmpRBATYjFm
	1Clvioqd8eSRyhDgIVAQawNzZQD+sJlz3rq/CeIoslyQbjw7iEjGZDqoj5uU6GRhKvHnqn5pSEA
	FxwddQEImGt4REMxGsBJ75+4/JNkZrdiPCsX+wknL1IwbTDQkrwXkiiXSMWZT5V2mCZ6monzJXY
	aANMwzHJZyv+AG2YgQUWrrBPtYwi52m5IXx9zLuBApgd8GKVkjg4Fk9M1sk7+Dn8YZi8OLSn+Dp
	E37oJ9uY4KZGGq3rYLE4IFQkzOVppTwoAmhqiRsfhgRkZJ/YbEgtKP6sicaxr8FyviB5Z1zozIO
	m45CPclRDDNWFEhSX+QsAj4Tr1UTVQ==
X-Received: by 2002:a05:600c:4f89:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4a966c41836mr68052215e9.19.1793203782221;
        Wed, 28 Oct 2026 09:09:42 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm1572025e9.14.2026.10.28.09.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:09:41 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 28 Oct 2026 17:13:35 +0100
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH RFC 3/4] hwmon: Add driver for Raspberry Pi RP1 fan
 tachometer
Message-ID: <auIfL4ZGdfNDUZxO@apocalypse>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <0d2249a66732bfce38a2260bee08cd1ba4097e51.1792748690.git.andrea.porta@suse.com>
 <auGdsv0OVG4iLjZV@monoceros>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auGdsv0OVG4iLjZV@monoceros>

On 08:02 Wed 28 Oct     , Uwe Kleine-König wrote:
> On Fri, Oct 23, 2026 at 12:15:56PM +0200, Andrea della Porta wrote:
> > +#include <linux/platform_device.h>
> > +#include <linux/mod_devicetable.h>
> 
> Irrespective of how this patch set evolves: Please don't add new
> includes for <linux/mod_devicetable.h>. <linux/platform_device.h>
> already provides of_device_id without introducing a batch of unneeded
> dependencies.

Ack.

> 
> Best regards
> Uwe


