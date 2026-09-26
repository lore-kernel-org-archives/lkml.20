Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B97371867
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790450673; cv=pass; b=W+sA5GXSK/XY1k/wQBuyDXO/NpTAsYv9W6GxkM93Hmu2coI+ZBzvHrHtjnL8/FL41sfakrN5aqn7+Dy0QJLGUXwgFTvNkrcoxDVNqVK5wzVoPMM7qSB848GXykNzLowmQem38rMHHYxjASUxHJjgyfnWJJDZkirBA3Uaf7r0bsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790450673; c=relaxed/simple;
	bh=7frupD0wg9SZIXkGZANNB+CXtKsKzSBxbx3NeU9iCYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nn0kQeZZH4l3VkVUibZCJ+9SQKIpDU9phPsrWsV7g2h568nfhET9FX3eGIcnjAxvzWCHP/ILtRcP9teA6xvNwcF1GD38+IJIB4oLLh2LvBPkTCoTp2ph534kuxB7pzeXIWzrZUHSJNWyEOfqpmGE1Eus/s1NxCQekr2imHTL1X8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCWhaeQJ; arc=pass smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCWhaeQJ"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144f47a9b57so1609192c88.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790450671; cv=none;
        d=google.com; s=arc-20260327;
        b=gf6amcSgAcwWAQCPmekT0yNMHPG1TvUmeiLhp/h1WAN2mer54JH1XzgUtHmSWwgMw6
         3utRAzebcDbtXQKXiyLagTns8EQ+exRIA3CJLSGITc1cy6zkRYfBUGKXa4v6ks4lvd9W
         vHK5H40KPeZEdz/Xn6PCi3GF+xfZx6TN0tLlMweXFYraBf4jN8w4ZXPx2BtzCDV2EwTL
         hIJC6X6/hn2c3F2vhoa8C4xQMFJmJN4kri4Boph/h7Cxs7hpB/xHdU8nc502AAl2t/u3
         xb8SCWbB9AqT8HzYihFCDataqb6MbNrInsDgp5Wc1lcAqoN+N/BsL0VWhjsj/tQHTeBe
         HSLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7frupD0wg9SZIXkGZANNB+CXtKsKzSBxbx3NeU9iCYI=;
        fh=8VJcnGVMJlGgJnW9832nCLf51v6xzZYFGF8ceAX47Z4=;
        b=gRBBIIyO8awKAkHMcbw8sey9jY8KfNzeoiS16LOHjU08L3amKDzfJEOcafFCXySte1
         D8FbLCh63LDntko7w1aTgc+RSS0xQURsPjKCaFaetwwHG9CfrxQOBk2I3MySzT9Er9yX
         Vum379zh6HTaBbdE++Yx9nsBvSGjm0ZdI8fNUaS7ix1XSLgr1B8C3rlVEBvPhYdz2IAX
         2aPWtfCwxgFMCpnxUl5bToP1tzE/MvVYkeBR0Mw+2cf0jyVp6yqUugq5nr8uWNd4stnb
         z0GVaqFQoGbadilytje9ti2PTK6hLptH1nk9DF2+cfiNoseIru/hHsz+s5GJbe0kM2S5
         bynw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790450671; x=1791055471; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7frupD0wg9SZIXkGZANNB+CXtKsKzSBxbx3NeU9iCYI=;
        b=DCWhaeQJmz3zWy7VmsMAAwOmfETwCc8H+gDAlqhJW+OWG5rGMNmegAOtt1RhnfVd5C
         zoFFZ4+fqcXOXRyiCEbRVZXwl/oXSM9sG1zdMqusO62kTxh8tukfN8HX3SXHchz4VlcR
         MuXvW3b78Dpq881gL9EOSxwEjYj969DtaI9NhgSheiuIs/J7V5LnoyavWsu2ZUtbR2HZ
         dCHhGFEaVDLKJkjTs/zi4tst6kSPhZXSgQesXuPJNtdSzWXrWhIudzuSwFuQqlOD4yEW
         EkcrKr2cQS4cZr9qDNN0nYA7sbxU9RkfTMokpaVE348ZGUQnjsJQOVftBwceq0kbOBbT
         UXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790450671; x=1791055471;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7frupD0wg9SZIXkGZANNB+CXtKsKzSBxbx3NeU9iCYI=;
        b=EtTUyV8RC6/XOTeQjVGP6px+Yiv9kuk2DtQADC5n7wugTlwGUlH1x7raNLihGHrckJ
         itreDkothxvJw8D+vdM0s/VABs1ZoaOzvZbfUvJT3w/fJVTZc3S8ZaRkH9KxzplWw6Lw
         XpVu1XSq7CFKmCSUWbspWr1yK7+37/AXIwtKZSbszxfzsUUsHg/aWGsCcltCb43ciXvK
         zHvLQH56k2jYZztp+ahuU1eNxlEF2aB5m2R6Q82uqAlLMByjz4WvYdxG0HBKnC3VnOHt
         pb+iiB3imXJXmxdkfQY5egVPK+xyHn0Y9Bct+mGZTtKrx9FjF3s4RACDZ9HpBGf1Xoub
         oE8g==
