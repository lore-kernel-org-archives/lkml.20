Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219442;
	b=VtJLolQP58dmu+oKKC+DbIyJ6Gl0Uq8/I8wl0uTnCssi0KcETUIryLoAm+9p/tUnrnyL
	 LcNvnejXyFaSMy9izlcBPA+GiClqGqioaiAL9kacv4+MaGE/R7LIiQKSWOIJtt1Kh58Uv
	 1kOxUhM8wkF7X1yDCY07A1sm1zyLOQ9s5kp7xUSC//t7UTua+yIzv4g4qWxgnGyUyqFXk
	 jW/MW+VJd7t18ueApvawQEWBmSlSlWXz2UBWbEJDNdX8IeErcmTaV88EB1TVUAOjM6Shm
	 lZWYHCQU8d7izAwCZy7/2JJvoM+0HGXmle7FBVEm32n4jcaH8bqX1HrqFSJl4NbNt+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SagG7hnlNkBMWrHHVXZ8fa/+eusWUEksklF+xlNh03I=;
	b=rM5QPl+jIXMi7WZbm7sQUhnivqsE+WUCkfbeVogVaQK9uCJpCM+ti9g5hLMCodeQlEqa
	 N2ucKjCdHNIf5ucJQp3Pz0ptqNhcFDfvDSUluT4bdwrc7mX7L2MBje8Hx4de3EyfwZh4b
	 n6dXgJn72kcI2uWac5xQmYKGgeI3XGvko4rAQYIhoYnKipurBaTdj/4lkI7IISdFwnNDU
	 RSzFbu6s36gYLvI+g1PyQcNCddA7+rs+Byu0hyIM/sJjkGPZ6vm4P1UDHcbqdKcdIOA/Q
	 EUNLwfyrRPiUwd5QWuGVFzkj9/OcxI2e5gztQAYNkgWMURi0ec+QPllbiLAhq92zeVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zEnI3XgK;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A933606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A933606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zEnI3XgK
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-84abe8ecec8so475994a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793219440; x=1793824240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SagG7hnlNkBMWrHHVXZ8fa/+eusWUEksklF+xlNh03I=;
        b=zEnI3XgKSmZ7ym4TvvdVW/FQ4Ns6YM20ButMPZOOPcWn4yf/bd4BVlqaZt5xLJHWTi
         8wdCpR/vggun8Hj7TcbCDjA/SIVNnS7xHYJkJKb4l5IvXUuJhEDcrNyCfiFr7V60qQSI
         S1s6Sz1p/tB1dD7fuwPtLRznfar0fCvCEsCdQv/IVrcjK3ezFILmTYmUiETTnxGd9q+g
         d0Dx8Dx6RMRj6AWZ/h1FqlExVz8PRMqtiVVTJQX1T0QgobO4D6vgT4A7Tvn94Gh/AQpS
         e/qzIq/DMuc9ph9k2dmcJ0YVOHNBi9dqOmepSUnaBmWxVKV1qxxC3zNpFjWq1Tj0ve57
         1GXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793219440; x=1793824240;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SagG7hnlNkBMWrHHVXZ8fa/+eusWUEksklF+xlNh03I=;
        b=CcpxDeNc+qyviDq+KXOVcQfoF8jymDINem53N7hT6KbjystNI1MG0nMrV9jVyEFQtq
         gLOFl9UIcDqXNHu6PKpk4+/cV1Nkg6VwNqyT9nFi2CMDyncBSm5N92MXBjd7QUmNtQZt
         //d6QZ51zXsijE6cszIkOL/7S75cDYF4oyqqTEoib66pBEg7XyMAGpvvk+rtYIGVB//t
         kefwK2TjuYuR1amMCSCTHk9+J7ZsF5hs5xabj9JqFfzYKWrWRQd1E04IQcwzJXcFaqs3
         XfHS2nx0Ub5UMs/ZUYrACM/r2QEJ1q1uEdwXEa/QjlMys/2hA14yD1UH8FXeU1mDqHwq
         V2lQ==
X-Forwarded-Encrypted: i=1; AKwUvByVJ4UPqigUOz2gGL/Twecyqyc/7fVzkz3WUH6iNY0cVRTmAQDZiR86MWrWaS9OK+lZkO7Ykmvtmo8B1jU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDT3ebw/vn5ejJFK0PZy7QV3oJrkyFb9FeB/4KoQ5IpGmcxnQ2
	PsAKMxLY4Ncntd986Vy5xqrt4/6owLSkLR9XQmVwszHweZ2WdGjSgZH+
