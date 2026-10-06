Received: from mail-wm2-f6.google.com (mail-wm2-f6.google.com [74.125.225.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF7649D5B0
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791306880; cv=none; b=bT5rVPROi2dh7r/a0VXtNJV0p5uC536qtcIXuKIBkMP0tmz/Wkd5s0f9pS4ofhBQxPjHrYs3AJzS7y1lxEwYuEb5DO/cPC1mQvMaCCKHt17fdLsyaiiWRp1kS2+zdlB+wIwoQh6fJtQLuFpxM+g9scT8WcJFnjQXkgypTHVXRtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791306880; c=relaxed/simple;
	bh=de0q0u9wOZaDN3BfzaDpLHztm5ogLHhnn6peJDNVgH4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gyZfUSM2cjjAyK3YeedS1ZVYMFbTzz51klRh7xBqjkDnZ6Sbpopl4/am8qMJ83BL2urA4Q0MALIZ4V2U3F+47VoWHpyHo3XQfJfdHYYZTFppybjurAs8aNm0ZzneZ4F0aihr7O+zfH/g9Y+c9/TPQ337jhZdUz+H8napHiZpp6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+QF0Jf0; arc=none smtp.client-ip=74.125.225.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+QF0Jf0"
Received: by mail-wm2-f6.google.com with SMTP id 5b1f17b1804b1-49fe4ca1052so6394995e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791306877; x=1791911677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=de0q0u9wOZaDN3BfzaDpLHztm5ogLHhnn6peJDNVgH4=;
        b=h+QF0Jf0Kj3zLougfbrd+KzperRO6tQxkHJjQJfVNQ0M7lYBrvrCCWknhSWmFdE/vl
         b5LWoM1o26fnByiWCr0uUoBFkzDLIZHD0EQcdQtn4egLyaMrHvwGyGbcUUbHyiaFmoG5
         cGPEcueBNvSTkQSF+xB1xBoSxv+dOHgoshjuG/6BgixQd6Biv9nC7rL9WSvt+GPfzNXp
         dhctWv+ImhhiPDXZtXwwuCmr2QUJCs0IGpPLqxxub8uquCXWm8AJ86KVvlaw9XP2+l1O
         lCgkJDbWzMedUVnXPykMYyeynMUF0dZisLvrpVEeFQyfUCFDgNnaVpJL+q0MzGrE2UHd
         i9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791306877; x=1791911677;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=de0q0u9wOZaDN3BfzaDpLHztm5ogLHhnn6peJDNVgH4=;
        b=Acei+IFAXoRVcWllpN/iS3QI5MWg1TaMn+09YqQbyg8f4+6RjskxrEm7P43Qxp2/0H
         8eb0LBaTV8/vJwpSdtjvvqfimHPvy+BSuu1ORU3el5Qzwcq8djspJElU2k2scl8uw/AA
         2ZCApaf6+RTB/fpv6xk7tRTSubozv9MX1yWou9lm9QBkfDS5M8aK3jjwkmZz9vsi+YmG
         O4Qy8pICd7IYIE+/wdKzv/kRjUh9kTKc+8CktckaUrd5riBBJLRjz9j0Xj6yBVG/HnAx
         m7Pvs8hE5iqIXZr/xIigSzyrImZz5khCnF9GqdELCFil6gkKnAZDwFv+opYkmdZy/ieq
         pKRw==
X-Forwarded-Encrypted: i=1; AKwUvByOOAinbWIpto6vfnCEltrwEE+LE0bIRK31UTSx8dDbN7TXjwye7MxzOpA6/pNOjQnmls9NDhyfFeY8cL4=@vger.kernel.org
X-Gm-Message-State: AFuF++k+dgp2/0x9rsEUPYwb4j761QYY+32RBL95rBvtCr8hprVKwFAu
	CLMTb1SZA24fEI6fErv7DUy/qjZsuHzsYJR0FSuNVTYXb3dW96FT1ZVZ
X-Gm-Gg: AYBFou1p8hfkEkZWuByR7Qj0iPh6cUUC93kJoOEfzmrkELbe0SdfOgclyw72d4qWAf8
	uD/Zmc2yewJV94c/Wtpgh+1Mo5Nj1HdBLNewDDfH6Qdu/RLDsbzmVjBApNG1EClz55xgYljSjAm
	SEDNk0XIIVzKLDo8puKyYKtfSaeok/nPSCDA0gjRdQMPwt214vm8VIdOLt+zu9wKZQfRylJxRAR
	qounIXFsxrZZXYbFUJhoKwm0/zvIFKC+vnFvmXTwh3lALZXyJnwyCEKgBZopH/qh88CibORnRlT
	M5bberuPmE4ihnP4MXMWpyLR47vmxkNyLUqDwYvc0u/tAd4SbGgdKX2QhmyCPH/et6YfzHQZaS8
	7A9Yj/Q7UNjqC6FPs2k5KJHlFnLT1EnApSTThGOh2gLYkjCw4WgGSEIwfKkmC0b8w9UyM9y4hKb
	pZPxZS+Dzhn3IEywYGwkEX583ZMqrThTyWPs/ZA9Np0s7Oyh5Bjd4gM/DOd1UiYwkNmIQLY3qlN
	y5JlOWCsG1R3iND
X-Received: by 2002:a05:600c:45d3:b0:4a0:2835:6fd3 with SMTP id 5b1f17b1804b1-4a17b547ac5mr34074015e9.17.1791306877406;
        Tue, 06 Oct 2026 10:14:37 -0700 (PDT)
Received: from [192.168.1.44] ([182.182.239.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f3f7sm636697f8f.32.2026.10.06.10.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 10:14:37 -0700 (PDT)
Message-ID: <84e9de99-8997-47f0-986d-910924c61d7f@gmail.com>
Date: Tue, 6 Oct 2026 22:14:32 +0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Shehryar Ahmad <shehryar.amd@gmail.com>
Subject: Re: [PING][RFC PATCH] iio: adis_buffer: fix buffer ordering for IIO
 core demultiplexing
To: jic23@kernel.org
Cc: Michael.Hennerich@analog.com, andy@kernel.org,
 antoniu.miclaus@analog.com, dlechner@baylibre.com, dragos.bogdan@analog.com,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux@analog.com,
 nuno.sa@analog.com, robert.budai@analog.com, shehryar.amd@gmail.com
References: <20260927185929.70635769@jic23-hlaptop>
Content-Language: en-US
In-Reply-To: <20260927185929.70635769@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

A gentle reminder, it's been more than a week since Jonathan's review.
Responses from library maintainers would be appreciated :)

Thanks
