Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B2521ABBB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885432; cv=none; b=h1+RJnBJjOkLg+/r8hgzkudV5gheqIRX08cuzdJKQfEjBp5U7847N+xFZ/cudAR6GR80j6RX1VDCTFTpaEBQK1MIxFR6YJ61VwAI9daEo3n9rCa+YI13XKTW9Tkg97JUUwc5NWGeNNYPKhPyd2rQ2AZnwhs2L0wcJ7ofLVWnJ/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885432; c=relaxed/simple;
	bh=IUBu7wYhG92bCszbpUIow36ogJPjX28c1u6Ji400pEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYe4tXxF/rOLyBRhb1HECFRcwcqSPaG1hP/o5FWJwI0tQt7vp9TgTwO1m9yyKqTCC4UM1GDBCrktVLma8iqfD0g28XWzP0ijr4++1Gy4BK1njeST41t5sJ2ctv2BAKimapcrSFbf0+eTlBQFffmbc/D4ShqaCCJrIk7Buqofm1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aZHkfNEF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=easdXY9V; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aZHkfNEF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="easdXY9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791885430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lqSjm367VUjfmKlJjO867N9e+hOQdSiN0ZNGwVg2kIo=;
	b=aZHkfNEFP8BHS+De1dIOUjX092BRrLNFX7FBS+dSuQd6e/bGKAOocChLAmuRx/Xqc/wPtV
	FDLywvAw1esjhWDkEhUpICIQfbFORBxwbEiv7nw1waKQ0MP+F4Kd/KqKQl2ZaSBDm/z9r9
	kGrlUO0AnBu4h2WA47jE+PtI315yh+I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-0HLLlaWfPES8JfvD59Txzw-1; Tue, 13 Oct 2026 09:57:09 +0000
X-MC-Unique: 0HLLlaWfPES8JfvD59Txzw-1
X-Mimecast-MFC-AGG-ID: 0HLLlaWfPES8JfvD59Txzw_1791885428
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48c511d9e97so1558452f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791885428; x=1792490228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lqSjm367VUjfmKlJjO867N9e+hOQdSiN0ZNGwVg2kIo=;
        b=easdXY9Vt3q0NptP/4L0L4rl5tyjZreuaSGbUE5FuquEuQtMgQVm32pu0DDyvZXrNI
         FPPJ5QHTpdTkolNhf+fPexd9LTY2pHpwPoOt+mW20HnwdcvB7YTcjT5JIOb2jVPsr6PV
         baVzM6fe/gE+wkt4SZILnkKhouxAZXdcDFxbWKQ7pPRxQM1PPhlcvcZuEo50k9MyiSqo
         iffImXuydVmK5ojRakkQrCNFgbjRWwEE3JSXg/2IGkPmVJ0v74ZaiQvIQY0dGEIKC+aQ
         qaSs8v2Cj1p8Mw7IFYhoOBGyAbGLQ7zm/RXTWOIyeCYbhvNiOP7NLi2A5vZGlgL8HGa0
         KCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885428; x=1792490228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqSjm367VUjfmKlJjO867N9e+hOQdSiN0ZNGwVg2kIo=;
        b=2DQx2udhuccWmzV+XT4BWlCEuCCHjDQovttCLY6c0QEt547fzPJ630M974qy3Bd9V9
         UzgJmwFR6PkTFZLwz10A++8Uwxx0FOxX7QUBipkIkiahOhSySJlDvOuD4oCFI/9uY829
         RXKGmUwsfQfXXxqfCj+S0WIMzV/74PNX+bz1/TUtv7h/AKC1hc97ToxIysaY9yC1FS1T
         4IKwg8ts/D3orVo9VSzMtPOWRQiOqjvbITmjnZbj+U0Ou5s2aYXJ5CQD/8gB3Td4Ky2A
         cJ8RAtev1F8uxt44S6k20HSRVGkvwylJ9W3LyS8bUqu8kF2VOYWexqTYayrwagg2dmuD
         59XA==
