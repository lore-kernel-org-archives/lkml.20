Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1A334BA5B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384155; cv=none; b=Xr02gCVoDJJt1aE1GuTD3YD0lWRjFGgJ0EKE8Aa56kaXLuUSRxP6qrwH1otGOiDhZ44duP7kUiUmgAqEmD0ZZzb8nYGAtk549o5V+F3HPp7Cpm1v3uws8VxxetwdTA2V/ENyCgNZ822eGcNPtvJjHjyiO773FSWEdZUTDBd4P+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384155; c=relaxed/simple;
	bh=qTA2dRNcFqJDFhu+c25jioQ8GVeDgRltoT3IMjZhlwE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YP/HTcp4+aXXaou1YEExxFU382GPSzgbRtuhxu9udRl3FxNVD8yxrxyLiXjJAsbji7Xa/JvGFXmO7ehgNPj6eSpa3aK6wntEya5kf18ApDnE/7yi231qe7cjH+3tqU7TyYYR/81zoCgNkqVsSXDJheUikjXYlnfBhdpvIIq12iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDAaiBHp; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDAaiBHp"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874aso1503695f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789384152; x=1789988952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6jTR68vGZLrU0MBAPrI+UYgQ9UIwPjEd7uTlsDfLE3Y=;
        b=aDAaiBHpfiOwRhbGvm6I4oBCXY7UKTcH1L94nG5KgnDJuCvSHzyKBFmkFo39YQCMbO
         IohECtbFFe4QWFAa3ISsslKRE9RNAewqYMlvsr/T7e/0c3TppdoXCIZmXvD3R8mbjvk6
         eAyGNcvmMkXVexZ1RcDK78AHY8wHKhxf85ZSw55soMqEJRGWj3yamBO8lG8/ZU33uNnL
         TpHhBljriCFumVsbqEg7cx2DvLeIDFOYde3vWXzBMhus21go9D3JgnKS9hUEz5rrzh64
         sg4RwUbWEnuQkymzC6gHu1q+Pzs9YzG9lgX3u5XCIshQrzSLhDwdImA9AiO7sfBRsRIL
         3bwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384152; x=1789988952;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6jTR68vGZLrU0MBAPrI+UYgQ9UIwPjEd7uTlsDfLE3Y=;
        b=A2ecOQwnQOrfvNLg9wyRHycI2ut9ce3QSwnea63xbVGACvS5Qum8q3ccjw5d7BDkRA
         u8KdE1FjqDfW7TblFKpJlpa8kCj2quUB9WZh/onhA+hvTGPwj7d93FmLf96KvozLA70U
         QW/nERN4LVfrQ0sJdIUeQFVSjVLvZFH6dW3ef9QHduHd4YF4lC1W1kQXvRkSVei+2L59
         t57ttnN1TXxiR/JkGxsQYKvR+kUXMcfHJPR8sLZ1uht3nEwZW3lL/XcH+FT4CLHJOQ3H
         C1CQoe3vcPqBGOF2l66PrMS8dVAT7KTQSFTld7xA4/WTFczpMIrL7lc2ApwDuOuMnnhk
         qa4Q==
X-Forwarded-Encrypted: i=1; AKwUvBz2A2HszwQdZX4ervvErOIcQ9QJeJHTr/Szq5WKqP3fMy/Bu9BUXMMyaT5TC/DLE/aetxBAz6IkWn4vl0s=@vger.kernel.org
X-Gm-Message-State: AFuF++l3oeeykQYmMdMacE7VG/xi44arPYrKjbDr0aP20HqeAHWtFNGr
	rxD+8ARiRRPVVHI9bCeVgVIBs07UwT4EECNGkjerystZL2Ndvso5W3oX
X-Gm-Gg: AYBFou0BGYnQrEK94dNKo1+0mQcYeQUdWUnj94p/AVp6J2XTTGt2JoX3UKacfGBR2/G
	RQJp8/FixShYOUMq4czqaHi7k2uZ42peVgmY0o72fNSjb78QNodusc5EGXMWuQEWNBVbBl8b3UW
	a5bTDhV4DVazxIvnSK8tMHExnDu+BisKyCs3zSDidnCxjRLVxpfR7whEwaUVwDsWkBwvgxtFhvp
	TK/0cq52KKa6J2stNLCyEZn3b3OOLFrWXpo/YrfXZJhAw13NkM2Iup9dA2vWCxRPCczlKSoMSEP
	dXk1pNogGjoMqF5mYlM0pkXD5wmkh0IzlYoU4g06dWO6n+LrU6m18IXGgQZqqhFTad+Qoa3FKaB
	s4FNq2xyfsU5+M1d8M/a3ojC8CWE8NtuU7lq46bBz3MFtCo1my1SX7fzzfluiETWuSbT3EJwhD6
	EQYkZK7hP0YtjgZT8qX/v/dAdULSUV7D1ZSO7SeMnRTQ8nn0OKH6NjJlDbAND334/QXcb8C9Jpu
	Z71ekfvz9s=
X-Received: by 2002:a05:6000:5ca:b0:485:ac96:7272 with SMTP id ffacd0b85a97d-48702b134b9mr4816220f8f.19.1789384151557;
        Mon, 14 Sep 2026 04:09:11 -0700 (PDT)
Received: from foxbook (bfh234.neoplus.adsl.tpnet.pl. [83.28.45.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm27568903f8f.7.2026.09.14.04.09.10
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 14 Sep 2026 04:09:11 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:09:07 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Kuangyi Chiang <ki.chiang65@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xhci: Fix HIK camera control timeout on Etron hosts
Message-ID: <20260914130907.749cd8e7.michal.pecio@gmail.com>
In-Reply-To: <20260914013033.3938-1-ki.chiang65@gmail.com>
References: <20260914013033.3938-1-ki.chiang65@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 09:30:33 +0800, Kuangyi Chiang wrote:
> Control transfers to the HIK 1080P Camera (2bdf:0280) can time out when
> the device is connected through an Etron xHCI host:
> 
> [   48.363671] uvcvideo: Found UVC 1.00 device HIK 1080P Camera (2bdf:0280)
> [   53.465662] uvcvideo: Failed to set UVC probe control : -110 (exp. 26).
> [   58.585653] uvcvideo: Failed to query (129) UVC probe control : -110 (exp. 26).
> [   58.592967] uvcvideo: Failed to initialize the device (-5).
> 
> Testing shows that at least 125 us between control transfers is required
> to avoid the timeout. Limit the workaround to the affected Etron host and
> USB device combination to avoid changing control-transfer timing for other
> devices.

Any idea why it happens or why the delay helps?
How many other HCs did you test this camera with?
Does it help to reconnect and try again?

FWIW, I tried a few USB 2.0 cameras with my Etron and they mostly work,
except one. It passes probe just fine, but fails on streaming attempt.
Adding 125us delay doesn't help, but 1000 works sometimes and 4000 even
more often.

Probably a HW bug. Honestly, I never use Etron for anything serious.

> Perform the delay before taking xhci->lock so the existing state
> validation and TD queueing remain in the same critical section. Use
> udelay() because urb_enqueue() may be called from atomic context and
> cannot use a sleeping delay.

Actually, you would need to do that under lock if you want to ensure
that multiple callers can't submit URBs closely together. But that's
dodgy and we don't even know what exactly triggers it or whether this
solution really is the best one.

Regards,
Michal
