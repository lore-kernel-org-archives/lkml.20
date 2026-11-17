Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903946;
	b=G+Il/rYTxWFJyfBuU0+RKLKHTqKZKMDEVO5WcC8rLn9BqMrBWKAb6mq0Tz49XmwkbiXe
	 LLQyjXtg0ZahC/Rm/QzOvBYEw2YHs+4wwWvvYQpcVlnG8K0KZf++w8VL7lwsudwrubern
	 Y6+WNkmbglaq5f1Sgcbpatg+Clu47bpiihoKr17xzHd/tH/I/ZxNLVeYcay4K8vwylsPt
	 6y0LyycA0ER08J1unomj2QelTQkLPwE9oa/FB1/7bwjICctW3j+HPhXNd0Gh9tLGVlHl5
	 KhStExc/3e/P0Nd/6V6ySav6VR/bZvzPmOPnaM3IsO7rB7lxLj/h3ur+wLDoz7MhZWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903946;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=XGcxmoYfjlX92YHiOef8ZcG7B1FJUqi9YCrtia++R2Q=;
	b=DCw87vrB6q+H2m/jDF6TCCj5J3y9KFIAqKZobxWNktgIMRGprcNcGMl7rGKU8vLf6KA0
	 mYaNYU/sixse/6PJmQNNwJsOG3e65RczwezFTo3/4qnFQjqVXh3LAtl68jV4NQPqBwGs+
	 A8b33wfuhz0SlX/U+PZQGlcbgIzVePfPgDOy3qt53NYkmHySHi1vfi7Phvq40q0NFLXB1
	 Cd3HhP1RIHLE7ClcxIG6T319cku3cQScv0mg13sio/zDKbF7WIfhcp2/Cqwt0ap77OuAw
	 zX2PkfathMLjdAy4+kjjMnDENjO8nStP40iz4U4ZnWQG8P70mopuBZwIr+1/QYHN+2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC7E606A89A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CC7E606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso1883187a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:25:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903945; x=1795508745;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XGcxmoYfjlX92YHiOef8ZcG7B1FJUqi9YCrtia++R2Q=;
        b=a6Zi7ovhoNdPR198rWzWl62jQHUTIHfjAU7hf1wxvzFTVzXHcDUDHbuesD7/yRkflh
         TCDQg/SlKKrR+QlcTh41lWqnZ3PfyC3nq8VzMfr3NCtzqN5pWlWmamBglI9+hhDTFdD8
         31ET/dY2SJCpBQOb1hGoIbiWbmh2tqhJbYoe0f0zKJ8JlWSt8RWDwqInoEfqIjuO+xzq
         bgbPmoTJcNvQxjNowh6zbQfqd1Cy98JQQnwVDcXoBubtPTnxDES99lyUyq76x32PgZk/
         07PfGIUKvZCMQKa7yaMDoorqcX97x3G4iLoaihjT8T2WCKaVHyT/8PkD2lQUsdXPt8Qa
         uOEA==
X-Forwarded-Encrypted: i=1; AL+hErFj9Zuiy9xRhxKzt4jIssc1xRAiE89tR8sMqL4urCuPuFoXmDQX1Gs9ZVOqAx5LuJhcoJOcWCDIZqREkyU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IVvLmdigN+DjZnG41ODvCjVB1BAUU22RaE+6ALvep0OZtTguA
	KgGyBo0GzKE1A5nDHFV0SSYZYhrH7dZbvgntRM9X8I2lsTvVpv+eRg+9rJKEIj/D
X-Gm-Gg: AZFdTZfZ/8zYriCPs2rl9SfE/a/BzbVxo10DCYY9YTR2UYiMFyWaYXSkUq3SVatogYm
	4Ahc2pRJfH6YPnqtoZA4wjQHoD6A9LfKGzgGyjbDasW1aBwalfUteeBxDJYEpu98vaZD3nlf7gy
	957THj94Uazl+TH5XbWqsTVykW0jjVCvHmrw45YBISYIcgDmZ9UKWmlSh5gAwPIJZF7sJY1v2jZ
	dHYIbdFnGGyBO6uztwLsomPiex0i7SPdiYWkQovcdwtaAXEYDY0g9rdFjje1vCHiCyWoe7IzJh4
	kWm5FOs4EDxBjMdHqNmbONt5YlwJ1hzbH6M8ODCUXHPIj5EMwN3XHOh4msHAS0tL6ffMk0zIsz6
	dxw9VnyYcaV9ZZH+uCFLuh6b5xQccPq+s4EyBQyK0idmbEx1lXXhJ5ttdot7IU5wHUDWdJ8AdXT
	nUQ2VZlm8jJLcHWGgXZL86Jyu92ebAQzih/uq7ZVoy4U2k5a7LW/7ysuhaQtBtIlLk1WQUK6K2V
	mjKGWbrotUD12+UMQ8X7m96x9fJLg1OmqAmMBYM6Be5cRR2vex/eF1yuWlxLmWhV4VVE8neBzU9
	qCrL881FGEDEsuGyPFzeLCNDpdAHi2SHpJDIdAXJkzXIUBTbUUejWkIiXGITlexrub7waAOFp/3
	jwtWOMDIFyiVNmCxUe041n77/mmYT1TTHxQgbKJPk3szEVqXvzIHsvTCxWNPaLI6WCA==
X-Received: by 2002:a17:90b:4d0b:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3b1b0a48f95mr11863540a91.46.1794903945523;
        Tue, 17 Nov 2026 00:25:45 -0800 (PST)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com. [74.125.82.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abb786ecsm3023761a91.2.2026.11.17.00.25.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 00:25:44 -0800 (PST)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-380b40312e2so3045740eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:25:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHLoqgUuyc+3H2xE6P1unP8JOKCGs6DOKCUB+DtRmirAXaC9edyiATz/3lK/g9ua4c6EZRcDXpwwsZ+KwU=@vger.kernel.org
X-Received: by 2002:a05:693c:811a:b0:36e:9763:9268 with SMTP id
 5a478bee46e88-3796695b721mr12921261eec.26.1794903943562; Tue, 17 Nov 2026
 00:25:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
 <20261116-iio-ad5246-v1-4-ef6b7c06d4b0@telaak.dev> <avwNWJnsOQaZSWi8@ashevche-desk.local>
In-Reply-To: <avwNWJnsOQaZSWi8@ashevche-desk.local>
From: Joseph Telaak <joseph@telaak.dev>
Date: Tue, 17 Nov 2026 03:25:32 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6jC4S6ktOBGZ5us4FgJEep7QeFOP3zs6NgZyV=kTJzrw@mail.gmail.com>
X-Gm-Features: Aa3M54pGquVNkJTL3e8HLCz0b2WyudTbs-YMALBBjS-DCyuiUkBpa6nnBIohZys
Message-ID: <CAPY4CJ6jC4S6ktOBGZ5us4FgJEep7QeFOP3zs6NgZyV=kTJzrw@mail.gmail.com>
Subject: Re: [PATCH 4/5] iio: potentiometer: mcp4018: Turn on the vdd supply
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@analog.com, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 03:20, Andy Shevchenko wrote:
> + dev_printk.h // dev_err*()

Will add in v2.
