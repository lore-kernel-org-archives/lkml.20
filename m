Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0707549380
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083423; cv=none; b=c0Pia5+NkqKHagUDD81XqOTG+G7NKaagDh1oSwFSbGAW0hXGTEktk2PrVqgnvqTTicn4ukf0dgMJw1PyNmEIk1pGFC77q/yfsUnxijQFEV1JB5IprYFIA+wkUo1HCHcQJF5XQSAt3l8077bHKIZv69LLKnLsjEjvzqjZbgMrWqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083423; c=relaxed/simple;
	bh=X9zenNw+XCGSaEDZAVjOiWo/XwBabKDlk1tZDil8in0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HSkJwNJVY3trsUkxVQAJZgyhsQYe8PH/nF1M9pyqZUj0rE0H/7o1LloitFBtsHDIKFU6VNnIVk5i0C/WL0LwYrZuagZM08PkMt+31wok9Qq1KXfztcGLbfYoBFY9EYlvB6k8iJ1BJj+dYOJ9v4EeDF/zWl/3R1gqU0JTnf6HVSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtl8UGqG; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtl8UGqG"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-47badeb3316so233078fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790083421; x=1790688221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSjtaqY01VER6NnV4YJkIYUPcx78Pm7qb+P4OC9/J/E=;
        b=mtl8UGqG435OUVGWlpa+gv92b+J5WlYUpoNiPU26RZXXjueMsUuLp0FvZ5MQWhZR9E
         GN2XXnqbu3fIhLQ19p22Y2i2jjdVz/eaJC78XT3F1YbQGYrA/XcrkvcyeSm2KvR7ihjt
         17rxZGA/W7+9vTam699SYJT22DLJMIqG9a00Sv4a0I8OitKR22VnTp5ZejEmpnMp4twJ
         LlejbT7mddPYhh1t9eIulCzOu5TbYOe/qbLRsXLmwalUhU6+Nm6xBxzdK0U8+4WTdzw6
         wBJNRpcHAC30a22Z+6PbNvpqB6TS/YmIgaMivahQ0oyXhmI4bSrSyug6FGw9AXlvnWgD
         wb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083421; x=1790688221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wSjtaqY01VER6NnV4YJkIYUPcx78Pm7qb+P4OC9/J/E=;
        b=0Pfnsj1UXL/mff2wgy5O75wpC28V2DEUZMe3pr6I2C4l1h9g1reeOSvoEmbq9DByTH
         smQkrHgyU6uvtsoWkQM48npSsr351aH42K4Lt3PfiZzDkH450kcoeRymXRdy08XeUpDt
         5eKmw1pHyuXSqqQhVl08Oqm+yQXlifJkm1MQ0uhJwde4mnI2p4fX8BcH5XmKVjJDH9XZ
         sgrx4NVAoJPE7af0HEA4B+PH5qslX6OJhJpocUiZ+IJttwy3GJxnSWyap3fL0C1VldYM
         hiZwpBnM9l7F4Iklk4474cpLHKOhbp5TM6soyAEoy/C2SUMTnjhM4lyT+DZULYQchj2t
         sfMA==
X-Forwarded-Encrypted: i=1; AKwUvBw3RFojo+ejpQs6Ixac4nMjmt+79vnfMeYMGGWvcFgw9O7BT9FPcmRhq8cJjUf7izQVSRtPlE6+iz1PbWo=@vger.kernel.org
X-Gm-Message-State: AFuF++nqSY6TAxJ8PWpivvhu3x0S+nA/LiHhoRLt7hTScFreg4F8jH/9
	2zGLBCXhjvf0qVgeBzWon07Q03EjvTfQGCvZ/3BJj3ohyqrN/6Cvqx5TItHvuQ==
