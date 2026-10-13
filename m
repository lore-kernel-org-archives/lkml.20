Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBA15326A8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914384; cv=none; b=FidU5iCor5grOshZyGdow1AUPHSNiarg3CCs3P9FzWtT6kyzzgfJEU2s1isxaK1+AGDHedGGwQupLTyl+oiFEhFwenAaDlwOlm/FIr9aD8JUmr6ChKoG7riXL3JlfDVEjZ68izs510v1CVkGh7c4LGXs9eMCQaP/9eHRlifACuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914384; c=relaxed/simple;
	bh=tJra5WXUJUAErMt026HVIKG9BLHea906af/cVQLm8tw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a1GlJ4ior2wiN7Rzz5AbmQhR7lsapbdceiIxoDChO/0B7+sVykzct0ttubU2yVstTiKED8QfxVhHYSetJrco9h8fvZv1t32tj+tfF1eGbVyop/Op7/bKmrtl4qktZcaLljR3/QBdA5V2JPnJW8XUOJCcx/3ARU6nCDiqZNMCqzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=i+nr1hx1; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="i+nr1hx1"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-9179bfa9e9cso56666846d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791914382; x=1792519182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I7PYK2NFBnnrBKq5En7ZMWWtpUU9RPTiFiLhdaDzGE0=;
        b=i+nr1hx1jUqGqLAJHMSKKDOI2nVJS2NqWUt624pJ/sUN0URhOZFLoWVA2iI1oMKVl3
         /mGQ3tRjJiMD3qaK2ftzqtjASF9hLj3xbGL2hMst2I9H5d+OVZFnzN+uz5CH7IK3NUjy
         c+PEnt2Zd8tWl13kqRoqXXK6ho4mL0ZrErLJGYhUYAEugShty2NpAl1UoZxnLm7SZP6o
         7mB32ty3hsaA6bdaGKoOCeP0GQHvefHZ45noD2b3RHB2JtORgCoOip7t9lCV6zai3cBT
         5vP1nB3vDfPNdTeHnZE/fagvvX5zVzu0MEM19ftCo/CdrABiqUdvwAJrWJBPDCTCGV7z
         EJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914382; x=1792519182;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I7PYK2NFBnnrBKq5En7ZMWWtpUU9RPTiFiLhdaDzGE0=;
        b=f9Mt9H4Gl+uTpQ7iHCBka3zjoYE8OuzWiVU3PkcPIU+CK8FSJ1QJGzRjkqLDmzN/nn
         klyPGSIY/sWBMKTvptatUjJ2KTs/U1wCWziVxE4BjWjxOXMJPDQiiKYBDoG/JJM5LL0p
         l1//Z2OydYSo/0V1XR5FhDLYBgNrfGZ3y59/a2eu+lelENS7F66kosT2zYGKDtd8r9VZ
         8TmX7bjMzraqjR4sw+vb1z8OoqqylNrAjEDzU9geysbegt+2xgjbhLn+bHuMz6Me3f1S
         hpJt3Hr1tWDFzr83r8NPDgDyKYRsNyTGSxYlHZuMI/GPYxHMI4Dxbt2vdKzx7L93AO/V
         Whpw==
X-Forwarded-Encrypted: i=1; AKwUvBwSxEr3lPRDqvf8cMkax9zK/46SSBeZi+X6hTvMJjTCrpaMYdOz7q9LffGvFcukPgojlMhRzc2xOGI8r48=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGLFqsIJdgkw6Pz/agzgFI3gPvs9elIxHYdZ3igUFOM3VQX766
	va0b93DxUyOugJR09+wnXBvuAyJavxH01TLeMjvmqXwJA87sa9uvM3ITpXIMjUIrgUE=
X-Gm-Gg: AYBFou2PakMkbQ7nK3oR2P5S4GATb6nzC1jxWoYaB9e95q9a7ECu2Orf1Ols1SxdnEb
	Jjubz+SBl3tiOnrUPrbjta3ea/hHnExVqB5DrHD52FSA2uTrFxNFXeGGk5aWfls8BPby7GGnYKk
	iaBwpiNofJAFqIpNEN0npwyV9+1nl142k7TIRhYEybMLB9YfUq0pd6Arzm7g6qGnyAxq8chfarn
	+r2u37luLj0ByWCX8ya3QwKwIr/zgjDaM1pBFrlv3UgQehTQUKKQdZnDeLoHEUTu/RQhisBGEa+
	Fd7HgACiFWBWeu9FI4WnGWewEx/195v16+urqge38KpwFhgy2y70Z3GX7K/yqWjPLA/X0EPxHFl
	68VFvQfH6YPJ2DHOXRt3F1zo/FJjXnM2hQ3UcNat9XH8qzg/8d5p+oXKe1twKXEgrxwgCh7RYt1
	ELYVBtsqSio76TKREK78edp6k1QxgKj88oBugEOWuGrbBDgoMDnjX6bmDRfo5Sa6mB8gVw8QLWt
	35+vcTJBna6SjE=
X-Received: by 2002:a05:620a:6405:b0:93d:e031:5ad with SMTP id af79cd13be357-93ebd224911mr2124184885a.17.1791914380656;
        Tue, 13 Oct 2026 10:59:40 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.248])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5086fe3sm292732185a.37.2026.10.13.10.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:59:39 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
To: netdev-bot+sashiko@kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Mina Almasry <almasrymina@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH net] net: skbuff: don't segment unreadable skbs without
 SG
Date: Tue, 13 Oct 2026 17:58:45 +0000
Message-ID: <179191432558777.2.414389277062940952@toxicpanda.com>
In-Reply-To: <179163919450.434549.9325877615055483977@kernel.org>
References: <20261009-b4-skb-segment-nosg-unreadable-v1-1-7e2334a55fe8@toxicpanda.com>
 <179163919450.434549.9325877615055483977@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Sat, Oct 10, 2026 at 01:33:14PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Does this guard also need to cover the sg && !csum case?
>
> The commit message says:
>
>   "and with only checksum offload off the segments keep sharing
>   the frags."

The segments do keep sharing the frags in that case, so this bug, the
payload being replaced with zeroes, doesn't happen there.  The commit
message shouldn't have implied the case is fine though.

> The devmem MSG_ZEROCOPY path in tcp_sendmsg_locked() goes through
> skb_zerocopy_iter_stream() and never sets SKBFL_SHARED_FRAG. As far as I
> can tell, only the MSG_SPLICE_PAGES branch sets it. That means the
> __skb_linearize() fallback is skipped and skb_checksum() is called on an
> nskb whose payload is entirely in unreadable frags.

With SG on and checksum offload off, skb_segment() calls
skb_checksum() on each segment, and skb_checksum() can't report
failure, so on unreadable frags it WARNs and returns 0 and the segment
goes out with a checksum that doesn't cover the payload.  That's been
there since 65249feb6b3d ("net: add support for skbs with unreadable
frags").

> Would checking !sg || !csum here be more appropriate?

v2 drops this check.  Mina asked for skb_copy_and_csum_bits() to
report the error itself instead, so v2 changes it to return -EFAULT on
unreadable frags and every caller handles that, skb_segment() included.
The commit message there only describes the case with both SG and
checksum offload off.  The sg && !csum case needs skb_checksum() to
report failure the same way, and I'll do that as a separate fix.

pw-bot: cr

Thanks,
Josef
