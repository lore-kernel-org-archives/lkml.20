Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792826202;
	b=N6am3YXybtFdu//7217RFJE8RgB2QsEKRx/KRMRBiuJcqfHbVSaHHdTekvBdvsckjx0D
	 iQFS0QYSRNGYnlH/SMleBHQpRxMIZbq0z1A2387V2WYfSlcfplQStPVCjLBGTa9G0pPL2
	 dPwDBdd1dC4j9LzDVCL/JJz0iGxEwMMC32YI/QXU6FAE0nEWP0bE34UYlTHxup9z7h+g0
	 rj8p3ovQnfCFdbP+z8d3hyL5VZilPtvunK6VqZWOJzLP/OsRh74UuCVpk3oo8n/Xa2r+C
	 3VW+fUrNXXb21g4rDgeIiY7LYx+Q6LiezcnG6w/qwCrPm3UX9Lk9bNLSjYe4My7v9nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792826202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=kh/xa8HGjahPAuh2OoEJ1AULPxuRAadGF7CKojxM7CU=;
	b=u5q12s0NxEU1x9qB/yned1GiBqzKBXexE/mUmARPGtQUNT3/SpAiPURkiUCVQTcYCbLa
	 jHE00VVYbPS35jeMcLp9UWLw0zKkacgoDIcv8QYwdH7KllMerfeWi+ZIeYbnaUgUuEJB1
	 hIcIo0I3HziWD5Dxe4uaaiiJz1DkpRr7P3xdZYY2NB8fR3Upvo6q3efYklLrMCFfDTf+o
	 kQx5/ZPV0mdwvcAmkdk2HSY7WgRe/bNCMOx9JjZyjUM3e0Ha0gCTFU8A7WFfB0Ons2hpu
	 uHqAyVZjB09sp+BsYCw2ecewLssczV+M6xGJ6M8vpbLYq7nw8Cn4zkCPmHpWiRglS0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J6x8Z0je;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BD0606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3BD0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J6x8Z0je
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1001159f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792826200; x=1793431000; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kh/xa8HGjahPAuh2OoEJ1AULPxuRAadGF7CKojxM7CU=;
        b=J6x8Z0jeMfuArj7rumhIDG6cWCktj7G61rH0jgf4TRBjj12ZaqUyFKLmuBADUPowgL
         mLAnqb2h2/22xpyVKDpDDjGFYXxsP2cdWjX7kbaOZVb/MsvoOY8/PNXzkh7/taXFfV66
         MAxXK9DwrU+aLCMCyxjzbmCPVbBQJ5et1kOqzFbhFmoFxXStp8pz9GgGoUqXEdHAAaRC
         exq2qwPxw0z2w2H4z8qRvW/6DNpM2CvjJceWpGZcwhE83P8VYWG+WjGxPM2jddC+Luis
         aQZP7gWPjJaVhbipkyD9w8RiCEYKPF8k9PDmZrM0FGaLATPoHV+08VXJid9rGq9lIxq3
         zXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792826200; x=1793431000;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kh/xa8HGjahPAuh2OoEJ1AULPxuRAadGF7CKojxM7CU=;
        b=0LbczD+BFHWYhgZmRzgX71oY7+Ei9XXUMTTJUFRH1rcghG7uVAAFFqnjYY5LtPOPLB
         8nm+0oElN5cur/Z5WyQEzf4zYO9tXfhVLOlx3ikIqI/77hheZ+g0HRCRsRGl818hlBbC
         WZr7rAjDRjAPnVrqXQh79PuqTmBHxZ+nQZxWIgFbAu4dCLKLZodgV1gYW6RvC3neP5GO
         V1DnEZGgCni6uvlBaKbFaV7C6oCMN2A/mvl+qSDbA2Tcv1XdrXWlq3MMJTmI/A2P4POR
         LjQ1IsmQPGedxogGjQULoWj1aJDSkO9S5og6dkj8bKpMAsI4hnI1OC4LJGZlBuI0RZ99
         IQAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzesI/tss/x9jIU6jNXmo1GYLo3BKj13z5r/b4GzK4/wvfxtWgX6aLKXMPHqTsSJG9MXFm8H/77gTM9Wc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjsN0b7yeLC4FcI3y5Arl/URTO4zq9CBp2xw1jWAFQ+ZnomQvZ
	nFo8hCh6xcAypyS0wX+kaTqykxDoPw9jfnZmZsb3Z9huZei90gQKkcfG
