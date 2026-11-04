Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793836004;
	b=zNqgiicRIkEQj14p2mHZ9iOZEJa3NmUqCUOF19pUMTxV1xQVf6Tb0vd1CX7RRvpqZwHV
	 R3y4eBXB+9lKrZ5hRusucOOS+osHBjV2qAZ7Vh6s53nGv/da3MunoObNuxapX8xVxKPy4
	 1UpIqbt0zL7ZNGZfrtZA9UlCFNHVs7ug8zTbisBkHo5ZcJI+40n+R/iC0W/i0lKxmf39f
	 ilU4Pu9kOePT6GkChIyZj3L1xt/mvupEagmKkh9pFOyyU/GGR2Oj5HSlg3pxPMuv8IcAR
	 04aNo26pm6ZRZfGJriTKsjUc0vfa8x/vJeU6/m4QFyDl5u80TTM3QoETAN9X/c9GJ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793836004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rKToFDzUi6qhaHyBZmmLDL7zVXQz7iwmFV5QQTYo7qQ=;
	b=CccOTKol9A7mV6eu6Ar8zHl0KSbIFzW6JrLpVjybyoy58TZV/1joExywqcyJNfv6+JON
	 fihHh69cWhM8POJkSOgIwIdLjA/JlSgrp1kP4BGL/ylfq0O7QCMGRspnx4YRtBu9raSV9
	 WbTxpLrZ4GmrbVrrT1bxn54FbbwcI3uAn2ux4HB19N5f/bHiZYShWMcT/YMFu5lhgZphE
	 sLVsC7Fy5RV4LelosUViN1nAtCqip3HcZJ5vJDr5ZS4EHdgu1xYYgF8cjsMkA/CBwbjkg
	 GqHooSR25aAO5ERYrXeHlbm92gPxIDoImIZA0vkoJB1aU7RhHu/p8t5+1C9Ls/b/rcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v4qTVCCb;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19583606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19583606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v4qTVCCb
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36d6e342f98so1458527eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793836003; x=1794440803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rKToFDzUi6qhaHyBZmmLDL7zVXQz7iwmFV5QQTYo7qQ=;
        b=v4qTVCCb7VVhal+oXEIMin9L6U8kT6Yq4/927OR1/wzDyR0v3HuXZSR2FHrMyKaSX/
         ivFqQMctHdPU8OUU9Eu8c1vow2qmhP8IvkXOstT5ait5IWGPdcTK5G+YFV+HRl2/9BKS
         CWTSW7yjW3d/J9mRK4ps5gOToHcdSsfzXBjHHgTS33iOC8jJes4c+rW+6mVpjdhvUuUV
         xysT08LZGEYTQHR6X6wiROX+YZMmlnvq0EV65Irq5uyTRs0B34WY0FKNKPzaHyKkOPOz
         zcLR5TuJ52uS6UxKQW532KJPui7tjFGg3ilYtOkQuDwE4VNcEnOYQ5zfW3YdTNS85Tgo
         dwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793836003; x=1794440803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rKToFDzUi6qhaHyBZmmLDL7zVXQz7iwmFV5QQTYo7qQ=;
        b=m4wlRhsV+N69EBLSsNlGJYqycKXfgXk4hhNQHxGBzrHDyxbsb9Js+Aax+BAXiTjjsb
         Gu+ae/ZloUlCGPQU0dqx9kUYAA1GlZDghp7PFj5d82m6aTNLj9BovEGKGdH4GaUbYHKX
         Sta4x36R0bC3vX2dUiS5IHIAAvjao1RPXyojwlRJW3f7EMLxayvaBOsiDK9TDDDea/IR
         Q2BqCqVTDKBx4HDW3BmG3clrYWP83S2xIIfTCrlzFvEl6J0MXdqkozmrQ/AwPBV99dyy
         WSVqfKbP0UHU2JgexAm6THkkhRq7RZ2j0Xo2E69mtWwZY8PcRmYtUkkW1bGngNVNPV4w
         7K1w==
