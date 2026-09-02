Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860294A92E3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363118; cv=none; b=eVkjsyqLOrUMsYywgGBkwrVUcZ7qpetQRquheG9u07Y1qOPfATcTJ1urdrTkPL2yDo58TdTXGT9kB5opsb834IlRrUaNwIYYneyYV5bYGYn9xNeUn0rn59MV3IXsHydJkMO7tOt7VLytoxt9y0sEtvj/6Vrc4WUOYRzaA8jakj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363118; c=relaxed/simple;
	bh=acdCmYcQeaRTzscwDTS0ImZU0+AP0wgfCqlmInvQcZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E8ccRxb8/IYnI7c2t3l5u9uafqMqttaqBtVaGgyYTErxom3FVKiel3KKAXbXlMrzFFxvMmVs8q9GuxYukAa2kk7vr+5Ll7RS0MeOsMIzjeztv6wZQSchjK9ziuJ6qPNZ5Jb3oRiW2B8kBsIcmAjyUfZi262bW77VydPGGl+TtKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuYrKUP9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuYrKUP9"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so7201005e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788363113; x=1788967913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dkujZkx7lrpbA+Moc5O9wXq71UTvapuc/tmz0THaJoY=;
        b=YuYrKUP9wOrPMu5QMcl3JxpMdm83nHvkzz+PdKoywJKdHLSuMfNEmBUuSu5t8d7TVM
         NTpRW7bwg5sHeiYiMGpdaP8hNoplqO2OQEVCXMgcuOP0GB40ZZri/8RX48OM/RSKQpQX
         Xg3eWKaudKNaMg0tJuJHEpcLyNxEsE8A6Jz0b30F2JrvsedN3PGHi/GEu2hHAANeEtbW
         nISp24SNSznDFShs8v9rBB5Nv6VVnR0deXrRAC7/YU0oTZrse+SNPSKgTNUFGBkzLuda
         n3v/6sSO6Zbf4TPOSKQVE8X8BqyLsp0D7gsgWimT7csdv/0I8LNHHRg6RmqLQhf/rNiA
         kLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363113; x=1788967913;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dkujZkx7lrpbA+Moc5O9wXq71UTvapuc/tmz0THaJoY=;
        b=UF/f5V052Ju/0ML7E56XYzVb7ieuR6UsRBNK5WBuwRz8zJJDkd5yLui+E4NnhX6Em8
         KFnY5M5cwVqngl8NP73Rh4BIkMWiWzzGD2aOlytHKnKQxx7qsIiinhigx7t4AYVrzpvK
         ldONl1CvsgCiLSMcLWcJLO272USZAznqGhSKGXphFUEoUbQzrcW6PX7XEtVUenKSdLCV
         2YLoh+oucBlnJjBmi4GYxRyYtop9buiXFfZLr6ZwmWBgnCMz7+UB5cDw8z7QLete/6Xs
         9f4GKCxTYs7ApxqKLH/RbZp6jnLxleucv979/clJw1FqJu7u+ZnRF4kMBZK9BJc5oqZE
         iIJw==
X-Forwarded-Encrypted: i=1; AHgh+RqWGjqvRu+F/mpqI7c736khYbLO9jlRv1Txu1BembNCnnwHpJPGuf9Z39nBYaXVmPqyEMbD8Z2TAbP+ZNs=@vger.kernel.org
X-Gm-Message-State: AFuF++mbAk9LBySjz+1POvX6MDJ+WFkoi++wynsTsDBMDCILZz0Qt5+s
	IfbL1QAfIwaH5Xzye7VGFyJaWRogRKXS5QHMhrtTLB8P2bF+EOOV9D7Y
