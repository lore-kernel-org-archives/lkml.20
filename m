Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E55D39A04F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 06:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789281323; cv=pass; b=o0/x0SMoIuvhm2pcT16/bwzp5wcnaphpN/YRtCUGFI2vgGyTbdInL9Tw19sWbVrT4DSIP19V1I+F56VpvBfPWKATUggxypvk3cFNvAPneePW11/Cr/9H+DkdI8w/HcwklkHzmxb4aozl6/i8gMRQ5T/y9ItNSp3Q5gpsrNHDrqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789281323; c=relaxed/simple;
	bh=n7FGhT2+o7Xrk+D/cneTINKrUbSlpf57QV6aXXmMNkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pNOROFxGUS4rCCOIZS91A6fqindA2fmy+i58nbgRrzBcr4GjYiojpMEisBZuFtJK6kwfklJYhlLjAjTp2Ik36K1zI8m6bjsuZZiz1nJxiqD3SepS7WngnCDiOvyEU4TVysZF4YdV04huBQ0C8MzwWLDu5q+2OVX7rJoWxZ9+hzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmarqOT3; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmarqOT3"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4bf948737e1so877579b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 23:35:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789281321; cv=none;
        d=google.com; s=arc-20260327;
        b=f2rlBFXWf5jlawx7MKdVxB8UBC3PfigdqQLcoTD0mvdtCzetlrvysxI1VGmi6vha0/
         ZMkEN55B7/3XUhi+Sn+yR5ErYZ1sKA2jB6otUrUPsX96G3HNLJ9wBR4d1lpVSToOLy8p
         Xdqq+CK4rmSIp1hseeMV0FPIdAEBaCcOpX7OyuVWrfljzFIdeVFFltXNhlE6G8GW8iTZ
         5H7ibvPeK55nlh2LLmHlnyCKMW9WHtsMuCw+qq0Svlx8RqdPM9AE3Gn0FIHFui4wBqiT
         zaE6BMPN3yx/h5nHanytomPCRzLk+tdXYrEshYrYleMPw0wIzvohD2mcYuuD9jARJMvS
         /TnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n7FGhT2+o7Xrk+D/cneTINKrUbSlpf57QV6aXXmMNkw=;
        fh=6L1ghEg1TrDwaH4zQ/KNV2E1i3EQQvH5Iljvc7qo0Zo=;
        b=gjVzdCe6Ml6Y/TYb8iuAmxaWGcEi2gSgzyLnhYRW6s/Af4yaa5r49ryOKsDSqBW0+6
         tLhuA7y7M1sp7tPr6oo6gjKsL/EFkULoetnw39wH+p56Sg4GBUgfB7jxMC9YqlIFSVw8
         DydbH1TYMR9jUkRTgOCLhy4dyd/HDnm2rBY7tirczcPZzjnW2iNy2KHA+pigqK73QHfL
         fh/ozPCILo4R9MqbvqsYZbVap+mRFQ/vAH8BEAB6QYg4A+N1ydy45HkvakpT9fCbzTAk
         gyXM+EXkOQmdeuLDK/HzTAgCKTFdWvWgqVm6nCSd2hPFr9aoO6dMk3QCJaYpnOb1v+bw
         EPBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789281321; x=1789886121; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n7FGhT2+o7Xrk+D/cneTINKrUbSlpf57QV6aXXmMNkw=;
        b=CmarqOT32hcAviUApD45sw3LkbLll7+t443u0S2cnYv9Sn+BDPmhGmI5FKV+FeiPwj
         WzPncDYwLfMhyhnJayX24ZXAtvsTAmPBpppPhooscd7Fenze2/d21XquZ5I6HS5aO273
         hYOta6vOcAYmW+qJBTwF7KsoseQhd4LfCduJTOOYAIpObUwrJ6ABfgo9w+ROlNgjZAZP
         c9aiDZhxeAe2uapFJ+4G2drftKcShnJVfXNwd85hb2k1oPqB9JXEKYHB3S6R+XXp/WZ0
         +Gzc+dlp9RCjS3yjcWE4ffN8AzJTQIKJNYIC4ewCA1x0wEKn1WhuB1Isa6J+6UWcaacu
         CEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789281321; x=1789886121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n7FGhT2+o7Xrk+D/cneTINKrUbSlpf57QV6aXXmMNkw=;
        b=dpYw8uY4iIlBpJffWjSMj+PDowEkvw0VZ0nM2ql1lpvyUGZALbZOEijVpNeQL3wi+O
         W8ffZcTuprqBAJM/xUOTtamwj1Sc6lXC1nVuTWlj2dcHAnaX41IqGaKy14q0AFyjqYZZ
         3HozRr9iLU0NJhYF0x4/Dd6svpuTAIrmxb8kwaWXXpned5exsqlIKIGyd12BmnztzA3I
         o3oJ/FqaM2p+TrrIcQTWMGQzdJIgzfNwarY5qt8ua3zxWX91B+jjPJpcuCZdbfCgtLFD
         Hsvhz2ubV00EyPuh6AoaP6Lx5EQKJl7U3Wyq0WvIqNStU/uhfth6SEIHhXKTt6kOC69x
         Zjjg==
