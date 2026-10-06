Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91371200110
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791260357; cv=none; b=UXAiOVj+IUAG3eobGNzoamR+hn8bp5YcGJzQjv066CuSyuSnaKwa1/4h57+UgZ3kowuzr1eb07jfopFGgpZOgR+RAfxrpRaO0PLNHTztQEEeoimvFxHCQZ7i3Gv8cObC5pdLJI94Uj4SuLU4rR4Sh810/ozvgdOH6wJaGQ07Z+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791260357; c=relaxed/simple;
	bh=k3RSUY4fxdXMS3ZnKpvJScrf6J75V/fZ8Jp7axykJk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aENv8NW3++BgphdDj6But5Bby4V1XstznpF5T4sjE485ZlW07smKnZA9jT05FcVvAPVztz+2drZF6muP0G7JPFozGfwxQRi506JWM4JAmpzTfpQdA2S5FGehtdhLs749NzASa/agtbAqiVpuwbxeXtNkht6ZoYAuTGqy6324YQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbPgxINj; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbPgxINj"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so2896955e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791260354; x=1791865154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b4cq9NsXa/9Ah4XIfTqt/umKWCh8D9nJZ3hIc35Disk=;
        b=IbPgxINjCvplytLmNPCsTLTmB1c1v2BFp0asKSns/n0IdBsxtShIzICiNTsd2ulGjh
         T8NQJRAjilYMaiXgC9v6HEjmI1dAgNbq2YOnQt7kYTXpr/s3Q/QSwZG/I1HWTNxeRHty
         PUcTxY4HxKBPeDT2kzLsOXLeaW9FNQ6m/yuqYYgBk4BuNHtRdDoKAKtS0heuTEbEthd1
         0iwJtXZPU23/Xjw4Lb6xi867SfUvTExj7RAaw0e7XCHsZpj2nbY4dO4wn52LNRGS7F2f
         bbOMtAtLiD9b4cMOaL17FZq/NoX2w6DE7S+wovPWkxywPfwgXxcgaQFv6X8g7Lm14+5r
         CPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791260354; x=1791865154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b4cq9NsXa/9Ah4XIfTqt/umKWCh8D9nJZ3hIc35Disk=;
        b=UgdvCZ48RWIp02KowAF1yMMddA+ghA/ZvxozxyrG+hNXt5CldFXKyddsbh2EojZzZz
         6dVvVlwGe8XNjwlfs2vvwFa6IwiGnvgvd4GIDGkxoBYZVYLu5gNYBrppU5/flZKuf7fq
         uXRhqz0d8QJL0M3tNnLUgUzd6kApE/4tSXdELbiBdVgb0i20TiUbAFdD52uDXsoOLuxx
         zh1vOe7smpZdMOt4LLH5Flafl8Z9kens5rhf4Aw9gbKm2fbrlMD5KIHokQsW/A+4D3nq
         xlDQIRqM5EfDMoKsNaJUTtIX1n2gfue8SPUYmYF65vHho3nyAl3iSZu0KDkiH/YbyBV2
         6FgQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1y8cDFgrsMTD2KkHPm95S8rnlfUfcF4nykV3CX05J9kEdcasMscnew+uzxZ9Ad5am4gGxbtKFGyWQAgs=@vger.kernel.org
X-Gm-Message-State: AFuF++lhksR2MSJvm+9wFruqETvEjV93iNNF1EOVcp8OhRHI97XbCgO7
	PHYZF4c1WhhKhWi2KtBtSR62XvBI4YliUuu2brMao0haQEcmY7K5Di/I
X-Gm-Gg: AYBFou2+RxM0QaI30h3Njix6paHF7I3uF0D85aOAL78+ObqgGepFoYIGGIC7SNOjls6
	ieGP7MYjR7LrmOI/WorU6jqmvv5WrPjHGlp1uS0x9XEwtS2cGThbbcy2547apCgF9yNYUhldpTf
	PcEWPi+mxh/ruh9z/iHTxsm/5UcJuX83dkzLiVYTUZ+eGjuuuYBN2TmtmBfSSbi3sWX5mCSKYT1
	qcamJQUCCTEZQHzLLf3BtxLSkC9gtC/pVigcCWoSGwBYjfuBE6HK/ZcM8mgYMgVc0CA+15R/y+h
	K4inZEp3MNWpuZGWsAo/miIlK36CpYjGm5lXjv9dfW2l8ekCnuqM9yvOMP4IN9jMHQFbMkv8fAB
	sCuF3DuIUU4UpMFn53P+YmOLHy4NCrEu2Bo6vMIhoXD9DzVGABQHLehrBJZyHyP4CrVR/5kotMJ
	uUmUxe+0ylroZAj1aa5oITGL/KlsBAYDmYLldlhQaYm8kmJc2cjDWAhsAe1NKw3FRas0cABeNHU
	rpAbAadk0ELAhq7eLWD3Q9KVjFy3eny74U8o4CfC/NSmyTRkmXyILCiHtaRehLo5LUQztYvWGSK
	UohpqMcW62ft+5YeVLv+FgG1iAeSDQpe2Q==
X-Received: by 2002:a05:600c:3510:b0:4a0:1c43:3c04 with SMTP id 5b1f17b1804b1-4a17b53e298mr3201995e9.13.1791260353780;
        Mon, 05 Oct 2026 21:19:13 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-095-117-040-097.95.117.pool.telefonica.de. [95.117.40.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1776cfe45sm44826795e9.1.2026.10.05.21.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 21:19:13 -0700 (PDT)
Date: Tue, 6 Oct 2026 06:18:41 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmfmac: avoid sleeping tx locks in netpoll
 context
Message-ID: <asR1TaKQJlPFqEvR@gmail.com>
References: <20260930185417.61865-1-kmehltretter@gmail.com>
 <20261004122910.1392318-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004122910.1392318-1-arend.vanspriel@broadcom.com>

On Sun, Oct 04, 2026 at 05:29:10AM +0100, Arend van Spriel wrote:
> Is there an opportunity to reuse/refactor brcmf_sdio_prec_enq() rather than
> adding a separate brcmf_sdio_prec_enq_irqoff() helper? For example, passing
> a can_evict parameter:
> 

Thanks for the review!

Sharing the helper with a can_evict argument is cleaner.

One queue user does not hold txq_lock: brcmf_fws_bus_txq_cleanup()
dequeues through brcmu_pktq_pdeq_match(). 

Lockdep instrumentation in fcmode=1 and 2 confirmed that cleanup enters
without txq_lock.

I combined the helpers, but kept brcmu_pktq_penq() for normal calls.

Karl
