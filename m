Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793068378;
	b=iifky0XeVLHDrWORUV9hj2oJwi02uFO9QG5iYzea0z4RiWDfQSQZzSAPNihICnWj52/H
	 xQkBMkRpEfaCVcMYs3kJwuF5w1hTTRgt9faM7XuWeE1HovJ4z8tkOx+sVqJ2vL8Wbl6H9
	 0FmjKPeyRE/uigw+ZUuWIjynkNepYojeIvOhy5ye3zXEPKOn0sagjCVm6C0dPijFBho0y
	 jVOTDkDalcWH49FXFWoG9En/lrY6MV6B3XTdDrWk5GAEkh1Lv6fcy/fwJYMV9IckjnZdH
	 0AwhcvKpo54Vc3iQVypK5egVzDI0S3NqoMcDXKHX5r/04x5PkuAMHvnD7Do1+0gC9nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793068378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WlmAS3/2b/zwkyDjZK6fZ0f5Hqn5BoF9hu81Kcora6I=;
	b=XUU43ZwGB+zMZI0mC+kC9+qar9OhZYr3WH7P7UDZMhCzImLAIu3Ifq2QMwLbc/9iO/lZ
	 eO1wx3ECbgGSrrpNwGYsS1CvWifKCLycdAEqqtcFuI0AlxNhviDoMFVMCWoV+EwHbwMjK
	 BRTW2u+KObMBxKgJEgF9BGG50wIuu0VrYvidR900JoXUQGi1ZiCN76/ewNmv9/sYx3cyR
	 2ZWKjRzwm39dMy/4S19ZknFMa96Bq8ooVk27WrfABMyu++Xu1uDcRejKNw6IKAEVqRKWs
	 jCEWmGUExZqaMj7vUjzLBIiKu3nryWbvZf7fPhWkweds9bXc8pzl+Ri+oXjrGCsjGSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="V6w/7g38";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18391606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18391606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=V6w/7g38
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1846bc43c28so4062676c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793068376; x=1793673176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlmAS3/2b/zwkyDjZK6fZ0f5Hqn5BoF9hu81Kcora6I=;
        b=V6w/7g38m5BsENKK5sMkZ5XIWtJMyxWCywSxzJ0LMTXUITYy8n+ECwqOowHVNRUs20
         McrbIMNM3zYdr6erQ86IPnx88ygmhkfWLojyFgq/Gy5jgvHg2XABzDQztha0UgPt1VYK
         IZ9Gi90UxfRnqJuGGYmPR/Pm7Bp48Ms+zV/DQPHC3iYdphgOABdkXXsC4SnTu8es6CnR
         9/+r1ziIeqdDgvpjGv+BfDp55w0+pY8QMkA6LJnb33+KBzpBEvzHZMqk7y9QuULVPkBD
         o3qlLojB+Gs0Q0dTG1IQxv1EPILrPwH1G+0yJP6PamhxIvMowJTQo3ezbCwOXsq9KXtk
         0ZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793068376; x=1793673176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WlmAS3/2b/zwkyDjZK6fZ0f5Hqn5BoF9hu81Kcora6I=;
        b=AFBUH+9w9ay3dbcTK1y4OGqHAf+lTGp02Yrm1f4dmEtujlP5PeDfluvx2MImCkFoQP
         bduiqVur1or/KZLxVar3fuojyZHl9jF+oTeYwiVPpK2QQSgiitxbDhQpBcuHQ53ZC9FT
         vLnAN+zRgnbybhGelfW4bI3+eXrNnQhl4GYRr33N+VPrW2bPWNj8zlDLLzsKOnxBbd6G
         isTlTKd/VdnKDAnuiqwRFmaowpLQCSGHePPu7rk1neBlQnkJVjifH0fTnq2z1Vm7Ua8w
         CDTXMlh52o9GfmBd/ts38tJjK9pZy7+0MwJpbmNguPjrZa+LosSWiyXK7UKHFsuDLYof
         z+Qw==
X-Forwarded-Encrypted: i=1; AKwUvByguQs95FR/magOdu7F2PIx+qiHAU/PtbzxES4rKQIz6/AJJQmcZ/qgGPlcezxqUG+mu64t4nTjFABFy74=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOn+wzVnTHAaOFlhxc+XiO+DqSUav2HaoUk6McRTxgW12X4D2W
	gBVFVS1iytGbwtO9hntNblTgdRi1Ny22ZmPpabMRHdBHgH5kxvMq3oziKEOyLREaMUg=
X-Gm-Gg: AYBFou1Gxj/E7aWyVbB+7OfBThsRnVGAFk5NqiswmSGlV5dQg2rW89c9zsT8sqfYnIE
	TfPQZRi9pvvvt4s491DcMmo5quC84+vfjfPRXn+g/aef5Biw1ZSldQqTmfv8y9BtmJiDNOfkVMp
	itXmFTbWMxqCzh1rkBc71gzM3pKogDz4d6teOkqiyyLDPuYnsjf9jIrSu7NORLuZLQMJiK1l9lc
	8S8ieLi8PpH+7tXHI2k54baC37b63+enNwRxKHoMZE3wo9hVhjIoecB44M2/Uov/kB1mogk5mkS
	GZ+7HKLSkpVaseo7IVhLftAz6dLrFb6L/GvOymH7M7uKScUHZBQfWCE6lTNRSpJk2sxwPsMzGNU
	w2c14sWLOTP6/G7DJajx3CXYtymDljZMqhhyj/f/dhjtVG9lLqOlTaoADSqEhUVVkuXQ3FcmplX
	H6bXrZl6ZZAuM04/G1Khqxl0hEBDpDyYzcWzuPCc/ARbuGqoraynub5NnYDM3m9+kWFJR09Le/F
	T/nFjT97F+R+basOsAPCSakU/UAEHeUUPZqg77KX4GTI2+plvaQTsVlSUqwmrGdB0cfh5gpCa3K
	x1KTsR4BK2Cnoa7dqWUyyjKqK0dn2IN/cg/xh04=
X-Received: by 2002:a05:701b:21c3:b0:148:302e:1bed with SMTP id a92af1059eb24-199377d6199mr10284764c88.38.1793068375785;
        Mon, 26 Oct 2026 19:32:55 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a21bc6cbsm28324365c88.16.2026.10.26.19.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 19:32:55 -0700 (PDT)
Message-ID: <51d9c80e-1bfc-43e5-a195-46b4b7612de1@kernel.dk>
Date: Mon, 26 Oct 2026 20:32:54 -0600
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
Subject: Re: [PATCH] io_uring/napi: drop the single NAPI busy poll special
 case
To: Cinq Prairie <notprairie@gmail.com>
Cc: Stefan Roesch <shr@devkernel.io>, Jakub Kicinski <kuba@kernel.org>,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026231718.5092-1-notprairie@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261026231718.5092-1-notprairie@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/26/26 5:17 PM, Cinq Prairie wrote:
> I'm thinking that with the re-entry in place io_uring can cond_resched()
> when the napi loop bailed on a need_resched() then resume, between laps
> it holds nothing from the list and is in sleepable context. That would
> mirror the socket path. Though it also impacts the multi-NAPI path,
> which never yielded so far, so I'd like your preference: include it in
> v2, or keep v2 to the single-NAPI fix and send the yield as a follow-up?

Let's keep v2 the single-NAPI fix, and then you can do a follow-up
on top of that.

> I'll also add numbers for the single-NAPI fast path when it is not cut
> short, before/after, so the cost is visible.

Sounds good, thanks!

-- 
Jens Axboe