X-Forwarded-Encrypted: i=1; AKwUvBx/EvqYgzps/JTGne/Y/fhqJllMnEwr4dP5MMA0FKJyna+YfQSXqbhhtOcZ9bR1wog7hPwGV4Fj3E8Rp7c=@vger.kernel.org
X-Gm-Message-State: AFuF++kCiwtusdNmGkDdZ8uZnlONMW+Z+rWbS1Km6I+URghyPN+/veEj
	KWGmLRuPbBZWfoG7GNjeaPl7pqvkaLsevS2uTTHIxjO2oqKpve1Z3u4xgLdzUi0zEGB/He8txrq
	0jAJICo3VPPHhw7l0i+FAPNIhEYuQDzD1qSvL
X-Gm-Gg: AYBFou183OfOhZfdN322o1UUQkQpCVCeAYlmkygML6oUTTgOZuvLqMQsi0gsiBct6Gn
	jjn/B5RTcWvsNYls8WxA4AK94Iygrrs6oDfTCSPz4CapVrhDMwIp6wf/9rmZ8ncsEcaa/eYiviK
	dqBb/u2fDmXtRNRCQQyeIAe/bLy/i+fBh29G9OnWd5uKBcRZv9H8ZCbOH+P+Q+S84WQZfxYZm6+
	tlJsLFvkg3W7gT4bQUr0gHIl66LoTQPPXs9iAWkbcmtlyCNG+WLtJ9pQn6XOlzVAvMXFdm939v2
	3iJ4MpglGIsfum98Ryo1XOKtPA6DI0eF4zR5dxXMJsFWKzfyxQtMD4/js8TtlW97
X-Received: by 2002:a05:6808:6905:b0:4a3:fb6c:9adf with SMTP id
 5614622812f47-4c31b6d0361mr15432882b6e.12.1789281321263; Sat, 12 Sep 2026
 23:35:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912132517.55686-1-abdelnasserhussein11@gmail.com>
 <20260912132517.55686-4-abdelnasserhussein11@gmail.com> <20260913035957.7eb0dd2b@jic23-hlaptop>
In-Reply-To: <20260913035957.7eb0dd2b@jic23-hlaptop>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Sun, 13 Sep 2026 09:35:09 +0300
X-Gm-Features: AcwNN1Xi4im8pLXxHZZUbsbRPvsDuBfyr0AO2io4vttPAiQIYAfumvbhkH4AsOw
Message-ID: <CANpqX3YXXO=-=DZgbc1NG2jsSyQwnpYwHzvDrEV6zHK7Y6iz0g@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] staging: iio: adc: ad7816: Use DMA-safe buffer for
 SPI read
To: Jonathan Cameron <jic23@kernel.org>
Cc: gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, joshua.crofts1@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

Thank you so much for taking the time to review my patch and for your
detailed explanation. I truly appreciate it.

Your explanation makes perfect sense. I now understand that the real
issue is cacheline sharing, and why adding a dedicated buffer to the
struct is an overkill for a simple 2-byte read. I also looked into
spi_write_then_read() and saw how it safely handles the transfer by
allocating a bounce buffer under the hood.

I will drop the custom buffer and use spi_write_then_read() as you
guided me in the upcoming v7.

Thank you again for your patience and invaluable mentorship. It really
means a lot to me.

Best regards,
Abdelnasser
