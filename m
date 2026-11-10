Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286834;
	b=ydimj9aErood67gilKYKJ0Af6CrB3E1emQMJyPweLQ0FdU2KDKgNsE22ZRLvKiB/RQPx
	 RfQcgE718h4kHkAoSOlxpkvv6wlkPSCq2bvdc5o2kQwM4BQgbnfbp8obGA4YImolEElrU
	 gh5RRP5XnLBnWUQlaWblhrGMf7xOas6yh7McRBajBlrszTcVyEUNG89V9a+3Vxk/v4hU1
	 1soG9Vq/N/wiBYiPNsbYc+BI1pHILMAodg0H+vd2WiN4/gMCe/7cmRFJ9MV73/G1bhKC7
	 1/P+FOm/cNXfb0tOL1iWJw5OUh8mlfilVplncWTSAUrG6HD5ZEKRVMJiDNpKUgSe1xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286834;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=4O0eqh0/2N6SuevRIz4jY1zAOHwLnJqMFnfAmlKu68o=;
	b=SPqUB58C1i/Rs/s8AoxGWJOnnUxtX9T/MHY28R45GqYd0JEt02NFyijfZ3SPco65FZRj
	 1U3zey2Q3mmLEpWZM716Q2wWIwm2C1+pmmbl3qq/vbybKbV3UiwmJ9ZEKqWEaKp+GNFcn
	 IeYUJg8XOeSlodW444tWC3N9z10goyo28ncizDD4BGVd1KKXPq5q6bg/P0XhQUYzzbyzC
	 BWh3bFUeyEkSkWtVG5P32KY756Mjrb6G6oXzIvUgCC0wGp78Y3ou6iX36KV+3cy0SSZgB
	 VbUYeRKkK0FltHnUaNQYmuZuAoIqtESCxAzkZVSbSQT5wN7TY/j08bt/oWAru+rqqnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E3A606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01E3A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490c1d337d8so1085250f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:00:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286832; x=1794891632;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4O0eqh0/2N6SuevRIz4jY1zAOHwLnJqMFnfAmlKu68o=;
        b=UIMjgcKGSV9aJ4FPz7hSLhMGx+/WZhAJkne2SSQdYBgVzF2CXLRHvIfV7yJxgGkfdt
         lknBSsdchlFB9sGkPFYNMcFueaefRHJ1Xoh1llK9HWRgtqD6e1d14GpGOxyViiwVbAfL
         GFPtKH8JE6gDI7OyCnIBMt1psorY47CyCM1VV4LRUSYQ/EEB0o4cGQVu0KcJ2DX3npZ+
         tFIDHslRjdbmHzIKHPIRqlwxgY0CIPbQJPz5wolIRhndxoCPamKarF5sCYtxKlDtl9/9
         4aEV4vqp/Ms5pb9DbZWr36aoAKoK/ATfM581Z6/fhv4p/jGQ/+rk8IoCoXkWb77dHdGd
         aeqw==
X-Forwarded-Encrypted: i=1; AL+hErEpQhWthrPjWTyd05r8b+B/xF1jN1clXYzHmnJ2aSuQmwRSH7oLxgl5A+J/BWAsqZThiIRlKKGK60n9Qf4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dKCCOS+0BulR8uXppIm/meH1rYL+h1H69ZGOm8bWSrx6PVCJ+
	PQ/LDlICM9d26Fxf22EC1c+5GuKFuiwhcHnO1lZZ1x7igK+X0xm0DsUE
X-Gm-Gg: AYBFou3W3AxzStch8YPdLHGeuc0HhWD62gSosxW1xar4W1aX6YXVRKWFXQgefJ/uNTa
	4zzBaIaD6crv70Sw4J30aur7Y0wPMc6m3Jy3F8OhjvnyYjghWA3wPAJthCK6Vi2ZgucdbPz72In
	PtJBn3uOW9fzVmt/NWndRJ7SngikJTVhk5vrMeGAMp6E2PGVM+jRFsuZMNwo2YV+T+5lGC3bDgr
	c3uvgDXkXmNWO0ewPsoh0s1k1cePXZbsZL6UrMU8rcQjE39Z5Uukj/ZcwtK/RSxtI7Xf1YRGDk7
	qroWuXR9MjA5o0owy8TNVXPe/S8Y4tb8XrKKEim7td6tQ4p6HmGtfua4ISqftBkoegPAFOQQNHK
	bJMmdArswPITCtVs3osg9bzDXjf2ZRM4hrltsdU48x3Wz4kLKjnD7/fDgfn0N/HkTtT0hDdcwk4
	Dqw3k/EdMhs1dx6Xs9vgsxyR3iYrA+QD5+imD/e5+CmwQMuGeMWAoySPLDr4ap8vIgZa6BklJFO
	Uj4EuFGwu0T8GQdFfh2QLZNKjLBGt1O7Ss09eWTf7NdQleKliuXwIP1+0wQMhWCY58A8Bou/wSP
	OxFRjB3SEXLDxUxxaOMQ8PrakdUt8ViqFgF9l6yzuzhbqfsS6Xu/+2dtgOW5O+YydI2/E0OOtAq
	tJv7n9fyaDVYkSPpn/ppY53C2GVrzNzdvKpParOEkc8hmr3EytWGv2sNpKIiSBnou
X-Received: by 2002:a05:6000:2006:b0:48e:5e20:1371 with SMTP id ffacd0b85a97d-4982b28a89bmr2510103f8f.4.1794286832242;
        Mon, 09 Nov 2026 21:00:32 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498361f674fsm2715343f8f.33.2026.11.09.21.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:00:31 -0800 (PST)
Date: Tue, 10 Nov 2026 08:00:27 +0300
From: Dan Carpenter <dan@cryspen.com>
To: Platon Miller <platon.ksenzenkokk@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: remove unused macros in sm750_cursor.c
Message-ID: <avKk63Z5_ofZZcGk@stanley.mountain>
References: <20261109231414.25021-1-platon.ksenzenkokk@gmail.com>
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
In-Reply-To: <20261109231414.25021-1-platon.ksenzenkokk@gmail.com>

On Tue, Nov 10, 2026 at 12:14:14AM +0100, Platon Miller wrote:
> The macros HWC_ADDRESS_EXT, HWC_ADDRESS_CS, HWC_LOCATION_TOP, and
> HWC_LOCATION_LEFT are defined in sm750_cursor.c but are never used
> anywhere in the driver. Remove them to clean up unused code as
> specified in drivers/staging/sm750fb/TODO.
> 
> Signed-off-by: Platon Miller <platon.ksenzenkokk@gmail.com>
> ---

Leave this sort of macro.  It documents the hardware and doesn't
hurt readability at all.

regards,
dan carpenter