X-Forwarded-Encrypted: i=1; AKwUvBxlA8OxGupeckICRSl1hZdRdwfYAcN4DAIHN2nEKdhFOMieD7o4An6G8XLO0l9IRaV79ZQy9i5SwpM8oOw=@vger.kernel.org
X-Gm-Message-State: AFuF++l1cOeackgnwKZLskgS63gAgYlr2wUCKFrNuYsG0YHT7/QSduKs
	ukUzyKwa4Vr5h1pgWHlapXM6tNnA9qUeyW641uzr6+pKEGVHwbwtUZb45ADM23RpDvydZDmOIIz
	yuwM1Vi3OP8SeXkGB422K1Uk5ZWU4DOY=
X-Gm-Gg: AYBFou0N736QiSSAJwVBsH0zqTWOPI+0mB+NiNYNC3jS3kyKzKJchREO8N6txPcOKQl
	ZWyYuRVQj9l9eN7xVzcjC05PhhduFupjyTJ2HtQDVXTBErVYwJZoTDRMZrGO5vvtmNDSg6RKUkD
	eKWc6NP675Lg97xmCtABZKnqY8414GYFxZJ1HIwc4xNmElUMCmha/had8ZTmLC1iPLZZF3RFhdP
	pD4qwevrzVzvFWqKNS725eQg3d/veoVC++HCtb4EKaVOOQNiDRdO+R2gL18r6Kq+sGuFh8HlLMY
	O64/WtH88bZ/wsz+19tKqQ5OPb6skui0Th6m2ljL0gfXQW/hOaAylp2eV4h0vpL6dFzFK3RkUge
	vJzHgA+PWl0I=
X-Received: by 2002:a05:701b:2908:b0:144:f86c:e330 with SMTP id
 a92af1059eb24-146cdeb8e14mr3241689c88.3.1790450670969; Sat, 26 Sep 2026
 12:24:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926120846.35716-1-rounakdas2025@gmail.com> <20260926185955.GAargWKzpAwXXC4CQW@fat_crate.local>
In-Reply-To: <20260926185955.GAargWKzpAwXXC4CQW@fat_crate.local>
From: Rounak Das <rounakdas2025@gmail.com>
Date: Sun, 27 Sep 2026 00:54:17 +0530
X-Gm-Features: AclHuK_HTO0In_htLjTxJbuSrtbwkk5pOzlK1Alk6WxrLLl9JXXZ0TUg4b4TAmQ
Message-ID: <CAPYTKoNgPmfNQ9jSeexPWNt2pcwKucf87hhkJ8HgZ59gxfG9Cw@mail.gmail.com>
Subject: Re: [PATCH v3] EDAC/altera: Fix device node reference leaks in the
 SDMMC ECC setup
To: Borislav Petkov <bp@alien8.de>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dinh,

If you have not started on it yet, I would like to take up reworking the
error handling in altr_portb_setup() into proper goto labels.

Thanks,
Rounak