X-Gm-Gg: AYBFou2JUVRjwJRcEEJwQsgS3itYHkO3qmK0PnPbwcrSldAosG+CkamgakeI761/8us
	cLYyzCLQ7devCO6src4zvYFkJCWaDLKPLBlurOA3Rn4HLcje9VYTlho+uDjs10M++gj0Sq6o9er
	Kb+uydA3ESlaozKnQ/zVRbVNReGHUyi/W9tRk2B2bVZ/C7GFuw4PKPfpz0983h6QW2mCZmyOG/N
	eeQRCQGav9um/ahUCA86mXGPO+NmY/lpjDTcv1scPGvoaooaZhwNNDzJJd0txRmyq2CKlj7tR6o
	I6AjEir1Bdlmytvrl7oOduF0owA2nZD0KWr5Nh6UQHafrmYyR5vyt6jy4DUTpwNg0oQGs8F61gM
	1uvdK6moXlI6XjK9YJt5UXBf3DgKesm/O/8o7GjBZHWICdevWXM8VFDL6p8Q2jxxIYEmESSdt7N
	GLVUs7JNfwrgAZ9G8tgJx8NCd7jxxLwZlFMqVGul7XtGSO08cRfiPGqaDjyE5DWOMf6tLPtmooj
	aJuIfMffJPuKGynuk9mLsi0IRU884MRlK/yv45+CkN8Opsr+A28rZNxrPrnFDlLPR5jSG20r8NA
	EaCMUPOISdCQfykHYIDImWmMZvpliIR1kc9JbK/E+Ap7m8OLQOYyy8BV97gmEUNhvOQO9vnVgAH
	SaF6yiTSUV7N3cocz8/GGaMNlIIb1PAt6zfpd3xhYrNE8n/ZFegH6/YaiTw==
X-Received: by 2002:a05:6000:46d4:b0:48c:6fa4:fc89 with SMTP id ffacd0b85a97d-48e3eb8672amr976542f8f.12.1792826199930;
        Sat, 24 Oct 2026 00:16:39 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-9da9-5f01-d5f0-7ecf-afa4-4bc6.310.pool.telefonica.de. [2a02:3100:9da9:5f01:d5f0:7ecf:afa4:4bc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4d8dsm2794954f8f.36.2026.10.24.00.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 00:16:39 -0700 (PDT)
Date: Sat, 24 Oct 2026 09:16:37 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pwm: atmel: Fix prescaler for periods of 2^32 clock
 cycles or more
Message-ID: <atxaqNeZdj_-gAKM@gmail.com>
References: <20261016161221.16553-1-kmehltretter@gmail.com>
 <atnHHaOwTkI78_tc@monoceros>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atnHHaOwTkI78_tc@monoceros>

Hi Uwe,

On Thu, Oct 22, 2026 at 10:29:42AM +0100, Uwe Kleine-König wrote:
> >  
> >  	if (shift > PWM_MAX_PRES) {
> >  		dev_err(pwmchip_parent(chip), "pres exceeds the maximum value\n");
> 
> just above this code snippet there is:
> 
> 	unsigned long long cycles = state->period;
> 
>         /* Calculate the period cycles and prescale value */
>         cycles *= clkrate;
>         do_div(cycles, NSEC_PER_SEC);
> 
> there is another overflow happening here if state->period * clkrate
> doesn't fit into an u64. A complete fix converts that to:
> 
> 	cycles = mul_u64_u64_div_u64(state->period, clkrate, NSEC_PER_SEC);
> 
> which prevents an overflow if clkrate ≤ NSEC_PER_SEC.
> The latter can be asserted by checking that at probe time after calling
> clk_rate_exclusive_get().
> 
> The options now are I apply your patch anyhow and the above can be
> addressed later, or you rework your patch to a complete fix. What is
> your preference?
> 

Good point. I took a look at this and will send an improved patch soon. 

Karl
