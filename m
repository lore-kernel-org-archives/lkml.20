Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793591298;
	b=QcqSv91lmRFcAGkzArlhrCBF/2imY/5UGorB4EAOr5pTc4G787Ocla2dQf7Jsk/k0oWA
	 p0JBTYdMKFJgMm4DMxjJZjYgJQoWpWBD8qXdrcrETq0PD3ZiQNQVBlYwfuFPGflgFXWO0
	 9+SKntekIEnUhPGzi8nOPLCAE4uBShFmYzkLwo2DhNNB/3pRO/5Ir2DSIuePuvrZ/VTSg
	 xgkCBrB9U10S7zHX1s3m6O3TwpAeBGNslqqt1t/FOl5ZtUyN186FytkgVTpE9BFEMZzTB
	 6oPYJb2DofqkMZvq1rfDxNtpMkCujncATTbJSTMYWWu238hFnsxXKNUlUug2pqxhA8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793591298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=B3x9s/6EVM4gCHk/aCUx2i0TPJIArf9E/dcZEMYK5gY=;
	b=f8McbKJxYyT4QMGu92pRssK+qI1ZN191EQbhgAoE1CGxA2TPyf+xDkUnKFubu/iC3bnU
	 44niTLkwaUFtiS0rfnZy6dLIwjG7SLfcfocvLX8U5QQnL5NHS0T/MJEgJb/0KdFM+LOov
	 pUMBivtCyhfpKB5rUYFb/7nXwIdVkGZ0to/6N2uMAlnsR0nlCAHdBizytWDYKVxQH2JNB
	 IenjvfGlc6/TCMv/t5nkGDZpFVPswGx1K0NpXRRjW3UPfuGpXA5ITL14PPw+f+i72vbyN
	 O0hW2Lxna3qKPS9HsaBOd/9VWGyQiIyJbPwwN1/zWWgRBvMFlETx4sVWm3sK1LZqXiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XbxRaqhj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912C5606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 912C5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XbxRaqhj
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-483c607ccb4so1513805fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:48:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793591296; cv=none;
        d=google.com; s=arc-20260327;
        b=B9IJYvVdIjqX+u8nR/4y+oVW4h2WOxUk/+FGaDGgI032G49Y/ed5gLMEdovnOupVJT
         HPF6V9bV3h4W1+CrctzPSYUPmfOFuQsCTwSnjMke0y7LKwxFm1AtLQ3qayDmJXXXVdei
         rhHnQYm6/Q0dDWgw2q+Ad34uAhp+i6cMn96FPZuhflQVabrI5XX1rVbTFjLwl0umBKQb
         zKijBga7RzlVqm83ZoTzc1CHh6LNXKqrK7UaXjVhUTMuXVuGehLNL3yBP1A8iCQz6TV3
         VKBFV+qK0PqscKeYdEwLD+uoSxFPglVfJBNXHc65/QbWHDUsfBESaVTmzyGO7VuCUdla
         yS8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B3x9s/6EVM4gCHk/aCUx2i0TPJIArf9E/dcZEMYK5gY=;
        fh=aYTXngXZ1x8l/NcPseUE615eGjjrr8FvuIWDPer6O4g=;
        b=lhv3uYkznD4gSSKqAhF7880eFUa/yzw/kOAPbulm/x2vPc8nBTi8eKA3vZEfs/YrRL
         ZHPXvKoOlY+UQdpkk9kVMZzbgqgUGKtuetwOEdMrlrKMqMEeEl8mLr14a8BrhgReWwf7
         5z4DZoZwMRM9bE16yaY7+eNYh0+uU6g6jJRDY9feFArqRiLlfszStAWSIKkNOa3oYZhU
         vi6CqyvVAOQOxyuKUoWCFstsZZVw/h/RCnPaByEnujwvHKvBVnf5CfjG+l+aFAhMu+Ne
         w5IVaLeUHPe+B1Ke/E5QKLvfAGBKvLFJffw9uVtKeSCug94DmrQAAXE5ee57pX7IdqfK
         U5zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793591296; x=1794196096; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3x9s/6EVM4gCHk/aCUx2i0TPJIArf9E/dcZEMYK5gY=;
        b=XbxRaqhjyZPHnOLuz5IQAsGQ+QJEaAtAtE2tosO0JsxtYHFMXdSbskTPTa2qs5KvVE
         A3oMTr7NhR+XCiF7dmDRysULfqadzeSJHsf+zX/2uXZzukkXQdIh6wVRqyZBm4HtoZTs
         CJKfKnSieqd3f9DXjs6c82ojjhoAAjktIG3HF85VMUp52J9yE55YPDiUD8hjjm4/RR2R
         CP4BjMCD91nc5IHstkI9q5cgjqpfkOIi29Iy/ULND20RydHgtxfXcOtWs6xmRYo0/bR4
         oCwKjFP8uBZDTN9NwneamumR4kIdzkYtXlAVYB0Cv2jL55PI+mxy53MCP9sgl7laYGB8
         7Fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793591296; x=1794196096;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B3x9s/6EVM4gCHk/aCUx2i0TPJIArf9E/dcZEMYK5gY=;
        b=H3oVYUAESLAfNtlIqL2mDbf274R/U3sHSrKJn4gQRQSMsGsi2JBTA9niZyUUMnc8SB
         xdMfv7HGlzXE0ASDQonZ2/Mj8I0totenu/F2vuxZ5/JM0DT5xZE2HUmdCuFl7kjYX6Sr
         UN87gDepAR79A9WstJ4yLCJ4MfIxqyCd2IOzpkelxQ10sSXZxgMc/HjGND6CN0OicMIV
         xLBs4oduUeaI9bbV5CKrlH72eYGf747/653AFSKbi8oYfOVaimu/i42x9TLeeMyXlZDk
         kLFg0rYlI41TFBTCKE0TDdOmRg7cCyE94AkJQ1iagreGiCpN0KDldpaLJDXSi93/J0Uy
         549Q==
