Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793037552;
	b=2BqDReulvcgpcHZLDK0QNSsCsMgXF+AYdLqo2WDxerCR0wJwJLY6XBVPaXmW8oPUr/wo
	 /idEeCAv2IvhZlbQ9V5EujVWWtpjwGYciaDS0bl9AXI9NyvTzB5RjoN3PLWfiF2Y2ZeUG
	 kxAzzJLF4wdYwhGJtFmXr8gIiOo3mxoFa36JQm6Tti6J+yvjTHAKyq5iQl9PQwEHgpZqw
	 G3CpJlBvDzLbhXl1CW/CRSV4q4jEvW2ukvH0evA1/vtyDoBItezuzMj76k4WxS3jGGvbv
	 UALe7CrcXlcwYTQNGDUtAFaX8p+C9sdI9ygNU/A7ky2ilVs1OFqfXFzMR5wcFgOtgLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793037552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=F2ljx2alcBFTo6QIXmQ3PZr1A9yTe7fXLFSuwRXwTto=;
	b=2HcN/pmUF6SjsGF6H4I6bjlFqQV2r7zYcelH1P65Oq+j4QI83z/LzWF84XDfnA8GYTxC
	 4kqnHRKnFnnul3QSs0XJGc4glynFSf/OAxRIfus8qyzZ0jZ89+HpjARMs+oUoUkkQt/mp
	 VIfr0vE7ctV6BJ1vtyW4g+eSdWxhhSTcsBNx2Y1b58JWOu26d1fa1WIxK9YHErZfpF37P
	 nYGmLrCDMt3xfRp8TvW6WQ6xP/aUvCmWOOiE3Km7MT+hhW+1sfDo+Q7BjGP5ZeCMmr+4B
	 EkVQPxcyjrJYgf6x7Zz0t1ZroF61Q9riJfSGsC7XcYDIAjyqFiOTng3CPo3qZdlTKiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XPg83Srk;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCD8606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDCD8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XPg83Srk
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1931ff67a29so1420291c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793037551; x=1793642351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F2ljx2alcBFTo6QIXmQ3PZr1A9yTe7fXLFSuwRXwTto=;
        b=XPg83SrkdQHxiXw3yuZl1WwDqwjS/+7wNLUClFJaerBhuwBIdZ9u+y4krqfdH9ywCl
         R5a4pEVxDrJr0cfry368ztlZLV4egXfstqW9o0j9KwDhsQVKgGDmJHk0nB9uIQRMbSaJ
         WNuqog36pgJwHs680KLgimHuDP3YuFzGR3O9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793037551; x=1793642351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F2ljx2alcBFTo6QIXmQ3PZr1A9yTe7fXLFSuwRXwTto=;
        b=MNW+A49H9FltWVWHmQCg21j5v5EDQzYSvNEzAWH9xVdtVguKipLnyJFfru4adSohpF
         D+M8jdKLMJdllMEGf6txEe90NPL188Zc+rGbNAg0DszFBmNve0i12Xi3Ag54/VzWl4Ku
         LnxUq1xzReOxnk5a93hzzmtVwPtjyd4ChDodi2lv+gIi1Decafd4Sczr4GnZU8wA9iA0
         73CVHB9GZZnkGv9dhBKMgkZiwiQVF6aEGu5a2Nv8JGRVKCVYd+65i0ALW1fcutBbKWBh
         844mgvaffp2MtyV3sBzU3nVXaOncMCazkSvyT+2x1OypMYc/cTwjOS21FRJ2PT1DhFbF
         +q7w==
X-Forwarded-Encrypted: i=1; AKwUvByNaSmUdGO9U39sGk7jOPIC3Q0lowYVySxHxy87uYiOG6nZd9smJrO5oSbNouv47CuORXGuTtIvYiIRz1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbeLA/ey2n+BsstJI/8ityL5kd0qT16n0gCSWOS6kB+SRjGx/M
	lqT7R/9wp7zvE5uIi9JSUfxJaCCqL2N99vWmrloadyUOE9PUc4gmBLTW/eqeDGz5Gg==
X-Gm-Gg: AYBFou2VUBZFz27WJ4qo26nj5sxvT/W8kQa8XI8ayDG1P8ktZZvIJdxR4tsvOY6BGSC
	BPaWaXh3WBSYOX1EuFUsHiKPs+rzhOHL4LkTArpCZMyuF8pwIqhGC3UR7B5hXboiJnIuSWMIwPl
	gMQAXiDpuHcifKKZS0UymMLDxgiOM54rOL0p7KQITXk/vwtsDTuq/3WgQy6gum9khzlQ3QPePD3
	ubT8sgJgfbQT6Yx/9GLW6DThZGjFvfNXidYnswHtIU3uak1oUJNYuUZjjy8kKpn0a+geMa4Qegq
	dYXdbdcZbY73p0SaLQZCmilvUW87Hlm27N2kPOtlmhRXtRtZuiAFrJv427m0iVG3eTZLp1JFzPu
	hfzdwvi241iKVQhNLO+MpeJ+G9Quddv9A6Y6OCkqQSa2sRULfO5GHlq2BWs6NtDZMLllhEhU6KI
	Q5mtOFuaYnBgpsaUsIpQTDS8Z91kzT91ZI4JYOTAdkDhIInBhW2YCiBXqY/ZHbI+TqWkDrk2LTm
	UXnKPBpwjZ9o10bmygoVjh2yutMOC150a5dr8EB2LwFb496l4VZdErqgDb1t4JKIPcCimpPe6Yz
	T0Aa9ktjzjK0aOtxQw9MceQ+kwIZyg82+IC+gdaN
X-Received: by 2002:a05:7022:b058:10b0:19a:dc0e:c20f with SMTP id a92af1059eb24-19adc0ec4e1mr9832825c88.44.1793037550837;
        Mon, 26 Oct 2026 10:59:10 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:79c5:9cd3:db14:7468])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-198a0f83cedsm32565975c88.13.2026.10.26.10.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 10:59:10 -0700 (PDT)
Date: Mon, 26 Oct 2026 10:59:08 -0700
From: Brian Norris <briannorris@chromium.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 16/17] iio: light: tsl2583: Discard
 pm_runtime_put_autosuspend() return values
Message-ID: <at-U7LvkoiNAJ6YM@google.com>
References: <20261021235818.3059519-1-briannorris@chromium.org>
 <20261021165858.v2.16.Ic3775fd68cac415d959c0456c4d4c36e9e5b95e5@changeid>
 <20261026005504.7482bf26@jic23-hlaptop>
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
In-Reply-To: <20261026005504.7482bf26@jic23-hlaptop>

On Mon, Oct 26, 2026 at 12:55:04AM +0000, Jonathan Cameron wrote:
> Note I'm putting these on my testing branch which I'll rebase
> after rc1 is out and then they should show up in linux-next.

Thanks. I can't seem to find them on any 'testing' branch [1]. Just FYI,
in case you were intending to publish the intermediate result. If that's
intentionally a local branch, that's fine -- I'll check back in later.

I also see you're trying to partially rework/expand/add to some of them.
I'll try to review those, based on my local combination of my patches an
your patches.

Regards,
Brian

[1] In any of these:

$ git ls-remote -b git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git | grep testing | wc -l
9