X-Gm-Gg: AYBFou3hJX9+DXp048MUENCO/nMul/52hWgfhHeFqlCWQyoKZI9EFdaB50DoG1v0YmE
	WJdzELUDTXFzA1Mau9yA3H0/o4jL2CnBeHf8eNI2+hhiB1kQrktU5WqFWJDixFO9rfTuVyp1DwA
	xY/eo42tVgyNoARw63URt6aJbyodHTmJSWk0hhhQohrJbJ0Ceo5wXLFqpjEdlJbrlt7+p1EcysH
	OMWFsWSRZHLywaaYTQW5rbkgleHaDRPvGZt8UvTuy4R7SQBRxXoCSBsmxyQ10XRJkjkAaG/V6NJ
	qb3pWLYnRueih/hhc71LZ83e0C+YFcvcb4m2eKiqyCMeC3sbNf6UuEDEEu8FkV2tF/IHuugTFBA
	DTlxTukw9B6VKfRqK/OOEteXsLeu41ztf+byLOSkG1lyDw0f9dVtZDkCxUkdQwYr1iiEF7NY+1s
	NDTKjGGcPIj1c+P951ia1yIsgUVGLocPDY3DgB+lD6ht58n6oryOQXx1nJBp98kvdt13KiBBjSn
	VVxatM7kYoJF+lfMS1LXm4DN95iac4sulddkMJ4iALNJR6uNJfInjC4Mw756cEqo7c4LBu0nXQN
	9Q/3Ade59r9OOtZegw==
X-Received: by 2002:a05:6808:50a4:b0:4c0:c8ee:adb0 with SMTP id 5614622812f47-4cd39151e2dmr16722021b6e.0.1790083420568;
        Tue, 22 Sep 2026 06:23:40 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612ca566sm6697565eec.19.2026.09.22.06.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:23:40 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: size the RX FIFO threshold to the queued transfer
Date: Tue, 22 Sep 2026 18:53:34 +0530
Message-ID: <20260922132334.34682-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922122902.GE106095@black.igk.intel.com>
References: <20260919232647.448748-1-navonjohnlukose@gmail.com> <20260921120526.GV106095@black.igk.intel.com> <20260921170456.53354-1-navonjohnlukose@gmail.com> <20260922065041.GC106095@black.igk.intel.com> <20260922121238.46016-1-navonjohnlukose@gmail.com> <20260922122902.GE106095@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 22, 2026 at 02:29:02PM +0200, Mika Westerberg wrote:
> Yeah I don't think 0.7ms is much but we have things like touchscreens and
> the like with various report sizes so at least it would be good to check if
> those have any issues.
>
> Unfortunately I don't have any of such devices anymore but I asked our
> validation to check if they have something that could be used to test this.

I have a Goodix touchscreen on a second controller on the same machine, so
I ran it at three report sizes. GET_REPORT at 100 Hz, 2000 transfers per
cell, three interleaved passes, ~normal desktop use in the background:

    bytes   interrupts/report      mean latency
       7      4.17 ->  2.00     1776 -> 2093 us
      21     10.06 ->  2.00     2131 -> 2676 us
      64     63.97 ->  3.21     2303 -> 3512 us

64 bytes is past rx_fifo_depth on this part, so that is also the first
exercise of the half-FIFO cap.

So the latency is not a fixed 0.7 ms as I implied earlier, it grows with
the report size. Breaking down where it goes, with kprobes on i2c_dw_xfer
and i2c_dw_isr, for 64 bytes:

    segment                       stock   patched
    xfer start -> first ISR          78       146
    first ISR -> last ISR          2157      2748
    last ISR -> xfer return         101       147
    i2c-hid and ioctl overhead       12        49

84% of it is between the first and last interrupt. Stock's 65 interrupts
are 33 us apart, too close together for the CPU to idle deeply, so each
wakeup is cheap. Patched leaves 3 gaps of around 900 us, deep enough to
idle properly, and pays the exit latency on each one.

So the power saving and the added latency are the same effect seen from
either end. Lowering the cap trades one back for the other at roughly the
same rate, so if the latency needs bounding (I personally think it is
overkill) it wants a QoS request as Andy suggested.

I can send the raw data and the scripts if needed.

Assisted-by: LLM # for the kprobe measurements :)