X-Gm-Gg: AR+sD110fAHnWKOfhYWzoYY/GiTVmQszWJ9YcqSjByEsHWYYsgjXciFbvUOgOPfE6iM
	W+wvByFaRnOthdhpmbpByU1/Y/fkwCf+gUEaa6XstgX+g8UBogAPSIF5yfz6OcrjLmgu28SwVNR
	VqdqMw94iyxxIXjFbop0L1VY1zTKxAgIUZlu676553X8m6BAbvybYhP/mbRh6t1MXRJ2TQzP15z
	4gKowDp+g/gS+uzW9T5oXv0kKEmgAaauccW5V6rw/AgtKE07QdeA1LrQwTCMd4jDztPP7z4Tat8
	j7siyKFcDQbUHSWFiyeUwdqVvKhTHqOibl/b1A3HYe/8+U6DhDxaD78kovjYK0sCJOJc9H422Se
	e344FBm98mjLvAAYtOlAChkpirg5jnk5qfLO3vBa2jQpfAgn4IeV+0iVB0b2BhWB4e2hzH6UKf+
	dcHdI2DphIW3K0NKEBNc7EToD5C64J6ZELiqFlk5910lEXum6TgrMso/D7NxKvhCPZC9KpBslbZ
	FJFAsSb6wKU9mlkippcfadq+A==
X-Received: by 2002:a05:600c:8714:b0:499:b65d:1250 with SMTP id 5b1f17b1804b1-49ce580d869mr107815595e9.2.1788363113252;
        Wed, 02 Sep 2026 08:31:53 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce44ea9sm149966945e9.14.2026.09.02.08.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:31:52 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:31:51 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "Gustavo
 A. R. Silva" <gustavoars@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] ihex: Fix 16 bit truncation in ihex_binrec_size()
Message-ID: <20260902163151.59ffe47f@pumpkin>
In-Reply-To: <20260902-ihex-v1-1-67fdbf8d97ff@gmail.com>
References: <20260902-ihex-v1-1-67fdbf8d97ff@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 02 Sep 2026 12:21:19 +0200
Vasileios Almpanis <vasilisalmpanis@gmail.com> wrote:

> ihex_binrec_size() returns uint16_t while computing be16_to_cpu(p->len) +
> sizeof(struct ihex_binrec), so record lengths of 65530 and above wrap.
> __ihex_next_binrec() uses the result as the offset to the next record. A
> length of 65530 gives an advance of zero, so ihex_validate_fw() spins on
> the same record forever. Lengths of 65531 to 65535 advance by 4 or 8
> instead of 65544, so a 14 byte image passes validation while its first
> record claims 65535 bytes of payload. emi26_load_firmware() passes it to
> emi26_writememory(), which kmemdup()s 65535 bytes out of a 14 byte buffer
> producing the following splat:
> 
>   BUG: KASAN: vmalloc-out-of-bounds in kmemdup_noprof+0x3b/0x50
>   Read of size 65535 at addr ffffc90000075006 by task kworker/11:1/174
>   Workqueue: usb_hub_wq hub_event
>   Call Trace:
>    <TASK>
>    kasan_check_range+0x10f/0x1e0
>    __asan_memcpy+0x23/0x60
>    kmemdup_noprof+0x3b/0x50
>    emi26_writememory+0x29/0xd0
>    emi26_probe+0x2d1/0xb64
> 
> Return size_t so neither the addition nor the following ALIGN() can wrap.

The ALIGN() can't wrap, the u16 value is promoted to 'int' before anything
is done with it.
What it does save is the pointless '&= 0xffff' after the add.

Since the result is added to a pointer it will need promoting to 'long'.
But the compiler can assume that adding sizeof(*p) will zero the high
bits and nothing extra is generated.
(Not that this is a super-hot path...)

> Fixes: 9fb4ab4d3dd6 ("ihex: Simplify next record offset calculation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>
> ---
>  include/linux/ihex.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/ihex.h b/include/linux/ihex.h
> index b824877e6d1b..0da1c4e3e693 100644
> --- a/include/linux/ihex.h
> +++ b/include/linux/ihex.h
> @@ -21,7 +21,7 @@ struct ihex_binrec {
>  	uint8_t data[];
>  } __attribute__((packed));
>  
> -static inline uint16_t ihex_binrec_size(const struct ihex_binrec *p)
> +static inline size_t ihex_binrec_size(const struct ihex_binrec *p)
>  {
>  	return be16_to_cpu(p->len) + sizeof(*p);

I'd always put those in the other order - matching the memory contents.
(But changing it would be churn.)

David

>  }
> 
> ---
> base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
> change-id: 20260902-ihex-62b68b7e2bae
> 
> Best regards,
> --  
> Vasileios Almpanis <vasilisalmpanis@gmail.com>
> 
> 