X-Forwarded-Encrypted: i=1; AKwUvBzzi8wXz5vcBNqkoTh/871J40jgB9pPzpHlFUwDJd3SBjijeFaJx7S7FuGUc14rdbMAYOsMolJAJniHnNQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x77EIM7JqE4fABpmcdfiP+lYgkkWNNrgN71ev9OxGC5w38Z6V
	m+1rcbGsnLhCIb/+cTzglAujoZVe6b+fgKLT/np7q4UkRelYeaIAflQf
X-Gm-Gg: AYBFou1OO3WksTelfjgB40vZrfg16MakT3psX2mnCDgFdhJxtGSKhhaKRheEqYcKTxc
	bhaqK95ay1g+/B2gMX/577LnZOsRKee3h+wB9mtU95jb/TrAjihKj6TiPAvbQKvGVmuo0bOgWrS
	OuMO1dlYtlZmP97Mm4Pnov5yy8HnTlpJ6Vh2beY7vR50ZajLD8tPrH2kk5cpkJgwbz2YMvhTFkh
	H+MM4NDfJ00oNsEIugRyQOqWTRoCcTEwytZYwtJuDLw/QSIeSiFPcvw+1osYjfpxixDFP97lPsd
	IM0i+Vh/r4kvh4Wc4QluMHNnzyiQLMUCMJ5sibzCOUUfTCQNHI/7xavHrgUkaYiCSKiO7BoQBwx
	SMO/5p8z5SLpUEQ0WwZBJQRvw5zSPCrElllV6ZIS3GH4KJhdQVdM9ak6Ic/V/LQPoQ6NQPs14V/
	sxPPIIC331SvYL3hI6OJfl9LM+jDs5JIYYoJqoQBMqNAVvNq+hkrd8JWOp5EGE46nAesOGTn3CB
	z3zgTtuppxwlD7cWb81I9BZ9g7wPjC0caLJk/Ik8+qfz7j4m1ktCmi7/zax2h7sqBkSb8gz8MF7
	4xijaf4lweEyRlGNwU5HeuJrVGdhV5/1+H21lDhtHnJqB2cjfzgYQl921uxcw7unYtPmKQ==
X-Received: by 2002:a05:7300:7a83:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-36a42362460mr24871452eec.10.1793836003085;
        Wed, 04 Nov 2026 15:46:43 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm9855784eec.9.2026.11.04.15.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 15:46:42 -0800 (PST)
Date: Wed, 4 Nov 2026 15:46:39 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guanglei Zhu <zhugl3@xiaopeng.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	liuc63@xiaopeng.com, stable@vger.kernel.org
Subject: Re: [PATCH] Input: db9 - enlarge the Saturn multitap packet buffer
Message-ID: <auvD3ISOJKoQv0cZ@google.com>
References: <20261103084135.426629-1-zhugl3@xiaopeng.com>
 <20261103084135.426629-4-zhugl3@xiaopeng.com>
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
In-Reply-To: <20261103084135.426629-4-zhugl3@xiaopeng.com>

On Tue, Nov 03, 2026 at 04:41:31PM +0800, Guanglei Zhu wrote:
> The Saturn multitap path fills the packet buffer block by block:
> 
> 	for (i = 0; i < 60; i += 10) {
> 		data[i] = db9_saturn_read_analog(port, type, powered);
> 		if (data[i] != 0xff)
> 			/* read each pad */
> 			for (j = 0; j < (data[i] & 0x0f); j++)
> 				data[i + j + 1] = db9_saturn_read_analog(port, type, powered);
> 	}
> 
> Each block is ten bytes apart, and the low nibble of the block
> header - taken from the device - allows up to fifteen more bytes,
> so the last block can write up to data[65]. The buffer, however,
> is sixty bytes, and the six bytes past it belong to the rest of
> the stack frame.
> 
> Give the buffer the size the protocol layout actually requires.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guanglei Zhu <zhugl3@xiaopeng.com>

Applied, thank you.

-- 
Dmitry
