Received: from mail-qv1-f98.google.com (mail-qv1-f98.google.com [209.85.219.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28DA3A1CEA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789411368; cv=none; b=rmZPL4Pu5V9QV4UimH4zmHyarhGBeE7X6vz4wg99lC8dQvp8eZi6A4XIp4sEui0jYMdZ8ebAmk0EZEzg+zlWQm8VSbabz688mjyXxCcFT69F2PVm1fDz5zazRFM9L86L8XsGrhAJE1Zq9p3+UtviHMh9wSss1C2S1GP8IrTvk1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789411368; c=relaxed/simple;
	bh=dVM7a9s1TxS2aIq6AXPkZaCie1+K/qRV6xxe5PnGBH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fRgVbW03oywmPW5sBsMQ1ygjLe2g2YolSCLxiPXTNkYAcxKYZI3AOwAPBHEKhmKDCfljbtdSbNqWjaH5lUUeg+boYazFHht/fKocCVkx6JBy99SVCGgJoMRp2DukRzN+OENCxSrvqptLdBudUlH94yWLGkZf1Dh+XXJLLeswVuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=P/DiOBZ8; arc=none smtp.client-ip=209.85.219.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="P/DiOBZ8"
Received: by mail-qv1-f98.google.com with SMTP id 6a1803df08f44-90ceab90152so34563396d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789411365; x=1790016165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBKsdBmjCJJD8VrVX2tmAkv65OynoDpaqNBhjTL5Aq4=;
        b=FyU9RZYGUudUSOhBtTMNxMmV0qRXu+8jSRpdzRK/Ro6gM1dzwa+MrfrYS2Y0zZ8avX
         0LEH1MNBqbyDqAmgL7oAYCve8m+bxeFY6RiLTHtrvKkjWvtIQxfexPAxvZWWndXobo+y
         pS0YkanI9Jr77D/Zguuj9gcswZv3vx+354n8RR7aBRu0+63pJlXKmQ23pMILIwuur327
         Q2Fi0pFTNpuUIKTKQb1o6XswDIvVj3+LKWWhl895BgCneiYDJbjXIqqz/e8hxzYilxEj
         tAKGJDAJz6vtu0u97xaLARr0oVZC5pRuvoyH2OWOsCIFnuhcrQXS0MkQ+MENlUmB6sly
         1hwQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6NwFKD80pzPVt3PX1ruMyCallQf7Kv1Zyxi6dosJmQXR6DLVwVh06ANq7AX6aq10jyQimmXNv6dj7750=@vger.kernel.org
X-Gm-Message-State: AFuF++nai8FyL7NZQspbtZfNGkuHPG+vEOw7QqFChNbZpQaicygja2HP
	1csx6QBDVJeMlmkYK3u+g+Q3jtjZU1YyAcCqxHZs0E0gLLV0oug/9rcSfkSq4TA3NtFJ8Ii4WIS
	q9a4oimi6kqTixe+5FkeFALJFNeXLoOq95CW/TfpZFg0UK+HoivUOJ2njtHK61sY+HOlRiC7iRG
	ylevfIY18U8DkC7eroKLF8+bhk6p+OcDoJ5L+gwoushPOIzFH0jqN/GOj0tH9nVDxNer5zsiLnV
	UjH5iq3JjeztN70IEZPPUm0JzX4
X-Gm-Gg: AYBFou0vbiczvRbwZd6GGUAF0nJF1UDa9tlX7qf8/35Cxz5thUPPDXkfguhgeym2tF3
	DohJFSHaJWGnvgnDJx/X6c2OcajgFhZFPGO3LaUfjPk4rg6ZFe4ypCD9a5WEvy3t+HfFzuXOUht
	wa9rFypj7IvTfjuDPJYGFYBppYZvpKmrG86zWib8SQeDu+f+qRz91bbPMNyXv9D8ILSvCfo92UZ
	gTz0ErWAJ7KnTjeD9pwjyfgExJHcbexzXOfFCgRhcConu1EufAzjqrseD2VNHM2zlGo+8MlJ7MT
	ImZq3NPSzrLlBAS4aLTFbiaYOLdBMXcp9QOzqMr/g4Pbh6qEyG02C14+DrevRZsVSL6BRmNMC9+
	zYuzpOblT/yVg92eggArWB1HnR7Yyx4kupAkc4yVog3GUwOUiOvyaEAk7E+CIm1odwRrnyMp4Wl
	AejJ5NWv6DVxgMNF65TL/I/YWn0xGdzZgjdPDFMGw=
X-Received: by 2002:ad4:5cc2:0:b0:90e:880e:dc2f with SMTP id 6a1803df08f44-9122e2cc3aamr68423636d6.7.1789411364962;
        Mon, 14 Sep 2026 11:42:44 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-9120f4e2213sm1262816d6.20.2026.09.14.11.42.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 11:42:44 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so2806555a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789411363; x=1790016163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBKsdBmjCJJD8VrVX2tmAkv65OynoDpaqNBhjTL5Aq4=;
        b=P/DiOBZ8ZfL6VHuK/03FzBY0ba81W0oADNDeuKH4V9Z+Rt83PKIOAZ33A6hmIkuKfe
         cFXDNWMHP91PW692+cIaObcmQLx0dtMLSwkvG4vZ2+nr/4BIbKNxnlKmRzf5qLGH3b0r
         69ggTd2KOHrKE2DIf+jHRL2m8M6SsCFcLPrZE=
X-Forwarded-Encrypted: i=1; AKwUvByaGjVx3L2mpns8c5XBTGtqQ/m1RNJF2nOPFiu8HJDxuUmlQMiklMik7axlpAkIo9Zf/3B/WdZz073NiUQ=@vger.kernel.org
X-Received: by 2002:a17:90b:5785:b0:39d:f725:fb84 with SMTP id 98e67ed59e1d1-39df72615e4mr4353667a91.19.1789411363612;
        Mon, 14 Sep 2026 11:42:43 -0700 (PDT)
X-Received: by 2002:a17:90b:5785:b0:39d:f725:fb84 with SMTP id 98e67ed59e1d1-39df72615e4mr4353642a91.19.1789411363179;
        Mon, 14 Sep 2026 11:42:43 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1438d89556asm364156c88.13.2026.09.14.11.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:42:42 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	Hante Meuleman <meuleman@broadcom.com>,
	Franky Lin <frankyl@broadcom.com>,
	Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmfmac: fix lost 802.1x TX completion wakeup
Date: Mon, 14 Sep 2026 20:42:35 +0200
Message-ID: <20260914184235.1457622-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260811082702.44521-1-kmehltretter@gmail.com>
References: <20260811082702.44521-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 11 Aug 2026 10:27:02 +0200, Karl Mehltretter wrote:
> brcmf_txfinalize() decrements pend_8021x_cnt before a lockless
> waitqueue_active() check. atomic_dec() does not order the decrement
> against the check.
>
> [...]
>
> Fixes: 21fff75d2fb6 ("brcmfmac: use wait_event_timeout for 8021x pending count")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c | 2 ++
>  1 file changed, 2 insertions(+)

Please add Cc: stable@vger.kernel.org - the Fixes tag references a 2012
commit so this affects all supported stable branches.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