X-Gm-Gg: AYBFou2fTl2za5A7ukEPVlE1yVgM1m/h9Cv5y3eeIrBEeOFX6sFobEfXa+EioJrdsnC
	+QbbfwcwS/2vONyZ5fIpVTV5yxTqsgqW9PfGsAm9t9U5XHdXRxdghXEC5Q8pRzbWYYsHvpot/kc
	n1h7h/S7V6Cu587000R6kkNlE7OFeg1+JeIXPLUZnLA/3RBsaKCluil+oXVAnbMuAuzKwEEirB9
	PIJY/taJre8W4g/OM3n+AlWpJ9UOJQTZmZsafPnTQugSNZy2Q8jBnTdFpGmbOlfpbLHT0q0l2kv
	XBe3r+0FYAIjg5rI3XyCO5Xm2wTbfv0Kn4lvf3jIE+g1DaJ9jy5C0XjY+gBpE89usNBKnMS+7dJ
	C4QBdcHEcG8QKfNu6/dCw3V7+7z2duls3Jbe61WKEXwJ3kUP44FtcksbA+h+edm7UAQKI3/ngKl
	j1NvYuXGlDxfJ7VsKJgH5QW4cgAKlMys2q74hZIaykSAsN2anKQbx1RNqzbCwTNM0HrVLjKD9kH
	TUTNmXvmBy7WnBRamdaa2mMSZ1M1X79u4cIrq1F5ldgx4m1SeOAxYJs9lMJaVx2e6uwJDp6MuAW
	7Yi673Ua6UyGpc5umQBiu9lR6ime7lYZriMAXr0oV+QisjFx/6c7++l69K5rn++WJMM4pRAb79e
	b5hKVObJde28vGMp3YWNW9K8QmGXf5GgZ8Y1ZWVR4ww==
X-Received: by 2002:a05:6830:680f:b0:81c:a8c5:633c with SMTP id 46e09a7af769-85ab7b0d6b0mr3330153a34.17.1793219440535;
        Wed, 28 Oct 2026 13:30:40 -0700 (PDT)
Received: from [10.10.121.179] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1d363390sm2618813a34.1.2026.10.28.13.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 13:30:39 -0700 (PDT)
Message-ID: <7981f7c6-c949-42e6-ad53-15e6530588cb@gmail.com>
Date: Wed, 28 Oct 2026 15:30:38 -0500
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
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Use a raw spinlock for the
 pinctrl regmap
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Clark Williams
 <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, mfd@lists.linux.dev
References: <20260929-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-v1-1-db92943f42cb@gmail.com>
 <20260930080609.dnK1-Uta@linutronix.de>
 <CAGXv+5FssQL3Go3VDFbLAT6HP12RS3U3OgxhYOeapzs64QTdUw@mail.gmail.com>
 <d3d3e7b3-eb8b-456d-9a2c-116334e86c14@gmail.com>
 <20261020073236.dDVmd3BW@linutronix.de>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261020073236.dDVmd3BW@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/20/26 2:32 AM, Sebastian Andrzej Siewior wrote:
> bulk writes could be a concern. The 40us delay is within the lock
> acquired? If so, could this be done without the lock? I assume this is
> part of the init sequence so nothing should use the HW so the writes
> should not be interrupted by other writes to the device.

Yes, it's under the lock. regmap_multi_reg_write() holds the regmap lock 
for the whole sequence, and since an MMIO syscon's regmap can't sleep, 
the delays are udelay()s. The PLL's enable runs that sequence (13 
writes, 40 us of delays) whenever the PLL goes from off to on, retrying 
up to 10 times until it locks.

In practice it's init-time, though. The G12A USB3/PCIe PHY takes the PLL 
with devm_clk_get_enabled() at probe and keeps it on, so it runs only 
once. Nothing else writes the PLL then, but the lock is the HHI 
syscon's, so on RT the other clocks in that block would wait it out. 
Running it without the lock would mean changing how the meson PLL code 
writes its init sequence, which I wouldn't want to take on in a pinctrl 
fix (unless that were preferred).

> So it would be safe for now…
Yes, that's the trade-off with the second option, which relies on the 
DIN never being written in a multi-step sequence. Nothing enforces that 
though.

I'd like to send a v2 after -rc1, but I don't know the best option for 
the fix. Still waiting on Lee, Arnd, and Mark to pitch in if they have a 
preference, or any option I've missed.

Best regards,
Ryan Brue
