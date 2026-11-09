Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212373;
	b=qOk0qlQPuVMy2Rcqh6TGomHWO6eljYzux/gL90+ZyEUKeyEZo4N5nchJxzKQpr0ox+jH
	 E7/Kuvn4Z7j700pOMY1A/berfCL+Aoqu6RASg6ysnvsOqeaEuly7TiEyR5PxmSHsZsh7s
	 +mYRPHk2ovkEolDTyyPf+gLsCueO11YKdDESqW7O6VyVRAzrwauwXya0wRAq8VKwInc4p
	 kHjiv5ab/5YK49uHSoymGmwyDWAtktKa5yhQ2aO32iuK7T6N4wL78qDie0fQCU7Y1peNR
	 23QJFe2E3zPHH19p8q0RWdOJddNxp8A+U0pC65wqsBnzgOduI7f/WpdeoEDF7Ja/TUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GNxYsHePFA72rBQ5eqylSPzfvf1h+1IxKFP0UMZoV3A=;
	b=SOKPCVfOSMvaK7LdxN/1MFyUMsbf8WbrDxvgw54W6JHPIVn5QC9sQ02E70MzyZeoz3T3
	 zKOeny7sfcyUPlrcRZrEq8c8tOv6S5zrGaEtxjUGGDZBbdO2on7Xbt8loEuGdA9Sw4YOt
	 qqEZJErdhPYQq/j8OG5OqShJR//6Imlsqq+DvcFDGKcDWrVhWW1oa5hScqLi4zyczVLXk
	 Uon7H7s3iuI9HamhsoFaP9lFSSVkrle3xaBzpFDQIMUU9NojPe115FchA8402jTH6nkz9
	 tM0AvkmCTDyQeClTfAvYyDY9m0CNkltbXGH+E/MHaW00HoIMXQ9cPuCT2q/OweGvPKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HnVBXWlP;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796DC606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 796DC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HnVBXWlP
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1067075eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794212371; x=1794817171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GNxYsHePFA72rBQ5eqylSPzfvf1h+1IxKFP0UMZoV3A=;
        b=HnVBXWlPvReTKYPPoSDUoZyz4QmqAxMwlfUfQZBW6dphuu2aUqTwcL+BhQ0ENYZ/tT
         BftDOXhkxQ+oGnp+wox+GyJaYEnkA3TQ4qzuNWYelFgeKWDoX9IDOZ9iYJJcBCP961QE
         Jf8vZl0MCQs9m11jTDCiV2XwMc8rWb9Fxzp1ODuvOX3JQwKt0sCrcBk8ml/P9dQBY520
         iqXy4JD+SOVc27Qso62i3CqkVcwTwo42vB1SPhB2yJUs2iFfZe7EYoN9yIiM/loSFY2J
         ajtcq6Wgn5tKKawfwsdbpl5BDRwMhugxY1K0Sj8BpcBKTxxvWQznY+EyousmkFr7QOnF
         eFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794212371; x=1794817171;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNxYsHePFA72rBQ5eqylSPzfvf1h+1IxKFP0UMZoV3A=;
        b=JVvtXltE1qmISc5/JuRGxTWXFq1vwHsqDPwWpizX4YwugrJMCMyabk3PURp9O+waES
         oqXrzvXjUBhyua2eU6ZQI88QuGyCiBEYjsraZfvdFhmalrCMvQ9XFvqRRLNiMA9rLzNS
         IjTSh+vIAt0BpysuSxYXM7Q3f+IVztzy/eQW9qd8xqZOQdBUPE3MsYGaRbLP7eeAp//f
         ul8XjlNytmQOZhF0FdRfg6AF2Ff2b2XSiK+b0ZTxHDZZjPXh9h3diLoWcaLQ0shnx+Mr
         s02Hp0Gqa6ACBoemrbGUAVGgs2Vs2mfFwrz41jW+TWjXTZz3H8oNk4EK4Q3FY5TBYArA
         cBYw==
