Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772233;
	b=B2epKOCe3taDqHY5nT31f1+TJemUF1y0DrnfS/wY/Su5OryVfS/oajTfIwEMORXxymMx
	 C7/NpDj+r26wTAB7CAFFoCPAj5WK6+dKpSDRUTISvf1t68XHldlrige3Qg2f+yqviH4CY
	 PWFva7ZIHlHs2ycjYM7HprCxr0QxdurVdiIGMbqdavXNSy54A7DOXM6sdPid3ng4EG37/
	 Apu3sYrRyjJ+41IX5RgAyzC1JNG8k99s3COm522ZeYmP9sJDi50bhG+wzTH6a5G7ZHNjK
	 r2Eu7mpTC2emz5R5ItojUikBhhrnW2jbqx2ZBZ1CS5ysPa7ChvwNGNne9swPzXjS2rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BzEMw2qyVRDMO4EXZ9qN4crrCxVYQEBm0VZTnBXODc4=;
	b=S50//FJ2MhDjVRSFNlbLkD4v+s0q0y38RalNY8NsPgDAJtlqHAwME0XvV9aL0N9YJoSC
	 BTnuSOXf4GDXv0ZuQzKLknrGZFb6t7G/oreblsvN7IHxB9ncEtV8gxHHeXguinycK9wN+
	 b/oXlERku28Qw3EypkP4tDOUfpF/YDdQ5ZFlvQ88j/7tvEDXGpu9q/+xschc2V7AZCpE5
	 B19lImip/9RPuad0A9jkx8gCBEOUTrDs3rLh6p4fmvYlSHitOdJTEPJpUvB/4fLUVJcBK
	 8k97kJELTgpaOLsYh5NBwPPZ08CFHtztE4m/fVmHOp8rkihpIrOV5BBVY/20tkovO/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gdBTei++;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA02606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEA02606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gdBTei++
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d05d51553so7705045e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792772231; x=1793377031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BzEMw2qyVRDMO4EXZ9qN4crrCxVYQEBm0VZTnBXODc4=;
        b=gdBTei++O3Tyttcxc7jhIVqtqfAxPonidYibGhNlmpv6JEvYke6DFlNV8qVgLDpDOM
         xSAiZp0TnwEc2MG8RxFw7nWGw7vy2/4wpxNEB0QGGGfKXKEbUze+6ag0MeeAJGR0MOrs
         f7GQ+iUVNZVx0yF+6IoouMVPUEZkstlWyaSK/1uKilenrsU8ikh0R550EA/K7ZDe9mbT
         yCyZ4e6LpJW7qUj2dbAYUIkdtuLEcXeL8ue6/qalRmNBVav1rQ/cneLKHWNQoJy9tk0H
         CieX8akdyk5ylZ/lEHpz3Wv92EaSIfyoRj8Wp8ISA/b+yLW7IuiUwUOcINssxxPW9O1X
         MDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792772231; x=1793377031;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BzEMw2qyVRDMO4EXZ9qN4crrCxVYQEBm0VZTnBXODc4=;
        b=GVpHueI2Mdw0McczR3+x5vL09XpWsopMtoKdDDRD+Jgg8vRWkxoh3X7CosOSIMZK3C
         sX7cLQ3c6YddqmloyQbTPBIr0g1ijzwPNDmS9C5Z2wg2VS2HuTqEb1KmDQ2NtPfoOJ13
         qYU9dmVLL0Bd/EuHqirICMrZ7YPb/i3iwp5dAbAV4XdN68k4Z2iLnZaRpugba0mncQgf
         8OHAyKuTFkj+uB7zkceCkaeoswI+zAvYIPgTmUVYV2p8tfplG98ROS8nnsZTa+tn0ghS
         mllz8wuUDboSj/zBDL2m3klecfdccY1lJrzxQaTD0i7PrtgL50XX5mfX6loB2Cc4/bo6
         Q3oA==
X-Forwarded-Encrypted: i=1; AKwUvByvRBcQ+5TjA4RO3FL9Tr0xdS5eXs3+Q2xRaGvfbR3GWcYryLwdSa2/aZxJLE5hgCVHdxXTOf+Ei2ZrnuE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzMvpv5dmdduR0yqQjcX6IseO/C2MgKiLBtqoHmM1DE6N54cTj
	rYz8e2e57GEA/4LfwI5uOE6IZGbWr//Sm+DefRDYugHPucbADMVzJJHR
X-Gm-Gg: AYBFou2NrUPF8y3gaemaVquUjiNUAXA2oPGyTc0yqM+JI8YyRdG5xeZk8hg2+2kWuFG
	b4yeppzjn7RdQDy2fTd80vSR7pDLMlm2+rV5PV0wA+Pwfwn0R81mz0wuJsQj2UXohH+5QWOdKAe
	M9s/n4tGgn6l0OvaG1VYp3zMrtndZasqsjkBDhkwHigihsPZTQcQ2VflBpN9r6ZmXg9UTk8clDA
	7jsvu5o7SZn3ZyupUzx9m75KC4MNCxxUHJ89j2qil32GZKrVdGAkOXr8QyT8wrVrRmfAuJRGoQb
	YW2ro5vM0k1ppIkfNTxiYTViMdjFkufmq297cgrNvOAdVdeFS15lcTUM8NEitIHaqvr3aVyMn3M
	WX3f+Vwe2owytoctguJhUp2KyDcodxzFtxHjClpPszS00fh8XokmXoNALp2GNIfy1vwTQ5axPvj
	ZOX59hXWyEeF88kpuy2Om/pAMZrZhft9uAR7Z9MLJPMWVz3ZSaCvuNHo69tzntEon5MFRiJxwHS
	2A+d4Hr65HTqRG1IlCce9tfwnuOJ6PgohkDvmTbZ7DcbE78bM7Y
X-Received: by 2002:a05:600c:1d07:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4a211ecec0emr46659165e9.35.1792772230469;
        Fri, 23 Oct 2026 09:17:10 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2958bf25dsm20075165e9.2.2026.10.23.09.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:17:09 -0700 (PDT)
Date: Fri, 23 Oct 2026 19:17:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Lorena Tanase <tanaselorena3@gmail.com>, hansg@kernel.org,
	mchehab@kernel.org, andy@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: Fix double blank line
Message-ID: <atuIgtYbgUsmfgkp@stanley.mountain>
References: <20261023123158.6176-1-tanaselorena3@gmail.com>
 <attnVU9A2GvgYuy9@ashevche-desk.local>
 <09d70600-10cb-4626-88ab-f9e10f4dcdf7@nxp.com>
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
In-Reply-To: <09d70600-10cb-4626-88ab-f9e10f4dcdf7@nxp.com>

On Fri, Oct 23, 2026 at 05:09:55PM +0300, Daniel Baluta wrote:
> On 10/23/26 16:55, Andy Shevchenko wrote:
> > On Fri, Oct 23, 2026 at 03:31:58PM +0300, Lorena Tanase wrote:
> >> Removed blank line to ensure linux kernel coding style. Found using
> >> checkpatch.pl script.
> > 
> > Cool, but is this the only problem in the driver?
> 
> Not the only problem but as a first patch for a newcomer we want
> to learn the process of submitting a simple patch so we keep it simple.
> 
> Then will expand to send patchseries. 
> 
> > 
> >> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> > 
> > Please, put the Cc list after the '---' line, so it won't pollute commit
> > message.
> 
> Didn't know about this rule, there are thousands of patches in the Linux kernel log
> with the Cc field added there. 

It's the more modern trend.  It's was never clear to me what the Cc tag
was there fore...

regards,
dan carpenter