X-Forwarded-Encrypted: i=1; AKwUvBwgCigcKPNIf0pd0GNnbcFBNdDVX9PrXnb2RM/c8kdkCiPsTJ0BdJXxou61RAlmJAdT9v6qlZf4AL43mO4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0o8gbLjPLXjEfSrDV/+nldoPerDAEwkco9krbWJuQGpDcrI4+
	erQsGCYc8mo3T93VMGp87YVppkHIbRWETxkdjW0coVyIefbj3azcnaJZz5USyxu5c1XUZqqJxM4
	YXmd7lAAeuL4djOHyxuZvKJ95N0SAK10=
X-Gm-Gg: AYBFou3V3PXa8he1LGD7oN047b+WuYKML9fVDj7OTmck/1uZEWSCLv5MLh+irVMUJSu
	bqdEza+yeWO3oVU7rmi5kaFOI82uKMg5EbECRkkZDxGtanb8F6ejTaTsTGAHTfjkqrhI74DZap1
	XVhcwxlRpUmt3ginuIKo0kEwVv4rPAc/AGGycRSmRmxdEsqZin8g+2rla5so+RRa4LYwV5KL4HP
	1LNa8LFt+9au0wR7ZqS7cTBpnmVQqHlpBEPjN7OCWv4Y1FJMZ3f76Kj1FpR4BCl0knWn4wWmq7g
	dcPaLlWtRkk20K4uRK9I9Y/peHn6IkbYC9oSA8BOpptA5vz5vXqTYVCTf0ShwUdlRYlp/y3Sloz
	+rYoifM0EGVp+JpumwrLfy7BunhYR4ZF26VBAAs0nveen9qJ29qnLM0lnGO/TbheVqkueEz4=
X-Received: by 2002:a05:6870:bacd:b0:4a8:5c86:20bd with SMTP id
 586e51a60fabf-4a90764ca98mr5961924fac.14.1793591296222; Sun, 01 Nov 2026
 19:48:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102033244.9330-1-hjf3108@gmail.com> <7065bd99615f46c59171e0fe1672f3a1@realtek.com>
In-Reply-To: <7065bd99615f46c59171e0fe1672f3a1@realtek.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Mon, 2 Nov 2026 11:47:39 +0800
X-Gm-Features: AclHuK_ILmnjasIrqA0E37vh7pe4UmdcP9K-PuCscZr5IG3089kvsOO8-3MExPw
Message-ID: <CABOQOSWhp2E1ZiiO8OVzbetH0267m5qA2aoTeOwYaP8s6C+ANQ@mail.gmail.com>
Subject: Re: [PATCH rtw-next v4] wifi: rtw88: usb: don't report the
 aggregation buffer as a frame
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Luka Gejak <luka.gejak@linux.dev>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Hans Ulli Kroll <linux@ulli-kroll.de>, 
	Kalle Valo <kvalo@kernel.org>, neo_jou <neo_jou@realtek.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 11:36, Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Ho Jie Feng <hjf3108@gmail.com> wrote:
> > When rtw_usb_tx_agg_skb() has more than one frame queued, it copies them
> > into a new buffer. That buffer was also handed to mac80211, as one
> > additional TX completion.
> >
> > Report TX status only for the original frames, and free the aggregate
> > buffer without passing it to mac80211.
> >
> > In the case the ieee80211_purge_tx_queue is called, the frame is
> > passed to ieee80211_report_used_skb. Since it fulfills none of the
> > conditions within the function, the frame is freed as normal without
> > a TX status in that case too
>
> Miss a period. I'll add it while getting merged.
Thanks, will be more careful about this.

> >
> > Fixes: a82dfd33d123 ("wifi: rtw88: Add common USB chip support")
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> > Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>
>
>