X-Forwarded-Encrypted: i=1; AL+hErG0fk6eTLS6p2GR4CZoAXN/7ixGKLyaqLZb8jA3Cygvrdivnmlm6ehvQZmpd3ETITdg6ma3jth+2XnGL0I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+08x/lh0J5Xi3Fr/s3F+WAlxZ6SOxaOjqtYSqdaXKgveX0J8FO
	gcPRqHOaBk2fk8jec9ryAvZZs9wv2aqHl07vehMmvd1pw0N6pv1ReDoAPhZheQ==
X-Gm-Gg: AYBFou0lxE4d3oAqneQIkTmsaQydOYnVMj4hV0kcydPfJCMCI5Lf/BpO3UMZUrcgGkU
	tRPkgD2+QL7szY+pG8crT8oIU8hclBi2vaMz1w2xxGw22JPbbl0lqHMrgKpDRqmYCyV4bAmAt07
	fW4anOkk9WQ3nK8WVa7wwf79FFtS9Eb7GiwaRxcaAqwohnIsvqLTzuKsClA1gjYOk6q5Q+Zm+iw
	Ky5ERetVV/8vxzP988WOkb7Sdt00PLDEtL3hPhcrLD66Mg8n90cAxKtsrJk6z81xrUCl1saO+W3
	+nQtaBOtECmmABS73ch7WCQfak1Tp1zR+EjYoBXGh8Qd3Ply3cQ+NkqpIXhxXf903LshYl40cHz
	QTu0N2JmUFKffPwYRLkgqxI2MpwiIq93QpRtZ3Gqr67rLpZksKTVuCqESgZYkitFlNTbRYTSapX
	SfN/oQz8l15BEngDQwGuGKs/ucpY+X3llAsb5N54Y0p8Gz25vwqK76OZNtK7p5SKthNgF54vd0v
	oqBnUE8hRQxT6NP+OkpAAlmd5n1SR4l6fG7lwSaaBqLevGkz/n8zWP4ILJBQrCqVVOgFI87NtPo
	tswZ9gzQ1SobPXeQ4VO5udLyQAogOY2cgVUDVdHW6XJFK6ne4g7tFtKzH9JcpAG1Zccp
X-Received: by 2002:a05:693c:62cd:b0:369:ef63:ea95 with SMTP id 5a478bee46e88-372566143ecmr6512053eec.6.1794212371386;
        Mon, 09 Nov 2026 00:19:31 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265619774sm11812904eec.8.2026.11.09.00.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:19:30 -0800 (PST)
Date: Mon, 9 Nov 2026 00:19:27 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guanglei Zhu <zhugl3@xiaopeng.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	liuc63@xiaopeng.com
Subject: Re: [PATCH v2] Input: joydev - avoid an undefined shift in the
 legacy 0x read
Message-ID: <avGCAIRLN8QxPY2c@google.com>
References: <auorp8LgmW8Fr9tY@google.com>
 <20261104030708.791730-1-zhugl3@xiaopeng.com>
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
In-Reply-To: <20261104030708.791730-1-zhugl3@xiaopeng.com>

On Wed, Nov 04, 2026 at 11:07:08AM +0800, Guanglei Zhu wrote:
> The legacy 0.x read path shifts the axis values by the calibration
> constants that JS_SET_CAL installs:
> 
>         data.x = (joydev->abs[0] / 256 + 128) >> joydev->glue.JS_CORR.x;
>         data.y = (joydev->abs[1] / 256 + 128) >> joydev->glue.JS_CORR.y;
> 
> JS_CORR is copied straight from userspace as three s32 values and
> never validated, so the shift count can be negative or wider than
> the type, which is undefined behavior: the shift compiles to
> whatever the architecture does with an out-of-range count, and the
> compiler is free to assume it cannot happen.
> 
> Clamp the shift count to the width of the shifted value.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Guanglei Zhu <zhugl3@xiaopeng.com>

Applied, thank you.

-- 
Dmitry
