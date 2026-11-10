Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318015;
	b=xrxwE8WNEHQ233E3wYV3bS42idZ7An5QR/dVN2X7sMPLNdpxB3T5X5Wncpi+mjNfYPxE
	 wtduQE5doqQTxn2yyftfixp1ZgI34ReLsdHDm0q8Z7ozwot0rAR8gIGx59qQ2Q/xoRkdb
	 IFlLIQNR7qdtyEmGVc6y4jtIgHnQ6Nr6ZlOEM+ncQrf6+kSd/7pwRAgug2W5Ny4YH/WMQ
	 VYESUSBGGkS5Ax/LYjciFqwJbEI8TcmgFrKtNDN/KfjjooH6hV7PRPdesKnu5cLA+YIXg
	 9/b29zafxEfmmcSZNq8jEk800eVTgfygx6XRUoqeEcA6ZqIQQKeCH4NPi8bDctmtbXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318015;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=3c2WpukRa6d5qbdvXnuRxcTvhXaqbpkaY6h5ED2Zn2k=;
	b=zEAxiTho7B3fkVSjku80OVnUsrlkRZWvfAdByi2+sIxFUqoQnipmM8iEc8Svo7oKTThS
	 WBKQ4UxPZeqnd0qtKLzQGbX/tUTxMZUKZPHUzaZj5elWCNXfQ3eOXN2OhgrUdqyfXs+sM
	 vdC05kS0K3wl1TwbJQn/xHey50kLTBZCigprh0CNykWw4SAErrA05UjK8UtlPS9J5Arj1
	 HKF3hWvke8M2glNleB5mXe8fCeJaSxa7DwVbVk/RW9aH7QYYnnQ+K0MiJ5m3vjOLs5uWh
	 2d5ZVSl4CZqeXhJRyaX5dPLdVzTJLo+/MBlhhzGPmfTCBupv060RJpU+8AGcA72xXgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F9E60A2622
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F9E60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4919a880834so1260953f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:40:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318014; x=1794922814;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3c2WpukRa6d5qbdvXnuRxcTvhXaqbpkaY6h5ED2Zn2k=;
        b=qkV2/KfKc77acyQKayVdj28DOMqF04IghZokAH9RLIzgZTQv2UjMEiVICB9oEVbtUT
         jZdks0IW/bskK+60ncKqG7aR3aLzslqMgDk3qQrunbPItfaQV2OMuZup9t7miU0wW2/1
         Xi844hUra4gvC8t3cimrUO6NE0gnjzc4RX1Vr51vBkdmrPvE6uPs2bXaz75WDfd3rw1z
         hlxOGgzoFvRHkwpA0YPlmi9kPIMq5A9iAz3wDm0AUnZftE0aZS1o5IICHh43hsPD79QD
         ZlEenIC/AVGcdJJ3M7hMDyAeEas4QoOA20Eg5UGVLysFrtlQkg0HxAKGQMvFegPlFzt/
         S+PA==
X-Forwarded-Encrypted: i=1; AL+hErHpbzQA9IYb4oNqBCPlTeBJPRzzYDTqyoCq7BTwBhdh9835h6Y1gpvY5XNL/2wrNvVRywUuLqPHobkpdOI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ISrscj/wWJ9fenV3+vzTemBQUVRqINLNHmVdSfbYKgPYtj9NN
	XqmfyZfGR/5pxCartUBLOMFlTXhPu0Lz8hllE4KmncbhBb1KWKeHo7rd
X-Gm-Gg: AYBFou0Uqf9bkZcGMltZoIaYAI+D+YYcMexmiTWNDsn+cdZWgkSqyg+Pa6QU6xXRUjj
	6yOGspJz68LU40uCo4C5PXgVUnyT3U5G6bTOaUCk1HrSa7TV30D/qCWZTsZqm0h7FM6Ryqxuv1R
	qS3A/x2DzFz2SRd5ci/3aEXEniWEhk4slLs+eclCuwjUDl7Pl43VINPyV+WkI30qtTdGLmd0R5w
	kgnsDrwXhSqY+s6hNoVd6LgpISAFFdWsxhI8VLymr5oQq7MU6hvxf9LuxQZg4DL+9M/Esl0GPAd
	F8O3eAzG3QIIwWRT5PAqe+85kw4Egpw2VgaA1ZiiuLvikFVq0Ipnneu8WrC7bp1mqJ2PGxpPwuB
	nLLiQRg14LYlS5jYCFyQ14mMdZzlt6qmq9H/kOeljzCsOE27flzg8Dlg8r7XIKpstKSrP5InBps
	XAIG+7nT62y9kkLEzSrKzQuhC0m1l/LIGWBW2SlBbTk6iGvV1Q8efJN0OrB05ezRS9aHqYO1y5P
	Y8xD1H92755wqD2kbw9uWlL8GoHf2KCZ86u+affQZzZhYiRH/sAGQy2IqOhacqL44ywhy8vPv5B
	/xEiE1VhE4nHl1c8hab2xxeWqJgSyXcbhOUwycS82MPL2rK7rFKMdtyOSGTt45Brbo6wPY3gmFd
	AguqTL/HlerHwBCKG2lACJXisQUV4qEecsmLq47Gx5TvLAc2+4D+8MvrDhXMjZkuX
X-Received: by 2002:a5d:584f:0:b0:488:823d:5086 with SMTP id ffacd0b85a97d-49827fd20ffmr5377884f8f.0.1794318013331;
        Tue, 10 Nov 2026 05:40:13 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498362eb158sm5074218f8f.36.2026.11.10.05.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:40:12 -0800 (PST)
Date: Tue, 10 Nov 2026 16:40:09 +0300
From: Dan Carpenter <dan@cryspen.com>
To: Kincses =?iso-8859-1?Q?Benj=E1min?= <kincses.benjamin2007@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix spelling in hmm_bo log
 messages
Message-ID: <avMeucyFU9r_nfP2@stanley.mountain>
References: <CAB9ndWsADtrZNFLafOoO7qAdgWncBbKbBkLVv4P8b6jyTwx4qw@mail.gmail.com>
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
In-Reply-To: <CAB9ndWsADtrZNFLafOoO7qAdgWncBbKbBkLVv4P8b6jyTwx4qw@mail.gmail.com>

On Tue, Nov 10, 2026 at 12:57:49PM +0100, Kincses Benjámin wrote:
> Three hmm_bo log messages misspell the past tense of 'bind'.
> Fix them to use 'bound', as listed in scripts/spelling.txt.
> Only string literals are changed; no functional change.
> 
> Signed-off-by: Benjamin Kincses <kincses.benjamin2007@gmail.com>
> ---

The patch is corrupted.  Read the first couple paragraphs of
Documentation/process/email-clients.rst

regards,
dan carpenter