X-Forwarded-Encrypted: i=1; AKwUvBzRTSjo/q2H4+Uu7u0GvOE15mFbZrKTBV391h0LqGD6kLwdXlY6ERuX4eyxmzz8Iwb3yBCuwrCWu8HF2ew=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHsy5C1u0dXQLbmJYJjrPx0zYkyqmaQ/J7KhJvOoQj7b97Jnp/
	3AiegzFstl+175y/xB7OANIUHbWsODgrXQwMs1uQfjGOoKg4o/w79YjbYyIa+Of7BcDobrjzmai
	hzMDkjHdmDHkZNTYUKv0+jiOKrbpinIsm8764AQDgL1IPIqgMEoOMGtSSwOWNgUEeOQ==
X-Gm-Gg: AYBFou3u+DFN6OZFkLoYI4kUL+zDNJygwClEKcDPdACxQV3clEUk/UKf6s00F7I/qPr
	pDX65iR4P3YnrqOGD1qs7eFsYVMEHAjpyBIH6r29i0UqBL+mqyUpIVOgDzdk+9hB8wUWq1YxA1o
	oiIXmpbqkYFZw5d8zHOTTw49oivatcQRpLx4GR1J/EMWVN2kT/9heeteHSP3HqHI7Un9KFY1lK2
	+drZK6Nm9wfQTXE6NTbaTNhPWAQW+VIZ9CwOKcpMLXCJntupRnFvvYxsNRy8AqHF+IpHF0gjHZ+
	6bIZ7rK61I0GW5IrhiMd+39kCOd3oT/GzvmV7j/cCilNp8enhKaKDjfPzMMYbqRBNZx3GC7xMD3
	vvw1HR7yNyyAJGl3vkRAloNQZrEz+19Xbttel+Nb7kdn7tpmvowdBnr6B6lcpVK+n77XAi0w2CQ
	==
X-Received: by 2002:a05:6000:46d3:b0:487:40d:af3a with SMTP id ffacd0b85a97d-48dba781a73mr13828295f8f.2.1791885428170;
        Tue, 13 Oct 2026 02:57:08 -0700 (PDT)
X-Received: by 2002:a05:6000:46d3:b0:487:40d:af3a with SMTP id ffacd0b85a97d-48dba781a73mr13828256f8f.2.1791885427776;
        Tue, 13 Oct 2026 02:57:07 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc50e0sm5431099f8f.49.2026.10.13.02.57.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:57:07 -0700 (PDT)
Message-ID: <23649f43-f015-4754-be50-94e2bfe40c4d@redhat.com>
Date: Tue, 13 Oct 2026 11:57:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] bnge: skip dev_addr when building the VNIC unicast
 list
To: Vikas Gupta <vikas.gupta@broadcom.com>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, andrew+netdev@lunn.ch, horms@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com,
 vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com,
 dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
References: <20261006141928.1432927-1-vikas.gupta@broadcom.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261006141928.1432927-1-vikas.gupta@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/26 16:19, Vikas Gupta wrote:
> The default VNIC programs the device's MAC as L2 filter 0 in
> bnge_init_chip() via bnge_hwrm_set_vnic_filter(bn, 0, 0, dev_addr).
> bnge_cfg_rx_mode() then walks dev->uc and programs each unicast
> address as a further L2 filter, without excluding dev_addr.
> 
> Skip dev_addr when building uc_list, since it is already installed as
> filter 0. As dev_addr now takes neither a uc_list slot nor an
> l2_filters[] slot, count only the non-dev_addr entries for the
> uc_list overflow check too, otherwise an input such as
> {dev_addr, A, B, C} would needlessly fall back to promiscuous mode
> even though A, B and C fit in exact-match filters.
> bnge_uc_list_updated() applies the same skip and count so the
> change detection stays consistent and does not loop.
> 
> This issue was caught by Sashiko (nipa).
> 
> Tested on Thor Ultra device.
> 
> Fixes: 9afad4a17174 ("bng_en: Configure default VNIC")
> Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
> Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
FTR, redirecting this to net-next, due to Linus guidance for smaller
RCs and the above giving AFAICS some perf improvement in corner-cases
over the original code dating back to its introduction.

/P

